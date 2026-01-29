<footer class="footer">
 <div class="footer-copyright">
            <div class="container">
            <div class="row no-margin-b">
            <div class="col s6">            
            © 2020 Copyright AstroSage.com
            </div>
            
              <div class="col s6 right-align">
            	<a class="black-text" href="https://www.astrosage.com/about-us.asp"><u>About</u></a> | 
            	<a class="black-text" href="https://www.astrosage.com/terms-conditions.asp"><u>Terms of Use</u></a> | 
              	<a class="black-text" href="https://www.astrosage.com/contactUs.asp"><u>Contact</u></a>
              </div>
            </div>
            </div>
</div>
          
	
</footer>
<script>
	
	function getPage(id) {
		
		$('#contentView').html('<img src="/images/ajax-loader.gif" />');
		$.ajax({
			url: "/dhruv/"+id+".jsp",
			data:'id='+id,
			type: "POST",
			success:function(data){$('#contentView').html(data);}
		});
		
	}
	$(document).ready(function () { 
	
		$('#prshn').click(function(e) {findlocation('CurrentTime');});
		
		var path = window.location.href; // because the 'href' property of the DOM element is the absolute path
		
		$('.side-nav a').each(function() {			 
		 if (this.href === path) {
		   $(this).addClass('active');
		  }		
		 });
	    
	});
	
	  $(function() {
	//Main Left Side bar Menu    
	   if (is_touch_device()) {
	        $('.main-slide-menu').sidenav();
	        $('.main-slide-menu').addClass("sidenav");
	      //$(".sidebar-collapse i.material-icons").html("menu");    
	    }
	
	   /*  $(".brmenu").click(function(){	      
	            $('.main-slide-menu').addClass("d-block");	        
	    });	   */ 
	  });
	// Detect touch screen and enable scrollbar if necessary
	    function is_touch_device() {
	      try {
	        document.createEvent("TouchEvent");
	        return true;
	      } catch (e) {
	        return false;
	      }
	    }
	</script>
