DELIMITER $$
CREATE 
PROCEDURE `prestations_mjad`(
						  IN _pre_id 			int(11),
						  IN _pre_pty_code 		varchar(10),
						  IN _pre_libelle 		varchar(255),
						  IN _pre_descriptif 	varchar(255),
						  IN _pre_comptetva 	varchar(8),
						  IN _pre_tauxtva 		double,
						  IN _pre_compteht 		varchar(8),
						  IN _pre_puht 			double,
						  IN _pre_puttc 		double,
						  IN _pre_prixttc 		tinyint(1)
   							)
           MODIFIES SQL DATA COMMENT 'Gestion des prestations'

BEGIN
   IF _pre_id <= 0
   THEN
      INSERT INTO prestations(
      						pre_pty_code, 	
							pre_libelle, 	
							pre_descriptif,
							pre_comptetva, 
							pre_tauxtva, 	
							pre_compteht, 	
							pre_puht, 		
							pre_puttc, 	
							pre_prixttc 
							) 	
           VALUES (
           		   	_pre_pty_code, 	  
					_pre_libelle, 	  
					_pre_descriptif,   
					_pre_comptetva,    
					_pre_tauxtva, 	  
					_pre_compteht, 	  
					_pre_puht, 		  
					_pre_puttc, 	      
					_pre_prixttc       
           			 );
   ELSE
   
      UPDATE prestations
      
         SET 
         		pre_pty_code =  	_pre_pty_code, 	      
				pre_libelle =  	    _pre_libelle, 	   
				pre_descriptif =    _pre_descriptif,   
				pre_comptetva =     _pre_comptetva,    
				pre_tauxtva =  	    _pre_tauxtva, 	   
				pre_compteht =  	_pre_compteht, 	     
				pre_puht =  		_pre_puht, 		     
				pre_puttc =  	    _pre_puttc, 	     
				pre_prixttc =       _pre_prixttc
				
       WHERE pre_id = _pre_id ;
   END IF;
END
$$
DELIMITER ;