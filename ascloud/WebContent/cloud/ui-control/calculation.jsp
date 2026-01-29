<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%
	Local localCalc = new Local(); 
    int langCodeCalc = Util.safeInt(session.getAttribute("languageCode"));
	MyResourceBundle rBCalc = localCalc.loadPropertiesFileNew("home",langCodeCalc);
	MyResourceBundle rBCalcBasicdetails = localCalc.loadPropertiesFileNew("home-basicdetails",langCodeCalc);
	Object calcObj = session.getAttribute("constants");
	MyProperties rBConstantCalcFile = null;
	if(calcObj == null)
	{
		rBConstantCalcFile = new MyProperties(localCalc.loadPropertiesFile("constants",langCodeCalc));
		session.setAttribute("constants", rBConstantCalcFile);
	}
	else
	{
		rBConstantCalcFile = (MyProperties) calcObj;
	}
	
   
	
%>


<div class="row">
	<div class="col s12 l12">
		<div class="report-bar">
			<div class="card hdg-lg1">
                <h2 class="amber lighten-5">                
					<%=rBCalc.getString("IF_YOU_KNOW_ASTROLOGY")%></h2>
	<div class="calculaton">			
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="birth-details.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("BASIC_DETAILS")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="planetposition.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("PLANETARY_POSITION")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="chart.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("LAGNA_CHANDRA_CHARTS")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="chalittable.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("CHALIT_TABLE_CHART")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="prastharashtakvarga.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("PRASTHARASHTAKVARGA_TABLE")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="ashtaktable.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("ASHTAK_VARGA_TABLE")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="bhavmadhya.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("ASPECT_ON_BHAV_MADHYA")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="kpcusp.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("ASPECT_ON_KP_CUSP")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="svklagna.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("PLANET_TO_PLANET_ASPECT")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="svklagna.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("SHODASHVARGA_CHARTS")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="shodashvargatable.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("SHODASHVARGA_TABLE")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="friendship.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("FRIENDSHIP_TABLE")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="vimshottaridasha.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("VIMSHOTTARI_DASHA")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="shadandbhav.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("SHADBALA_BHAVBALA")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="charantardasha1.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("CHAR_DASHA")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="yoginidasha1.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("YOGINI_DASHA")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="westernsystem.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("WESTERN_SYSTEM")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="j_sarvatobhadradegree.asp"><i class="material-icons">check</i> <%=rBCalcBasicdetails.getString("SARVATOBHADRA_CHAKRA") %></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="transittodaychart.asp"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("TRANSIT_TODAY")%></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" target="_blank"	onclick="_gaq.push(['_trackEvent', 'print_page', 'format_1_pdf']);"	href="vedic-chart-pdf.asp?page=3" title="PDF Format"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("PRINT_FORMAT_1")%> -  <%=rBConstantCalcFile.getString("PDF") %></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" target="_blank" onclick="_gaq.push(['_trackEvent', 'print_page', 'format_2_low']);" href="j_lagnadivision.asp"	title="Low Print Quality/ Fast Download"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("PRINT_FORMAT_2")%> - Low</a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" target="_blank" onclick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_pdf']);"	href="vedic-chart-pdf.jsp?page=16" title="PDF Format"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("PRINT_SHODASHVARGA")%> - <%=rBConstantCalcFile.getString("PDF") %></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="vedic-chart-pdf.jsp?page=17&isopenkundli=yes"	target="_blank"	onclick="_gaq.push(['_trackEvent', 'print_page', 'Calculation_Reports_pdf']);"><i class="material-icons">check</i> <%=rBCalcBasicdetails.getString("PRINT_DETAILED_CALCULATIONS_REPORTS_PDF") %></a></div>
<div class="ui-home-icon"><a class="collection-item black-text text-darken-4 truncate" href="vedic-chart-pdf.asp" target="_blank"	onclick="_gaq.push(['_trackEvent', 'print_page', 'format_full_pdf']);"><i class="material-icons">check</i> <%=rBConstantCalcFile.getString("PRINT_KUNDLI")%></a></div>
</div>
				
			</div>
		</div>
	</div>
</div>

<div class="row">
    <div class="col s12 l4 pd-mrng">
        <div class="report-bar site-class">
           <div class="card hdg-lg1">
                <h2 class="amber lighten-5">
                  <%=rBConstantCalcFile.getString("PAID_CONSULTATION")%>
                </h2>                
                
