
<script type="text/javascript">
        
   $(document).ready(function() {

		$('#ffactures').formValidation( {	
			
		    framework: 'bootstrap',
		    // Feedback icons
		    icon: {
		        valid: 'glyphicon glyphicon-ok',
		        invalid: 'glyphicon glyphicon-remove',
		        validating: 'glyphicon glyphicon-refresh'
		    },
		    addOns: {
		    	//marquage champs required
		        mandatoryIcon: {
		            icon: 'glyphicon glyphicon-asterisk'
		        }
		    },
		    locale: "fr_FR",
	
		    fields: {
		    	fac_nom: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 80
		    			},
						stringCase: {
							message: 'Veuillez saisir en majuscules',
							'case': 'upper'
						}
		    		}
		    	}
           	}
		});
		
        $('#editfacture').on('click', function () {
        	
        	window.open( '~{$smarty.const.__CONTROLLERS_AJAX__}~x_facture_prn.php?paramfacture=~{$facture.fac_id}~' );

        });
	
        $('#editcommande').on('click', function () {
        	
        	window.open( '~{$smarty.const.__CONTROLLERS_AJAX__}~x_facture_prn.php?paramfacture=~{$facture.fac_id}~' );

        });
	
  });   //end of document.ready() 

</script>