<?php

	$oSmarty->assign('fichemode', 'direct');
	$oSmarty->assign('paramkey', '1');	
	$oSmarty->assign('paramname', '');

	$oSmarty->assign('parametre', Parametres::getOne($pdo, '1'));
	 
?>