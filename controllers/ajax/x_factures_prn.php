<?php

	session_start();
	ob_end_clean ();

	require('x_common.inc.php');
	
	require_once(__MODELS.'m_parametres.php');
	require_once(__MODELS.'m_factures.php');
	require_once(__MODELS.'m_reglements.php');
	require_once(__MODELS.'m_clients.php');
	
	require(__ROOT .'web/fpdf/pdf_code128.php');
	
	
	define ( '_HTLG1', 6 );
	define ( '_HTLG2', 4 );
	define ( '_STLG', chr(10) );
	define ( '_EUR', '' );
	
	$_sejour = trim($_GET['paramsejour']);
	$params = Parametres::getOne($pdo, '1');
	
	if (trim($_GET['choix']) == '1') {
		
		$factures = []; 
		
		if (! empty($_GET['liste']) ) {
			
			foreach ( explode(';', $_GET['liste']) as $id ) {
				
				$factures[] = array( 'fac_id' => $id );
			}
		}
	}
	else{
		
		$factures = Factures::getAllInSejour($pdo, $_sejour);
	}
	if (count($factures) < 1) {
		echo 'Aucun document à imprimer';
		exit();
	}

	$pdf = new PDF_Code128 ();
// 	$pdf->SetAutoPageBreak ( false );

foreach ($factures as $facture) {

	$_fac_id = $facture['fac_id'];
	
	$lignes = Factures::getOneLines($pdo, $_fac_id);
	$entete = $lignes[0];
	$tva	= Factures::getOneTvaSummary($pdo, $_fac_id);
	$reglts	= Reglements::getFactLines($pdo, $_fac_id);
// 	$client = Clients::getOne($pdo, $entete['fac_cli_id']);
	
	$_fac_numero = trim( $entete['fac_numero'] );

	if ( $_fac_numero === '' ) {
		
		$_fac_numero = $_fac_id;
		$filename = "Cmd-" .$_fac_id .".pdf";
		$titre1 = "BON DE COMMANDE";
		$titre2 = "Commande";
	}
	else{
		
		$filename = "Fact-" .$_fac_numero .".pdf";
		$titre1 = "FACTURE";
		$titre2 = "Facture";
	}
	
	//******** entête
	
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
	$pdf->ln(2);
	
	$pdf->SetXY(-100, 30);
	$pdf->SetFont('Arial','BU',16);
	$pdf->Cell(80, _HTLG1, utf8_decode( $titre1 ), 0, 0, 'C' );
			
	$pdf->SetXY(-100, 50);
	$pdf->SetFont('Arial','',12);
	$var =  $entete['fac_civ_code'].' '.$entete['fac_prenom'].' '.$entete['fac_nom']._STLG.
// 			$client['cli_email']._STLG._STLG.
			$entete['fac_rue']._STLG.
			$entete['fac_complement']._STLG.
			$entete['fac_codepostal'].' '.$entete['fac_ville']._STLG.
			$entete['fac_pays'];
	$pdf->MultiCell(90, _HTLG1, utf8_decode( $var ), 1, 'C' );
	
	$pdf->SetY(100);
	$pdf->SetFont('Arial','',14);
	$var =  $titre2.' n.'.substr($entete['fac_date'], 0, 4).'-'.$_fac_numero.
			'  du  '.date_format( date_create($entete['fac_date']), 'd/m/Y');
	$pdf->Cell(80, _HTLG1, utf8_decode( $var ), 0, 1 );
	
	$pdf->SetX(-100);
	$pdf->SetFont('Arial','',10);
	$pdf->Cell(90, _HTLG1, 'montants en euros', 0, 1, 'R' );
	
	
	//********* lignes de facture
	
	$contenuTableau = [];
	
	foreach ($lignes as $ligne) {
	
		$data = [];
		$data[] = utf8_decode('[L]'.$ligne['fli_descriptif']);
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['fli_quantite']));
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['fli_tauxtva']).'%');
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['fli_puht'])._EUR);
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['fli_totalttc'])._EUR);
	
		$contenuTableau = array_merge( $contenuTableau, $data);
	}
	
	$contenuHeader = array(
			105, 15, 20, 25, 25,		// total 190 +(2*10)
			'[L]'.utf8_decode('Descriptif'),
			'[C]'.utf8_decode('Qté'),
			'[C]'.utf8_decode('TVA'),
			'[C]'.utf8_decode('PU TTC'),
			'[C]'.utf8_decode('Total TTC'),
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

	$pdf->SetX(-80);
	$pdf->Cell(45, _HTLG1, utf8_decode( 'Total TTC' ), 0, 0, 'R' );
	$pdf->Cell(25, _HTLG1, utf8_decode(sprintf('%.2f', $entete['fac_totalttc'])._EUR), 1, 0, 'R' );
	

	
	//********** tableau tva
	
	$contenuTableau = [];
	
	foreach ($tva as $ligne) {
	
		$data = [];
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['fli_tauxtva']).'%');
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['tot_tva'])._EUR);
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['tot_ht'])._EUR);
	
		$contenuTableau = array_merge( $contenuTableau, $data);
	}
	
	$contenuHeader = array(
			30, 30, 30,
			'[C]'.utf8_decode('Taux'),
			'[C]'.utf8_decode('TVA'),
			'[C]'.utf8_decode('Hors taxes'),
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
	
	$pdf->ln();
	$pdf->ln();
	
	$pdf->drawTableau($pdf, $proprietesTableau, $proprieteHeader, $contenuHeader, $proprieteContenu, $contenuTableau);
	$pdf->Cell(30, _HTLG1, '', 0, 0);
	$pdf->Cell(30, _HTLG1, utf8_decode(sprintf('%.2f', $entete['fac_totaltva'])._EUR), 1, 0, 'R' );
	$pdf->Cell(30, _HTLG1, utf8_decode(sprintf('%.2f', $entete['fac_totalht'])._EUR), 1, 0, 'R' );
	
	
	//********** tableau reglements
	
	$contenuTableau = [];
	
	foreach ($reglts as $ligne) {
	
		$data = [];
		$data[] = utf8_decode('[L]'.$ligne['reg_mode']);
		$data[] = utf8_decode('[L]'.$ligne['reg_libelle']);
		$data[] = utf8_decode('[C]'.date_format( date_create($ligne['reg_remise']), 'd/m/Y'));
		$data[] = utf8_decode('[R]'.sprintf('%.2f', $ligne['reg_montant'])._EUR);
	
		$contenuTableau = array_merge( $contenuTableau, $data);
	}
	
	$contenuHeader = array(
			20, 50, 30, 30,
			'[C]'.utf8_decode('Mode'),
			'[C]'.utf8_decode('Règlement'),
			'[C]'.utf8_decode('Remise'),
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
	
	$pdf->ln();
	$pdf->ln();
	
	$pdf->drawTableau($pdf, $proprietesTableau, $proprieteHeader, $contenuHeader, $proprieteContenu, $contenuTableau);
	$pdf->Cell(100, _HTLG1, '', 0, 0);
	$pdf->Cell(30, _HTLG1, utf8_decode(sprintf('%.2f', $entete['fac_totalregle'])._EUR), 1, 0, 'R' );
	
} //end foreach
	
// 	$pdf->Output(__ROOT .'views/factures/'.$filename, 'F');
// 	$pdf->Output('D');
// 	$pdf->AutoPrint ( true );
	$pdf->Output( $filename, 'I');

	

?>