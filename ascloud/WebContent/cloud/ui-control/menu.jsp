<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="java.util.*"%>

<%
String arrowClass,userName,refVal,userDetails,dashaBhog,temp,currentChartName;
int flagVal = 0,chartType1=0;
arrowClass="";
temp = "";
Local fileLocal = new Local();
int fileLang = 0;
Object o = session.getAttribute("languageCode");
if(o != null)
{
	fileLang = (Integer) o;
}

MyResourceBundle rBNotificationBarinMenu = fileLocal.loadPropertiesFileNew("notificationbar", fileLang);

MyResourceBundle rBFileMenu = fileLocal.loadPropertiesFileNew("filemenu", fileLang);
//ResourceBundle rBLeftBasicDetailsFileMenu = local.ResourceBundle("leftmenu-basicdetails-filemenu");
MyResourceBundle rBChartStyleFileMenu = fileLocal.loadPropertiesFileNew("filemenu-chartstyle", fileLang);
MyResourceBundle rBArudha = fileLocal.loadPropertiesFileNew("arudha",fileLang);
MyResourceBundle planetPositionConstants = fileLocal.loadPropertiesFileNew("planetposition",fileLang);
if(fileLang == 1){	
	arrowClass = "-hi"; 
}
else if(fileLang == 2){
	arrowClass = "-ta"; 
}
else if(fileLang == 5){
	arrowClass = "-te"; 
}
else if(fileLang == 6){
	arrowClass = "-bn"; 
}
else if(fileLang == 9){
	arrowClass = "-mr"; 
}
userName = Util.safestr(session.getAttribute("User_Id"));
/*
* First we check if there is any chartType coming in the request. If yes, then we set the session attribute 
* and PdfChartType accordingly. The PDF does not print EAST INDIAN chart. So, even for East Indian chartType,
* we pass the chartType to it as north indian. If there is no requests parameter coming, then we pick the chartType
* from session.
* 
*/
String chartType = Util.safestr(request.getParameter("charttype"));
if(chartType.equals("south")){
	session.setAttribute("chartType",1);
	chartType1 = 2;
	session.setAttribute("PdfChartType",2);
    flagVal = 1;
}
else if(chartType.equals("east")){
	session.setAttribute("chartType",2);
	chartType1 = 3;
	session.setAttribute("PdfChartType",3);
    flagVal = 1;
	    
}
else if(chartType.equals("north")){
	session.setAttribute("chartType",0);
	chartType1 = 1;
	session.setAttribute("PdfChartType",1);
    flagVal = 1;
}

if(userName.isEmpty()){ 
	userName = "Instant Chart";
}
if(flagVal == 0){
	Object objCT = session.getAttribute("chartType");
	if(objCT == null || objCT.toString().equals(""))
	{
		chartType1 = 0;
		session.setAttribute("chartType", 0);
	}
	else
	{
		chartType1 = Util.safeInt(objCT);
	}
	
    if(chartType1 == 0 || chartType1 == 2){
        chartType1 = 1;
        session.setAttribute("PdfChartType",1);
	}
	else{
        chartType1 = 2;
        session.setAttribute("PdfChartType",2);
	}   
}
DesktopHoro fileHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
if(fileHoro != null)
{
	if(fileHoro.getLanguageCode() == "1"){
		fileHoro.setLanguageCode("0");
		fileHoro.initialize();
	  	dashaBhog = fileHoro.getBalanceOfDasa().toString();
	  	fileHoro.setLanguageCode("1");
	  	fileHoro.initialize();
	}
		else{
	    dashaBhog = fileHoro.getBalanceOfDasa().toString();
		}
}
else
{
	dashaBhog = "";
}
String[] arrOfBalOFDasha = dashaBhog.split(" ");	
if(arrOfBalOFDasha.length > 1)
{
	for(int iCount = 0;iCount<arrOfBalOFDasha.length;iCount++){   
	   if(iCount == 0){     		
			arrOfBalOFDasha[iCount] = arrOfBalOFDasha[iCount].substring(0,2);
	   }
	   temp = temp +" "+ arrOfBalOFDasha[iCount];
	}	
}
	refVal=String.valueOf(session.getAttribute("Http_Referer"));
	if(fileHoro != null)
	{
userDetails="ChartType="+chartType1+"&DashaBhog="+temp.trim()+"&UserName="+fileHoro.getName()+"&UserPlace="+fileHoro.getPlace().trim()+"&UserTimeZone="+fileHoro.getTimeZone()+"&UserSex="+fileHoro.getMaleFemale()+"&UserSecondOfBirth="+fileHoro.getSecondOfBirth()+"&UserMinuteOfBirth="+ fileHoro.getMinuteOfBirth()+"&UserHourOfBirth="+fileHoro.getHourOfBirth()+"&UserDayOfBirth="+ fileHoro.getDayOfBirth()+"&UserMonthOfBirth="+fileHoro.getMonthOfBirth()+"&UserYearOfBirth="+ fileHoro.getYearOfBirth()+"&UserDegreeOfLattitude="+fileHoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+fileHoro.getDegreeOfLongitude()+"&UserSecondOfLattitude="+fileHoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+fileHoro.getSecondOfLongitude()+"&UserMinuteOfLongitude="+fileHoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+fileHoro.getMinuteOfLattitude()+"&UserEastWest="+fileHoro.getEastWest()+"&UserNorthSouth="+fileHoro.getNorthSouth()+"&UserDST="+fileHoro.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan(fileHoro)+"&UserKPHorarySeed="+fileHoro.getKPHorarySeed()+"&LanguageCode="+fileHoro.getLanguageCode()+"&RefVal="+java.net.URLEncoder.encode(refVal);
 session.setAttribute("userDetails", userDetails);
 currentChartName = fileHoro.getName();
	}
	else
	{
		currentChartName = "";
		userDetails = "";
	}
	
 Object objfile = session.getAttribute("constants");
 MyProperties fileConstants = null;
 if(objfile != null)
 {
	 fileConstants = (MyProperties) objfile;
 }
 else
 {
	 fileConstants = new MyProperties(fileLocal.loadPropertiesFile("constants", fileLang));
 	session.setAttribute("constants", fileConstants);
 }
	
