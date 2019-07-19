<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_fichemode.inc.php');

	if (! isset($param['paraminput'])) {
	
		$param['paraminput'] = '';
	}
	$oSmarty->assign('paraminput', 	$param['paraminput']);
	
	if ($param['paramkey'] != 'new') {
	
		$data = Factures::getOneLines($pdo, $param['paramkey']);
		$oSmarty->assign('facture', $data[0]);
		$oSmarty->assign('lignesFacture', $data);
		
		$oSmarty->assign('allReglements', Reglements::getFactLines($pdo, $param['paramkey']));
		
	}
	
?>