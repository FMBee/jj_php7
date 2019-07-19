DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `reglements_multi`(IN  _lignes        varchar(255),
                             IN  _reg_date      varchar(50),
                             IN  _reg_mode      varchar(50),
                             IN  _reg_libelle   varchar(255),
                             IN  _reg_montant   double,
                             OUT _retour        int(1))
   MODIFIES SQL DATA COMMENT 'Gestion des reglements'
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
END
$$
DELIMITER ;