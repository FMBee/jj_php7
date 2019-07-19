<?php 
	
	// Arborescence application
	
	$_SEP = '\\'.DIRECTORY_SEPARATOR; 	// !!:vaut '\' sous Windows et '/' sous Linux
	$_ROOT = '.'.$_SEP;				// racine pour include PHP

	if (!defined('__PATH_SEPARATOR__'))     	define('__PATH_SEPARATOR__'			, $_SEP );
	if (!defined('__DOCUMENT_ROOT__'))     		define('__DOCUMENT_ROOT__'			, $_ROOT );
	
	if (!defined('__CONTROLLERS_ROOT__'))     	define('__CONTROLLERS_ROOT__'		, $_ROOT     			. 'controllers' .$_SEP);
	if (!defined('__CONTROLLERS_ACTION__'))   	define('__CONTROLLERS_ACTION__'		, __CONTROLLERS_ROOT__  . 'action' .$_SEP);
	if (!defined('__CONTROLLERS_AJAX__'))     	define('__CONTROLLERS_AJAX__'		, __CONTROLLERS_ROOT__  . 'ajax' .$_SEP);
	
	if (!defined('__MODELS_ROOT__'))		  	define('__MODELS_ROOT__'			, $_ROOT   				. 'models' .$_SEP);
	

	// Liens relatifs
	
	$_SEP = '/';
	$_ROOT = '';					// racine pour include Smarty, Ajax, et URLS

	if (!defined('__VIEWS_ROOT__'))			 	define('__VIEWS_ROOT__'				, $_ROOT   			. 'views' .$_SEP);
	if (!defined('__VIEWS_CONFIG__')) 		 	define('__VIEWS_CONFIG__'			, __VIEWS_ROOT__ 	. 'config' .$_SEP);
	if (!defined('__VIEWS_FOOTERS__'))          define('__VIEWS_FOOTERS__'			, __VIEWS_ROOT__    . 'footers' .$_SEP);
	if (!defined('__VIEWS_IMG__'))           	define('__VIEWS_IMG__'				, __VIEWS_ROOT__    . 'img' .$_SEP);
	if (!defined('__VIEWS_LAYOUTS__'))          define('__VIEWS_LAYOUTS__'			, __VIEWS_ROOT__    . 'layouts' .$_SEP);
	if (!defined('__VIEWS_PAGES__'))         	define('__VIEWS_PAGES__'			, __VIEWS_ROOT__    . 'pages' .$_SEP);
	
	if (!defined('__WEB_ROOT__')) 				define('__WEB_ROOT__'				, $_ROOT   			. 'web' .$_SEP);

	if (!defined('__WEB_LIB_THEME__')) 			define('__WEB_LIB_THEME__'			, __WEB_ROOT__ 		. 'sbadmin' .$_SEP);
	if (!defined('__WEB_LIB_BOWER__')) 			define('__WEB_LIB_BOWER__'			, __WEB_LIB_THEME__ . 'bower_components' .$_SEP);
	if (!defined('__WEB_LIB_BOOTSTRAP__')) 		define('__WEB_LIB_BOOTSTRAP__'		, __WEB_LIB_BOWER__ . 'bootstrap' .$_SEP);
	
	if (!defined('__WEB_LIB_FORMVALID__')) 		define('__WEB_LIB_FORMVALID__'		, __WEB_ROOT__ 		. 'formvalidation-v0.6.3' .$_SEP);
	if (!defined('__WEB_LIB_SELECT__')) 		define('__WEB_LIB_SELECT__'			, __WEB_ROOT__	 	. 'select' .$_SEP);
	if (!defined('__WEB_LIB_SMARTY__')) 		define('__WEB_LIB_SMARTY__'			, __WEB_ROOT__ 		. 'smarty' .$_SEP);
	if (!defined('__WEB_LIB_SWITCH__')) 		define('__WEB_LIB_SWITCH__'			, __WEB_ROOT__ 		. 'bootstrap-switch' .$_SEP);
	if (!defined('__WEB_LIB_FPDF__')) 			define('__WEB_LIB_FPDF__'			, __WEB_ROOT__ 		. 'fpdf' .$_SEP);
	if (!defined('__WEB_LIB_CAROUSEL__')) 		define('__WEB_LIB_CAROUSEL__'		, __WEB_ROOT__ 		. 'owl-carousel' .$_SEP);
	if (!defined('__WEB_LIB_DATASELECT__')) 	define('__WEB_LIB_DATASELECT__'		, __WEB_ROOT__ 		. 'datatables-select' .$_SEP);
	if (!defined('__WEB_LIB_BOOTBOX__'))        define('__WEB_LIB_BOOTBOX__'        , __WEB_ROOT__      . 'bootbox' .$_SEP);
	if (!defined('__WEB_LIB_AUTOCPL__'))        define('__WEB_LIB_AUTOCPL__'        , __WEB_ROOT__      . 'jQuery-Autocomplete' .$_SEP);
	
	
	// Paramètres
	
	if (!defined('__APP_TITLE__'))            	define('__APP_TITLE__'				, 'JoliJeûne');		//titre appli
	if (!defined('__APP_VERSION__'))           	define('__APP_VERSION__'			, 'v.1.01');		//version appli
	if (!defined('__PWD_DEFAULT__')) 			define('__PWD_DEFAULT__'			, 'Joje1234');	    //mot de passe user par défaut
	if (!defined('__PWD_INIT__')) 				define('__PWD_INIT__'				, 'Zz0Zz0Zz0');	    //initialisation du mot de passe user
	if (!defined('__LOG_TRY__')) 				define('__LOG_TRY__'				, 3);	            //nb d'essai de login avant récupération
	if (!defined('__PATH_USERIMG__')) 			define('__PATH_USERIMG__'			, __VIEWS_IMG__ . '/profiles/profile_logo.png');	//avatar par défaut
	if (!defined('__ADMIN_MINACCESS__')) 		define('__ADMIN_MINACCESS__'		, '599');			//seuil de passage au mode admin
	if (!defined('__LANG_DEFAULT__')) 			define('__LANG_DEFAULT__'			, 'fr');			//langue par defaut de l'appli
	if (!defined('__SQL_LIMIT__'))	 			define('__SQL_LIMIT__'				, ' LIMIT 0, 1000');//limit dans les SELECT

	
	// Detect Device/Operating System
	$agent = $_SERVER['HTTP_USER_AGENT'];

	if(preg_match('/Linux/i',$agent)) 		define('__OS__', 'Linux');
	elseif(preg_match('/Mac/i',$agent)) 	define('__OS__', 'Mac');
	elseif(preg_match('/iPhone/i',$agent)) 	define('__OS__', 'iPhone');
	elseif(preg_match('/iPad/i',$agent)) 	define('__OS__', 'iPad');
	elseif(preg_match('/Droid/i',$agent))	define('__OS__', 'Droid');
	elseif(preg_match('/Unix/i',$agent)) 	define('__OS__', 'Unix');
	elseif(preg_match('/Windows/i',$agent)) define('__OS__', 'Windows');
	else define('__OS__', 'Unknown');
	
