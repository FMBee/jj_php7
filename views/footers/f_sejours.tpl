

<script type="text/javascript">
        
   $(document).ready(function() {

		$('.selectpicker').selectpicker();

		$('#fsejours').formValidation( {	
			
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
		    	sej_libelle: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 80
		    			}
		    		}
		    	},
	           	sej_debut: {
	           		validators: {
	                    date: {
	                        format: 'DD/MM/YYYY',
	                        message: 'Date valide (DD/MM/YYYY)'
	                    }
	           		}
	           	},
	           	sej_fin: {
	           		validators: {
	                    date: {
	                        format: 'DD/MM/YYYY',
	                        message: 'Date valide (DD/MM/YYYY)'
	                    }
	           		}
	           	}
           	}
		});

        $('#editfactures').on('click', function () {
        	
        	window.open( '~{$smarty.const.__CONTROLLERS_AJAX__}~x_factures_prn.php?paramsejour=~{$paramkey}~&choix=2' );

        });
        
        $('#sejour-suppr').on('click', function () {
        	
            bootbox.confirm(   "Confirmez-vous la suppression de cette fiche ?",
                    			function(result) {
			                        if (result) {
			                           
			                        	window.location.href = "index.php?action=sejours&page=sejours_list&supp_id="+$('#paramkey').val();
			                        }
            					}
			);
        });

  });   //end of document.ready() 

</script>