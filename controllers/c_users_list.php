<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_listemode.inc.php');

	$tabUsers = Users::getAll($pdo);
	
	foreach ($tabUsers as &$user)
	{
		$user['tag'] = ($user['usr_out_date'] == '' ? 'IN' : 'OUT');
	}
	
	$oSmarty->assign('allUsers', $tabUsers);

	
?>