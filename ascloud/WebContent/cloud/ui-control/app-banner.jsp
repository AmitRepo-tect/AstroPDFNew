<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">

var isMobileJS = { Android: function () { return navigator.userAgent.match(/Android/i) }, BlackBerry: function () { return navigator.userAgent.match(/BlackBerry/i) }, iOS: function () { return navigator.userAgent.match(/iPhone|iPad|iPod/i) }, Opera: function () { return navigator.userAgent.match(/Opera Mini/i) }, Windows: function () { return navigator.userAgent.match(/IEMobile/i) }, any: function () { return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows()) } };

    if (isMobileJS.Android()) {
        $(function () {
            $(".app-ticker").hide();
            if (!getCookiesAppTicker()) {
                $(".app-ticker").show();
                $(".app-ticker-close").click(function () {
                    $(".app-ticker").hide(300);
                    setCookiesAppTicker();                    

                });
            }            
        });
    }

    function appDownloadTicker(tagvalue, tag) {
        _gaq.push(['_trackEvent', tagvalue, tag]);
        setCookiesAppTicker();
    }
    function setCookiesAppTicker() {
        document.cookie = "app-ticker-cloud=1";
    }
    function getCookiesAppTicker() {
        flag = 0;
        findcookies = "app-ticker-cloud=1";
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
<div class="app-ticker navbar-fixed" style=" display:none;">
 <nav>
	<a href="javascript:void(0);" class="app-ticker-close" onclick="appDownloadTicker('cancel-app-ticker-cloud', 'download-app');"><i class="material-icons md-24">&#xE5CD;</i></a>
	<span class="txt16">AstroSage Kundli App</span> 
	<a href="https://play.google.com/store/apps/details?id=com.ojassoft.astrosage&referrer=utm_source%3DCloudTicker%26utm_medium%3DAstroSage%26utm_campaign%3DDownloadApp" rel="nofollow" onclick="appDownloadTicker('download-app-ticker-cloud', 'download-app');" class="btn white black-text right">Download Now</a>
</nav>
</div>