<?php

class App_Parameters 
{

	public static function getAll($pdo)	
		{
		$data = $pdo ->query('SELECT * '.
							 'FROM app_parameters_details')
					 ->fetchAll(PDO::FETCH_ASSOC);
		
		return ($data);
		}

	public static function MAJ($pdo, $data)
		{
		$req    = $pdo->prepare("CALL app_parameters_maj( ?, ?)");
	
		$maj = $req->execute(array(	$data['prt_id'],
										$data['prt_value']
									));
		return ($maj);
		}
		
}
	
?>