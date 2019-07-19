<?php

class Factures
{

	public static function getAll($pdo, $histoLen)
	{	
// 		$histoLen = Parametres::getOne($pdo, '1')['par_NbJoursHisto'];
		
		if ($histoLen == '0') {
			
			$req = $pdo->prepare('SELECT * FROM factures_details');
		}
		else {
			$req = $pdo->prepare("	SELECT * FROM factures_details WHERE fac_date > '".
									date('Y/m/d', strtotime('-'.trim($histoLen).' days'))."'"
								);
		}
		
		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
	public static function getAllToPay($pdo)
	{	
//		$req = $pdo->prepare('SELECT * FROM factures_details WHERE fac_etat = 0 AND NOT isnull(fac_numero)');

		// factures y compris brouillons, mais acpte déjà versé
// 		$req = $pdo->prepare('SELECT * FROM factures_details WHERE fac_etat = 0 AND fac_totalregle != 0');

		// factures y compris brouillons
		$req = $pdo->prepare('SELECT * FROM factures_details WHERE fac_etat = 0');
		
		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
	public static function getAllInSejour($pdo, $sejour)
	{	
		// commmandes soldées d'un séjour
		$req = $pdo->prepare('SELECT * FROM factures_details where sej_id = ? order by cli_nom');
		
		$req->execute(array($sejour));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
	public static function getAllSolded($pdo, $sejour)
	{	
		// commmandes soldées d'un séjour
		$req = $pdo->prepare('SELECT * FROM factures_details 
								where sej_id = ? and isnull(fac_numero) and fac_etat = 1 
								order by cli_nom');
		
		$req->execute(array($sejour));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
    public static function getOneLines($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT * FROM factures_lignes_details WHERE fac_id = ?');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}

    public static function getOneTvaSummary($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT 	fli_tauxtva,
      									sum( fli_totalttc-fli_totalht) as tot_tva, 
      									sum(fli_totalht) as tot_ht 
      									FROM factures_lignes_details where fac_id = ?
      									group by fli_tauxtva order by fli_tauxtva' );
      			
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}

   	public static function majAdr($pdo, $data)
   	{
   		$req = $pdo->prepare("	UPDATE factures SET fac_civ_code = ?,
   													fac_nom = ?,
   													fac_prenom = ?,
   				                                    fac_rue = ?,    
   				                                    fac_complement = ?,
   				                                    fac_codepostal = ?,
   				                                    fac_ville = ?, 
   				                                    fac_pays = ?
   												WHERE fac_id = ? ");
   		 
   		$insert = $req->execute(array(	
						   				$data['fac_civ_code'],
						   				$data['fac_nom'],
						   				$data['fac_prenom'],
						   				$data['fac_rue'],
						   				$data['fac_complement'],
						   				$data['fac_codepostal'],
						   				$data['fac_ville'],
						   				$data['fac_pays'],
						   				$data['paramkey']
   									));
   		return ($insert);
   	}
   	
   	public static function majEtat($pdo)
   	{
   		$req = $pdo->prepare('UPDATE factures set fac_etat = (fac_totalttc = fac_totalregle)');
   	
   		$result = $req->execute();
   	
   		return ($result);
   	}
   	
   	
   	public static function Add($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL factures_add(".substr(str_repeat('?,', count($data)), 0, -1).")");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramsejour'], 		
						   				$data['paramclient'], 		
										$data['paramprestation'],  
										$data['fli_descriptif'],  
										$data['fli_quantite'],   
										$data['fli_puttc']        
   									));
   		return ($insert);
   	}
   	
   	public static function Close($pdo, $id)
   	{
   		$req = $pdo->prepare("CALL factures_close(?)");
   		 
   		$insert = $req->execute(array($id));
   		return ($insert);
   	}
   	
   	public static function addPrestation($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL factures_addpre(".substr(str_repeat('?,', count($data)), 0, -1).", @retour)");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramfacture'], 		
										$data['paramprestation'],  
										$data['fli_descriptif'],  
										$data['fli_quantite'],   
										$data['fli_puttc']        
   									));
   		
   		$retour = $pdo	->query ( "select @retour" )
   						->fetch ( PDO::FETCH_ASSOC );
   		
   		return ( $retour['@retour'] );
   	}
   	
   	public static function majPrestation($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL factures_majpre(".substr(str_repeat('?,', count($data)), 0, -1).", @retour)");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramfacture'], 		
										$data['paramnumlig'],  
										$data['fli_descriptif'],  
										$data['fli_quantite'],   
										$data['fli_puttc']        
   									));
   		
   		$retour = $pdo	->query ( "select @retour" )
   						->fetch ( PDO::FETCH_ASSOC );
   		
   		return ( $retour['@retour'] );
   	}
   	
   	public static function delPrestation($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL factures_delpre(".substr(str_repeat('?,', count($data)), 0, -1).", @retour)");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramfacture'], 		
										$data['paramligne'] 
   									));
   		
