-- --------------------------------------------------------

--
-- Structure de la vue `app_parameters_details`
--
DROP TABLE IF EXISTS `app_parameters_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `app_parameters_details` AS select `app_parameters`.`prt_id` AS `prt_id`,`app_parameters`.`prt_name` AS `prt_name`,`app_parameters`.`prt_value` AS `prt_value`,`app_parameters`.`prt_apt_id` AS `prt_apt_id`,`app_parameters_types`.`apt_id` AS `apt_id`,`app_parameters_types`.`apt_name` AS `apt_name`,`app_parameters_types`.`apt_cast_type` AS `apt_cast_type` from (`app_parameters` join `app_parameters_types` on((`app_parameters`.`prt_apt_id` = `app_parameters_types`.`apt_id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `app_translate_details`
--
DROP TABLE IF EXISTS `app_translate_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `app_translate_details` AS select `app_translate`.`atr_table` AS `atr_table`,`app_translate`.`atr_data_field` AS `atr_data_field`,`app_translate_lines`.`atl_data_id` AS `atl_data_id`,`app_translate_lines`.`atl_lang` AS `atl_lang`,`app_translate_lines`.`atl_data_lib` AS `atl_data_lib` from (`app_translate` join `app_translate_lines` on((`app_translate`.`atr_id` = `app_translate_lines`.`atl_atr_id`))) order by `app_translate`.`atr_table`,`app_translate`.`atr_data_field`,`app_translate_lines`.`atl_data_id`,`app_translate_lines`.`atl_lang`;

-- --------------------------------------------------------

--
-- Structure de la vue `factures_details`
--
DROP TABLE IF EXISTS `factures_details`;

CREATE ALGORITHM=UNDEFINED  SQL SECURITY DEFINER VIEW `factures_details` 
AS select `factures`.`fac_id` AS `fac_id`,`factures`.`fac_cli_id` AS `fac_cli_id`,`factures`.`fac_numero` AS `fac_numero`,
`factures`.`fac_totalht` AS `fac_totalht`,`factures`.`fac_arrhes` AS `fac_arrhes`,`factures`.`fac_totalttc` AS `fac_totalttc`,
`factures`.`fac_totaltva` AS `fac_totaltva`,`factures`.`fac_civ_code` AS `fac_civ_code`,`factures`.`fac_nom` AS `fac_nom`,
`factures`.`fac_prenom` AS `fac_prenom`,`factures`.`fac_rue` AS `fac_rue`,`factures`.`fac_complement` AS `fac_complement`,
`factures`.`fac_codepostal` AS `fac_codepostal`,`factures`.`fac_ville` AS `fac_ville`,`factures`.`fac_pays` AS `fac_pays`,
`factures`.`fac_cptcoll` AS `fac_cptcoll`,`factures`.`fac_totalregle` AS `fac_totalregle`,`factures`.`fac_etat` AS `fac_etat`,
`factures`.`fac_adrponct` AS `fac_adrponct`,`factures`.`fac_date` AS `fac_date`,`factures`.`fac_flag` AS `fac_flag`,
`clients`.`cli_id` AS `cli_id`,`clients`.`cli_civ_code` AS `cli_civ_code`,`clients`.`cli_nom` AS `cli_nom`,
`clients`.`cli_prenom` AS `cli_prenom`,`clients`.`cli_rue` AS `cli_rue`,`clients`.`cli_complement` AS `cli_complement`,
`clients`.`cli_codepostal` AS `cli_codepostal`,`clients`.`cli_ville` AS `cli_ville`,`clients`.`cli_pays` AS `cli_pays`,
`clients`.`cli_telfixe` AS `cli_telfixe`,`clients`.`cli_portable` AS `cli_portable`,`clients`.`cli_email` AS `cli_email`,
`clients`.`cli_exotva` AS `cli_exotva`,`clients`.`cli_cptcoll` AS `cli_cptcoll`,`clients`.`cli_sexe` AS `cli_sexe`,
`clients`.`cli_datenais` AS `cli_datenais`,`clients`.`cli_flag` AS `cli_flag`,`sejours_clients`.`scl_sej_id` AS `scl_sej_id`,
`sejours_clients`.`scl_cli_id` AS `scl_cli_id`,`sejours_clients`.`scl_etat` AS `scl_etat`,
`sejours_clients`.`scl_commentaire` AS `scl_commentaire`,`sejours_clients`.`scl_fac_id` AS `scl_fac_id`,
`sejours_clients`.`scl_saisie` AS `scl_saisie`,`sejours_clients`.`scl_flag` AS `scl_flag`,`sejours`.`sej_id` AS `sej_id`,
`sejours`.`sej_libelle` AS `sej_libelle`,`sejours`.`sej_nbmax` AS `sej_nbmax`,`sejours`.`sej_complet` AS `sej_complet`,
`sejours`.`sej_debut` AS `sej_debut`,`sejours`.`sej_fin` AS `sej_fin`,`sejours`.`sej_flag` AS `sej_flag` 
from (((`factures` 
	join `clients` on((`factures`.`fac_cli_id` = `clients`.`cli_id`))) 
join `sejours_clients` on((`factures`.`fac_id` = `sejours_clients`.`scl_fac_id`))) 
join `sejours` on((`sejours`.`sej_id` = `sejours_clients`.`scl_sej_id`)));

-- --------------------------------------------------------
--
-- Structure de la vue `prestations_details`
--
DROP TABLE IF EXISTS `prestations_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `prestations_details` 
AS select `prestations`.`pre_id` AS `pre_id`,`prestations`.`pre_pty_code` AS `pre_pty_code`,
`prestations`.`pre_libelle` AS `pre_libelle`,`prestations`.`pre_descriptif` AS `pre_descriptif`,
`prestations`.`pre_comptetva` AS `pre_comptetva`,`prestations`.`pre_tauxtva` AS `pre_tauxtva`,
`prestations`.`pre_compteht` AS `pre_compteht`,`prestations`.`pre_puht` AS `pre_puht`,
`prestations`.`pre_puttc` AS `pre_puttc`,`prestations`.`pre_prixttc` AS `pre_prixttc`,
`prestations`.`pre_flag` AS `pre_flag`,`prestations_types`.`pty_code` AS `pty_code`,
`prestations_types`.`pty_libelle` AS `pty_libelle` 
from (`prestations` 
	join `prestations_types` on((`prestations`.`pre_pty_code` = `prestations_types`.`pty_code`)));

