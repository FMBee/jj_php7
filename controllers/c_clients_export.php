<?php

	$chemin = 'clientsJJ.csv';
	$delimiteur = ';'; // Pour une tabulation, utiliser $delimiteur = "t";
	
	$fichier_csv = fopen($chemin, 'w+');
	$lignes = Clients::getAllCsv($pdo);
	
	// Si votre fichier a vocation a être importé dans Excel,
	fprintf($fichier_csv, chr(0xEF).chr(0xBB).chr(0xBF));
	
	fprintf($fichier_csv,'"Nom";"Prenom";"Rue";"Complement";"CP";"Ville";"Pays";"Tel fixe";"Portable";"Mail";"Naissance"'.chr(13));
	
	foreach($lignes as $ligne){
	
// 		foreach ($ligne as &$valeur) {
			
// 			$valeur = utf8_decode($valeur);
// 		}
		fputcsv($fichier_csv, $ligne, $delimiteur);
	}
	
	fclose($fichier_csv);

?>