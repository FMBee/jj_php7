
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        

		    $(document).ready(function() {
		    	
		        $('#fedittva').formValidation( {	
					
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
			           	deb_date : {
			           		validators: {
			                    date: {
			                        format: 'DD/MM/YYYY',
			                        message: 'Date valide (DD/MM/YYYY)'
			                    }
			           		}
			           	},
			           	fin_date : {
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
			    	   
// 	 	              e.preventDefault();
					  _reg = new RegExp("/", "g");
					  _dates = $('#deb_date').val().trim() +':'+ $('#fin_date').val().trim(); 
					  _dates = _dates.replace(_reg,"-");
						  
	            	  window.open( '~{$smarty.const.__CONTROLLERS_AJAX__}~x_edit_tva_prn.php?paramedit='+_dates );
	 	              $('#fedittva').data('formValidation').defaultSubmit();
			    });
	    		

	            $('btnEdit').on('click', function () {
	            	
	            	$('#fedittva').formValidation('validate');
		        });
	            

		    });   //end of document.ready() 

    	</script>
    	

