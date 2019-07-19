DELIMITER $$
CREATE PROCEDURE sejours_del ( IN _sej_id			int(11),
                               OUT _retour  	    int(1) )

BEGIN
	
	declare _cpt		int(10);
	
	SELECT 0 into _retour ;					
	
	SELECT count(*) 	into _cpt from sejours_clients
						where scl_sej_id = _sej_id ;	
											
	if _cpt = 0 then
						
		DELETE from sejours where sej_id = _sej_id ;
							  
		SELECT 1 into _retour ;
		
	end if;
	
END
$$
DELIMITER ;