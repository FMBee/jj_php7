DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `sejours_mjad`(IN _sej_id        int(11),
                         IN _sej_libelle   varchar(255),
                         IN _sej_nbmax     int(11),
                         IN _sej_complet   tinyint(1),
                         IN _sej_debut     varchar(30),
                         IN _sej_fin       varchar(30))
   MODIFIES SQL DATA COMMENT 'Gestion des sejours'
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
END
$$
DELIMITER ;