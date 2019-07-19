DELIMITER $$
CREATE 
PROCEDURE `parametres_maj`(
							IN _par_id                             int(11),         
							IN _par_societe                        varchar(255),    
							IN _par_rue                            varchar(255),    
							IN _par_complement                     varchar(255),    
							IN _par_codepostal                     varchar(20),     
							IN _par_ville                          varchar(255),    
							IN _par_pays                           varchar(255),    
							IN _par_email                          varchar(150),    
							IN _par_siret                          varchar(255),    
							IN _par_codenaf                        varchar(10),     
							IN _par_responsable                    varchar(255),    
							IN _par_CodeJournalVente               varchar(20),     
							IN _par_CodeJournalBanque              varchar(20),     
							IN _par_telfixe                        varchar(20),     
							IN _par_portable                       varchar(20),     
							IN _par_iban                           varchar(34),     
							IN _par_TvaIntracom                    varchar(16), 
							IN _par_DebutListeSejours              varchar(16),
							IN _par_NbJoursHisto	               int(11)  
   							)
           MODIFIES SQL DATA COMMENT 'Gestion des parametres'

BEGIN
   
      UPDATE parametres
      
         SET 
			par_societe                = _par_societe,                     
			par_rue                    = _par_rue,                         
			par_complement             = _par_complement,                  
			par_codepostal             = _par_codepostal,                  
			par_ville                  = _par_ville,                       
			par_pays                   = _par_pays,                        
			par_email                  = _par_email,                       
			par_siret                  = _par_siret,                       
			par_codenaf                = _par_codenaf,                     
			par_responsable            = _par_responsable,                 
			par_CodeJournalVente       = _par_CodeJournalVente,            
			par_CodeJournalBanque      = _par_CodeJournalBanque,           
			par_telfixe                = _par_telfixe,                     
			par_portable               = _par_portable,                    
			par_iban                   = _par_iban,                        
			par_TvaIntracom            = _par_TvaIntracom,               
			par_DebutListeSejours      = _par_DebutListeSejours,                 
			par_NbJoursHisto      	   = _par_NbJoursHisto                 
				
       WHERE par_id = _par_id ;
       
END
$$
DELIMITER ;