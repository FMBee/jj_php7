<?php
	
	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_fichemode.inc.php');
	
	if ($param['paramkey'] != 'new') {
	
		$oSmarty->assign('prestation', Prestations::getOne($pdo, $param['paramkey']));
	}
	$oSmarty->assign('prestatypes', Prestations::getPrestaTypes($pdo));
?>