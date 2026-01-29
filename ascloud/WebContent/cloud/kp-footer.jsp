<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%
Local footerLocal = new Local();
int footerLang = (Integer) session.getAttribute("languageCode");
MyResourceBundle rBKpFooter = footerLocal.loadPropertiesFileNew("kp-footer",footerLang);
Object objkp = session.getAttribute("constants");
MyProperties footerConstants = null;
if(objkp != null)
{
	footerConstants = (MyProperties) objkp;
}
else
{
	footerConstants = new MyProperties(footerLocal.loadPropertiesFile("constants", footerLang));
	session.setAttribute("constants", footerConstants);
}
%>

         <div class="row mrt-30 mrb-30">
                            <div class="col l12">
                              <div class="card hdg-lg">
                                 <ul class="ui-kp">
                                 
                                   <li>  <a href='kpplanetcusp.asp'><%=rBKpFooter.getString("KP_SYSTEM_PLANETS") %></a></li>
	                               <li>  <a href='kpsignirp.asp'><%=rBKpFooter.getString("SIGNIFICATORS_AND_RP") %></a></li>
	                               <li>  <a href='VMMD&AD.asp'><%=footerConstants.getString("VIMSHOTTARI_DASHA") %></a></li>
	                               <li>  <a onclick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);" target="_blank" href='vedic-chart-pdf.jsp?page=15'><%=rBKpFooter.getString("DOWNLOAD_KP_REPORT") %> <u><%=footerConstants.getString("PDF") %></u></a></li>
								   <li>  <a href="kpcusp.asp"><%=footerConstants.getString("ASPECT_ON_KP_CUSP")%></a></li>
                                 </ul>
                               </div>
                             </div>
                           </div>


