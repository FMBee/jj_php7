
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_reglements.cfg' section = $smarty.session.__user_lang__}~

 <div id="page-wrapper">
 
 		<div class="row">
           <div class="col-lg-12">
              <div class="page-header">
				<a 	class="fa fa-arrow-left fa-2x" 
					href="~{precPage()}~" >
				</a>&nbsp;&nbsp;
                <span style="font-size:150%;">~{#title#}~
              </div>
            </div>
        </div>
        
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
                     <div class="panel-heading">
                       <h3>
						~{if $paramname eq "new"}~
							~{#libnouveau#}~
						~{else}~
							~{#subtitle#}~&nbsp;~{$paramname}~
						~{/if}~
                       </h3>
                     </div>
                     
                     <div class="panel-body">
                         <div class="row">
                         
                            <div class="col-lg-12">
                            
							  <form id="freglements" method="post" role="form" action="reglements-reglements_list.html">
							
								<input name="paramkey" id="paramkey" hidden="true" value="~{$paramkey}~">
								
								<div class="col-lg-6">
								
									<div class="form-group">
									    <label>~{#reg_id#}~</label>
									    <input name="reg_id" id="reg_id" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#reg_id#}~"
										    ~{else}~ value="~{$reglement.reg_id}~"
										    ~{/if}~ disabled >
									</div>  
									
									<div class="form-group">
									    <label>~{#reg_date#}~</label>
									    <input name="reg_date" id="reg_date" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#reg_date#}~"
										    ~{else}~ value="~{$reglement.reg_date|Date_format:'%d/%m/%Y'}~"
										    ~{/if}~ readonly >
									</div>  
									
									<div class="form-group">
									    <label>~{#reg_libelle#}~</label>
									    <input name="reg_libelle" id="reg_libelle" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#reg_libelle#}~"
										    ~{else}~ value="~{$reglement.reg_libelle}~"
										    ~{/if}~  >
									</div>  
									
									
								</div> 
								
								<div class="col-lg-6">
						        
									<div class="form-group">
									    <label>~{#reg_mode#}~</label>
									    <input name="reg_mode" id="reg_mode" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#reg_mode#}~"
										    ~{else}~ value="~{$reglement.reg_mode}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#reg_montant#}~</label>
									    <input name="reg_montant" id="reg_montant" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#reg_montant#}~"
										    ~{else}~ value="~{$reglement.reg_montant|string_format:'%.2f'}~"
										    ~{/if}~ disabled >
									</div>  
									
									<div class="form-group">
									    <label>~{#reg_remise#}~</label>
									    <input name="reg_remise" id="reg_remise" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#reg_remise#}~"
										    ~{else}~ value="~{$reglement.reg_remise|Date_format:'%d/%m/%Y'}~"
										    ~{/if}~ required >
									</div>  
									
									</br>
							        <button type="submit" class="btn" >~{#btnSubmit#}~</button>
	
							        <a class="btn btn-default" 
								        ~{if $fichemode eq "liste"}~
							        		href="reglements_list.html" >
							        	~{else}~
							        		href="index.html" >
							        	~{/if}~
							        ~{#btnCancel#}~
							        </a>
							        
								</div>
								
							</form>
							
							<label><h3>Affectation du règlement</h3></label>
							
							<div class="dataTable_wrapper">
	                       
	                           <table id="data-lignesreglement" width="100%" class="table table-striped table-bordered table-hover" >
									<thead>
										<tr>
											<th>~{#fac_numero#}~</th>	
											<th>~{#fac_nom#}~</th>		
											<th>~{#fac_totalttc#}~</th>	
											<th>~{#rli_montant#}~</th>		
										</tr>
									</thead>
									
									<tbody>
										~{foreach from=$lignesReglement item=ligne}~
											<tr id="~{$ligne.rli_id}~">
												<td>
													<a href="index.php?page=factures&paramkey=~{$ligne.fac_id}~&paramname=~{$ligne.fac_numero}~&paraminput=disabled">
													~{if isset($ligne.fac_numero)}~	
														N°~{$ligne.fac_numero|strip}~
													~{else}~
														(brouillon)
													~{/if}~
													</a>
												</td>		
												<td>
													<a href="index.php?page=clients&paramkey=~{$ligne.fac_cli_id}~&paramname=~{$ligne.fac_nom|cat:' '|cat:$ligne.fac_prenom}~">
													~{$ligne.fac_nom|strip}~	
													</a>
												</td>
												<td>~{$ligne.fac_totalttc|strip|string_format:'%.2f'}~</td>	
												<td>~{$ligne.rli_montant|strip|string_format:'%.2f'}~</td>		
											</tr>
										~{/foreach}~
									</tbody>
								</table>
							<div class="clearfix"></div>
							
						  </div>
							

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


                            