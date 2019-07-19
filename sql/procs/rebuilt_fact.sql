
CREATE PROCEDURE rebuilt_fact

BEGIN

   DUMP base
   
   DROP	TABLE IF EXISTS factures2;
   CREATE TABLE factures2 SELECT * from factures;
   
   DROP	TABLE IF EXISTS factures_lignes2;
   CREATE TABLE factures_lignes2 SELECT * from factures_lignes;
   
   UPDATE factures_lignes
      SET fli_totalht = fli_totalttc / (1 + (fli_tauxtva / 100))
      where fli_fac_id > 2401;

   UPDATE 	factures as t1, 
      		(SELECT fli_fac_id, sum(fli_totalht) as _totht, sum(fli_totalttc) as _totttc, sum(fli_totalttc-fli_totalht) as _tottva 
   				FROM factures_lignes group by fli_fac_id ) as t2
   		
   			SET t1.fac_totalht = t2._totht, t1.fac_totalttc = t2._totttc, t1.fac_totaltva = t2._tottva
   			WHERE t1.fac_id = t2.fli_fac_id
   			and t1.fac_id > 2401;
   		
	UPDATE factures set fac_etat = (fac_totalttc = fac_totalregle);

	
    DROP TABLE IF EXISTS clients2;
    CREATE TABLE clients2 SELECT * from clients;
   	
    UPDATE clients SET cli_nom = upper(cli_nom),
   						cli_prenom = concat( upper(substring(cli_prenom, 1, 1)), lower(substring(cli_prenom, 2))),
   						cli_ville = upper(cli_ville);
   						
    UPDATE factures SET fac_nom = upper(fac_nom),
   						fac_prenom = concat( upper(substring(fac_prenom, 1, 1)), lower(substring(fac_prenom, 2))),
   						fac_ville = upper(fac_ville);
 
   						
   			
END