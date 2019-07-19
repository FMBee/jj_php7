<?php

class Languages {
	
	public static function getAllLanguages($pdo) {
		
		$data = $pdo	->query ( 'SELECT * FROM app_languages' )
						->fetchAll ( PDO::FETCH_ASSOC );
		
		return ($data);
	}
}

?>