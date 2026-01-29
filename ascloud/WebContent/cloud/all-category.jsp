<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	<%
	Local catLocal = new Local();
	
	int catLang= Util.safeInt(session.getAttribute("languageCode"));
	
	MyResourceBundle catConstent = catLocal.loadPropertiesFileNew("filemenu",catLang);
	
	Object objcat = session.getAttribute("constants");
	MyProperties catConstants = null;
	if(objcat != null)
	{
		catConstants = (MyProperties) objcat;
	}
	else
	{
		catConstants = new MyProperties(catLocal.loadPropertiesFile("constants", catLang));
		session.setAttribute("constants", catConstants);
	}
%>

<div class="row hide-on-large-only ui-mrg">
                           <div class="col s12 l12">
                              <div class="report-bar site-class">
                                 <div class="card">
                                    <div class="row mr-b-0">
                                       <div class="col s4 m4 l4 user-define ui-code right-R">
                                          <a href="calculation-cat.asp" class="buy-bar">
                                             <div class="icon-set center">
                                                <img src="images/icons/ic_calculator.png" alt="user" class="mt-3">
                                                <h6 class="card-title font-weight-400 mb-2"><%=catConstants.getString("CALCULATIONS")%></h6>
                                             </div>
                                          </a>
                                       </div>
                                       <div class="col s4 m4 l4 user-define ui-code right-R left-R">
                                          <a href="prediction-cat.asp" class="buy-bar">
                                             <div class="icon-set center">
                                                <img src="images/icons/ic_predection.png" alt="user" class="mt-3">
                                                <h6 class="card-title font-weight-400 mb-2"><%=catConstants.getString("PREDICTIONS")%></h6>
                                             </div>
                                          </a>
                                       </div>
                                       <div class="col s4 m4 l4 user-define ui-code left-R">
                                          <a href="dasha-cat.asp" class="buy-bar">
                                             <div class="icon-set center">
                                                <img src="images/icons/ic_mahadashaphal.png" alt="user" class="mt-3">
                                                <h6 class="card-title font-weight-400 mb-2"><%=catConstants.getString("DASHA")%></h6>
                                             </div>
                                          </a>
                                       </div>
                                       <div class="col s4 m4 l4 user-define ui-code btm-top right-R">
                                          <a href="lalkitab-cat.asp" class="buy-bar">
                                             <div class="icon-set center">
                                                <img src="images/icons/ic_lalkitab.png" alt="user" class="mt-3">
                                                <h6 class="card-title font-weight-400 mb-2"><%=catConstants.getString("LAL_KITAB")%></h6>
                                             </div>
                                          </a>
                                       </div>
                                       <div class="col s4 m4 l4 user-define ui-code btm-top right-R left-R">
                                          <a href="kp-system-cat.asp" class="buy-bar">
                                             <div class="icon-set center">
                                                <img src="images/icons/kp.png" alt="user" class="mt-3">
                                                <h6 class="card-title font-weight-400 mb-2"><%=catConstants.getString("KP_SYSTEM")%></h6>
                                             </div>
                                          </a>
                                       </div>
                                       <div class="col s4 m4 l4 user-define ui-code btm-top left-R">
                                          <a href="matching-cat.asp" class="buy-bar">
                                             <div class="icon-set center">
                                                <img src="images/icons/ic_matching.png" alt="user" class="mt-1">
                                                <h6 class="card-title font-weight-400 mb-2"><%=catConstants.getString("KUNDLI_MATCHING")%></h6>
                                             </div>
                                          </a>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>