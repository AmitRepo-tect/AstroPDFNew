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

MyResourceBundle rBFileMenu = fileLocal.loadPropertiesFileNew("filemenu", fileLang);
//ResourceBundle rBLeftBasicDetailsFileMenu = local.ResourceBundle("leftmenu-basicdetails-filemenu");
MyResourceBundle rBChartStyleFileMenu = fileLocal.loadPropertiesFileNew("filemenu-chartstyle", fileLang);
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
 /*Object obj9 = session.getAttribute("constants");
 if(obj9 == null)
 {
	 fileConstants = fileLocal.loadPropertiesFileNew("constants",fileLang);
 	request.setAttribute("constants", fileConstants);
 }
 else
 {
	 fileConstants = (MyResourceBundle) obj9;
 }*/
	
%>
<div id="topnav">
	<ul id="topul">
		<li class="active bottom"
			onmouseover="removedefault('home','hometext' , 'arow');" id="home">
			<a href="#" id="hometext"><%=rBFileMenu.getString("FILEVAL")%> <i
				class="ui-css3arrow" id="arow"></i></a> 
				<span>
				<div class="menu-arrow arrow1<%=arrowClass %>"></div> 
				<a href="session-destroy-for-newchart.asp?methodName=newChart"><%=fileConstants.getString("NEW_CHART")%></a>
				<a href="#" onclick="openChart('open');"><%=fileConstants.getString("OPEN_CHART") %></a>
				<a href="#" onclick="savechart();"><%=fileConstants.getString("SAVCHART") %></a>
				<a href="#" onclick="openLoginForm();"><%=rBFileMenu.getString("SAVE_AND_SHARE") %></a>
				<%if(session.getAttribute("ChartId")!=null && session.getAttribute("ChartId")!=""){ %>
				<a href="#"
				onclick="markDefaultChart('<%=session.getAttribute("User_Id")%>','<%=session.getAttribute("ChartId")%>');""><%=fileConstants.getString("MAKE_DEFAULT") %></a>
				<!-- It will be opened when all files will be converted <a href="#" onclick="markDefaultChart('<%//=session.getAttribute("userId")%>','<%//=session.getAttribute("chartId")%>');"><%//=fileConstants.getString("MAKE_DEFAULT") %></a> -->
				<%} %> <a href="#" onclick="openprintdialog();"><%=fileConstants.getString("PRINT") %></a>
				<a onclick=popupvisibility(); style="cursor: pointer"><%=fileConstants.getString("UPGRADE_TO_PAID_PLAN")%></a>
				<!-- <a href='openchart-session.jsp?chartid="+ID[i]+ "' style='font-weight:bold;'>" + names[i]+ "</a> -->
				<!-- <a href='openchart-session.jsp?chartid=1' style='font-weight:bold;'>SMRITI</a> -->
				<%
				out.println(Cookies_GetRecentOpenChart(request, response));
				%>          
           
		</span>
		</li>

		<li class="bottom"
			onmouseover="removedefault('horoscope','edit', 'arow1');"
			id="horoscope"><a href="#" id="edit"><%=fileConstants.getString("EDIT") %>
				<i class="ui-css3arrow" id="arow1"></i></a> <span>
				<div class="menu-arrow arrow2<%=arrowClass %>"></div> <a
				href="editchart.asp"><%=fileConstants.getString("EDIT_CHART") %></a>
				<a href="#" onclick="openChart('manage');"><%=rBFileMenu.getString("CHART_MANAGEMENT") %>...</a>
		</span></li>
		<li class="bottom"
			onmouseover="removedefault('astrology','predictions','arow2');"
			id="astrology"><a href="#" class="fixed" id="predictions"><%=fileConstants.getString("PREDICTIONS")%><i
				class="ui-css3arrow" id="arow2"></i></a> <span>
				<div class="menu-arrow arrow3<%=arrowClass%>"></div> <a
				href="planets-in-vedic-astrology.asp"><%=fileConstants.getString("PLANETS_CONSIDERATION")%></a>
				<a href="ascendant-prediction.asp"><%=fileConstants.getString("YOUR_ASCENDANT")%></a>
				<a href="kalsarpa-yoga.asp"><%=fileConstants.getString("KALSHARP_DOSH")%></a>
				<a href="prediction1.asp"><%=fileConstants.getString("LIFE_PREDICTIONS")%></a>
				<a href="varshphalallpages.asp"><%=fileConstants.getString("VARSHAPHAL")%></a>
				<a href="manglikdetails.asp"><%=fileConstants.getString("MANGLIK_CONSIDERATIONS")%></a>
				<a href="transit-today.asp"><%=fileConstants.getString("CURRENT_TRANSIT_PREDICTIONS")%></a>
				<a href="lalkitab-prediction.asp"><%=fileConstants.getString("LAL_KITAB_PREDICTIONS")%></a>
				<a href="lalkitab-varshaphal-prediction.asp"><%=fileConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a>
				<a href="dasha_phala.asp"><%=fileConstants.getString("DASHA_PREDICTIONS")%></a>
				<a href="babyname.asp"><%=fileConstants.getString("BABY_NAMES_SUGGESTION")%></a>
		</span></li>
		<li class="bottom"
			onmouseover="removedefault('horoscopereports','reports','arow3');"
			id="horoscopereports"><a href="#" id="reports"><%=fileConstants.getString("REPORTS")%>
				<i class="ui-css3arrow" id="arow3"></i></a> <span>
				<div class="menu-arrow arrow4<%=arrowClass %>"></div> <a
				href="sadesatireport.asp"><%=fileConstants.getString("SHANI_SADE_SATI")%></a>
				<a href="gemstones-report.asp"><%=fileConstants.getString("GEMSTONES_REPORT")%></a>
				<a href="love-horoscope.asp"><%=fileConstants.getString("LOVE_HOROSCOPE")%></a>
				<a href="career-horoscope.asp"><%=fileConstants.getString("CAREER_HOROSCOPE")%></a>
				<a href="character-horoscope.asp"><%=fileConstants.getString("NATURE_HOROSCOPE")%></a>
				<a href="moon-sign.asp"><%=fileConstants.getString("YOUR_MOON_SIGN")%></a> 
				<a href="rasi-calculator.asp"><%=fileConstants.getString("YOUR_MOON_SIGN")%>(<%=fileConstants.getString("CLASSICAL")%>)</a>
				<a href="personalized-horoscope.asp"><%=fileConstants.getString("PERSONALIZED_HOROSCOPE")%></a>
				<a href="nakshatra-report.asp"><%=fileConstants.getString("YOUR_NAKSHATRA")%></a>
				<a href="astro-sketch.asp"><%=fileConstants.getString("ASTRO_SKETCH")%></a>
				<a href="services.asp" style="color: red;"><%=fileConstants.getString("ORDER_REPORT")%></a>
		</span></li>
		<li class="bottom"
			onmouseover="removedefault('2013report','general','arrow4');"
			id="2013report"><a href="#" id="general"><%=fileConstants.getString("CALCULATIONS")%>
				<i class="ui-css3arrow" id="arrow4"></i></a> <span>
				<div class="menu-arrow arrow5<%=arrowClass %>"></div> <a
				href="home.asp"><%=fileConstants.getString("WELCOME_PAGE")%></a>
				<a href="birth-details.asp"><%=fileConstants.getString("BASIC_DETAILS")%></a>
				<a href="planetposition.asp"><%=fileConstants.getString("PLANETARY_POSITION")%></a>
				<a href="chart.asp"><%=fileConstants.getString("LAGNA_CHANDRA_CHARTS")%></a>
				<a href="chalittable.asp"><%=fileConstants.getString("CHALIT_TABLE_CHART")%>
			    <a href="prastharashtakvarga.asp"><%=fileConstants.getString("PRASTHARASHTAKVARGA_TABLE")%></a>
				<a href="ashtaktable.asp"><%=fileConstants.getString("ASHTAK_VARGA_TABLE")%></a>
				<a href="getplanettoplanetaspectwestern.asp"><%=fileConstants.getString("PLANET_TO_PLANET_ASPECT")%></a>
				<a href="bhavmadhya.asp"><%=fileConstants.getString("ASPECT_ON_BHAV_MADHYA")%></a>
				<a href="kpcusp.asp"><%=fileConstants.getString("ASPECT_ON_KP_CUSP")%></a>
				<a href="svklagna.asp"><%=fileConstants.getString("SHODASHVARGA_CHARTS")%></a>
				<a href="shodashvargatable.asp"><%=fileConstants.getString("SHODASHVARGA_TABLE")%></a>
				<a href="friendship.asp"><%=fileConstants.getString("FRIENDSHIP_TABLE")%></a>
				<a href="vimshottaridasha.asp"><%=fileConstants.getString("VIMSHOTTARI_DASHA")%></a>
				<a href="shadandbhav.asp"><%=fileConstants.getString("SHADBALA_BHAVBALA")%></a>
				<a href="charantardasha1.asp"><%=fileConstants.getString("CHAR_DASHA")%></a>
				<a href="yoginidasha1.asp"><%=fileConstants.getString("YOGINI_DASHA")%></a>
				<a href="westernsystem.asp"><%=fileConstants.getString("WESTERN_SYSTEM")%></a>
				<a href="transittodaychart.asp"><%=fileConstants.getString("TRANSIT_TODAY")%></a>
				<a href="jaminisystemkarakamsaswamsa.asp"><%=fileConstants.getString("KRSWKUNDLI")%></a>
				<a href="/cloud/worksheet/"><%=fileConstants.getString("WORK_SHEET_AS")%></a>
		</span></li>

		<li class="bottom"
			onmouseover="removedefault('techniques','dasha','arow5');"
			id="techniques"><a href="#" id="dasha"><%=fileConstants.getString("DASHA")%>
				<i class="ui-css3arrow" id="arow5"></i></a> <span>
				<div class="menu-arrow arrow6<%=arrowClass %>"></div> <a
				href="vimshottaridasha.asp"><%=fileConstants.getString("VIMSHOTTARI_DASHA")%></a>
				<a href="charantardasha1.asp"><%=fileConstants.getString("CHAR_DASHA")%></a>
				<a href="yoginidasha1.asp"><%=fileConstants.getString("YOGINI_DASHA")%></a>
				<a href="lalkitabdasha.asp"><%=fileConstants.getString("LAL_KITAB_DASHA")%></a>
		</span></li>

		<li class="bottom"
			onmouseover="removedefault('freereports','lalkitab','arow6');"
			id="freereports"><a href="#" class="fixed" id="lalkitab"><%=fileConstants.getString("LAL_KITAB")%> <%=rBFileMenu.getString("AND_KP") %>
				<i class="ui-css3arrow" id="arow6"></i></a> <span>
				<div class="menu-arrow arrow7<%=arrowClass %>"></div> <a
				href="lalplanethouse.asp"><%=fileConstants.getString("LAL_KITAB_CHART_PLANETS_HOUSES")%></a>
				<a href="lalkitab-debts-teva.asp"><%=fileConstants.getString("LK_DEBTS_AND_TEVA")%></a>
				<a href="lalkitab-teva.asp"><%=fileConstants.getString("LK_TEVA")%></a>
				<a href="lalkitabdasha.asp"><%=fileConstants.getString("LAL_KITAB_DASHA")%></a>
				<a href="lkitabworksheet2.asp?KundliType=1&isFirst=1"><%=fileConstants.getString("LAL_KITAB_WORKSHEET")%></a>
				<a href="lalkitabvarshaphal.asp"><%=fileConstants.getString("LAL_KITAB_VARSHAPHAL")%></a>
				<a href="lalkitabmonthchart.asp"><%=fileConstants.getString("LAL_KITAB_MONTH_CHARTS")%></a>
				<a href="lalkitabvarshaphalcharts.asp"><%=fileConstants.getString("LAL_KITAB_VARSHAPHAL_CHARTS")%></a>
				<a href="lalkitab-prediction.asp"><%=fileConstants.getString("LAL_KITAB_PREDICTIONS")%></a>
				<a href="lalkitab-varshaphal-prediction.asp"><%=fileConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a>
				<a href="KPPlanetCusp.asp"><%=fileConstants.getString("KP_SYSTEM_PLANETS_CUSPS")%></a>
				<a href="kpcusp.asp"><%=fileConstants.getString("ASPECT_ON_KPCUSP")%></a>
				<a href="getplanettoplanetaspectwestern.asp"><%=fileConstants.getString("PLANET_TO_PLANET_ASPECT")%></a>
				<a href="kpsignirp.asp" onClick="rpManageLink(this)"><%=fileConstants.getString("KP_SYSTEM_SIGNIFICATORS_RPS")%></a>
				<a href="kptoday.asp"><%=fileConstants.getString("MY_KP_TODAY")%></a>
				<!-- <a href="vimshottaridasha.asp"><%=fileConstants.getString("VIMSHOTTARI_DASHA")%></a> -->
			<%-- 	<!--<a onClick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);" href="p_kpfull.jsp" target="_blank"><%=fileConstants.getString("PRINT_KP_REPORT")%></a>--> --%>
		</span></li>
		<li class="bottom"
			onmouseover="removedefault('pdfjpgprint','pdfjpg','arow7');"
			id="pdfjpgprint"><a href="#" id="pdfjpg"><%=fileConstants.getString("PDF").toUpperCase() %>/<%=fileConstants.getString("JPEG").toUpperCase()%><i
				class="ui-css3arrow" id="arow7"></i></a> <span>
				<div class="menu-arrow arrow8<%=arrowClass %>"></div> <a
				href="download-kundli.asp"><%=fileConstants.getString("PRINT_KUNDLI")%></a>
				<a href="lagna-navamsa-jpeg-chart.asp"
				onClick="_gaq.push(['_trackEvent', 'print_page', 'Save_Chart_as_image']);"
				title="Print, Embed or Share Chart on Facebook / Twitter"><%=fileConstants.getString("SAVE_CHART")%></a>
				<!--<a onClick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);" href="p_kpfull.jsp" target="_blank"><%//=fileConstants.getString("PRINT_KP_REPORT")%></a>-->
				<a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_1_pdf']);"
				target="_blank" href="vedic-chart-pdf.jsp?page=3" title="PDF Format">
					<%=fileConstants.getString("PRINT_FORMAT_1")%> - <%=fileConstants.getString("PDF") %></a>
				<!--  <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_1_low']);"
				target="_blank" href="j_lagnapage.asp"
				title="Low Print Quality/ Fast Download"><%//=fileConstants.getString("PRINT_FORMAT_1")%>
					- <%//=fileConstants.getString("JPEG") %></a>--> <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_2_low']);"
				target="_blank" href="j_lagnadivision.asp"
				title="Low Print Quality/ Fast Download"><%=fileConstants.getString("PRINT_FORMAT_2")%>
					- low</a> <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_pdf']);"
				target="_blank"
				href="vedic-chart-pdf.jsp?page=16"
				title="PDF Format"><%=fileConstants.getString("PRINT_SHODASHVARGA")%>
					- <%=fileConstants.getString("PDF") %></a> <!-- <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_low']);"
				target="_blank" href="j_shodashvarga.asp"
				title="Low Print Quality/ Fast Download"><%//=fileConstants.getString("PRINT_SHODASHVARGA")%>
					- <%=fileConstants.getString("JPEG") %></a> --> <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_sarvatobhadra_low']);"
				target="_blank" href="j_sarvatobhadradegree.asp"><%=fileConstants.getString("PRINT_SARVATOBHADRA_CHAKRA")%></a>
				<a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'kalsarpayoga_PDF']);"
				target="_blank" href="vedic-chart-pdf.jsp?page=10"><%=fileConstants.getString("KALSHARP_DOSH").replace("/ Yog" , "")%>
					- <%=fileConstants.getString("PDF") %></a> <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'PlanetConsidration_PDF']);"
				target="_blank" href="vedic-chart-pdf.jsp?page=11"><%=fileConstants.getString("PLANETS_CONSIDERATION")%>
					- <%=fileConstants.getString("PDF") %></a> <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'AscPredictions_PDF']);"
				target="_blank" href="vedic-chart-pdf.jsp?page=12"><%=fileConstants.getString("YOUR_ASCENDANT")%>
					- <%=fileConstants.getString("PDF") %></a> <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_dasa_low']);"
				target="_blank" href="j_dasa.jsp"
				title="Low Print Quality/ Fast Download"><%=fileConstants.getString("PRINT_VIMSHOTTARI_DASA")%>
					- low</a> <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_pdf']);"
				href="vedic-chart-pdf.jsp?page=13" target="_blank"><%=fileConstants.getString("LAL_KITAB_PRINT_PAGE")%>
					- <%=fileConstants.getString("PDF") %></a><!--  <a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_low']);"
				href="j_lalkitab.jsp" target="_blank"><%//=fileConstants.getString("LAL_KITAB_PRINT_PAGE")%>
					- <%=fileConstants.getString("JPEG") %></a>  --><a
				onClick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);"
				href="vedic-chart-pdf.jsp?page=14" 
				target="_blank"><%=fileConstants.getString("PRINT_KP_REPORT")%></a>
		</span></li>
		<li class="bottom"
			onmouseover="removedefault('regionalastro','horoscopematch','arow8');"
			id="regionalastro"><a href="#" class="fixed" id="horoscopematch"><%=fileConstants.getString("MATCH_YOUR_HOROSCOPE")%>
				<i class="ui-css3arrow" id="arow8"></i></a> <span>
				<div class="menu-arrow arrow9<%=arrowClass %>"></div> <a
				href="matchmaking.asp?tab1"><%=rBFileMenu.getString("ENTER_GIRLS_BOYS_BIRTH_DETAIL") %></a>
				<a href="matchmaking.asp?tab2"><%=fileConstants.getString("MATCH_WITH_SAVED_CHART") %></a>
				<a href="matchmaking.asp?tab3"><%=rBFileMenu.getString("MATCH_WITH_SHARED_CHART") %></a>
		</span></li>
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
		<li class="bottom"
			onmouseover="removedefault('healing','products','arow9');"
			id="healing"><a href="#" id="products"><%=fileConstants.getString("SETING") %>
				<i class="ui-css3arrow" id="arow9"></i></a> <span>
				<div class="menu-arrow arrow10<%=arrowClass %>"></div> <a
				href='<%=requestUrl + "?charttype=north"+query %>'><b><%=rBChartStyleFileMenu.getString("CHART_STYLE") %>:</b>
					<%=rBChartStyleFileMenu.getString("NORTH") %></a> <a
				href='<%=requestUrl + "?charttype=south"+query %>'><b><%=rBChartStyleFileMenu.getString("CHART_STYLE") %>:</b>
					<%=rBChartStyleFileMenu.getString("SOUTH") %></a> <a
				href='<%=requestUrl + "?charttype=east"+query %>'><b><%=rBChartStyleFileMenu.getString("CHART_STYLE") %>:</b>
					<%=rBChartStyleFileMenu.getString("EAST") %></a> <a
				href='<%=requestUrl + "?LanguageType=hindi"+query %>'><b>भाषा
						बदलें: </b>हिंदी</a> <a
				href='<%=requestUrl + "?LanguageType=english"+query %>'><b>Change
						Language: </b>English</a> <a
				href='<%=requestUrl + "?LanguageType=tamil"+query %>'><b>Change
						Language: </b>தமிழ்</a> <a
				href='<%=requestUrl + "?LanguageType=telugu"+query %>'><b>Change
						Language: </b>తెలుగు (<font style="text-shadow: none; color: #c03004">Beta</font>)</a>
				<a href='<%=requestUrl + "?LanguageType=bengali"+query %>'><b>Change
						Language: </b>বাংলা (<font style="text-shadow: none; color: #c03004">Beta</font>)</a>
				<a href='<%=requestUrl + "?LanguageType=gujarati"+query %>'><b>Change
						Language: </b>ગુજરાતી (<font style="text-shadow: none; color: #c03004">Beta</font>)</a>
				<a href='<%=requestUrl + "?LanguageType=kannada"+query %>'><b>Change
						Language: </b>ಕನ್ನಡ (<font style="text-shadow: none; color: #c03004">Beta</font>)</a>
				<a href='<%=requestUrl + "?LanguageType=malayalam"+query %>'><b>Change
						Language: </b>മലയാളം (<font style="text-shadow: none; color: #c03004">Beta</font>)</a>
				<a href='<%=requestUrl + "?LanguageType=marathi"+query %>'><b>Change
						Language: </b>मराठी (<font style="text-shadow: none; color: #c03004">Beta</font>)</a>
		</span></li>
	</ul>
