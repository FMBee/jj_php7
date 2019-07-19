<?php
/*
 SELECT pre_compteht, sum(fli_totalht) as _totalht FROM `factures_lignes_details`
 where fac_date>='2015/08/01' and fac_date<='2015/08/31'
 group by pre_compteht ORDER BY pre_compteht

 SELECT pre_comptetva, sum(fli_totalttc-fli_totalht) as _totaltva FROM `factures_lignes_details`
 where fac_date>='2015/08/01' and fac_date<='2015/08/31'
 group by pre_comptetva ORDER BY pre_comptetva

 SELECT sum(fli_totalttc) as _totalttc FROM `factures_lignes_details`
 where fac_date>='2015/08/01' and fac_date<='2015/08/31'

 SELECT reg_remise, reg_mode, sum(reg_montant) as _total FROM reglements
 where reg_remise>='2015/08/01' and reg_remise<='2015/08/31'
 group by reg_remise, reg_mode order by reg_remise
 */
	session_start();
	ob_end_clean ();

	require('x_common.inc.php');
	
	require_once(__MODELS.'m_parametres.php');
	require_once(__MODELS.'m_factures.php');
	require_once(__MODELS.'m_reglements.php');
	
	require(__ROOT .'web/fpdf/pdf_code128.php');
	
	
	define ( '_HTLG1', 6 );
	define ( '_HTLG2', 4 );
	define ( '_STLG', chr(10) );
	define ( '_EUR', '' );
	
	$dates = explode(':', trim($_GET['paramedit']));
	$debut = date_format(date_create_from_format('d-m-Y', $dates[0]), 'Y/m/d');
	$fin   = date_format(date_create_from_format('d-m-Y', $dates[1]), 'Y/m/d');
	
	$params = Parametres::getOne($pdo, '1');
	$ligneTTC = Factures::getComptaTtc($pdo, $debut, $fin);
	$ligneHT  = Factures::getComptaHt($pdo, $debut, $fin);
	$ligneTVA = Factures::getComptaTva($pdo, $debut, $fin);
	$ligneREG = Reglements::getComptaList($pdo, $debut, $fin);

	$filename = "EditionCompta.pdf";
	
	
	//******** entête
	
	$pdf = new PDF_Code128 ();
	$pdf->SetAutoPageBreak ( true, 10 );
	$pdf->AddPage();
	
	$pdf->SetFont('Arial','B',14);
	$pdf->Cell(60,_HTLG2,utf8_decode( $params['par_societe']), 0, 1);
	$pdf->ln();

	$pdf->SetFont('Arial','',10);
	$var =  $params['par_complement']._STLG.
			$params['par_rue']._STLG.
			$params['par_codepostal'].' '.$params['par_ville'].' - '.$params['par_pays']._STLG.
			$params['par_email']._STLG.
			$params['par_portable'].' - '.$params['par_telfixe']._STLG._STLG.
			'SIRET: '.$params['par_siret'].' / APE: '.$params['par_codenaf']._STLG.
			'IBAN: '.$params['par_iban']._STLG.
			'TVA Intracom: '.$params['par_TvaIntracom'];
	$pdf->MultiCell(90, _HTLG2, utf8_decode( $var ), 0, 'L' );
	
	$pdf->SetY(60);
	$pdf->SetFont('Arial','',12);
	$var =  "COMPTABILISATION DES FACTURES ET REGLEMENTS"._STLG.
			"Période du ".$dates[0].' au '.$dates[1].'         / Edité le '.date('d-m-Y');
	$pdf->MultiCell(170, _HTLG1, utf8_decode( $var ), 0, 'C' );
	
