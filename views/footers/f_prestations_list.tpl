
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        
		    $(document).ready(function() {
		    	
		        $('#data-prestations').DataTable(	{
		        	"responsive": true,
		        	"pagingType": "full",
	                "pageLength": 25,
	                "order"		: [ [0, 'asc'], [1, 'asc'] ],
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
	            $('.table').children('tbody').on( 'click', 'tr', function () {

                    $(this).addClass('selected');
	            	$('#paramkey').val($(this).attr('id'));	
   	                $('#paramname').val( $(this).find('td:eq(1)').text() );	
   	                $('form').submit();
	            	
	            });

		        
	            $('#addrecord').on('click', function () {
	            	
		        	$('#paramkey').val("new");	//création
	            	$('form').submit();
		        });
		        
	        });   //end of document.ready() 

    	</script>
    	
