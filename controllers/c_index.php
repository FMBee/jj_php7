<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_listemode.inc.php');

//  (object) $date = date_create('2000-01-01');

//  (string) $var  = date_format( $date, 'd/m/Y');

//  (object) $date = date_create_from_format('d/m/Y', '15/04/2015');

//	(string) $var  = date('Y/m/d', strtotime('-'.trim($histoLen).' days'))."'"

	$debut = Parametres::getOne($pdo, '1')['par_DebutListeSejours'];
	
	if ($debut == '') {
		
		$debut = date_create_from_format('d/m/Y', date('d/m/Y'));
	}
	else {
		$debut = date_create_from_format('d/m/Y', $debut);
	}
	
	$oSmarty->assign('allStats', SejoursClients::getAllStats($pdo, date_format( $debut, 'Y/m/d')) );
	$oSmarty->assign('debut', date_format( $debut, 'd/m/Y') );

?>