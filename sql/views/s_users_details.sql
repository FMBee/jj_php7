
CREATE OR REPLACE 

VIEW users_details AS

SELECT *

FROM users

JOIN users_profiles
  ON usr_pro_id = pro_id ;
