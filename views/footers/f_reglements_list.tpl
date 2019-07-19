
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        
		    $(document).ready(function() {
		    	
		        $('#data-reglements').DataTable(	{
		        	"responsive": true,
		        	columnDefs: [
		        	               { type: 'date-uk', targets: [0, 5 ] },
		        	               { width: "10%", targets: [1 ] }
		        	            ],
	                "pagingType": "full",
	                "pageLength": 10,
	                "order"		: [ [0, 'desc'] ],
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
	            $('.table').children('tbody').on( 'click', 'tr', function () {

                    $(this).addClass('selected');
	            	$('#paramkey').val($(this).attr('id'));	
   	                $('#paramname').val( 'N°'+$(this).find('td:eq(1)').text() );	
   	                $('form').submit();
	            	
	            });
		        
	        });   //end of document.ready() 

    	</script>
    	
