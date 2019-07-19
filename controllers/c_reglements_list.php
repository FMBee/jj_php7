<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_listemode.inc.php');

	$histoLen = Parametres::getOne($pdo, '1')['par_NbJoursHisto'];
	
	if ( $histoLen == '0' ) {
	
		$debut = 'Tous les règlements';
	}
	else{
		$debut = 'Depuis le '.date('d/m/Y', strtotime('-'.trim($histoLen).' days'));
	}

	$oSmarty->assign('allReglements', Reglements::getAll($pdo, $histoLen));
	$oSmarty->assign('debut', $debut);
	
?>