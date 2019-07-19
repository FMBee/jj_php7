

<script type="text/javascript">
        
   $(document).ready(function() {

		$('.selectpicker').selectpicker();

		$('#fprestations').formValidation( {	
			
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
		    	pre_libelle: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 80
		    			}
		    		}
		    	}
           	}
		});

        $('#prestation-suppr').on('click', function () {
        	
            bootbox.confirm(   "Confirmez-vous la suppression de cette fiche ?",
                    			function(result) {
			                        if (result) {
			                           
			                        	window.location.href = "index.php?action=prestations&page=prestations_list&supp_id="+$('#paramkey').val();
			                        }
            					}
			);
        });

        
  });   //end of document.ready() 

</script>