%>

<%
	UserDAO udao=new UserDAO();
	int loginLang = Util.safeInt(session.getAttribute("languageCode"));
	MyResourceBundle rBLoginMenu = fileLocal.loadPropertiesFileNew("loginmenu", loginLang);	
	MyResourceBundle rBLeftMenu = fileLocal.loadPropertiesFileNew("leftmenu", loginLang);
	String menuUserDetails = "";
	Object userObj = session.getAttribute("userDetails");
	if(userObj != null)
	{
		menuUserDetails = userObj.toString();
	}

//Get current plan id
String getCrrentPlanId= "";
if(session.getAttribute("planid")!=null && !session.getAttribute("planid").equals("")){
	getCrrentPlanId = String.valueOf(session.getAttribute("planid"));
}else{
	getCrrentPlanId = "";
}

//For male, female and profile icons
 String getMaleFemaleIcon = "";


if(fileHoro!=null && fileHoro.getMaleFemale() != null && fileHoro.getMaleFemale().toLowerCase().equals("male")){
	getMaleFemaleIcon = "ic_male.png";
}
else if (fileHoro!=null && fileHoro.getMaleFemale() != null && fileHoro.getMaleFemale().toLowerCase().equals("f")) {
	getMaleFemaleIcon = "ic_female.png";
	//System.out.print(fileHoro.getMaleFemale());
}
else{
	getMaleFemaleIcon = "ic_profile_view.png";	
	//System.out.print("none");
} 

String getChartNaameMenu = "";
String namePrefix = "";
if(fileLang == 1){	
	namePrefix = " की"; 
}else{	
	namePrefix = "'s";
}
if(session.getAttribute("HoroscopeObj")!=null){   
	String str = fileHoro.getName();	
	if(str.length()>=15){		
		getChartNaameMenu = str.substring(0,15) + "..."+namePrefix;
	}
	else{
		getChartNaameMenu = str + namePrefix;
		}
}
else{	
	getChartNaameMenu = "";  
}

