<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%
Local freeLocal = new Local();
int freeLang = Util.safeInt(session.getAttribute("constants"));
Object obj = session.getAttribute("constants");
MyProperties freeConstants = null;
if(obj != null)
{
	freeConstants = (MyProperties) obj;
}
else
{
	freeConstants = new MyProperties(freeLocal.loadPropertiesFile("constants", freeLang));
	session.setAttribute("constants", freeConstants);
}

%>
﻿
<table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tbody>
		<tr>
			<td width="100%" class="boxtopbg">
				<div class="boxhdg">
					||&nbsp;&nbsp;<%//=freeConstants.getString("OTHER_FREE_REPORT") %>&nbsp;&nbsp;||
				</div>
			</td>
		</tr>
	</tbody>
</table>

<!-- Row 1 -->

<div id="icon-container">
	<div id="icon1">
		<a href="PlanetPosition.jsp"> <img
			src="/images/report_icon/ico_birthchart.jpg" border="0"></a>
	</div>
	<div id="content1">
		<a href="PlanetPosition.jsp"><b><%=freeConstants.getString("KUNDLI")%><br>
				<%//=freeConstants.getString("BIRTH_CHART") %></b> </a>
	</div>
	<div id="icon2">
		<a href="ascendant-prediction.jsp"> <img
			src="/images/report_icon/ico_ascendant.jpg" border="0"></a>
	</div>
	<div id="content2">
		<a href="ascendant-prediction.jsp"><b>
				<%//=freeConstants.getString("ASCENDANT_REPORT") %>
		</b></a>
	</div>
	<div id="icon3">
		<a href="lalkitab-prediction.jsp"> <img
			src="/images/report_icon/ico_lalkitab.jpg" border="0"></a>
	</div>
	<div id="content3">
		<a href="lalkitab-prediction.jsp"><b>
				<%//=freeConstants.getString("LAL_KITAB_HOROSCOPE") %>
		</b></a>
	</div>
	<div id="icon4">
		<a href="vedic-chart-pdf.jsp" target="_blank"> <img
			src="/images/report_icon/ico_life_report.jpg" border="0"></a>
	</div>
	<div id="content4">
		<a href="vedic-chart-pdf.jsp" target="_blank"><b><%=freeConstants.getString("LIFE_REPORT_PDF") %>
		</b></a>
	</div>

	<div id="icon5">
		<a href="SadeSatiReport.jsp"> <img
			src="/images/report_icon/ico_sadesati.jpg" border="0"></a>
	</div>
	<div id="content5">
		<a href="SadeSatiReport.jsp"><b><%=freeConstants.getString("SADE_SATI_LIFE_REPORT")%></b></a>
	</div>
	<div style="clear: both"></div>
</div>
<div id="icon-container">
	<div id="icon6">
		<a href="VarshphalAllPages.jsp"> <img
			src="/images/report_icon/ico_2011_report.jpg" border="0"></a>
	</div>
	<div id="content6">
		<a href="VarshphalAllPages.jsp"><b><%=freeConstants.getString("YEAR_ANALYSIS_VARSHPHAL") %></b></a>
	</div>
	<div id="icon7">
		<a href="babyname.jsp"> <img
			src="/images/report_icon/ico_babyname.jpg" border="0"></a>
	</div>
	<div id="content7">
		<a href="babyname.jsp"><b><%=freeConstants.getString("BABY_NAMES_SUGGESTION_FREE")%></b></a>
	</div>

	<div id="icon8">
		<a href="transit-today.jsp"> <img
			src="/images/report_icon/ico_transit.jpg" border="0"></a>
	</div>
	<div id="content8">
		<a href="transit-today.jsp"><b><%=freeConstants.getString("GOCHAR_PHAL_TRANSIT_REPORT") %></b></a>
	</div>
	<div id="icon9">
		<a href="kundali-prediction.asp title=" Get HindiKundli"> <img
			src="/images/report_icon/ico_hinkundli.jpg" border="0"></a>
	</div>
	<div id="content9">
		<a href="kundali-prediction.jsp"><b><%=freeConstants.getString("HINDI") %><br>
				<%=freeConstants.getString("KUNDLI")%></b></a>
	</div>
	<div id="icon10">
		<a href="ManglikDetails.asp"> <img
			src="/images/report_icon/ico_mangal.jpg" border="0"></a>
	</div>
	<div id="content10">
		<a href="ManglikDetails.jsp"><b><%=freeConstants.getString("MANGAL")%><br>
				<%=freeConstants.getString("DOSHA")%></b></a>
	</div>
	<div style="clear: both"></div>
</div>
<div id="icon-container">
	<div id="icon11">
		<a href="dasha_phala.jsp"> <img
			src="/images/report_icon/ico_dasha.jpg" border="0"></a>
	</div>
	<div id="content11">
		<a href="dasha_phala.jsp"><b><%=freeConstants.getString("DASHA_PHAL_ANALYSIS")%></b></a>
	</div>
	<div id="icon11">
		<a href="love-horoscope.jsp"> <img
			src="/images/report_icon/ico_love_horoscope.jpg" border="0"></a>
	</div>
	<div id="content11">
		<a href="love-horoscope.jsp"><b><%=freeConstants.getString("LOVE_HOROSCOPE") %></b></a>
	</div>
	<div id="icon11">
		<a href="career-horoscope.jsp"> <img
			src="/images/report_icon/ico_career.jpg" border="0"></a>
	</div>
	<div id="content11">
		<a href="career-horoscope.jsp"><b><%=freeConstants.getString("CAREER_HOROSCOPE_FREE")%></b></a>
	</div>
	<div id="icon11">
		<a href="gemstone-report.jsp"> <img
			src="/images/report_icon/gemstone.png" border="0"></a>
	</div>
	<div id="content11">
		<a href="gemstones-report.jsp"><b><%=freeConstants.getString("GEMSTONES_REPORT")%></b></a>
	</div>
	<div style="clear: both"></div>
</div>