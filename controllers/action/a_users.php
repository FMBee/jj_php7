<?php

	if(isset($_POST['key']))
		{
		array_filter($_POST, 'trim_value');

		if ($_POST['usr_password'] != __PWD_INIT__)		//un mot de passe a été saisi
			{	
			$_POST['usr_password'] = password_hash($_POST['usr_password'], PASSWORD_DEFAULT);	//cryptage
		}
		else	//reprise du mot de passe courant
			{
			$_POST['usr_password'] = $_SESSION['__user_password__'];
		}
		
		if ($_SESSION['__admin_mode__']) 
			{
			if ( !isset($_POST['out_user']) || $_POST['out_user'] != 1 ) 
				{
				$_POST['out_user'] = NULL;
			}
		}
		else 
			{
			// initialisation - champs non modifiés
			$_POST['out_user'] = NULL;
			$_POST['usr_pro_id'] = $_SESSION['__user_pro_id__'];
		}
		
		if (! $_SERVER['__app_params__']['__APP_INTERNATIONAL__'])	$_POST['usr_lang'] = $_SESSION['__user_lang__'];
		
		if (! $_SERVER['__app_params__']['__APP_USER_LOGO__'])		$_POST['usr_image_path'] = $_SESSION['__user_image__'];
		
		Users::majOrAdd($pdo, $_POST);	
		
		if ($_SESSION['__user_id__'] == $_POST['key']) 	//user modifié = user loggé
			{
			$profil = Users_Profiles::getById($pdo, $_POST['usr_pro_id']); 
			$_POST['pro_name']		= $profil['pro_name'];
		    $_POST['pro_access']	= $profil['pro_access'];

		    maj_user_ss($_POST);  
		}
	}		
?>