%>			
     <aside id="left-sidebar-nav">       
               <ul id="slide-out" class="side-nav fixed leftside-navigation active">  
               <%if(Util.isMobileDevice(request)) { %>
               <li class="menu-brand">
               <a href="https://www.astrosage.com/" class="brand-logo darken-1 logo logo-wrapper">
                      <img src="images/icons/logo-white.png" alt="AstroSage logo" class="responsive-img">                  
                </a>
                <a href="javascript:void(0);" data-activates="slide-out" class="right closelm"><i class="material-icons white-text">close</i></a>
                
               </li>  
               <%} %> 
                                              
                  <li>                  
                  <ul class="collapsible" data-collapsible="accordion">
                   <%if(session.getAttribute("HoroscopeObj")!=null){ %>
               
                        <li class="bold">
                           <a class="collapsible-header waves-effect waves-cyan">
                           <span class="nav-text"><%=getChartNaameMenu %> <%=fileConstants.getString("KUNDLI") %></span>                           
                           </a>
                           <div class="collapsible-body user-details">  
                     <div class="row">
                                                                  
                      
                        <div class="col s12">                            
                             <p class="white-text">
                             
                             <%
                              out.print(fileConstants.getString("DAT")+ ": " + getFullMonthName(fileHoro.getMonthOfBirth(), loginLang) +" "+ fileHoro.getDayOfBirth() + ", " + fileHoro.getYearOfBirth());
                             %>
                             </p>       
                             <p class="white-text">
                             <% 
                             out.print(fileConstants.getString("TIM")+ ": " + fileHoro.getHourOfBirth() +" : "+ fileHoro.getMinuteOfBirth() +" : "+ fileHoro.getSecondOfBirth());
                              %>
                              </p> 
                                                            
                              <p class="white-text">
                             <%                          	  
                            
                           	out.print(fileConstants.getString("PLAC")+ ": " + fileHoro.getPlace() + " | ");  
                            out.print(fileHoro.getDegreeOfLongitude() +""+ fileHoro.getEastWest() + "" + fileHoro.getMinuteOfLongitude() +" | "+ fileHoro.getDegreeOfLattitude() +""+ fileHoro.getNorthSouth() + "" + fileHoro.getMinuteOfLattitude());
                            %>                                  
                                                                                         
                             </p>
                             
                           
                        </div>
                        
                     </div>
                     </div>
                     </li>
                      <%
                           } 
                           %>
                           
                           
                           
                        <li class="bold">
                           <a class="collapsible-header waves-effect waves-cyan">
                           <span class="nav-text"><%=rBFileMenu.getString("PROFILE_MENU") %></span>
                           </a>
                           <div class="collapsible-body user-details center-align">  
                     <div class="row">
                        <div class="col s12">
                           <img src="images/icons/<%=getMaleFemaleIcon %>" alt="" class="responsive-img valign profile-image">                           
                        </div>                       
                      
                        <div class="col s12">
                         <% if(session.getAttribute("User_Id")!= "" && session.getAttribute("User_Id")!= null){ %>
                           <div class="dtl-profile"> 
                           <a href="javascript:popupvisibility();" class="waves-effect btn-flat left">                           	
							<%if (getCrrentPlanId.equals("2") || getCrrentPlanId.equals("4") || getCrrentPlanId.equals("5")){%>
								Silver Plan
							<%}
							 else if (getCrrentPlanId.equals("3") || getCrrentPlanId.equals("6") || getCrrentPlanId.equals("7")) { %>
							  	Gold Plan
							<%}
							 else if (getCrrentPlanId.equals("8") || getCrrentPlanId.equals("9") || getCrrentPlanId.equals("10")) { %>
							  	Dhruv Plan
							<%}
							  else{ %>
							  	Basic Plan
							<%} %>							
							</a>
                           	<b class="right"><%=userName %></b>
                           	
                           </div>
                           <%} %>                     
                             
                           
                        </div>
                        <% if(session.getAttribute("User_Id")!= "" && session.getAttribute("User_Id")!= null){ %>
                        <div class="col s12">
                           <ul class="inline-style hover-inline">
                              
                              <li> 
                                 <a class="tooltipped" data-position="top" data-delay="50" data-tooltip="<%=fileConstants.getString("EDIT_PROFILE") %>" href="edituserprofile.asp"> <i class="material-icons">edit</i></a>
                              </li>
                              <li> 
                                 <a class="tooltipped" data-position="top" data-delay="50" data-tooltip="<%=rBLoginMenu.getString("TELL_YOUR_FRIENDS_ABOUT_ASTROSAGE") %>" href="friend.asp"><i class="material-icons">share</i></a>
                              </li>                              
                              <li> 
                                 <a class="tooltipped" data-position="top" data-delay="50" data-tooltip="<%=rBLoginMenu.getString("LOGOUT")%>" href="logout.jsp"> <i class="material-icons">power_settings_new</i></a>
                              </li>
                           </ul>
                        </div>
                        <%
                        }else{
                        %>
                        <div class="margin-all">
                        	<a class="btn waves-effect white black-text btn-block modal-trigger" href="#signin-popup"><%=fileConstants.getString("LOGIN")%></a>
                        </div>
                        <%} %>
                     </div>
                     </div>
                     </li>
                                         
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=rBFileMenu.getString("FILEVAL")%></span>
                           </a>
                           
                           <div class="collapsible-body">
                              <ul>
                                 <li> <a class="truncate" href="session-destroy-for-newchart.asp?methodName=newChart"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("NEW_CHART")%></a> </li>
                                 <li> <a class="truncate" href="javascript:void(0);" onClick="openChart('open');"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("OPEN_CHART") %></a> </li>
                                 <li> <a class="truncate" href="javascript:void(0);" onClick="savechart();"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("SAVCHART") %></a>  </li>
                                 <li> <a class="truncate" href="javascript:void(0);" onClick="openLoginForm();"> <i class="material-icons">&#xe315;</i> <%=rBFileMenu.getString("SAVE_AND_SHARE") %></a>  </li>
                                 <%if(session.getAttribute("ChartId")!=null && session.getAttribute("ChartId")!=""){ %>
                                 <li> <a class="truncate" href="javascript:void(0);" onclick="markDefaultChart('<%=session.getAttribute("User_Id")%>','<%=session.getAttribute("ChartId")%>');""> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("MAKE_DEFAULT") %></a> </li>
                                 <%} %>
                                 <li> <a class="truncate" href="javascript:void(0);" onClick="openprintdialog();"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT") %></a> </li>
                                 <li> <a class="truncate" href="javascript:void(0);" onClick="popupvisibility();"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("UPGRADE_TO_PAID_PLAN")%></a> </li>
                                 <%out.println(Cookies_GetRecentOpenChart(request, response));%> 
                              </ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("EDIT") %></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                 <li> <a class="truncate" href="editchart.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("EDIT_CHART") %></a> </li>
                                 <li> <a class="truncate" href="#" onClick="openChart('manage');"> <i class="material-icons">&#xe315;</i> <%=rBFileMenu.getString("CHART_MANAGEMENT") %></a> </li>
                              </ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=rBLeftMenu.getString("PRINT_LIFE_REPORT")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                 <li><a class="truncate" href="download-kundli.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_KUNDLI")%></a>  </li>
                                 <li><a class="truncate" href="lagna-navamsa-jpeg-chart.asp" onClick="_gaq.push(['_trackEvent', 'print_page', 'Save_Chart_as_image']);" title="Print, Embed or Share Chart on Facebook / Twitter"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("SAVE_CHART")%></a> </li>
                              </ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("CALCULATIONS")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                <li><a class="truncate" href="home.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("WELCOME_PAGE")%></a></li>
								<li><a class="truncate" href="birth-details.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("BASIC_DETAILS")%></a></li>
								<li><a class="truncate" href="planetposition.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PLANETARY_POSITION")%></a></li>
								<li><a class="truncate" href="chart.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAGNA_CHANDRA_CHARTS")%></a></li>
								<li><a class="truncate" href="chalittable.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("CHALIT_TABLE_CHART")%></a></li>
								<li><a class="truncate" href="prastharashtakvarga.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRASTHARASHTAKVARGA_TABLE")%></a></li>
								<li><a class="truncate" href="ashtaktable.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("ASHTAK_VARGA_TABLE")%></a></li>
								<li><a class="truncate" href="getplanettoplanetaspectwestern.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PLANET_TO_PLANET_ASPECT")%></a></li>
								<li><a class="truncate" href="bhavmadhya.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("ASPECT_ON_BHAV_MADHYA")%></a></li>
								<li><a class="truncate" href="kpcusp.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("ASPECT_ON_KP_CUSP")%></a></li>
								<li><a class="truncate" href="svklagna.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("SHODASHVARGA_CHARTS")%></a></li>
								<li><a class="truncate" href="shodashvargatable.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("SHODASHVARGA_TABLE")%></a></li>
								<li><a class="truncate" href="friendship.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("FRIENDSHIP_TABLE")%></a></li>
								<li><a class="truncate" href="vimshottaridasha.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
								<li><a class="truncate" href="shadandbhav.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("SHADBALA_BHAVBALA")%></a></li>
								<li><a class="truncate" href="charantardasha1.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("CHAR_DASHA")%></a></li>
								<li><a class="truncate" href="yoginidasha1.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOGINI_DASHA")%></a></li>
								<li><a class="truncate" href="westernsystem.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("WESTERN_SYSTEM")%></a></li>
								<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_1_pdf']);" href="vedic-chart-pdf.asp?page=3" title="PDF Format"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_FORMAT_1")%> - <%=fileConstants.getString("PDF") %></a></li>
								<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_2_low']);" href="j_lagnadivision.jsp" title="Low Print Quality/ Fast Download"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_FORMAT_2")%> - Low</a></li>
