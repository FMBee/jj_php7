<?php

	$_POST['par_NbJoursHisto'] = intval($_POST['par_NbJoursHisto']);	// 0 si invalide

	Parametres::MAJ($pdo, $_POST);
	
?>