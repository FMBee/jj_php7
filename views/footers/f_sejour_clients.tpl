
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~
~{config_load file = 'g_sejour_clients.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        

		    $(document).ready(function() {
		    	
		    	//******** définitions
		    	
		        $('#data-allclients').DataTable(	{
		        	"responsive": true,
		        	"columnDefs": [
		        	               { "width": "5%", "targets": [0 ] }
		        	            ],
// 		        	select		: {
// 		        		style : 'single'
// 		        	},
					"dom"		: 'rtp',
// 	                "pagingType": "simple",
	                "paging": false,
	                "pageLength": 10,
	                "ordering"	: false,
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
// 		        $('#data-modal-addclient').DataTable(	{
// 					"dom"		: 'frtip',
// 					"columnDefs": [
// 					               { "searchable": false, "targets": [1, 2, 3] }
// 					             ], 
// 	                "pagingType": "simple",
// 	                "pageLength": 7,
// 	                "ordering"	: false,
// 	                ~{*include file="p_datatable_language.inc.tpl"*}~
// 				});
	
		        $('#data-allprestations').DataTable(	{
		        	"responsive": true,
		        	"columnDefs": [
		        	               { width: "6%", targets: [0 ] },
		        	               { width: "50%", targets: [2 ] }
		        	            ],
					"dom"		: 'rtp',
	                "pagingType": "simple",
	                "pageLength": 10,
	                "ordering"	: false,
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
		        $('#data-modal-addprestation').DataTable(	{
		        	"responsive": true,
		        	"dom"		: 'frtp',
					"columnDefs": [
					               { "searchable": false, "targets": [2] },
		        	               { width: "10%", targets: [0 ] }
					             ], 
	                "pagingType": "simple",
	                "pageLength": 15,
	                "ordering"	: false,
	                ~{include file="p_datatable_language.inc.tpl"}~
				});

		        $('#fsaisieacompte').formValidation( {	
					
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
				    	saisieacomptereg_mode: {
				    		validators: {
				    			stringLength: {
				    				min: 2,
				    				max: 80
				    			}
				    		}
				    	},
				    	saisieacomptereg_date : {
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
	 	              $('#fsaisieacompte').data('formValidation').defaultSubmit();
			    });

	    		
				//********** initialisations
				
				var _fac_totalttc = 0;
				var _fac_totalregle = 0;
				var _facture = '';
				var _etat = '';
				
		        var table1 = $('#data-allclients').DataTable();
		        var table2 = $('#data-allprestations').DataTable();
// 		        var table3 = $('#data-modal-addclient').DataTable();
		        var table4 = $('#data-modal-addprestation').DataTable();
		        
            	table2		.columns([6])
            				.search('cli_000')
            				.draw();
            	
//             	alert( $('#data-allclients').children('tbody').find('tr:eq(2)').text() );
//             	$('#data-allclients').children('tbody').find('tr:eq(2)').click();
//             	$('#addclient').trigger('click');
//             	$('#addclient').focus();
//             	$('#addclient').blur();
// OK 	            $('.table tbody').children('tr').on( 'click', 'td:eq(1)', function () {
//             	$('#data-allclients').children('tbody').find('tr:eq(2)').trigger('click');
//             	$('#data-allclients').children('tbody tr:eq(5)').trigger('click');
            	
// 				alert('rrh');
//             	table1.row(5).trigger('click)');
//             	table1.row(5);
//             	table1.rows(5).select();
//             	var test = table1.rows(':eq(5)').select();
//             	table1.row(':eq(5)', { page: 'current' }).select();

				// chargement des valeurs POST
	            $('#modal-addclient-paramsejour')			.val("~{$paramkey}~");
	            $('#modal-addclient-paramsejourname')		.val("~{$paramname}~");
                $('#modal-supclient-paramsejour')			.val("~{$paramkey}~");
                $('#modal-supclient-paramsejourname')		.val("~{$paramname}~");
                $('#modal-addprestation-paramsejour')		.val("~{$paramkey}~");
                $('#modal-addprestation-paramsejourname')	.val("~{$paramname}~");
                $('#modal-majprestation-paramsejour')		.val("~{$paramkey}~");
                $('#modal-majprestation-paramsejourname')	.val("~{$paramname}~");
                $('#modal-supprestation-paramsejour')		.val("~{$paramkey}~");
                $('#modal-supprestation-paramsejourname')	.val("~{$paramname}~");
                $('#saisieacompte-paramsejour')				.val("~{$paramkey}~");
                $('#saisieacompte-paramsejourname')			.val("~{$paramname}~");
                $('#editfacture-paramsejour')				.val("~{$paramkey}~");
                $('#editfacture-paramsejourname')			.val("~{$paramname}~");
                $('#editallfactures-paramsejour')			.val("~{$paramkey}~");
                $('#editallfactures-paramsejourname')		.val("~{$paramname}~");
            	
            	$('#supclient')						.hide();
            	$('#modal-addclient-addrecord')		.hide();
            	
            	$('#addprestation')					.hide();
            	$('#supprestation')					.hide();
            	$('#modal-addprestation-addrecord')	.hide();
            	
            	$('#totalprestations')				.hide();
            	$('#affictotalregle')				.hide();
            	$('#saisieacompte')					.hide();
            	$('#diveditfacture')				.hide();

            	
	         	~{if ( isset($editfacture) ) }~
            	
		        		window.open( '~{$smarty.const.__CONTROLLERS_AJAX__}~x_facture_prn.php?paramfacture=~{$editfacture}~' );
		    		  
		    	~{/if}~
		    	
	         	~{if ( isset($editallfactures) ) }~
            	
		        		window.open( '~{$smarty.const.__CONTROLLERS_AJAX__}~x_factures_prn.php?paramsejour=~{$paramkey}~&choix=1&liste=~{$listEdit}~' );
		    		  
		    	~{/if}~
		    	
            	
            	//********* clients
            	
	            $('#data-allclients').children('tbody').on( 'click', 'tr', function () {
	            	

					table1.$('tr.danger').removeClass('danger');
                    $(this).addClass('danger');
                    
                    table2.$('tr.danger').removeClass('danger');
                    
					table2    .columns([6])
                                .search('^cli_'+($(this).attr('id'))+'$', true, false )
                                .draw();
								
	            	$('#totalprestations')	.show();
	            	$('#addprestation')		.show();
                	$('#saisieacompte')		.show();
	            	
	            	$('#supprestation')		.hide();
            		$('#supclient')			.hide();
                	$('#affictotalregle')	.hide();
                	$('#diveditfacture')	.hide();
                	
	            	_fac_totalttc	= $(this).find('td:eq(4)').text();
	            	_fac_totalregle	= $(this).find('td:eq(7)').text();
	            	
	            	_facture 	= $(this).find('td:eq(3)').text().trim();
	            	_etat	 	= $(this).find('td:eq(2)').text().trim();
	            	
	            	if ( Number(_fac_totalttc) <= Number(_fac_totalregle) ) {		//commande soldée
	            		
	                	$('#saisieacompte')	.hide();
	            	}
	            	if ( _facture == '(à créer)' ) {
	            		
	            		$('#supclient')		.show();
	                	$('#saisieacompte')	.hide();
	            	}
	            	else {
	            		if ( _etat == 'Préinscrit' ) {

		            		$('#supclient').show();
// 	            			if ( Number(_fac_totalregle) == 0 ) {
	                		
// 	            				$('#saisieacompte').show();
// 	            			}
// 	            			else {
// 		            			$('#affictotalregle').show();
// 	            			}
	            		}
	            		else {	
	            			$('#affictotalregle').show();
	            			
		            		if ( _etat == 'Confirmé' ) {
		            			
				            	if ( _facture != '(brouillon)' ) {
				            		
					            	$('#addprestation').hide();
		            				$('#saisieacompte').hide();
				            	}
				            	else {
				                	$('#diveditfacture').show();
				            	}
		            		}
		            		else {	// 'Annulé'
					            	$('#addprestation').hide();
		            		}
	            		}
	            	}
	            	
	            	var _cli_id			= $(this).attr('id');
	            	var _cli_nom 		= $(this).find('td:eq(1)').text();
// 	            	var _cli_prenom 	= $(this).find('td:eq(1)').text();
	            	var _cli_email		= $(this).find('td:eq(8)').text();
	            	var _fac_id			= $(this).find('td:eq(6)').text();
	            	
   	                $('#nomprenom')							.html( ' de '+_cli_nom );	
   	                $('#montantprestations')				.html( _fac_totalttc );	
   	                $('#montantregle')						.html( _fac_totalregle );	
	            	
   	                $('#modal-supclient-name')				.html( _cli_nom );
	            	$('#modal-supclient-paramclient')		.val( _cli_id );	
	            	
	            	$('#modal-addprestation-paramclient')	.val( _cli_id );	
	            	$('#modal-addprestation-paramindex')	.val( table1.row(this).index() );	
	            	$('#modal-addprestation-paramfacture')	.val( _fac_id );
	            	$('#modal-majprestation-paramclient')	.val( _cli_id );	
	            	$('#modal-majprestation-paramindex')	.val( table1.row(this).index() );	
	            	$('#modal-majprestation-paramfacture')	.val( _fac_id );
	            	$('#modal-supprestation-paramfacture')	.val( _fac_id );
	            	$('#modal-supprestation-paramindex')	.val( table1.row(this).index() );	
	            	
	            	$('#saisieacompte-paramclient')			.val( _cli_id );	
	            	$('#saisieacompte-paramindex')			.val( table1.row(this).index() );	
	            	$('#saisieacompte-paramfacture')		.val( _fac_id );
// 	            	$('#modal-validacompte-name')			.html( _cli_nom );

	            	$('#editfacture-paramfacture')			.val( _fac_id );
	            	$('#editfacture-paramindex')			.val( table1.row(this).index() );	
	            	$('#editallfactures-paramindex')		.val( table1.row(this).index() );	
// 	            	$('#modal-editfacture-name')			.html( _cli_nom );
	            	
// 	          	  	$('#modal-contact-nom')					.html( 'à : '+_cli_nom );
// 	          	  	$('#modal-contact-mail')				.val( _cli_email );

	            });
		    	// replacement sur le client courant
            	$('#data-allclients').children('tbody').find("tr:eq(~{$paramindex|strip}~)").click();

	            
	            $('#addclient').on('click', function () {
	            	
		            $('#modal-addclient-introvalue').val('');
      	        	$('#modal-addclient').modal({backdrop: "static", keyboard: false});
		        });
//             	$('#addclient').trigger('click');	//OK: à placer après le eventListener !
      	        
	            $('#supclient').on('click', function() {
	            	
// 	            	$('#modal-supclient').modal( {backdrop: "static", keyboard: false} );
           			
           			bootbox.confirm('Etes-vous sûr ?',
               			function(result) {
	                        if (result) {
	                           
				            	$('#modal-fsupclient').submit();
	                        }
       					});
		        });


			    var _url = "~{$smarty.const.__CONTROLLERS_AJAX__}~x_clients.php?prenom=false&ville=false&cp=false";
			    
			    $('#sk-prenom').on('change', function() {
			    	
			    	_reg = new RegExp("prenom=false|prenom=true", "g");
			    	_url = _url.replace(_reg, 'prenom='+$(this).is(":checked"));
			    	$('#modal-addclient-introvalue').autocomplete().setOptions({ serviceUrl: _url });
			    });
			    $('#sk-ville').on('change', function() {
			    	
			    	_reg = new RegExp("ville=false|ville=true", "g");
			    	_url = _url.replace(_reg, 'ville='+$(this).is(":checked"));
			    	$('#modal-addclient-introvalue').autocomplete().setOptions({ serviceUrl: _url });
			    });
			    $('#sk-cp').on('change', function() {
			    	
			    	_reg = new RegExp("cp=false|cp=true", "g");
			    	_url = _url.replace(_reg, 'cp='+$(this).is(":checked"));
			    	$('#modal-addclient-introvalue').autocomplete().setOptions({ serviceUrl: _url });
			    });
		        $('#modal-addclient-introvalue').autocomplete({
		    	    serviceUrl: _url,
		    	    minChars: 2,
		    	    showNoSuggestionNotice: true,
		    	    noSuggestionNotice : 'Aucun résultat',
	    			onInvalidateSelection: function (){
	    			        $('#modal-addclient-introvalue').val('');
			            	$('#modal-addclient-addrecord').hide();
	    			    },
		    	    onSelect: function (suggestion) {
		
			            	$('#modal-addclient-paramclient').val( suggestion.data );	
			            	$('#modal-addclient-addrecord').show();
		    	    	}
		    	});
// 	            $('#data-modal-addclient').children('tbody').on( 'click', 'tr', function () {

//                     table3.$('tr.danger').removeClass('danger');
//                     $(this).addClass('danger');
                    
// 	            	$('#modal-addclient-addrecord').show();
// 	            	$('#modal-addclient-paramclient').val( $(this).attr('id') );	
// 	            });
	            
	            $('#modal-addclient-addrecord').on('click', function () {
	            	
		            	$('#modal-faddclient').submit();
		        });
	            
// 	            $('#modal-supclient-yes').on('click', function () {
	            	
// 	            	$('#modal-fsupclient').submit();
// 		        });
		        
	            
	            //******** prestations
	            
	            $('#data-allprestations').children('tbody').on( 'click', 'tr', function () {
	            	
                    
                    if ( _facture == '(brouillon)' && _etat != 'Annulé' ) {
	            		
	                    table2.$('tr.danger').removeClass('danger');
	                    $(this).addClass('danger');

		            	var _numlig		= $(this).find('td:eq(0)').text();
		            	var _descriptif	= $(this).find('td:eq(2)').text();
		            	var _qte		= $(this).find('td:eq(3)').text();
		            	var _puttc		= $(this).find('td:eq(4)').text();
		            	
		            	$('#modal-supprestation-paramligne').val( _numlig );	
	                    $('#modal-supprestation-name').html( _descriptif );
	                    $('#modal-majprestation-paramnumlig').val( _numlig );
	                    $('#modal-majprestation-fli_descriptif').val( _descriptif );
	                    $('#modal-majprestation-fli_quantite').val( _qte );
	                    $('#modal-majprestation-fli_puttc').val( _puttc );
	                    
	      	        	$('#modal-majprestation').modal({backdrop: "static", keyboard: false});
	            	}

	            });

	            $('#addprestation').on('click', function () {
	            	
      	        	$('#modal-addprestation').modal({backdrop: "static", keyboard: false});
		        });
      	        
	            $('#data-modal-addprestation').children('tbody').on( 'click', 'tr', function () {

                    table4.$('tr.danger').removeClass('danger');
                    $(this).addClass('danger');
                    
	            	$('#modal-addprestation-addrecord').show();
	            	
	            	$('#modal-addprestation-fli_descriptif')	.val( $(this).find('td:eq(1)').text() );
	            	$('#modal-addprestation-fli_puttc')			.val( $(this).find('td:eq(2)').text() );
	            	$('#modal-addprestation-paramprestation')	.val( $(this).attr('id') );	
	            });
	            
	            $('#modal-addprestation-addrecord').on('click', function () {
	            	
	            	$('#modal-faddprestation').submit();
		        });
	            
	            $('#modal-majprestation-submit').on('click', function () {
	            	
	            	$('#modal-fmajprestation').submit();
		        });
	            
	            $('#modal-majprestation-suppr').on('click', function () {
	            	
//       	        	$('#modal-supprestation').modal( {backdrop: "static", keyboard: false} );
// attention ne pas supprimer le formulaire
	            	$('#modal-fsupprestation').submit();
		        });
      	        
// 	            $('#modal-supprestation-yes').on('click', function () {
	            	
// 	            	$('#modal-fsupprestation').submit();
// 		        });
		     
	            
				//********** acompte/règlements
				
	            $('#addacompte').on('click', function () {
	            	
	            	_saisie = Number($('#saisieacomptereg_montant').val());
	            	_ttc	= Number(_fac_totalttc) - Number(_fac_totalregle);	//solde
	            	
	            	if ( isNaN(_saisie) === false & _saisie > 0 ) {
	            		
	      	        	if ( _saisie > _ttc ) {
	      	        		
	            			bootbox.confirm('Règlement supérieur au solde ?',
	                			function(result) {
			                        if (result) {
			                           
// 						            	$('#fsaisieacompte').submit();
						            	$('#fsaisieacompte').formValidation('validate');
			                        }
			                        else{
					            		$('#saisieacomptereg_montant').val('');
			                        }
	        					});
	            		}
	      	        	else{
// 		      	        	$('#modal-validacompte').modal( {backdrop: "static", keyboard: false} );
// 			            	$('#fsaisieacompte').submit();
			            	$('#fsaisieacompte').formValidation('validate');
	      	        	}
	            	}
	            	else{
	            		bootbox.alert("Saisie montant incorrecte"); 
	            		$('#saisieacomptereg_montant').val('');
	            	}
		        });
		     
// 	            $('#modal-validacompte-yes').on('click', function () {
				
// 	            	$('#fsaisieacompte').submit();
// 		        });
	            
				//********** édition
				
	            $('#editfacture').on('click', function () {
	            	
	                bootbox.confirm(   "~{#mdleditfacture#}~",
                			function(result) {
		                        if (result) {
					            	$('#feditfacture').submit();
		                        }
        					}
					);
//       	        	$('#modal-editfacture').modal( {backdrop: "static", keyboard: false} );
		        });
		     
// 	            $('#modal-editfacture-yes').on('click', function () {
				
// 	            	$('#feditfacture').submit();
// 		        });
	            
	            $('#editallfactures').on('click', function () {
	            	
	                bootbox.confirm(   "~{#mdlallfactures#}~",
                			function(result) {
		                        if (result) {
					            	$('#feditallfactures').submit();
		                        }
        					}
					);
		        });
		     
				//********** mailing
				
	            $('#mailtoall').on('click', function () {

	          	  	$('#modal-contact-mail').val( $('#allmails').val() );
	          	  	$('#modal-contact-nom').html( 'Tous' );
	            	
      	        	$('#modal-contact').modal( {backdrop: "static", keyboard: false} );
		        });

		    });   //end of document.ready() 

    	</script>
    	

