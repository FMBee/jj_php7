
CREATE OR REPLACE 

VIEW sejours_clients_stat AS

SELECT *

	FROM sejours 
  
	LEFT OUTER JOIN sejours_clients_stat_1 
	ON sejours.sej_id = sejours_clients_stat_1.scl_sej_id 
  
	LEFT OUTER JOIN sejours_clients_stat_2 
	ON sejours.sej_id = sejours_clients_stat_2.scl_sej_id_2
