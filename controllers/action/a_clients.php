<?php

	if ( isset( $_GET['supp_id'] )) {
	
		Clients::delOne($pdo, $_GET['supp_id']);
	}
	else {

// 		if (! isset( $_POST['cli_exotva'] ) || $_POST['cli_exotva'] != '1' )	// checkbox indefini si 0
// 			{
// 			$_POST['cli_exotva'] = '0';
// 		}
		$_POST['cli_exotva'] 	= '0';		//non géré
		$_POST['cli_cptcoll'] 	= '';		//411000 par defaut mais on s'en tape ! cf x_edit_tva_prn
		$_POST['cli_nom']		= strtoupper($_POST['cli_nom']);
		$_POST['cli_prenom']	= ucfirst(strtolower($_POST['cli_prenom']));
		$_POST['cli_ville']		= strtoupper($_POST['cli_ville']);
		
		debug(Clients::majOrAdd($pdo, $_POST));
	}
	
?>