<?php

	$_file_ = __FILE__;
	include(__CONTROLLERS_ROOT__.'o_listemode.inc.php');

	$oSmarty->assign('allSejours', Sejours::getAll($pdo));

?>