
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_saisie_reglt.cfg' section = $smarty.session.__user_lang__}~

  
  ~{include file = 'p_saisie_reglt_modals.inc.tpl'}~
  
  <div id="page-wrapper">
  
       <div class="row">
           <div class="col-lg-12">
              <div class="page-header">
                <span style="font-size:150%;">
                	~{#title#}~
                    ~{if isset($modecompta)}~
                    	&nbsp;correctif
                    ~{/if}~
                </span>
              </div>
           </div>
       </div>
       
       <div class="row">
           <div class="col-lg-8">

               <div class="panel panel-default">
                   <div class="panel-heading">
                   	 ~{if isset($modecompta)}~
		               <h4>~{$debut}~</h4>
		             ~{else}~
		               <h4>~{#tabtitle1#}~</h4>
					 ~{/if}~
                   </div>
                   <div class="panel-body">
								
						<div class="dataTable_wrapper">
                      
                           <table id="data-allfactures" width="100%" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th>~{#reg_affect#}~</th>		
										<th>~{#fac_totaldu#}~</th>		
										<th>~{#fac_totalttc#}~</th>		
										<th>~{#fac_numero#}~</th>	
										<th>~{#fac_date#}~</th>		
										<th>~{#fac_client#}~</th>		
										<th>~{#sej_libelle#}~</th>		
										<th class="hidden">fac_id~</th>		
									</tr>
								</thead>
								
								<tbody>
									
									~{foreach from=$allFactures item=facture}~
									
										<tr>
											<td align='right' class="warning">0.00</td>		
											<td align='right' class="info">~{($facture.fac_totalttc - $facture.fac_totalregle)|string_format:'%.2f'}~</td>		
											<td align='right'>~{$facture.fac_totalttc|string_format:'%.2f'}~</td>		
											<td align='center'>~{$facture.fac_numero|strip}~</td>	
											<td>~{$facture.fac_date|strip|Date_format:'%d/%m/%Y'}~</td>		
											<td>~{$facture.cli_nom|cat:" "|cat:$facture.cli_prenom|strip}~</td>	
											<td>~{"N°"|cat:$facture.sej_id|cat:" du "|cat:($facture.sej_debut|Date_format:'%d/%m/%Y')}~</td>	
											<td class="hidden">~{$facture.fac_id}~</td>	
										</tr>
										
									~{/foreach}~
									
								</tbody>
							</table>
							
					    </div>
	                    
					</div>
				</div>
			</div>
		
	        <div class="col-lg-4">
	
	            <div id="saisiereglement" class="panel panel-default">
	            
	                <div class="panel-heading">
	              		<h4>~{#tabtitle2#}~</h4>
	                </div>
	                
	                <div class="panel-body">
	                
						<form role="form" 	
		                   	 ~{if isset($modecompta)}~
								action="index.php?action=saisie_reglt&page=saisie_reglt&modecompta=1" 
							 ~{else}~
								action="index.php?action=saisie_reglt&page=saisie_reglt"
							 ~{/if}~ 
							 method="post" id="fsaisiereglement"	class="form-horizontal">
						  
							<input name="saisiereglement-lignes" id="saisiereglement-lignes" hidden="true" value="">

							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_date#}~</label>
							    <div class="col-sm-6">
								    <input name="reg_date" id="reg_date" value="~{date('d/m/Y')|Date_format:'%d/%m/%Y'}~"
								    	class="form-control" required >
							    </div>
							</div>  
							
							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_mode#}~</label>
							    <div class="col-sm-6">
								    <input name="reg_mode" id="reg_mode" class="form-control" required >
							    </div>
							</div>  

							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_libelle#}~</label>
							    <div class="col-sm-6">
								    <input name="reg_libelle" id="reg_libelle" class="form-control" >
								</div>  
							</div>  

							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_montant#}~</label>
							    <div class="col-sm-6">
								    <input name="reg_montant" id="reg_montant" class="form-control" required >
								</div>  
							</div>  

							</br></br>
							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_affect#}~</label>
							    <div class="col-sm-6">
								    <input id="reg_affect" class="form-control" disabled >
								</div>  
							</div>  
		
							<div class="form-group">
							    <label class="control-label col-sm-2">~{#reg_solde#}~</label>
							    <div class="col-sm-6">
								    <input id="reg_solde" class="form-control" disabled >
								</div>  
							</div>

							<button id="addreglement" type="button" class="btn">
							~{#btnValid#}~</button>
							
					        <a class="btn btn-default pull-right" href="saisie_reglt.html" >
					        ~{#btnCancel#}~
					        </a>
						
							
					  	</form>
					  
					</div>
					
				</div>
				<div class="panel-body">
				
					  
				</div>
				
			</div>
		</div>
		
  </div>
  <!-- page-wrapper End -->
