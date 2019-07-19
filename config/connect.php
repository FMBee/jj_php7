<?php 
	// Se connecter à la base 
	try {
		$pdo = new PDO('mysql:host=localhost;dbname=joli_jeune', 'jj_root', 'KZBbVzWjaTbw8y6r');
		$pdo->query("SET NAMES UTF8");
		
	} catch (Exception $e) {
		echo "Problème de connexion à la base de donnée...";
		die(print_r($e));
	}
