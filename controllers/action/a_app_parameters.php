<?php

	foreach($_POST as $key => $val) 
		{
		if (substr($key,0,6) == 'param_')	
			{			
			$data = array('prt_id'    => substr($key,6),
						  'prt_value' => $val);
			
			App_Parameters::MAJ($pdo, $data);
			}
		};

?>