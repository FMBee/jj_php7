<?php

	session_start();
	require('x_common.inc.php');
	
	require_once(__MODELS.'m_clients.php');

	$seek = "%".trim($_GET['query'])."%";
	$query = ' AND (cli_nom LIKE ?';
	$values = [$seek];
	
	
	if ( $_GET['prenom'] == 'true' ) {

		$query .= ' OR cli_prenom LIKE ?';
		$values[] = $seek;	
	}
	if ( $_GET['ville'] == 'true' ) {

		$query .= ' OR cli_ville LIKE ?';
		$values[] = $seek;	
	}
	if ( $_GET['cp'] == 'true' ) {

		$query .= ' OR cli_codepostal LIKE ?';
		$values[] = $seek;	
	}
	$query .= ')';

	$liste = Clients::searchList($pdo, $query, $values);

	$result = [];
	foreach ($liste as $element) {
		
		$result[] = array( "value" => 	$element['cli_nom'].' '.
										$element['cli_prenom'].' - '.
										$element['cli_codepostal'].' '.
										$element['cli_ville'],
							"data" => $element['cli_id'] );
	}
	echo json_encode( 
			array( 	"query" => "Unit",
					"suggestions" => $result )
		);
?>