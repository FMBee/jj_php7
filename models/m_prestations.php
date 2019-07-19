<?php

class Prestations
{

	public static function getAll($pdo)
	// Tous les clients
	{
		$req = $pdo->prepare('SELECT * FROM prestations_details WHERE isnull(pre_flag)');

		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
    public static function getOne($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT * FROM prestations_details WHERE pre_id = ?');
      
   		$req->execute(array($id));
   	 	$data = $req->fetch(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
    public static function delOne($pdo, $id)
   	{
      	$req = $pdo->prepare("UPDATE prestations SET pre_flag = 'D' WHERE pre_id = ?");
      
   		$req->execute(array($id));
      
      	return;
   	}
   	
   	public static function majOrAdd($pdo, $data)
   	// Ajouter un enregistrement
   	{
   		$req = $pdo->prepare("CALL prestations_mjad(".substr(str_repeat('?,', count($data)), 0, -1).")");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramkey'],
										$data['pre_pty_code'],    
										$data['pre_libelle'],     
										$data['pre_descriptif'],  
										$data['pre_comptetva'],   
										$data['pre_tauxtva'],     
										$data['pre_compteht'],    
										$data['pre_puht'],        
										$data['pre_puttc'],       
										$data['pre_prixttc'] 
   									));
   		
   		return ( $insert ? $insert : $req->errorInfo() );
   	}

   	public static function getPrestaTypes($pdo)
   	// Tous les clients
   	{
   		$req = $pdo->prepare('SELECT * FROM prestations_types ORDER BY pty_code');
   	
   		$req->execute();
   		$data = $req->fetchAll(PDO::FETCH_ASSOC);
   	
   		return ($data);
   	}
   	
   	
}
?>