
				 	   <br/>
                       <div class="row">
                          <div class="col-lg-12">

							<label><h3>~{#tab02sub1#}~</h3></label>
							
							~{if count($clients) eq 0}~
							
								<p>Aucun détail à afficher</p>
								
							~{else}~
									
							<div class="dataTable_wrapper">
	                       
		                           <table id="data-clients" width="100%" class="table table-striped table-bordered table-hover" >
										<thead>
											<tr>
												<th>~{#cli_nom#}~</th>		
												<th>~{#cli_prenom#}~</th>	
												<th>~{#cli_codepostal#}~</th>	
												<th>~{#cli_ville#}~</th>	
												<th>~{#fac_numero#}~</th>	
												<th>~{#fac_date#}~</th>	
												<th>~{#fac_totalttc#}~</th>	
												<th>~{#fac_totalregle#}~</th>	
												<th>~{#fac_totalreste#}~</th>	
											</tr>
										</thead>
										
										<tbody>
											~{assign var=totalregle value=0}~
											~{assign var=totalrestant value=0}~
											
											~{foreach from=$clients item=ligne}~
												<tr>
													<td>
														<a href="index.php?page=clients&paramkey=~{$ligne.cli_id}~&paramname=~{$ligne.cli_nom|cat:' '|cat:$ligne.cli_prenom}~">
														~{$ligne.cli_nom|strip}~	
														</a>
													</td>
													<td>~{$ligne.cli_prenom|strip}~</td>	
													<td>~{$ligne.cli_codepostal|strip}~</td>	
													<td>~{$ligne.cli_ville|strip}~</td>	
													<td>
														~{if isset($ligne.fac_numero)}~
															<a href="index.php?page=factures&paramkey=~{$ligne.scl_fac_id}~&paramname=~{$ligne.fac_numero}~&paraminput=disabled">
															~{$ligne.fac_numero|strip}~
														~{/if}~
														</a>
													</td>	        
													<td>~{$ligne.fac_date|strip|Date_format:'%d/%m/%Y'}~</td>	
													<td>~{$ligne.fac_totalttc|strip|string_format:'%.2f'}~</td>	
													<td>~{$ligne.fac_totalregle|strip|string_format:'%.2f'}~</td>	
													<td>~{($ligne.fac_totalttc - $ligne.fac_totalregle)|string_format:'%.2f'}~</td>	
													
												</tr>
												
												~{$totalregle = $totalregle + $ligne.fac_totalregle}~
												~{$totalrestant = $totalrestant + ( ($ligne.fac_totalttc - $ligne.fac_totalregle) )}~
											
											~{/foreach}~
											
										</tbody>
									</table>
									
									<div class="col-lg-12">
										<label class="pull-right">
											<h4>~{#libregle#}~&nbsp;
											~{$totalregle|string_format:'%.2f'}~
											</h4>
										</label>
									</div>
									<div class="col-lg-12">
										<label class="pull-right">
											<h4>~{#libnonregle#}~&nbsp;
											~{$totalrestant|string_format:'%.2f'}~
											</h4>
										</label>
									</div>
									
							    </div>
						    ~{/if}~
						    
						    
							<label><h3>~{#tab02sub2#}~</h3></label>
							
							~{if count($confirmes) eq 0}~
							
								<p>Aucun détail à afficher</p>
								
							~{else}~

								<div class="dataTable_wrapper">
		                       
		                           <table id="data-confirmes" width="100%" class="table table-striped table-bordered table-hover" >
										<thead>
											<tr>
												<th>~{#cli_nom#}~</th>		
												<th>~{#cli_prenom#}~</th>	
												<th>~{#scl_saisie#}~</th>	
												<th>~{#cli_codepostal#}~</th>	
												<th>~{#cli_ville#}~</th>	
												<th>~{#fac_numero#}~</th>	
												<th>~{#fac_totalttc#}~</th>	
												<th>~{#fac_totalregle#}~</th>	
												<th>~{#fac_totalreste#}~</th>	
											</tr>
										</thead>
										
										<tbody>
											~{assign var=totalregle value=0}~
											~{assign var=totalrestant value=0}~
											
											~{foreach from=$confirmes item=ligne}~
												<tr>
													<td>
														<a href="index.php?page=clients&paramkey=~{$ligne.cli_id}~&paramname=~{$ligne.cli_nom|cat:' '|cat:$ligne.cli_prenom}~">
														~{$ligne.cli_nom|strip}~	
														</a>
													</td>
													<td>~{$ligne.cli_prenom|strip}~</td>	
													<td>~{$ligne.scl_saisie|strip|Date_format:'%d/%m/%Y'}~</td>	
													<td>~{$ligne.cli_codepostal|strip}~</td>	
													<td>~{$ligne.cli_ville|strip}~</td>	
													<td>
														~{if isset($ligne.fac_numero)}~
															<a href="index.php?page=factures&paramkey=~{$ligne.scl_fac_id}~&paramname=~{$ligne.fac_numero}~&paraminput=disabled">
															~{$ligne.fac_numero|strip}~
														~{else}~
															~{if isset($ligne.fac_id)}~
																<a href="index.php?page=factures&paramkey=~{$ligne.scl_fac_id}~&paramname=~{$ligne.fac_numero}~&paraminput=disabled">
																(brouillon)
															~{else}~
																(à créer)
															~{/if}~
														~{/if}~
														</a>
													</td>	        
													<td>~{$ligne.fac_totalttc|strip|string_format:'%.2f'}~</td>	
													<td>~{$ligne.fac_totalregle|strip|string_format:'%.2f'}~</td>	
													<td>~{($ligne.fac_totalttc - $ligne.fac_totalregle)|string_format:'%.2f'}~</td>	
													
												</tr>
												~{$totalregle = $totalregle + $ligne.fac_totalregle}~
												~{$totalrestant = $totalrestant + ( ($ligne.fac_totalttc - $ligne.fac_totalregle) )}~
											
											~{/foreach}~
										</tbody>
									</table>
									
									<div class="col-lg-12">
										<label class="pull-right">
											<h4>~{#libregle#}~&nbsp;
											~{$totalregle|string_format:'%.2f'}~
											</h4>
										</label>
									</div>
									<div class="col-lg-12">
										<label class="pull-right">
											<h4>~{#libnonregle#}~&nbsp;
											~{$totalrestant|string_format:'%.2f'}~
											</h4>
										</label>
									</div>
							    </div>
							~{/if}~    
						    
						    
							<label><h3>~{#tab02sub3#}~</h3></label>
							
							~{if count($prospects) eq 0}~
							
								<p>Aucun détail à afficher</p>
								
							~{else}~

								<div class="dataTable_wrapper">
		                       
		                           <table id="data-prospects" width="100%" class="table table-striped table-bordered table-hover" >
										<thead>
											<tr>
												<th>~{#cli_nom#}~</th>		
												<th>~{#cli_prenom#}~</th>	
												<th>~{#scl_saisie#}~</th>	
												<th>~{#cli_rue#}~</th>	
												<th>~{#cli_codepostal#}~</th>	
												<th>~{#cli_ville#}~</th>	
											</tr>
										</thead>
										
										<tbody>
											~{foreach from=$prospects item=ligne}~
												<tr>
													<td>
														<a href="index.php?page=clients&paramkey=~{$ligne.cli_id}~&paramname=~{$ligne.cli_nom|cat:' '|cat:$ligne.cli_prenom}~">
														~{$ligne.cli_nom|strip}~	
														</a>
													</td>
													<td>~{$ligne.cli_prenom|strip}~</td>	
													<td>~{$ligne.scl_saisie|Date_format:'%d/%m/%Y'}~</td>	
													<td>~{$ligne.cli_rue|strip}~</td>	
													<td>~{$ligne.cli_codepostal|strip}~</td>	
													<td>~{$ligne.cli_ville|strip}~</td>	
												</tr>
											~{/foreach}~
										</tbody>
									</table>
									
							    </div>
							~{/if}~
							
							<button id="editfactures" type="button" class="btn pull-right">
							~{#btnedition#}~</button>

						</div>
					</div>


                            