var countloop = 0; 
var arr=["/cloud/new_birth-details.jsp","/cloud/new_planetposition.jsp","/cloud/new_download-kundli.jsp"];

$(window).scroll(function(){   
	if  ($(window).scrollTop() == $(document).height() - $(window).height()){    	
    	if(countloop<arr.length){	
    		loadOtherPage(arr[countloop]);
    	}    	
    }	
});

function loadOtherPage(arrVal){   
	$('#loadpage').html('<div class="progress"><div class="indeterminate"></div></div>');
	$.ajax({
        cache: false,
        url: arrVal,
        async : true,        
        success: function(html){        	
        	$('#loadpage').html('');
        	$('#main-content').append(html);
        	countloop++;
        }        
    });
} 
