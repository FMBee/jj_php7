                         <div class="row">
                         
                            <div class="col-lg-12">
                            
							  </br>
							  <form  role="form" >
							
								<input name="paramkey" id="paramkey" hidden="true" value="~{$paramkey}~">
								
								<div class="col-lg-6">
								
									<div class="form-group">
									    <label>~{#fac_numero#}~</label>
									    <input name="fac_numero" id="fac_numero" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#fac_numero#}~"
										    ~{else}~ value="~{$facture.fac_numero}~"
										    ~{/if}~ 
										    ~{$paraminput}~ 
										    >
									</div>  
									
									<div class="form-group">
									    <label>~{#fac_date#}~</label>
									    <input name="fac_date" id="fac_date" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#fac_date#}~"
										    ~{else}~ value="~{$facture.fac_date|Date_format:'%d/%m/%Y'}~"
										    ~{/if}~ 
										    ~{$paraminput}~ 
										    >
									</div>  
									
									<div class="form-group">
									    <label>~{#fac_client#}~</label>
									    <span class="form-control">
											<a href="index.php?page=clients&paramkey=~{$facture.cli_id}~&paramname=~{$facture.cli_nom|cat:' '|cat:$facture.cli_prenom}~">
										    ~{$facture.cli_nom|strip|cat:' '|cat:$facture.cli_prenom|strip}~
											</a>
										</span>
									</div>  
									
									<div class="form-group">
									    <label>~{#sej_libelle#}~</label>
									    <span class="form-control">
											<a href="index.php?page=sejours&paramkey=~{$facture.sej_id}~&paramname=~{$facture.sej_id|cat:' du '|cat:($facture.sej_debut|Date_format:'%d/%m/%Y')|cat:' au '|cat:($facture.sej_fin|Date_format:'%d/%m/%Y')}~">
										    ~{"Séjour n°"|cat:$facture.sej_id|cat:" du "|cat:($facture.sej_debut|Date_format:'%d/%m/%Y')|cat:" au "|cat:($facture.sej_fin|Date_format:'%d/%m/%Y')}~	
											</a>
										</span>
									</div>  
									
<!-- 									<div class="panel panel-success"> -->
<!-- 				                        <div class="panel-heading"> -->
<!-- 				                            ~{#fac_adresse#}~ -->
<!-- 				                        </div> -->
<!-- 				                        <div class="panel-body"> -->
<!-- 				                            <p>~{$facture.fac_nom|strip|cat:' '|cat:$facture.fac_prenom|strip}~</p> -->
<!-- 				                            <p>~{$facture.fac_rue|strip}~</p> -->
<!-- 				                            <p>~{$facture.fac_complement|strip}~</p> -->
<!-- 				                            <p>~{$facture.fac_codepostal|strip|cat:' '|cat:$facture.fac_ville|strip|cat:' - '|cat:$facture.fac_pays}~</p> -->
<!-- 				                        </div> -->
<!-- 				                    </div> -->
								</div> 
								
								<div class="col-lg-6">
						        
									<div class="form-group">
									    <label>~{#fac_totalht#}~</label>
									    <input name="fac_totalht" id="fac_totalht" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#fac_totalht#}~"
										    ~{else}~ value="~{$facture.fac_totalht|string_format:'%.2f'}~"
										    ~{/if}~ 
										    ~{$paraminput}~ 
										    >
									</div>  
									
									<div class="form-group">
									    <label>~{#fac_totalttc#}~</label>
									    <input name="fac_totalttc" id="fac_totalttc" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#fac_totalttc#}~"
										    ~{else}~ value="~{$facture.fac_totalttc|string_format:'%.2f'}~"
										    ~{/if}~ 
										    ~{$paraminput}~ 
										    >
									</div>  
									
									<div class="form-group">
									    <label>~{#fac_totalregle#}~</label>
									    <input name="fac_totalregle" id="fac_totalregle" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#fac_totalregle#}~"
										    ~{else}~ value="~{$facture.fac_totalregle|string_format:'%.2f'}~"
										    ~{/if}~ 
										    ~{$paraminput}~ 
										    >
									</div>  
									
<!-- 									</br></br></br></br> -->
<!-- 							        <a class="btn btn-default pull-right"  -->
<!-- 								        ~{if $fichemode eq "liste"}~ -->
<!-- 							        		href="factures_list.html" > -->
<!-- 							        	~{else}~ -->
<!-- 							        		href="index.html" > -->
<!-- 							        	~{/if}~ -->
<!-- 							        ~{#btnReturn#}~ -->
<!-- 							        </a> -->
							        
								</div>
								
								<div class="col-lg-12">
								
									<label><h3>~{#tab01sub#}~</h3></label>
									
									</br>
									~{if count($lignesFacture) eq 0}~
									
										<p>Aucun détail à afficher</p>
										
									~{else}~
									
										<div class="dataTable_wrapper">
										
				                           <table id="data-lignesfacture" width="100%" class="table table-striped table-bordered table-hover" >
												<thead>
													<tr>
														<th>~{#fli_numlig#}~</th>	
														<th>~{#pre_pty_code#}~</th>	
														<th>~{#fli_descriptif#}~</th>	
														<th>~{#fli_quantite#}~</th>		
														<th>~{#fli_puht#}~</th>		
														<th>~{#fli_totalttc#}~</th>		
													</tr>
												</thead>
												
												<tbody>
													~{foreach from=$lignesFacture item=ligne}~
														<tr>
															<td>~{$ligne.fli_numlig|strip}~</td>	
															<td>~{$ligne.pre_pty_code|strip}~</td>	
															<td>~{$ligne.fli_descriptif|strip}~</td>	
															<td>~{$ligne.fli_quantite|strip|string_format:'%.2f'}~</td>		
															<td>~{$ligne.fli_puht|strip|string_format:'%.2f'}~</td>		
															<td>~{$ligne.fli_totalttc|strip|string_format:'%.2f'}~</td>		
														</tr>		
													~{/foreach}~
												</tbody>
											</table>
										
										</div>
									~{/if}~
										
									~{if isset($facture.fac_numero)}~	
									
										<button id="editfacture" type="button" class="btn pull-right">
										~{#btnfacture#}~</button>
										
									~{else}~
									
										<button id="editcommande" type="button" class="btn pull-right">
										~{#btncommande#}~</button>
									
									~{/if}~
								</div>

							</form>
							
							
						</div>
					</div>