/*	
 * $ligneTTC=Array ( 
 * [0] => Array ( [_totalttc] => 17099 ) ) 
 * $ligneHT=Array ( 
 * [0] => Array ( [pre_compteht] => 706000 [_totalht] => 3725 ) 
 * [1] => Array ( [pre_compteht] => 706100 [_totalht] => 833.3299999999999 ) 
 * [2] => Array ( [pre_compteht] => 706110 [_totalht] => 1088.33 ) 
 * $ligneTVA=Array ( ) Array ( 
 * [0] => Array ( [pre_comptetva] => 445710 [_totaltva] => 1434.8600000000001 ) 
 * [1] => Array ( [pre_comptetva] => 445730 [_totaltva] => 332.72999999999985 ) 
 * [2] => Array ( [pre_comptetva] => 447530 [_totaltva] => 439.07000000000016 ) ) 
 * $ligneREG=Array ( 
 * [0] => Array ( [reg_remise] => 2015-08-10 00:00:00 [reg_mode] => CB [_total] => 240 ) 
 * [1] => Array ( [reg_remise] => 2015-08-10 00:00:00 [reg_mode] => chq [_total] => 3586 ) 
 * [2] => Array ( [reg_remise] => 2015-08-10 00:00:00 [reg_mode] => vir [_total] => 1000 ) 
 * [3] => Array ( [reg_remise] => 2015-08-12 00:00:00 [reg_mode] => chq [_total] => 380 ) 
 * [4] => Array ( [reg_remise] => 2015-08-14 00:00:00 [reg_mode] => chq [_total] => 200 ) 
 * [5] => Array ( [reg_remise] => 2015-08-15 00:00:00 [reg_mode] => chq [_total] => -200 ) 
 */

	//********* tableau synthese tva
	
	$pdf->ln(2);
	$var =  "RESUME DES COMPTES";
	$pdf->MultiCell(170, _HTLG1, utf8_decode( $var ), 0, 'L' );
	
	$contenuTableau = [];
	
	foreach ($ligneTTC as $ligne) {
	
		$data = [];
		$data[] = utf8_decode('[L]'.'411000');
		$data[] = utf8_decode('[L]'.'Factures clients');
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['_totalttc'])._EUR);
		$data[] = utf8_decode('[R]'.''._EUR);
	
		$contenuTableau = array_merge( $contenuTableau, $data);
	}
	foreach ($ligneHT as $ligne) {
	
		$data = [];
		$data[] = utf8_decode('[L]'.$ligne['pre_compteht']);
		$data[] = utf8_decode('[L]'.'Hors taxes');
		$data[] = utf8_decode('[R]'.''._EUR);
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['_totalht'])._EUR);
	
		$contenuTableau = array_merge( $contenuTableau, $data);
	}
	foreach ($ligneTVA as $ligne) {
	
		$data = [];
		$data[] = utf8_decode('[L]'.$ligne['pre_comptetva']);
		$data[] = utf8_decode('[L]'.'TVA');
		$data[] = utf8_decode('[R]'.''._EUR);
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['_totaltva'])._EUR);
	
		$contenuTableau = array_merge( $contenuTableau, $data);
	}
	
	$contenuHeader = array(
			20, 100, 35, 35, 		// total 190 +(2*10)
			'[L]'.utf8_decode('Compte'),
			'[C]'.utf8_decode('Libellé'),
			'[C]'.utf8_decode('Débit'),
			'[C]'.utf8_decode('Crédit')
	);
	$proprietesTableau = array(
			'BRD_COLOR' 	=> array(0,0,0),
			'BRD_SIZE' 		=> '0.2',
			'TB_ALIGN' 		=> 'L',
			'L_MARGIN' 		=> '',
	);
	$proprieteHeader = array(
			'T_COLOR' 		=> array(0,0,0),
			'T_SIZE' 		=> 10,
			'T_FONT' 		=> 'Arial',
			'T_ALIGN_COL0' 	=> '',
			'T_ALIGN' 		=> '',
			'V_ALIGN' 		=> 'M',
			'T_TYPE' 		=> 'B',
			'LN_SIZE' 		=> _HTLG1,
			'BG_COLOR_COL0' => array(211,211,211),
			'BG_COLOR' 		=> array(211,211,211),
			'BRD_COLOR' 	=> array(0,0,0),
			'BRD_SIZE' 		=> 0.1,
			'BRD_TYPE' 		=> 1,
			'BRD_TYPE_NEW_PAGE' => '',
	);
	$proprieteContenu = array(
			'T_COLOR' 		=> array(0,0,0),
			'T_SIZE' 		=> 10,
			'T_FONT' 		=> 'Arial',
			'T_ALIGN_COL0' 	=> 'L',
			'T_ALIGN' 		=> 'R',
			'V_ALIGN' 		=> 'M',
			'T_TYPE' 		=> '',
			'LN_SIZE' 		=> _HTLG1,
			'BG_COLOR_COL0' => array(255,255,255),
			'BG_COLOR' 		=> array(255,255,255),
			'BRD_COLOR' 	=> array(0,0,0),
			'BRD_SIZE' 		=> 0.1,
			'BRD_TYPE' 		=> 'LR',
			'BRD_TYPE_NEW_PAGE' => '',
	);
	
	$pdf->drawTableau($pdf, $proprietesTableau, $proprieteHeader, $contenuHeader, $proprieteContenu, $contenuTableau);

	
	//********** tableau reglements
	
	$pdf->ln();
	$var =  "RESUME DES REGLEMENTS PAR MODE";
	$pdf->MultiCell(170, _HTLG1, utf8_decode( $var ), 0, 'L' );
	
	$contenuTableau = [];
	$totalgen = 0;
	
