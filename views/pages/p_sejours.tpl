
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_sejours.cfg' section = $smarty.session.__user_lang__}~

 <div id="page-wrapper">
 
 		<div class="row">
           <div class="col-lg-12">
              <div class="page-header">
				<a 	class="fa fa-arrow-left fa-2x" 
					href="~{precPage()}~" >
				</a>&nbsp;&nbsp;
                <span style="font-size:150%;">~{#title#}~
              </div>
            </div>
        </div>
        
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
                     <div class="panel-heading">
                       <h3>
						~{if $paramname eq "new"}~
							~{#libnouveau#}~
						~{else}~
							~{#subtitle#}~~{$paramname}~
						~{/if}~
                       </h3>
                     </div>
                     <div class="panel-body">
				        <!-- Nav tabs -->
				        <ul class="nav nav-tabs">
				        
				            <li
				            ~{if $paramkey eq 'new'}~class="active"~{/if}~
				            >
				            	<a href="#sej_tab01" data-toggle="tab"><h4>~{#tab01#}~</h4></a>
				            	<!-- fiche -->
				            </li>
				            
				            ~{if $paramkey neq 'new'}~
					            <li class="active"><a href="#sej_tab02" data-toggle="tab"><h4>~{#tab02#}~</h4></a>
					            <!-- Séjours -->
					            </li>
					         ~{/if}~
				        </ul>
				
				        <!-- Tab panes -->
				        <div class="tab-content">
				        
				            ~{if $paramkey eq 'new'}~
					            <div class="tab-pane fade in active" id="sej_tab01">
					        ~{else}~
					            <div class="tab-pane fade" id="sej_tab01">
				            ~{/if}~
				            
				            	~{include file = 'p_sejours_tab01.inc.tpl'}~
				            
				            </div>
				            
				            ~{if $paramkey neq 'new'}~
					            <div class="tab-pane fade in active" id="sej_tab02">
	
					            	~{include file = 'p_sejours_tab02.inc.tpl'}~
	
					            </div>
					         ~{/if}~
				        </div>                     

					 </div>
				</div>
			</div>
		</div>
 </div>


                            