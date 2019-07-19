	
CREATE OR REPLACE 

VIEW factures_details AS

SELECT *

FROM factures 

	JOIN clients 
	ON fac_cli_id = cli_id 
	
	JOIN sejours_clients 
	ON fac_id = scl_fac_id 
	
	JOIN sejours 
	ON sej_id = scl_sej_id ; 

