<?php

class Parametres 
{
	public static function getOne($pdo, $id)
	{
		$req = $pdo->prepare('SELECT * FROM parametres WHERE par_id = ?');
	
		$req->execute(array($id));
		$data = $req->fetch(PDO::FETCH_ASSOC);
	
		return ($data);
	}
	
	public static function MAJ($pdo, $data)
		{
		$req = $pdo->prepare("CALL parametres_maj(".substr(str_repeat('?,', count($data)), 0, -1).")");
	
		$maj = $req->execute(array(	
									$data['paramkey'],
									$data['par_societe'],
									$data['par_rue'],
									$data['par_complement'],
									$data['par_codepostal'],
									$data['par_ville'],
									$data['par_pays'],
									$data['par_email'],
									$data['par_siret'],
									$data['par_codenaf'],
									$data['par_responsable'],
									$data['par_CodeJournalVente'],
									$data['par_CodeJournalBanque'],
									$data['par_telfixe'],
									$data['par_portable'],
									$data['par_iban'],
									$data['par_TvaIntracom'],
									$data['par_DebutListeSejours'],
									$data['par_NbJoursHisto']
									));
		return ($maj);
		}
// 		par_id                             int(11),
// 		par_societe                        varchar(255),
// 		par_rue                            varchar(255),
// 		par_complement                     varchar(255),
// 		par_codepostal                     varchar(20),
// 		par_ville                          varchar(255),
// 		par_pays                           varchar(255),
// 		par_email                          varchar(150),
// 		par_siret                          varchar(255),
// 		par_codenaf                        varchar(10),
// 		par_responsable                    varchar(255),
// 		par_CodeJournalVente               varchar(20),
// 		par_CodeJournalBanque              varchar(20),
// 		par_telfixe                        varchar(20),
// 		par_portable                       varchar(20),
// 		par_iban                           varchar(34),
// 		par_TvaIntracom                    varchar(16),
// 		par_ProchainNumeroFacture          int(11),
// 		par_ProchainLotComptabilite        int(11),
// 		par_FactureOptionDate              int(11),
// 		par_ComptabiliteLongueurCompte     int(11)  		
}
	
?>