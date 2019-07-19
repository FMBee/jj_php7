
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_clients.cfg' section = $smarty.session.__user_lang__}~

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
                           <table id="data-clients" width="100%" class="table table-striped table-bordered table-hover" >

							<thead>
								<tr>
									<th>~{#cli_nom#}~</th>
									<th>~{#cli_prenom#}~</th>
									<th>~{#cli_telfixe#}~</th>
									<th>~{#cli_portable#}~</th>
									<th>~{#cli_email#}~</th>
									<th>~{#cli_cp#}~</th>
									<th>~{#cli_ville#}~</th>
								</tr>
							</thead>
							<tbody>
								~{foreach from=$allClients item=Client}~
									<tr id="~{$Client.cli_id}~">
										<td>~{$Client.cli_nom|strip}~</td>
										<td>~{$Client.cli_prenom|strip}~</td>
										<td>~{$Client.cli_telfixe|strip}~</td>
										<td>~{$Client.cli_portable|strip}~</td>
										<td>~{$Client.cli_email|strip}~</td>
										<td>~{$Client.cli_codepostal|strip}~</td>
										<td>~{$Client.cli_ville|strip}~</td>
									</tr>
								~{/foreach}~
							</tbody>
						</table>
						<div class="clearfix"></div>
					</div>
					</br>
					<form role="form" action="clients.html" method="post" id="fclients_list">
					  
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
