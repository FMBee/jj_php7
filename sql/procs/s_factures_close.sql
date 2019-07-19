DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`

PROCEDURE factures_close (  IN _fac_id			int(11) )

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
						
END
$$
DELIMITER ;