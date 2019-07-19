
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_index.cfg' section = $smarty.session.__user_lang__}~

  <div id="page-wrapper">
       <div class="row">
           <div class="col-lg-12">
               <h2 class="page-header">~{#tabtitle#}~</h2>
<!-- 			<span> -->
<!-- 				<a href="#" data-toggle="modal" -->
<!-- 					data-target="#modal-contact" data-backdrop="static" -->
<!-- 					data-keyboard="false">Contact -->
<!-- 				</a> -->
<!-- 			</span> -->
           </div>
       </div>
       <div class="row">
           <div class="col-lg-12">
               <div class="panel panel-default">
                   <div class="panel-heading">
		               <h4>
		               ~{#subtitle#}~&nbsp;~{$debut}~
		               </h4>
                   </div>
                   <div class="panel-body">
                       <div class="dataTable_wrapper">
                       
                           <table id="data-stats" width="100%" class="table table-striped table-bordered table-hover" >
   
							<thead>
								<tr>
									<th>~{#sej_id#}~</th>	
									<th>~{#sej_libelle#}~</th>		
									<th>~{#sej_debut#}~</th>		
									<th>~{#sej_fin#}~</th>		
									<th>~{#scl_nb_preinscrit#}~</th>		
									<th>~{#scl_nb_confirme#}~</th>		
									<th>~{#scl_nb_annule#}~</th>		
<!-- 									<th>~{#scl_nb_retarde#}~</th>		 -->
									<th>~{#scl_nb_locations#}~</th>		
									<th>~{#scl_nb_hotels#}~</th>		
									<th>~{#scl_nb_produits#}~</th>		
									<th>~{#scl_nb_repas#}~</th>		
									<th>~{#scl_nb_sejours#}~</th>		
									<th>~{#scl_nb_soins#}~</th>		
								</tr>
							</thead>
							
							<tbody>
								~{foreach from=$allStats item=Stat}~
								
									<tr id="~{$Stat.sej_id}~">
										<td>
											<a href="index.php?page=sejours&paramkey=~{$Stat.sej_id}~&paramname=~{$Stat.sej_id}~">
											~{$Stat.sej_id|strip}~
											</a>
										</td>	
										<td>~{$Stat.sej_libelle|strip}~</td>		
										<td>~{$Stat.sej_debut|Date_format:'%d/%m/%Y'|strip}~</td>		
										<td>~{$Stat.sej_fin|Date_format:'%d/%m/%Y'|strip}~</td>		
										<td align="center" class="info">~{$Stat.scl_nb_preinscrit|strip}~</td>		
										<td align="center" class="success">~{$Stat.scl_nb_confirme|strip}~</td>		
										<td align="center" class="warning">~{$Stat.scl_nb_annule|strip}~</td>		
<!-- 										<td align="center" class="warning">~{$Stat.scl_nb_retarde|strip}~</td>		 -->
										<td align="center">~{$Stat.scl_nb_locations|strip}~</td>		
										<td align="center">~{$Stat.scl_nb_hotels|strip}~</td>		
										<td align="center">~{$Stat.scl_nb_produits|strip}~</td>		
										<td align="center">~{$Stat.scl_nb_repas|strip}~</td>		
										<td align="center">~{$Stat.scl_nb_sejours|strip}~</td>		
										<td align="center">~{$Stat.scl_nb_soins|strip}~</td>		
									</tr>
								~{/foreach}~
							</tbody>
							
						</table>
					</div>

					</br>
					<form role="form" action="sejour_clients.html" method="post" id="fsuivi_list">
					  
						<input name="paramkey" id="paramkey" hidden="true" value="">
						<input name="paramname" id="paramname" hidden="true" value="">
<!-- 						<div class="form-group"> -->
<!-- 							<div class="col-lg-12"> -->
<!-- 								<button id="addrecord" type="button" class="btn">~{#btnAdd#}~</button> -->
<!-- 							</div> -->
<!-- 							</br> -->
<!-- 						</div> -->
				  </form>
				</div>
			</div>
		</div>
	</div>
	<!-- Row End -->
  </div>
  <!-- page-wrapper End -->
