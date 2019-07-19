
CREATE OR REPLACE 

VIEW prestations_details AS

SELECT *

FROM prestations

JOIN prestations_types
  ON pre_pty_code = pty_code ;
