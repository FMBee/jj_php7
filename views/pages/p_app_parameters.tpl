
    <div id="page-wrapper">
			<br/>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Paramètres de l'application
                        </div>
                        <div class="panel-body">
                            <div class="row">	
                            	<form role="form" action="app_parameters-index.html" method="post" enctype="multipart/form-data" id="fparameters">	
									<div class="col-lg-12">
										~{foreach from=$parameters item=parameter}~										
											<div class="form-group">
												<label>~{$parameter.prt_name}~</label> 
												<input name="param_~{$parameter.prt_id}~" id="param_~{$parameter.prt_id}~" class="form-control" 
												value="~{$parameter.prt_value}~" required>
											</div>
										~{/foreach}~
										
										<button type="submit" class="btn my_button">Enregistrer</button>	
										
										<a class="btn btn-default" href="index.html" >Annuler</a>
																			
							 		</div>
							 	</form> 
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>

