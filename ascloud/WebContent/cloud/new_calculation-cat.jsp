<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Local calCatLocal = new Local();
	
	int calCatLang= Util.safeInt(session.getAttribute("languageCode"));
	

	Object objcalCat = session.getAttribute("constants");
	MyProperties calCatConstants = null;
	if(objcalCat != null)
	{
		calCatConstants = (MyProperties) objcalCat;
	}
	else
	{
		calCatConstants = new MyProperties(calCatLocal.loadPropertiesFile("constants", calCatLang));
		session.setAttribute("constants", calCatConstants);
	}
	String calCatUserDetails = "";
	Object calCatObj = session.getAttribute("userDetails");
	if(calCatObj != null)
	{
		calCatUserDetails = calCatObj.toString();
	}
%>

<div class="card hdg-lg">
	<h1><%=calCatConstants.getString("CALCULATIONS")%></h1>

</div>

<div class="row mrt-30">
	<div class="col s12 l12">
		<div class="card">
			<ul class="ui-kp">			
                <li><a class="truncate" href="home.asp"> <%=calCatConstants.getString("WELCOME_PAGE")%></a></li>
				<li><a class="truncate" href="birth-details.asp"> <%=calCatConstants.getString("BASIC_DETAILS")%></a></li>
				<li><a class="truncate" href="planetposition.asp"> <%=calCatConstants.getString("PLANETARY_POSITION")%></a></li>
				<li><a class="truncate" href="chart.asp"> <%=calCatConstants.getString("LAGNA_CHANDRA_CHARTS")%></a></li>
				<li><a class="truncate" href="chalittable.asp"> <%=calCatConstants.getString("CHALIT_TABLE_CHART")%></a></li>
				<li><a class="truncate" href="prastharashtakvarga.asp"> <%=calCatConstants.getString("PRASTHARASHTAKVARGA_TABLE")%></a></li>
				<li><a class="truncate" href="ashtaktable.asp"> <%=calCatConstants.getString("ASHTAK_VARGA_TABLE")%></a></li>
				<li><a class="truncate" href="getplanettoplanetaspectwestern.asp"> <%=calCatConstants.getString("PLANET_TO_PLANET_ASPECT")%></a></li>
				<li><a class="truncate" href="bhavmadhya.asp"> <%=calCatConstants.getString("ASPECT_ON_BHAV_MADHYA")%></a></li>
				<li><a class="truncate" href="kpcusp.asp"> <%=calCatConstants.getString("ASPECT_ON_KP_CUSP")%></a></li>
				<li><a class="truncate" href="svklagna.asp"> <%=calCatConstants.getString("SHODASHVARGA_CHARTS")%></a></li>
				<li><a class="truncate" href="shodashvargatable.asp"> <%=calCatConstants.getString("SHODASHVARGA_TABLE")%></a></li>
				<li><a class="truncate" href="friendship.asp"> <%=calCatConstants.getString("FRIENDSHIP_TABLE")%></a></li>
				<li><a class="truncate" href="vimshottaridasha.asp"> <%=calCatConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
				<li><a class="truncate" href="shadandbhav.asp"> <%=calCatConstants.getString("SHADBALA_BHAVBALA")%></a></li>
				<li><a class="truncate" href="charantardasha1.asp"> <%=calCatConstants.getString("CHAR_DASHA")%></a></li>
				<li><a class="truncate" href="yoginidasha1.asp"> <%=calCatConstants.getString("YOGINI_DASHA")%></a></li>
				<li><a class="truncate" href="westernsystem.asp"> <%=calCatConstants.getString("WESTERN_SYSTEM")%></a></li>
				<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_1_pdf']);" href="vedic-chart-pdf.asp?page=3" title="PDF Format"> <%=calCatConstants.getString("PRINT_FORMAT_1")%> - <%=calCatConstants.getString("PDF") %></a></li>
				<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_2_low']);" href="j_lagnadivision.jsp" title="Low Print Quality/ Fast Download"> <%=calCatConstants.getString("PRINT_FORMAT_2")%> - Low</a></li>
				<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_pdf']);" href="vedic-chart-pdf.asp?page=16" title="PDF Format"> <%=calCatConstants.getString("PRINT_SHODASHVARGA")%> - <%=calCatConstants.getString("PDF") %></a></a></li>
				<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_sarvatobhadra_low']);" target="_blank" href="j_sarvatobhadradegree.asp"> <%=calCatConstants.getString("PRINT_SARVATOBHADRA_CHAKRA")%></a></li>
				<li><a class="truncate" href="transittodaychart.asp"> <%=calCatConstants.getString("TRANSIT_TODAY")%></a></li>
				<li><a class="truncate" href="astro-sketch.asp"> <%=calCatConstants.getString("ASTRO_SKETCH")%></a></li>
				<li><a class="truncate" href="jaminisystemkarakamsaswamsa.asp"> <%=calCatConstants.getString("KRSWKUNDLI")%></a></li>
				<li><a class="truncate" href="/cloud/worksheet/">  <%=calCatConstants.getString("WORK_SHEET_AS") %></a></li>
								
                              </ul>
		</div>
	</div>
</div>
