<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script type="text/javascript">
  function createCookie(name, value, days) {
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            var expires = "; expires=" + date.toGMTString();           
        }
        else var expires = "";
        document.cookie = name + "=" + value + expires + "; path=/";
    }

    function readCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }

    var getNotification = readCookie('notification');

    $(function () {
        $(".notification-box").hide();
        if (!getNotification) {
            $(".notification-box").show();
            $(".notification-box-remove").click(function () {                
                $(".notification-box").hide(300);
                createCookie('notification', 'no', 30);
                $("#astrosage-tools").animate({ "top": "-40px" });
                $("#headbanner").animate({ "top": "-40px" });                          
            });
        }
        if (!$('.notification-box').is(':visible')) {
            $("#notimsg").css("padding-top", "60px");
            $("#astrosage-tools").css("padding-top", "60px");
        }
        else {
            $("#notimsg").css("padding-top", "100px");
            $("#astrosage-tools").css("padding-top", "100px");
        }
    });

</script>
<div class="notification-box">
	<div align="center" class="notification-txt">
		<% if(session.getAttribute("languageCode") == "1"){ %>
		<style>
.notification-txt {
	padding-top: 0px;
}
</style>
		एस्ट्रोसेज में नया: कुण्‍डली आधारित आज का भविष्यफल अब हिन्‍दी और तमिल
		में भी, अस्‍त और ग्रहण की त्रुटि ठीक। <a
			href="blog.asp?LanguageType=hindi">और जाने</a>
		<% }else if(session.getAttribute("languageCode") == "2"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=tamil">Learn More</a>
		<%} else if(session.getAttribute("languageCode") == "4"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=kannada">Learn More</a>
		<%} else if(session.getAttribute("languageCode") == "5"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=telugu">Learn More</a>
		<% }else if(session.getAttribute("languageCode") == "6"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=bengali">Learn More</a>
		<% }else if(session.getAttribute("languageCode") == "7"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=gujarati">Learn More</a>
		<% }else if(session.getAttribute("languageCode") == "8"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=malayalam">Learn More</a>
		<% }else if(session.getAttribute("languageCode") == "9"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=marathi">Learn More</a>
		<%} else if(session.getAttribute("languageCode") == "10"){ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=urdu">Learn More</a>
		<%} else{ %>
		New in AstroSage: Now Personalized Daily Horoscope in Hindi & Tamil,
		junk characters and combust bug fixed. <a
			href="blog.asp?LanguageType=english">Learn More</a>
		<% } %>
	</div>

	<a href="javascript:void(0);"
		class="pull-right notification-box-remove"><i
		class="glyphicon glyphicon-remove"></i></a>
</div>