<?php

class Civilites
	{
	
	public static function getAll($pdo)
		{
		$data = $pdo	->query("SELECT * FROM civilites ORDER BY civ_libelle")
						->fetchAll(PDO::FETCH_ASSOC);
		
		return ($data);
	}

}
	
?>