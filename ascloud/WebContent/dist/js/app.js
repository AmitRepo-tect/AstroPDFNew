$(function(){
	$('.modal').modal();	
	$('select').material_select();
	$('select').not('.disabled').material_select();
});
  

  
  $(function() {
    "use strict";
    
// Notification, Profile & Settings Drop down
    $('.notification-button, .profile-button, .settings-button , .support-button').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrainWidth: false,
      hover: true,
      gutter: 0,
      belowOrigin: true,
      alignment: 'right',
      stopPropagation: false
    });   


 
    // Perfect Scrollbar    
    var leftnav = $(".page-topbar").height();
    var leftnavHeight = window.innerHeight - leftnav;
    if (!$('#slide-out.leftside-navigation').hasClass('native-scroll')) {
      $('.leftside-navigation').perfectScrollbar({
        suppressScrollX: true
      });
    }
    
// Detect touch screen and enable scrollbar if necessary
    function is_touch_device() {
      try {
        document.createEvent("TouchEvent");
        return true;
      } catch (e) {
        return false;
      }
    }
    
if (is_touch_device()) {
      $('#nav-mobile').css({
        overflow: 'auto'
      })
    }
  });
  
// For overlapping input
  var count = 0;
  var interval = setInterval(function () {
    count++;
    $('input:-webkit-autofill').siblings('label').addClass('active');
    if (count > 500) {
      clearInterval(interval);
    }
  }, 10);
  
  
  
// For equal height columns
  function eqHeightCol(eqhDiv){    	
  	var highestBox = 0;
      $(eqhDiv).each(function(){  
              if($(this).height() > highestBox){  
              highestBox = $(this).height();  
      }
  });
      $(eqhDiv).height(highestBox);
  }
  
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

  
  
  


 

             