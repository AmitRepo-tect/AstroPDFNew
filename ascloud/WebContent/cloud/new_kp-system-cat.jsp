<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Local kpCatLocal = new Local();

int kpCatLang= Util.safeInt(session.getAttribute("languageCode"));


Object objkpCat = session.getAttribute("constants");
MyProperties kpCatConstants = null;
if(objkpCat != null)
{
	kpCatConstants = (MyProperties) objkpCat;
}
else
{
	kpCatConstants = new MyProperties(kpCatLocal.loadPropertiesFile("constants", kpCatLang));
	session.setAttribute("constants", kpCatConstants);
}

String kpDetails = "";
Object kpObj = session.getAttribute("userDetails");
if(kpObj != null)
{
	kpDetails = kpObj.toString();
}

%>

<div class="card hdg-lg">
	<h1><%=kpCatConstants.getString("KP_SYSTEM")%></h1>

</div>

<div class="row mrt-30">
	<div class="col l12">
		<div class="card">
			<ul class="ui-kp">
			    <li><a class="truncate" href="KPPlanetCusp.asp"> <%=kpCatConstants.getString("KP_SYSTEM_PLANETS_CUSPS")%></a></li>
				<li><a class="truncate" href="getplanettoplanetaspectwestern.asp"> <%=kpCatConstants.getString("PLANET_TO_PLANET_ASPECT")%></a></li>
				<li><a class="truncate" href="kpcusp.asp"> <%=kpCatConstants.getString("ASPECT_ON_KPCUSP")%></a></li>
				<li><a class="truncate" href="kpsignirp.asp" onClick="rpManageLink(this)"> <%=kpCatConstants.getString("KP_SYSTEM_SIGNIFICATORS_RPS")%></a></li>
				<li><a class="truncate" href="kptoday.asp"> <%=kpCatConstants.getString("MY_KP_TODAY")%></a></li>
				<li><a class="truncate" href="vimshottaridasha.asp"> <%=kpCatConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
				<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);" href="vedic-chart-pdf.asp?page=14" target="_blank"> <%=kpCatConstants.getString("PRINT_KP_REPORT")%></a></li>
				<li><a class="truncate" href="4-step.asp"> <%=kpCatConstants.getString("STEP4")%></a></li>
				<li><a class="truncate" href="cil.asp"> <%=kpCatConstants.getString("CUSPAL_INTERLINK_SUB")%></a></li>
				<li><a class="truncate" href="kcil.asp"> <%=kpCatConstants.getString("KHULLAR_CUSPAL_INTERLINK_SUB")%></a></li>
				<li><a class="truncate" href="nakshatra-nadi.asp"> <%=kpCatConstants.getString("NAKSHATRA_NADI")%></a></li>
				<li><a class="truncate" href="planet-sign.asp"> <%=kpCatConstants.getString("PLANET_SIGNVIEW2")%></a></li>
			    </ul>
		</div>
	</div>
</div>


