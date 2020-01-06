
<?php

	include(__CONTROLLERS_ACTION__.'a_deconnect.php');

	if (! isset($_SESSION['__log_try__']))
	{
		$_SESSION['__log_try__'] = 0;
	}

	$logErr = "";

	if ($data = Users::getOneByLogin($pdo, $_POST["login"]))
		{
		//debug($data);
		if (password_verify($_POST["password"], $data['usr_password']))
			{
			$_SESSION['__user_id__']	= $data['usr_id'];

			maj_user_ss($data);

//			maj_options_ss($data);
		}
		else
			{
			$logErr = traductLib('vldLogin1');
		}
	}
	else
		{
		$logErr = traductLib('vldLogin2');
	}

	if (! empty($logErr))
		{
		$_SESSION['__log_try__']++;

		if ($_SESSION['__log_try__'] == __LOG_TRY__)
			{
			$_SESSION['__log_try__'] = 0;

			if (isset($data['pro_access']) && $data['pro_access'] > __ADMIN_MINACCESS__)
				{
				header('Location: errorpage.' . traductLib('msgLogin2') . '.htm');
			}
			else
				{
				header('Location: errorpage.' . traductLib('msgLogin1') . '.htm');
			}
		}
		else
			{
			header('Location: errorpage.'.$logErr.'.htm');
		}
	}


