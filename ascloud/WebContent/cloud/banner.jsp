<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<script type="text/javascript">
    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-245702-1']);
    _gaq.push(['_setDomainName', 'astrosage.com']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

(function() {
var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
po.src = 'https://apis.google.com/js/plusone.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) return;
js = d.createElement(s); js.id = id;
js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=152062858243160";
fjs.parentNode.insertBefore(js, fjs);
} (document, 'script', 'facebook-jssdk'));
</script>

<div class="header">
	<div class="headcol1">
		<a href="http://www.astrosage.com/"> <img
			src="images/kundali.astrosage-logo.png" border="0" height="80"></a>
	</div>
	<div class="headcol2">
		<div class="likebutton">
			<div class="FB-likebutton">
				<g:plusone size="tall" href="http://www.astrosage.com"></g:plusone>
			</div>
			<div class="Google-likebutton">
				<div id="fb-root"></div>
				<div class="fb-like"
					data-href="https://www.facebook.com/astrology.horoscope"
					data-send="false" data-layout="box_count" data-show-faces="false">
				</div>
			</div>
			<%if(application.getAttribute("appMessage")!= null && !application.getAttribute("appMessage").equals("")){%>
			<div align="left" class="notice1">
				<%=application.getAttribute("appMessage") %></div>
			<%}%>
		</div>
	</div>
	<div align="center" class="headcol3">
		<IMG SRC="images/freekundli-punchline.png" WIDTH=150 HEIGHT=47
			ALT="free kundli, astrological birth charts and moon signs horoscope">
	</div>
	<div align="right" class="headcol4" style="margin-top: 5px;">
		<%/* uncomment when useragent.asp convert in jsp*/ %>
		<%//@include file = "function/useragent.asp"%>
		<%//if (IsMobileUseContasty()) { %>
		<%//@include file = "/ads/contasty-ad-468-60.asp"%>
		<%//} else{ %>
		<%if(Util.safeInt(session.getAttribute("languageCode"))==1){%>
		<%@include file="/ads/ad-468-60-hin.jsp"%>
		<% }else {%>
		<%@include file="/ads/ad-468-60.jsp"%>
		<%} 
   	//}
   	%>
   	
	</div>
</div>
