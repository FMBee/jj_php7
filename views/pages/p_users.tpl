
~{config_load file = 'g_buttons.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_users.cfg' section = $smarty.session.__user_lang__}~

 <div id="page-wrapper">
 
 		<div class="row">
            <div class="col-lg-12">
              <div class="page-header">
<!-- 				<a class="fa fa-arrow-left fa-2x" href="factures_list.html" ></a>&nbsp;&nbsp; -->
                <span style="font-size:150%;">~{#title#}~
              </div>
            </div>
        </div>
            
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
                     <div class="panel-heading">
                       <h3>
						~{#subtitle#}~
						~{if $title eq "new"}~
							~{#libNouveau#}~
						~{else}~
							~{$title}~
						~{/if}~
                       </h3>
                     </div>
                     <div class="panel-body">
                         <div class="row">
                            <div class="col-lg-12">
                            
							<form id="fusers" method="post" role="form" 
								~{if $smarty.session.__admin_mode__ === true}~
									action="users-users_list.html" 
								~{else}~
									action="users-index.html" 
								~{/if}~ 
							>
							
<!-- 								~{*include file='users.inc.tpl'*}~ -->
 
								<!-- Modal -->
					 			<div class="modal fade" id="errormodal">
								  <div class="modal-dialog widget modal-vertical-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title">Oups !</h4>
								      </div>
								      <div class="modal-body">
								        </br><h4 align="center" id="errorlib" >...</h4></br>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">~{#btnReturn#}~</button>
								      </div>
								    </div><!-- /.modal-content -->
								  </div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
					 
								<!-- Modal -->
								<div class="modal fade" id="outmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								  <div class="modal-dialog widget modal-vertical-centered">
								    <div class="modal-content">
								      <div class="modal-header widget-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h3 class="modal-title title">~{#mldSortie#}~</h3>
								      </div>
								      <div class="modal-body widget-body">
								       <div class="container">
								        <div class="row">
								      
									          <h4 id="messInOut">...</h4><BR/>
						                      <div class="form-group has-warning col-sm-8">
						                        <label for="userfirst" class="col-sm-2">~{#libPrenom#}~</label>
						                        <div class="col-sm-6">
													<label id="userfirst" class="form-control"></label>
						        	            </div>
						                      </div>
						                      <div class="form-group has-warning col-sm-8">
						                        <label for="userlast" class="col-sm-2">~{#libNom#}~</label>
						                        <div class="col-sm-6">
													 <label id="userlast" class="form-control"></label>
						        	            </div>
						                      </div>
								         </div>		      	 
								        </div>
								      </div>
								      <div class="modal-footer widget-footer">
								        <button id="btnYes" type="button" class="btn my_button" data-dismiss="modal">~{#btnYes#}~</button>
								        <button id="btnNo" type="button" class="btn my_button" data-dismiss="modal">~{#btnNo#}~</button>
								      </div>
								    </div>
								  </div>
								<!--  End modal  -->
								</div>     
								
								<input name="key" id="key" hidden="true" value="~{$key}~">
								
								<div class="col-lg-6">
									<div class="form-group">
									    <label>~{#libPrenom#}~</label>
									    <input name="usr_first_name" id="usr_first_name" class="form-control" 
										    ~{if $key eq 0}~ placeholder="~{#libPrenom#}~"
										    ~{else}~ value="~{$user.usr_first_name}~"
										    ~{/if}~ required >
									</div>       
									<div class="form-group">
									    <label>~{#libNom#}~</label>
									    <input name="usr_last_name" id="usr_last_name" class="form-control" 
									    	~{if $key eq 0}~ placeholder="~{#libNom#}~"
									    	~{else}~ value="~{$user.usr_last_name}~"
									    	~{/if}~ required >
									</div>
									<div class="form-group">
									    <label>~{#libMail#}~</label>
									    <input name="usr_mail" id="usr_mail" type="email" class="form-control" 
									    ~{if $key eq 0}~ placeholder="~{#libMail#}~" 
									    ~{else}~ value="~{$user.usr_mail}~" ~{/if}~  >
									</div>


									~{if $smarty.server.__app_params__.__APP_INTERNATIONAL__ === true}~
									
										<div class="form-group">
											<label>~{#libLang#}~</label>
										    <select name="usr_lang" id="usr_lang" class="selectpicker form-control" required>
										    	~{foreach $languages as $language}~
											  		<option value="~{$language.lng_code}~"
												  		~{if $key neq 0}~
												  			~{if $user.usr_lang eq $language.lng_code}~ selected~{/if}~
												  		~{else}~
												  			~{if $smarty.session.__user_lang__ eq $language.lng_code}~ selected~{/if}~
												  		~{/if}~ >
												  		~{$language.lng_lib}~
											  		</option>
											 	~{/foreach}~
										    </select>        
										</div>  
										
									~{/if}~
									
									~{if $smarty.server.__app_params__.__APP_USER_LOGO__ === true}~
									
										<div class="form-inline">
										  <div class="form-group">
										    <label style="margin-right:20px">~{#libAvatar#}~</label>
										    <img id="image_aff" style="width:40%; height:40%;"
											    ~{if $key neq 0}~ src="~{$user.usr_image_path}~" 
											    ~{else}~ src="~{$smarty.const.__PATH_USERIMG__}~" ~{/if}~ 
											/>
										  </div>    
										  <div class="form-group">
										  	<button type="button" class="my_button btn btn-sm" 
										  			onclick="$('#list_logos').toggle('slow');">~{#btnModify#}~
										  	</button>
										  </div>    
										</div>
										
										<div class="form_group">
								            <div id="list_logos" >
								            	<br/>
												<label>~{#libLogo#}~</label>
											    <div class="owl-carousel">						              
										           	~{foreach from=$logos item=logo}~
												    	<div style="width:110px;">
												    		<a class="my_item link" 
												    			id="logo_~{$logo}~" >
												    			<img src="~{$smarty.const.__VIEWS_IMG__}~profiles/~{$logo}~" >
												    		</a>
												    	</div>
													~{/foreach}~
												</div>
												<input type="hidden" id="usr_image_path" name="usr_image_path"
														~{if $key neq 0}~ value="~{$user.usr_image_path}~" 
											    		~{else}~ value="~{$smarty.const.__PATH_USERIMG__}~" ~{/if}~ 
												/>	
										  	</div>
										</div>
										
									~{/if}~
									
									~{if $smarty.session.__admin_mode__ === true}~
									
										<div class="form-inline">
										  </br>
					<!-- 				  pas de sortie si utilisateur courant ou création -->
										  <fieldset ~{if ($smarty.session.__user_id__ eq $key) || $key eq 0}~
										  				disabled
										  			~{/if}~ >
											  <div class="form-group">
												<label for="out_user">~{#libSortie#}~&nbsp;&nbsp;</label>
					                          	<input type="checkbox" 	data-on-text="~{#btnYes#}~" 
							                  							data-off-text="~{#btnNo#}~" 
							                  							data-on-color="warning"
							                  							data-off-color="default"
							                  							data-size="small" 
							                  							name="out_user" 
							                  							id="out_user" 
							                  							value="1"
							                  							~{if $key neq 0}~
							                  								~{if $user.usr_out_date neq ''}~
								                  								checked >
								                  								<span>le ~{$user.usr_out_date|Date_format:"%d/%m/%Y"}~</span>
							                  								~{else}~ 
							                  									>
							                  								~{/if}~ 
							                  							~{else}~
							                  								>
							                  							~{/if}~
											  </div>
										  </fieldset>
										</div> 
									~{/if}~
									
								</div> 
								
								<div class="col-lg-6">
									<div class="form-group">
									    <label>~{#libLogin#}~</label>
									    <input name="usr_login" id="usr_login" class="form-control" 
									    ~{if $key eq 0}~ placeholder="~{#libLogin#}~" 
									    ~{else}~ value="~{$user.usr_login}~" ~{/if}~ required>
									</div>
									<div class="form-group">
									    <label>~{#libMotpass1#}~</label>
									    <input name="usr_password" id="usr_password" type="password" class="form-control" 
									    ~{if $key eq 0}~ value="~{$smarty.const.__PWD_DEFAULT__}~"
									    ~{else}~ value="~{$user.usr_password}~" ~{/if}~ required>
									</div>
									<div class="form-group">
									    <label>~{#libMotpass2#}~</label>
									    <input name="pwd" id="pwd" type="password" class="form-control" 
									    ~{if $key eq 0}~ value="~{$smarty.const.__PWD_DEFAULT__}~"
									    ~{else}~ value="~{$user.usr_password}~"~{/if}~ required>
									</div>
									
									~{if $smarty.session.__admin_mode__ === true}~
									
										<div class="form-group">
										<label>~{#libAcces#}~</label>
									    <select name="usr_pro_id" id="usr_pro_id" class="selectpicker form-control" required>
									    	~{foreach $profiles as $profil}~
											  	~{if $smarty.session['__user_access__'] gte $profil.pro_access}~
											  		<option value="~{$profil.pro_id}~"
												  		~{if $key neq 0}~
												  			~{if $user.usr_pro_id eq $profil.pro_id}~ selected~{/if}~
												  		~{/if}~ >
												  		~{$profil.pro_name}~
											  		</option>
										  		~{/if}~
										 	~{/foreach}~
									    </select>        
										</div> 
									~{/if}~
									
						        <button type="submit" class="btn" >~{#btnSubmit#}~</button>

						        <a class="btn btn-default" href=
						        	~{if $smarty.session.__admin_mode__ === true}~
						        		"users_list.html"
						        	~{else}~	
						        		"index.html"
						        	~{/if}~
						        >
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


                            