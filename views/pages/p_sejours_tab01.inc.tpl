                         <div class="row">
                            <div class="col-lg-12">
                            
                            </br>
							<form id="fsejours" method="post" role="form" action="sejours-sejours_list.html">
							
								<input name="paramkey" id="paramkey" hidden="true" value="~{$paramkey}~">
								
								<div class="col-lg-6">
								
									<div class="form-group">
									    <label>~{#sej_libelle#}~</label>
									    <input name="sej_libelle" id="sej_libelle" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#sej_libelle#}~"
										    ~{else}~ value="~{$sejour.sej_libelle}~"
										    ~{/if}~ required >
									</div>

									<div class="form-group">
									    <label>~{#sej_nbmax#}~</label>
									    <input name="sej_nbmax" id="sej_nbmax" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#sej_nbmax#}~"
										    ~{else}~ value="~{$sejour.sej_nbmax}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#sej_debut#}~</label>
									    <input name="sej_debut" id="sej_debut" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#sej_debut#}~"
										    ~{else}~ value="~{$sejour.sej_debut|Date_format:'%d/%m/%Y'}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#sej_fin#}~</label>
									    <input name="sej_fin" id="sej_fin" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#sej_fin#}~"
										    ~{else}~ value="~{$sejour.sej_fin|Date_format:'%d/%m/%Y'}~"
										    ~{/if}~ required>
									</div>  

									~{if $paramkey neq 0}~
									
										<div class="form-inline pull-right">
										  <fieldset>
											  <div class="form-group">
												<label for="sej_complet">~{#sej_complet#}~&nbsp;&nbsp;</label>
					                          	<input type="checkbox" 	data-on-text="~{#btnYes#}~" 
							                  							data-off-text="~{#btnNo#}~" 
							                  							data-on-color="warning"
							                  							data-off-color="default"
							                  							data-size="small" 
							                  							name="sej_complet" 
							                  							id="sej_complet" 
							                  							value="1"
						                  								~{if $sejour.sej_complet eq '1'}~
							                  								checked >
						                  								~{else}~ 
						                  									>
						                  								~{/if}~ 
											  </div>
										  </fieldset>
										</div> 
									
									~{/if}~

									</br></br>	
							        <button type="submit" class="btn" >~{#btnSubmit#}~</button>
	
							        <a class="btn btn-default" 
								        ~{if $fichemode eq "liste"}~
							        		href="sejours_list.html" >
							        	~{else}~
							        		href="index.html" >
							        	~{/if}~
							        ~{#btnCancel#}~
							        </a>
							        
							        ~{if $paramkey neq 0}~
										<button id="sejour-suppr" type="button" class="btn btn-warning pull-right" >
								        ~{#btnSuppr#}~
								        </button>
								    ~{/if}~
									
								</div> 
								
								<div class="col-lg-6">
						        
								</div>
								
							</form>

						</div>
					</div>