   		$retour = $pdo	->query ( "select @retour" )
   						->fetch ( PDO::FETCH_ASSOC );
   		
   		return ( $retour['@retour'] );
   	}

   	public static function getComptaTtc($pdo, $debut, $fin)
   	{
   		$req = $pdo->prepare('SELECT sum(fli_totalttc) as _totalttc FROM factures_lignes_details
 								WHERE sej_fin >= ? and sej_fin <= ? and not isnull(fac_numero)');	
   				
   		$req->execute(array($debut, $fin));
   		$data = $req->fetchAll(PDO::FETCH_ASSOC);
   	
   		return ($data);
   	}
   	
   	public static function getComptaHt($pdo, $debut, $fin)
   	{
   		$req = $pdo->prepare('SELECT pre_compteht, sum(fli_totalht) as _totalht FROM factures_lignes_details
 								WHERE sej_fin >= ? and sej_fin <= ? and not isnull(fac_numero)
 								GROUP BY pre_compteht ORDER BY pre_compteht');	
   				
   		$req->execute(array($debut, $fin));
   		$data = $req->fetchAll(PDO::FETCH_ASSOC);
   	
   		return ($data);
   	}
   	
   	public static function getComptaTva($pdo, $debut, $fin)
   	{
   		$req = $pdo->prepare('SELECT pre_comptetva, sum(fli_totalttc-fli_totalht) as _totaltva FROM factures_lignes_details
 								WHERE sej_fin >= ? and sej_fin <= ? and not isnull(fac_numero)
 								GROUP BY pre_comptetva ORDER BY pre_comptetva');	
   				
   		$req->execute(array($debut, $fin));
   		$data = $req->fetchAll(PDO::FETCH_ASSOC);
   	
   		return ($data);
   	}
   	
   	
//    	fac_id 			int(11),
//    	fac_cli_id 		int(11),
//    	fac_numero 		varchar(10),
//    	fac_totalht 	double,
//    	fac_arrhes 		double,			NO
//    	fac_totalttc 	double,			
//    	fac_totaltva 	double,
//    	fac_civ_code 	varchar(5),
//    	fac_nom 		varchar(255),
//    	fac_prenom 		varchar(255),
//    	fac_rue 		varchar(255),
//    	fac_complement 	varchar(255),
//    	fac_codepostal 	varchar(20),
//    	fac_ville 		varchar(255),
//    	fac_pays 		varchar(255),
//    	fac_cptcoll 	varchar(8),
//    	fac_totalregle 	double,
//    	fac_etat 		tinyint(1),
//    	fac_adrponct 	tinyint(1),		NO
//    	fac_date 		varchar(30),
//    	fac_flag 		char(1)  

//    	fli_fac_id 		int(11),
//    	fli_numlig 		int(11),
//    	fli_pre_id 		int(11),
//    	fli_descriptif 	varchar(255),
//    	fli_quantite 	double,
//    	fli_prixttc 	tinyint(1),		NO
//    	fli_puht 		double,			= PU TTC !!!!!!!
//    	fli_totalht 	double,
//    	fli_tauxtva 	double,
//    	fli_totalttc 	double,
//    	fli_flag 		char(1)    	
}
?>