--
-- Structure de la vue `factures_lignes_details`
--
DROP TABLE IF EXISTS `factures_lignes_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `factures_lignes_details` 
AS select `factures_lignes`.`fli_fac_id` AS `fli_fac_id`,`factures_lignes`.`fli_numlig` AS `fli_numlig`,
`factures_lignes`.`fli_pre_id` AS `fli_pre_id`,`factures_lignes`.`fli_descriptif` AS `fli_descriptif`,
`factures_lignes`.`fli_quantite` AS `fli_quantite`,`factures_lignes`.`fli_prixttc` AS `fli_prixttc`,
`factures_lignes`.`fli_puht` AS `fli_puht`,`factures_lignes`.`fli_totalht` AS `fli_totalht`,
`factures_lignes`.`fli_tauxtva` AS `fli_tauxtva`,`factures_lignes`.`fli_totalttc` AS `fli_totalttc`,
`factures_lignes`.`fli_flag` AS `fli_flag`,`factures_details`.`fac_id` AS `fac_id`,
`factures_details`.`fac_cli_id` AS `fac_cli_id`,`factures_details`.`fac_numero` AS `fac_numero`,
`factures_details`.`fac_totalht` AS `fac_totalht`,`factures_details`.`fac_arrhes` AS `fac_arrhes`,
`factures_details`.`fac_totalttc` AS `fac_totalttc`,`factures_details`.`fac_totaltva` AS `fac_totaltva`,
`factures_details`.`fac_civ_code` AS `fac_civ_code`,`factures_details`.`fac_nom` AS `fac_nom`,
`factures_details`.`fac_prenom` AS `fac_prenom`,`factures_details`.`fac_rue` AS `fac_rue`,
`factures_details`.`fac_complement` AS `fac_complement`,`factures_details`.`fac_codepostal` AS `fac_codepostal`,
`factures_details`.`fac_ville` AS `fac_ville`,`factures_details`.`fac_pays` AS `fac_pays`,
`factures_details`.`fac_cptcoll` AS `fac_cptcoll`,`factures_details`.`fac_totalregle` AS `fac_totalregle`,
`factures_details`.`fac_etat` AS `fac_etat`,`factures_details`.`fac_adrponct` AS `fac_adrponct`,
`factures_details`.`fac_date` AS `fac_date`,`factures_details`.`fac_flag` AS `fac_flag`,
`factures_details`.`cli_id` AS `cli_id`,`factures_details`.`cli_civ_code` AS `cli_civ_code`,
`factures_details`.`cli_nom` AS `cli_nom`,`factures_details`.`cli_prenom` AS `cli_prenom`,
`factures_details`.`cli_rue` AS `cli_rue`,`factures_details`.`cli_complement` AS `cli_complement`,
`factures_details`.`cli_codepostal` AS `cli_codepostal`,`factures_details`.`cli_ville` AS `cli_ville`,
`factures_details`.`cli_pays` AS `cli_pays`,`factures_details`.`cli_telfixe` AS `cli_telfixe`,
`factures_details`.`cli_portable` AS `cli_portable`,`factures_details`.`cli_email` AS `cli_email`,
`factures_details`.`cli_exotva` AS `cli_exotva`,`factures_details`.`cli_cptcoll` AS `cli_cptcoll`,
`factures_details`.`cli_sexe` AS `cli_sexe`,`factures_details`.`cli_datenais` AS `cli_datenais`,
`factures_details`.`cli_flag` AS `cli_flag`,`factures_details`.`scl_sej_id` AS `scl_sej_id`,
`factures_details`.`scl_cli_id` AS `scl_cli_id`,`factures_details`.`scl_etat` AS `scl_etat`,
`factures_details`.`scl_commentaire` AS `scl_commentaire`,`factures_details`.`scl_fac_id` AS `scl_fac_id`,
`factures_details`.`scl_saisie` AS `scl_saisie`,`factures_details`.`scl_flag` AS `scl_flag`,
`factures_details`.`sej_id` AS `sej_id`,`factures_details`.`sej_libelle` AS `sej_libelle`,
`factures_details`.`sej_nbmax` AS `sej_nbmax`,`factures_details`.`sej_complet` AS `sej_complet`,
`factures_details`.`sej_debut` AS `sej_debut`,`factures_details`.`sej_fin` AS `sej_fin`,
`factures_details`.`sej_flag` AS `sej_flag`,`prestations_details`.`pre_id` AS `pre_id`,
`prestations_details`.`pre_pty_code` AS `pre_pty_code`,`prestations_details`.`pre_libelle` AS `pre_libelle`,
`prestations_details`.`pre_descriptif` AS `pre_descriptif`,`prestations_details`.`pre_comptetva` AS `pre_comptetva`,
`prestations_details`.`pre_tauxtva` AS `pre_tauxtva`,`prestations_details`.`pre_compteht` AS `pre_compteht`,
`prestations_details`.`pre_puht` AS `pre_puht`,`prestations_details`.`pre_puttc` AS `pre_puttc`,
`prestations_details`.`pre_prixttc` AS `pre_prixttc`,`prestations_details`.`pre_flag` AS `pre_flag`,
`prestations_details`.`pty_code` AS `pty_code`,`prestations_details`.`pty_libelle` AS `pty_libelle` 
from ((`factures_lignes` 
	join `factures_details` on((`factures_details`.`fac_id` = `factures_lignes`.`fli_fac_id`))) 
join `prestations_details` on((`prestations_details`.`pre_id` = `factures_lignes`.`fli_pre_id`)));

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Structure de la vue `reglements_details`
--
DROP TABLE IF EXISTS `reglements_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `reglements_details` AS select `reglements`.`reg_id` AS `reg_id`,`reglements`.`reg_mode` AS `reg_mode`,`reglements`.`reg_libelle` AS `reg_libelle`,`reglements`.`reg_montant` AS `reg_montant`,`reglements`.`reg_partiel` AS `reg_partiel`,`reglements`.`reg_etat` AS `reg_etat`,`reglements`.`reg_remise` AS `reg_remise`,`reglements`.`reg_date` AS `reg_date`,`reglements`.`reg_flag` AS `reg_flag`,`reglements_lignes`.`rli_id` AS `rli_id`,`reglements_lignes`.`rli_reg_id` AS `rli_reg_id`,`reglements_lignes`.`rli_fac_id` AS `rli_fac_id`,`reglements_lignes`.`rli_montant` AS `rli_montant`,`reglements_lignes`.`rli_pourcent` AS `rli_pourcent`,`reglements_lignes`.`rli_flag` AS `rli_flag`,`factures`.`fac_id` AS `fac_id`,`factures`.`fac_cli_id` AS `fac_cli_id`,`factures`.`fac_numero` AS `fac_numero`,`factures`.`fac_totalht` AS `fac_totalht`,`factures`.`fac_arrhes` AS `fac_arrhes`,`factures`.`fac_totalttc` AS `fac_totalttc`,`factures`.`fac_totaltva` AS `fac_totaltva`,`factures`.`fac_civ_code` AS `fac_civ_code`,`factures`.`fac_nom` AS `fac_nom`,`factures`.`fac_prenom` AS `fac_prenom`,`factures`.`fac_rue` AS `fac_rue`,`factures`.`fac_complement` AS `fac_complement`,`factures`.`fac_codepostal` AS `fac_codepostal`,`factures`.`fac_ville` AS `fac_ville`,`factures`.`fac_pays` AS `fac_pays`,`factures`.`fac_cptcoll` AS `fac_cptcoll`,`factures`.`fac_totalregle` AS `fac_totalregle`,`factures`.`fac_etat` AS `fac_etat`,`factures`.`fac_adrponct` AS `fac_adrponct`,`factures`.`fac_date` AS `fac_date`,`factures`.`fac_flag` AS `fac_flag` from ((`reglements` join `reglements_lignes` on((`reglements`.`reg_id` = `reglements_lignes`.`rli_reg_id`))) join `factures` on((`reglements_lignes`.`rli_fac_id` = `factures`.`fac_id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `sejours_clients_details`
--
DROP TABLE IF EXISTS `sejours_clients_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sejours_clients_details` AS select `sejours_clients`.`scl_sej_id` AS `scl_sej_id`,`sejours_clients`.`scl_cli_id` AS `scl_cli_id`,`sejours_clients`.`scl_etat` AS `scl_etat`,`sejours_clients`.`scl_commentaire` AS `scl_commentaire`,`sejours_clients`.`scl_fac_id` AS `scl_fac_id`,`sejours_clients`.`scl_saisie` AS `scl_saisie`,`sejours_clients`.`scl_flag` AS `scl_flag`,`clients`.`cli_id` AS `cli_id`,`clients`.`cli_civ_code` AS `cli_civ_code`,`clients`.`cli_nom` AS `cli_nom`,`clients`.`cli_prenom` AS `cli_prenom`,`clients`.`cli_rue` AS `cli_rue`,`clients`.`cli_complement` AS `cli_complement`,`clients`.`cli_codepostal` AS `cli_codepostal`,`clients`.`cli_ville` AS `cli_ville`,`clients`.`cli_pays` AS `cli_pays`,`clients`.`cli_telfixe` AS `cli_telfixe`,`clients`.`cli_portable` AS `cli_portable`,`clients`.`cli_email` AS `cli_email`,`clients`.`cli_exotva` AS `cli_exotva`,`clients`.`cli_cptcoll` AS `cli_cptcoll`,`clients`.`cli_sexe` AS `cli_sexe`,`clients`.`cli_datenais` AS `cli_datenais`,`clients`.`cli_flag` AS `cli_flag`,`sejours`.`sej_id` AS `sej_id`,`sejours`.`sej_libelle` AS `sej_libelle`,`sejours`.`sej_nbmax` AS `sej_nbmax`,`sejours`.`sej_complet` AS `sej_complet`,`sejours`.`sej_debut` AS `sej_debut`,`sejours`.`sej_fin` AS `sej_fin`,`sejours`.`sej_flag` AS `sej_flag`,`factures`.`fac_id` AS `fac_id`,`factures`.`fac_cli_id` AS `fac_cli_id`,`factures`.`fac_numero` AS `fac_numero`,`factures`.`fac_totalht` AS `fac_totalht`,`factures`.`fac_arrhes` AS `fac_arrhes`,`factures`.`fac_totalttc` AS `fac_totalttc`,`factures`.`fac_totaltva` AS `fac_totaltva`,`factures`.`fac_civ_code` AS `fac_civ_code`,`factures`.`fac_nom` AS `fac_nom`,`factures`.`fac_prenom` AS `fac_prenom`,`factures`.`fac_rue` AS `fac_rue`,`factures`.`fac_complement` AS `fac_complement`,`factures`.`fac_codepostal` AS `fac_codepostal`,`factures`.`fac_ville` AS `fac_ville`,`factures`.`fac_pays` AS `fac_pays`,`factures`.`fac_cptcoll` AS `fac_cptcoll`,`factures`.`fac_totalregle` AS `fac_totalregle`,`factures`.`fac_etat` AS `fac_etat`,`factures`.`fac_adrponct` AS `fac_adrponct`,`factures`.`fac_date` AS `fac_date`,`factures`.`fac_flag` AS `fac_flag` from (((`sejours_clients` join `clients` on((`sejours_clients`.`scl_cli_id` = `clients`.`cli_id`))) join `sejours` on((`sejours_clients`.`scl_sej_id` = `sejours`.`sej_id`))) left join `factures` on((`sejours_clients`.`scl_fac_id` = `factures`.`fac_id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `sejours_clients_stat`
--
DROP TABLE IF EXISTS `sejours_clients_stat`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sejours_clients_stat` AS select `sejours`.`sej_id` AS `sej_id`,`sejours`.`sej_libelle` AS `sej_libelle`,`sejours`.`sej_nbmax` AS `sej_nbmax`,`sejours`.`sej_complet` AS `sej_complet`,`sejours`.`sej_debut` AS `sej_debut`,`sejours`.`sej_fin` AS `sej_fin`,`sejours`.`sej_flag` AS `sej_flag`,`sejours_clients_stat_1`.`scl_sej_id` AS `scl_sej_id`,`sejours_clients_stat_1`.`scl_nb_preinscrit` AS `scl_nb_preinscrit`,`sejours_clients_stat_1`.`scl_nb_confirme` AS `scl_nb_confirme`,`sejours_clients_stat_1`.`scl_nb_annule` AS `scl_nb_annule`,`sejours_clients_stat_1`.`scl_nb_retarde` AS `scl_nb_retarde`,`sejours_clients_stat_2`.`scl_sej_id_2` AS `scl_sej_id_2`,`sejours_clients_stat_2`.`scl_nb_soins` AS `scl_nb_soins`,`sejours_clients_stat_2`.`scl_nb_sejours` AS `scl_nb_sejours`,`sejours_clients_stat_2`.`scl_nb_repas` AS `scl_nb_repas`,`sejours_clients_stat_2`.`scl_nb_produits` AS `scl_nb_produits`,`sejours_clients_stat_2`.`scl_nb_hotels` AS `scl_nb_hotels`,`sejours_clients_stat_2`.`scl_nb_locations` AS `scl_nb_locations` from ((`sejours` left join `sejours_clients_stat_1` on((`sejours`.`sej_id` = `sejours_clients_stat_1`.`scl_sej_id`))) left join `sejours_clients_stat_2` on((`sejours`.`sej_id` = `sejours_clients_stat_2`.`scl_sej_id_2`)));

-- --------------------------------------------------------

--
-- Structure de la vue `sejours_clients_stat_1`
--
DROP TABLE IF EXISTS `sejours_clients_stat_1`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sejours_clients_stat_1` AS select `t1`.`scl_sej_id` AS `scl_sej_id`,sum(if((`t1`.`scl_etat` = 0),1,NULL)) AS `scl_nb_preinscrit`,sum(if((`t1`.`scl_etat` = 1),1,NULL)) AS `scl_nb_confirme`,sum(if((`t1`.`scl_etat` = 2),1,NULL)) AS `scl_nb_annule`,sum(if((`t1`.`scl_etat` = 3),1,NULL)) AS `scl_nb_retarde` from `sejours_clients` `t1` group by `t1`.`scl_sej_id`;

-- --------------------------------------------------------

--
-- Structure de la vue `sejours_clients_stat_2`
--
DROP TABLE IF EXISTS `sejours_clients_stat_2`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sejours_clients_stat_2` AS select `t2`.`scl_sej_id` AS `scl_sej_id_2`,sum(if((`prestations_types`.`pty_code` = 'SOINS'),`factures_lignes`.`fli_quantite`,NULL)) AS `scl_nb_soins`,sum(if((`prestations_types`.`pty_code` = 'SEJOUR'),`factures_lignes`.`fli_quantite`,NULL)) AS `scl_nb_sejours`,sum(if((`prestations_types`.`pty_code` = 'REPAS'),`factures_lignes`.`fli_quantite`,NULL)) AS `scl_nb_repas`,sum(if((`prestations_types`.`pty_code` = 'PRODUIT'),`factures_lignes`.`fli_quantite`,NULL)) AS `scl_nb_produits`,sum(if((`prestations_types`.`pty_code` = 'HOTEL'),`factures_lignes`.`fli_quantite`,NULL)) AS `scl_nb_hotels`,sum(if((`prestations_types`.`pty_code` = 'LOCATION'),`factures_lignes`.`fli_quantite`,NULL)) AS `scl_nb_locations` from (((`sejours_clients` `t2` join `factures_lignes` on((`t2`.`scl_fac_id` = `factures_lignes`.`fli_fac_id`))) join `prestations` on((`factures_lignes`.`fli_pre_id` = `prestations`.`pre_id`))) join `prestations_types` on((`prestations`.`pre_pty_code` = `prestations_types`.`pty_code`))) group by `t2`.`scl_sej_id`;

-- --------------------------------------------------------

--
-- Structure de la vue `sejours_lignes_details`
--
DROP TABLE IF EXISTS `sejours_lignes_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sejours_lignes_details` AS select `sejours_clients`.`scl_sej_id` AS `scl_sej_id`,`sejours_clients`.`scl_cli_id` AS `scl_cli_id`,`sejours_clients`.`scl_etat` AS `scl_etat`,`sejours_clients`.`scl_commentaire` AS `scl_commentaire`,`sejours_clients`.`scl_fac_id` AS `scl_fac_id`,`sejours_clients`.`scl_saisie` AS `scl_saisie`,`sejours_clients`.`scl_flag` AS `scl_flag`,`factures_lignes_details`.`fli_fac_id` AS `fli_fac_id`,`factures_lignes_details`.`fli_numlig` AS `fli_numlig`,`factures_lignes_details`.`fli_pre_id` AS `fli_pre_id`,`factures_lignes_details`.`fli_descriptif` AS `fli_descriptif`,`factures_lignes_details`.`fli_quantite` AS `fli_quantite`,`factures_lignes_details`.`fli_prixttc` AS `fli_prixttc`,`factures_lignes_details`.`fli_puht` AS `fli_puht`,`factures_lignes_details`.`fli_totalht` AS `fli_totalht`,`factures_lignes_details`.`fli_tauxtva` AS `fli_tauxtva`,`factures_lignes_details`.`fli_totalttc` AS `fli_totalttc`,`factures_lignes_details`.`fli_flag` AS `fli_flag`,`factures_lignes_details`.`fac_id` AS `fac_id`,`factures_lignes_details`.`fac_cli_id` AS `fac_cli_id`,`factures_lignes_details`.`fac_numero` AS `fac_numero`,`factures_lignes_details`.`fac_totalht` AS `fac_totalht`,`factures_lignes_details`.`fac_arrhes` AS `fac_arrhes`,`factures_lignes_details`.`fac_totalttc` AS `fac_totalttc`,`factures_lignes_details`.`fac_totaltva` AS `fac_totaltva`,`factures_lignes_details`.`fac_civ_code` AS `fac_civ_code`,`factures_lignes_details`.`fac_nom` AS `fac_nom`,`factures_lignes_details`.`fac_prenom` AS `fac_prenom`,`factures_lignes_details`.`fac_rue` AS `fac_rue`,`factures_lignes_details`.`fac_complement` AS `fac_complement`,`factures_lignes_details`.`fac_codepostal` AS `fac_codepostal`,`factures_lignes_details`.`fac_ville` AS `fac_ville`,`factures_lignes_details`.`fac_pays` AS `fac_pays`,`factures_lignes_details`.`fac_cptcoll` AS `fac_cptcoll`,`factures_lignes_details`.`fac_totalregle` AS `fac_totalregle`,`factures_lignes_details`.`fac_etat` AS `fac_etat`,`factures_lignes_details`.`fac_adrponct` AS `fac_adrponct`,`factures_lignes_details`.`fac_date` AS `fac_date`,`factures_lignes_details`.`fac_flag` AS `fac_flag`,`factures_lignes_details`.`cli_id` AS `cli_id`,`factures_lignes_details`.`cli_civ_code` AS `cli_civ_code`,`factures_lignes_details`.`cli_nom` AS `cli_nom`,`factures_lignes_details`.`cli_prenom` AS `cli_prenom`,`factures_lignes_details`.`cli_rue` AS `cli_rue`,`factures_lignes_details`.`cli_complement` AS `cli_complement`,`factures_lignes_details`.`cli_codepostal` AS `cli_codepostal`,`factures_lignes_details`.`cli_ville` AS `cli_ville`,`factures_lignes_details`.`cli_pays` AS `cli_pays`,`factures_lignes_details`.`cli_telfixe` AS `cli_telfixe`,`factures_lignes_details`.`cli_portable` AS `cli_portable`,`factures_lignes_details`.`cli_email` AS `cli_email`,`factures_lignes_details`.`cli_exotva` AS `cli_exotva`,`factures_lignes_details`.`cli_cptcoll` AS `cli_cptcoll`,`factures_lignes_details`.`cli_sexe` AS `cli_sexe`,`factures_lignes_details`.`cli_datenais` AS `cli_datenais`,`factures_lignes_details`.`cli_flag` AS `cli_flag`,`factures_lignes_details`.`pre_id` AS `pre_id`,`factures_lignes_details`.`pre_pty_code` AS `pre_pty_code`,`factures_lignes_details`.`pre_libelle` AS `pre_libelle`,`factures_lignes_details`.`pre_descriptif` AS `pre_descriptif`,`factures_lignes_details`.`pre_comptetva` AS `pre_comptetva`,`factures_lignes_details`.`pre_tauxtva` AS `pre_tauxtva`,`factures_lignes_details`.`pre_compteht` AS `pre_compteht`,`factures_lignes_details`.`pre_puht` AS `pre_puht`,`factures_lignes_details`.`pre_puttc` AS `pre_puttc`,`factures_lignes_details`.`pre_prixttc` AS `pre_prixttc`,`factures_lignes_details`.`pre_flag` AS `pre_flag`,`factures_lignes_details`.`pty_code` AS `pty_code`,`factures_lignes_details`.`pty_libelle` AS `pty_libelle` from (`sejours_clients` join `factures_lignes_details` on((`sejours_clients`.`scl_fac_id` = `factures_lignes_details`.`fac_id`)));

-- --------------------------------------------------------

--
-- Structure de la vue `users_details`
--
DROP TABLE IF EXISTS `users_details`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `users_details` AS select `users`.`usr_id` AS `usr_id`,`users`.`usr_first_name` AS `usr_first_name`,`users`.`usr_last_name` AS `usr_last_name`,`users`.`usr_login` AS `usr_login`,`users`.`usr_password` AS `usr_password`,`users`.`usr_mail` AS `usr_mail`,`users`.`usr_pro_id` AS `usr_pro_id`,`users`.`usr_lang` AS `usr_lang`,`users`.`usr_image_path` AS `usr_image_path`,`users`.`usr_flag` AS `usr_flag`,`users`.`usr_in_date` AS `usr_in_date`,`users`.`usr_out_date` AS `usr_out_date`,`users_profiles`.`pro_id` AS `pro_id`,`users_profiles`.`pro_name` AS `pro_name`,`users_profiles`.`pro_access` AS `pro_access`,`users_profiles`.`pro_flag` AS `pro_flag` from (`users` join `users_profiles` on((`users`.`usr_pro_id` = `users_profiles`.`pro_id`)));

--