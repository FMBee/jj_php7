
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">

		    $(document).ready(function() {
		    	
		        $('#data-clients').DataTable(	{
		        	"responsive": true,
		        	"search": {
		        			    "search": "~{$introvalue}~"
		        			  },
	                "pagingType": "full",
	                "pageLength": 10,
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
				
				~{if !empty($introvalue)}~
				
					 $('#data-clients_filter label input').css('background-color', 'orange');
					 
				~{/if}~
		        
		        $('#data-clients_filter label input').keyup( function () {
					
					$(this).css('background-color', ($(this).val().trim() == '' ? 'white' : 'orange' ));
		        } );
		        
	            $('.table').children('tbody').on( 'click', 'tr', function () {

                    $(this).addClass('selected');
	            	$('#paramkey').val($(this).attr('id'));	
   	                $('#paramname').val( $(this).find('td:eq(0)').text() +' '+ $(this).find('td:eq(1)').text() );	//prenom+nom
   	                $('form').submit();
	            	
	            });

		        
	            $('#addrecord').on('click', function () {
	            	
		        	$('#paramkey').val("new");	//création
	            	$('form').submit();
		        });
		        
	        });   //end of document.ready() 

    	</script>
    	
