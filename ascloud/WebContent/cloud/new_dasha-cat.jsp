<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Local dashCatLocal = new Local();
	
	int dashCatLang= Util.safeInt(session.getAttribute("languageCode"));
	

	Object objdashCat = session.getAttribute("constants");
	MyProperties dashCatConstants = null;
	if(objdashCat != null)
	{
		dashCatConstants = (MyProperties) objdashCat;
	}
	else
	{
		dashCatConstants = new MyProperties(dashCatLocal.loadPropertiesFile("constants", dashCatLang));
		session.setAttribute("constants", dashCatConstants);
	}
	
%>


<div class="card hdg-lg">
	<h1><%=dashCatConstants.getString("DASHA")%></h1>

</div>

<div class="row mrt-30">
	<div class="col s12 l12">
		<div class="card">
			<ul class="ui-kp">
	            <li><a class="truncate" href="vimshottaridasha.asp"> <%=dashCatConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
				<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_dasa_low']);" href="j_dasa.asp" title="Low Print Quality/ Fast Download"> <%=dashCatConstants.getString("PRINT_VIMSHOTTARI_DASA")%> - Low</a></li>
				<li><a class="truncate" href="charantardasha1.asp"> <%=dashCatConstants.getString("CHAR_DASHA")%></a></li>
				<li><a class="truncate" href="yoginidasha1.asp"> <%=dashCatConstants.getString("YOGINI_DASHA")%></a></li>
				<li><a class="truncate" href="lalkitabdasha.asp"> <%=dashCatConstants.getString("LAL_KITAB_DASHA")%></a></li>
	          </ul>
		</div>
	</div>
</div>


