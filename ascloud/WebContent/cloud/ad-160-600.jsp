<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String strstr = "";
Object strObj = request.getAttribute("includeFile");
if(strObj != null)
{
	strstr = strObj.toString();
}
if(application.getAttribute("IsShowAdOnLocal")=="" || application.getAttribute("IsShowAdOnLocal")==null){  %>
<% if(!(strstr.indexOf("signup.asp")>0 || (strstr.indexOf("edituserprofile.asp")>0 || strstr.indexOf("activation-page.asp")>0))){%>
<script type="text/javascript"><!--
            google_ad_client = "ca-pub-7494543079410386";
            /* AstroSage Wide Hang */
            google_ad_slot = "7051982635";
            google_ad_width = 160;
            google_ad_height = 600;
        //-->
        </script>
<script type="text/javascript"
	src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
<% } %>
<% } %>