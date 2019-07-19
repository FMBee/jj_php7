<?php	

	if (! isset($_SESSION['__user_id__'])) {
		echo json_encode( array( "retour" => "noSession" ));
		exit();
	}
	
	define('__SEP',		'/');
	define('__ROOT', 	'../../');		// remonter de /controllers/ajax/
	define('__CONFIG', 	__ROOT.'config/');	
	define('__MODELS', 	__ROOT.'models/');	
	
	require(__CONFIG.'defines.php');
	require(__CONFIG.'functions.php');
	require_once(__CONFIG.'connect.php');
	
?>
