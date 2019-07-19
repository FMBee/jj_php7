
 
  <!-- wrapper End -->
  </div>

	<!-- jQuery JS  -->
	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~jquery/dist/jquery.min.js"></script>
  
	<!-- Bootstrap Core JavaScript -->
	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Metis Menu Plugin JavaScript -->
	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="~{$smarty.const.__WEB_LIB_BOWER__}~datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="~{$smarty.const.__WEB_LIB_BOWER__}~datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="~{$smarty.const.__WEB_LIB_BOWER__}~datatables-plugins/sorting/date-uk.js"></script>
    <script src="~{$smarty.const.__WEB_LIB_BOWER__}~datatables-responsive/js/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="~{$smarty.const.__WEB_LIB_THEME__}~dist/js/sb-admin-2.js"></script>
    
	<!-- Select -->
	<script src="~{$smarty.const.__WEB_LIB_SELECT__}~dist/js/bootstrap-select.js"></script>  

	<!-- FormValidation -->
	<script	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/formValidation.min.js"></script>
	<script	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/framework/bootstrap.min.js"></script>
	<script	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/addons/mandatoryIcon.min.js"></script>
	<script	src="~{$smarty.const.__WEB_LIB_FORMVALID__}~dist/js/language/fr_FR.js"></script>

	<!-- Switch -->
    <script src="~{$smarty.const.__WEB_LIB_SWITCH__}~dist/js/bootstrap-switch.js"></script>
	<script src="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/js/highlight.js"></script>
    <script src="~{$smarty.const.__WEB_LIB_SWITCH__}~docs/js/main.js"></script>

	<!-- Owl Carousel -->
    <script src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~owl-carousel/owl.carousel.js"></script>
    <script src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~assets/js/bootstrap-transition.js"></script>
    <script src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~assets/js/bootstrap-tab.js"></script>
~{*    <script src="~{$smarty.const.__WEB_LIB_CAROUSEL__}~assets/js/bootstrap-collapse.js"></script>	*}~

    <!-- BootBox -->
    <script src="~{$smarty.const.__WEB_LIB_BOOTBOX__}~bootbox.min.js"></script>

    <!-- Autocomplete -->
	<script src="~{$smarty.const.__WEB_LIB_AUTOCPL__}~dist/jquery.autocomplete.min.js"></script>

    <script type="text/javascript">

        bootbox.addLocale(    'my_fr',
                            {
                                OK : 'OK',
                                CANCEL : 'Non',
                                CONFIRM : 'Oui'
                            }
        );
    
        bootbox.setDefaults( {
        	
          locale: "my_fr",
          show: true,
          backdrop: 'static',
          closeButton: false,
          animate: false
        });
   
		//message de retour des controller 
		~{if (isset($ctrlMessage) && $ctrlMessage neq '' ) }~
		
		bootbox.alert("~{$ctrlMessage}~");
		~{/if}~

    </script>

	~{if isset($smarty.get.page)}~			
		 
		~{include file=$smarty.const.__VIEWS_FOOTERS__|cat:"f_"|cat:$smarty.get.page|cat:".tpl"}~ 
		
	~{else}~
		
		~{include file=$smarty.const.__VIEWS_FOOTERS__|cat:"f_index.tpl"}~ 
		
    ~{/if}~

	<script type="text/javascript">

	    $(document).ready(function() {

			 // formulaire de contact

			 $('#modal-contact-modal').on('shown.bs.modal', function (e) {

// 		    	 $('#modal-contact-texte').val('');	//raz
		     });
			 
	         $("#modal-contact-btn-send").click(function() {
		        
	        	$.ajax( {
					url: "~{$smarty.const.__CONTROLLERS_AJAX__}~x_client_send.php", 
					dataType: "json",
					async: false,
					data: 
				          {
						  objet : $('#modal-contact-objet').val(),
			        	  mail	: $('#modal-contact-mail').val(),
			        	  texte	: $('#modal-contact-texte').val()
			        },
		        	success: function(data) 
		        		{
		        		if (data.retour == 'noSession')
		        			{
		       		        window.location.href = "errorpage.Votre session a expiré.htm"; 
		        		}
		        		else {
// 		        			alert('Le message a été envoyé');
		        		}
		       		},
	       		    error: function( xhr, status, errorThrown ) {

	       		    	alert("failure Ajax : requete contact");	
	       		        console.log( "Error: " + errorThrown );
	       		        console.log( "Status: " + status );	//si pas de 'echo Json(retour) : Status=parsererror
					}
	       		});
	            $('#modal-contact-btn-cancel').click();
	         });
	    });
	    
	</script>
 
</body>

</html>