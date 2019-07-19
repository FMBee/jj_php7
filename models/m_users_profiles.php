<?php

class Users_Profiles 
{
	public static function getAll($pdo)
		{
		$data = $pdo	->query("SELECT * FROM users_profiles WHERE pro_name NOT LIKE 'Root'"
															." ORDER BY pro_name" )
						->fetchAll(PDO::FETCH_ASSOC);
		
		return ($data);
		}

	public static function getById($pdo, $id)
		{
		$req = $pdo->prepare('SELECT * FROM users_profiles WHERE pro_id = ?');
		
		$req->execute(array($id));
		$data = $req->fetch(PDO::FETCH_ASSOC);
		
		return ($data);
		}		
}
	
?>