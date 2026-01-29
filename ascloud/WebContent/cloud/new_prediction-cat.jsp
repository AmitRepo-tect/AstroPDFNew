<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Local calCatLocal = new Local();
	
	int predCatLang= Util.safeInt(session.getAttribute("languageCode"));
	

	Object objpredCat = session.getAttribute("constants");
	MyProperties predCatConstants = null;
	if(objpredCat != null)
	{
		predCatConstants = (MyProperties) objpredCat;
	}
	else
	{
		predCatConstants = new MyProperties(calCatLocal.loadPropertiesFile("constants", predCatLang));
		session.setAttribute("constants", predCatConstants);
	}
	
%>

<div class="card hdg-lg">
	<h1><%=predCatConstants.getString("PREDICTIONS_REPORTS")%></h1>

</div>

<div class="row mrt-30">
	<div class="col s12 l12">
		<div class="card">
			<ul class="ui-kp">
	            <li><a class="truncate" href="prediction1.asp"> <%=predCatConstants.getString("LIFE_PREDICTIONS")%></a></li>
				<li><a class="truncate" href="love-horoscope.asp"> <%=predCatConstants.getString("LOVE_HOROSCOPE")%></a></li>
				<li><a class="truncate" href="career-horoscope.asp"> <%=predCatConstants.getString("CAREER_HOROSCOPE")%></a></li>
				<li><a class="truncate" href="character-horoscope.asp"> <%=predCatConstants.getString("NATURE_HOROSCOPE")%></a></li>
				<li><a class="truncate" href="healthindex.asp"><%=predCatConstants.getString("HEALTH_INDEX")%></a></li>
				<li><a class="truncate" href="personalized-horoscope.asp"> <%=predCatConstants.getString("PERSONALIZED_HOROSCOPE")%></a></li>
				<li><a class="truncate" href="varshphalallpages.asp"> <%=predCatConstants.getString("VARSHAPHAL")%></a></li>
				<li><a class="truncate" href="lalkitab-varshaphal-prediction.asp"> <%=predCatConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a></li>
				<li><a class="truncate" href="lalkitab-prediction.asp"> <%=predCatConstants.getString("LAL_KITAB_PREDICTIONS")%></a></li>
				<li><a class="truncate" href="gemstones-report.asp">  <%=predCatConstants.getString("GEMSTONES_REPORT")%></a></li>
				<li><a class="truncate" href="manglikdetails.asp"> <%=predCatConstants.getString("MANGLIK_CONSIDERATIONS")%></a></li>
				<li><a class="truncate" href="sadesatireport.asp"> <%=predCatConstants.getString("SHANI_SADE_SATI")%></a></li>
				<li><a class="truncate" class="truncate" href="kalsarpa-yoga.asp"> <%=predCatConstants.getString("KALSHARP_DOSH")%> </a> </li>
				<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'kalsarpayoga_PDF']);" target="_blank" href="vedic-chart-pdf.asp?page=10"> <%=predCatConstants.getString("KALSHARP_DOSH")%> - <%=predCatConstants.getString("PDF") %></a></li>
				<li><a class="truncate" href="dasha_phala.asp"> <%=predCatConstants.getString("DASHA_PREDICTIONS")%></a></li>
				<li><a class="truncate" href="babyname.asp"> <%=predCatConstants.getString("BABY_NAMES_SUGGESTION")%></a></li>
				<li><a class="truncate" href="planets-in-vedic-astrology.asp"> <%=predCatConstants.getString("PLANETS_CONSIDERATION")%> </a></li>
				<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'PlanetConsidration_PDF']);" target="_blank" href="vedic-chart-pdf.asp?page=11"> <%=predCatConstants.getString("PLANETS_CONSIDERATION")%> - <%=predCatConstants.getString("PDF") %></a></li>
				<li><a class="truncate" href="transit-today.asp"> <%=predCatConstants.getString("CURRENT_TRANSIT_PREDICTIONS")%></a></li>
				<li><a class="truncate" href="nakshatra-report.asp"> <%=predCatConstants.getString("YOUR_NAKSHATRA")%></a></li>
				<li><a class="truncate" href="ascendant-prediction.asp"> <%=predCatConstants.getString("YOUR_ASCENDANT")%> </a></li>
				<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'AscPredictions_PDF']);" target="_blank" href="vedic-chart-pdf.asp?page=12"> <%=predCatConstants.getString("YOUR_ASCENDANT")%> - <%=predCatConstants.getString("PDF") %></a></li>
				<li><a class="truncate" href="moon-sign.asp"> <%=predCatConstants.getString("YOUR_MOON_SIGN")%></a></li>
				<li><a class="truncate" href="rasi-calculator.asp"> <%=predCatConstants.getString("YOUR_MOON_SIGN")%> (<%=predCatConstants.getString("CLASSICAL")%>)</a></li>
				<li><a class="truncate" href="services.asp"> <%=predCatConstants.getString("ORDER_REPORT")%></a></li>
		      </ul>
		</div>
	</div>
</div>

