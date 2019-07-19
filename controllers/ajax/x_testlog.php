<?php

	session_start();
	require('x_common.inc.php');
	
	require_once(__MODELS.'m_users.php');
	
	$retour = "false";
	if ($data = Users::getOneByLogin($pdo, $_GET['login'], true))
	{
		$retour = "true";
	}
	echo json_encode( array( "exist" => $retour ) );

?>