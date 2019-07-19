
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_sejour_clients.cfg' section = $smarty.session.__user_lang__}~

  
  ~{include file = 'p_sejour_clients_modals.inc.tpl'}~
  
  <div id="page-wrapper">
  
       <div class="row">
           <div class="col-lg-12">
              <div class="page-header">
                ~{*if precPageOn()}~
					<a 	class="fa fa-arrow-left fa-2x" 
						href="~{precPage()}~" >
					</a>&nbsp;&nbsp;
				~{/if*}~
                <span style="font-size:150%;">~{#title#}~&nbsp;~{$paramname}~</span>
              </div>
           </div>
       </div>
       
       <div class="row">
           <div class="col-lg-6">

               <div class="panel panel-default">
                   <div class="panel-heading">
		               <h4>~{#tabtitle1#}~&nbsp;&nbsp;<a id="mailtoall" href="#" class="fa fa-envelope"></a></h4>
                   </div>
                   <div class="panel-body">
								
						<div class="dataTable_wrapper">
                      
                           <table id="data-allclients" width="100%" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th>N°</th>		
										<th>~{#cli_nom#}~</th>		
										<th>~{#scl_etat#}~</th>	
										<th>~{#fac_numero#}~</th>	
										<th>Total</th>	
										<th>Solde</th>	
										<th class="hidden">fac_id</th>	
										<th class="hidden">fac_totalregle</th>	
										
<!-- 										<th>~{#cli_nom#}~</th>		 -->
<!-- 										<th>~{#cli_prenom#}~</th>	 -->
<!-- 										<th>~{#scl_etat#}~</th>	 -->
<!-- 										<th>Mail</th>	 -->
<!-- 										<th>~{#cli_ville#}~</th>	 -->
<!-- 										<th>~{#fac_numero#}~</th>	 -->
<!-- 										<th class="hidden">fac_id</th>	 -->
<!-- 										<th class="hidden">fac_totalttc</th>	 -->
<!-- 										<th class="hidden">cli_email</th>	 -->
<!-- 										<th class="hidden">fac_totalregle</th>	 -->
									</tr>
								</thead>
								
								<tbody>
									
									~{assign var=allmails value=''}~
									~{assign var=numero value=1}~
									~{assign var=totalfact value=0}~
									~{assign var=totalrestant value=0}~
									
									~{foreach from=$allClients item=ligne}~
									
										<tr id="~{$ligne.cli_id}~"
										
											~{if $ligne.scl_etat eq 0}~ class="info"
											~{elseif $ligne.scl_etat eq 1}~ class="success"
											~{elseif $ligne.scl_etat eq 2}~ class="warning"
											~{else}~ class="warning"
											~{/if}~
										>
											<td>~{$numero|strip}~</td>
											~{*
											<td>~{($ligne.cli_nom|strip)|cat:' '|cat:($ligne.cli_prenom|strip)}~</td>
											*}~
											<td>
												<a href="index.php?page=clients&paramkey=~{$ligne.cli_id}~&paramname=~{$ligne.cli_nom|cat:' '|cat:$ligne.cli_prenom}~">
												~{($ligne.cli_nom|strip)|cat:' '|cat:($ligne.cli_prenom|strip)}~	
												</a>
											</td>
											
											<td>~{$etatsVal[$ligne.scl_etat]}~</td>	
											<td>
												~{if isset($ligne.fac_numero)}~
													~{$ligne.fac_numero|strip}~
												~{else}~
													~{if isset($ligne.fac_id)}~
														(brouillon)
													~{else}~
														(à créer)
													~{/if}~
												~{/if}~
											</td>	        
											<td align="right">~{$ligne.fac_totalttc|strip|string_format:'%.2f'}~</td>	
											<td align="right">~{($ligne.fac_totalttc-$ligne.fac_totalregle)|strip|string_format:'%.2f'}~</td>	
											<td class="hidden">~{$ligne.fac_id|strip}~</td>	
											<td class="hidden">~{$ligne.fac_totalregle|strip|string_format:'%.2f'}~</td>	
											
										</tr>
										
										~{$allmails = $allmails|cat:($ligne.cli_email|strip)|cat:', '}~
										~{$numero = $numero+1}~
										~{$totalfact = $totalfact + $ligne.fac_totalttc}~
										~{$totalrestant = $totalrestant + ( ($ligne.fac_totalttc - $ligne.fac_totalregle) )}~
										
									~{/foreach}~
									
								</tbody>
							</table>
							
					    </div>

						<div class="col-sm-6">
		                    <input id="allmails" value="~{$allmails}~" hidden="true">
		                    
		                    </br>
							<button id="addclient" type="button" class="btn">
							~{#btnAdd#}~</button>
							
							<button id="supclient" type="button" class="btn">
							~{#btnSuppr#}~</button>
						</div>

						<div class="col-sm-6">
							<label class="pull-right">
								<h4>&nbsp;&nbsp;~{#libtotalfact#}~&nbsp;
								~{$totalfact|string_format:'%.2f'}~
								</h4>
							</label>
							<label class="pull-right">
								<h4>~{#libtotalrestant#}~&nbsp;
								~{$totalrestant|string_format:'%.2f'}~
								</h4>
							</label>
						</div>
	                    
						
					</div>
				</div>
					            
				<div id="diveditallfactures" class="panel panel-default">
	            
	                <div class="panel-body">
	                
						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients" 
											method="post" id="feditallfactures"	class="form-horizontal">
						  
							<input name="editallfactures-paramindex" id="editallfactures-paramindex" hidden="true" value="">
							<input name="editallfactures-paramsejour" id="editallfactures-paramsejour" hidden="true" value="">
							<input name="editallfactures-paramsejourname" id="editallfactures-paramsejourname" hidden="true" value="">

							<button id="editallfactures" type="button" class="btn pull-left">
							~{#btnallfactures#}~</button>
							
					  	</form>
					  
					</div>
				</div>
				
				
			</div>
		
	        <div class="col-lg-6">
	
	            <div class="panel panel-default">
	            
	                <div class="panel-heading">
	              		<h4>~{#tabtitle2#}~<span id="nomprenom"></span></h4>
	                </div>
	                
	                <div class="panel-body">
	                
						<div class="dataTable_wrapper">
	                    
	                        <table id="data-allprestations" width="100%" class="table table-striped table-bordered table-hover" >
	
								<thead>
									<tr>
										<th>N°</th>	
										<th class="hidden">~{#pre_pty_code#}~</th>	
										<th>~{#fli_descriptif#}~</th>	
										<th>~{#fli_quantite#}~</th>		
										<th>~{#fli_puttc#}~</th>		
										<th>~{#fli_totalttc#}~</th>		
										<th class="hidden">cli_id</th>		
									</tr>
								</thead>
								
								<tbody>
									~{foreach from=$allPrestations item=ligne}~
									
										<tr id="~{$ligne.fli_numlig}~">
											<td>~{$ligne.fli_numlig|strip}~</td>	
											<td class="hidden">~{$ligne.pre_pty_code|strip}~</td>	
											<td>~{$ligne.fli_descriptif|strip}~</td>	
											<td align="right">~{$ligne.fli_quantite|strip|string_format:'%.2f'}~</td>		
											<td align="right">~{$ligne.fli_puht|strip|string_format:'%.2f'}~</td>		
											<td align="right">~{$ligne.fli_totalttc|strip|string_format:'%.2f'}~</td>		
											<td class="hidden">~{'cli_'|cat:($ligne.cli_id|strip)}~</td>		
										</tr>
												
									~{/foreach}~
								</tbody>
	
							</table>
							
							<label id="totalprestations" class="pull-right">
								<h4>
									~{#libtotalttc#}~&nbsp;
									<span id="montantprestations"></span>
								</h4>
							</label>
						
				    	</div>
			            
						<button id="addprestation" type="button" class="btn">
						~{#btnAdd#}~</button>
						
					</div>
				</div>
				
	            <div id="saisieacompte" class="panel panel-default">
	            
	                <div class="panel-heading">
	              		<h4>~{#tabtitle3#}~</h4>
	                </div>
	                
	                <div class="panel-body">
	                
						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients" 
											method="post" id="fsaisieacompte"	class="form-horizontal">
						  
							<input name="saisieacompte-paramclient" id="saisieacompte-paramclient" hidden="true" value="">
							<input name="saisieacompte-paramindex" id="saisieacompte-paramindex" hidden="true" value="">
							<input name="saisieacompte-paramfacture" id="saisieacompte-paramfacture" hidden="true" value="">
							<input name="saisieacompte-paramsejour" id="saisieacompte-paramsejour" hidden="true" value="">
							<input name="saisieacompte-paramsejourname" id="saisieacompte-paramsejourname" hidden="true" value="">

							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_date#}~</label>
							    <div class="col-sm-8">
								    <input name="saisieacomptereg_date" id="saisieacomptereg_date" 
								    	value="~{date('d/m/Y')}~" class="form-control" required >
							    </div>
							</div>  

							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_mode#}~</label>
							    <div class="col-sm-8">
								    <input name="saisieacomptereg_mode" id="saisieacomptereg_mode" class="form-control" required >
							    </div>
							</div>  

							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_libelle#}~</label>
							    <div class="col-sm-8">
								    <input name="saisieacomptereg_libelle" id="saisieacomptereg_libelle" class="form-control" >
								</div>  
							</div>  

							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_montant#}~</label>
							    <div class="col-sm-8">
								    <input name="saisieacomptereg_montant" id="saisieacomptereg_montant" class="form-control" required >
								</div>  
							</div>  

							<button id="addacompte" type="button" class="btn">
							~{#btnAdd#}~</button>
							
					  	</form>
					  
					</div>
				</div>
				
	            <div id="affictotalregle" class="panel panel-default">
	            
	                <div class="panel-body">
	                
						<label class="pull-right">
							<h4>
								~{#libtotalregle#}~&nbsp;
								<span id="montantregle"></span>
							</h4>
						</label>
					  
					</div>
				</div>
				
	            <div id="diveditfacture" class="panel panel-default">
	            
	                <div class="panel-body">
	                
<!-- 						<form role="form" 	action="index.php?action=facture_prn" target="_blank"  -->
						<form role="form" 	action="index.php?action=sejour_clients&page=sejour_clients" 
											method="post" id="feditfacture"	class="form-horizontal">
						  
							<input name="editfacture-paramfacture" id="editfacture-paramfacture" hidden="true" value="">
							<input name="editfacture-paramindex" id="editfacture-paramindex" hidden="true" value="">
							<input name="editfacture-paramsejour" id="editfacture-paramsejour" hidden="true" value="">
							<input name="editfacture-paramsejourname" id="editfacture-paramsejourname" hidden="true" value="">

							<button id="editfacture" type="button" class="btn pull-left">
							~{#btnfacture#}~</button>
							
					  	</form>
					  
					</div>
				</div>
				
				
			</div>
		</div>
		
  </div>
  <!-- page-wrapper End -->
