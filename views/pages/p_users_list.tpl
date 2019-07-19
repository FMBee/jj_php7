
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users.cfg' section = $smarty.session.__user_lang__}~

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
<!--                        <span>~{#tabtitle#}~</span> -->
<!-- 						<div class="pull-right"> -->
	                        <input id="affTous" type="checkbox" data-switch-no-init>&nbsp;~{#btnAll#}~
<!-- 	                    </div> -->
                   </div>
                   <div class="panel-body">
                       <div class="dataTable_wrapper">
                           <table id="data-users" width="100%" class="table table-striped table-bordered table-hover" >

							<thead>
								<tr>
									<th>~{#libNom#}~</th>
									<th>~{#libPrenom#}~</th>
									<th>~{#libMail#}~</th>
<!-- 									<th>~{#libLang#}~</th> -->
									<th>~{#libEntree#}~</th>
									<th>~{#libSortie#}~</th>
									<th>Tag</th>
								</tr>
							</thead>
							<tbody>
								~{foreach from=$allUsers item=User}~
									<tr id="~{$User.usr_id}~">
										<td>~{$User.usr_last_name|strip}~</td>
										<td>~{$User.usr_first_name|strip}~</td>
										<td>~{$User.usr_mail|strip}~</td>
<!-- 										<td>~{$User.usr_lang|strip}~</td> -->
										<td>~{$User.usr_in_date|Date_format:"%d/%m/%Y"}~</td>
										<td>~{$User.usr_out_date|Date_format:"%d/%m/%Y"}~</td>
										<td>~{$User.tag}~</td>
									</tr>
								~{/foreach}~
							</tbody>
						</table>
						<div class="clearfix"></div>
					</div>
					</br>
					<form role="form" action="users.html" method="post" id="fusers_list">
					  
						<input name="key" id="key" hidden="true" value="">
						<input name="username" id="username" hidden="true" value="">
						<div class="form-group">
							<div class="col-lg-12">
								<button id="addUser" type="button" class="btn">~{#btnAdd#}~</button>
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
