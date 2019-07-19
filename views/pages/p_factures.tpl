
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_factures.cfg' section = $smarty.session.__user_lang__}~

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
							~{if isset($facture.fac_numero)}~	
								~{#subtitle1#}~~{$facture.fac_numero}~
							~{else}~
								&nbsp;~{#subtitle2#}~
							~{/if}~
						~{/if}~
                       </h3>
                     </div>
                     
                     <div class="panel-body">
				        <!-- Nav tabs -->
				        <ul class="nav nav-tabs">
				            <!-- fiche -->
				            <li class="active"><a href="#fac_tab01" data-toggle="tab"><h4>~{#tab01#}~</h4></a>
				            </li>
				            <!-- Règlements -->
				            <li><a href="#fac_tab02" data-toggle="tab"><h4>~{#tab02#}~</h4></a>
				            </li>
				            <!-- Adresse -->
				            <li><a href="#fac_tab03" data-toggle="tab"><h4>~{#tab03#}~</h4></a>
				            </li>
				        </ul>
				
				        <!-- Tab panes -->
				        <div class="tab-content">
				            <div class="tab-pane fade in active" id="fac_tab01">
				            
				            	~{include file = 'p_factures_tab01.inc.tpl'}~
				            
				            </div>
				            
				            <div class="tab-pane fade" id="fac_tab02">

				            	~{include file = 'p_factures_tab02.inc.tpl'}~

				            </div>
				            
				            <div class="tab-pane fade" id="fac_tab03">

				            	~{include file = 'p_factures_tab03.inc.tpl'}~

				            </div>
				        </div>
                     </div>
                     
				</div>
			</div>
		</div>
	</div>
</div>


                            