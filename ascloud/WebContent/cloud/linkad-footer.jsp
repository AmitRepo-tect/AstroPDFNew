<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String strFooter = "";
Object strFooterObj = request.getAttribute("includeFile");
if(strFooterObj != null)
{
	strFooter = strFooterObj.toString();
}
if(application.getAttribute("IsShowAdOnLocal")=="" || application.getAttribute("IsShowAdOnLocal")==null){  %>
<% if(!(strFooter.indexOf("signup.asp")>0 || (strFooter.indexOf("edituserprofile.asp")>0 || strFooter.indexOf("activation-page.asp")>0))){%>
<div align="center" id="adResize" class="adresize">
	<script type="text/javascript">
            <!--
              google_ad_client = "ca-pub-7494543079410386";
              /* footer fourth leaderboard */
              google_ad_slot = "3035147222";
              google_ad_width = 728;
              google_ad_height = 90;
              google_ad_region = "as";
        //-->
          </script>
	<script type="text/javascript"
		src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
          </script>
</div>
<%} %>
<% } %>