// 	* [4] => Array ( [reg_remise] => 2015-08-14 00:00:00 [reg_mode] => chq [_total] => 200 )
	
	foreach ($ligneREG as $ligne) {
	
		$data = [];
		$data[] = utf8_decode('[L]'.date_format( date_create($ligne['reg_remise']), 'd/m/Y'));
		$data[] = utf8_decode('[L]'.$ligne['reg_mode']);
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['_total'])._EUR);
		$totalgen += $ligne['_total'];
	
		$contenuTableau = array_merge( $contenuTableau, $data);
	}
	
	$contenuHeader = array(
			30, 40, 30, 
			'[C]'.utf8_decode('Remise'),
			'[C]'.utf8_decode('Mode'),
			'[C]'.utf8_decode('Montant'),
	);
	$proprietesTableau = array(
			'BRD_COLOR' 	=> array(0,0,0),
			'BRD_SIZE' 		=> '0.2',
			'TB_ALIGN' 		=> 'L',
			'L_MARGIN' 		=> '',
	);
	$proprieteHeader = array(
			'T_COLOR' 		=> array(0,0,0),
			'T_SIZE' 		=> 10,
			'T_FONT' 		=> 'Arial',
			'T_ALIGN_COL0' 	=> '',
			'T_ALIGN' 		=> '',
			'V_ALIGN' 		=> 'M',
			'T_TYPE' 		=> 'B',
			'LN_SIZE' 		=> _HTLG1,
			'BG_COLOR_COL0' => array(211,211,211),
			'BG_COLOR' 		=> array(211,211,211),
			'BRD_COLOR' 	=> array(0,0,0),
			'BRD_SIZE' 		=> 0.1,
			'BRD_TYPE' 		=> 1,
			'BRD_TYPE_NEW_PAGE' => '',
	);
	$proprieteContenu = array(
			'T_COLOR' 		=> array(0,0,0),
			'T_SIZE' 		=> 10,
			'T_FONT' 		=> 'Arial',
			'T_ALIGN_COL0' 	=> 'L',
			'T_ALIGN' 		=> 'R',
			'V_ALIGN' 		=> 'M',
			'T_TYPE' 		=> '',
			'LN_SIZE' 		=> _HTLG1,
			'BG_COLOR_COL0' => array(255,255,255),
			'BG_COLOR' 		=> array(255,255,255),
			'BRD_COLOR' 	=> array(0,0,0),
			'BRD_SIZE' 		=> 0.1,
			'BRD_TYPE' 		=> 'LR',
			'BRD_TYPE_NEW_PAGE' => '',
	);
	
	$pdf->drawTableau($pdf, $proprietesTableau, $proprieteHeader, $contenuHeader, $proprieteContenu, $contenuTableau);
	$pdf->Cell(70, _HTLG1, '', 0, 0);
	$pdf->Cell(30, _HTLG1, utf8_decode(sprintf('%.2f', $totalgen)._EUR), 1, 0, 'R' );
	
/*	
*/
// 	$pdf->Output(__ROOT .'views/factures/'.$filename, 'F');
// 	$pdf->Output('D');
	$pdf->Output( $filename, 'I');
	
// 	$pdf->AutoPrint ( true );


?>