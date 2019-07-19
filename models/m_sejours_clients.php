<?php

class SejoursClients
{

    public static function getAll($pdo, $id)	// tous les clients d'un séjour
   	{
      	$req = $pdo->prepare('SELECT * FROM sejours_clients_details 
      									WHERE scl_sej_id = ? 
      									ORDER BY cli_nom, cli_prenom ASC');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
    public static function getForClient($pdo, $id)	// tous les séjours d'un client
   	{
      	$req = $pdo->prepare('SELECT * FROM sejours_clients_details WHERE scl_cli_id = ? ORDER BY scl_sej_id DESC');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
    public static function getAllClients($pdo, $id)	// tous les clients d'un séjour avec facture
   	{
      	$req = $pdo->prepare('SELECT * FROM sejours_clients_details 
      									WHERE scl_sej_id = ? AND scl_etat = 1 AND NOT isnull(fac_numero)
      									ORDER BY cli_nom ASC');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
    public static function getAllProspects($pdo, $id)	// tous les clients non confirmés d'un séjour sans facture
   	{
      	$req = $pdo->prepare('SELECT * FROM sejours_clients_details 
      									WHERE scl_sej_id = ? AND scl_etat = 0 AND isnull(fac_numero)
      									ORDER BY cli_nom ASC');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
    public static function getAllConfirmed($pdo, $id)	// tous les clients confirmés d'un séjour sans facture
   	{
      	$req = $pdo->prepare('SELECT * FROM sejours_clients_details 
      									WHERE scl_sej_id = ? AND scl_etat = 1 AND isnull(fac_numero)
      									ORDER BY cli_nom ASC');
      
   		$req->execute(array($id));
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
    public static function getAllStats($pdo, $date)	// séjours +stats depuis date
   	{
      	$req = $pdo->prepare('SELECT * FROM sejours_clients_stat WHERE sej_fin >= ? ORDER BY sej_debut ASC');
      
   		$req->execute( array($date) );
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}

   	public static function getSejourLines($pdo, $id)	// toutes lignes de facture d'un séjour 
   	{
   		$req = $pdo->prepare('SELECT * FROM sejours_lignes_details
      									WHERE scl_sej_id = ? 
      									ORDER BY fac_id ASC, fli_numlig ASC');
   	
   		$req->execute(array( $id ));
   		$data = $req->fetchAll(PDO::FETCH_ASSOC);
   	
   		return ($data);
   	}
   
   	public static function setEtat($pdo, $data)
   	{
   		$req = $pdo->prepare('UPDATE sejours_clients SET scl_etat = ? WHERE scl_sej_id = ? AND scl_cli_id = ?');
   	
   		$insert = $req->execute(array(
						   				$data['scl_etat'],
						   				$data['paramsejour'],
						   				$data['paramclient'],
   									));
   		return ($insert);
   	}
   	
   	public static function Add($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL sejours_clients_add(".substr(str_repeat('?,', count($data)), 0, -1).")");
   	
   		$insert = $req->execute(array(
						   				$data['paramsejour'],
						   				$data['paramclient'],
   									));
   		return ($insert);
   	}
   	
   	public static function Del($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL sejours_clients_del(".substr(str_repeat('?,', count($data)), 0, -1).")");
   	
   		$insert = $req->execute(array(
						   				$data['paramsejour'],
						   				$data['paramclient'],
   									));
   		return ($insert);
   	}
   	
}
?>