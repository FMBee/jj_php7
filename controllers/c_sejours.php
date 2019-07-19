<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_fichemode.inc.php');
	
	if ($param['paramkey'] != 'new') {
	
		$oSmarty->assign('sejour', 		Sejours::getOne					($pdo, $param['paramkey']));
		$oSmarty->assign('clients', 	SejoursClients::getAllClients	($pdo, $param['paramkey']));
		$oSmarty->assign('confirmes', 	SejoursClients::getAllConfirmed	($pdo, $param['paramkey']));
		$oSmarty->assign('prospects', 	SejoursClients::getAllProspects	($pdo, $param['paramkey']));
		
	}
?>