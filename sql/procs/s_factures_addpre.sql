DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `factures_addpre`(IN  _fac_id           int(11),
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

END
$$
DELIMITER ;