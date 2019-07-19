
						 <br/>
                         <div class="row">
                            <div class="col-lg-12">

							<label><h3>~{#tab02sub#}~</h3></label>
							
							~{if count($sejoursClient) eq 0}~
							
								<p>Aucun détail à afficher</p>
								
							~{else}~

								<div class="dataTable_wrapper">
		                       
		                           <table id="data-lignessejours" width="100%" class="table table-striped table-bordered table-hover" >
										<thead>
											<tr>
												<th>~{#sej_id#}~</th>		
												<th>~{#sej_libelle#}~</th>	
												<th>~{#scl_etat#}~</th>	
												<th>~{#fac_numero#}~</th>	
												<th>~{#fac_date#}~</th>	
												<th>~{#fac_totalttc#}~</th>	
												<th>~{#fac_totalregle#}~</th>	
												<th>~{#fac_totalreste#}~</th>	
											</tr>
										</thead>
										
										<tbody>
											
											~{assign var=totalrestant value=0}~
											
											~{foreach from=$sejoursClient item=ligne}~
												<tr>
													<td>
														<a href="index.php?page=sejours&paramkey=~{$ligne.sej_id}~&paramname=~{$ligne.sej_id}~">
														~{'N°'|cat:$ligne.sej_id|cat:' du '|cat:($ligne.sej_debut|Date_format:'%d/%m/%Y')}~
														</a>
													</td>		
													<td>~{$ligne.sej_libelle|strip}~</td>	
													<td>~{$etatsVal[$ligne.scl_etat]}~</td>	        
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
													<td>~{$ligne.fac_date|strip|Date_format:'%d/%m/%Y'}~</td>	
													<td>~{$ligne.fac_totalttc|strip|string_format:'%.2f'}~</td>	
													<td>~{$ligne.fac_totalregle|strip|string_format:'%.2f'}~</td>	
													<td>~{($ligne.fac_totalttc - $ligne.fac_totalregle)|string_format:'%.2f'}~</td>	
													
												</tr>
												~{$totalrestant = $totalrestant + ( ($ligne.fac_totalttc - $ligne.fac_totalregle) )}~
	
											~{/foreach}~
											
										</tbody>
									</table>
									
									<label class="pull-right">
										<h4>~{#libnonregle#}~&nbsp;
										~{$totalrestant|string_format:'%.2f'}~
										</h4>
									</label>
								
							  </div>
							~{/if}~

						</div>
					</div>


                            