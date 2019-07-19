
CREATE OR REPLACE 

VIEW reglements_details AS

SELECT *

FROM reglements 

	JOIN reglements_lignes 
	ON reg_id = rli_reg_id 
	
	JOIN factures 
	ON rli_fac_id = fac_id ;