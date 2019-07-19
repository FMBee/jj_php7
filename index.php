<?php

// 	ob_start();

	// Initialisation de l'environnement
	
	if (!isset($_SERVER['DOCUMENT_ROOT'])) 	die();
	
	if (!defined('__CONFIG_ROOT__')) 		define('__CONFIG_ROOT__', '.'.DIRECTORY_SEPARATOR.'config'.DIRECTORY_SEPARATOR);

	include(__CONFIG_ROOT__.'config_init.php');

	include(__CONFIG_ROOT__.'functions.php');	
	
	// Debugging
	
	error_reporting(0);
// 	error_reporting($_SERVER['__app_params__']['__APP_DEBUG__'] ? E_ALL : null );

// 	debug('GET:');debug($_GET);
// 	debug('POST:');debug($_POST);
// 	debug('SESSION 1:');debug($_SESSION);
// 	debug('SERVER:');debug($_SERVER);
	
   /// ROUTING
   
	$specialPages 	= array( 'deconnect', 'login', 'errorpage', 'nopage');
   
	// Maintenance
	
	if ($_SERVER['__app_params__']['__APP_MAINTAIN__']) {	
		
		if (onSession()) {	// connecté
		
			$_GET['action'] = 'deconnect';	// déconnexion
			$_GET['page'] 	= 'errorpage';	
			$_GET['errmsg'] = traductLib('msgError1');
			$_GET['suite']	= 'nopage';		// nopage redirigera vers login
		}
// 		else {
// 			// nopage redirigera vers login
// 		}
	}
	
	// Déconnexion ou login
	
	if (isAction() && in_array($_GET['action'], $specialPages)) {
	 
		include(action());	// unset de $_SESSION si déconnexion
	}
	
	// Cas général

	if (onSession()) {	// connecté

		// Initialisations communes
		
		include(__CONTROLLERS_ROOT__.'c_common.php');

		// Actions - Initialisations
		
		if (isAction() && (! in_array($_GET['action'], $specialPages))) {
// 		if (isAction()) {
		
			include(action());
		}
		
		// Pages
		
		if (isPage()) {

			include(page());
		}
		else {

			include(__CONTROLLERS_ROOT__.'c_index.php');	
		}

		// Affichage des templates
		
		$oSmarty->display(__VIEWS_ROOT__ . 'v_header.tpl');

		$oSmarty->display(__VIEWS_ROOT__ . 'v_menu.tpl');
		
		if (isTemplate()) {

			$oSmarty->display(template());
		}
		else {

			$oSmarty->display(__VIEWS_PAGES__ . 'p_index.tpl');
		}
		
		$oSmarty->display(__VIEWS_ROOT__ . 'v_footer.tpl');
	}
	
	else {	// Session expiré - déconnexion - login 
		
// 		if ( 	( isAction() && (! in_array($_GET['action'], $specialPages)) )  // action normale !onSession() )
// 			 ||	( isPage() && (! in_array($_GET['page'], $specialPages)) ) )	// page normale et !onSession() )
		if ( 	( isset($_GET['action']) && (! in_array($_GET['action'], $specialPages)) )  // action normale !onSession() )
			 ||	( isset($_GET['page']) && (! in_array($_GET['page'], $specialPages)) )  	// page normale et !onSession() )
			 || ( ! isset($_GET['page']) && ! isset($_GET['action']) ) )					// ni action ni page (expiration serveur)
			{
			$_GET['page'] 	= 'errorpage';
			$_GET['errmsg'] = traductLib('msgError1');	//session expirée
			$_GET['suite']	= 'nopage';
		}
		
		if (isPage()) {
			
			include(page());
		}				

		if (isTemplate()) {
		
			$oSmarty->display(template());			
		}
		else {	// page inconnue ou nopage
			
			$oSmarty->display(__VIEWS_PAGES__ .'p_login.tpl');
		}
	}
	debug('SESSION 2:');debug($_SESSION);
	
	
// 	ob_end_flush();
	
	/////
	
	function action()	{ return __CONTROLLERS_ACTION__.'a_'.$_GET['action'].'.php'; }
	
	function page()		{ return __CONTROLLERS_ROOT__.'c_'.$_GET['page'].'.php'; }
	
	function template()	{ return __VIEWS_PAGES__.'p_'.$_GET['page'].'.tpl'; }
	
	
	function isAction()		{ return isset($_GET['action']) && file_exists(action()); }
	
	function isPage()		{ return isset($_GET['page']) && file_exists(page()); }
	
	function isTemplate()	{ return isset($_GET['page']) && file_exists(template()); }
	
?>
