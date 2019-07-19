
						 <br/>
                         <div class="row">
                            <div class="col-lg-12">
                            
							<form id="fclients" method="post" role="form" 
							
								~{if $smarty.session.__variables__.prev_controller === 'c_sejour_clients'}~
								
									~{if empty($smarty.session.__variables__.c_sejour_clients._POST)}~

							     		action="index.php?action=clients&page=sejour_clients&paramkey=~{$smarty.session.__variables__.c_sejour_clients._GET.paramkey}~&paramname=~{$smarty.session.__variables__.c_sejour_clients._GET.paramname}~"

								    ~{else}~
							     		action="index.php?action=clients&page=sejour_clients&paramkey=~{$smarty.session.__variables__.c_sejour_clients._POST.paramkey}~&paramname=~{$smarty.session.__variables__.c_sejour_clients._POST.paramname}~"

								    ~{/if}~	
							    ~{else}~

		        					~{if $fichemode eq 'liste'}~
								     		action="clients-clients_intro.html"
								    ~{else}~
								       		action="clients-index.html"
								    ~{/if}~	

							    ~{/if}~	
								
								
							>					
								<input name="paramkey" id="paramkey" hidden="true" value="~{$paramkey}~">
								
								<div class="col-lg-6">
								
									<div class="form-group">
										<label>~{#cli_civ_code#}~</label>
									    <select name="cli_civ_code" id="cli_civ_code" class="selectpicker form-control" required>
									    	~{foreach $civilites as $civilite}~
										  		<option value="~{$civilite.civ_code}~"
											  		~{if $paramkey neq 0}~
											  			~{if $client.cli_civ_code eq $civilite.civ_code}~ selected~{/if}~
											  		~{/if}~ >
											  		~{$civilite.civ_libelle}~
										  		</option>
										 	~{/foreach}~
									    </select>        
									</div> 
									
									<div class="form-group">
									    <label>~{#cli_nom#}~</label>
									    <input name="cli_nom" id="cli_nom" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#cli_nom#}~"
										    ~{else}~ value="~{$client.cli_nom}~"
										    ~{/if}~ required >
									</div>  
									     
									<div class="form-group">
									    <label>~{#cli_prenom#}~</label>
									    <input name="cli_prenom" id="cli_prenom" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_prenom#}~"
									    	~{else}~ value="~{$client.cli_prenom}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_rue#}~</label>
									    <input name="cli_rue" id="cli_rue" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_rue#}~"
									    	~{else}~ value="~{$client.cli_rue}~"
									    	~{/if}~  >
									</div>
									<div class="form-group">
									    <label>~{#cli_complement#}~</label>
									    <input name="cli_complement" id="cli_complement" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_complement#}~"
									    	~{else}~ value="~{$client.cli_complement}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_codepostal#}~</label>
									    <input name="cli_codepostal" id="cli_codepostal" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_codepostal#}~"
									    	~{else}~ value="~{$client.cli_codepostal}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_ville#}~</label>
									    <input name="cli_ville" id="cli_ville" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_ville#}~"
									    	~{else}~ value="~{$client.cli_ville}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_pays#}~</label>
									    <input name="cli_pays" id="cli_pays" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_pays#}~"
									    	~{else}~ value="~{$client.cli_pays}~"
									    	~{/if}~  >
									</div>
									
								</div> 
								
								<div class="col-lg-6">
								
									<div class="form-group">
									    <label>~{#cli_portable#}~</label>
									    <input name="cli_portable" id="cli_portable" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_portable#}~"
									    	~{else}~ value="~{$client.cli_portable}~"
									    	~{/if}~>
									</div>
									
									<div class="form-group">
									    <label>~{#cli_telfixe#}~</label>
									    <input name="cli_telfixe" id="cli_telfixe" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_telfixe#}~"
									    	~{else}~ value="~{$client.cli_telfixe}~"
									    	~{/if}~  >
									</div>
								
									<div class="form-group">
									    <label>~{#cli_email#}~&nbsp;&nbsp;
											<a 	href="#" id="send_mail">
<!-- 												data-toggle="modal" -->
<!-- 												data-target="#modal-contact-modal" data-backdrop="static" -->
<!-- 												data-keyboard="false"> -->
												<i class="fa fa-envelope fa-lg"></i>
											</a>
									    </label>
									    <input name="cli_email" id="cli_email" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_email#}~"
									    	~{else}~ value="~{$client.cli_email}~"
									    	~{/if}~  >
									</div>
								
									<div class="form-group">
									    <label>~{#cli_datenais#}~</label>
									    <input name="cli_datenais" id="cli_datenais" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_datenais#}~"
									    	~{else}~ value="~{$client.cli_datenais|Date_format:'%d/%m/%Y'}~"
									    	~{/if}~  >
									</div>

									<div class="form-inline">
									    <label>~{#cli_sexe#}~&nbsp;&nbsp;</label>
									    <select name="cli_sexe" id="cli_sexe" class="selectpicker form-control" >
									    	~{foreach $sexes as $sexe}~
										  		<option value="~{$sexe.id}~"
											  		~{if $paramkey neq 0}~
											  			~{if $client.cli_sexe eq $sexe.id}~ selected~{/if}~
											  		~{/if}~ >
											  		~{$sexe.code}~
										  		</option>
										 	~{/foreach}~
									    </select>        
									</div> 
								
   								    </br>

								    ~{*
									<div class="form-inline pull-right">
									  <fieldset>
										  <div class="form-group">
											<label for="cli_exotva">~{#cli_exotva#}~&nbsp;&nbsp;</label>
				                          	<input type="checkbox" 	data-on-text="~{#btnYes#}~" 
						                  							data-off-text="~{#btnNo#}~" 
						                  							data-on-color="warning"
						                  							data-off-color="default"
						                  							data-size="small" 
						                  							name="cli_exotva" 
						                  							id="cli_exotva" 
						                  							value="1"
						                  							disabled
						                  							~{if $paramkey neq 0}~
						                  								~{if $client.cli_exotva eq '1'}~
							                  								checked >
						                  								~{else}~ 
						                  									>
						                  								~{/if}~ 
						                  							~{else}~
						                  								>
						                  							~{/if}~
										  </div>
									  </fieldset>
									</div> 
								
								    </br>
									<div class="form-group">
									    <label>~{#cli_cptcoll#}~</label>
									    <input name="cli_cptcoll" id="cli_cptcoll" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_cptcoll#}~"
									    	~{else}~ value="~{$client.cli_cptcoll}~"
									    	~{/if}~  >
									</div>
									*}~

				            		</br>
									<div class="form-group">
									    <label>~{#addsejour#}~&nbsp;&nbsp;</label>
									    
									    <select name="add_sejour" id="add_sejour" class="selectpicker form-control" >
									  		<option value="0">- aucun -</option>
									    	~{foreach $sejours as $sejour}~
										  		<option value="~{$sejour.sej_id}~">
											  		~{"N°"|cat:$sejour.sej_id|cat:" du "|cat:($sejour.sej_debut|Date_format:"%d/%m/%Y")|cat:" au "|cat:($sejour.sej_fin|Date_format:"%d/%m/%Y")|cat:" : "|cat:$sejour.sej_libelle}~
										  		</option>
										 	~{/foreach}~
									    </select>        
									</div> 
									<div class="form-group">
									    <label>~{#trfsejour#}~&nbsp;&nbsp;</label>
									    
									    <select name="trf_sejour" id="trf_sejour" class="selectpicker form-control" >
									  		<option value="0">- aucun -</option>
									    	~{foreach $sejours as $sejour}~
										  		<option value="~{$sejour.sej_id}~">
											  		~{"N°"|cat:$sejour.sej_id|cat:" du "|cat:($sejour.sej_debut|Date_format:"%d/%m/%Y")|cat:" au "|cat:($sejour.sej_fin|Date_format:"%d/%m/%Y")|cat:" : "|cat:$sejour.sej_libelle}~
										  		</option>
										 	~{/foreach}~
									    </select>        
									</div> 
								
									
									</br></br>	
							        <button type="submit" class="btn" >~{#btnSubmit#}~</button>
	
							        <a class="btn btn-default"
							         
										~{if $smarty.session.__variables__.prev_controller === 'c_sejour_clients'}~
										
											~{if empty($smarty.session.__variables__.c_sejour_clients._POST)}~
		
									     		href="index.php?page=sejour_clients&paramkey=~{$smarty.session.__variables__.c_sejour_clients._GET.paramkey}~&paramname=~{$smarty.session.__variables__.c_sejour_clients._GET.paramname}~"
		
										    ~{else}~
									     		href="index.php?page=sejour_clients&paramkey=~{$smarty.session.__variables__.c_sejour_clients._POST.paramkey}~&paramname=~{$smarty.session.__variables__.c_sejour_clients._POST.paramname}~"
		
										    ~{/if}~	
									    ~{else}~
		
				        					~{if $fichemode eq 'liste'}~
										     		href="clients_intro.html"
										    ~{else}~
										       		href="index.html"
										    ~{/if}~	
		
									    ~{/if}~	
							        
							        >~{#btnCancel#}~
							        </a>
							        
							        ~{if $paramkey neq 0}~
							        	<button id="clients-suppr" type="button" class="btn pull-right" >
								        ~{#btnSuppr#}~
								        </button>
								    ~{/if}~
									
						        
								</div>
							</form>

						</div>
					</div>


                            