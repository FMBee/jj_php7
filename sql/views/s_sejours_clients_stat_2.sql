
CREATE OR REPLACE 

VIEW sejours_clients_stat_2 AS

SELECT 
	t2.scl_sej_id as scl_sej_id_2,  
 	SUM(IF(pty_code = 'SOINS', fli_quantite, NULL)) AS 'scl_nb_soins', 
 	SUM(IF(pty_code = 'SEJOUR', fli_quantite, NULL)) AS 'scl_nb_sejours', 
 	SUM(IF(pty_code = 'REPAS', fli_quantite, NULL)) AS 'scl_nb_repas',
 	SUM(IF(pty_code = 'PRODUIT', fli_quantite, NULL)) AS 'scl_nb_produits',
 	SUM(IF(pty_code = 'HOTEL', fli_quantite, NULL)) AS 'scl_nb_hotels',
 	SUM(IF(pty_code = 'LOCATION', fli_quantite, NULL)) AS 'scl_nb_locations'
  	
 	FROM sejours_clients t2
  
 	JOIN factures_lignes   
 	ON scl_fac_id = fli_fac_id 
 	
  	JOIN prestations       
  	ON fli_pre_id = pre_id 
  	
  	JOIN prestations_types 
  	ON pre_pty_code   = pty_code 

  	GROUP BY scl_sej_id_2;
	