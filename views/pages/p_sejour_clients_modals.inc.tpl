

<!-- Modal : ajout d'un client -->

<div class="modal fade" id="modal-addclient" tabindex="-1" role="dialog"
	aria-labelledby="modal-addclient-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-addclient-label">
						~{#mdladdclient#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
					<div class="row">
					 <div class="col-lg-6">

                 ~{*
                       <div class="dataTable_wrapper">
                           <table id="data-modal-addclient" width="100%" class="table table-striped table-bordered table-hover" >

								<thead>
									<tr>
										<th>~{#cli_nom#}~</th>
										<th>~{#cli_prenom#}~</th>
										<th>~{#cli_rue#}~</th>
										<th>~{#cli_ville#}~</th>
									</tr>
								</thead>
								<tbody>
									~{foreach from=$addClients item=ligne}~
										<tr id="~{$ligne.cli_id}~">
											<td>~{$ligne.cli_nom|strip}~</td>
											<td>~{$ligne.cli_prenom|strip}~</td>
											<td>~{$ligne.cli_rue|strip}~</td>
											<td>~{$ligne.cli_ville|strip}~</td>
										</tr>
									~{/foreach}~
								</tbody>
							</table>
						</div>
				*}~

						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients" 
											method="post" id="modal-faddclient">
						  
							<input name="modal-addclient-paramclient" id="modal-addclient-paramclient" hidden="true" value="">
							<input name="modal-addclient-paramsejour" id="modal-addclient-paramsejour" hidden="true" value="">
							<input name="modal-addclient-paramsejourname" id="modal-addclient-paramsejourname" hidden="true" value="">

							<div class="form-inline">
								  <div class="form-group">
									<label for="sk-nom">Nom&nbsp;&nbsp;</label>
		                          	<input type="checkbox" 	data-switch-no-init
				                  							name="sk-nom" 
				                  							id="sk-nom" 
				                  							value=""
				                  							disabled
				                  							checked >
								  </div>
								  <div class="form-group">
									<label for="sk-prenom">&nbsp;&nbsp;Prénom&nbsp;&nbsp;</label>
		                          	<input type="checkbox" 	data-switch-no-init
				                  							name="sk-prenom" 
				                  							id="sk-prenom" 
				                  							value="">
								  </div>
								  <div class="form-group">
									<label for="sk-ville">&nbsp;&nbsp;Ville&nbsp;&nbsp;</label>
		                          	<input type="checkbox" 	data-switch-no-init
				                  							name="sk-ville" 
				                  							id="sk-ville" 
				                  							value="">
								  </div>
								  <div class="form-group">
									<label for="sk-cp">&nbsp;&nbsp;Cp&nbsp;&nbsp;</label>
		                          	<input type="checkbox" 	data-switch-no-init
				                  							name="sk-cp" 
				                  							id="sk-cp" 
				                  							value="">
								  </div>
							</div> 
							<div class="form-group">
							    <input name="modal-addclient-introvalue" id="modal-addclient-introvalue" class="form-control" 
							    		placeholder="Tapez votre recherche" value="" autofocus>
							</div>  
								
							<button id="modal-addclient-addrecord" type="button" class="btn">
							~{#btnAdd#}~
							</button>
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">
							~{#btnCancel#}~
							</button>
									
					  </form>		
					  			
					</div>
				 </div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<!-- Modal : ajout d'une prestation -->

<div class="modal fade" id="modal-addprestation" tabindex="-1" role="dialog"
	aria-labelledby="modal-addprestation-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-addprestation-label">
						~{#mdladdprestation#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
				
					<div class="row">
					 <div class="col-lg-6">

						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients" 
											method="post" id="modal-faddprestation">
						  
							<input name="modal-addprestation-paramclient" id="modal-addprestation-paramclient" hidden="true" value="">
							<input name="modal-addprestation-paramindex" id="modal-addprestation-paramindex" hidden="true" value="">
							<input name="modal-addprestation-paramfacture" id="modal-addprestation-paramfacture" hidden="true" value="">
							<input name="modal-addprestation-paramprestation" id="modal-addprestation-paramprestation" hidden="true" value="">
							<input name="modal-addprestation-paramsejour" id="modal-addprestation-paramsejour" hidden="true" value="">
							<input name="modal-addprestation-paramsejourname" id="modal-addprestation-paramsejourname" hidden="true" value="">

	                       <div class="dataTable_wrapper">
	                           <table id="data-modal-addprestation" width="100%" class="table table-striped table-bordered table-hover" >
	
									<thead>
										<tr>
											<th>~{#pre_pty_code#}~</th>	
											<th>~{#fli_libelle#}~</th>	
											<th>~{#fli_puttc#}~</th>		
										</tr>
									</thead>
									<tbody>
										~{foreach from=$addPrestations item=ligne}~
											<tr id="~{$ligne.pre_id}~">
												<td>~{$ligne.pre_pty_code|strip}~</td>
												<td>~{$ligne.pre_libelle|strip}~</td>
												<td align="right">~{$ligne.pre_puttc|string_format:'%.2f'}~</td>
											</tr>
										~{/foreach}~
									</tbody>
								</table>
							</div>
							
							<div class="form-group">
							    <label>~{#fli_descriptif#}~</label>
							    <input name="modal-addprestation-fli_descriptif" id="modal-addprestation-fli_descriptif" class="form-control" required >
							</div>  

							<div class="form-group">
							    <label>~{#fli_puttc#}~</label>
							    <input name="modal-addprestation-fli_puttc" id="modal-addprestation-fli_puttc" class="form-control" required >
							</div>  
							
							<div class="form-group">
							    <label>~{#fli_quantite#}~</label>
							    <input name="modal-addprestation-fli_quantite" id="modal-addprestation-fli_quantite" class="form-control" value="1" required >
							</div>  
							
							<button id="modal-addprestation-addrecord" type="button" class="btn">
							~{#btnAdd#}~
							</button>
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">
							~{#btnCancel#}~
							</button>
							
					  </form>		
					  			
					</div>
				 </div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal : maj d'une prestation -->

<div class="modal fade" id="modal-majprestation" tabindex="-1" role="dialog"
	aria-labelledby="modal-majprestation-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-majprestation-label">
						~{#mdlmajprestation#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
				
					<div class="row">
					 <div class="col-lg-6">

						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients" 
											method="post" id="modal-fmajprestation">
						  
							<input name="modal-majprestation-paramclient" id="modal-majprestation-paramclient" hidden="true" value="">
							<input name="modal-majprestation-paramindex" id="modal-majprestation-paramindex" hidden="true" value="">
							<input name="modal-majprestation-paramfacture" id="modal-majprestation-paramfacture" hidden="true" value="">
							<input name="modal-majprestation-paramnumlig" id="modal-majprestation-paramnumlig" hidden="true" value="">
							<input name="modal-majprestation-paramsejour" id="modal-majprestation-paramsejour" hidden="true" value="">
							<input name="modal-majprestation-paramsejourname" id="modal-majprestation-paramsejourname" hidden="true" value="">

							<div class="form-group">
							    <label>~{#fli_descriptif#}~</label>
							    <input name="modal-majprestation-fli_descriptif" id="modal-majprestation-fli_descriptif" class="form-control" required >
							</div>  

							<div class="form-group">
							    <label>~{#fli_puttc#}~</label>
							    <input name="modal-majprestation-fli_puttc" id="modal-majprestation-fli_puttc" class="form-control" required >
							</div>  
							
							<div class="form-group">
							    <label>~{#fli_quantite#}~</label>
							    <input name="modal-majprestation-fli_quantite" id="modal-majprestation-fli_quantite" class="form-control" value="1" required >
							</div>  
							
							<button id="modal-majprestation-submit" type="button" class="btn">
							~{#btnSubmit#}~
							</button>&nbsp;
							<button id="modal-majprestation-suppr" type="button" class="btn">
							~{#btnSuppr#}~
							</button>&nbsp;
							<button type="button" class="btn btn-default" data-dismiss="modal">
							~{#btnCancel#}~
							</button>
							
					  </form>		
					  			
					</div>
				 </div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal : suppression d'un client (prospect) -->

<!-- <div class="modal fade" id="modal-supclient" tabindex="-1" role="dialog" -->
<!-- 	aria-labelledby="modal-supclient-label" aria-hidden="true"> -->
	
<!-- 	<div class="modal-dialog widget modal-vertical-centered"> -->
<!-- 		<div class="modal-content"> -->
		
<!-- 			<div class="modal-header widget-header"> -->
<!-- 					<h4 class="modal-title title" id="modal-supclient-label"> -->
<!-- 						~{#mdlsupclient#}~ -->
<!-- 					</h4> -->
<!-- 			</div> -->
			
<!-- 			<div class="modal-body widget-body"> -->
<!-- 				<div class="container"> -->
				
<!-- 					<div class="row"> -->
<!-- 					 <div class="col-lg-6"> -->

						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients" 
											method="post" id="modal-fsupclient">
						  
							<input name="modal-supclient-paramclient" id="modal-supclient-paramclient" hidden="true" value="">
							<input name="modal-supclient-paramsejour" id="modal-supclient-paramsejour" hidden="true" value="">
							<input name="modal-supclient-paramsejourname" id="modal-supclient-paramsejourname" hidden="true" value="">
							
<!-- 							<div class="form-group"> -->
<!-- 							    <label id="modal-supclient-name" class="form-control">...</label> -->
<!-- 							</div>   -->
<!-- 							</br> -->

<!-- 							<button id="modal-supclient-yes" type="button" class="btn"> -->
<!-- 							~{#btnYes#}~ -->
<!-- 							</button> -->
<!-- 							<button type="button" class="btn btn-default" data-dismiss="modal"> -->
<!-- 							~{#btnNo#}~ -->
<!-- 							</button> -->
							
					  </form>		
					  			
<!-- 					</div> -->
<!-- 				 </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- Modal : suppression d'une prestation -->

<!-- <div class="modal fade" id="modal-supprestation" tabindex="-1" role="dialog" -->
<!-- 	aria-labelledby="modal-supprestation-label" aria-hidden="true"> -->
	
<!-- 	<div class="modal-dialog widget modal-vertical-centered"> -->
<!-- 		<div class="modal-content"> -->
		
<!-- 			<div class="modal-header widget-header"> -->
<!-- 					<h4 class="modal-title title" id="modal-supprestation-label"> -->
<!-- 						~{#mdlsupprestation#}~ -->
<!-- 					</h4> -->
<!-- 			</div> -->
			
<!-- 			<div class="modal-body widget-body"> -->
<!-- 				<div class="container"> -->
				
<!-- 					<div class="row"> -->
<!-- 					 <div class="col-lg-6"> -->

						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients"
											method="post" id="modal-fsupprestation"	>
						  
							<input name="modal-supprestation-paramfacture" id="modal-supprestation-paramfacture" hidden="true" value="">
							<input name="modal-supprestation-paramindex" id="modal-supprestation-paramindex" hidden="true" value="">
							<input name="modal-supprestation-paramligne" id="modal-supprestation-paramligne" hidden="true" value="">
							<input name="modal-supprestation-paramsejour" id="modal-supprestation-paramsejour" hidden="true" value="">
							<input name="modal-supprestation-paramsejourname" id="modal-supprestation-paramsejourname" hidden="true" value="">
							
<!-- 							<div class="form-group"> -->
<!-- 							    <label id="modal-supprestation-name" class="form-control">...</label> -->
<!-- 							</div>   -->
<!-- 							</br> -->

<!-- 							<button id="modal-supprestation-yes" type="button" class="btn"> -->
<!-- 							~{#btnYes#}~ -->
<!-- 							</button> -->
<!-- 							<button type="button" class="btn btn-default" data-dismiss="modal"> -->
<!-- 							~{#btnNo#}~ -->
<!-- 							</button> -->
							
					  </form>		
					  			
<!-- 					</div> -->
<!-- 				 </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- Modal : confirm acompte -->

<!-- <div class="modal fade" id="modal-validacompte" tabindex="-1" role="dialog" -->
<!-- 	aria-labelledby="modal-validacompte-label" aria-hidden="true"> -->
	
<!-- 	<div class="modal-dialog widget modal-vertical-centered"> -->
<!-- 		<div class="modal-content"> -->
		
<!-- 			<div class="modal-header widget-header"> -->
<!-- 					<h4 class="modal-title title" id="modal-validacompte-label"> -->
<!-- 						~{#mdlvalidacompte#}~ -->
<!-- 					</h4> -->
<!-- 			</div> -->
			
<!-- 			<div class="modal-body widget-body"> -->
<!-- 				<div class="container"> -->
				
<!-- 					<div class="row"> -->
<!-- 					 <div class="col-lg-6"> -->

<!-- 						<div class="form-group"> -->
<!-- 						    <label id="modal-validacompte-name" class="form-control">...</label> -->
<!-- 						</div>   -->
<!-- 						</br> -->

<!-- 						<button id="modal-validacompte-yes" type="button" class="btn"> -->
<!-- 						~{#btnYes#}~ -->
<!-- 						</button> -->
<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal"> -->
<!-- 						~{#btnNo#}~ -->
<!-- 						</button> -->
							
<!-- 					</div> -->
<!-- 				 </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<!-- Modal : confirme édition -->

<!-- <div class="modal fade" id="modal-editfacture" tabindex="-1" role="dialog" -->
<!-- 	aria-labelledby="modal-editfacture-label" aria-hidden="true"> -->
	
<!-- 	<div class="modal-dialog widget modal-vertical-centered"> -->
<!-- 		<div class="modal-content"> -->
		
<!-- 			<div class="modal-header widget-header"> -->
<!-- 					<h4 class="modal-title title" id="modal-editfacture-label"> -->
<!-- 						~{#mdleditfacture#}~ -->
<!-- 					</h4> -->
<!-- 			</div> -->
			
<!-- 			<div class="modal-body widget-body"> -->
<!-- 				<div class="container"> -->
				
<!-- 					<div class="row"> -->
<!-- 					 <div class="col-lg-6"> -->

<!-- 						<div class="form-group"> -->
<!-- 						    <label id="modal-editfacture-name" class="form-control">...</label> -->
<!-- 						</div>   -->
<!-- 						</br> -->

<!-- 						<button id="modal-editfacture-yes" type="button" class="btn"> -->
<!-- 						~{#btnYes#}~ -->
<!-- 						</button> -->
<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal"> -->
<!-- 						~{#btnNo#}~ -->
<!-- 						</button> -->
							
<!-- 					</div> -->
<!-- 				 </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->