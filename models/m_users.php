<?php

class Users
{

	public static function getAll($pdo, $withRoot = false)
	// Tous les users avec ou sans root
	{
		$req = $pdo->prepare(	'SELECT * FROM users_details'
  	 							.( $withRoot ? ' ' : ' WHERE pro_access != 999' )
							);

		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	}
	
	public static function getAllIn($pdo)
	// Tous les users non sortis et non root
	{
		$req = $pdo->prepare(	'SELECT * FROM users_details'
								.'WHERE pro_access != 999 AND (usr_out_date > now() OR usr_out_date IS NULL)'
								);
		
		$req->execute();
   	 	$data = $req->fetchAll(PDO::FETCH_ASSOC);
				
		return ($data);
	} 
	
    public static function getOne($pdo, $id)
   	{
      	$req = $pdo->prepare('SELECT * FROM users_details WHERE usr_id = ?');
      
   		$req->execute(array($id));
   	 	$data = $req->fetch(PDO::FETCH_ASSOC);
      
      	return ($data);
   	}
   	
   	public static function getOneByLogin($pdo, $login, $allUsers = false)
	/* Recherche du user par son login (y compris root)
	 * à la connexion on recherche dans les users non sortis
	 * en contrôle de login existant on recherche dans tous les users 
	 */
   	{
   		$req = $pdo->prepare(	'SELECT * FROM users_details WHERE usr_login = ?'
  	 							.( $allUsers ? ' ' : ' AND (usr_out_date > now() OR usr_out_date IS NULL)' )
  	 						);
   	 	
   	 	$req->execute(array($login));
   	 	$data = $req->fetch(PDO::FETCH_ASSOC);
   	 	
   	 	return ($data);
   	}
   	
   	public static function majOrAdd($pdo, $data)
   	// Ajouter ou modifier un enregistrement
   	{
   		$req = $pdo->prepare("CALL users_mjad(".substr(str_repeat('?,', 10), 0, -1).")");
   		 
   		$insert = $req->execute(array(	
						   				$data['key'],
						   				$data['usr_first_name'],
						   				$data['usr_last_name'],
						   				$data['usr_login'],
						   				$data['usr_password'],
						   				$data['usr_mail'],
						   				$data['usr_pro_id'],
						   				$data['usr_lang'],
						   				$data['usr_image_path'],
						   				$data['out_user']
						   		));
   		return ($insert);
   	}
}
	
?>