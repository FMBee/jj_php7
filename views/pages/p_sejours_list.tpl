
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_sejours.cfg' section = $smarty.session.__user_lang__}~

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
                   </div>
                   <div class="panel-body">
                       <div class="dataTable_wrapper">
                           <table id="data-sejours" width="100%" class="table table-striped table-bordered table-hover" >

							<thead>
								<tr>
									<th>~{#sej_id#}~</th>     
									<th>~{#sej_debut#}~</th>     
									<th>~{#sej_fin#}~</th>        		
									<th>~{#sej_libelle#}~</th>
									<th>~{#sej_nbmax#}~</th>     
									<th>~{#sej_complet#}~</th>   
								</tr>
							</thead>
							
							<tbody>
								~{foreach from=$allSejours item=sejour}~
									<tr id="~{$sejour.sej_id}~">
										<td>~{$sejour.sej_id|strip}~</td>		
										<td>~{$sejour.sej_debut|strip|Date_format:'%d/%m/%Y'}~</td>	
										<td>~{$sejour.sej_fin|strip|Date_format:'%d/%m/%Y'}~</td>		
										<td>~{$sejour.sej_libelle|strip}~</td>		
										<td>~{$sejour.sej_nbmax|strip}~</td>	
										<td>
											~{if $sejour.sej_complet eq 0}~	
												Non
											~{else}~
												Oui
											~{/if}~
										</td>		
									</tr>
								~{/foreach}~
							</tbody>
						</table>
						<div class="clearfix"></div>
					</div>
					</br>
					<form role="form" action="sejours.html" method="post" id="fsejours_list">
					  
						<input name="paramkey" id="paramkey" hidden="true" value="">
						<input name="paramname" id="paramname" hidden="true" value="">
						
						<div class="form-group">
							<div class="col-lg-12">
								<button id="addrecord" type="button" class="btn">~{#btnAdd#}~</button>
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
