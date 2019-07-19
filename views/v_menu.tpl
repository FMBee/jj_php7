
<nav class="navbar navbar-default navbar-static-top" role="navigation" 
	style="margin-bottom: 0; background-position: center top; 
	background-image: url('~{$smarty.const.__VIEWS_IMG__}~bandeau.jpg');
    background-repeat: no-repeat; background-attachment: inherit;">
	
	<div class="navbar-header" >
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.html">Gestion ~{$smarty.const.__APP_TITLE__}~</a>
	</div>
	<ul class="nav navbar-top-links navbar-right">
	
		~{if $smarty.session.__root_mode__ === true}~
		
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="fa fa-cogs fa-fw"></i>  
				</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="app_parameters.html"><i class="fa fa-gear fa-fw"></i> Param&egrave;tres </a>
					</li>
					<li class="divider"></li>
					<li><a href="admin/copies.php"><i class="fa fa-sign-out fa-fw"></i> Exécution</a>
					</li>
				</ul>
			</li>
			
		~{/if}~
		
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<i class="fa fa-user fa-fw"></i>  
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="users_list.html"><i class="fa fa-group fa-fw"></i> ~{$smarty.session.__user_name__}~</a>
				</li>
				<li class="divider"></li>
				<li><a href="deconnect-index.html"><i class="fa fa-sign-out fa-fw"></i> D&eacute;connexion</a>
				</li>
			</ul>
		</li>
	</ul>
	
	<div class="navbar-default sidebar" role="navigation">
<!-- 		<div class="sidebar-nav navbar-collapse" > -->
		<div class="sidebar-nav" >
			<ul class="nav" id="side-menu">
				<li>
					<a href="index.html"><i class="fa fa-book fa-fww"></i> Suivi des séjours</a>
				</li>
				<li>
					<a href="index.php?page=clients&paramkey=new"><i class="fa fa-plus-square fa-fw"></i> Ajout d'un client</a>
				</li>
				<li>
					<a href="saisie_reglt.html"><i class="fa fa-plus-square fa-fw"></i> Saisie d'un règlement</a>
				</li>
				<li>
					<a href="#"><i class="fa fa-book fa-fw"></i> Fichiers<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li>
							<a href="clients_intro.html"><i class="fa fa-users fa-fw"></i> Fichier clients</a>
						</li>
						<li>
							<a href="sejours_list.html"><i class="fa fa-calendar fa-fw"></i> Fichier séjours</a>
						</li>
						<li>
							<a href="prestations_list.html"><i class="fa fa-shopping-cart fa-fw"></i> Fichier prestations</a>
						</li>
						<li>
							<a href="clients_export.html"><i class="fa fa-cogs fa-fw"></i> Export Clients</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Comptabilité<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li>
							<a href="factures_list.html"><i class="fa fa-book fa-fw"></i> Liste des factures</a>
						</li>
						<li>
							<a href="reglements_list.html"><i class="fa fa-book fa-fw"></i> Liste des règlements</a>
						</li>
						<li>
							<a href="index.php?page=saisie_reglt&modecompta=1"><i class="fa fa-plus-square fa-fw"></i> Règlement correctif</a>
						</li>
						<li>
							<a href="edition_tva.html"><i class="fa fa-cogs fa-fw"></i> Edition comptable</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="#"><i class="fa fa-wrench fa-fw"></i> Paramétrages<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
<!-- 						<li> -->
<!-- 							<a href="#"><i class="fa fa-shopping-cart fa-fw"></i> Codes prestations</a> -->
<!-- 						</li> -->
						<li>
							<a href="parametres.html"><i class="fa fa-cogs fa-fw"></i> Général</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
