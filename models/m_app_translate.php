<?php

class App_Translate 
{

	public static function getAll($pdo)	{

		$data = $pdo	->query('SELECT * FROM app_translate_details')
		
						->fetchAll(PDO::FETCH_ASSOC);
		
		return ($data);
	}

}
	
?>