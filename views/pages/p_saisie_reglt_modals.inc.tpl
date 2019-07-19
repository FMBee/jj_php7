
<!-- Modal : erreur -->

<div class="modal fade" id="modal-errmess">
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title title">
					Non enregistré
				</h4>
			</div>
			<div class="modal-body widget-body">
				</br>
				<h4>
					<p align="center" id="modal-messlib">...</p>
				</h4>
				</br>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<!-- Modal : ajout d'une reglement -->

<div class="modal fade" id="modal-addreglement" tabindex="-1" role="dialog"
	aria-labelledby="modal-addreglement-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-addreglement-label">
						~{#mdladdreglement#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
				
					<div class="row">
					 <div class="col-lg-6">

						<form role="form"  id="modal-faddreglement">
						  
							<div class="form-group">
							    <label>~{#mdl_montant#}~</label>
							    <input id="modal-addreglement-montant" class="form-control"  >
							</div>  

							<button id="modal-addreglement-valid" type="button" class="btn">
							~{#btnValid#}~
							</button>
							<button id="modal-addreglement-cancel" type="button" class="btn btn-default pull-right" data-dismiss="modal">
							~{#btnCancel#}~
							</button>
							
					  </form>		
					  			
					</div>
				 </div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Modal : confirm acompte -->

<div class="modal fade" id="modal-validreglement" tabindex="-1" role="dialog"
	aria-labelledby="modal-validreglement-label" aria-hidden="true">
	
	<div class="modal-dialog widget modal-vertical-centered">
		<div class="modal-content">
		
			<div class="modal-header widget-header">
					<h4 class="modal-title title" id="modal-validreglement-label">
						~{#mdlvalidreglement#}~
					</h4>
			</div>
			
			<div class="modal-body widget-body">
				<div class="container">
				
					<div class="row">
					 <div class="col-lg-6">

<!-- 						<div class="form-group"> -->
<!-- 						    <label id="modal-validreglement-name" class="form-control">...</label> -->
<!-- 						</div>   -->
<!-- 						</br> -->

						<button id="modal-validreglement-yes" type="button" class="btn">
						~{#btnYes#}~
						</button>
						<button id="modal-validreglement-cancel" type="button" class="btn btn-default" data-dismiss="modal">
						~{#btnNo#}~
						</button>
							
					</div>
				 </div>
				</div>
			</div>
		</div>
	</div>
</div>


