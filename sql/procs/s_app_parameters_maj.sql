DELIMITER $$
CREATE 
PROCEDURE app_parameters_maj (
								IN _prt_id      INT(255),
                               	IN _prt_value   VARCHAR(255)
							)
   MODIFIES SQL DATA
   
UPDATE app_parameters
   
   SET prt_value = _prt_value
 
 WHERE prt_id = _prt_id ;
DELIMITER ; 