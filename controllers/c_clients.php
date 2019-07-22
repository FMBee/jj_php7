<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_fichemode.inc.php');
	
	if ($param['paramkey'] != 'new') {
	
		$oSmarty->assign('client', Clients::getOne($pdo, $param['paramkey']));
		$oSmarty->assign('sejoursClient', SejoursClients::getForClient($pdo, $param['paramkey']));
	}
	
	$debut = Parametres::getOne($pdo, '1')['par_DebutListeSejours'];
	
	if ($debut == '') {
	
		$debut = date_create_from_format('d/m/Y', date('d/m/Y'));
	}
	else {
		$debut = date_create_from_format('d/m/Y', $debut);
	}
	
	$oSmarty->assign('sejours', Sejours::getValid($pdo, date_format( $debut, 'Y/m/d')));

?>