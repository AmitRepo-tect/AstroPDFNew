<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String charttypeToolbar = Util.safestr(request.getParameter("charttype"));
if(charttypeToolbar.equals("south")){
	session.setAttribute("chartType",1);
}
else if(charttypeToolbar.equals("north")){
	session.setAttribute("chartType",0);
}
else
	{
		Object orgCh = session.getAttribute("chartType");
		
		if(orgCh == null || orgCh.equals("") && charttypeToolbar.equals(""))
		{
			session.setAttribute("chartType",0);
		}
	}
Local aslocal = new Local();
Object objas = session.getAttribute("constants");
MyProperties toolbarConstant = null;
if(objas != null)
{
	toolbarConstant = (MyProperties) objas;
}
else
{
	toolbarConstant = new MyProperties(aslocal.loadPropertiesFile("constants", Util.safeInt(session.getAttribute("languageCode"))));
	session.setAttribute("constants", toolbarConstant);
}
 Object urlTB = request.getAttribute("javax.servlet.forward.request_uri");
 
if(urlTB == null)
{
	
	urlTB = request.getRequestURL();
}
String requestUrlTB = urlTB.toString() ; 
String queryStr = ""; 
String methodNameStr = request.getParameter("methodName");
if(methodNameStr != null && !methodNameStr.equals(""))
{
	queryStr = "&methodName="+methodNameStr;
}
 %>
<link type="text/css" rel="stylesheet" href="/cloud/css/toolbar.css" />
<div class="ui-toolbar">
	<div class="ui-toolbar-btnset">
		<div class="ui-toolbarbtn-group">
			<a href="/" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("HOME") %>"><i
				class="glyphicon glyphicon-home"></i></a>
		</div>
		<div class="ui-toolbarbtn-group">
			<a href="session-destroy-for-newchart.asp?methodName=newChart" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("NEW_CHART") %>"><i
				class="glyphicon glyphicon-file"></i></a> <a href="#"
				onclick="openChart('open');" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("OPEN_CHART") %>"><i
				class="glyphicon glyphicon-folder-open"></i> </a> <a href="#"
				onclick="openprintdialog();" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("PRINT") %>"><i
				class="glyphicon glyphicon-print"></i> </a> <a href="#"
				onclick="savechart();" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("SAVCHART") %>"><i
				class="glyphicon glyphicon-floppy-save"></i> </a>
		</div>
		<div class="ui-toolbarbtn-group">
			<a href="editchart.asp" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("EDIT_CHART") %>"><i
				class="glyphicon glyphicon-edit"></i> </a> <a href="#"
				onclick="openChart('manage');" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("DELETE_CHART") %>"><i
				class="glyphicon glyphicon-trash"></i> </a>
		</div>
		<div class="ui-toolbarbtn-group">
			<a href="#" onclick="openfeedbackform();" class="ui-toolbtn"
				title="<%=toolbarConstant.getString("FEEDBACK") %>"><b><%=toolbarConstant.getString("FEEDBACK") %></b></a>

			<a
				href="<%=requestUrlTB + "?LanguageType=english"+queryStr %>"
				class="ui-toolbtn" title=<%=toolbarConstant.getString("ENGLISH") %>><b>English</b></a>
			<% 
       	 //String value = toolbarConstant.getString("HINDI_TOOL");
         //String value1 =  new String(value.getBytes("ISO-8859-1"), "UTF-8"); %>
			<a
				href="<%=requestUrlTB + "?LanguageType=hindi"+queryStr %>"
				class="ui-toolbtn"
				title=<%=toolbarConstant.getString("HINDI_TOOL") %>><b><%=toolbarConstant.getString("HINDI_TOOL") %></b></a>
			<a
				href="<%=requestUrlTB + "?LanguageType=tamil"+queryStr %>"
				class="ui-toolbtn" title="Language Tamil"><b>தமிழ்</b></a> <a
				href="<%=requestUrlTB + "?LanguageType=telugu"+queryStr %>"
				class="ui-toolbtn" title="Language Telugu"><b>తెలుగు (<font
					style="text-shadow: none; color: #c03004">Beta</font>)
			</b></a>
			<a
				href="<%=requestUrlTB + "?LanguageType=bengali"+queryStr %>"
				class="ui-toolbtn" title="Language Bengali"><b>বাংলা (<font
					style="text-shadow: none; color: #c03004">Beta</font>)
			</b></a>
			<a
				href="<%=requestUrlTB + "?LanguageType=gujarati"+queryStr %>"
				class="ui-toolbtn" title="Language Gujarati"><b>ગુજરાતી (<font
					style="text-shadow: none; color: #c03004">Beta</font>)
			</b></a>
			<a
				href="<%=requestUrlTB + "?LanguageType=kannada"+queryStr %>"
				class="ui-toolbtn" title="Language Kannada"><b>ಕನ್ನಡ (<font
					style="text-shadow: none; color: #c03004">Beta</font>)
			</b></a>
			<a
				href="<%=requestUrlTB + "?LanguageType=malayalam"+queryStr %>"
				class="ui-toolbtn" title="Language Malayalam"><b>മലയാളം (<font
					style="text-shadow: none; color: #c03004">Beta</font>)
			</b></a>
			<a
				href="<%=requestUrlTB + "?LanguageType=marathi"+queryStr %>"
				class="ui-toolbtn" title="Language Marathi"><b>मराठी (<font
					style="text-shadow: none; color: #c03004">Beta</font>)
			</b></a>
			 <a href="/cloud/worksheet/" class="ui-toolbtn"
				style="text-shadow: none; color: #c03004"><b><%=toolbarConstant.getString("WORK_SHEET_AS") %></b></a>

		</div>
	</div>
	<div class="ui-toolbarbtn-icon pull-right">
		<a
			href="https://marriage.astrosage.com/?utm_source=onlinead&utm_medium=cloudtoolbarlink&utm_campaign=asmarriage"
			title="AstroSageMarriage.com: FREE matrimony-shadi"
			class="ui-toolbtn"><span class="socialicon socialicon-asm"></span></a>
		<a
			href="https://play.google.com/store/apps/details?id=com.ojassoft.astrosage"
			onclick="_gaq.push(['_trackEvent', 'download-astrosage-kundli', 'toolbar']);"
			title="Download AstroSage Kundli FREE" class="ui-toolbtn"><span
			class="socialicon socialicon-andrapp"></span></a> <a
			href="http://www.youtube.com/user/AstroSageIndia?sub_confirmation=1"
			onclick="_gaq.push(['_trackEvent', 'subscribe-youtube', 'toolbar']);"
			title="Subscribe Now FREE" class="ui-toolbtn"><span
			class="socialicon socialicon-yt"></span></a>
	</div>
</div>