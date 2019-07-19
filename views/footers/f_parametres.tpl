
<script type="text/javascript">
        
   $(document).ready(function() {

		$('#fparametres').formValidation( {	
			
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
		    	par_societe: {
		    		validators: {
		    			stringLength: {
		    				min: 2,
		    				max: 80
		    			}
		    		}
		    	},
	           	par_DebutListeSejours: {
	           		validators: {
	                    date: {
	                        format: 'DD/MM/YYYY',
	                        message: 'Date valide (DD/MM/YYYY)'
	                    }
	           		}
	           	}
	           	par_NbJoursHisto: {
	                validators: {
	                numeric: {
	                    message: "Nb de jours : 0 pour tout l'historique"
	                },
	                between: {
	                    min: 0,
	                    max: 100000,
	                    message: '0 ou supérieur'
	                }
            }

           	}
		});
	
  });   //end of document.ready() 

</script>