DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`

PROCEDURE sejours_clients_add(	IN _scl_sej_id       int(11),
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
END
$$
DELIMITER ;