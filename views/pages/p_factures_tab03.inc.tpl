                         <div class="row">
                         
                            <div class="col-lg-12">
                            
							  </br>
							  <form id="ffactures" method="post" role="form" action="factures-factures_list.html">
							
								<input name="paramkey" id="paramkey" hidden="true" value="~{$paramkey}~">
								
								<div class="col-lg-6">
								
									<div class="form-group">
										<label>~{#cli_civ_code#}~</label>
									    <select name="fac_civ_code" id="fac_civ_code" class="selectpicker form-control" required>
									    	~{foreach $civilites as $civilite}~
										  		<option value="~{$civilite.civ_code}~"
											  		~{if $paramkey neq 0}~
											  			~{if $facture.fac_civ_code eq $civilite.civ_code}~ selected~{/if}~
											  		~{/if}~ >
											  		~{$civilite.civ_libelle}~
										  		</option>
										 	~{/foreach}~
									    </select>        
									</div> 
									
									<div class="form-group">
									    <label>~{#cli_nom#}~</label>
									    <input name="fac_nom" id="fac_nom" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#cli_nom#}~"
										    ~{else}~ value="~{$facture.fac_nom}~"
										    ~{/if}~ required >
									</div>  
									     
									<div class="form-group">
									    <label>~{#cli_prenom#}~</label>
									    <input name="fac_prenom" id="fac_prenom" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_prenom#}~"
									    	~{else}~ value="~{$facture.fac_prenom}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_rue#}~</label>
									    <input name="fac_rue" id="fac_rue" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_rue#}~"
									    	~{else}~ value="~{$facture.fac_rue}~"
									    	~{/if}~  >
									</div>
									<div class="form-group">
									    <label>~{#cli_complement#}~</label>
									    <input name="fac_complement" id="fac_complement" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_complement#}~"
									    	~{else}~ value="~{$facture.fac_complement}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_codepostal#}~</label>
									    <input name="fac_codepostal" id="fac_codepostal" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_codepostal#}~"
									    	~{else}~ value="~{$facture.fac_codepostal}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_ville#}~</label>
									    <input name="fac_ville" id="fac_ville" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_ville#}~"
									    	~{else}~ value="~{$facture.fac_ville}~"
									    	~{/if}~  >
									</div>
									
									<div class="form-group">
									    <label>~{#cli_pays#}~</label>
									    <input name="fac_pays" id="fac_pays" class="form-control" 
									    	~{if $paramkey eq 0}~ placeholder="~{#cli_pays#}~"
									    	~{else}~ value="~{$facture.fac_pays}~"
									    	~{/if}~  >
									</div>
								
									</br></br>	
							        <button type="submit" class="btn" >~{#btnSubmit#}~</button>
	
							        <a class="btn btn-default" 
							        	~{if $fichemode eq "liste"}~
							        		href="factures_list.html" >
							        	~{else}~
							        		href="index.html" >
							        	~{/if}~
							        ~{#btnCancel#}~
							        </a>
								
								</div> 
								
							</form>
							
						</div>
					</div>
