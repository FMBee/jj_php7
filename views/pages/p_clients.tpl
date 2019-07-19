
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_clients.cfg' section = $smarty.session.__user_lang__}~
					
 	<div id="page-wrapper">
 		<div class="row">
            <div class="col-lg-12">
              <div class="page-header">
              	
              	~{if $smarty.session.__variables__.prev_controller neq 'c_sejour_clients'}~
              
					<a 	class="fa fa-arrow-left fa-2x" 
						href="~{precPage()}~" >
					</a>&nbsp;&nbsp;
				~{/if}~
                <span style="font-size:150%;">~{#title#}~
              </div>
            </div>
        </div>
            
		<div class="row">
			<div class="col-lg-12">
					
				<div class="panel panel-default">
				    <div class="panel-heading">
<!-- 		                <div class="col-lg-12"> -->
				              <h3>
								~{if $paramname eq "new"}~
									~{#libnouveau#}~
								~{else}~
									~{#subtitle#}~&nbsp;~{$paramname}~
								~{/if}~
		                       </h3>
<!-- 		                </div> -->
				    </div>
				    <!-- /.panel-heading -->
				    
				    <div class="panel-body">	
				    
				    	~{if isset($client.cli_flag) && $client.cli_flag|strip eq 'D'}~
				    	
		    				<div class="form-group">
							    <span class="form-control">Ce client est supprimé</span>
							</div>
				    		
				    		
				    	~{else}~
					        <!-- Nav tabs -->
					        <ul class="nav nav-tabs">
					        
					            <li class="active"><a href="#cli_tab01" data-toggle="tab"><h4>~{#tab01#}~</h4></a>
					            <!-- fiche -->
					            </li>
					            
					            ~{if $paramkey neq 'new'}~
						            <li><a href="#cli_tab02" data-toggle="tab"><h4>~{#tab02#}~</h4></a>
						            <!-- Séjours -->
						            </li>
						         ~{/if}~
					        </ul>
					
					        <!-- Tab panes -->
					        <div class="tab-content">
					            <div class="tab-pane fade in active" id="cli_tab01">
					            
					            	~{include file = 'p_clients_tab01.inc.tpl'}~
					            
					            </div>
					            
					            ~{if $paramkey neq 'new'}~
						            <div class="tab-pane fade" id="cli_tab02">
		
						            	~{include file = 'p_clients_tab02.inc.tpl'}~
		
						            </div>
						         ~{/if}~
					        </div>
				    	~{/if}~
				    </div>
				    <!-- /.panel-body -->
				</div>
			</div>
		</div>
	</div>