<%
								DesktopHoro objhoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
								
								if(objhoro == null || objhoro.equals(""))
								{
%>
									<li><a class="truncate" target="_blank" href="javascript:void(0);" onClick="openLoginForm();" title="PDF Format"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_SHODASHVARGA")%> - <%=fileConstants.getString("PDF") %></a></a></li>           
<%
								}
								else
								{
%>
								<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_pdf']);" href="vedic-chart-pdf.asp?page=16" title="PDF Format"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_SHODASHVARGA")%> - <%=fileConstants.getString("PDF") %></a></a></li>
<%
								}
%>
								<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_sarvatobhadra_low']);" target="_blank" href="j_sarvatobhadradegree.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_SARVATOBHADRA_CHAKRA")%></a></li>
								<li><a class="truncate" href="transittodaychart.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("TRANSIT_TODAY")%></a></li>
								<li><a class="truncate" href="astro-sketch.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("ASTRO_SKETCH")%></a></li>
								<li><a class="truncate" href="jaminisystemkarakamsaswamsa.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("KRSWKUNDLI")%></a></li>
								<li><a class="truncate" href="arudhapada.asp"><i class="material-icons">&#xe315;</i> <%=rBArudha.getString("ARUDHA_CHART")%></a></li>
								<li><a class="truncate" href="upgrahchart.asp"><i class="material-icons">&#xe315;</i> <%=planetPositionConstants.getString("UPGRAH_CHART_BETA")%></a></li>
								<li><a class="truncate" href="/cloud/worksheet/"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("WORK_SHEET_AS") %></a></li>
								
                              </ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("PREDICTIONS_REPORTS")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                <li><a class="truncate" href="prediction1.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LIFE_PREDICTIONS")%></a></li>
								<li><a class="truncate" href="love-horoscope.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LOVE_HOROSCOPE")%></a></li>
								<li><a class="truncate" href="career-horoscope.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("CAREER_HOROSCOPE")%></a></li>
								<li><a class="truncate" href="character-horoscope.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("NATURE_HOROSCOPE")%></a></li>
								<li><a class="truncate" href="healthindex.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("HEALTH_INDEX")%></a></li>
								<li><a class="truncate" href="personalized-horoscope.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PERSONALIZED_HOROSCOPE")%></a></li>
								<li><a class="truncate" href="user-key-points.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("KEY_POINTS")%></a></li>
								<li><a class="truncate" href="varshphalallpages.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("VARSHAPHAL")%></a></li>
								<li><a class="truncate" href="lalkitab-varshaphal-prediction.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a></li>
								<li><a class="truncate" href="lalkitab-prediction.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_PREDICTIONS")%></a></li>
								<li><a class="truncate" href="gemstones-report.asp"> <i class="material-icons">&#xe315;</i> <%=fileConstants.getString("GEMSTONES_REPORT")%></a></li>
								<li><a class="truncate" href="jadi-report.asp"><i class="material-icons">&#xe315;</i> <%=rBFileMenu.getString("JADI_REPORT_MENU")%></a></li>
                                <li><a class="truncate" href="rudraksha-report.asp"><i class="material-icons">&#xe315;</i> <%=rBFileMenu.getString("RUDRAKSHA_REPORT_MENU")%></a></li>
                                <li><a class="truncate" href="yantra-report.asp"><i class="material-icons">&#xe315;</i> <%=rBFileMenu.getString("YANTRA_REPORT_MENU")%></a></li>
								<li><a class="truncate" href="manglikdetails.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("MANGLIK_CONSIDERATIONS")%></a></li>
								<li><a class="truncate" href="sadesatireport.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("SHANI_SADE_SATI")%></a></li>
								<li><a class="truncate" class="truncate" href="kalsarpa-yoga.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("KALSHARP_DOSH")%> </a> </li>
								<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'kalsarpayoga_PDF']);" target="_blank" href="vedic-chart-pdf.asp?page=10"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("KALSHARP_DOSH")%> - <%=fileConstants.getString("PDF") %></a></li>
								<li><a class="truncate" href="dasha_phala.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("DASHA_PREDICTIONS")%></a></li>
								<li><a class="truncate" href="babyname.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("BABY_NAMES_SUGGESTION")%></a></li>
								<li><a class="truncate" href="planets-in-vedic-astrology.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PLANETS_CONSIDERATION")%> </a></li>
								<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'PlanetConsidration_PDF']);" target="_blank" href="vedic-chart-pdf.asp?page=11"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PLANETS_CONSIDERATION")%> - <%=fileConstants.getString("PDF") %></a></li>
								<li><a class="truncate" href="transit-today.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("CURRENT_TRANSIT_PREDICTIONS")%></a></li>
								<li><a class="truncate" href="nakshatra-report.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOUR_NAKSHATRA")%></a></li>
								<li><a class="truncate" href="ascendant-prediction.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOUR_ASCENDANT")%> </a></li>
								<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'AscPredictions_PDF']);" target="_blank" href="vedic-chart-pdf.asp?page=12"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOUR_ASCENDANT")%> - <%=fileConstants.getString("PDF") %></a></li>
								<li><a class="truncate" href="moon-sign.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOUR_MOON_SIGN")%></a></li>
								<li><a class="truncate" href="rasi-calculator.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOUR_MOON_SIGN")%> (<%=fileConstants.getString("CLASSICAL")%>)</a></li>
								<li><a class="truncate" href="services.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("ORDER_REPORT")%></a></li>
								<li><a class="truncate" href="ishtdevata.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOUR_ISHT_DEVATA")%></a></li>
						      </ul>
                           </div>
                        </li>
                        
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("NUMEROLOGY")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
		                        <li><a class="truncate" href="numerology-report.asp#keydetails"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("NUM_KEY_DETAILS")%></a></li>
								<li><a class="truncate" href="numerology-report.asp#radicalnumber"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LBL_RADICAL_NUM")%></a></li>
								<li><a class="truncate" href="numerology-report.asp#destinynumber"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LBL_DESTINY_NUM")%></a></li>
								<li><a class="truncate" href="numerology-report.asp#namenumber"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LBL_NAME_NUMBER")%></a></li>
								<li><a class="truncate" href="numerology-report.asp#ausplacetime"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LBL_AUSP_PLACE_TIME")%></a></li>
								<li><a class="truncate" href="numerology-report.asp#healthcareer"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LBL_HEALTH_CAREER")%></a></li>
								<li><a class="truncate" href="numerology-report.asp#fastremedy"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LBL_FAST_REMD")%></a></li>
							   </ul>
                           </div>
                        </li>
                        
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("DASHA")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
		                        <li><a class="truncate" href="vimshottaridasha.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
								<li><a class="truncate" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_dasa_low']);" href="j_dasa.asp" title="Low Print Quality/ Fast Download"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_VIMSHOTTARI_DASA")%> - Low</a></li>
								<li><a class="truncate" href="charantardasha1.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("CHAR_DASHA")%></a></li>
								<li><a class="truncate" href="yoginidasha1.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("YOGINI_DASHA")%></a></li>
								<li><a class="truncate" href="lalkitabdasha.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_DASHA")%></a></li>
                              </ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("LAL_KITAB")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                <li><a class="truncate" href="lalplanethouse.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_CHART_PLANETS_HOUSES")%></a></li>
								<li><a class="truncate" href="lalkitab-debts-teva.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LK_DEBTS_AND_TEVA")%></a></li>
								<li><a class="truncate" href="lalkitab-teva.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LK_TEVA")%></a></li>
								<li><a class="truncate" href="lalkitabdasha.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_DASHA")%></a></li>
								<li><a class="truncate" href="lkitabworksheet2.asp?KundliType=1&isFirst=1"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_WORKSHEET")%></a></li>
								<li><a class="truncate" href="lalkitabvarshaphal.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_VARSHAPHAL")%></a></li>
								<li><a class="truncate" href="lalkitabmonthchart.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_MONTH_CHARTS")%></a></li>
								<li><a class="truncate" href="lalkitabvarshaphalcharts.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_VARSHAPHAL_CHARTS")%></a></li>
								<li><a class="truncate" href="lalkitab-prediction.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_PREDICTIONS")%></a></li>
								<li><a class="truncate" href="lalkitab-varshaphal-prediction.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a></li>
								<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_pdf']);" href="vedic-chart-pdf.jsp?page=13" target="_blank"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("LAL_KITAB_PRINT_PAGE")%> - <%=fileConstants.getString("PDF") %></a></li>
				       		</ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("KP_SYSTEM")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                <li><a class="truncate" href="KPPlanetCusp.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("KP_SYSTEM_PLANETS_CUSPS")%></a></li>
								<li><a class="truncate" href="getplanettoplanetaspectwestern.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PLANET_TO_PLANET_ASPECT")%></a></li>
								<li><a class="truncate" href="kpcusp.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("ASPECT_ON_KPCUSP")%></a></li>
								<li><a class="truncate" href="kpsignirp.asp" onClick="rpManageLink(this)"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("KP_SYSTEM_SIGNIFICATORS_RPS")%></a></li>
								<li><a class="truncate" href="kptoday.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("MY_KP_TODAY")%></a></li>
								<li><a class="truncate" href="vimshottaridasha.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
								<li><a class="truncate" onClick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);" href="vedic-chart-pdf.asp?page=14" target="_blank"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PRINT_KP_REPORT")%></a></li>
								<li><a class="truncate" href="4-step.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("STEP4")%></a></li>
								<li><a class="truncate" href="cil.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("CUSPAL_INTERLINK_SUB")%></a></li>
								<li><a class="truncate" href="kcil.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("KHULLAR_CUSPAL_INTERLINK_SUB")%></a></li>
								<li><a class="truncate" href="nakshatra-nadi.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("NAKSHATRA_NADI")%></a></li>
								<li><a class="truncate" href="planet-sign.asp"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("PLANET_SIGNVIEW2")%></a></li>
						     </ul>
                           </div>
                        </li>
                        
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("MATCH_YOUR_HOROSCOPE")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                <li><a class="truncate" href="matchmaking.asp#tab1"><i class="material-icons">&#xe315;</i> <%=rBFileMenu.getString("ENTER_GIRLS_BOYS_BIRTH_DETAIL") %></a></li>
								<li><a class="truncate" href="matchmaking.asp#tab2"><i class="material-icons">&#xe315;</i> <%=fileConstants.getString("MATCH_WITH_SAVED_CHART") %></a></li>
								<li><a class="truncate" href="matchmaking.asp#tab3"><i class="material-icons">&#xe315;</i> <%=rBFileMenu.getString("MATCH_WITH_SHARED_CHART") %></a></li>
                                </ul>
                           </div>
                        </li>
                        <% Object url = request.getAttribute("javax.servlet.forward.request_uri");
		if(url == null)
		{
			
			url = request.getRequestURL();
		}
		String requestUrl = url.toString() ;
		String query = ""; 
		String methodName = request.getParameter("methodName");
		if(methodName != null && !methodName.equals(""))
		{
			query = "&methodName="+methodName;
		}
		
		%>
                        <li>
                           <a  class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=rBChartStyleFileMenu.getString("CHART_STYLE") %></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                <li><a class="truncate" href='<%=requestUrl + "?charttype=north"+query %>'> <i class="material-icons">&#xe315;</i> <%=rBChartStyleFileMenu.getString("NORTH") %></a></li> 
								<li><a class="truncate" href='<%=requestUrl + "?charttype=south"+query %>'> <i class="material-icons">&#xe315;</i> <%=rBChartStyleFileMenu.getString("SOUTH") %></a></li>
								<li><a class="truncate" href='<%=requestUrl + "?charttype=east"+query %>'>  <i class="material-icons">&#xe315;</i> <%=rBChartStyleFileMenu.getString("EAST") %></a></li>
				              </ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("LANGUAGE") %></span>                           
                           </a>
                           <div class="collapsible-body">
                              <ul>
                                <li><a class="truncate" href='<%=requestUrl + "?LanguageType=hindi"+query %>'> <i class="material-icons">&#xe315;</i>  हिंदी</a>  </li>
								<li><a class="truncate" href='<%=requestUrl + "?LanguageType=english"+query %>'> <i class="material-icons">&#xe315;</i> English</a>  </li>
								<li><a class="truncate" href='<%=requestUrl + "?LanguageType=tamil"+query %>'><i class="material-icons">&#xe315;</i> தமிழ்</a>  </li>
								<li><a class="truncate" href='<%=requestUrl + "?LanguageType=telugu"+query %>'><i class="material-icons">&#xe315;</i> తెలుగు (Beta)</font>)</a> </li>
								<li><a class="truncate" href='<%=requestUrl + "?LanguageType=bengali"+query %>'><i class="material-icons">&#xe315;</i> বাংলা (Beta)</a> </li>
							    <li><a class="truncate" href='<%=requestUrl + "?LanguageType=gujarati"+query %>'><i class="material-icons">&#xe315;</i>ગુજરાતી  (Beta)</a> </li>
							    <li><a class="truncate" href='<%=requestUrl + "?LanguageType=kannada"+query %>'><i class="material-icons">&#xe315;</i>  ಕನ್ನಡ (Beta)</a> </li>
							    <li><a class="truncate" href='<%=requestUrl + "?LanguageType=malayalam"+query %>'><i class="material-icons">&#xe315;</i> മലയാളം (Beta)</a> </li>
							    <li><a class="truncate" href='<%=requestUrl + "?LanguageType=marathi"+query %>'><i class="material-icons">&#xe315;</i> मराठी (Beta)</a> </li>
				              
                              </ul>
                           </div>
                        </li>
                        <li>
                           <a class="collapsible-header waves-effect waves-cyan truncate">
                           <span class="nav-text"><%=fileConstants.getString("PAID_CONSULTATION")%></span>
                           </a>
                           <div class="collapsible-body">
                              <ul>
                              <li><a class="truncate" href="http://buy.astrosage.com/?prtnr_id=ASCLD" target="_blank"> <i class="material-icons">&#xe315;</i><%=fileConstants.getString("PAID_CONSULTATION")%></a></li>
                              </ul>
                           </div>
                        </li>
                        <li>
                        	<a href="/cloud/redirecttocloud.jsp?languagecode=<%=fileLang%>" onclick="getEvents('click-oldver-ticker-cloud', 'oldver-redirect');"><%=rBNotificationBarinMenu.getString("OLDER_VERSION") %><i class="material-icons right white-text" style="margin-right:-4px;">&#xe315;</i></a>
                        </li>                        
                        
                     </ul>
                  </li>
                  
                  
                  <li class="pdgb"></li>
                                   
               </ul>
              
            </aside>
            
            
            