</div>
<div id="dialog-form-default-chart" style="border: #000 0px solid;">
	<div class="dialognotification">
		<img src="" id="imgdialog" />
	</div>
	<div align="left" style="border: #000 0px solid; text-align: left;">
		<font size="3" color="maroon"> <b id="dynamictext"></b></font>
	</div>
</div>
<script type="text/javascript">
    function markDefaultChart(userid, chartid) {   
    	sendurl = "methodName=markDefaultChart&userchartidentity=" + chartid + "&useridentity=" + userid;
        var getObjReturnreports = $.get("ChartServlet", sendurl, function (data, status, xhr) {
            if (data == "0") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<%=fileConstants.getString("RECORD_NOT_FOUND_MISMATCH_USER_AND_CHART_ID") %>');
                $('#dialog-form-default-chart').dialog('open');
            }
            else if (data == "1") {
                $('#imgdialog').attr('src', 'images/availableimg.png');
                $('#dynamictext').html('<%=fileConstants.getString("CHART_MARKED_DEFAULT1") %>' + " '" + '<%=currentChartName %>' + "'" + '<%=fileConstants.getString("CHART_MARKED_DEFAULT2") %>' + "'" + '<%=session.getAttribute("User_Id") %>' + "'" + '<%=fileConstants.getString("CHART_MARKED_DEFAULT3") %>');
                $('#dialog-form-default-chart').dialog('open');
            }
            else if (data == "2") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<%=fileConstants.getString("ERR_OCCURRED") %>');
                $('#dialog-form-default-chart').dialog('open');
            }
            else if (data == "3") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<%=fileConstants.getString("USER_SESSION_EXPIRED") %>');
                $('#dialog-form-default-chart').dialog('open');
                //alert('<%=fileConstants.getString("USER_SESSION_EXPIRED") %>');
            }
            else if (data == "4") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<%=fileConstants.getString("VALUES_NOT_SUPPLIED") %>');
                $('#dialog-form-default-chart').dialog('open');
            }
            else if (data == "5") {
                $('#imgdialog').attr('src', 'images/alert.png');
                $('#dynamictext').html('<%=fileConstants.getString("AUTHENTICATION_FAILED") %>');
                $('#dialog-form-default-chart').dialog('open');
            }
        });
    }
    $("#dialog-form-default-chart").dialog(
            {
                autoOpen: false,
                title: '<font size="4"><%=fileConstants.getString("MESSAGE") %></font>',
                height: 180,
                width: 520,
                modal: true,
                open: function (event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '160px');
                    $(event.target).parent().css('center');
                },
                buttons:
                {
                    '<%=fileConstants.getString("OKVAL") %>': function () {
                        $(this).dialog('close');
                    }
                },
                close: function () {
                }
            });
</script>
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
					val+="<a href='/cloud/ChartServlet?methodName=openChart&ChartId="+originalIdArray[i]+ "' style='font-weight:bold;'>" + hm.get(originalIdArray[i])+ "</a>";
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