
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        
		    $(document).ready(function() {
		    	
		        $('#data-stats').DataTable(	{
		        	"responsive": true,
		        	"paging" : false,
	                "ordering": false,
	                ~{include file="p_datatable_language.inc.tpl"}~
				});

	            	
// OK	            $('.table').children('tbody').on( 'click', 'tr', function () {
// OK 	            $('.table tbody').children('tr').on( 'click', 'td:eq(1)', function () {
// KO	            $('.table tbody tr').children('td:eq(1)').click( function () {

 	            $('.table tbody').children('tr').on( 'click', 'td:eq(1)', function () {

 	            	$(this).addClass('selected');
					var _ligne = $(this).parent();
					
	            	$('#paramkey').val($(_ligne).attr('id'));	
   	                $('#paramname').val( 	'N°'+$(_ligne).find('td:eq(0)').text() 
   	                						+' du '+$(_ligne).find('td:eq(2)').text() 
   	                						+' au '+$(_ligne).find('td:eq(3)').text() 
   	                						+' - '+ $(_ligne).find('td:eq(1)').text() );	
   	                $('form').submit();
	            	
	            });

	        });   //end of document.ready() 

    	</script>
    	
