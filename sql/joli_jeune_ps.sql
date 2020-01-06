-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: joli_jeune
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

--
-- Dumping routines for database 'joli_jeune'
--
/*!50003 DROP PROCEDURE IF EXISTS `app_parameters_maj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`upneu`@`localhost` PROCEDURE `app_parameters_maj`(
								IN _prt_id      INT(255),
                               	IN _prt_value   VARCHAR(255)
							)
    MODIFIES SQL DATA
UPDATE app_parameters

   SET prt_value = _prt_value

 WHERE prt_id = _prt_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `clients_mjad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`upneu`@`localhost` PROCEDURE `clients_mjad`(IN _cli_id           int(11),
                         IN _cli_civ_code     varchar(5),
                         IN _cli_nom          varchar(255),
                         IN _cli_prenom       varchar(255),
                         IN _cli_rue          varchar(255),
                         IN _cli_complement   varchar(255),
                         IN _cli_codepostal   varchar(20),
                         IN _cli_ville        varchar(255),
                         IN _cli_pays         varchar(255),
                         IN _cli_telfixe      varchar(20),
                         IN _cli_portable     varchar(20),
                         IN _cli_email        varchar(150),
                         IN _cli_exotva       tinyint(1),
                         IN _cli_cptcoll      varchar(8),
                         IN _cli_sexe         tinyint(1),
                         IN _cli_datenais     varchar(30),
                         IN add_sejour        int(11),
                         IN trf_sejour        int(11))
    MODIFIES SQL DATA
    COMMENT 'Gestion des clients'
BEGIN
   IF _cli_id <= 0
   THEN
      INSERT INTO clients(cli_civ_code,
                          cli_nom,
                          cli_prenom,
                          cli_rue,
                          cli_complement,
                          cli_codepostal,
                          cli_ville,
                          cli_pays,
                          cli_telfixe,
                          cli_portable,
                          cli_email,
                          cli_exotva,
                          cli_cptcoll,
                          cli_sexe,
                          cli_datenais)
           VALUES (_cli_civ_code,
                   _cli_nom,
                   _cli_prenom,
                   _cli_rue,
                   _cli_complement,
                   _cli_codepostal,
                   _cli_ville,
                   _cli_pays,
                   _cli_telfixe,
                   _cli_portable,
                   _cli_email,
                   _cli_exotva,
                   _cli_cptcoll,
                   _cli_sexe,
                   str_to_date(_cli_datenais, '%d/%m/%Y'));

      SELECT LAST_INSERT_ID()
        INTO _cli_id;
   ELSE
      UPDATE clients
         SET cli_civ_code = _cli_civ_code,
             cli_nom = _cli_nom,
             cli_prenom = _cli_prenom,
             cli_rue = _cli_rue,
             cli_complement = _cli_complement,
             cli_codepostal = _cli_codepostal,
             cli_ville = _cli_ville,
             cli_pays = _cli_pays,
             cli_telfixe = _cli_telfixe,
             cli_portable = _cli_portable,
             cli_email = _cli_email,
             cli_exotva = _cli_exotva,
             cli_cptcoll = _cli_cptcoll,
             cli_sexe = _cli_sexe,
             cli_datenais = str_to_date(_cli_datenais, '%d/%m/%Y')
       WHERE cli_id = _cli_id;
   END IF;

   IF add_sejour > 0
   THEN
      IF trf_sejour > 0
      THEN
         UPDATE sejours_clients left JOIN factures ON scl_fac_id = fac_id
            SET scl_sej_id = add_sejour
          WHERE     scl_sej_id = trf_sejour
                AND scl_cli_id = _cli_id
                AND isnull(fac_numero);
      ELSE
         INSERT INTO sejours_clients(scl_sej_id,
                                     scl_cli_id,
                                     scl_etat,
                                     scl_saisie)
              VALUES (add_sejour,
                      _cli_id,
                      0,
                      now());
      END IF;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `factures_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `factures_add`(IN _sej_id           int(11),
                         IN _cli_id           int(11),
                         IN _pre_id           int(11),
                         IN _fli_descriptif   varchar(255),
                         IN _fli_quantite     double,
                         IN _fli_puttc        double)
BEGIN
   DECLARE _pre_tva   double;
   DECLARE _fac_id    double;
   DECLARE _tot_ttc   double;
   DECLARE _tot_ht    double;

   SELECT pre_tauxtva
     FROM prestations
    WHERE pre_id = _pre_id
     INTO _pre_tva;

   INSERT INTO factures(fac_civ_code,
                        fac_nom,
                        fac_prenom,
                        fac_rue,
                        fac_complement,
                        fac_codepostal,
                        fac_ville,
                        fac_pays)
      SELECT cli_civ_code,
             cli_nom,
             cli_prenom,
             cli_rue,
             cli_complement,
             cli_codepostal,
             cli_ville,
             cli_pays
        FROM clients
       WHERE cli_id = _cli_id;

   SELECT LAST_INSERT_ID()
     INTO _fac_id;

   SELECT _fli_puttc * _fli_quantite
     INTO _tot_ttc;
   SELECT _tot_ttc / (1 + (_pre_tva / 100))
     INTO _tot_ht;

   UPDATE factures
      SET fac_cli_id = _cli_id,
          fac_totalht = _tot_ht,
          fac_totalttc = _tot_ttc,
          fac_totaltva = _tot_ttc - _tot_ht,
          fac_date = now()
    WHERE fac_id = _fac_id;

   INSERT INTO factures_lignes(fli_fac_id,
                               fli_numlig,
                               fli_pre_id,
                               fli_descriptif,
                               fli_quantite,
                               fli_puht,
                               fli_totalht,
                               fli_tauxtva,
                               fli_totalttc)
        VALUES (_fac_id,
                1,
                _pre_id,
                _fli_descriptif,
                _fli_quantite,
                _fli_puttc,
                _tot_ht,
                _pre_tva,
                _tot_ttc);

   UPDATE sejours_clients
      SET scl_fac_id = _fac_id
    WHERE scl_sej_id = _sej_id AND scl_cli_id = _cli_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `factures_addpre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `factures_addpre`(IN  _fac_id           int(11),
                            IN  _pre_id           int(11),
                            IN  _fli_descriptif   varchar(255),
                            IN  _fli_quantite     double,
                            IN  _fli_puttc        double,
                            OUT _retour           int(1))
BEGIN
   DECLARE _exist     int(11);
   DECLARE _pre_tva   double;
   DECLARE _tot_ttc   double;
   DECLARE _tot_ht    double;
   DECLARE _cpt       int(11);


   SELECT fli_fac_id
     INTO _exist
     FROM factures_lignes
    WHERE fli_fac_id = _fac_id AND fli_pre_id = _pre_id;

  if _exist is not null # la prestation existe déjà

  then
   SELECT 0
     INTO _retour;

  else
   SELECT pre_tauxtva
     FROM prestations
    WHERE pre_id = _pre_id
     INTO _pre_tva;

   SELECT max(fli_numlig)
     INTO _cpt
     FROM factures_lignes
    WHERE fli_fac_id = _fac_id;

   SELECT _fli_puttc * _fli_quantite
     INTO _tot_ttc;

   SELECT _tot_ttc / (1 + (_pre_tva / 100))
     INTO _tot_ht;

   INSERT INTO factures_lignes(fli_fac_id,
                               fli_numlig,
                               fli_pre_id,
                               fli_descriptif,
                               fli_quantite,
                               fli_puht,
                               fli_totalht,
                               fli_tauxtva,
                               fli_totalttc)
        VALUES (_fac_id,
                _cpt + 1,
                _pre_id,
                _fli_descriptif,
                _fli_quantite,
                _fli_puttc,
                _tot_ht,
                _pre_tva,
                _tot_ttc);

   UPDATE factures
      SET fac_totalht = fac_totalht + _tot_ht,
          fac_totalttc = fac_totalttc + _tot_ttc,
          fac_totaltva = fac_totaltva + (_tot_ttc - _tot_ht)
    WHERE fac_id = _fac_id;

	UPDATE factures set fac_etat = (fac_totalttc = fac_totalregle) where fac_id = _fac_id;

   SELECT 1
     INTO _retour;
 end if ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `factures_close` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `factures_close`(  IN _fac_id			int(11) )
BEGIN

	DECLARE _fac_numero	int(11);
	DECLARE _datefin	timestamp;

	SELECT par_ProchainNumeroFacture into _fac_numero from parametres
									 where par_id = 1 ;

	UPDATE parametres	set par_ProchainNumeroFacture = par_ProchainNumeroFacture + 1
						where par_id = 1 ;

	SELECT sej_fin into _datefin from factures_details
								 where fac_id = _fac_id ;

	UPDATE factures		set fac_numero = _fac_numero,
							fac_date = _datefin
						where fac_id = _fac_id ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `factures_delpre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `factures_delpre`(	IN _fac_id			int(11),
							IN _fli_numlig      int(11),
                            OUT _retour  	    int(1) )
BEGIN

	declare _tot_ttc	double;
	declare _tot_ht		double;
	declare _cpt		int(10);

	SELECT 0 into _retour ;

	SELECT count(*) 	into _cpt from factures_lignes
						where fli_fac_id = _fac_id ;

	if _cpt > 1 then

		SELECT fli_totalttc, fli_totalht 	into _tot_ttc, _tot_ht from factures_lignes
											where fli_fac_id = _fac_id and fli_numlig = _fli_numlig ;

		DELETE from factures_lignes where fli_fac_id = _fac_id and fli_numlig = _fli_numlig ;

		UPDATE factures set
							fac_totalht		= fac_totalht - _tot_ht,
							fac_totalttc	= fac_totalttc - _tot_ttc,
							fac_totaltva	= fac_totaltva - ( _tot_ttc - _tot_ht )
						where fac_id = _fac_id ;

		UPDATE factures set fac_etat = (fac_totalttc = fac_totalregle) where fac_id = _fac_id;

		SELECT 1 into _retour ;

	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `factures_majpre` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `factures_majpre`(IN  _fac_id           int(11),
                            IN  _numlig           int(11),
                            IN  _fli_descriptif   varchar(255),
                            IN  _fli_quantite     double,
                            IN  _fli_puttc        double,
                            OUT _retour           double)
BEGIN
   DECLARE _prec_ht    double;
   DECLARE _prec_ttc   double;
   DECLARE _tot_ttc    double;
   DECLARE _tot_ht     double;
   DECLARE _pre_tva    double;
   DECLARE _pre_id     int(11);


   SELECT 0
     INTO _retour;

   SELECT fli_totalht
     INTO _prec_ht
     FROM factures_lignes
    WHERE fli_fac_id = _fac_id AND fli_numlig = _numlig;

   SELECT fli_totalttc
     INTO _prec_ttc
     FROM factures_lignes
    WHERE fli_fac_id = _fac_id AND fli_numlig = _numlig;

   SELECT fli_pre_id
     INTO _pre_id
     FROM factures_lignes
    WHERE fli_fac_id = _fac_id AND fli_numlig = _numlig;

   SELECT pre_tauxtva
     INTO _pre_tva
     FROM prestations
    WHERE pre_id = _pre_id;

   SELECT _fli_puttc * _fli_quantite
     INTO _tot_ttc;

   SELECT _tot_ttc / (1 + (_pre_tva / 100))
     INTO _tot_ht;

   UPDATE factures_lignes
      SET fli_descriptif = _fli_descriptif,
          fli_quantite = _fli_quantite,
          fli_puht = _fli_puttc,
          fli_totalht = _tot_ht,
          fli_tauxtva = _pre_tva,
          fli_totalttc = _tot_ttc
    WHERE fli_fac_id = _fac_id AND fli_numlig = _numlig;

   #CALL log_msg(concat('_prec_ht: ', _prec_ht));
   #CALL log_msg(concat('_prec_ttc: ', _prec_ttc));
   #CALL log_msg(concat('id: ', _fac_id));

   UPDATE factures
      SET fac_totalht = fac_totalht - _prec_ht + _tot_ht,
          fac_totalttc = fac_totalttc - _prec_ttc + _tot_ttc,
          fac_totaltva = fac_totaltva - (_prec_ttc - _prec_ht) + (_tot_ttc - _tot_ht)
    WHERE fac_id = _fac_id;

   UPDATE factures set fac_etat = (fac_totalttc = fac_totalregle) where fac_id = _fac_id;

   SELECT 1
     INTO _retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `parametres_maj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`upneu`@`localhost` PROCEDURE `parametres_maj`(
							IN _par_id                             int(11),
							IN _par_societe                        varchar(255),
							IN _par_rue                            varchar(255),
							IN _par_complement                     varchar(255),
							IN _par_codepostal                     varchar(20),
							IN _par_ville                          varchar(255),
							IN _par_pays                           varchar(255),
							IN _par_email                          varchar(150),
							IN _par_siret                          varchar(255),
							IN _par_codenaf                        varchar(10),
							IN _par_responsable                    varchar(255),
							IN _par_CodeJournalVente               varchar(20),
							IN _par_CodeJournalBanque              varchar(20),
							IN _par_telfixe                        varchar(20),
							IN _par_portable                       varchar(20),
							IN _par_iban                           varchar(34),
							IN _par_TvaIntracom                    varchar(16),
							IN _par_DebutListeSejours              varchar(16),
							IN _par_NbJoursHisto	               int(11)
   							)
    MODIFIES SQL DATA
    COMMENT 'Gestion des parametres'
BEGIN

      UPDATE parametres

         SET
			par_societe                = _par_societe,
			par_rue                    = _par_rue,
			par_complement             = _par_complement,
			par_codepostal             = _par_codepostal,
			par_ville                  = _par_ville,
			par_pays                   = _par_pays,
			par_email                  = _par_email,
			par_siret                  = _par_siret,
			par_codenaf                = _par_codenaf,
			par_responsable            = _par_responsable,
			par_CodeJournalVente       = _par_CodeJournalVente,
			par_CodeJournalBanque      = _par_CodeJournalBanque,
			par_telfixe                = _par_telfixe,
			par_portable               = _par_portable,
			par_iban                   = _par_iban,
			par_TvaIntracom            = _par_TvaIntracom,
			par_DebutListeSejours      = _par_DebutListeSejours,
			par_NbJoursHisto      	   = _par_NbJoursHisto

       WHERE par_id = _par_id ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `prestations_mjad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`upneu`@`localhost` PROCEDURE `prestations_mjad`(
						  IN _pre_id 			int(11),
						  IN _pre_pty_code 		varchar(10),
						  IN _pre_libelle 		varchar(255),
						  IN _pre_descriptif 	varchar(255),
						  IN _pre_comptetva 	varchar(8),
						  IN _pre_tauxtva 		double,
						  IN _pre_compteht 		varchar(8),
						  IN _pre_puht 			double,
						  IN _pre_puttc 		double,
						  IN _pre_prixttc 		tinyint(1)
   							)
    MODIFIES SQL DATA
    COMMENT 'Gestion des prestations'
BEGIN
   IF _pre_id <= 0
   THEN
      INSERT INTO prestations(
      						pre_pty_code,
							pre_libelle,
							pre_descriptif,
							pre_comptetva,
							pre_tauxtva,
							pre_compteht,
							pre_puht,
							pre_puttc,
							pre_prixttc
							)
           VALUES (
           		   	_pre_pty_code,
					_pre_libelle,
					_pre_descriptif,
					_pre_comptetva,
					_pre_tauxtva,
					_pre_compteht,
					_pre_puht,
					_pre_puttc,
					_pre_prixttc
           			 );
   ELSE

      UPDATE prestations

         SET
         		pre_pty_code =  	_pre_pty_code,
				pre_libelle =  	    _pre_libelle,
				pre_descriptif =    _pre_descriptif,
				pre_comptetva =     _pre_comptetva,
				pre_tauxtva =  	    _pre_tauxtva,
				pre_compteht =  	_pre_compteht,
				pre_puht =  		_pre_puht,
				pre_puttc =  	    _pre_puttc,
				pre_prixttc =       _pre_prixttc

       WHERE pre_id = _pre_id ;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reglements_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `reglements_add`(IN  _fac_id        int(11),
                           IN  _reg_date      varchar(50),
                           IN  _reg_mode      varchar(50),
                           IN  _reg_libelle   varchar(255),
                           IN  _reg_montant   double,
                           OUT _retour        int(1))
    MODIFIES SQL DATA
    COMMENT 'Gestion des reglements'
BEGIN
   DECLARE _reg_id   int(11);

   #DECLARE _totalfac   double;

   ## pas de controle sur montant

   #SELECT fac_totalttc into _totalfac from factures where fac_id = _fac_id;

   #if _reg_montant is null or _reg_montant = 0 or _reg_montant > _totalfac then

   SELECT 0
     INTO _retour;

   #else
   INSERT INTO reglements(reg_date,
                          reg_remise,
                          reg_mode,
                          reg_libelle,
                          reg_montant)
        VALUES (now(),
                str_to_date(_reg_date, '%d/%m/%Y'),
                _reg_mode,
                _reg_libelle,
                _reg_montant);

   SELECT LAST_INSERT_ID()
     INTO _reg_id;


   INSERT INTO reglements_lignes(rli_reg_id, rli_fac_id, rli_montant)
        VALUES (_reg_id, _fac_id, _reg_montant);


   UPDATE factures
      SET fac_totalregle = fac_totalregle + _reg_montant
    WHERE fac_id = _fac_id;

   UPDATE factures
      SET fac_etat = (fac_totalttc = fac_totalregle)
    WHERE fac_id = _fac_id;

   SELECT 1
     INTO _retour;
#end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reglements_maj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`upneu`@`localhost` PROCEDURE `reglements_maj`(
						  	IN _reg_id            	int(11),
							IN _reg_date            varchar(25),
							IN _reg_mode            varchar(5),
							IN _reg_libelle         varchar(255),
							IN _reg_remise          varchar(25)
   							)
    MODIFIES SQL DATA
    COMMENT 'Gestion des reglements'
BEGIN

      UPDATE reglements

         SET
         		reg_date   =  str_to_date(_reg_date, '%d/%m/%Y'),
				reg_mode   =  _reg_mode,
				reg_libelle=  _reg_libelle,
				reg_remise =  str_to_date(_reg_remise, '%d/%m/%Y')

       WHERE reg_id = _reg_id ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reglements_multi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `reglements_multi`(IN  _lignes        varchar(255),
                             IN  _reg_date      varchar(50),
                             IN  _reg_mode      varchar(50),
                             IN  _reg_libelle   varchar(255),
                             IN  _reg_montant   double,
                             OUT _retour        int(1))
    MODIFIES SQL DATA
    COMMENT 'Gestion des reglements'
BEGIN
   DECLARE _reg_id      int(11);
   DECLARE _pos1        int(5);
   DECLARE _pos2        int(5);

   DECLARE _fac_id      varchar(50);
   DECLARE _fac_regle   varchar(50);

   SELECT 0
     INTO _retour;

   INSERT INTO reglements(reg_date,
                          reg_remise,
                          reg_mode,
                          reg_libelle,
                          reg_montant)
        VALUES (now(),
				str_to_date(_reg_date, '%d/%m/%Y'),
                _reg_mode,
                _reg_libelle,
                _reg_montant);

   SELECT LAST_INSERT_ID()
     INTO _reg_id;


   SET _pos1 = locate(':', _lignes);

   REPEAT
      SET _pos2 = locate('/', _lignes);
      SET _fac_id = substr(_lignes, 1, _pos1 - 1);
      SET _fac_regle = substr(_lignes, _pos1 + 1, _pos2 - _pos1 - 1);


      INSERT INTO reglements_lignes(rli_reg_id, rli_fac_id, rli_montant)
           VALUES (_reg_id, _fac_id, _fac_regle);


      UPDATE factures
         SET fac_totalregle = fac_totalregle + _fac_regle
       WHERE fac_id = _fac_id;

      UPDATE factures
         SET fac_etat = (fac_totalttc = fac_totalregle)
       WHERE fac_id = _fac_id;

      #client confirmé
      UPDATE sejours_clients
         SET scl_etat = 1
       WHERE scl_fac_id = _fac_id;


      SET _lignes = substr(_lignes, _pos2 + 1);
      SET _pos1 = locate(':', _lignes);
   UNTIL _pos1 = 0
   END REPEAT;

   SELECT 1
     INTO _retour;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sejours_clients_add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `sejours_clients_add`(	IN _scl_sej_id       int(11),
                         		IN _scl_cli_id       int(11) )
BEGIN

	INSERT INTO sejours_clients (	scl_sej_id,
									scl_cli_id,
									scl_etat,
									scl_saisie )
			VALUES (	_scl_sej_id ,
						_scl_cli_id,
						0,
						now() );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sejours_clients_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `sejours_clients_del`(	IN _scl_sej_id   int(11),
                                IN _scl_cli_id   int(11))
BEGIN

 	DECLARE _fac_id int(11);

	SELECT scl_fac_id INTO _fac_id FROM sejours_clients
						WHERE scl_sej_id = _scl_sej_id AND scl_cli_id = _scl_cli_id ;

	DELETE FROM sejours_clients WHERE scl_sej_id = _scl_sej_id AND scl_cli_id = _scl_cli_id ;

	IF _fac_id != 0 THEN

		DELETE FROM factures WHERE fac_id = _fac_id;

		DELETE FROM factures_lignes WHERE fli_fac_id = _fac_id;

	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sejours_del` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`upneu`@`localhost` PROCEDURE `sejours_del`( IN _sej_id			int(11),
                               OUT _retour  	    int(1) )
BEGIN

	declare _cpt		int(10);

	SELECT 0 into _retour ;

	SELECT count(*) 	into _cpt from sejours_clients
						where scl_sej_id = _sej_id ;

	if _cpt = 0 then

		DELETE from sejours where sej_id = _sej_id ;

		SELECT 1 into _retour ;

	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sejours_mjad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `sejours_mjad`(IN _sej_id        int(11),
                         IN _sej_libelle   varchar(255),
                         IN _sej_nbmax     int(11),
                         IN _sej_complet   tinyint(1),
                         IN _sej_debut     varchar(30),
                         IN _sej_fin       varchar(30))
    MODIFIES SQL DATA
    COMMENT 'Gestion des sejours'
BEGIN
   IF _sej_id <= 0
   THEN
      INSERT INTO sejours(sej_libelle,
                          sej_nbmax,
                          sej_complet,
                          sej_debut,
                          sej_fin)
           VALUES (_sej_libelle,
                   _sej_nbmax,
                   _sej_complet,
                   str_to_date(_sej_debut, '%d/%m/%Y'),
                   str_to_date(_sej_fin, '%d/%m/%Y'));
   ELSE
      UPDATE sejours
         SET sej_libelle = _sej_libelle,
             sej_nbmax = _sej_nbmax,
             sej_complet = _sej_complet,
             sej_debut = str_to_date(_sej_debut, '%d/%m/%Y'),
             sej_fin = str_to_date(_sej_fin, '%d/%m/%Y')
       WHERE sej_id = _sej_id;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `users_mjad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`jj_root`@`localhost` PROCEDURE `users_mjad`(IN _usr_id           INT(255),
                       IN _usr_first_name   VARCHAR(255),
                       IN _usr_last_name    VARCHAR(255),
                       IN _usr_login        VARCHAR(255),
                       IN _usr_password     VARCHAR(255),
                       IN _usr_mail         VARCHAR(255),
                       IN _usr_pro_id       INT(255),
                       IN _usr_lang         VARCHAR(2),
                       IN _usr_image_path   VARCHAR(255),
                       IN _usr_out          INT(255))
    MODIFIES SQL DATA
    COMMENT 'Gestion des utilisateurs'
BEGIN
   DECLARE sortie   TIMESTAMP;

   IF _usr_id <= 0
   THEN
      INSERT INTO users(usr_first_name,
                        usr_last_name,
                        usr_pro_id,
                        usr_login,
                        usr_password,
                        usr_mail,
                        usr_lang,
                        usr_image_path)
           VALUES (_usr_first_name,
                   _usr_last_name,
                   _usr_pro_id,
                   _usr_login,
                   _usr_password,
                   _usr_mail,
                   _usr_lang,
                   _usr_image_path);
   ELSE
      SET sortie = NULL;

      IF _usr_out = 1
      THEN
         SET sortie = now();
      END IF;

      UPDATE users
         SET usr_first_name = _usr_first_name,
             usr_last_name = _usr_last_name,
             usr_pro_id = _usr_pro_id,
             usr_login = _usr_login,
             usr_password = _usr_password,
             usr_mail = _usr_mail,
             usr_lang = _usr_lang,
             usr_image_path = _usr_image_path,
             usr_out_date = sortie
       WHERE usr_id = _usr_id;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-19 10:49:23
