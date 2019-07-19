
CREATE OR REPLACE 

VIEW sejours_clients_stat_1 AS

SELECT 
	t1.scl_sej_id,
  	SUM(IF(t1.scl_etat = 0, 1, NULL)) AS 'scl_nb_preinscrit', 
  	SUM(IF(t1.scl_etat = 1, 1, NULL)) AS 'scl_nb_confirme', 
  	SUM(IF(t1.scl_etat = 2, 1, NULL)) AS 'scl_nb_annule', 
  	SUM(IF(t1.scl_etat = 3, 1, NULL)) AS 'scl_nb_retarde' 

  	FROM sejours_clients t1

  	GROUP BY t1.scl_sej_id; 
    