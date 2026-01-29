<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Local lalkCatLocal = new Local();
	
	int lalkCatLang= Util.safeInt(session.getAttribute("languageCode"));
	

	Object objlalkCat = session.getAttribute("constants");
	MyProperties lalkCatConstants = null;
	if(objlalkCat != null)
	{
		lalkCatConstants = (MyProperties) objlalkCat;
	}
	else
	{
		lalkCatConstants = new MyProperties(lalkCatLocal.loadPropertiesFile("constants", lalkCatLang));
		session.setAttribute("constants", lalkCatConstants);
	}
	
%>

<div class="card hdg-lg">
	<h1><%=lalkCatConstants.getString("LAL_KITAB")%></h1>
</div>

<div class="row mrt-30">
	<div class="col l12">
		<div class="card">
			<ul class="ui-kp">
                <li><a class="truncate" href="lalplanethouse.asp"> <%=lalkCatConstants.getString("LAL_KITAB_CHART_PLANETS_HOUSES")%></a></li>
				<li><a class="truncate" href="lalkitab-debts-teva.asp"> <%=lalkCatConstants.getString("LK_DEBTS_AND_TEVA")%></a></li>
				<li><a class="truncate" href="lalkitab-teva.asp"> <%=lalkCatConstants.getString("LK_TEVA")%></a></li>
				<li><a class="truncate" href="lalkitabdasha.asp"> <%=lalkCatConstants.getString("LAL_KITAB_DASHA")%></a></li>
				<li><a class="truncate" href="lkitabworksheet2.asp?KundliType=1&isFirst=1"> <%=lalkCatConstants.getString("LAL_KITAB_WORKSHEET")%></a></li>
				<li><a class="truncate" href="lalkitabvarshaphal.asp"> <%=lalkCatConstants.getString("LAL_KITAB_VARSHAPHAL")%></a></li>
				<li><a class="truncate" href="lalkitabmonthchart.asp"> <%=lalkCatConstants.getString("LAL_KITAB_MONTH_CHARTS")%></a></li>
				<li><a class="truncate" href="lalkitabvarshaphalcharts.asp"> <%=lalkCatConstants.getString("LAL_KITAB_VARSHAPHAL_CHARTS")%></a></li>
				<li><a class="truncate" href="lalkitab-prediction.asp"> <%=lalkCatConstants.getString("LAL_KITAB_PREDICTIONS")%></a></li>
				<li><a class="truncate" href="lalkitab-varshaphal-prediction.asp"> <%=lalkCatConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a></li>
				<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_pdf']);" href="vedic-chart-pdf.jsp?page=13" target="_blank"> <%=lalkCatConstants.getString("LAL_KITAB_PRINT_PAGE")%> - <%=lalkCatConstants.getString("PDF") %></a></li>
       		</ul>
		</div>
	</div>
</div>


