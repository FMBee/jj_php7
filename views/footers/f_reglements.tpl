

<script type="text/javascript">
        
   $(document).ready(function() {

		$('.selectpicker').selectpicker();

		$('#freglements').formValidation( {	
			
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
		    	reg_mode: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 80
		    			}
		    		}
		    	},
// 	           	reg_date: {
// 	           		validators: {
// 	                    date: {
// 	                        format: 'DD/MM/YYYY',
// 	                        message: 'Date valide DD/MM/YYYY'
// 	                    }
// 	           		}
// 	           	},
	           	reg_remise: {
	           		validators: {
	                    date: {
	                        format: 'DD/MM/YYYY',
	                        message: 'Date valide DD/MM/YYYY'
	                    }
	           		}
	           	}
           	}

		});
	
  });   //end of document.ready() 

</script>