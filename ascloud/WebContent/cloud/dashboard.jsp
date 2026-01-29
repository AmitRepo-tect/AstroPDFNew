
<%@page import="com.astrocamp.predictive.util.Constant"%>
<%@page import="com.astrocamp.sms.RequestProcessing"%>
<%@page import="com.cslsoftware.matchmaking.MatchMaking"%>
<%@page import="com.ojassoft.panchang.Muhurta"%>
<%@page import="com.ojassoft.astrosagecloud.Panchang.AajKaPanchangData"%>
<%@page import="com.ojassoft.astrosagecloud.PersonalizedHoroscope"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.ojassoft.astrosagecloud.DashBoardPrediction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.CloudServlet"%>
<%@page import="com.ojassoft.astrosagecloud.AstrosageServlet"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.*"%>
<%

if((session.getAttribute("HoroscopeObj")==null || session.getAttribute("HoroscopeObj").equals("")) && (session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals(""))){
	UserDAO UD = new UserDAO();
//if(UD.isUserHasDefaultChart(String.valueOf(session.getAttribute("User_Id")))) {
    response.sendRedirect("defaultchartlogin.asp?methodName=fromJSP");       
//} 
}


 
//if(session.getAttribute("User_Id") == null)
//{
//	response.sendRedirect("default.jsp");
//}
//else
//{
request.setAttribute("includeFile", "home.jsp");
String ischartexist = "0"; // neha default value set
String strprint = "";// neha default value set

