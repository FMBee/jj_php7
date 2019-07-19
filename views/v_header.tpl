<!DOCTYPE html>
<html ~{if isset($smarty.session.__user_lang__)}~ lang="~{$smarty.session.__user_lang__}~" ~{else}~ lang="fr" ~{/if}~>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>~{$smarty.const.__APP_TITLE__}~</title>
	
    <!-- Bootstrap Core CSS -->
    <link href="~{$smarty.const.__WEB_LIB_BOOTSTRAP__}~dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="~{$smarty.const.__WEB_LIB_THEME__}~dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="~{$smarty.const.__WEB_LIB_BOWER__}~font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- DataTables CSS -->
    <link href="~{$smarty.const.__WEB_LIB_BOWER__}~datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
    <link href="~{$smarty.const.__WEB_LIB_BOWER__}~datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">    
<!-- 	<link href="~{$smarty.const.__WEB_LIB_DATASELECT__}~css/select.bootstrap.min.css" rel="stylesheet"> -->

    <!-- MetisMenu CSS -->
    <link href="~{$smarty.const.__WEB_LIB_BOWER__}~metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    
    <!-- Timeline CSS -->
    <link href="~{$smarty.const.__WEB_LIB_THEME__}~dist/css/timeline.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="~{$smarty.const.__WEB_LIB_BOWER__}~morrisjs/morris.css" rel="stylesheet">
    
    <link href="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/css/formValidation.min.css">

 	<!-- Select -->
 	<link href="~{$smarty.const.__WEB_LIB_SELECT__}~dist/css/bootstrap-select.css" rel="stylesheet" type="text/css" >	
  
 	<!-- Switch -->
    <link href="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/css/highlight.css" rel="stylesheet">
	<link href="~{$smarty.const.__WEB_LIB_SWITCH__}~dist/css/bootstrap3/bootstrap-switch.css" rel="stylesheet">
    <link href="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/css/main.css" rel="stylesheet">

	<!--  Owl Carousel Assets     -->
    <link href="~{$smarty.const.__WEB_LIB_CAROUSEL__}~owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="~{$smarty.const.__WEB_LIB_CAROUSEL__}~owl-carousel/owl.theme.css" rel="stylesheet">

	<!-- Autocomplete -->
	<style type="text/css">
	.autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }
	.autocomplete-suggestion { padding: 2px 5px; white-space: nowrap; overflow: hidden; }
	.autocomplete-selected { background: #F0F0F0; }
	.autocomplete-suggestions strong { font-weight: normal; color: #3399FF; }
	.autocomplete-group { padding: 2px 5px; }
	.autocomplete-group strong { display: block; border-bottom: 1px solid #000; }
	</style>

</head>

<body>

	<!-- Modal de contact client -->
	
	<div class="modal fade" id="modal-contact" tabindex="-1" role="dialog"
		aria-labelledby="contactModalLabel" aria-hidden="true">
		
		<div class="modal-dialog widget modal-vertical-centered">
			<div class="modal-content">
				
				<div class="modal-header widget-header">
					<h4 class="modal-title title" id="contactModalLabel">
						Contact client
					</h4>
				</div>
				
				<div class="modal-body widget-body">
					<div class="container">
						<div class="row">
						  <div class="col-lg-6">
						
							<form id="modal-contact-form">
							
								
								<div class="form-group">
									<label class="form-control" id="modal-contact-nom" disabled></label>
								</div>
								<div class="form-group">
<!-- 									<label class="form-control" id="modal-contact-mail" disabled></label> -->
									<textarea class="form-control" id="modal-contact-mail" name="modal-contact-mail" 
	                        				  cols="50" rows="7">
									</textarea>
								</div>
								<div class="form-group">
									<label for="modal-contact-objet">Objet</label>
									<input class="form-control" id="modal-contact-objet" >
								</div>
								<div class="form-group">
									<label for="modal-contact-texte">Votre message</label>
									<textarea class="form-control" id="modal-contact-texte" autofocus cols="50" rows="7">
									</textarea>
								</div>
							</form>
							
						  </div>
						</div>
					</div>
				</div>
				
				<div class="modal-footer widget-footer">
					<a class="btn btn-info" id="modal-contact-btn-send">Envoyer</a>
					<button type="button" class="btn btn-default" id="modal-contact-btn-cancel"
						data-dismiss="modal">
						Annuler
					</button>
				</div>
			</div>
		</div>
	</div>


    <div id="wrapper">
	 
