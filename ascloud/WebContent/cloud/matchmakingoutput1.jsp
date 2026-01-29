<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URL"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.enghoro.EngHoro"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
String redirectTo = "";
try
{
String referer = request.getHeader("Referer");
boolean isAllowed = false;

if(referer != null && !referer.equals(""))
{
	URL url1 = new URL(referer);
	String hostName = url1.getHost();
	for(String domain : ConstantValues.allowedDomains)
	{
		if(Arrays.asList(ConstantValues.allowedDomains).contains(hostName))
		{
			isAllowed = true;
			session.setAttribute("caseOfRefresh", 1);
			break;
		}
	}
}
else if(Util.safeInt(session.getAttribute("caseOfRefresh")) == 1)
{
	redirectTo = "http://ascloud.astrosage.com/cloud/matchmaking.asp";
}
	

if(isAllowed)
{
	int mmoutLang = Util.safeInt(session.getAttribute("languageCode"));
	// When user changes language then querystring gets blank.To maintain the querystring, session(querystring) is created.

	String sex1=Util.safestr(request.getParameter("sex1"));

	String nameboy="";
	String sexboy="";
	String dayboy="";
	String monthboy="0";
	String yearboy="0";
	String hrsboy="0";
	String minboy="0";
	String secboy="";
	String placeboy="";
	String longdegboy="0";
	String longminboy="0";
	String longewboy="";
	String latdegboy="0";
	String latminboy="0";
	String latnsboy="";
	String dstboy="0";
	String timezoneboy="0";
	String namegirl="";
	String sexgirl="";
	String daygirl="0";
	String monthgirl="0";
	String yeargirl="0";
	String hrsgirl="0";
	String mingirl="0";
	String secgirl="0";
	String placegirl="";
	String longdeggirl="0";
	String longmingirl="0";
	String longewgirl="";
	String latdeggirl="0";
	String latmingirl="0";
	String latnsgirl="";
	String dstgirl="0";
	String timezonegirl="0";

	if(request.getParameter("LanguageType") != null || (request.getParameter("charttype")!=null && !("").equals(request.getParameter("charttype"))))
	{
		Cookie[] cookies = request.getCookies();
		HashMap<String, String> hm = new HashMap<String, String>();
		for(Cookie cookie : cookies)
		{
			hm.put(cookie.getName(), URLDecoder.decode(cookie.getValue(), "UTF-8"));
		}
		
		nameboy =  hm.get("nameboy");
		sexboy = hm.get("sexboy");
	    dayboy = hm.get("dayboy");
	    monthboy = hm.get("monthboy"); 
	    yearboy = hm.get("yearboy");  
	    hrsboy = hm.get("hrsboy");
	    minboy = hm.get("minboy");
	    secboy = hm.get("secboy") ;
	    placeboy = hm.get("placeboy") ;
	    longdegboy  = hm.get("longdegboy") ;
	    longminboy  = hm.get("longminboy");
	    longewboy = hm.get("longewboy");
	    latdegboy  = hm.get("latdegboy");
	    latminboy = hm.get("latminboy");
	    latnsboy  = hm.get("latnsboy") ;
	    dstboy =  hm.get("dstboy") ;
	    timezoneboy  = hm.get("timezoneboy") ;
	    
	    namegirl =  hm.get("namegirl") ;
	    sexgirl = hm.get("sexgirl");
	    daygirl = hm.get("daygirl")  ;
	    monthgirl = hm.get("monthgirl") ;
	    yeargirl = hm.get("yeargirl") ; 
	    hrsgirl = hm.get("hrsgirl");
	    mingirl = hm.get("mingirl");
	    secgirl = hm.get("secgirl") ;
	    placegirl = hm.get("placegirl") ;
	    longdeggirl  = hm.get("longdeggirl") ;
	    longmingirl  = hm.get("longmingirl");
	    longewgirl = hm.get("longewgirl");
	    latdeggirl  = hm.get("latdeggirl");
	    latmingirl = hm.get("latmingirl");
	    latnsgirl  = hm.get("latnsgirl") ;
	    dstgirl = hm.get("dstgirl"); 
	    timezonegirl  = hm.get("timezonegirl") ;
	}
	else 
		{
		Object name1Obj = request.getParameter("name1");
		//name1Obj = new String(name1Obj.toString().getBytes("ISO-8859-1"), "UTF-8");
		Object name2Obj = request.getParameter("name2");
		//name2Obj = new String(name2Obj.toString().getBytes("ISO-8859-1"), "UTF-8");
		Object sex1Obj = request.getParameter("sex1");
		Object sex2Obj = request.getParameter("sex2");
		Object day1Obj = request.getParameter("day1");
		Object day2Obj = request.getParameter("day2");
		Object month1Obj = request.getParameter("month1");
		Object month2Obj = request.getParameter("month2");
		Object year1Obj = request.getParameter("year1");
		Object year2Obj = request.getParameter("year2");
		Object hrs1Obj = request.getParameter("hrs1");
		Object hrs2Obj = request.getParameter("hrs2");
		Object min1Obj = request.getParameter("min1");
		Object min2Obj = request.getParameter("min2");
		Object sec1Obj = request.getParameter("sec1");
		Object sec2Obj = request.getParameter("sec2");
		Object place1Obj = request.getParameter("place1");
		Object place2Obj = request.getParameter("place2");
		Object longdeg1Obj = request.getParameter("longdeg1");
		Object longdeg2Obj = request.getParameter("longdeg2");
		Object longmin1Obj = request.getParameter("longmin1");
		Object longmin2Obj = request.getParameter("longmin2");
		Object longew1Obj = request.getParameter("longew1");
		Object longew2Obj = request.getParameter("longew2");
		Object latdeg1Obj = request.getParameter("latdeg1");
		Object latdeg2Obj = request.getParameter("latdeg2");
		Object latmin1Obj = request.getParameter("latmin1");
		Object latmin2Obj = request.getParameter("latmin2");
		Object latns1Obj = request.getParameter("latns1");
		Object latns2Obj = request.getParameter("latns2");
		Object dst1Obj = request.getParameter("dst1");
		Object dst2Obj = request.getParameter("dst2");
		Object timezone1Obj = request.getParameter("timezone1");
		Object timezone2Obj = request.getParameter("timezone2");
		if(name1Obj == null || name2Obj == null || sex1Obj == null || sex2Obj == null || day1Obj == null 
				|| day2Obj == null || month1Obj == null || month2Obj == null || year1Obj == null 
				|| year2Obj == null || hrs1Obj == null || hrs2Obj == null || min1Obj == null 
				|| min2Obj == null || sec1Obj == null ||sec2Obj == null || place1Obj == null
				|| place2Obj == null || longdeg1Obj == null || longdeg2Obj == null || longmin1Obj == null
				|| longmin2Obj == null || longew1Obj == null || longew2Obj == null || latdeg1Obj == null 
				|| latdeg2Obj == null || latmin1Obj == null || latmin2Obj == null || latns1Obj == null 
				|| latns2Obj == null || dst1Obj == null || dst2Obj == null || timezone1Obj == null 
				|| timezone2Obj == null)
		{
	 		String flag = "0";
	 		request.setAttribute("msgVisible",1);
		}
		else if(!sex1.equals(""))
		{
			if(sex1.toLowerCase().equals("male") || sex1.toLowerCase().equals("m"))
			{
				nameboy = name1Obj.toString();
				sexboy = sex1.toString();
				dayboy = day1Obj.toString();
				monthboy = month1Obj.toString();
				yearboy = year1Obj.toString();
				hrsboy = hrs1Obj.toString();
				minboy = min1Obj.toString();
				secboy = sec1Obj.toString();
				placeboy = place1Obj.toString();
				longdegboy = longdeg1Obj.toString();
				longminboy = longmin1Obj.toString();
				longewboy = longew1Obj.toString();
				latdegboy = latdeg1Obj.toString();
				latminboy = latmin1Obj.toString();
				latnsboy = latns1Obj.toString();
				dstboy = Util.safeStringInt(dst1Obj);
				timezoneboy = String.valueOf(Util.safeFloat(timezone1Obj.toString()));
				
				namegirl = name2Obj.toString();
				sexgirl = sex2Obj.toString();
				daygirl = day2Obj.toString();
				monthgirl = month2Obj.toString();
				yeargirl = year2Obj.toString();
				hrsgirl = hrs2Obj.toString();
				mingirl = min2Obj.toString();
				secgirl = sec2Obj.toString();
				placegirl = place2Obj.toString();
				longdeggirl = longdeg2Obj.toString();
				longmingirl = longmin2Obj.toString();
				longewgirl = longew2Obj.toString();
				latdeggirl = latdeg2Obj.toString();
				latmingirl = latmin2Obj.toString();
				latnsgirl = latns2Obj.toString();
				dstgirl = Util.safeStringInt(dst2Obj);
				timezonegirl = String.valueOf(Util.safeFloat(timezone2Obj.toString()));
								
			}
			else
			{
				nameboy = name2Obj.toString();
				sexboy = sex2Obj.toString();
				dayboy = day2Obj.toString();
				monthboy = month2Obj.toString();
				yearboy = year2Obj.toString();
				hrsboy = hrs2Obj.toString();
				minboy = min2Obj.toString();
				secboy = sec2Obj.toString();
				placeboy = place2Obj.toString();
				longdegboy = longdeg2Obj.toString();
				longminboy = longmin2Obj.toString();
				longewboy = longew2Obj.toString();
				latdegboy = latdeg2Obj.toString();
				latminboy = latmin2Obj.toString();
				latnsboy = latns2Obj.toString();
				dstboy = Util.safeStringInt(dst2Obj);
				timezoneboy = String.valueOf(Util.safeFloat(timezone2Obj.toString()));
				
				namegirl = name1Obj.toString();
				sexgirl = sex1.toString();
				daygirl = day1Obj.toString();
				monthgirl = month1Obj.toString();
				yeargirl = year1Obj.toString();
				hrsgirl = hrs1Obj.toString();
				mingirl = min1Obj.toString();
				secgirl = sec1Obj.toString();
				placegirl = place1Obj.toString();
				longdeggirl = longdeg1Obj.toString();
				longmingirl = longmin1Obj.toString();
				longewgirl = longew1Obj.toString();
				latdeggirl = latdeg1Obj.toString();
				latmingirl = latmin1Obj.toString();
				latnsgirl = latns1Obj.toString();
				dstgirl = Util.safeStringInt(dst1Obj);
				timezonegirl = String.valueOf(Util.safeFloat(timezone1Obj.toString()));
			}
		}
			response.addCookie(new Cookie("nameboy", URLEncoder.encode(nameboy, "UTF-8")));
			response.addCookie(new Cookie("sexboy", URLEncoder.encode(sexboy, "UTF-8")));
			response.addCookie(new Cookie("dayboy", URLEncoder.encode(dayboy, "UTF-8")));
			response.addCookie(new Cookie("monthboy", URLEncoder.encode(monthboy, "UTF-8")));
			response.addCookie(new Cookie("yearboy", URLEncoder.encode(yearboy, "UTF-8")));
			response.addCookie(new Cookie("hrsboy", URLEncoder.encode(hrsboy, "UTF-8")));
			response.addCookie(new Cookie("minboy", URLEncoder.encode(minboy, "UTF-8")));
			response.addCookie(new Cookie("secboy", URLEncoder.encode(secboy, "UTF-8")));
			response.addCookie(new Cookie("placeboy", URLEncoder.encode(placeboy, "UTF-8")));
			response.addCookie(new Cookie("longdegboy", URLEncoder.encode(longdegboy, "UTF-8")));
			response.addCookie(new Cookie("longminboy", URLEncoder.encode(longminboy, "UTF-8")));
			response.addCookie(new Cookie("longewboy", URLEncoder.encode(longewboy, "UTF-8")));
			response.addCookie(new Cookie("latdegboy", URLEncoder.encode(latdegboy, "UTF-8")));
			response.addCookie(new Cookie("latminboy", URLEncoder.encode(latminboy, "UTF-8")));
			response.addCookie(new Cookie("latnsboy", URLEncoder.encode(latnsboy, "UTF-8")));
			response.addCookie(new Cookie("dstboy", URLEncoder.encode(dstboy, "UTF-8")));
			response.addCookie(new Cookie("timezoneboy", URLEncoder.encode(timezoneboy, "UTF-8")));

			response.addCookie(new Cookie("namegirl", URLEncoder.encode(namegirl, "UTF-8")));
			response.addCookie(new Cookie("sexgirl", URLEncoder.encode(sexgirl, "UTF-8")));
			response.addCookie(new Cookie("daygirl", URLEncoder.encode(daygirl, "UTF-8")));
			response.addCookie(new Cookie("monthgirl", URLEncoder.encode(monthgirl, "UTF-8")));
			response.addCookie(new Cookie("yeargirl", URLEncoder.encode(yeargirl, "UTF-8")));
			response.addCookie(new Cookie("hrsgirl", URLEncoder.encode(hrsgirl, "UTF-8")));
			response.addCookie(new Cookie("mingirl", URLEncoder.encode(mingirl, "UTF-8")));
			response.addCookie(new Cookie("secgirl", URLEncoder.encode(secgirl, "UTF-8")));
			response.addCookie(new Cookie("placegirl", URLEncoder.encode(placegirl, "UTF-8")));
			response.addCookie(new Cookie("longdeggirl", URLEncoder.encode(longdeggirl, "UTF-8")));
			response.addCookie(new Cookie("longmingirl", URLEncoder.encode(longmingirl, "UTF-8")));
			response.addCookie(new Cookie("longewgirl", URLEncoder.encode(longewgirl, "UTF-8")));
			response.addCookie(new Cookie("latdeggirl", URLEncoder.encode(latdeggirl, "UTF-8")));
			response.addCookie(new Cookie("latmingirl", URLEncoder.encode(latmingirl, "UTF-8")));
			response.addCookie(new Cookie("latnsgirl", URLEncoder.encode(latnsgirl, "UTF-8")));
			response.addCookie(new Cookie("dstgirl", URLEncoder.encode(dstgirl, "UTF-8")));
			response.addCookie(new Cookie("timezonegirl", URLEncoder.encode(timezonegirl, "UTF-8")));
		}
	if(dayboy != null && !dayboy.isEmpty())
	{
		EngHoro objHoroMale = new EngHoro();
	    Constants ObjConst = new Constants();
	   // ObjConst.setConstPath(System.getProperty("user.dir")+"/cloud/");   
	   ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
	    
	    String BoyName = nameboy;
	    if(nameboy!=null)
	    {
	    	nameboy=nameboy.trim();	
	    }
	    if(nameboy.contains(" "))
	    {
	    	BoyName = nameboy.split(" ")[0];
	    }
	    objHoroMale.setName(BoyName);
	    
	    objHoroMale.setPlace(placeboy);
	    objHoroMale.setTimeZone(timezoneboy);
		objHoroMale.setMaleFemale("M");
		objHoroMale.setSecondOfBirth(Util.safeStringInt(secboy));
		objHoroMale.setMinuteOfBirth(Util.safeStringInt(minboy));
		objHoroMale.setHourOfBirth(Util.safeStringInt(hrsboy));
		objHoroMale.setDayOfBirth(Util.safeStringInt(dayboy));
		objHoroMale.setMonthOfBirth(Util.safeStringInt(monthboy));
		objHoroMale.setYearOfBirth(Util.safeStringInt(yearboy));
		objHoroMale.setDegreeOfLattitude(Util.safeStringInt(latdegboy));
		objHoroMale.setDegreeOfLongitude(Util.safeStringInt(longdegboy));
		objHoroMale.setSecondOfLattitude("00");
		objHoroMale.setSecondOfLongitude("00");
		objHoroMale.setMinuteOfLongitude(Util.safeStringInt(longminboy));
		objHoroMale.setMinuteOfLattitude(Util.safeStringInt(latminboy));
		objHoroMale.setEastWest(longewboy);
		objHoroMale.setNorthSouth(latnsboy);
		objHoroMale.setDST(Util.safeStringInt(dstboy));
		if(mmoutLang == 1)
		{
			objHoroMale.setLanguageCode(mmoutLang+"");  
		}
		else
		{
			objHoroMale.setLanguageCode("0");
		}
		
		objHoroMale.initialize();
		EngHoro objHoroFeMale = new EngHoro();
		
		String GirlName = namegirl;
		if(namegirl!=null)
	    {
			namegirl=namegirl.trim();	
	    }
	    if(namegirl.contains(" "))
	    {
	    	GirlName = namegirl.split(" ")[0];
	    }
	    objHoroFeMale.setName(GirlName);
		objHoroFeMale.setPlace(placegirl);
		objHoroFeMale.setTimeZone(timezonegirl);
		objHoroFeMale.setMaleFemale("F");
		objHoroFeMale.setSecondOfBirth(Util.safeStringInt(secgirl));
		objHoroFeMale.setMinuteOfBirth(Util.safeStringInt(mingirl));
		objHoroFeMale.setHourOfBirth(Util.safeStringInt(hrsgirl));
		objHoroFeMale.setDayOfBirth(Util.safeStringInt(daygirl));
	    objHoroFeMale.setMonthOfBirth(Util.safeStringInt(monthgirl));
		objHoroFeMale.setYearOfBirth(Util.safeStringInt(yeargirl));
		objHoroFeMale.setDegreeOfLattitude(Util.safeStringInt(latdeggirl));
		objHoroFeMale.setDegreeOfLongitude(Util.safeStringInt(longdeggirl));
		objHoroFeMale.setSecondOfLattitude("00");
		objHoroFeMale.setSecondOfLongitude("00");
		objHoroFeMale.setMinuteOfLongitude(Util.safeStringInt(longmingirl));
		objHoroFeMale.setMinuteOfLattitude(Util.safeStringInt(latmingirl));
		objHoroFeMale.setEastWest(longewgirl);
		objHoroFeMale.setNorthSouth(latnsgirl);
		objHoroFeMale.setDST(Util.safeStringInt(dstgirl));
		if(mmoutLang == 1)
		{
			objHoroFeMale.setLanguageCode(mmoutLang+"");  
		}
		else
		{
			objHoroFeMale.setLanguageCode("0");
		}
		objHoroFeMale.initialize();
	request.setAttribute("MMMaleHoro", objHoroMale);
	request.setAttribute("MMFemaleHoro", objHoroFeMale);
	
	int getPlanIdMM=1; // Set the this variable as basic plan
	UserDAO UDMM = new UserDAO();
	getPlanIdMM = Integer.parseInt(UDMM.getPlanId(String.valueOf(session.getAttribute("User_Id"))));

%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"	content="text/html; charset=UTF-8" />
<title>Match Details</title>

<link rel="shortcut icon" href="https://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

<link type="text/css" rel="stylesheet" href="dist/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="dist/css/theme.css">
<link type="text/css" rel="stylesheet" href="dist/css/app.css">
<link type="text/css" rel="stylesheet" href="dist/css/responsive.css">
<link type="text/css" rel="stylesheet" href="dist/css/perfect-scrollbar.css">

<script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/content-template-script.js"></script>
<script type="text/javascript" src="js/sharedfunction.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/script/validation.js"></script>

<!-- Change ".autocomplete" method to ".mtautocomplete" in materialize Js (Conflict issue) -->
 <script type="text/javascript" src="dist/js/materialize.min.js"></script>
 <script type="text/javascript" src="dist/js/perfect-scrollbar.min.js"></script>
 <script type='text/javascript' src='js/script/jquery.autocomplete.js'></script>
 <script type="text/javascript" src="dist/js/app.js"></script>  
  
<%if (mmoutLang == 2){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-tamil.css">
<%} %>
<%if (mmoutLang == 8){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-malayalam.css">
<%} %>
<%if (mmoutLang == 1){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-hindi.css">
<%} %>
<%if (mmoutLang == 9){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-marathi.css">	
<%} %>
<%if (mmoutLang == 5){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-telugu.css">	
<%} %>
<%if (mmoutLang == 7){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-gujarati.css">
<%} %>
<%if (mmoutLang == 6){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-bengali.css">	
<%} %>
<%if (mmoutLang == 4){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-kannada.css">	
<%} %>

<%
	String TopicLang = "EN";   
	if (mmoutLang == 2){TopicLang = "TA";}
	if (mmoutLang == 8){TopicLang = "ML";}
	if (mmoutLang == 1){TopicLang = "HI";}
	if (mmoutLang == 9){TopicLang = "MR";}
	if (mmoutLang == 5){TopicLang = "TE";}
	if (mmoutLang == 7){TopicLang = "GU";}
	if (mmoutLang == 6){TopicLang = "BN";}
	if (mmoutLang == 4){TopicLang = "KA";}
%>

 <!--For FCM Subscribe-->
    <script src="https://www.gstatic.com/firebasejs/4.9.1/firebase.js"></script>
    <script>        var getAppLang = "CL_<%=TopicLang%>";</script>
    <script type="text/javascript" src="/dist/js/subscribe.min.js"></script>
 <!--End--> 
<script type="text/javascript">
//For Jquery conflict issue
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})(); 

    $(document).ready(function () {       
		print();
		ajaxcallforcontent();
    });      
</script>
<%
String fullCol = "";
//out.println(getPlanId);
if (getPlanIdMM == 8 || getPlanIdMM == 9 || getPlanIdMM == 10 ){	
	fullCol = "l12";
}else{
	
	fullCol = "l8";
}
%>
</head>
<body>
<%@include file='ui-control/header.jsp'%>
<jsp:include page='ui-control/loginpopup.jsp'/>
   
    <div id="main">
         <!-- START WRAPPER -->
         <div class="wrapper">
         
           <%@include file='ui-control/menu.jsp'%>
           
           <section class="right-part">
               <div class="container">
               <%
               if (getPlanIdMM == 8 || getPlanIdMM == 9 || getPlanIdMM == 10 ){
            	  %>
            	  <div class="mrt20"></div>
            	  <%
               }
            	else{
               %>
               	<%@include file='ui-control/promo-banner.jsp'%>
               <%
               }
               %>		
               	<%@include file='notification-bar.jsp'%>
               	 <div class="row class-main">
                     <div class="col s12 <%=fullCol%>">
                      <div class="row">
                           <div class="col s12">
                      <div class="card hdg-lg" id="welcome">
                                 <h1>Welcome to AstroSage.com</h1>
                                 
                     </div>
                     </div>
                     </div>
								
               	
   
                            <div id="main-content">
                            <%@include file="new_matchmakingoutput.jsp"%>
                            </div>
                           <div id="main-content-report"></div>
                            </div>
                   
                    
                    
                       
	            <%
               			if (getPlanIdMM != 8 && getPlanIdMM != 9 && getPlanIdMM != 10 ){
            	%>
            	   		<%@include file='ui-control/right.jsp'%>
              	<%
              			}
       			%>
                    </div>
                    </div>
                    
                    </section>
						
						
				</div>
			</div>
			
<footer class="page-footer">
 	<%@include file='ui-control/footer.jsp'%>
</footer>	
	<jsp:include page='usernotes-box/comment.jsp' />
	<jsp:include page='feedback-form.jsp' />
	<jsp:include page='sharechartpublicly.jsp' />		
	<jsp:include page='print.jsp' />			
	<jsp:include page='openchart.jsp' />
	<jsp:include page='savechart.jsp' />
	<jsp:include page='toolbar.jsp' />
	<jsp:include page='service-order-popup.jsp' />
       
       <%if(Util.isMobileDevice(request)) { %>	
	<%@include file='ui-control/app-install.jsp'%>
<%} %> 
       
</body>
</html> 
<% 
	}//if (secboy is empty)
	else
	{
		System.out.println("Parameters are not right."+request.getRequestURI());
		response.sendRedirect("/cloud/home.asp" );
	}
}
else
{
	if(redirectTo.equals(""))
	{
        response.sendRedirect("http://www.astrosage.com/freechart/matchmaking.asp" );
	}
	else
	{
		response.sendRedirect(redirectTo);
	}
}
}catch(Exception e)
{
	System.out.println("Got an exception in MatchMakingOutput."+request.getRequestURI()+request.getQueryString());
}
%>