String title = "";
Local local = new Local();
CloudServlet serv = new CloudServlet();
serv.initialize(request, response);
	DesktopHoro ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");   
	
 
    int langCode = Util.safeInt(session.getAttribute("languageCode"));
	MyResourceBundle rBHome = local.loadPropertiesFileNew("home",langCode);
	MyResourceBundle rBHomeBasicdetails = local.loadPropertiesFileNew("home-basicdetails",langCode);
	Object consObj = session.getAttribute("constants");
	MyProperties rBConstantFile = null;
	if(consObj == null)
	{
		rBConstantFile = new MyProperties(local.loadPropertiesFile("constants",langCode));
		session.setAttribute("constants", rBConstantFile);
	}
	else
	{
		rBConstantFile = (MyProperties) consObj;
	}
	//request.setAttribute("constants", rBConstantFile);

    if(session.getAttribute("HoroscopeObj") != null){
    	//DesktopHoro ObjHoro1 = (DesktopHoro)session.getAttribute("HoroscopeObj"); 
        String tempname = ObjHoro.getName();
       // String titlefirstchar = UCase(left(tempname,1)); 
       
       if(tempname != null && tempname.length() >= 1)
       {
        String titlefirstchar =  tempname.substring(0, 1).toUpperCase();
        //String titleremain = right(tempname,len(tempname)-1);
        String titleremain =  tempname.substring((tempname.length())-(tempname.length()-1));
        //out.println(titlefirstchar+","+titleremain);
        title = titlefirstchar + titleremain;
       }
    }
    else
    {
        title = "Home";
    }
    
    Util utl =  new Util();
    Calendar cal = Calendar.getInstance(); 
    
    
    //Default place
    String placeName = "";//"DELHI"; 
    Date datePan = cal.getTime();
    double latitude = 0.0;// 28.6139;
    double longitude = 0.0;//77.2090;
    double timezone = 0.0;//5.5;
    String timezoneString = "";//"Asia/Kolkata";
    
   
    //Read cookies
    boolean isCookieUpdate = false;
    String lastCurrLogitude = readcookies("currLogitude",request);
    String lastCurrLatitude  = readcookies("currLatitude",request);
    String lastCurrTimeZone  =readcookies("currTimezone",request); 
    String lastCurrTimeZoneString  =readcookies("currTimezonestring",request); 
    String lastCurrPlace =readcookies("currPlaceName",request); 
    
    //post values
    if(request.getParameter("LatDeg")!=  null && !request.getParameter("LatDeg").equals("") && request.getParameter("LongDeg")!=  null && !request.getParameter("LongDeg").equals("") ){
    	Double latitudeDegree = Double.parseDouble(request.getParameter("LatDeg"));
    	Double longitudeDegree= Double.parseDouble(request.getParameter("LongDeg"));
    	Double latitudeMin = Double.parseDouble(request.getParameter("LatMin"));
    	Double longitudeMin= Double.parseDouble(request.getParameter("LongMin"));
    	String latitudeNS =request.getParameter("LatNS");
    	String longitudeEW= request.getParameter("LongEW");
    	timezone= Double.parseDouble(request.getParameter("timeZone"));
    	timezoneString = request.getParameter("timezoneid");
    	placeName = request.getParameter("currPlace").toUpperCase();
    	latitude = latitudeNS.equals("S") ? -(latitudeDegree+(latitudeMin/60)) :latitudeDegree+(latitudeMin/60.0);
    	longitude = longitudeEW.equals("W") ?-(longitudeDegree+(longitudeMin/60)) : longitudeDegree+(longitudeMin/60.0);
    	isCookieUpdate =true;
    
    }
    
  
    
    if(isCookieUpdate){// For New City taken from the drop down
    	createcookies("currLogitude", String.valueOf(longitude), 7,response);
    	createcookies("currLatitude", String.valueOf(latitude), 7,response);
    	createcookies("currTimezone", String.valueOf(timezone), 7,response);
    	createcookies("currTimezonestring", timezoneString, 7,response);
    	createcookies("currPlaceName", placeName, 7,response);
    } //For Last Set City
    else if(lastCurrLogitude!=null && !lastCurrLogitude.equals("")  && (lastCurrLatitude!=null && !lastCurrLatitude.equals("")) && (lastCurrTimeZone!=null && !lastCurrTimeZone.equals(""))){
    	longitude = Double.parseDouble(readcookies("currLogitude",request));
    	latitude= Double.parseDouble(readcookies("currLatitude",request));
    	timezone = Double.parseDouble(readcookies("currTimezone",request));
    	timezoneString= readcookies("currTimezonestring",request);
    	placeName= readcookies("currPlaceName",request);;
    }
    
    else{ //Default City
    	    latitude = 28.6139;
    	    longitude = 77.2090;
    	    timezone = 5.5;
    	    timezoneString = "Asia/Kolkata";
    	    placeName="DELHI";
    }
	
    //Dst Correction in timeZone
    if (utl.isDst(timezoneString, datePan)) {
        timezone = timezone + 1.0;
    }
 
    //******************************************
    Date date = new Date();  
    SimpleDateFormat  formatter = new SimpleDateFormat("EEEEE, dd MMM yyyy");  
    String datePrintOnTop= formatter.format(date);  ;
    
    //Properties ***********************
    MyProperties rBConstant = (MyProperties) session.getAttribute("constants");
    MyResourceBundle rBTransitTodayChart = local.loadPropertiesFileNew("transittodaychart", langCode);
    
    //Neha Hourly Horoscope *************************'
    DashBoardPrediction dashBoard =  new DashBoardPrediction();
    //List<String> getHoraBhavPred =  DashBoardPrediction.getHoraBhavPrediction(ObjHoro,"");
    List<String> getHoraBhavPred =  dashBoard.getHoraBhavPrediction(ObjHoro,latitude,longitude,timezone,"");
    int cuurPlanetNo = Integer.parseInt(getHoraBhavPred.get(3));
     String startTime = dashBoard.getTimeInAMPM(getHoraBhavPred.get(1));
     String startEndTime =dashBoard.getTimeInAMPM(getHoraBhavPred.get(2));
     //Buisness
     String BuisnessStartTime =dashBoard.getTimeInAMPM(getHoraBhavPred.get(5));
     String BuisnessEndTime =dashBoard.getTimeInAMPM(getHoraBhavPred.get(6));
     //Love
     String LoveStartTime =dashBoard.getTimeInAMPM(getHoraBhavPred.get(7));
     String LoveEndTime =dashBoard.getTimeInAMPM(getHoraBhavPred.get(8));
     //Gov. work
     String GovStartTime =dashBoard.getTimeInAMPM(getHoraBhavPred.get(9));
     String GovEndTime =dashBoard.getTimeInAMPM(getHoraBhavPred.get(10));
   
     //***********************************
     //Personalized data*****************************
     
     RequestProcessing getSms = PersonalizedHoroscope.getPersonalizedHoroscope(ObjHoro) ;
     String personalizedPrediction = getSms.getMiscPrediction();
     String luckyNum = getSms.getLuckyNumber();
     String luckyCol = getSms.getLuckyColor();
     String healthRating = getSms.getRatingForHealth();
     String familyRating = getSms.getRatingForFamily();
     String loveRating = getSms.getRatingForLove();
     String wealthRating = getSms.getRatingForFinance();
     String workRating = getSms.getRatingForProfession();
     String marriedRating = getSms.getRatingForMarriedLife();
     String remedy = getSms.getRemedyOfMinAspect();
     
     double overAllRating = (coverStringToInt(healthRating)+coverStringToInt(familyRating)+coverStringToInt(wealthRating)
    		             +coverStringToInt(workRating)+coverStringToInt(marriedRating)+coverStringToInt(loveRating)) / 6.0;
     int roundOverAll= coverStringToInt(String.valueOf(Math.round(overAllRating)));
     String[] isGoodBadForRating = new String[] {"Bad","Average","Average","Good","Very Good"}; //from 1 to 5
     boolean[] isThumUpDownForRating = new boolean[] {false,true,true,true,true}; //from 1 to 5
     String classForMeterRating=dashBoard.getMeterBarwithGivenPoint(isThumUpDownForRating[roundOverAll-1],roundOverAll);
     String goodOrBadRating = isGoodBadForRating[roundOverAll-1];
     String upDownThumbRating =dashBoard.getGoodOrBadClass(isThumUpDownForRating[roundOverAll-1]) ;
     
     //******************Lucky / Avoid Time / Dircetion***********************
     int rashi = ObjHoro.getAscendentSign();
	 String[] getGoodTime = dashBoard.getGoodTime(true,langCode,rashi,ObjHoro,latitude,longitude,timezone).split(" ");
	 String[] getBadTime = dashBoard.getGoodTime(false,langCode,rashi,ObjHoro,latitude,longitude,timezone ).split(" ");
	 String startTimeForGood = dashBoard.getTimeInAMPM(getGoodTime[0]).trim();
     String startEndTimeForGood =dashBoard.getTimeInAMPM(getGoodTime[1]).trim();
     String startTimeForBad = dashBoard.getTimeInAMPM(getBadTime[0]).trim();
     String startEndTimeForBad =dashBoard.getTimeInAMPM(getBadTime[1]).trim();
     
      int dishaShool = dashBoard.getDishaShool()-1; //0 to 3
      String[] badDirectionArr = new String[] {"East","West","North","South"};
      String[] goodDirectionArr = new String[] {"West","East","South","North"};
      
      String badDirection = badDirectionArr[dishaShool];
      String goodDirection = goodDirectionArr[dishaShool];
      //'****************************************************'
      // Common Array for day lord and current nakshtra 
      
      String[] arrOfNakDayLord= {"Good","Good","Good","Good","Good","Bad","Good","Bad","Good","Good","Good","Bad"};
      boolean[] isNakDayLordGoodbad = new boolean[] {true, true, true, true, true, false, true, false,true, true, true, false};
     
      //***********Nakshtara*****************************
      AajKaPanchangData calculation = new AajKaPanchangData(latitude,longitude,timezone);
    
     HashMap<Integer,String> mp = dashBoard.getCurrentTimeNakshatra(ObjHoro,latitude,longitude,timezone);
     String todayNakEndTimeAMPM= mp.get(1);
     String todayNakStartTimeAMPM= mp.get(0);
     String Nak=mp.get(2);
     int todayNak = (Integer.parseInt(mp.get(3))) % 9; 
     
      int nakLord = Common.nakLordArrs[todayNak]-1; //getting 0 to 26
      int bhavPositionOfnakLord = dashBoard.getBhavValueBasedOnPlanet(ObjHoro,nakLord); //lord position in kp kundli
      int getGoodBadOfnakLord =Constant.getHouseResult(bhavPositionOfnakLord-1); // get 1 to 6 number
       
      String getClassForShowNakLord= dashBoard.getGoodOrBadClass(isNakDayLordGoodbad[bhavPositionOfnakLord-1]); //thumb 
      String getClassForMeterNakLord = dashBoard.getMeterBarwithGivenPoint(isNakDayLordGoodbad[bhavPositionOfnakLord-1],getGoodBadOfnakLord-1); //meter
      String isGoodBadNakLord= arrOfNakDayLord[bhavPositionOfnakLord-1]; //content
     // System.out.println(todayNak +","+nakLord+","+bhavPositionOfnakLord+","+isNakLordGoodbad[bhavPositionOfnakLord-1]+","+isGoodBadNakLord);	 
    		 
     //***********************Day Lord*********************
    String[] dayLordArry = new String[] {"Sun","Moon","Mars","Mercury","Jupiter","Venus","Saturn"};
   
    int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK)-1; //lord number
    String lordOfTheDay = dayLordArry[dayOfWeek]; //0 to 6
    int bhavPositionOfDayLord = dashBoard.getBhavValueBasedOnPlanet(ObjHoro,dayOfWeek); //lord position in kp kundli 
    int getGoodBadOfDayLOrd =Constant.getHouseResult(bhavPositionOfDayLord-1); // get 1 to 6 number
    
    //String[] arrOfDayLord = {"Good","Good","Good","Good","Good","Bad","Good","Bad","Good","Good","Good","Bad"};
    //boolean[] isDayLordGoodbad = new boolean[] {true, true, true, true, true, false, true, false,true, true, true, false};
    
    String getClassForShowDayLOrd = dashBoard.getGoodOrBadClass(isNakDayLordGoodbad[bhavPositionOfDayLord-1]); //thumb 
    String getClassForMeterDayLOrd = dashBoard.getMeterBarwithGivenPoint(isNakDayLordGoodbad[bhavPositionOfDayLord-1],getGoodBadOfDayLOrd-1); //meter
    String isGoodBadDayLord= arrOfNakDayLord[bhavPositionOfDayLord-1]; //content
    
   // System.out.println(bhavPositionOfDayLord+","+getGoodBadOfDayLOrd);
    //***********************
     DesktopHoro objCurrHoro = dashBoard.getCurrentObj(ObjHoro,langCode);
     int[] arrPlanetsShodashvargaForMoon =  new int[13];
     int[] arrPlanetsShodashvarga =  new int[13];
     arrPlanetsShodashvargaForMoon = ObjHoro.getPositionForShodasvarg(0); //lagna rasi 
     arrPlanetsShodashvarga = objCurrHoro.getPositionForShodasvarg(0);
     int moonBhavPosition = arrPlanetsShodashvargaForMoon[2];
    
     String moonRashiName =  Common.engRashiNames[moonBhavPosition-1];
     int bhavPostionOfMoon = SharedFunction.GetPlanetInBhava(moonBhavPosition,arrPlanetsShodashvarga[2]);
     //***********************Chandra Bala*********
     boolean isClsTrueForChandra = false;
     String isGoodOrBad = "Bad";
     String getClassForShow = "",getClassForMeterChandra="";
     String moonPosition  =  bhavPostionOfMoon+SharedFunction.NoSuffix(bhavPostionOfMoon);
     String strMoonPosition  =  "Your Moon is in "+bhavPostionOfMoon+SharedFunction.NoSuffix(bhavPostionOfMoon)+" House";
     strMoonPosition= strMoonPosition+" from the "+moonRashiName;
 
    int[] getArrOfChandraBala = calculation.getChandrabala(); //based on moon sign
    for(int i=0;i<getArrOfChandraBala.length;i++){
     if(getArrOfChandraBala[i]==ObjHoro.getMoonSign()+1){
    	 isClsTrueForChandra = true;
    	 isGoodOrBad="Good"; 	 
     }
     getClassForShow = dashBoard.getGoodOrBadClass(isClsTrueForChandra);
     getClassForMeterChandra = dashBoard.getMeterBar(isClsTrueForChandra);
    }
   
   //******************************Tara Bala****************************
    
     int birthStar = ObjHoro.getNakshatra();
     
     int transitStar = objCurrHoro.getNakshatra();
     int taraDiff = transitStar - birthStar;
     if(taraDiff < 0 ){
     	taraDiff = taraDiff + 27;
     }
     int finalTara = taraDiff % 9;
     String[] arrOfTaraValue ={"JANMA","SAMPAT","VIPAT","KSHEMA","PRETYERI","SAADHAK","VADH","MAITREE","ADHI_MAITREE"};
     String[] arrOfTaraProperties = {"Good","Good","Bad","Good","Bad","Good","Bad","Good","Good"};
     boolean[] arrOfTaraThumbUpDown = {true,true,false,true,false,true,false,true,true};
     String[] arrOfTaraRamedies = {"TARA_RAMEDY_FIRST","","TARA_RAMEDY_SECOND","","TARA_RAMEDY_FIFTH","","TARA_RAMEDY_SEVENTH","",""};

     String TaraName ="";
     String isGoodOrBadTara ="",classForTaraUpDown="",classForMeterTara="";
     String taraRemedy = "";
     try{TaraName = rBTransitTodayChart.getString(arrOfTaraValue[finalTara]);}catch(Exception e){TaraName = rBTransitTodayChart.getString(arrOfTaraValue[finalTara]);};
     isGoodOrBadTara = arrOfTaraProperties[finalTara];
     classForTaraUpDown = dashBoard.getGoodOrBadClass(arrOfTaraThumbUpDown[finalTara]);
     classForMeterTara=dashBoard.getMeterBar(arrOfTaraThumbUpDown[finalTara]);
    // try{ isGoodOrBadTara = arrOfTaraProperties[finalTara];}catch(Exception e){isGoodOrBadTara = arrOfTaraProperties[finalTara];};
     if(
    		 !arrOfTaraRamedies[finalTara].equals("")){
    	       taraRemedy = "Remedy: "+rBTransitTodayChart.getString(arrOfTaraRamedies[finalTara]);
     }
     
     //***********************Rahu Kaal 
     String[] todayRahuKaal =  calculation.getRahuKaal();
     String startRahuKaal = dashBoard.getTimeInAMPM(todayRahuKaal[0].replace("-", ":"));
     String endRahuKaal = dashBoard.getTimeInAMPM(todayRahuKaal[1].replace("-", ":"));
     
   //***********************Abhijit muhurat
   
    String[] todayAbhijit =  calculation.getAbhijitMuhurat();
    String startAbhijit = "",endAbhijit="";
   if(todayAbhijit[0]==null){//On wednesday no abhijit muhurat
	   startAbhijit = "No";
	   endAbhijit = "No";
   }
   else
   {
	   startAbhijit=  dashBoard.getTimeInAMPM(todayAbhijit[0].replace("-", ":"));
	   endAbhijit= dashBoard.getTimeInAMPM(todayAbhijit[1].replace("-", ":"));
   }
   
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title><%=title%></title>

