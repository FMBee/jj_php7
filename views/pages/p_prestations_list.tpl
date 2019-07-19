
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_prestations.cfg' section = $smarty.session.__user_lang__}~

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
                           <table id="data-prestations" width="100%" class="table table-striped table-bordered table-hover" >

							<thead>
								<tr>
									<th>~{#pre_pty_code#}~</th>	
									<th>~{#pre_libelle#}~</th>		
									<th>~{#pre_puht#}~</th>		
									<th>~{#pre_puttc#}~</th>		
									<th>~{#pre_tauxtva#}~</th>		
								</tr>
							</thead>
							
							<tbody>
								~{foreach from=$allPrestations item=Prestation}~
									<tr id="~{$Prestation.pre_id}~">
										<td>~{$Prestation.pre_pty_code|strip}~</td>	
										<td>~{$Prestation.pre_libelle|strip}~</td>		
										<td>~{$Prestation.pre_puht|strip|string_format:'%.2f'}~</td>		
										<td>~{$Prestation.pre_puttc|strip|string_format:'%.2f'}~</td>		
										<td>~{$Prestation.pre_tauxtva|strip|string_format:'%.2f'}~</td>		
									</tr>
								~{/foreach}~
							</tbody>
						</table>
						<div class="clearfix"></div>
					</div>
					</br>
					<form role="form" action="prestations.html" method="post" id="fprestations_list">
					  
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
