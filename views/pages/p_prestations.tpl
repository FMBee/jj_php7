
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_prestations.cfg' section = $smarty.session.__user_lang__}~

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
							~{#subtitle#}~&nbsp;~{$paramname}~
						~{/if}~
                       </h3>
                     </div>
                     <div class="panel-body">
                         <div class="row">
                            <div class="col-lg-12">
                            
							<form id="fprestations" method="post" role="form" action="prestations-prestations_list.html">
							
								<input name="paramkey" id="paramkey" hidden="true" value="~{$paramkey}~">
								
								<div class="col-lg-6">
								
									<div class="form-group">
									    <label>~{#pre_libelle#}~</label>
									    <input name="pre_libelle" id="pre_libelle" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#pre_libelle#}~"
										    ~{else}~ value="~{$prestation.pre_libelle}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
										<label>~{#pre_pty_code#}~</label>
									    <select name="pre_pty_code" id="pre_pty_code" class="selectpicker form-control" required>
									    	~{foreach $prestatypes as $prestatype}~
										  		<option value="~{$prestatype.pty_code}~"
											  		~{if $paramkey neq 0}~
											  			~{if $prestation.pre_pty_code eq $prestatype.pty_code}~ selected~{/if}~
											  		~{/if}~ >
											  		~{$prestatype.pty_code}~
										  		</option>
										 	~{/foreach}~
									    </select>        
									</div> 

									<div class="form-group">
									    <label>~{#pre_descriptif#}~</label>
									    <input name="pre_descriptif" id="pre_descriptif" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#pre_descriptif#}~"
										    ~{else}~ value="~{$prestation.pre_descriptif}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#pre_tauxtva#}~</label>
									    <input name="pre_tauxtva" id="pre_tauxtva" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#pre_tauxtva#}~"
										    ~{else}~ value="~{$prestation.pre_tauxtva|string_format:'%.2f'}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#pre_puht#}~</label>
									    <input name="pre_puht" id="pre_puht" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#pre_puht#}~"
										    ~{else}~ value="~{$prestation.pre_puht|string_format:'%.2f'}~"
										    ~{/if}~  >
									</div>  

									<div class="form-group">
									    <label>~{#pre_puttc#}~</label>
									    <input name="pre_puttc" id="pre_puttc" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#pre_puttc#}~"
										    ~{else}~ value="~{$prestation.pre_puttc|string_format:'%.2f'}~"
										    ~{/if}~ disabled >
									</div>  
									
									<div class="form-group">
									    <label>~{#pre_compteht#}~</label>
									    <input name="pre_compteht" id="pre_compteht" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#pre_compteht#}~"
										    ~{else}~ value="~{$prestation.pre_compteht}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#pre_comptetva#}~</label>
									    <input name="pre_comptetva" id="pre_comptetva" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#pre_comptetva#}~"
										    ~{else}~ value="~{$prestation.pre_comptetva}~"
										    ~{/if}~  >
									</div>  
									
<!-- 									<div class="form-inline pull-right"> -->
<!-- 									  <fieldset> -->
<!-- 										  <div class="form-group"> -->
<!-- 											<label for="pre_prixttc">~{#pre_prixttc#}~&nbsp;&nbsp;</label> -->
<!-- 				                          	<input type="checkbox" 	data-on-text="~{#btnYes#}~"  -->
<!-- 						                  							data-off-text="~{#btnNo#}~"  -->
<!-- 						                  							data-on-color="warning" -->
<!-- 						                  							data-off-color="default" -->
<!-- 						                  							data-size="small"  -->
<!-- 						                  							name="pre_prixttc"  -->
<!-- 						                  							id="pre_prixttc"  -->
<!-- 						                  							value="1" -->
<!-- 						                  							~{if $paramkey neq 0}~ -->
<!-- 						                  								~{if $prestation.pre_prixttc eq '1'}~ -->
<!-- 							                  								checked > -->
<!-- 						                  								~{else}~  -->
<!-- 						                  									> -->
<!-- 						                  								~{/if}~  -->
<!-- 						                  							~{else}~ -->
<!-- 						                  								> -->
<!-- 						                  							~{/if}~ -->
<!-- 										  </div> -->
<!-- 									  </fieldset> -->
<!-- 									</div>  -->

									</br></br>	
							        <button type="submit" class="btn" >~{#btnSubmit#}~</button>
	
							        <a class="btn btn-default" 
								        ~{if $fichemode eq "liste"}~
							        		href="prestations_list.html" >
							        	~{else}~
							        		href="index.html" >
							        	~{/if}~
							        ~{#btnCancel#}~
							        </a>
							        
							        ~{if $paramkey neq 0}~
								        <button id="prestation-suppr" type="button" class="btn btn-warning pull-right" >
								        ~{#btnSuppr#}~
								        </button>
								    ~{/if}~
									
								</div> 
								
								<div class="col-lg-6">
						        
								</div>
								
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


                            