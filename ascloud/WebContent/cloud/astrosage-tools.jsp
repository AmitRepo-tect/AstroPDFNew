<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int atLangCode = Util.safeInt(session.getAttribute("languageCode"));
String chartType = request.getParameter("charttype");
if(chartType.equals("south"))
{
	session.setAttribute("chartType", 1);
}
else
{
	session.setAttribute("chartType", 0);
}
Local local = new Local();
Object obj = session.getAttribute("constants");
MyProperties constantsBundle = null;
if(obj != null)
{
	constantsBundle = (MyProperties) obj;
}
else
{
	constantsBundle = new MyProperties(local.loadPropertiesFile("constants", atLangCode));
	session.setAttribute("constants", constantsBundle);
}
MyResourceBundle astrosageConstans = local.loadPropertiesFileNew("astrosagetools", atLangCode);
%>

<link type="text/css" rel="stylesheet" href="css/toolbar.css" />
<script src="js/toolbar.js" type="text/javascript"></script>
<div
	class="astrosage-toolbar ui-toolbar-header ui-corner-bottom ui-helper-clearfix">
	<div class="astrosage-buttonset">
		<a href="session-destroy-for-newchart.jsp"
			class="astrosage-button ui-toolbar-default astrosage-button-icon-solo  ui-corner-left"
			title="<%=constantsBundle.getString("NEW_CHART") %>"><span
			class="ui-Licon ui-Licon-document"></span> <%=constantsBundle.getString("NEW_CHART") %></a>
		<a href="#" onclick="openChart('open');"
			class="astrosage-button ui-toolbar-default astrosage-button-icon-solo"
			title="<%=constantsBundle.getString("OPEN_CHART") %>"><span
			class="ui-Licon ui-Licon-folder-open"></span> Open</a> <a href="#"
			onclick="openprintdialog();"
			class="astrosage-button ui-toolbar-default astrosage-button-icon-solo"
			title="<%=constantsBundle.getString("PRINT") %>"><span
			class="ui-Licon ui-Licon-print"></span> Print</a> <a href="#"
			onclick=savechart();
			class="astrosage-button ui-toolbar-default astrosage-button-icon-solo ui-corner-right"
			title="<%=constantsBundle.getString("SAVCHART") %>"><span
			class="ui-Licon ui-Licon-disk"></span> Save</a>
	</div>
	<div class="astrosage-buttonset">
		<a href="editchart.asp"
			class="astrosage-button ui-toolbar-default astrosage-button-icon-solo ui-corner-left"
			title="<%=constantsBundle.getString("EDIT_CHART") %>"><span
			class="ui-Licon ui-Licon-pencil"></span> Edit</a> <a href="#"
			onclick="openChart('manage');"
			class="astrosage-button ui-toolbar-default astrosage-button-icon-solo ui-corner-right"
			title="<%=constantsBundle.getString("DELETE_CHART") %>"><span
			class="ui-Licon ui-Licon-trash"></span> Delete</a>
	</div>

	<div class="astrosage-buttonset">
		<a href="/"
			class="astrosage-button ui-toolbar-default astrosage-button-icon-solo  ui-corner-all"
			title="<%=constantsBundle.getString("HOME") %>"><span
			class="ui-Licon ui-Licon-home"></span> Home</a>
	</div>
	<div class="astrosage-buttonset"
		style="float: right; margin-right: 40px;">
		<a
			href="https://marriage.astrosage.com/?utm_source=onlinead&utm_medium=cloudtoolbarlink&utm_campaign=asmarriage"
			title="AstroSageMarriage.com: FREE matrimony-shadi"><img
			src="/images/report_icon/astrosage-marriage.png"
			style="background-color: #fff; padding: 1px;" width="27"
			alt="AstroSageMarriage.com: FREE matrimony-shadi"
			class="ui-corner-all" /></a> <a
			href="https://play.google.com/store/apps/details?id=com.ojassoft.astrosage"
			onclick="_gaq.push(['_trackEvent', 'download-astrosage-kundli', 'toolbar']);"
			title="<%=astrosageConstans.getString("DOWNLOAD_ASTROSAGE_KUNDLI_FREE") %>"><img
			src="/images/as-app-ico.png" width="27"
			alt="Download AstroSage Kundli FREE" class="ui-corner-all" /></a> <a
			href="http://www.youtube.com/user/AstroSageIndia?sub_confirmation=1"
			onclick="_gaq.push(['_trackEvent', 'subscribe-youtube', 'toolbar']);"
			title="<%=astrosageConstans.getString("SUBSCRIBE_NOW_FREE") %>"><img
			src="/images/youtube.png" width="28" alt="Astrology on Youtube"
			class="ui-corner-all" /></a>
	</div>
</div>