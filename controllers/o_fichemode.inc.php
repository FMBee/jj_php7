<?php

	$_file_ = substr($_file_, strripos($_file_, '/')+1);	//nom du controller
	$_file_ = substr($_file_, 0, strpos($_file_, '.'));
	
	$_SESSION['__variables__']['prev_controller'] = ( empty($_SESSION['__variables__']['curr_controller']) ?
													  'c_index.php' :
													  $_SESSION['__variables__']['curr_controller'] );
	$_SESSION['__variables__']['curr_controller'] = $_file_;
	
	$noparam = true;
	
	if (isset($_POST['paramkey'])) {	// depuis liste

		$_SESSION['__variables__'][$_file_] = [];	
		$_SESSION['__variables__'][$_file_]['_POST'] = $_POST;	//sauvegarde
		
		$noparam = false;
		$param = $_POST;
		$oSmarty->assign('fichemode', 'liste');
	}
	if (isset($_GET['paramkey'])) { 	// en direct
	
		$_SESSION['__variables__'][$_file_] = [];
		$_SESSION['__variables__'][$_file_]['_GET'] = $_GET;	//sauvegarde
		$noparam = false;
		$param = $_GET;
		$oSmarty->assign('fichemode', 'direct');
	}
	
	if ($noparam) {
		
		if (isset($_SESSION['__variables__'][$_file_]['_POST'])) {
			
			$param = $_SESSION['__variables__'][$_file_]['_POST'];
		}
		else{
			if (isset($_SESSION['__variables__'][$_file_]['_GET'])) {
				
				$param = $_SESSION['__variables__'][$_file_]['_GET'];
			}
		}
	}
//debug($_SESSION);	
	
	if ($param['paramkey'] == 'new') {	// creation
		 
		$param['paramkey'] = 0;
		$param['paramname'] = 'new';
	}
	$oSmarty->assign('paramkey', 	$param['paramkey']);
	$oSmarty->assign('paramname', 	$param['paramname']);
	
?>