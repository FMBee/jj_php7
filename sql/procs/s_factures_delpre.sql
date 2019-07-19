DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`

PROCEDURE factures_delpre(	IN _fac_id			int(11),
							IN _fli_numlig      int(11),  
                            OUT _retour  	    int(1) )

BEGIN
	
	declare _tot_ttc	double;
	declare _tot_ht		double;
	declare _cpt		int(10);
	
	SELECT 0 into _retour ;					
	
	SELECT count(*) 	into _cpt from factures_lignes
						where fli_fac_id = _fac_id ;
						
	if _cpt > 1 then
						
		SELECT fli_totalttc, fli_totalht 	into _tot_ttc, _tot_ht from factures_lignes 
											where fli_fac_id = _fac_id and fli_numlig = _fli_numlig ;
		
		DELETE from factures_lignes where fli_fac_id = _fac_id and fli_numlig = _fli_numlig ;
							  
		UPDATE factures set
							fac_totalht		= fac_totalht - _tot_ht,
							fac_totalttc	= fac_totalttc - _tot_ttc,
							fac_totaltva	= fac_totaltva - ( _tot_ttc - _tot_ht )
						where fac_id = _fac_id ;
		
		UPDATE factures set fac_etat = (fac_totalttc = fac_totalregle) where fac_id = _fac_id;

		SELECT 1 into _retour ;
		
	end if;
	
END
$$
DELIMITER ;