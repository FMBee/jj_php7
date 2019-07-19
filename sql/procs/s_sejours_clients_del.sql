DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`

PROCEDURE sejours_clients_del(	IN _scl_sej_id   int(11),
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
END
$$
DELIMITER ;