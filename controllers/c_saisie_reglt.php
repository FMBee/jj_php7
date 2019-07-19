<?php

	if (empty($_GET['modecompta'])) {
		
		$oSmarty->assign('allFactures', Factures::getAllToPay($pdo));
	}
	else{
		
		Factures::majEtat($pdo);	//repositionne les fac_etat
		
		$histoLen = Parametres::getOne($pdo, '1')['par_NbJoursHisto'];
		
		if ( $histoLen == '0' ) {
		
			$debut = 'Toutes les factures';
		}
		else{
			$debut = 'Factures depuis le '.date('d/m/Y', strtotime('-'.trim($histoLen).' days'));
		}
		
		$oSmarty->assign('allFactures', Factures::getAll($pdo, $histoLen));
		$oSmarty->assign('debut', $debut);
		$oSmarty->assign('modecompta', 1);
	}
?>