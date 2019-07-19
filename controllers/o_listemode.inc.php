<?php

	$_file_ = substr($_file_, strripos($_file_, '/')+1);	//nom du controller
	$_file_ = substr($_file_, 0, strpos($_file_, '.'));
	
	$_SESSION['__variables__']['prev_controller'] = ( empty($_SESSION['__variables__']['curr_controller']) ?
													  'c_index.php' :
													  $_SESSION['__variables__']['curr_controller'] );
	$_SESSION['__variables__']['curr_controller'] = $_file_;

// 	if (isset ( $_POST['paramkey'] )) { // depuis liste
		
// 		$param = $_POST;
// 	}
// 	if (isset ( $_GET['paramkey'] )) { // en direct
		
// 		$param = $_GET;
// 	}
	
// 	$oSmarty->assign( 'paramkey', $param['paramkey'] );
// 	$oSmarty->assign( 'paramname', $param['paramname'] );

?>