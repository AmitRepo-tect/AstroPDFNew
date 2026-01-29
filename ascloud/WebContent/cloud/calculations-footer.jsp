<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%
Local blocal = new Local();
int blang = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle rBCalculationFooter = blocal.loadPropertiesFileNew("calculationsfooter",blang);
Object objcf = session.getAttribute("constants");
MyProperties objrBConstants = null;
if(objcf != null)
{
	objrBConstants = (MyProperties) objcf;
}
else
{
	objrBConstants = new MyProperties(blocal.loadPropertiesFile("constants", blang));
	session.setAttribute("constants", objrBConstants);
}
%>

<div class="row mrt-30">
<div class="col l12">
   <div class="report-bar">
      <div class="card">
         <ul class="calculaton">
 <div class="ui-home-icon">  <a href="chart.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("LAGNA_CHANDRA_CHARTS")%> </a></div>
 <div class="ui-home-icon">  <a href="chalittable.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("CHALIT_TABLE_CHART")%> </a></div>
 <div class="ui-home-icon">  <a href="Prastharashtakvarga.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("PRASTHARASHTAKVARGA_TABLE")%>  </a></div>
 <div class="ui-home-icon">  <a href="ashtaktable.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("ASHTAK_VARGA_TABLE")%>  </a></div>
 <div class="ui-home-icon">  <a href="bhavmadhya.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("ASPECT_ON_BHAV_MADHYA")%>  </a></div>
 <div class="ui-home-icon">  <a href="kpcusp.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("ASPECT_ON_KP_CUSP")%>   </a></div>
 <div class="ui-home-icon">  <a href="svklagna.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("SHODASHVARGA_CHARTS")%>  </a></div>
 <div class="ui-home-icon">  <a href="friendship.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("FRIENDSHIP_TABLE")%>   </a></div>
 <div class="ui-home-icon">  <a href="vimshottaridasha.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("VIMSHOTTARI_DASHA")%>  </a></div>
 <div class="ui-home-icon">  <a href="shadandbhav.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("SHADBALA_BHAVBALA")%>    </a></div>
 <div class="ui-home-icon">  <a href="charantardasha1.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("CHAR_DASHA")%>   </a></div>
 <div class="ui-home-icon">  <a href="yoginidasha1.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("YOGINI_DASHA")%> </a></div>
 <div class="ui-home-icon">  <a href="westernsystem.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("WESTERN_SYSTEM")%>  </a></div>
 <div class="ui-home-icon">  <a href="j_sarvatobhadradegree.asp"  class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("PRINT_SARVATOBHADRA_CHAKRA")%>     </a></div>
 <div class="ui-home-icon">  <a href="transittodaychart.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("TRANSIT_TODAY")%>    </a></div>
 <div class="ui-home-icon">  <a href="lalplanethouse.asp" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("LAL_KITAB_CHART_PLANETS_HOUSES")%>    </a></div>
 <div class="ui-home-icon">  <a href="vedic-chart-pdf.asp" target="_blank" onclick="_gaq.push(['_trackEvent', 'print_page', 'format_full_pdf']);" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=objrBConstants.getString("PRINT_KUNDLI")%>   </a></div>
 <div class="ui-home-icon">  <a href="vedic-chart-pdf.jsp?page=17" target="_blank" onclick="_gaq.push(['_trackEvent', 'print_page', 'Calculation_Reports_pdf']);" class="collection-item black-text text-darken-4 truncate"> <i class="material-icons">check</i> <%=rBCalculationFooter.getString("PRINT_CALCULATIONS")%>   </a></div>
            </ul>
         </div>
      </div>
   </div>
</div>





