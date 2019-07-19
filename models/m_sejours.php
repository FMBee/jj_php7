<?php

class Sejours
{

	public static function getAll($pdo)
	{
		$req = $pdo->prepare('SELECT * FROM sejours ORDER BY sej_debut DESC');

		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
	public static function getValid($pdo, $debut)
	{
		$req = $pdo->prepare('SELECT * FROM sejours WHERE sej_fin >= ? ORDER BY sej_debut ASC');

		$req->execute( array($debut) );
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
    public static function getOne($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT * FROM sejours WHERE sej_id = ?');
      
   		$req->execute(array($id));
   	 	$data = $req->fetch(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
   	public static function delOne($pdo, $id)
   	{
   		$req = $pdo->prepare("CALL sejours_del( ?, @retour)");
   		 
   		$insert = $req->execute(array($id));
   		
   		$retour = $pdo	->query ( "select @retour" )
   						->fetch ( PDO::FETCH_ASSOC );
   		
   		return ( $retour['@retour'] );
   	}
   	
   	public static function majOrAdd($pdo, $data)
   	{
   		$req = $pdo->prepare("CALL sejours_mjad(".substr(str_repeat('?,', count($data)), 0, -1).")");
   		 
   		$insert = $req->execute(array(	
						   				$data['paramkey'],
						   				$data['sej_libelle'],
						   				$data['sej_nbmax'],
						   				$data['sej_complet'],
						   				$data['sej_debut'],
						   				$data['sej_fin']
   									));
   		return ( $insert ? $insert : $req->errorInfo() );
   	}
//    	IN sej_id 				int(11),
//    	IN sej_libelle 		varchar(255),
//    	IN sej_nbmax 			int(11),
//    	IN sej_complet 		tinyint(1),
//    	IN sej_debut 			varchar(30),
//    	IN sej_fin 			varchar(30),
//    	IN sej_flag 			char(1)  
}
?>