
~{config_load file = 'g_users.cfg' section = $smarty.session.__user_lang__}~

<script type="text/javascript">
        
   $(document).ready(function() {

		~{if $smarty.server.__app_params__.__APP_USER_LOGO__ === true}~

		      $(".owl-carousel").owlCarousel({
			      items : 5 
			      });
		      
		     $('#list_logos').toggle();		//cache le carousel
	
			 $(".link").on('click', function(event) {
				 
				 	var _name = "~{$smarty.const.__VIEWS_IMG__}~" + 'profiles/' + $(this).attr('id').substr(5);
				 	
		    	    $('#usr_image_path').val(_name);
		    	    $('#image_aff').attr('src', _name);
	      		    $('#list_logos').toggle('slow');
		     });
		     
		~{/if}~


		$('.selectpicker').selectpicker();

		$('#fusers').formValidation( {	
			
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
		    	usr_first_name: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 60
		    			},
		    		}
		    	},
		    	usr_last_name: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 60
		    			},
		    			stringCase: {
		    				message: 'Veuillez saisir en majuscules',
		    				'case': 'upper'
		    			}
		    		}
		    	},
		    	usr_login: {
		    		validators: {
		    			stringLength: {
		    				min: 8,
		    				max: 20
		    			},
		    			regexp: {
		    				regexp: /^[a-zA-Z]{1}[a-zA-Z0-9.\-]+$/,
		    				message: "~{#msgLogin#}~"
		    			},
		                callback: {
		                	message: "~{#vldLogin1#}~",
		                	callback: function(value, validator, $field) {
		                		return ($('#usr_password').val() != value)
		                	}
		                }
		    		}
		    	},
		    	usr_password: {
		    		validators: {
		    			stringLength: {
		    				min: 8,
		    				max: 15
		    			},
		    			regexp: {
		    				regexp: /^(?=.*\d)(?=.*[a-zA-Z]).{8,15}$/,
		    				message: "~{#msgMotpass#}~"
		    			}
		    		},
		            onSuccess: function(e, data) {
		                data.fv.revalidateField('pwd');
		                data.fv.revalidateField('usr_login');
		            }
		    	},
		    	pwd: {
		            validators: {
		                stringLength: {
		                    min: 8,
		                    max: 15
		                },
		                regexp: {
		    				regexp: /^(?=.*\d)(?=.*[a-zA-Z]).{8,15}$/,
		    				message: "~{#msgMotpass#}~"
		    			},
		                callback: {
		                	message: "~{#vldMotpass#}~",
		                	callback: function(value, validator, $field) {
		                		return ($('#usr_password').val() == value)
		                	}
		                }
		            }
		        },
		    }
	});
		
	
	/**
	 * appel Ajax pour test du login choisi
	 */

	$(document).on(	'change', '#usr_login', function(evt) {
		
			var $valeur = $('#usr_login').val();
			var $defaut = $('#usr_login').prop('defaultValue');
			
			if ($valeur != $defaut)  //l'utilisateur a retapé le meme login !
			{
			     $.getJSON(
			          // appel du fichier externe 
			          '~{$smarty.const.__CONTROLLERS_AJAX__}~x_testlog.php',
			          {login : $valeur},
			          function(data) 
			          {  
			        	  if(data.exist == 'true')
			        	  {
			        		  $('#errorlib').html("~{#vldLogin2#}~");
			        		  $('#errormodal').modal('show');
			        		  
			        		  $('#usr_login').val($defaut);   //remet la valeur initiale
			                  $('form').formValidation('revalidateField', 'usr_login');	//revalide le champ

			        	  }
			          }       
			     );  
			}
	});

	//Boostrap-switch
	$('input[name="out_user"]').on('switchChange.bootstrapSwitch', function(event, state) {
		
				if($(this).is(":checked")) {
					$('#messInOut').html("~{#msgSortie#}~");
				}else{
					$('#messInOut').html("~{#msgRetour#}~");
				}
				
				$('#userfirst').text( $('#usr_first_name').val() );
                $('#userlast').text( $('#usr_last_name').val() );

      	        $('#outmodal').modal({backdrop: "static", keyboard: false});
    });
	
	$("#btnNo").click(function() {
				//Bootstrap-switch
				$('input[name="out_user"]').bootstrapSwitch('toggleState', true);	//on repositionne le switch
    });

  });   //end of document.ready() 

</script>