<script type="text/javascript">
    function markDefaultChart(userid, chartid) {   
    	sendurl = "methodName=markDefaultChart&userchartidentity=" + chartid + "&useridentity=" + userid;
        var getObjReturnreports = $.get("ChartServlet", sendurl, function (data, status, xhr) {
            if (data == "0") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<i class="material-icons medium red-text">error_outline</i><div class="ui-success-msg"><%=fileConstants.getString("RECORD_NOT_FOUND_MISMATCH_USER_AND_CHART_ID") %></div>');
                $('#dialog-form-default-chart').modal('open');
            }
            else if (data == "1") {
                $('#imgdialog').attr('src', 'images/availableimg.png');
                $('#dynamictext').html('<i class="material-icons medium green-text">check_circle_outline</i><div class="ui-success-msg"><%=fileConstants.getString("CHART_MARKED_DEFAULT1") %>' + " '" + '<%=currentChartName %>' + "'" + '<%=fileConstants.getString("CHART_MARKED_DEFAULT2") %>' + "'" + '<%=session.getAttribute("User_Id") %>' + "'" + '<%=fileConstants.getString("CHART_MARKED_DEFAULT3") %></div>');
                $('#dialog-form-default-chart').modal('open');
            }
            else if (data == "2") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<i class="material-icons medium red-text">error_outline</i><div class="ui-success-msg"><%=fileConstants.getString("ERR_OCCURRED") %></div>');
                $('#dialog-form-default-chart').modal('open');
            }
            else if (data == "3") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<i class="material-icons medium red-text">error_outline</i><div class="ui-success-msg"><%=fileConstants.getString("USER_SESSION_EXPIRED") %></div>');
                $('#dialog-form-default-chart').modal('open');
                //alert('<%=fileConstants.getString("USER_SESSION_EXPIRED") %>');
            }
            else if (data == "4") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<i class="material-icons medium red-text">error_outline</i><div class="ui-success-msg"><%=fileConstants.getString("VALUES_NOT_SUPPLIED") %></div>');
                $('#dialog-form-default-chart').modal('open');
            }
            else if (data == "5") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<i class="material-icons medium red-text">error_outline</i><div class="ui-success-msg"><%=fileConstants.getString("AUTHENTICATION_FAILED") %></div>');
                $('#dialog-form-default-chart').modal('open');
            }
        });
    }
    
    $(document).ready(function() {
    $(".mmd-chart").click(function () {
        $("#dialog-form-default-chart").modal('close');
    });
    });
    
    
