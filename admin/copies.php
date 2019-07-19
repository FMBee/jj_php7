<?php 

// 	echo getcwd();
	$home = '/home/frederic/workspace/joli_jeune/trunk/';
	$import = '/home/frederic/workspace/import/trunk/';
	mkdir($import, 0777, true);
	
	$go = file_get_contents($home.'admin/go.php');

	if ($go == 'YES') {
		
		$newfile = 'prestations_types';
		
		mkdir($import.'controllers/action', 0777, true);
		copy($home.'controllers/action/a_clients.php', $import.'controllers/action/a_'.$newfile.'.php');
// 		copy($home.'controllers/c_clients.php', $home.'controllers/c_'.$newfile.'.php');
// 		copy($home.'controllers/c_clients_list.php', $home.'controllers/c_'.$newfile.'_list.php');
// 		copy($home.'models/m_clients.php', $home.'models/m_'.$newfile.'.php');
// 		copy($home.'sql/procs/s_clients_mjad.sql', $home.'sql/procs/s_'.$newfile.'_mjad.sql');
// 		copy($home.'views/config/g_clients.cfg', $home.'views/config/g_'.$newfile.'.cgf');
// 		copy($home.'views/footers/f_clients.tpl', $home.'views/footers/f_'.$newfile.'.tpl');
// 		copy($home.'views/footers/f_clients_list.tpl', $home.'views/footers/f_'.$newfile.'_list.tpl');
// 		copy($home.'views/pages/p_clients.tpl', $home.'views/pages/p_'.$newfile.'.tpl');
// 		copy($home.'views/pages/p_clients_list.tpl', $home.'views/pages/p_'.$newfile.'_list.tpl');
	
// 		file_put_contents($home.'admin/go.php', 'NO');
//		copy($home.'admin/gono.php', $home.'admin/go.php');
		echo 'END';
	}
	else {
		
		echo 'REFUSED';
	}
	
	?>	