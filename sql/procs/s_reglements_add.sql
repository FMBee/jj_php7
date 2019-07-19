DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `reglements_add`(IN  _fac_id        int(11),
                           IN  _reg_date      varchar(50),
                           IN  _reg_mode      varchar(50),
                           IN  _reg_libelle   varchar(255),
                           IN  _reg_montant   double,
                           OUT _retour        int(1))
   MODIFIES SQL DATA COMMENT 'Gestion des reglements'
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

END
$$
DELIMITER ;