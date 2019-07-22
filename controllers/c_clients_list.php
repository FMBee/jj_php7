<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_listemode.inc.php');

	if ( $_POST['listclient-paramclient'] == '$13' ) {	

		$oSmarty->assign('introvalue', trim($_POST['listclient-introvalue']));
    	$oSmarty->assign('allClients', Clients::getAllIn($pdo));
	}
	else{
	    $paramkey = $_POST['listclient-paramclient'];
	    $paramname = substr(
	        $_POST['listclient-introvalue'],
	        0,
	        strpos($_POST['listclient-introvalue'], '-')
	        );
	    
	    header("Location: index.php?page=clients&paramkey={$paramkey}&paramname={$paramname}");
	}
	

?>