</script>

<div id="dialog-form-default-chart" class="modal">
  <div class="model-header amber darken-1">
<h4 class="white-text"><%=fileConstants.getString("MESSAGE") %></h4>
</div>
  <div class="modal-content">	
  
  <div id="dynamictext" class="center-align">
		
	</div>
		
	 <div class="modal-footer">
      <a href="#!" class="modal-action waves-effect waves-red btn-flat text-orange mmd-chart"><%=fileConstants.getString("OKVAL") %></a>      
    </div>
    </div>
</div>

<%!
 
public String Cookies_GetRecentOpenChart(HttpServletRequest request, HttpServletResponse response)
{
	Object obj = request.getSession().getAttribute("User_Id");
	String val="";
	if(obj != null)
	{
		String userId = obj.toString();
		String rstLstCookie = "";
		
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies)
		{
			if(cookie.getName().equals("RstLst"))
			{
				rstLstCookie = cookie.getValue();
				break;
			}
		}
	  
		//System.out.print("Cookies obj  "+rstLstCookie);
		
		if(!rstLstCookie.equals(""))
		{
			DatabaseUtils dbUtils = new DatabaseUtils();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			HashMap<String, String> hm = new HashMap<String, String>();
			String[] originalIdArray = rstLstCookie.split("\\|");
			int arraySize = originalIdArray.length;
			String rstValues = rstLstCookie.replaceAll("\\|",",");
			rstValues = rstValues.replaceAll(",$", "");
			
			String[] names = new String[arraySize];
			String strSql = "select chartid, pname from tbl_chart where chartid in ("+rstValues+") and userid = '"+userId+"'";
			try
			{
				conn = dbUtils.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(strSql);
				int counter = 0;
				while(rs.next())
				{
					String tempName = rs.getString("pname");
					if(tempName.length() > 35)
					{
						tempName = tempName.substring(0,34);
					}
					hm.put(rs.getString("chartid"), tempName);
					counter++;
				}
				for(int i=0;i<originalIdArray.length;i++)
				{
					//response.getWriter().write("<a href='openchart-session.jsp?chartid="+ID[i]+ "' style='font-weight:bold;'>" + names[i]+ "</a>");
					val+="<li><a href='/cloud/ChartServlet?methodName=openChart&ChartId="+originalIdArray[i]+ "'><i class='material-icons'>keyboard_arrow_right</i>" + hm.get(originalIdArray[i])+ "</a></li>";
				}
			}
			catch(Exception sqle)
			{
				sqle.printStackTrace();
			}
			finally
			{
				dbUtils.closeConnection(conn, stmt, rs);
				
			}
			
		}
	}
	return val;
}
%>


