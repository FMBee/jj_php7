<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_listemode.inc.php');

	if (isset($_POST['introvalue'])) {	// depuis intro

		$oSmarty->assign('introvalue', $_POST['introvalue']);
	}
	else{
		$oSmarty->assign('introvalue', '');
	}
	
	$oSmarty->assign('allClients', Clients::getAllIn($pdo));

?>