<?php

	session_start();
	require('x_common.inc.php');
	
	
	$subject 	= utf8_decode($_GET['objet']);
	$mail_to 	= trim($_GET['mail']);
	$from_mail 	= trim($_SESSION['__user_mail__']); 
	$from_name 	= utf8_decode(__APP_TITLE__);
	$reply_to 	= trim($_SESSION['__user_mail__']); 

	$entete  = "From: $from_name <$from_mail> \n";
	$entete .= "Bcc: $reply_to \n";
	$entete .= "Reply-to: $reply_to \n";
	$entete .= "Content-Type: text/html; charset=\"iso-8859-1\"";

	$message = trim($_GET['texte']);

	if (mail($mail_to, $subject, $message, $entete)) {
	
		echo json_encode( array( "retour" => 1 ));
	}
	else {
	
		echo json_encode( array( "retour" => 0 ));
	}
?>