<%!     
public String getFullMonthName(int monthNum,int languageCode){      
String monthName;
if(languageCode == 1){
  switch(monthNum){
	case 1:
        monthName = "जनवरी";
        break;
	case 2:
   		monthName = "फरवरी";
   		break;
	case 3:
    	monthName = "मार्च";
    	break;
	case 4:
    	monthName = "अप्रैल";
    	break;
	case 5:
    	monthName = "मई";
    	break;
	case 6:
    	monthName = "जून";
    	break;
	case 7:
    	monthName = "जुलाई";
    	break;
	case 8:
    	monthName = "अगस्त";
    	break;
	case 9:
    	monthName = "सितम्बर";
    	break;
	case 10:
		monthName = "अक्टूबर";
		break;
	case 11:
		monthName = "नवम्बर";
		break;
	case 12:
		monthName = "दिसम्बर"; 
		break;
	default:
	   monthName="";
}
    return(monthName); 
  }
else if(languageCode == 2){
 switch(monthNum){
	case 1:
   		monthName = "ஜனவரி";
   		break;
	case 2:
   		monthName = "பிப்ரவரி";
   		break;
	case 3:
    	monthName = "மார்ச்";
    	break;
	case 4:
    	monthName = "ஏப்ரல்";
    	break;
	case 5:
    	monthName = "மே";
    	break;
	case 6:
    	monthName = "ஜூன்";
    	break;
	case 7:
    	monthName = "ஜூலை";
    	break;
	case 8:
    	monthName = "ஆகஸ்ட்";
    	break;
	case 9:
    	monthName = "செப்டம்பர்";
    	break;
	case 10:
		monthName = "அக்டோபர்";
		break;
	case 11:
		monthName = "நவம்பர்";
		break;
	case 12:
		monthName = "டிசம்பர்" ; 
		break;
	default:
	   monthName="";
}
    return(monthName);
}
else{
switch(monthNum){
   case 1:
   		monthName = "January";
   		break;
   case 2:
   		monthName = "February";
   		break;
   case 3:
    	monthName = "March";
    	break;
   case 4:
    	monthName = "April";
    	break;
   case 5:
    	monthName = "May";
    	break;
   case 6:
    	monthName = "June";
    	break;
   case 7:
    	monthName = "July";
    	break;
   case 8:
    	monthName = "August";
    	break;
   case 9:
    	monthName = "September";
    	break;
   case 10:
		monthName = "October";
		break;
   case 11:
		monthName = "November";
		break;
   case 12:
		monthName = "December";   
		break;
   default:
	   monthName="";
}
    return(monthName);   
}    
    }
      %>