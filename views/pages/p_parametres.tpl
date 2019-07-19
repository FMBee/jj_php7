
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_parametres.cfg' section = $smarty.session.__user_lang__}~

 <div id="page-wrapper">
 		<div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">~{#title#}~</h2>
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
                            
							<form id="fparametres" method="post" role="form" action="parametres-index.html">
							
								<input name="paramkey" id="paramkey" hidden="true" value="~{$paramkey}~">
								
								<div class="col-lg-6">
<!-- par_societe                -->
<!-- par_rue                    -->
<!-- par_complement             -->
<!-- par_codepostal             -->
<!-- par_ville                  -->
<!-- par_pays                   -->
<!-- par_email                  -->
<!-- par_telfixe                -->
<!-- par_portable               -->
									<div class="form-group">
									    <label>~{#par_societe#}~</label>
									    <input name="par_societe" id="par_societe" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_societe#}~"
										    ~{else}~ value="~{$parametre.par_societe}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_rue#}~</label>
									    <input name="par_rue" id="par_rue" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_rue#}~"
										    ~{else}~ value="~{$parametre.par_rue}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_complement#}~</label>
									    <input name="par_complement" id="par_complement" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_complement#}~"
										    ~{else}~ value="~{$parametre.par_complement}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_codepostal#}~</label>
									    <input name="par_codepostal" id="par_codepostal" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_codepostal#}~"
										    ~{else}~ value="~{$parametre.par_codepostal}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_ville#}~</label>
									    <input name="par_ville" id="par_ville" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_ville#}~"
										    ~{else}~ value="~{$parametre.par_ville}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_pays#}~</label>
									    <input name="par_pays" id="par_pays" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_pays#}~"
										    ~{else}~ value="~{$parametre.par_pays}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_email#}~</label>
									    <input name="par_email" id="par_email" type="mail" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_email#}~"
										    ~{else}~ value="~{$parametre.par_email}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_telfixe#}~</label>
									    <input name="par_telfixe" id="par_telfixe" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_telfixe#}~"
										    ~{else}~ value="~{$parametre.par_telfixe}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_portable#}~</label>
									    <input name="par_portable" id="par_portable" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_portable#}~"
										    ~{else}~ value="~{$parametre.par_portable}~"
										    ~{/if}~ required >
									</div>  
									
								</div> 
								
								<div class="col-lg-6">
<!-- par_responsable            -->
<!-- par_siret                  -->
<!-- par_codenaf                -->
<!-- par_iban                   -->
<!-- par_TvaIntracom           								 -->
<!-- par_CodeJournalVente       -->
<!-- par_CodeJournalBanque      -->

									<div class="form-group">
									    <label>~{#par_responsable#}~</label>
									    <input name="par_responsable" id="par_responsable" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_responsable#}~"
										    ~{else}~ value="~{$parametre.par_responsable}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_siret#}~</label>
									    <input name="par_siret" id="par_siret" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_siret#}~"
										    ~{else}~ value="~{$parametre.par_siret}~"
										    ~{/if}~ required >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_codenaf#}~</label>
									    <input name="par_codenaf" id="par_codenaf" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_codenaf#}~"
										    ~{else}~ value="~{$parametre.par_codenaf}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_iban#}~</label>
									    <input name="par_iban" id="par_iban" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_iban#}~"
										    ~{else}~ value="~{$parametre.par_iban}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_TvaIntracomm#}~</label>
									    <input name="par_TvaIntracom" id="par_TvaIntracom" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_TvaIntracom#}~"
										    ~{else}~ value="~{$parametre.par_TvaIntracom}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_CodeJournalVente#}~</label>
									    <input name="par_CodeJournalVente" id="par_CodeJournalVente" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_CodeJournalVente#}~"
										    ~{else}~ value="~{$parametre.par_CodeJournalVente}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_CodeJournalBanque#}~</label>
									    <input name="par_CodeJournalBanque" id="par_CodeJournalBanque" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_CodeJournalBanque#}~"
										    ~{else}~ value="~{$parametre.par_CodeJournalBanque}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_DebutListeSejours#}~</label>
									    <input name="par_DebutListeSejours" id="par_DebutListeSejours" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_DebutListeSejours#}~"
										    ~{else}~ value="~{$parametre.par_DebutListeSejours}~"
										    ~{/if}~  >
									</div>  
									
									<div class="form-group">
									    <label>~{#par_NbJoursHisto#}~</label>
									    <input name="par_NbJoursHisto" id="par_NbJoursHisto" class="form-control" 
										    ~{if $paramkey eq 0}~ placeholder="~{#par_NbJoursHisto#}~"
										    ~{else}~ value="~{$parametre.par_NbJoursHisto}~"
										    ~{/if}~  >
									</div>  
									
									</br>
							        <button type="submit" class="btn" >~{#btnSubmit#}~</button>
	
							        <a class="btn btn-default" 
								        ~{if $fichemode eq "liste"}~
							        		href="parametres_list.html" >
							        	~{else}~
							        		href="index.html" >
							        	~{/if}~
							        ~{#btnCancel#}~
							        </a>
 
								</div>
								
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


                            