
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        
		    $(document).ready(function() {
		    	
		        $('#data-sejours').DataTable(	{
		        	"responsive": true,
		        	columnDefs: [
		        	               { type: 'date-uk', targets: [1 ] },
		        	               { width: "10%", targets: [0 ] }
		        	            ],
	                "pagingType": "full",
	                "pageLength": 10,
	                "order"		: [ [1, 'desc'] ],
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
	            $('.table').children('tbody').on( 'click', 'tr', function () {

                    $(this).addClass('selected');
	            	$('#paramkey').val($(this).attr('id'));	
   	                $('#paramname').val( $(this).find('td:eq(0)').text() );	
   	                $('form').submit();
	            	
	            });

		        
	            $('#addrecord').on('click', function () {
	            	
		        	$('#paramkey').val("new");	//création
	            	$('form').submit();
		        });
		        
	        });   //end of document.ready() 

    	</script>
    	
