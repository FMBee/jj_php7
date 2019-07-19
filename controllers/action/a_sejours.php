<?php
	
	$message = '';
	
	if ( isset( $_GET['supp_id'] )) {
	
		$retour = Sejours::delOne($pdo, $_GET['supp_id']);
		
		if ($retour == '0') {
		
			$message = "Impossible, ce séjour n'est pas vide !";
		}
		else{
			$message = "Séjour supprimé";
		}
	}
	else {
		
		if (! isset( $_POST['sej_complet'] ) || $_POST['sej_complet'] != '1' )		// checkbox indefini si 0
		{
			$_POST['sej_complet'] = '0';
		}
		if ( empty( $_POST['sej_nbmax'] ) )
		{
			$_POST['sej_nbmax'] = '0';
		}
	
		Sejours::majOrAdd($pdo, $_POST);
	}

	$oSmarty->assign( 'ctrlMessage', $message );
	
?>