<div class="calculaton">
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4" href="http://www.astrocamp.com/?prtnr_id=1" target="_blank"> <%=rBCalcBasicdetails.getString("PRINT_DETAILED_CALCULATIONS_REPORTS_PDF") %></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4" href="vimshottaridasha.asp"> <%=rBConstantCalcFile.getString("VIMSHOTTARI_DASHA")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4" href="charantardasha1.asp">  <%=rBConstantCalcFile.getString("CHAR_DASHA")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4" href="yoginidasha1.asp"> <%=rBConstantCalcFile.getString("YOGINI_DASHA")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4" href="lalkitabdasha.asp"> <%=rBConstantCalcFile.getString("LAL_KITAB_DASHA")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4" target="_blank"	onclick="_gaq.push(['_trackEvent', 'print_page', 'format_dasa_low']);" href="j_dasa.asp" title="Low Print Quality/ Fast Download"><%=rBConstantCalcFile.getString("PRINT") %>&nbsp;<%=rBConstantCalcFile.getString("VIMSHOTTARI_DASHA")%> - Low</a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4" href="lalplanethouse.asp"><%=rBConstantCalcFile.getString("LAL_KITAB")%>&nbsp;	<%=rBConstantCalcFile.getString("CHART")%></a></div>
</div>
</div>
</div>
</div>

    <div class="col s12 l4 pd-mrng">
        <div class="report-bar site-class">
           <div class="card hdg-lg1">
                <h2 class="amber lighten-5">
                  <%=rBConstantCalcFile.getString("LAL_KITAB")%>
                </h2>
<div class="calculaton">
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lalplanethouse.asp">  <%=rBConstantCalcFile.getString("LAL_KITAB_CHART_PLANETS_HOUSES")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lalkitabdasha.asp">  <%=rBConstantCalcFile.getString("LAL_KITAB_DASHA")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lkitabworksheet2.asp?KundliType=1&isFirst=1">  <%=rBConstantCalcFile.getString("LAL_KITAB_WORKSHEET")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lalkitabvarshaphal.asp">  <%=rBConstantCalcFile.getString("LAL_KITAB_VARSHAPHAL")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lalkitab-prediction.asp">  <%=rBConstantCalcFile.getString("LAL_KITAB_PREDICTIONS")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lalkitabmonthchart.asp">  <%=rBConstantCalcFile.getString("LAL_KITAB_MONTH_CHARTS")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lalkitabvarshaphalcharts.asp">  <%=rBConstantCalcFile.getString("LAL_KITAB_VARSHAPHAL_CHARTS")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lalkitab-varshaphal-prediction.asp">  <%=rBConstantCalcFile.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " onclick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_pdf']);" href="vedic-chart-pdf.jsp?page=13&isopenkundli=yes" target="_blank">  <%=rBConstantCalcFile.getString("LAL_KITAB_PRINT_PAGE") %> <%=rBConstantCalcFile.getString("PDF") %></a></div>
</div>
</div>
</div>
</div>

    <div class="col s12 l4 pd-mrng">
        <div class="report-bar site-class">
           <div class="card hdg-lg1">
           
                <h2 class="amber lighten-5">
                  <%=rBConstantCalcFile.getString("KP_SYSTEM")%>
                </h2>
<div class="calculaton">
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="KPPlanetCusp.asp">  <%=rBConstantCalcFile.getString("KP_SYSTEM_PLANETS_CUSPS")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="kpcusp.asp">  <%=rBConstantCalcFile.getString("PLANET_TO_PLANET_ASPECT")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="kpcusp.asp">  <%=rBConstantCalcFile.getString("ASPECT_ON_KPCUSP")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="kpsignirp.asp" onclick="rpManageLink(this)">  <%=rBConstantCalcFile.getString("KP_SYSTEM_SIGNIFICATORS_RPS")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " href="lagna-navamsa-jpeg-chart.asp"	onclick="_gaq.push(['_trackEvent', 'print_page', 'Save_Chart_as_image']);"	title="Print, Embed or Share Chart on Facebook / Twitter">  <%=rBCalcBasicdetails.getString("SAVE_CHART_AS_IMAGE") %></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " target="_blank"	onclick="_gaq.push(['_trackEvent', 'print_page', 'format_kp_pdf']);" href="vedic-chart-pdf.jsp?page=14&isopenkundli=yes" title="PDF"> <%=rBCalcBasicdetails.getString("PRINT_KP_PAGE_PDF_JPEG")%> <%=rBConstantCalcFile.getString("PDF") %></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " onclick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);" href="vedic-chart-pdf.jsp?page=15&isopenkundli=yes" target="_blank">  <%=rBConstantCalcFile.getString("PRINT_KP_REPORT")%></a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " target="_blank" onclick="_gaq.push(['_trackEvent', 'print_page', 'format_2_low']);" href="j_lagnadivision.asp" title="Low Print Quality/ Fast Download"> <%=rBConstantCalcFile.getString("PRINT_FORMAT_2")%> -  Low</a></div>
<div class="ui-home-icon no-br-r valign-wrapper"><div class="item-icon"><i class="material-icons">check</i></div><a class="collection-item black-text text-darken-4 " target="_blank" onclick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_pdf']);"	href="vedic-chart-pdf.jsp?page=16&isopenkundli=yes"	title="PDF Format"> <%=rBConstantCalcFile.getString("PRINT_SHODASHVARGA")%> - <%=rBConstantCalcFile.getString("PDF") %></a></div>
</div>
</div>
</div>
</div>
</div>

