DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `clients_mjad`(IN _cli_id           int(11),
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
   MODIFIES SQL DATA COMMENT 'Gestion des clients'
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
END
DELIMITER ;