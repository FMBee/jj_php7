<?php

	function onSession() { return isset($_SESSION['__user_id__']); }


	function precPageOn() { return !empty($_SERVER['HTTP_REFERER']); }
	
	function precPage() { 
		
		$action_page = substr( $_SERVER['HTTP_REFERER'], strrpos($_SERVER['HTTP_REFERER'], '/')+1 );
		
		if ( strpos($action_page, 'login') ) {
			
			return 'index.html';
		}
		else {
			return $action_page;
		}
	}
	
	
	function traductLib($id, $table = 'global', $champ = 'php', $langue = null) {
	
		settype($id, 'string');
	
		if (onSession())
			{
			$langue = (is_null($langue) ? $_SESSION['__user_lang__'] : $langue);
		}
		else
			{
			$langue = explode(',',$_SERVER['HTTP_ACCEPT_LANGUAGE']);
			$langue = strtolower(substr(rtrim($langue[0]),0,2));
			$langue = (is_null($langue) ? __LANG_DEFAULT__ : $langue);
		}
		
		return 	$_SERVER ['__translate__']
						  [$table]
						   [$langue]
						    [$champ]
						     [trim($id)];
	}
	
	function maj_lang_ss($cod_langue) {
	
		global $pdo;
	
		if (!isset($_SESSION['__user_lang__']) || $cod_langue != $_SESSION['__user_lang__'])
			{
			$_SESSION['__user_form_lang__']  = "";
				
			foreach (Languages::getAllLanguages($pdo) as $langue)
				{
				if ($langue['lng_code'] == $cod_langue)
					{
					$_SESSION['__user_form_lang__']  = $langue['lng_form_code'];
				}
			}
			$_SESSION['__user_lang__']  = $cod_langue;
		}
	}
		
	function maj_user_ss($data) {
		
	// 	$_SESSION['__user_id__']         = $data['usr_id'];
		$_SESSION['__user_name__']       = $data['usr_first_name'] .' ' .$data['usr_last_name'];
		$_SESSION['__user_login__']      = $data['usr_login'];
		$_SESSION['__user_password__']   = $data['usr_password'];
		$_SESSION['__user_mail__']       = $data['usr_mail'];
		$_SESSION['__user_pro_id__']     = $data['usr_pro_id'];
		$_SESSION['__user_profil__']     = $data['pro_name'];
		$_SESSION['__user_access__']     = $data['pro_access'];
		$_SESSION['__user_lang__']		 = $data['usr_lang'];
		$_SESSION['__user_image__']		 = $data['usr_image_path'];

		$_SESSION['__admin_mode__'] 	 = ($data['pro_access'] > __ADMIN_MINACCESS__);
		$_SESSION['__root_mode__'] 	 	 = ($data['pro_access'] == '999');

		if ($_SERVER['__app_params__']['__APP_INTERNATIONAL__'])
			{
			maj_lang_ss($data['usr_lang']);
		}
	}
	
	
// 	function maj_options_ss($data) {
		
// 		$_SESSION['__cli_create_daily_tasks__']  = $data['cpa_create_daily_tasks'];
// 		$_SESSION['__cli_pms_wizard_enabled__']  = $data['cpa_pms_wizard_enabled'];
// 		$_SESSION['__cli_default_temp_rec__']    = $data['cpa_default_temp_rec'];
// 		$_SESSION['__cli_default_temp_fridge__'] = $data['cpa_default_temp_fridge'];
// 		$_SESSION['__cli_delay_sup__'] 			 = $data['cpa_delay_sup'];
// 		$_SESSION['__cli_async_rec_send__']      = $data['cpa_async_rec_send'];
// 		$_SESSION['__cli_multi_tasks_close__']   = $data['cpa_multi_tasks_close'];
// 		$_SESSION['__cli_histo_tasks_days__']    = $data['cpa_histo_tasks_days'];

// 		$_SESSION['__cli_idle_delay__'] 	 	 = $data['cpa_idle_delay'] * 60000 ;	//en ms
		
// 	}
	
	
	function debug($var) 
		{			
	// 	global $debug;
		$debug =  	(isset($_SERVER['__app_params__']['__APP_DEBUG__']) 
						? $_SERVER['__app_params__']['__APP_DEBUG__'] 
						: false);
	
		if ($debug) 
			{
			if (func_num_args() == 2) 
				{		//true : vers console
				print_r($var);
				}
			else 
				{
				echo "\n<!-- ";
				print_r($var);
				echo " -->\n";
				}
			}
		else 
			{
			if (! isset($_SERVER['__app_params__']['__APP_DEBUG__']))
				echo "\n<!-- debugger non paramétré -->\n";
			}
		}
	
	function trim_value(&$value) 
		{		
		$value = trim($value);   
		}

