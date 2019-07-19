DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `factures_majpre`(IN  _fac_id           int(11),
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
END
$$
DELIMITER ;