<?php
 	
	$message = '';
 	
	$retour = Reglements::Multi($pdo, $_POST);

	if ($retour != '1') {

		$message = "Erreur d'enregistrement";
	}
	
	$oSmarty->assign( 'message', $message );

	/*
	[saisiereglement-lignes] => 2414:14.00/2417:512.50/
	[reg_date] => 14/06/2016
	[reg_mode] => CHQ
	[reg_libelle] => blanc
	[reg_montant] => 526.50
	*/
?>