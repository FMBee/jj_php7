<?php

class Reglements
{

	public static function getAll($pdo, $histoLen)
	{
// 		$histoLen = Parametres::getOne($pdo, '1')['par_NbJoursHisto'];
		
		if ($histoLen == '0') {
			
			$req = $pdo->prepare('SELECT * FROM reglements');
		}
		else {
			$req = $pdo->prepare("	SELECT * FROM reglements WHERE reg_date > '".
									date('Y/m/d', strtotime('-'.trim($histoLen).' days'))."'"
								);
		}

		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
    public static function getOneLines($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT * FROM reglements_details WHERE reg_id = ?');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
    public static function getFactLines($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT * FROM reglements_details WHERE rli_fac_id = ?');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
   	public static function getComptaList($pdo, $debut, $fin)
   	{
   		$req = $pdo->prepare('SELECT reg_remise, reg_mode, sum(reg_montant) as _total FROM reglements
								 WHERE reg_remise >= ? and reg_remise <= ?
 									GROUP BY reg_remise, reg_mode order by reg_remise');
   	
   		$req->execute(array($debut, $fin));
   		$data = $req->fetchAll(PDO::FETCH_ASSOC);
   	
   		return ($data);
   	}
   	
   	public static function MAJ($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL reglements_maj(".substr(str_repeat('?,', count($data)), 0, -1).")");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramkey'],       
						   				$data['reg_date'],       
										$data['reg_mode'],       
										$data['reg_libelle'],    
										$data['reg_remise']   
   									));
   		return ($insert);
   	}
   	
   	public static function Add($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL reglements_add(".substr(str_repeat('?,', count($data)), 0, -1).", @retour)");

   		$insert = $req->execute(array(	
						   				$data['paramfacture'],     
						   				$data['reg_date'],         
						   				$data['reg_mode'],         
										$data['reg_libelle'],      
										$data['reg_montant']      
   									));

   		$retour = $pdo	->query ( "select @retour" )
   						->fetch ( PDO::FETCH_ASSOC );
   		
   		return ( $retour['@retour'] );
   	}
   	
   	public static function Multi($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL reglements_multi(".substr(str_repeat('?,', count($data)), 0, -1).", @retour)");

   		$insert = $req->execute(array(	
						   				$data['saisiereglement-lignes'],     
						   				$data['reg_date'],         
						   				$data['reg_mode'],         
										$data['reg_libelle'],      
										$data['reg_montant']      
   									));

   		$retour = $pdo	->query ( "select @retour" )
   						->fetch ( PDO::FETCH_ASSOC );
   		
   		return ( $retour['@retour'] );
   	}
   	
   	
   	
//    	reg_id            	int(11),
//    	reg_mode            varchar(5),
//    	reg_libelle         varchar(255),
//    	reg_montant         double,
//    	reg_partiel         tinyint(1),
//    	reg_etat            int(1),
//    	reg_remise          varchar(25),
//    	reg_date            varchar(25),
//    	reg_flag            char(1)  
}
?>