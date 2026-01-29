<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%><%

int notiLang = Util.safeInt(session.getAttribute("languageCode"));
String oldvertext = "";
if(notiLang==1){
	 oldvertext= "पुराना एस्ट्रोसेज क्लाउड";
}else{
	oldvertext= "old astrosage Cloud";
}
%>
<script type="text/javascript">


        $(function () {
            $(".oldver-ticker").hide();
            if (!getCookiesAppTicker()) {
                $(".oldver-ticker").show();
                $("ul.side-nav.leftside-navigation").css("top", "112px");
                $(".oldver-ticker-close").click(function () {
                    $(".oldver-ticker").hide(300);
                    $("ul.side-nav.leftside-navigation").css("top", "64px");
                    setCookiesAppTicker();                    

                });
            }            
        });


    function oldverRedirectTicker(tagvalue, tag) {
        _gaq.push(['_trackEvent', tagvalue, tag]);
        setCookiesAppTicker();
    }
    function setCookiesAppTicker() {
        document.cookie = "oldver-ticker-cloud=1";
    }
    function getCookiesAppTicker() {
        flag = 0;
        findcookies = "oldver-ticker-cloud=1";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            if (c.indexOf(findcookies) != -1) {
                flag = 1;
                break;
            }
        }
        if (flag == 1) {
            return true;
        }
        else {
            return false;
        }
    }   
    
  
</script>



<div class="oldver-ticker navbar-fixed" style=" display:none;">
 <nav>
 <div align="center" class="notification-txt">		
		<a href="/cloud/redirecttocloud.jsp?languagecode=<%=notiLang%>" onclick="oldverRedirectTicker('click-oldver-ticker-cloud', 'oldver-redirect');" class="btn white black-text"><%=oldvertext %></a>		
		<a href="javascript:void(0);" class="oldver-ticker-close" onclick="oldverRedirectTicker('cancel-oldver-ticker-cloud', 'oldver-redirect');"><i class="material-icons md-24">&#xE5CD;</i></a>
</div>
</nav>
</div>