CREATE OR REPLACE 

VIEW factures_lignes_details AS

SELECT *

FROM factures_lignes

	JOIN factures_details 
	ON fac_id = fli_fac_id 
	
	JOIN prestations_details
	ON pre_id = fli_pre_id ;