<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_fichemode.inc.php');

	if ($param['paramkey'] != 'new') {	
	
		$data = Reglements::getOneLines($pdo, $param['paramkey']);
		$oSmarty->assign('reglement', $data[0]);
		$oSmarty->assign('lignesReglement', $data);
	}
	
?>
