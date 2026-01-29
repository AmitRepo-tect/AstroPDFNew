<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>

<%

Local prmTkrLocal = new Local();
int prmTkrLang = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle prmTkrContent = prmTkrLocal.loadPropertiesFileNew("prm-ticker",prmTkrLang);
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


    function prmTicker(tagvalue, tag) {
        _gaq.push(['_trackEvent', tagvalue, tag]);
        //setCookiesAppTicker();
    }
    function setCookiesAppTicker() {
        document.cookie = "prm-ticker-cloud=1";
    }
    function getCookiesAppTicker() {
        flag = 0;
        findcookies = "prm-ticker-cloud=1";
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
<%=prmTkrContent.getString("PRM_NEW_FEATURE")%> -  
		<a href="/cloud/numerology-report.asp" onclick="prmTicker('click-prm-ticker-cloud', 'ticker');" class="btn white black-text"><%=prmTkrContent.getString("PRM_NUMEROLOGY_REPORT")%></a>		
		<a href="javascript:void(0);" class="oldver-ticker-close" onclick="prmTicker('cancel-prm-ticker-cloud', 'ticker');"><i class="material-icons md-24">&#xE5CD;</i></a>
</div>
</nav>
</div>