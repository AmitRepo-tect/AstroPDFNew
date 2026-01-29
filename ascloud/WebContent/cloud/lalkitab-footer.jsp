<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%
Local local0 = new Local();
int langCode0 = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBLalKitab = local0.loadPropertiesFileNew("lalkitab-footer",langCode0);

Object objlal = session.getAttribute("constants");
MyProperties rBConstants0 = null;
if(objlal != null)
{
	rBConstants0 = (MyProperties) objlal;
}
else
{
	rBConstants0 = new MyProperties(local0.loadPropertiesFile("constants", langCode0));
	session.setAttribute("constants", rBConstants0);
}
%>


                           <div class="row mrt-30 mrb-30 card-pado">
                            <div class="col l12">
                              <div class="card">
                                 <ul class="ui-kp">
                                   <li>  <a href="/cloud/lalkitab-remedies-rules.asp"><%=rBConstants0.getString("LALKITAB_REMEDIES_RULES") %></a></li>
	                               <li>  <a href='lalkitabdasha.asp'> <%=rBConstants0.getString("LALKITAB_DASHA")%></a></li>
	                               <li>  <a href="lkitabworksheet2.asp?KundliType=1&isFirst=1"><%=rBConstants0.getString("LAL_KITAB_WORKSHEET")%></a></li>
	                               <li>  <a href="lalkitab-prediction.asp"><%=rBConstants0.getString("LAL_KITAB_PREDICTIONS")%></a></li>
	                               <li>  <a href="lalplanethouse.asp"><%=rBLalKitab.getString("LAL_KITAB_HOUSE_POSITION")%></a></li>
	                               <li>  <a href="lalkitabvarshaphalcharts.asp"><%=rBConstants0.getString("LAL_KITAB_VARSHAPHAL_CHARTS")%></a></li>
	                               <li>  <a href="lalkitab-varshaphal-prediction.asp"><%=rBLalKitab.getString("LAL_KITAB_VARSHPHAL_PREDICT")%></a></li>
	                               <li>  <a onclick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_pdf']);" target="_blank" href="vedic-chart-pdf.jsp?page=13"><%=rBLalKitab.getString("DOWNLOAD_LK_PAGE")%><u><%=rBConstants0.getString("PDF")%></u></a></li>
	                               <li>  <a href="lalkitabmonthchart.asp"><%=rBConstants0.getString("LAL_KITAB_MONTH_CHARTS") %></a></li>
                                 </ul>
                               </div>
                             </div>
                           </div>






