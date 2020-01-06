<?php


	if ( isset( $_GET['supp_id'] )) {

		Prestations::delOne($pdo, $_GET['supp_id']);
	}
	else {
debug($_POST);
// 		if (! isset( $_POST['pre_prixttc'] ) || $_POST['pre_prixttc'] != '1' )		// checkbox indefini si 0
// 		{
// 			$_POST['pre_prixttc'] = '0';
// 			$_POST['pre_puht'] = '0';
// 		}
		$_POST['pre_puttc'] = floatval( $_POST['pre_puht'] ) * ( ( floatval( $_POST['pre_tauxtva']) + 100 ) / 100 );

		$rq = Prestations::majOrAdd($pdo, $_POST);
debug($_POST);debug($rq);
	}

?>