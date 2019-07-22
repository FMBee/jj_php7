DELIMITER $$
CREATE DEFINER = `jj_root` @`localhost`
PROCEDURE `users_mjad`(IN _usr_id           INT(255),
                       IN _usr_first_name   VARCHAR(255),
                       IN _usr_last_name    VARCHAR(255),
                       IN _usr_login        VARCHAR(255),
                       IN _usr_password     VARCHAR(255),
                       IN _usr_mail         VARCHAR(255),
                       IN _usr_pro_id       INT(255),
                       IN _usr_lang         VARCHAR(2),
                       IN _usr_image_path   VARCHAR(255),
                       IN _usr_out          INT(255))
   MODIFIES SQL DATA COMMENT 'Gestion des utilisateurs'
BEGIN
   DECLARE sortie   TIMESTAMP;

   IF _usr_id <= 0
   THEN
      INSERT INTO users(usr_first_name,
                        usr_last_name,
                        usr_pro_id,
                        usr_login,
                        usr_password,
                        usr_mail,
                        usr_lang,
                        usr_image_path)
           VALUES (_usr_first_name,
                   _usr_last_name,
                   _usr_pro_id,
                   _usr_login,
                   _usr_password,
                   _usr_mail,
                   _usr_lang,
                   _usr_image_path);
   ELSE
      SET sortie = NULL;

      IF _usr_out = 1
      THEN
         SET sortie = now();
      END IF;

      UPDATE users
         SET usr_first_name = _usr_first_name,
             usr_last_name = _usr_last_name,
             usr_pro_id = _usr_pro_id,
             usr_login = _usr_login,
             usr_password = _usr_password,
             usr_mail = _usr_mail,
             usr_lang = _usr_lang,
             usr_image_path = _usr_image_path,
             usr_out_date = sortie
       WHERE usr_id = _usr_id;
   END IF;
END
$$
DELIMITER ;