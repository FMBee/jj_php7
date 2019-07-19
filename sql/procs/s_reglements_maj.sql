DELIMITER $$
CREATE 
PROCEDURE reglements_maj (
						  	IN _reg_id            	int(11),      
							IN _reg_date            varchar(25),  
							IN _reg_mode            varchar(5),   
							IN _reg_libelle         varchar(255), 
							IN _reg_remise          varchar(25)
   							)
           MODIFIES SQL DATA COMMENT 'Gestion des reglements'

BEGIN
   
      UPDATE reglements
      
         SET 
         		reg_date   =  str_to_date(_reg_date, '%d/%m/%Y'),     
				reg_mode   =  _reg_mode,     
				reg_libelle=  _reg_libelle,  
				reg_remise =  str_to_date(_reg_remise, '%d/%m/%Y')    
				
       WHERE reg_id = _reg_id ;
       
END
$$
DELIMITER ;