	
CREATE OR REPLACE 

VIEW sejours_clients_details AS

SELECT *

FROM sejours_clients

	JOIN clients 
	ON scl_cli_id = cli_id
	
	JOIN sejours
	ON scl_sej_id = sej_id
	
	LEFT JOIN factures
	ON scl_fac_id = fac_id	 ;
