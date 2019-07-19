<?php
 	
	$message = '';
 	
	// Ajout d'un participant
	
	if (isset( $_POST['modal-addclient-paramsejour'])) {
		
		$data['paramclient'] = $_POST['modal-addclient-paramclient'];
		$data['paramsejour'] = $_POST['modal-addclient-paramsejour'];
	
		SejoursClients::Add($pdo, $data);	// doublon impossible sur PRIMARY
		
		// pour retour vers le séjour
		$_POST['paramkey'] 	= $_POST['modal-addclient-paramsejour'];
		$_POST['paramname'] = $_POST['modal-addclient-paramsejourname'];
	}
	
	
	// Ajout d'une prestation
	
	if (isset( $_POST['modal-addprestation-paramsejour'])) {
		
		$data['paramprestation'] 	= $_POST['modal-addprestation-paramprestation'];
		$data['fli_descriptif']     = $_POST['modal-addprestation-fli_descriptif'];
		$data['fli_quantite']       = $_POST['modal-addprestation-fli_quantite']; 
		$data['fli_puttc']          = $_POST['modal-addprestation-fli_puttc'];    

		$facture = $_POST['modal-addprestation-paramfacture'];

		if ( $facture == '' ) {	// à créer
			
			$data['paramclient'] = $_POST['modal-addprestation-paramclient'];
			$data['paramsejour'] = $_POST['modal-addprestation-paramsejour'];	//pour lien scl_fac_id

			Factures::Add($pdo, $data);
		}
		else {

			$data['paramfacture'] = $facture;

			$retour = Factures::addPrestation($pdo, $data);
			
			if ($retour == '0') {
				
				$message = 'Prestation déjà ajoutée - Modifiez la quantité';
			}
		}
		
		// pour retour vers le séjour
		$_POST['paramkey'] 	= $_POST['modal-addprestation-paramsejour'];
		$_POST['paramname'] = $_POST['modal-addprestation-paramsejourname'];
		$_POST['paramindex'] = $_POST['modal-addprestation-paramindex'];
	}

	// Modification d'une prestation
	
	if (isset( $_POST['modal-majprestation-paramsejour'])) {
		
		$data['paramfacture'] 		= $_POST['modal-majprestation-paramfacture'];
		$data['paramnumlig']     	= $_POST['modal-majprestation-paramnumlig'];
		$data['fli_descriptif']     = $_POST['modal-majprestation-fli_descriptif'];
		$data['fli_quantite']       = $_POST['modal-majprestation-fli_quantite']; 
		$data['fli_puttc']          = $_POST['modal-majprestation-fli_puttc'];    

		$retour = Factures::majPrestation($pdo, $data);

		// pour retour vers le séjour
		$_POST['paramkey'] 	 = $_POST['modal-majprestation-paramsejour'];
		$_POST['paramname']  = $_POST['modal-majprestation-paramsejourname'];
		$_POST['paramindex'] = $_POST['modal-majprestation-paramindex'];
	}


	// Suppression d'un participant
	
	if (isset( $_POST['modal-supclient-paramsejour'])) {
	
		$data['paramclient'] = $_POST['modal-supclient-paramclient'];
		$data['paramsejour'] = $_POST['modal-supclient-paramsejour'];

		SejoursClients::Del($pdo, $data);

		// pour retour vers le séjour
		$_POST['paramkey'] 	= $_POST['modal-supclient-paramsejour'];
		$_POST['paramname'] = $_POST['modal-supclient-paramsejourname'];
	}
	
	
	// Suppression d'une prestation
	
	if (isset( $_POST['modal-supprestation-paramsejour'])) {
	
		$data['paramfacture'] 	= $_POST['modal-supprestation-paramfacture'];
		$data['paramligne']		= $_POST['modal-supprestation-paramligne'];
 		
		$retour = Factures::delPrestation($pdo, $data);

		if ($retour == '0') {

			$message = 'La facture doit comporter une ligne';
		}
		
		// pour retour vers le séjour
		$_POST['paramkey'] 	= $_POST['modal-supprestation-paramsejour'];
		$_POST['paramname'] = $_POST['modal-supprestation-paramsejourname'];
		$_POST['paramindex'] = $_POST['modal-supprestation-paramindex'];
	}
	
	
	// Acompte
	
	if (isset( $_POST['saisieacompte-paramsejour'])) {
	
		$data['paramfacture'] 	= $_POST['saisieacompte-paramfacture'];
		$data['reg_mode']     	= $_POST['saisieacomptereg_mode'];   
		$data['reg_libelle']    = $_POST['saisieacomptereg_libelle'];
		$data['reg_montant']    = $_POST['saisieacomptereg_montant'];
		$data['reg_date']     	= $_POST['saisieacomptereg_date'];   

		$retour = Reglements::Add($pdo, $data);

		if ($retour != '1') {

			$message = "Données incorrectes (date ou montant)";
		}
		else {
			unset($data);
			$data['paramclient'] 	= $_POST['saisieacompte-paramclient'];
			$data['paramsejour'] 	= $_POST['saisieacompte-paramsejour'];
			$data['scl_etat'] 		= '1';	// client confirmé
			
			SejoursClients::setEtat($pdo, $data);
		}
		
		// pour retour vers le séjour
		$_POST['paramkey'] 	= $_POST['saisieacompte-paramsejour'];
		$_POST['paramname'] = $_POST['saisieacompte-paramsejourname'];
		$_POST['paramindex'] = $_POST['saisieacompte-paramindex'];
	}
	
	// Edition d'une facture
	
	if (isset( $_POST['editfacture-paramsejour'])) {
	
// 		header('Location: index.php?action=facture_prn&paramfacture='.$_POST['editfacture-paramfacture'].'&page=sejour_clients');
// 		window.open( __CONTROLLERS_ACTION__.'a_facture_prn.php?paramfacture='.$_POST['editfacture-paramfacture']);

		Factures::Close($pdo, $_POST['editfacture-paramfacture']);

		// pour édition	
		$oSmarty->assign( 'editfacture', $_POST['editfacture-paramfacture'] );
		
		// pour rechargement du séjour
		$_POST['paramkey'] 	= $_POST['editfacture-paramsejour'];
		$_POST['paramname'] = $_POST['editfacture-paramsejourname'];
		$_POST['paramindex'] = $_POST['editfacture-paramindex'];
	}
	
	// Edition des commandes soldées

	if (isset( $_POST['editallfactures-paramsejour'])) {
	
		$tabFact = Factures::getAllSolded($pdo, $_POST['editallfactures-paramsejour']);
		$listEdit = [];
		
		foreach ($tabFact as $facture) {
			
			Factures::Close($pdo, $facture['fac_id']);
			$listEdit[] = $facture['fac_id'];
		}

		// pour édition	
		$oSmarty->assign( 'editallfactures', true );
		$oSmarty->assign( 'listEdit', implode(';', $listEdit) );
		
		// pour rechargement du séjour
		$_POST['paramkey'] 	= $_POST['editallfactures-paramsejour'];
		$_POST['paramname'] = $_POST['editallfactures-paramsejourname'];
		$_POST['paramindex'] = $_POST['editallfactures-paramindex'];
	}
	
	$oSmarty->assign( 'ctrlMessage', $message );
	
?>