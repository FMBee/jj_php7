
~{config_load file = 'g_clients.cfg' section = $smarty.session.__user_lang__}~

<script type="text/javascript">
        
   $(document).ready(function() {

		$('.selectpicker').selectpicker();

		$('#fclients').formValidation( {	
			
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
		    	cli_nom: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 150
		    			},
		    			regexp: {
		    				regexp: /^[a-zA-Z \'\-]+$/,
		    				message: "Caractères accentués non permis"
		    			}
// 		    			stringCase: {
// 		    				message: 'Veuillez saisir en majuscules',
// 		    				'case': 'upper'
// 		    			}
		    		}
		    	},
// 	           	cli_codepostal: {
// 	           		validators: {
// 	                    regexp: {
// 	                        regexp: /^[0-9]{5}$/,	
// 	                        message: "Veuillez saisir 5 chiffres"
// 	           			}
// 	           		}
// 	           	},
		    	cli_ville: {
		    		validators: {
		    			stringLength: {	
		    				max: 150
		    			},
		    			regexp: {
		    				regexp: /^[a-zA-Z0-9 \'\-]+$/,
		    				message: "Caractères accentués non permis"
		    			}
		    		}
		    	},
	           	cli_email: {
	           		validators: {
	           			emailAddress: {
	                        message: "Veuillez saisir une adresse mail valide"
	           			}
	           		}
	           	},
	           	cli_datenais: {
	           		validators: {
	                    date: {
	                        format: 'DD/MM/YYYY',
	                        message: 'Date valide (DD/MM/YYYY)'
	                    }
	           		}
	           	}
           	}
		})
	       .on('success.form.fv', function(e) {
	    	   
	              e.preventDefault();
	              _submit = true;
	              
	              if ($('#add_sejour').val().trim() != '0' && $('#trf_sejour').val().trim() != '0') {
	            	  
	           			bootbox.confirm('Confirmez-vous le report de séjour ?',
	                   			function(result) {
					              if (result) {
					            	  $('#fclients').data('formValidation').defaultSubmit();
					              }
	           					});
	              }
	              else {
	            	  $('#fclients').data('formValidation').defaultSubmit();
	              }
		    });

		
        $('#send_mail').on('click', function () {
        	
      	  	$('#modal-contact-mail').html( $('#cli_email').val() );
      	  	$('#modal-contact-nom').html( 'à : '+$('#cli_nom').val()+' '+$('#cli_prenom').val() );

	        $('#modal-contact').modal( {backdrop: "static", keyboard: false} );
        });

        $('#clients-suppr').on('click', function () {
        	
            bootbox.confirm(   "Confirmez-vous la suppression de cette fiche ?",
                    			function(result) {
			                        if (result) {
			                           
			                        	window.location.href = "index.php?action=clients&page=clients_intro&supp_id="+$('#paramkey').val();
			                        }
            					}
			);
        });
	
  });   //end of document.ready() 

</script>