
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_factures.cfg' section = $smarty.session.__user_lang__}~

  <div id="page-wrapper">
       <div class="row">
           <div class="col-lg-12">
               <h2 class="page-header">~{#tabtitle#}~</h2>
           </div>
       </div>
       <div class="row">
           <div class="col-lg-12">
               <div class="panel panel-default">
                   <div class="panel-heading">
		               <h4>
		               ~{$debut}~
		               </h4>
                   </div>
                   <div class="panel-body">
                       <div class="dataTable_wrapper">
                           <table id="data-factures" width="100%" class="table table-striped table-bordered table-hover" >
 		
							<thead>
								<tr>
									<th>~{#fac_numero#}~</th>	
									<th>~{#fac_date#}~</th>		
									<th>~{#fac_client#}~</th>		
									<th>~{#sej_libelle#}~</th>		
									<th>~{#fac_totalht#}~</th>		
									<th>~{#fac_totalttc#}~</th>		
									<th>~{#fac_totaltva#}~</th>		
									<th>~{#fac_totalregle#}~</th>		
								</tr>
							</thead>
							
							<tbody>
								~{foreach from=$allFactures item=facture}~
									<tr id="~{$facture.fac_id}~">
										<td>
											~{if isset($facture.fac_numero)}~
												~{$facture.fac_numero|strip}~
											~{else}~
												(brouillon)
											~{/if}~
										</td>	
										<td>~{$facture.fac_date|strip|Date_format:'%d/%m/%Y'}~</td>		
										<td>~{$facture.cli_nom|cat:" "|cat:$facture.cli_prenom|strip}~</td>	
										<td>~{"N°"|cat:$facture.sej_id|cat:" du "|cat:($facture.sej_debut|Date_format:'%d/%m/%Y')}~</td>	
										<td>~{$facture.fac_totalht|strip|string_format:'%.2f'}~</td>		
										<td>~{$facture.fac_totalttc|strip|string_format:'%.2f'}~</td>		
										<td>~{$facture.fac_totaltva|strip|string_format:'%.2f'}~</td>		
										<td>~{$facture.fac_totalregle|strip|string_format:'%.2f'}~</td>		
									</tr>
								~{/foreach}~
							</tbody>
						</table>
						<div class="clearfix"></div>
					</div>
					</br>
					<form role="form" action="factures.html" method="post" id="ffactures_list">
					  
						<input name="paramkey" id="paramkey" hidden="true" value="">
						<input name="paramname" id="paramname" hidden="true" value="">
						<input name="paraminput" id="paraminput" hidden="true" value="">
						
						<div class="form-group">
							<div class="col-lg-12">
								<button id="_addrec_" type="button" class="btn">~{#btnAdd#}~</button>
							</div>
							</br>
						</div>
				  </form>
				</div>
			</div>
		</div>
	</div>
	<!-- Row End -->
  </div>
  <!-- page-wrapper End -->
