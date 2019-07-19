
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_reglements.cfg' section = $smarty.session.__user_lang__}~

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
                       
                           <table id="data-reglements" width="100%" class="table table-striped table-bordered table-hover" >
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
											<td>~{$reglement.reg_id|strip}~</td>	
											<td>~{$reglement.reg_libelle|strip}~</td>	
											<td>~{$reglement.reg_mode|strip}~</td>	
											<td>~{$reglement.reg_montant|strip|string_format:'%.2f'}~</td>		
											<td>~{$reglement.reg_remise|strip|Date_format:'%d/%m/%Y'}~</td>		
										</tr>
									~{/foreach}~
								</tbody>
							</table>
						<div class="clearfix"></div>
						
					  </div>
					  
					</br>
					<form role="form" action="reglements.html" method="post" id="freglements_list">
					  
						<input name="paramkey" id="paramkey" hidden="true" value="">
						<input name="paramname" id="paramname" hidden="true" value="">
  				    </form>
  				    
				   </div>
			</div>
		</div>
	</div>
	<!-- Row End -->
  </div>
  <!-- page-wrapper End -->