<link rel="shortcut icon"
	href="https://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link type="text/css" rel="stylesheet"
	href="dist/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="dist/css/theme.css">
<link type="text/css" rel="stylesheet" href="dist/css/app.css">
<link type="text/css" rel="stylesheet" href="dist/css/responsive.css">
<link type="text/css" rel="stylesheet"
	href="dist/css/perfect-scrollbar.css">
<link type="text/css" rel="stylesheet"
	href="js/script/jquery.autocomplete.css" />
<link type="text/css" rel="stylesheet" href="dist/css/cmGauge.css" />

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
<script type="text/javascript" src="dist/js/cmGauge.js"></script>
<script type="text/javascript" src="dist/js/dashboard.js"></script>
<script type="text/javascript" src="dist/js/infinite-scroll.js"></script>  
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
   
</script>
</head>
<body>
	<%@include file='ui-control/header.jsp'%>
	<form id="DsBoard" method="post">
		<div id="main">
			<!-- START WRAPPER -->
			<div class="wrapper">

				<%@include file='ui-control/menu.jsp'%>

				<section class="right-part">
					<div class="container">
						<%@include file='ui-control/promo-banner.jsp'%>
						<%@include file='notification-bar.jsp'%>


						<div class="row class-main">
							<div class="col s12 l8">
								<div class="row no-margin-b">
									<div class="col s12">
										<div class="card hdg-lg" id="welcome">
											<%String dsName= "";
                      String showName= SharedFunction.ProperCase(ObjHoro.getName());
                      if(showName.length()>=15 && Util.isMobileDevice(request)){		
                    	  dsName = showName.substring(0,10) + "..."+namePrefix;
                    	}
                      else{
                    	  dsName = showName+namePrefix;
                      }
                      
                      %>
											<h1><%=dsName%>
												Dashboard
											</h1>

										</div>
									</div>

									<div class="col s6">
										<div class="dtbox">
											<p>
												<b>Current Date</b><br />
												<%=datePrintOnTop%></p>
										</div>
									</div>


									<div class="col s6">
										<div class="dtbox">

											<div class="sel-place">
												<p>
													<b>Current Place <i class="material-icons suffix">place</i></b><br />
													<a class="modal-trigger" href="#setPlaceOnDashboard"> (<%=placeName%>)
													</a>
												</p>
											</div>



										</div>
									</div>



								</div>





								<div id="main-content" class="dashboard">

									<div class="row no-margin-b">
										<div class="col s12">

											<div class="hdgh2">
												<h2>Now</h2>
											</div>
											<div class="padding-all card hourly-horoscope">
												<h2 class="left">Your Hourly Horoscope</h2>
												<span class="right"><%=startTime%> - <%=startEndTime%></span>
												
													<div class="row no-margin-b">
														<div class="col s12">
															<div class="content-horoscope margin-b-12">
															<p class="text-justify"><%=getHoraBhavPred.get(0)%>&nbsp;{<%=Common.arrLongPlanetName[cuurPlanetNo]%>
																/
																<%=getHoraBhavPred.get(4)%>}
															</p>
														</div>
													</div>


											
													<div class="col s12">
														<span class="red lighten-5 bad-ic"> <i
															class="material-icons red-text">thumb_down_alt</i> Love
														</span> <span class="light-green lighten-5 good-ic"> <i
															class="material-icons green-text">thumb_up_alt</i>
															Shopping
														</span>
													</div>
													</div>

												
											</div>
										</div>
									</div>
									<div class="row no-margin-b">
										<div class="col s12">
											<div class="hdgh2">
												<h2>Today</h2>
											</div>

										</div>
										<div class="col s12 m6 l6">

											<div class="padding-all card hourly-horoscope margin-b-12">
												<h2 class="left">Your Day Today</h2>


												<div class="content-horoscope">

													<p
														class="justify <%if(!Util.isMobileDevice(request)) {%>more<%}%>"><%=personalizedPrediction%></p>

												</div>

											</div>
											
											
												<div class="row margin-b-12">
													<div class="col s12 m6 l6 margin-b-12">
														<div class="padding-all card hourly-horoscope">
															<h2 class="align-left">Remedy</h2>

															<p>
																<%=remedy%>
															</p>



														</div>
													</div>
													<div class="col s12 m6 l6">

														<div class="padding-all card hourly-horoscope">
															<h2 class="left">Overall Day</h2>

														<div id="gaugeDemo"
															class="gauge gauge-small-x gauge-orange right">
															<div class="gauge-arrow"
																data-percentage="<%=classForMeterRating%>"
																style="transform: rotate(0deg);"></div>
														</div>
														<div class="right-align clearfix good-ic-sm">
															<%=goodOrBadRating%>
															<span class="material-icons blue-text"><%=upDownThumbRating%></span>
														</div>
														</div>

													</div>

												</div>
											
										</div>


										<div class="col s12 m6 l6">
											<div class="padding-all card hourly-horoscope margin-b-12">
												<h2>Today's Ratings</h2>
												<div class="col s5">
													<ul class="lucky-today">
														<li><span class="linebox"> </span> Health</li>
														<li><span class="linebox grey"> </span> Family</li>
														<li><span class="linebox amber"> </span> Romance</li>
														<li><span class="linebox brown darken-2"> </span>
															Finance</li>
														<li><span class="linebox green darken-4"> </span>
															Career</li>
														<li><span class="linebox purple darken-1"> </span>
															Married Life</li>
													</ul>
												</div>
												<div class="col s7">
													<div class="numberlucky">
														<div class="w3-light-grey ">
															<div class="w3-container red darken-3"
																style="width:<%=20*Integer.parseInt(healthRating)%>%"><%=healthRating%></div>

														</div>
														<div class="w3-light-grey">
															<div class="w3-container grey w3-center"
																style="width:<%=20*Integer.parseInt(familyRating)%>%"><%=familyRating%></div>
														</div>

														<div class="w3-light-grey">
															<div class="w3-container amber w3-center"
																style="width:<%=20*Integer.parseInt(loveRating)%>%"><%=loveRating %></div>
														</div>

														<div class="w3-light-grey">
															<div class="w3-container brown darken-2"
																style="width:<%=20*Integer.parseInt(wealthRating)%>%"><%=wealthRating %></div>
														</div>
														<div class="w3-light-grey">
															<div class="w3-container green darken-4"
																style="width:<%=20*Integer.parseInt(workRating)%>%"><%=workRating %></div>
														</div>

														<div class="w3-light-grey">
															<div class="w3-container  purple darken-1"
																style="width:<%=20*Integer.parseInt(marriedRating)%>%"><%=marriedRating %></div>
														</div>




													</div>
												</div>
											</div>
										</div>


									</div>



									<div class="row no-margin-b">
										<div class="col s12 m6 l6">
											<div class="padding-all card hourly-horoscope margin-b-12">
												<h2>Lucky Today</h2>
												<div class="col s12">
													<ul class="lucky-today">
														<li><img src="images/dashboard/icon/number_g.png"
															width="18"> Number <span
															class="green darken-4 right onbg"><%=luckyNum%></span></li>
														<li><img src="images/dashboard/icon/color_g.png"
															width="18"> Color <span
															class="indigo darken-3 right onbg"><%=getSms.getLuckyColor() %></span></li>
														<li><img src="images/dashboard/icon/direction_g.png"
															width="18"> Direction <span
															class="amber darken-4 right onbg"><%=goodDirection%></span></li>
														<li><img src="images/dashboard/icon/time_g.png"
															width="18"> Start Time <span
															class="brown darken-4 right onbg"><%=startTimeForGood%></span></li>
														<li><img src="images/dashboard/icon/time_g.png"
															width="18"> End Time <span
															class="brown darken-2 right onbg"><%=startEndTimeForGood %></span></li>
													</ul>
												</div>
												
											</div>
										</div>
										<div class="col s12 m6 l6">
											<div class="padding-all card hourly-horoscope margin-b-12">
												<h2>To Avoid Today</h2>
												<div class="col s12">
													<ul class="lucky-today">
														<li><img src="images/dashboard/icon/number_r.png"
															width="18"> Number <span
															class="green darken-4 right onbg">5</span></li>
														<li><img src="images/dashboard/icon/color_r.png"
															width="18"> Color <span
															class="red darken-3 right onbg">Red</span></li>
														<li><img src="images/dashboard/icon/direction_r.png"
															width="18"> Direction <span
															class="amber darken-4 right onbg"><%=badDirection%></span></li>
														<li><img src="images/dashboard/icon/time_r.png"
															width="18"> Start Time <span
															class="brown darken-4 right onbg"><%=startTimeForBad %></span></li>
														<li><img src="images/dashboard/icon/time_r.png"
															width="18"> End Time <span
															class="brown darken-2 right onbg"><%=startEndTimeForBad %></span></li>
													</ul>
												</div>
												
											</div>
										</div>

									</div>

									<div class="row no-margin-b">
										<div class="col s12 m6 l6">
											<div
												class="padding-all card hourly-horoscope margin-b-12">
												<h2>Dos & Don'ts</h2>
												<ul class="lucky-today">
													<li><img src="images/dashboard/icon/do's.png"
														width="15"> Excercise Daily</li>
													<li><img src="images/dashboard/icon/do's.png"
														width="15"> Behave equally with everyone</li>
													<li><img src="images/dashboard/icon/don'ts.png"
														width="15"> Do not let ego come into your behaviour
													</li>
													<li><img src="images/dashboard/icon/don'ts.png"
														width="15"> Don not be lazy and avoid
														procrastinating things for later</li>
												</ul>
											</div>
										</div>
										<div class="col s12 m6 l6">
											<div class="padding-all card hourly-horoscope margin-b-12">
												<h2>AstroSage Secret Key</h2>
												<p>
													<b> Your sun is week today </b>
												</p>
												<div class="content-horoscope">
													<p class="text-justify">you need to careful about your
														health & government dealings. you need to careful about
														your health & government dealings. you need to careful
														about your health & government dealings.</p>
												</div>

											</div>
										</div>
									</div>

									<div class="row no-margin-b">
										<div class="col s12 m6 l6">
											<div class="card hourly-horoscope margin-b-12">
												<div class="padding-all">
													<h2>Current Nakshatra</h2>
													<div class="row no-margin-b">
														<div class="col s6 naksharta-div">
															<h5 class="green-text"><%=Nak%></h5>
															<div class="fullstrat">
																<div class="startdate">
																	<p>
																		Start:
																		<%=todayNakStartTimeAMPM%>
																	</p>
																	<p>
																		End:
																		<%=todayNakEndTimeAMPM%>
																	</p>
																</div>
															</div>
														</div>
														<div class="col s6">

															<div id="gaugeDemo"
																class="gauge gauge-small gauge-orange right">
																<div class="gauge-arrow" data-percentage="<%=getClassForMeterNakLord %>"
																	style="transform: rotate(0deg);"></div>
															</div>
															<div class="right-align clearfix good-ic">
																<%=isGoodBadNakLord %><span class="material-icons blue-text"><%=getClassForShowNakLord%></span>
															</div>
														</div>
													</div>
												</div>


											</div>

										</div>
										<div class="col s12 m6 l6">
											<div class="card hourly-horoscope margin-b-12">
												<div class="padding-2">
													<h2>Day Lord</h2>
													<div class="row no-margin-b">
														<div class="col s6 naksharta-div">
															<h5 class="red-text"><%=lordOfTheDay%></h5>
														</div>
														<div class="col s6 naksharta-div">
															<div id="gaugeDemo"
																class="gauge gauge-small gauge-orange right">
																<div class="gauge-arrow" data-percentage="<%=getClassForMeterDayLOrd%>"
																	style="transform: rotate(0deg);"></div>
															</div>
															<div class="right-align clearfix bad-ic">
																<%=isGoodBadDayLord %> <span class="material-icons blue-text"><%=getClassForShowDayLOrd%></span>
															</div>
														</div>

													</div>
												</div>


											</div>

										</div>
									</div>

									<div class="row no-margin-b">
										<div class="col s12 m6 l6 margin-b-12">
											<div class="card hourly-horoscope responsive-mb-20">
												<div class="padding-2">
													<h2>Your Chandra Bala</h2>
													<div class="row no-margin-b">
														<div class="col s6 naksharta-div">
															<p><%=strMoonPosition%></p>

														</div>
														<div class="col s6 naksharta-div margin-b-12">
															<div id="gaugeDemo"
																class="gauge gauge-small gauge-orange right">
																<div class="gauge-arrow"
																	data-percentage="<%=getClassForMeterChandra%>"
																	style="transform: rotate(0deg);"></div>
															</div>
															<div class="right-align clearfix avrg-ic">
																<%=isGoodOrBad%>
																<span class="material-icons blue-text"><%=getClassForShow%></span>
															</div>
														</div>
													</div>
												</div>

											</div>

										</div>
										<div class="col s12 m6 l6">
											<div class="card hourly-horoscope margin-b-12">
												<div class="padding-all">
													<h2>Your Tara Bala</h2>
													<div class="row no-margin-b">
														<div class="col s6 naksharta-div">
															<h5 class="green-text"><%=TaraName%></h5>
															<div class="fullstrat">
																<div class="startdate">
																	<p><%=taraRemedy%>
																	</p>
																</div>
															</div>
														</div>

														<div class="col s6 naksharta-div">
															<div id="gaugeDemo"
																class="gauge gauge-small gauge-orange right">
																<div class="gauge-arrow"
																	data-percentage="<%=classForMeterTara%>"
																	style="transform: rotate(0deg);"></div>
															</div>
															<div class="right-align clearfix good-ic">
																<%=isGoodOrBadTara%>
																<span class="material-icons blue-text"><%=classForTaraUpDown %></span>
															</div>
														</div>
													</div>
												</div>

											</div>

										</div>
									</div>


									<div class="row no-margin-b">
										<div class="col s12 muhu-setting"> 
											<h2 class="margin-b-12">Muhurat</h2>
										</div>
										<div class="col s6 m3 l3">
											<div class="card muhurat-horoscope padding-3">
												<h2 class="blue-text">Business</h2>
												<div class="text-full-part">
													<div class="formdate">Form</div>
													<div class="formdate"><%= BuisnessStartTime%>
													</div>
													<div class="formdate">To</div>
													<div class="formdate">
														<%=BuisnessEndTime%></div>
												</div>

											</div>

										</div>
										<div class="col s6 m3 l3">
											<div class="card muhurat-horoscope padding-3">
												<h2 class="red-text">Love/Romance</h2>
												<div class="text-full-part">
													<div class="formdate">Form</div>
													<div class="formdate">
														<%= LoveStartTime %></div>
													<div class="formdate">To</div>
													<div class="formdate"><%=LoveEndTime  %>
													</div>
												</div>
											</div>

										</div>
										<div class="col s6 m3 l3">
											<div class="card muhurat-horoscope padding-3">
												<h2 class="yellow-text">Abhijeet</h2>
												<div class="text-full-part">
													<div class="formdate">Form</div>
													<div class="formdate"><%=startAbhijit %>
													</div>
													<div class="formdate">To</div>
													<div class="formdate">
														<%=endAbhijit %></div>
												</div>
											</div>

										</div>
										<div class="col s6 m3 l3">
											<div class="card muhurat-horoscope padding-3">
												<h2 class="green-text">Rahu Kaal</h2>
												<div class="text-full-part">
													<div class="formdate">Form</div>
													<div class="formdate">
														<%=startRahuKaal %>
													</div>
													<div class="formdate">To</div>
													<div class="formdate">
														<%=endRahuKaal %></div>
												</div>
											</div>

										</div>
										<div class="col s6 m3 l3">
											<div class="card muhurat-horoscope padding-3">
												<h2 class="violet-text">Govt. Work</h2>
												<div class="text-full-part">
													<div class="formdate">Form</div>
													<div class="formdate">
														<%=GovStartTime  %>
													</div>
													<div class="formdate">To</div>
													<div class="formdate">
														<%=GovEndTime  %></div>
												</div>
											</div>

										</div>
										<div class="col s6 m3 l3">
											<div
												class="card muhurat-horoscope padding-3 amber darken-4 margin-t-28">
												<div class="text-full-part white-text center-align">
													MORE MUHURAT</div>
											</div>

										</div>
									</div>

									<div class="row no-margin-b">
										<div class="col s12 m12 l12 share-market">

											<h2>Share Market Tip</h2>
											<div class="bg-share">
												<a class="btn amber darken-4 waves-effect waves-light"
													href="#"> <i class="material-icons">lock_open</i>
													Unlock Now
												</a>
											</div>
										</div>
									</div>

								</div>
							</div>


							<input type="hidden" id="LatDeg" name="LatDeg"> <input
								type="hidden" id="LatMin" name="LatMin"> <input
								type="hidden" id="LatNS" name="LatNS"> <input
								type="hidden" id="LongDeg" name="LongDeg"> <input
								type="hidden" id="LongMin" name="LongMin"> <input
								type="hidden" id="LongEW" name="LongEW"> <input
								type="hidden" id="timeZone" name="timeZone"> <input
								type="hidden" id="currPlace" name="currPlace"> <input
								type="hidden" id="timezoneid" name="timezoneid">
							<%@include file='ui-control/right.jsp'%>

						</div>
					</div>
				</section>
				<div id="loadpage"></div>
			</div>
		</div>
	</form>
	<footer class="page-footer">
		<%@include file='ui-control/footer.jsp'%>
	</footer>
	<%@include file='/include/popupbox.jsp'%>
	<%@include file='usernotes-box/comment.jsp'%>
	<%@include file='feedback-form.jsp'%>
	<%@include file='sharechartpublicly.jsp'%>
	<%@include file='print.jsp'%>
	<%@include file='openchart.jsp'%>
	<%@include file='savechart.jsp'%>
	<%@include file='toolbar.jsp'%>
	<%@include file='ui-control/select-place.jsp'%>
</body>
</html>
<%
//}%>

<%!
public int coverStringToInt(String x){
	return Integer.parseInt(x);
}


%>



