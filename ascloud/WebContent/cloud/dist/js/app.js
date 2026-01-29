$(function(){
	$('.modal').modal();	
	$('select').material_select();
	$('select').not('.disabled').material_select();
});
  

  
  $(function() {
    "use strict";
   
// Common, Translation & Horizontal Drop down
    $('.dropdown-button, .translation-button, .dropdown-menu').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrainWidth: false,
      hover: false,
      gutter: 0,
      belowOrigin: false,
      alignment: 'right',
      stopPropagation: true
    });    
// Notification, Profile & Settings Drop down
    $('.notification-button, .profile-button, .dropdown-settings').dropdown({
      inDuration: 300,
      outDuration: 225,
      constrainWidth: false,
      hover: true,
      gutter: 0,
      belowOrigin: true,
      alignment: 'right',
      stopPropagation: false
    });   

//Main Left Side bar Menu    
   if (is_touch_device()) {
        $('.sidebar-collapse').sideNav({
          menuWidth: 280,
          edge: 'left',
          closeOnClick:true,
          menuOut: false
        });
      $(".sidebar-collapse i.material-icons").html("menu");    
    }    
  else{
    $(".sidebar-collapse").click(function(){   
        if ( $('.side-nav').hasClass("active")){        
            $('.side-nav').removeClass("active");
            $('.side-nav').addClass("inactive");
            $('#main').css({"padding-left":"0px"}, 'slow');
            $('footer').css({"padding-left":"0px"}, 'slow');
            $(".sidebar-collapse i.material-icons").html("menu");
            $(".brand-logo").hide(500);
            $(".icon-formate").animate({"margin-left":"20px"}, 500);
            
        }
        else{
        	$('.side-nav').removeClass("inactive");
        	$('.side-nav').addClass("active");
        	$('#main').css({"padding-left":"280px"}, 'slow');
        	$('footer').css({"padding-left":"280px"}, 'slow');
        	$(".sidebar-collapse i.material-icons").html("close");
        	$(".brand-logo").show(500);
        	$(".icon-formate").animate({"margin-left":"280px"}, 500);
        }
    });
    }
 
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
  
  $(document).ready(function(){
	  $(".modules").click(function(){
	    $(".open-divs").slideToggle();
	  });
	});

  
  
//This is for slient feature read more button Jquery //

  function AddReadMore() {
      //This limit you can set after how much characters you want to show Read More.
      var carLmt = 160;
      // Text to show when text is collapsed
      var readMoreTxt = " ... Read More";
      // Text to show when text is expanded
      var readLessTxt = " Read Less";


      //Traverse all selectors with this class and manupulate HTML part to show Read More
      $(".addReadMore").each(function () {
          if ($(this).find(".firstSec").length)
              return;

          var allstr = $(this).text();
          if (allstr.length > carLmt) {
              var firstSet = allstr.substring(0, carLmt);
              var secdHalf = allstr.substring(carLmt, allstr.length);
              var strtoadd = firstSet + "<span class='SecSec'>" + secdHalf + "</span><span class='readMore'  title='Click to Show More'>" + readMoreTxt + "</span><span class='readLess' title='Click to Show Less'>" + readLessTxt + "</span>";
              $(this).html(strtoadd);
          }

      });
      //Read More and Read Less Click Event binding
     
  }


  // Here's End slient feature read more button Jquery //
  
  
  
  function showLessMoreText() {
	    // Configure/customize these variables.
	    var showChar = 194;  // How many characters are shown by default
	    var ellipsestext = "...";
	    var moretext = "Read More >";
	    var lesstext = "Read less";  

	    $('.as-ul').each(function() {
	        var content = $(this).html();	 
	        if(content.length > showChar) {	 
	            var c = content.substr(0, showChar);
	            var h = content.substr(showChar, content.length - showChar);	 
	            var html = c + '<span class="moreellipses">' + ellipsestext+ '</span><span class="morecontent"><span>' + h + '</span>&nbsp;<a href="" class="read-more-link">' + moretext + '</a></span>';
	 	            $(this).html(html);
	        }
	 
	    });
	 
	    $(".read-more-link").click(function(){
	        if($(this).hasClass("less")) {
	            $(this).removeClass("less");
	            $(this).html(moretext);
	        } else {
	            $(this).addClass("less");
	            $(this).html(lesstext);
	        }
	        $(this).parent().prev().toggle();
	        $(this).prev().toggle();
	        return false;
	    });
	}


  


 

             