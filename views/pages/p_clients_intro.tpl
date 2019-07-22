

 <div id="page-wrapper">
 
 		<div class="row">
            <div class="col-lg-6">
              <div class="page-header">
                <h4><span style="font-size:150%;">Liste des clients</span></h4>
              </div>
            </div>
        </div>
        
		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
                     <div class="panel-heading">
                     </div>
                     <div class="panel-body">
                         <div class="row">
                            <div class="col-lg-12">
                            
						<form role="form" 	action="clients_list.html" 
											method="post" id="flistclient">
						  
							<input name="listclient-paramclient" id="listclient-paramclient" hidden="true" value="">

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
							    <input name="listclient-introvalue" id="listclient-introvalue" class="form-control" 
							    		placeholder="Tapez votre recherche" value="" autofocus>
							</div>  
								
					  </form>		

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
                            