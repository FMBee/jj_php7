
~{config_load file = 'g_global.cfg' section = $smarty.session.__user_lang__}~

       <script type="text/javascript">
        
		    $(document).ready(function() {
		    	
		        $('#data-users').DataTable(	{
		        	"responsive": true,
		        	"pagingType": "full",
	                "pageLength": 10,
	                "columnDefs": [
	                                 { "visible": false, "targets": [ 3, 4, 5 ] } //dates
	                                ],
	                ~{include file="p_datatable_language.inc.tpl"}~
				});
	
	            $('.table').children('tbody').on( 'click', 'tr', function () {

                    $(this).addClass('selected');
	            	$('#key').val($(this).attr('id'));	//on prend le user_id
   	                $('#username').val( $(this).find('td:eq(1)').text() +' '+ $(this).find('td:eq(0)').text() );	//prenom+nom
   	                $('form').submit();
	            	
	            });

		        
	            $('#addUser').on('click', function () {
	            	
		        	$('#key').val("new");	//création
	            	$('form').submit();
		        });
		        
	            var oTable = $('#data-users').dataTable();
				oTable.fnFilter( 'IN', 5 );		//utilisateurs non sortis
// 				oTable
// 				    .column( 5 )
// 				    .data()
// 				    .filter( function ( value, index ) {
// 				        return value === 'IN' ? true : false;
// 				    	} )

	            $('#affTous').on('change', function() {
	            	
	            	oTable.fnSetColumnVis( 3, $(this).is(":checked") );
	            	oTable.fnSetColumnVis( 4, $(this).is(":checked") );
					oTable.fnFilter( ($(this).is(":checked") ? '' : 'IN'), 5 );
// 	            	oTable.columns([4, 5]).visible($(this).is(":checked"));
		        });
		        	
	        });   //end of document.ready() 

    	</script>
    	
