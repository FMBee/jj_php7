<?php

	//en mode administrateur on vient de users_list
	if ($_SESSION['__admin_mode__'])
		{
		if ($_POST['key'] != "new")	  //if ! creation
			{
			$usercode = $_POST['key'];
			$username = $_POST['username'];

			$tabUser = Users::getOne($pdo, $usercode);
			//on initialise le password pour éviter l'affichage des 60 carac. du hashcode
			$tabUser['usr_password'] = __PWD_INIT__;
			$oSmarty->assign('user', $tabUser);
		} 
		else 
			{
			$usercode = 0;
			$username = 'new';
		}
	} 
	else 
		{
		$usercode = $_SESSION['__user_id__'];
		$username = $_SESSION['__user_name__'];

		$tabUser = Users::getOne($pdo, $usercode);
		//on initialise le password pour éviter l'affichage des 60 carac. du hashcode
		$tabUser['usr_password'] = __PWD_INIT__;
		$oSmarty->assign('user', $tabUser);
	}
	
	if ($_SERVER['__app_params__']['__APP_USER_LOGO__'])
		{
		$files = scandir(__VIEWS_IMG__.'profiles');
		$tablogos = [];
		foreach ($files as $filename)
			{
			if (substr($filename, 0, 1) != '.') $tablogos[] = $filename;
		}
		$oSmarty->assign('logos', $tablogos);
	}
	
	if ($_SERVER['__app_params__']['__APP_INTERNATIONAL__'])
		{
		$oSmarty->assign('languages', Languages::getAllLanguages($pdo));
	}

	$oSmarty->assign('key', 	$usercode);
	$oSmarty->assign('title', 	$username);
	$oSmarty->assign('profiles',$UsersProfiles);
	 
	
?>