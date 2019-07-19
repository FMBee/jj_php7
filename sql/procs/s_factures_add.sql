DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `factures_add`(IN _sej_id           int(11),
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
END
$$
DELIMITER ;