	
CREATE OR REPLACE 

VIEW sejours_lignes_details AS

SELECT *

FROM sejours_clients

	JOIN factures_lignes_details 
	ON scl_fac_id = fac_id ;
