<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Local matchCatLocal = new Local();
	
	int matchCatLang= Util.safeInt(session.getAttribute("languageCode"));
	

	Object objmatchCat = session.getAttribute("constants");
	MyProperties matchCatConstants = null;
	if(objmatchCat != null)
	{
		matchCatConstants = (MyProperties) objmatchCat;
	}
	else
	{
		matchCatConstants = new MyProperties(matchCatLocal.loadPropertiesFile("constants", matchCatLang));
		session.setAttribute("constants", matchCatConstants);
	}
	
	
	MyResourceBundle mathCatMenu = matchCatLocal.loadPropertiesFileNew("filemenu", matchCatLang);
%>

<div class="card hdg-lg">
	<h1><%=matchCatConstants.getString("MATCH_YOUR_HOROSCOPE")%></h1>

</div>

<div class="row mrt-30">
	<div class="col l12">
		<div class="card">
			<ul class="ui-kp">
	            <li><a class="truncate" href="matchmaking.asp?sapien1"> <%=mathCatMenu.getString("ENTER_GIRLS_BOYS_BIRTH_DETAIL") %></a></li>
				<li><a class="truncate" href="matchmaking.asp?activeone1"> <%=matchCatConstants.getString("MATCH_WITH_SAVED_CHART") %></a></li>
				<li><a class="truncate" href="matchmaking.asp?vestibulum1"> <%=mathCatMenu.getString("MATCH_WITH_SHARED_CHART") %></a></li>
	                           </ul>
		</div>
	</div>
</div>
