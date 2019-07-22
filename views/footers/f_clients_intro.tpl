

   <script type="text/javascript">

//        $('#introvalue').autocomplete({
//     	    serviceUrl: "~{$smarty.const.__CONTROLLERS_AJAX__}~x_clients.php",
//     	    minChars: 2,
//     	    onSelect: function (suggestion) {
//     	        alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
//     	    }
//     	});

			    var _url = "~{$smarty.const.__CONTROLLERS_AJAX__}~x_clients.php?prenom=false&ville=false&cp=false";
			    
			    
			    $('#sk-prenom').on('change', function() {
			    	
			    	_reg = new RegExp("prenom=false|prenom=true", "g");
			    	_url = _url.replace(_reg, 'prenom='+$(this).is(":checked"));
			    	$('#listclient-introvalue').autocomplete().setOptions({ serviceUrl: _url });
			    });
			    $('#sk-ville').on('change', function() {
			    	
			    	_reg = new RegExp("ville=false|ville=true", "g");
			    	_url = _url.replace(_reg, 'ville='+$(this).is(":checked"));
			    	$('#listclient-introvalue').autocomplete().setOptions({ serviceUrl: _url });
			    });
			    $('#sk-cp').on('change', function() {
			    	
			    	_reg = new RegExp("cp=false|cp=true", "g");
			    	_url = _url.replace(_reg, 'cp='+$(this).is(":checked"));
			    	$('#listclient-introvalue').autocomplete().setOptions({ serviceUrl: _url });
			    });
			    
			    $('#listclient-introvalue').keyup(function(key) {
			    
			    	if ( key.which == 13 ) {
			    	
			    		$('#listclient-paramclient').val('$13');
			    		$('#flistclient').submit();
			    	}
			    });
			    
		        $('#listclient-introvalue').autocomplete({
		        
		    	    serviceUrl: _url,
		    	    minChars: 2,
		    	    showNoSuggestionNotice: true,
		    	    noSuggestionNotice : 'Aucun résultat',
	    			onInvalidateSelection: function (){
	    			        $('#listclient-introvalue').val('');
	    			    },
		    	    onSelect: function (suggestion) {
		
			            	$('#listclient-paramclient').val( suggestion.data );	
			            	$('#flistclient').submit();
		    	    	}
		    	});
		    	
   </script>
    	
