$(function(){
	$('.modal').modal();	
	$('select').formSelect();
	$('select').not('.disabled').formSelect();
	
    $('.dropdown-trigger').dropdown({
        constrainWidth: false,       
        stopPropagation: false
      });
    
    
    $(".alert-close").click(function(){$(".alert").hide(500);});   
    setTimeout(function(){ $(".alert").hide(500); }, 6000);
    
if (is_touch_device()) {
      $('#nav-mobile').css({
        overflow: 'auto'
      })
    }
  });
  
//Detect touch screen and enable scrollbar if necessary
function is_touch_device() {
  try {
    document.createEvent("TouchEvent");
    return true;
  } catch (e) {
    return false;
  }
}
// For overlapping input
  var count = 0;
  var interval = setInterval(function () {
    count++;
    $('input:-webkit-autofill').siblings('label').addClass('active');
    if (count > 500) {
      clearInterval(interval);
    }
  }, 10);
  
  
  function openToast(getIds){    		
	  	$(getIds).animate({top: "0"});
	  	setTimeout(function() {$(getIds).animate({top: "-600px"});}, 5000);
	  }
  function closeToast(getIds){    		
	  	$(getIds).animate({top: "-600px"});
	  }
    
//Analytics
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-245702-1']);
  _gaq.push(['_setDomainName', 'astrosage.com']);
  _gaq.push(['_trackPageview']);

  (function () {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
 
  //Get click events
  function getEvents(tagvalue, tag) {    
	    _gaq.push(['_trackEvent', tagvalue, tag]);
	}

  
  
  


 

             