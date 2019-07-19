
						 <br/>
                         <div class="row">
                            <div class="col-lg-12">

							<label><h3>~{#tab02sub#}~</h3></label>
							
							</br>
							~{if count($allReglements) eq 0}~
							
								<p>Aucun détail à afficher</p>
								
							~{else}~

								<div class="dataTable_wrapper">
		                       
		                           <table id="data-lignesreglts" width="100%" class="table table-striped table-bordered table-hover" >
		                           
										<thead>
											<tr>
												<th>~{#reg_date#}~</th>		
												<th>~{#reg_id#}~</th>	
												<th>~{#reg_libelle#}~</th>	
												<th>~{#reg_mode#}~</th>	
												<th>~{#reg_montant#}~</th>		
												<th>~{#reg_remise#}~</th>		
											</tr>
										</thead>
										
										<tbody>
											~{foreach from=$allReglements item=reglement}~
												<tr id="~{$reglement.reg_id}~">
													<td>~{$reglement.reg_date|strip|Date_format:'%d/%m/%Y'}~</td>		
													<td>
														<a href="index.php?page=reglements&paramkey=~{$reglement.reg_id}~&paramname=~{$reglement.reg_id}~">
														~{$reglement.reg_id|strip}~
														</a>
													</td>	
													<td>~{$reglement.reg_libelle|strip}~</td>	
													<td>~{$reglement.reg_mode|strip}~</td>	
													<td>~{$reglement.reg_montant|strip|string_format:'%.2f'}~</td>		
													<td>~{$reglement.reg_remise|strip|Date_format:'%d/%m/%Y'}~</td>		
												</tr>
											~{/foreach}~
										</tbody>
										
									</table>
							    </div>
							    
							~{/if}~

							<label class="pull-right">
								<h4>~{#libnonregle#}~&nbsp;
								~{($facture.fac_totalttc - $facture.fac_totalregle)|strip|string_format:'%.2f'}~
								</h4>
							</label>

						</div>
					</div>


                            