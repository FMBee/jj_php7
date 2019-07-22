<?php 

  	// Initialisation de la session
	
	session_start();
	header("Cache-Control: no-cache"); //("Cache-Control: no-cache, no-store, must-revalidate")

 	// Constantes internes
	
	require(__CONFIG_ROOT__.'defines.php');
	
  	// Smarty
  	
	require(__WEB_LIB_SMARTY__ .'Smarty.class.php');
		
	$oSmarty = new Smarty();
	
	$oSmarty->left_delimiter  = '~{';
	$oSmarty->right_delimiter = '}~';
	$oSmarty->setTemplateDir(array(	__VIEWS_ROOT__,
									__VIEWS_LAYOUTS__,
									__VIEWS_PAGES__ ))
			->setConfigDir(__VIEWS_CONFIG__);
	
	
   /// DataBase
	
  	//- Chargement des modèles
	
	$files = scandir(__MODELS_ROOT__);
	foreach ($files as $filename)
		{
		if (is_file(__MODELS_ROOT__.$filename))
			require_once(__MODELS_ROOT__.$filename);
	}
	
  	//- Connexion 
	
	require(__CONFIG_ROOT__.'connect.php');
		
	
   /// Paramètres 
   
	//- parametres session
	
// 	$_SESSION['__client_seek'] = '';

  	//- Table parametres application
	
	if (! isset($_SERVER['__app_params__']))
	{
		foreach (App_Parameters::getAll($pdo) as $param)
		{
			$value = $param['prt_value']; 
			settype($value, $param['apt_cast_type']);
			
			$_SERVER['__app_params__'][$param['prt_name']] = $value;		
		}
	}
	
	//- Profils users
	
	$UsersProfiles = Users_Profiles::getAll($pdo);
	if (! isset($_SERVER['__users_profiles__']))
	{
		foreach ($UsersProfiles as $profil)
		{
			$_SERVER['__users_profiles__'][$profil['pro_name']] = $profil['pro_access']; 
		}
	}

	//- Table des traductions

	if (! isset($_SERVER['__translate__']))
		{
		foreach (App_Translate::getAll($pdo) as $record)
			{
				$_SERVER['__translate__']
						  [$record['atr_table']]
						   [$record['atl_lang']]
						    [$record['atr_data_field']]
						   	 [trim($record['atl_data_id'])] = trim($record['atl_data_lib']);
		}
	}

