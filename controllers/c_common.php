<?php

	// Initialisations communes

	$oSmarty->assign('civilites', Clients::getCivilites($pdo));
	
	$oSmarty->assign('sexes', array( 
									array('id' => '0', 'code' => 'Femme'),
									array('id' => '1', 'code' => 'Homme'),
									array('id' => '2', 'code' => '-')
									)
					);
	
	$oSmarty->assign('etats', array(
									array('id' => '0', 'code' => 'Préinscrit'),
									array('id' => '1', 'code' => 'Confirmé'),
									array('id' => '2', 'code' => 'Annulé'),
									array('id' => '3', 'code' => 'Reporté')
									)
					);
	$oSmarty->assign('etatsVal', array(
									 '0'=> 'Préinscrit',
									 '1'=> 'Confirmé',
									 '2'=> 'Annulé',
									 '3'=> 'Reporté')
					);

?>