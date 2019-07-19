<?php

class Clients
{

	public static function getAll($pdo)
	// Tous les clients
	{
		$req = $pdo->prepare('SELECT * FROM clients ORDER BY cli_nom');

		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
	public static function getAllCsv($pdo)
	// Tous les clients
	{
		$req = $pdo->prepare('SELECT  
				                     cli_nom,        
				                     cli_prenom,     
				                     cli_rue,        
				                     cli_complement, 
				                     cli_codepostal, 
				                     cli_ville,      
				                     cli_pays,       
				                     cli_telfixe,    
				                     cli_portable,   
				                     cli_email,      
				                     convert(cli_datenais, date)
								FROM clients ORDER BY cli_nom');

		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
	public static function getAllIn($pdo)
	// Tous les clients
	{
		$req = $pdo->prepare('SELECT * FROM clients WHERE isnull(cli_flag) ORDER BY cli_nom');

		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
    public static function getOne($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT * FROM clients WHERE cli_id = ?');
      
   		$req->execute(array($id));
   	 	$data = $req->fetch(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}

    public static function searchList($pdo, $query, $values)
   	{
//       	$req = $pdo->prepare("SELECT * FROM clients
//       							WHERE 	(cli_nom like ? or 
//       									cli_prenom like ? or
//       									cli_ville like ?) and
//       									isnull(cli_flag)
//       							ORDER BY `cli_nom` asc");
      	$req = $pdo->prepare("SELECT * FROM clients	WHERE isnull(cli_flag)"
      							.$query
      							." ORDER BY cli_nom ASC");
   		$req->execute($values);
   		
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}

   	public static function delOne($pdo, $id)
   	{
   		$req = $pdo->prepare("UPDATE clients SET cli_flag = 'D' WHERE cli_id = ?");
   	
   		$req->execute(array($id));
   	
   		return;
   	}
   	
   	
   	public static function majOrAdd($pdo, $data)
   	// Ajouter un enregistrement
   	{
   		$req = $pdo->prepare("CALL clients_mjad(".substr(str_repeat('?,', count($data)), 0, -1).")");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramkey'],
						   				$data['cli_civ_code'],
						   				$data['cli_nom'],
						   				$data['cli_prenom'],
						   				$data['cli_rue'],
						   				$data['cli_complement'],
						   				$data['cli_codepostal'],
						   				$data['cli_ville'],
						   				$data['cli_pays'],
						   				$data['cli_telfixe'],
						   				$data['cli_portable'],
						   				$data['cli_email'],
						   				$data['cli_exotva'],
						   				$data['cli_cptcoll'],
						   				$data['cli_sexe'],
						   				$data['cli_datenais'],
						   				$data['add_sejour'],
						   				$data['trf_sejour']
   									));
   		
   		return ( $insert ? $insert : $req->errorInfo() );
   	}
   	
   	public static function getCivilites($pdo)
   	{
   		$data = $pdo	->query("SELECT * FROM civilites ORDER BY civ_libelle")
   						->fetchAll(PDO::FETCH_ASSOC);
   	
   		return ($data);
   	}
}
	
?>