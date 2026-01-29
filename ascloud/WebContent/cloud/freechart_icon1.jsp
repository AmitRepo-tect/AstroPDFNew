<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
Local local = new Local();
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
Object obj = session.getAttribute("constants");
MyProperties rBConstants = null;
if(obj != null)
{
	rBConstants = (MyProperties) obj;
}
else
{
	rBConstants = new MyProperties(local.loadPropertiesFile("constants", languageCode));
	session.setAttribute("constants", rBConstants);
}
MyResourceBundle rBFreeChartIcon1 = local.loadPropertiesFileNew("freechart_icon1", languageCode);
MyResourceBundle rBReportFreechartIcon1 = local.loadPropertiesFileNew("report-freechart_icon1", languageCode);
%>

						<div class="row" id="ui-default-bar-icon">
                           <div class="col s12 m12 l12 class-main ui-other-report">
                              <div class="report-bar">
                                 <div class="card hdg-lg1">
                                    <h2 class="br-amber-b amber lighten-5 head-R">  
                                    <%=rBFreeChartIcon1.getString("OTHER_FREE_REPORT") %>   </h2>
                                    <div class="eq-height-grid">
                                    
                                    
                                       <div class="grid-view ui-icon-set icon-set">
                                       <a href="planetposition.asp" class="collection-item black-text text-darken-4 ">  
                                       <div class="center">
                                        <img src="images/icons/ic_kundali.png">
                                        <h6><%=rBConstants.getString("KUNDLI")%>
										<%=rBFreeChartIcon1.getString("BIRTH_CHART") %></h6>
                                       </div> 
                                       </a>
                                      </div>
                                    
                                    
                                       <div class="grid-view ui-icon-set icon-set">  <a href="ascendant-prediction.asp" class="collection-item black-text text-darken-4 ">  
                                       <div class="center">
                                       
                                       <img src="images/icons/ascendant.png">
                                       <h6><%=rBFreeChartIcon1.getString("ASCENDANT_REPORT") %></h6>
                                       </div> 
                                      </a>
                                     </div>
                                    
                                    
                                       <div class="grid-view ui-icon-set icon-set">  
                                       <a href="lalkitab-prediction.asp" class="collection-item black-text text-darken-4 ">  
                                       <div class="center">
                                       
                                       <img src="images/icons/ic_lalkitab.png">
                                       <h6><%=rBReportFreechartIcon1.getString("LAL_KITAB_HOROSCOPE") %></h6>
                                       
                                    </div>
                                    </a>
                                    </div>
                                    </div>
                                    
                                    <div class="eq-height-grid">
                                 
								     <div class="grid-view ui-icon-set icon-set">  
								     <a href="vedic-chart-pdf.asp" class="collection-item black-text text-darken-4 ">  
								     <div class="center">
                                       
                                       <img src="images/icons/life-reading.png">
                                       <h6><%=rBFreeChartIcon1.getString("LIFE_REPORT_PDF") %></h6>
                                    </div> </a></div>
                                    
                                    
							     <div class="grid-view ui-icon-set icon-set">  
							     <a href="sadesatireport.asp" class="collection-item black-text text-darken-4 "> 
							    
                                    <div class="center">
                                       
                                       <img src="images/icons/shani-sade-sati-report.png">
                                       <h6><%=rBReportFreechartIcon1.getString("SADE_SATI_LIFE_REPORT")%></h6>
                                     
                                    </div>  
                                    </a></div>
                                    
                                    
								     <div class="grid-view ui-icon-set icon-set">  
								     <a href="varshphalallpages.asp" class="collection-item black-text text-darken-4 ">  
								     <div class="center">
                                       
                                       <img src="images/icons/year-analysis.png">
                                       <h6><%=rBReportFreechartIcon1.getString("YEAR_ANALYSIS_VARSHPHAL") %></h6>
                                       
                                    </div>
                                  </a></div>
                                  </div>
                                  
                                  <div class="eq-height-grid">
                                  
								     <div class="grid-view ui-icon-set icon-set">  
								     <a href="babyname.asp" class="collection-item black-text text-darken-4 ">   
								     <div class="center">
                                      
                                       <img src="images/icons/baby-name.png">
                                       <h6><%=rBReportFreechartIcon1.getString("BABY_NAMES_SUGGESTION_FREE")%></h6>
                                       
                                    </div>  
                                    </a></div>
                                    
								     <div class="grid-view ui-icon-set icon-set">  
								     <a href="transit-today.asp" class="collection-item black-text text-darken-4 ">   
								     <div class="center">
                                      
                                       <img src="images/icons/ic_transit_today.png">
                                       <h6><%=rBReportFreechartIcon1.getString("GOCHAR_PHAL_TRANSIT_REPORT") %> </h6>
                                    </div> 
                                    </a></div>
                                    
								     <div class="grid-view ui-icon-set icon-set">  
								     <a href="kundali-prediction.asp" class="collection-item black-text text-darken-4 ">   
								     <div class="center">
                                       <img src="images/icons/hindi-kundali.png">
                                       <h6> <%=rBConstants.getString("GENERAL_PREDICTION_NEW") %></h6>
                                    </div> 
                                    </a></div>
                                    </div>
                                    
                                    <div class="eq-height-grid">
                                    
                                     <div class="grid-view ui-icon-set icon-set">  
								     <a href="manglikdetails.asp" class="collection-item black-text text-darken-4 ">   
								     <div class="center">
                                       <img src="images/icons/ic_mangal_dosh.png">
                                       <h6> <%=rBReportFreechartIcon1.getString("MANGAL")%>
				                       <%=rBReportFreechartIcon1.getString("DOSHA")%></h6>
                                    </div> 
                                    </a></div>
                                    
                                     <div class="grid-view ui-icon-set icon-set">  
								     <a href="dasha_phala.asp" class="collection-item black-text text-darken-4 ">   
								     <div class="center">
                                      
                                       <img src="images/icons/dashaphal.png" >
                                       <h6><%=rBReportFreechartIcon1.getString("DASHA_PHAL_ANALYSIS")%></h6>
                                    </div> 
                                    </a></div>
                                    
                                    <div class="grid-view ui-icon-set icon-set">  
								     <a href="love-horoscope.asp" class="collection-item black-text text-darken-4 ">   
								     <div class="center">
                                       
                                       <img src="images/icons/ic_weekly_love.png">
                                       <h6><%=rBConstants.getString("LOVE_HOROSCOPE") %></h6>
                                    </div> 
                                    </a></div>
   
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>


<!-- Row 1 -->

