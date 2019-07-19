
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        

		    $(document).ready(function() {
		    	
		    	//******** définitions
		    	
		    	var _regaffect = 0;	// total affecté
		    	var _regsolde = 0;	// solde 
		    	var _totaldu = 0;	// mnt dû
		    	
		    	
		        $('#data-allfactures').DataTable(	{
		        	"responsive": true,
		        	columnDefs: [
	        	               { type: 'date-uk', targets: [4 ] },
	        	            	],
	                "paging" : false,
	                "ordering"	: true,
	                "order"		: [ [4, 'desc'] ],
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
		        $('#fsaisiereglement').formValidation( {	
					
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
						reg_date : {
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
	 	              $('#fsaisiereglement').data('formValidation').defaultSubmit();
			    });
	    		
				//********** initialisations
				
		        var table1 = $('#data-allfactures').DataTable();
		        
            	$('#addreglement')	.hide();
            	
            	//********* traitements
            	
	            $('#data-allfactures').children('tbody').on( 'click', 'tr', function () {

					table1.$('tr.danger').removeClass('danger');
                    $(this).addClass('danger');
                    
	            	_regle		= Number( $(this).find('td:eq(0)').text().trim() );
	            	_totaldu	= Number( $(this).find('td:eq(1)').text().trim() );
	            	
	            	if ( _regle == 0 ) {
	            		
		            	if ( _regsolde == 0 ) {
		            		
		            		bootbox.alert('Aucun solde à affecter');
		            	}
		            	else{
		            		if ( _regsolde > _totaldu ) {
		            			
			      	        	$('#modal-addreglement-montant').val( _totaldu.toFixed(2) );
		            		}
		            		else{
			      	        	$('#modal-addreglement-montant').val( _regsolde.toFixed(2) );
		            		}
		      	        	$('#modal-addreglement').modal({backdrop: "static", keyboard: false});
		            	}
	            	}
	            	else{
		            		bootbox.alert('Un montant est déjà affecté');
	            	}
	            		
	            });
            	
	            $('#reg_montant').change( function() { 
	            	
	            	_saisie = Number($('#reg_montant').val());
	            	
// 	            	if ( isNaN(_saisie) === true | _saisie <= 0 ) {
	            	if ( isNaN(_saisie) === true ) {
	            		
	            		bootbox.alert("Saisie incorrecte"); 
	            		$('#reg_montant').val('');
	            	}
	            	else{
	            		_regsolde = _saisie;
	      	        	$('#reg_solde').val( _regsolde.toFixed(2) );
	            		$('#reg_montant').val( _regsolde.toFixed(2) );
	            		$('#reg_montant').attr('disabled', 'true');
	            	}
	            });  

	            
	            $('#modal-addreglement-valid').on('click', function () {
	            	
	            	_saisie = Number($('#modal-addreglement-montant').val());
	            	
// 	            	if ( isNaN(_saisie) === false & _saisie > 0 ) {
	            	if ( isNaN(_saisie) === false ) {
	            		
// 	      	        	if ( _saisie > _totaldu | _saisie > _regsolde ) {
	      	        	if ( _saisie > _regsolde ) {
	      	        		
	            			bootbox.alert('Solde dépassé');
	            		}
	      	        	else{
		            		_regaffect =  _regaffect + _saisie;
			            	_regsolde  =  _regsolde - _saisie;
			            	
		      	        	$('#reg_affect').val( _regaffect.toFixed(2) );
		      	        	$('#reg_solde').val( _regsolde.toFixed(2) );
			            			
	      	        		_data = table1.row('.danger').data();
	      	        		_data[0] = _saisie.toFixed(2);
	      	        		table1.row('.danger').data( _data );

	      	        		if ( _regsolde == 0 ) {
		      	        		
		      	            	$('#addreglement')	.show();
	      	        		}
	      	        	}
	            	}
	            	else{
	            		bootbox.alert('Saisie incorrecte');
	            	}
	            	
      	        	$('#modal-addreglement-cancel').click();
      	        	
      	        	table1.draw();
		        });
	            
				
	            $('#addreglement').on('click', function () {
	            	
      	        	$('#modal-validreglement').modal( {backdrop: "static", keyboard: false} );
		        });
		     
	            $('#modal-validreglement-yes').on('click', function () {
	            	
	            	_lignes = '';	
		        		
		        	for (var i = 0 ; i < table1.data().length ; i++) {
		        		
		        		_affect = table1.row(i).data()[0].trim();
			        	
		        		if ( Number(_affect) != 0 ) {
			        		
			        		_lignes += table1.row(i).data()[7].trim() + ':' + _affect + '/';	//liste des fac_id et montants
			        	}
		        	}
            		$('#reg_montant').removeAttr('disabled');	// pour le POST
	            	$('#saisiereglement-lignes').val(_lignes);
            		
// 	            	$('#fsaisiereglement').submit();
// 	            	$('#fsaisiereglement').formValidation(_optionsVld).formValidation('validate');
// 	            	$('#fsaisiereglement').data('formValidation').defaultSubmit();
      	        	$('#modal-validreglement-cancel').click();
	            	$('#fsaisiereglement').formValidation('validate');
		        });
	            

		    });   //end of document.ready() 

    	</script>
    	

