
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.ghatakfavourable.GhatakFavourable"%>
<%@page import="com.cslsoftware.matchmaking.MatchMaking"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%
  	  Local local = new Local();
      Hindi hindi = new Hindi();
      int languageCode = (Integer)session.getAttribute("languageCode");
      com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction desktopHoroDllFunction = new com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction();
      com.cslsoftware.util.Util util = new com.cslsoftware.util.Util();

     
      MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
      
      MyResourceBundle rBBirthDetails = local.loadPropertiesFileNew("birthdetails",languageCode);
      MyResourceBundle rBBirthDetailsVarshphalallPages = local.loadPropertiesFileNew("birthdetails-varshphalallpages",languageCode);
      MyResourceBundle rBBirthDetailsMatchMakOut = local.loadPropertiesFileNew("birthdetails-matchmakingoutput",languageCode);
  %>
  
  <div class="hdg-lg card">
	<h1><%=rBConstants.getString("BASIC_DETAILS")%></h1>	
</div>




<%

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
GhatakFavourable ObjGhatak = new GhatakFavourable();
MatchMaking MatchMaking= new MatchMaking();

if(languageCode == 1)
{ 	
MatchMaking.setLanguageCode("1");
MatchMaking.initializesArrayValues();
myAstrologyObject.setLanguageCode("1");
myAstrologyObject.initialize();
ObjGhatak.setLanguageCode("1");
ObjGhatak.init();
}
else
{
	Constants ObjConst = new Constants();
	//out.println(System.getProperty("user.dir")+"/cloud/");

	ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));	
MatchMaking.setLanguageCode("0");
MatchMaking.initializesArrayValues();
myAstrologyObject.setLanguageCode("0");
myAstrologyObject.initialize();
ObjGhatak.setLanguageCode("0");
ObjGhatak.init();
}

int RasiNumber = myAstrologyObject.getRasi() + 1;
double DegOfMoon = myAstrologyObject.getMoon();



String Timezoneval =  myAstrologyObject.getTimeZone();
String Longitudedegree = myAstrologyObject.getDegreeOfLongitude();
String Longitudeminute = myAstrologyObject.getMinuteOfLongitude();
String hrs = myAstrologyObject.getHourOfBirth();
String min = myAstrologyObject.getMinuteOfBirth();
String sec = myAstrologyObject.getSecondOfBirth(); 
String longew = myAstrologyObject.getEastWest();

if(longew.toLowerCase().equals("w") || longew.toLowerCase().equals("0"))
{
Longitudedegree = String.valueOf(Integer.parseInt(Longitudedegree) * (-1));
Longitudeminute = String.valueOf(Integer.parseInt(Longitudeminute) * (-1));
}

//CODE TO PRINT PERSON DETAILS

String[] arrHeading = new String[22];
arrHeading[0] = rBBirthDetailsVarshphalallPages.getString("SEX_MF");
arrHeading[1] = rBConstants.getString("DATE_OF_BIRTH");
arrHeading[2] = rBConstants.getString("TIME_OF_BIRTH");
arrHeading[3] = rBBirthDetailsVarshphalallPages.getString("DAY_OF_BIRTH");
arrHeading[4] = rBBirthDetails.getString("ISHTKAAL");
arrHeading[5] = rBConstants.getString("PLACE_OF_BIRTH");
arrHeading[6] = rBBirthDetailsVarshphalallPages.getString("BIRTH_COUNTRY");
arrHeading[7] = rBConstants.getString("TIME_ZONE");
arrHeading[8] = rBConstants.getString("LATITUDE");
arrHeading[9] = rBConstants.getString("LONGITUDE");
arrHeading[10] = rBBirthDetailsVarshphalallPages.getString("LOCAL_TIME_CORRECTION");
arrHeading[11] = rBBirthDetailsVarshphalallPages.getString("WAR_TIME_CORRECTION");
arrHeading[12] = rBBirthDetailsVarshphalallPages.getString("LMT_AT_BIRTH");
arrHeading[13] = rBBirthDetails.getString("GMT_AT_BIRTH");

arrHeading[14] = rBConstants.getString("TITHI");
arrHeading[15] = rBBirthDetails.getString("HINDU_WEEK_DAY");
arrHeading[16] = rBBirthDetails.getString("PAKSHA");
arrHeading[17] = rBBirthDetailsVarshphalallPages.getString("YOGA");
arrHeading[18] = rBBirthDetailsVarshphalallPages.getString("KARAN");
arrHeading[19] = rBBirthDetailsVarshphalallPages.getString("SUNRISE");
arrHeading[20] = rBBirthDetailsVarshphalallPages.getString("SUNSET");
arrHeading[21] = rBBirthDetails.getString("DAY_DURATION");

//code for Vlaues Of person Detail

String[] myArray = new String[22];
String gender = myAstrologyObject.getMaleFemale().toUpperCase();
if(gender.equals("M"))
	gender = "MALE";
else if(gender.equals("F"))
	gender = "FEMALE";
myArray[0] = rBConstants.getString(gender);
myArray[1] = myAstrologyObject.getDayOfBirth() + " : " +	myAstrologyObject.getMonthOfBirth() +" : "+	myAstrologyObject.getYearOfBirth();
myArray[2] = myAstrologyObject.getHourOfBirth() + " : " +	myAstrologyObject.getMinuteOfBirth() +" : "+  myAstrologyObject.getSecondOfBirth();
myArray[3] = hindi.unicode(myAstrologyObject.getWeekdayName(),languageCode);
myArray[4] = hindi.unicode(myAstrologyObject.getIshtkaalDms(),languageCode);  
myArray[5] = myAstrologyObject.getPlace();//+":" + Space(1) + frmAstrologyNew.txtCity.Text();

myArray[6] = "";//country;
myArray[7] = myAstrologyObject.getTimeZone();
myArray[8] = myAstrologyObject.getDegreeOfLattitude() + " : " + myAstrologyObject.getMinuteOfLattitude() + " : " +myAstrologyObject.getNorthSouth(); //ns 
myArray[9] = myAstrologyObject.getDegreeOfLongitude() + " : " + myAstrologyObject.getMinuteOfLongitude() + " : " +myAstrologyObject.getEastWest(); //ew
myArray[10] = local.correctSeperator(myAstrologyObject.getLMTCorrectionHms());

myArray[11] =  local.correctSeperator(myAstrologyObject.getWarDaylightCorrectionHms());
myArray[12] =  local.correctSeperator(String.valueOf(desktopHoroDllFunction.GetLMTOfBirth(hrs,min,sec,Timezoneval,Longitudedegree,Longitudeminute)));
myArray[13] =  local.correctSeperator(String.valueOf(myAstrologyObject.getGmtAtBirth()));

myArray[19] =  local.correctSeperator(myAstrologyObject.getSunRiseTimeHms());
myArray[20] =  local.correctSeperator(myAstrologyObject.getSunSetTimeHms());
myArray[21] =  local.correctSeperator(myAstrologyObject.getDayDurationHms());
myArray[14] =  hindi.unicode(myAstrologyObject.getTithiName(),languageCode);

String[] Weekdays = new String[7];

Weekdays[0]=rBBirthDetails.getString("MONDAY");
Weekdays[1]=rBBirthDetails.getString("TUESDAY");
Weekdays[2]=rBBirthDetails.getString("WEDNESDAY");
Weekdays[3]=rBBirthDetails.getString("THURSDAY");
Weekdays[4]=rBBirthDetails.getString("FRIDAY");
Weekdays[5]=rBBirthDetails.getString("SATURDAY");
Weekdays[6]=rBBirthDetails.getString("SUNDAY");

int weekday;

if(String.valueOf(myAstrologyObject.getHinduWeekday()).equals("0"))
	
	weekday = myAstrologyObject.getHinduWeekday() + 6; 
else
	weekday = myAstrologyObject.getHinduWeekday() - 1;


myArray[15] =  Weekdays[weekday];
myArray[16] =  hindi.unicode(myAstrologyObject.getPakshaName(),languageCode);
myArray[17] =  hindi.unicode(com.ojassoft.astrosagecloud.util.Util.correctYogaName(myAstrologyObject.getYoganame()),languageCode);
myArray[18] =  hindi.unicode(myAstrologyObject.getKaranName(),languageCode);


//CODE FOR GMT TIME


 double GMTtime = Double.parseDouble(myArray[13]);
//double GMTtime = 10;

   if(GMTtime < 0)
    GMTtime = 24 + GMTtime;
    
    if(GMTtime >= 24)
       GMTtime = GMTtime - 24;
    
    String GMTtime1 = util.dms(GMTtime);
    myArray[13] = String.valueOf(GMTtime1);
     
     
     //*******CODE FOR LMT TIME **************
     double LMTtime= Double.parseDouble(myArray[12]);
    // double LMTtime= Integer.parseInt("10");
     
     if(LMTtime < 0)
         LMTtime = 24+LMTtime ;

     if(LMTtime >= 24)
         LMTtime = LMTtime-24;
   
    // LMTtime = dms(LMTtime);
   String LMTtime1 = util.dms(LMTtime);
   myArray[12] = local.correctSeperator1(String.valueOf(LMTtime1));
   myArray[13] = local.correctSeperator1(String.valueOf(GMTtime1));
   //******************************
  %>
  
  
  <div class="row mrt-30"> 
  <div class="col s12 l6">  
  <div class="card table-panel"> <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBBirthDetails.getString("PERSON_DETAILS")%> </h4> 
  
			
			<table class="highlight striped bordered ui-table ui-font">
				<%  for(int i=0 ; i<= 21 ;i++) {%>
				<tr>
					<td class="cellhead"><%=arrHeading[i] %> &nbsp;</td>

					<td class="cellcontent"><%=myArray[i]%>&nbsp;</td>
					<%}%>
				</tr>
			</table>
			</div>
			</div>
			
		<div class="col s12 l6">  
        <div class="card table-panel"> <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBBirthDetails.getString("AVKAHADA_CHAKRA")%> </h4> 


		
			<%
        //CODING FOR AVKAHADA CHAKRA
		 //***************************
		  //Redim myArray(21)
        
        String[] myArrayAVK = new String[22];

        myArrayAVK[0] = hindi.unicode(myAstrologyObject.getPayaName(),languageCode);
        myArrayAVK[1] = hindi.unicode(MatchMaking.getVarna(RasiNumber),languageCode);
        myArrayAVK[2] = hindi.unicode(MatchMaking.getYoni(DegOfMoon),languageCode);
        myArrayAVK[3] = hindi.unicode(MatchMaking.getGana(DegOfMoon),languageCode);
        myArrayAVK[4] = hindi.unicode(MatchMaking.getVashya(DegOfMoon),languageCode);
        myArrayAVK[5] = hindi.unicode(MatchMaking.getNadi(DegOfMoon),languageCode);
        myArrayAVK[6] = "";
        myArrayAVK[7] = com.ojassoft.astrosagecloud.util.Util.localizeBalOfDasha(myAstrologyObject.getBalanceOfDasa().toString(), languageCode, rBConstants);
        myArrayAVK[8] = hindi.unicode(myAstrologyObject.getAscendentSignName(),languageCode);
        myArrayAVK[9] = hindi.unicode(myAstrologyObject.getLagnaLordName(),languageCode);
        myArrayAVK[10] = hindi.unicode(myAstrologyObject.getRasiName(),languageCode);
        myArrayAVK[11] = hindi.unicode(myAstrologyObject.getRasiLordName(),languageCode);
        myArrayAVK[12] = hindi.unicode(myAstrologyObject.getNakshatraName(),languageCode)+ "-" + myAstrologyObject.getPadaOfPlanet(2);
        myArrayAVK[13] = hindi.unicode(myAstrologyObject.getNakshatraLordName(),languageCode);
        myArrayAVK[14] = "";
        myArrayAVK[15] = myAstrologyObject.getJulianDayValue();
        myArrayAVK[20] = hindi.unicode(myAstrologyObject.getObliquityDms(),languageCode);
        myArrayAVK[21] = local.correctSeperator(myAstrologyObject.getSiderealTimeHms());

        myArrayAVK[18] = hindi.unicode(myAstrologyObject.getAyanamsaDms(),languageCode);
        myArrayAVK[16] = hindi.unicode(myAstrologyObject.getIndianSunSignName(),languageCode);
        myArrayAVK[17] = hindi.unicode(myAstrologyObject.getSunSignName(),languageCode);
        
        int AynamsaType = Integer.parseInt(SharedFunction.getAyan(myAstrologyObject));
       
    	switch(AynamsaType){
		  case 0:			
			  myArrayAVK[19]= rBBirthDetailsVarshphalallPages.getString("LAHIRI_AYAN");
			  break;
		  case 1:
			  myArrayAVK[19]= rBConstants.getString("K_P_NEW");
			  break;
		  case 2:
			  myArrayAVK[19]= rBConstants.getString("K_P_OLD");
			  break;
		  case 3:
			  myArrayAVK[19]= rBBirthDetailsVarshphalallPages.getString("RAMAN");
			  break;
		  case 4:
			  myArrayAVK[19]= rBConstants.getString("K_P_KHULLAR");
			  break;
		  case 5:
			  myArrayAVK[19]= rBBirthDetailsVarshphalallPages.getString("SAAYAN");
			  break;
			  
    	}
        
    	
         String[] arrHeadingAVK = new String[22];
        
         arrHeadingAVK[0] = rBBirthDetails.getString("PAYA_RASIBASED");	      
         arrHeadingAVK[1] = rBBirthDetailsMatchMakOut.getString("VARNA");		    
         arrHeadingAVK[2] = rBBirthDetailsMatchMakOut.getString("YONI");		
         arrHeadingAVK[3] = rBBirthDetailsMatchMakOut.getString("GANA");
         arrHeadingAVK[4] = rBBirthDetailsMatchMakOut.getString("VASYA");
         arrHeadingAVK[5] = rBBirthDetailsMatchMakOut.getString("NADI");
         
         arrHeadingAVK[6] = "";
	      
         arrHeadingAVK[7] = rBConstants.getString("BALANCE_OF_DASHA");
         arrHeadingAVK[8] =  rBConstants.getString("LAGNA");
         arrHeadingAVK[9] =  rBBirthDetailsVarshphalallPages.getString("LAGNA_LORD");
         arrHeadingAVK[10] = rBBirthDetailsVarshphalallPages.getString("RASI");
	    
         arrHeadingAVK[11] = rBConstants.getString("RASI_LORD");
         arrHeadingAVK[12] = rBBirthDetails.getString("NAKSHATRA_PADA");
         arrHeadingAVK[13] = rBBirthDetailsVarshphalallPages.getString("NAKSHATRA_LORD");
         arrHeadingAVK[14] = "";
         arrHeadingAVK[15] = rBBirthDetails.getString("JULIAN_DAY");
         arrHeadingAVK[16] = rBBirthDetails.getString("SUNSIGN_INDIAN");
         arrHeadingAVK[17] = rBBirthDetails.getString("SUNSIGN_WESTERN");
         arrHeadingAVK[18] = rBConstants.getString("AYANAMSA");
         arrHeadingAVK[19] = rBBirthDetailsVarshphalallPages.getString("AYANAMSA_NAME");
         arrHeadingAVK[20] = rBBirthDetails.getString("OBLIQUITY");
         arrHeadingAVK[21] = rBBirthDetails.getString("SIDERAL_TIME");
	      
        %>

			
			<table class="highlight striped bordered ui-table ui-font">
				<%  for(int i=0 ; i<=21 ;i++){ %>
				<tr>
					<td class="cellhead"><%=arrHeadingAVK[i]%> &nbsp;</td>
					<td class="cellcontent"><%=myArrayAVK[i]%>&nbsp;</td>
					<%}%>

				</tr>
			</table>
	
  
  </div>
  </div>
  </div>
  
  <%@include file='ui-control/ad-content-area.jsp'%>
  
    <div class="row mrt-30"> 
  <div class="col s12 l6">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBBirthDetails.getString("FAVOURABLE_POINTS")%> </h4>
  <%
            //CODING FOR FAVOURABLE VALUES
            String[]  myArrayFAV =  new String[10] ;
            ObjGhatak.setJodiacSign(myAstrologyObject.getMoonSign() + 1);
            
            myArrayFAV[0] = ObjGhatak.getLuckyNumbers();
            myArrayFAV[1] = ObjGhatak.getGoodNumbers();
            myArrayFAV[2] = ObjGhatak.getEvilNumbers();
            myArrayFAV[3] = ObjGhatak.getGoodYears(); 
            myArrayFAV[4] = GetGhatakData(ObjGhatak.getLuckyDays(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
         
            myArrayFAV[5] =GetGhatakData(ObjGhatak.getGoodPlanets(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
         
            myArrayFAV[6] = GetGhatakData(ObjGhatak.getFriendlySigns(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
         
            myArrayFAV[7] = GetGhatakData(ObjGhatak.getGoodLagna(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
         
            myArrayFAV[8] = GetGhatakData(ObjGhatak.getLuckyMetal(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
         
            myArrayFAV[9] = GetGhatakData(ObjGhatak.getLuckyStone(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
          
            
            //Code For Heading Of Favourable Points
     
            String[] arrHeadingFAV =  new  String[10];
            arrHeadingFAV[0] = rBBirthDetails.getString("LUCKY_NUMBERS");
            arrHeadingFAV[1] = rBBirthDetails.getString("GOOD_NUMBERS");
            arrHeadingFAV[2] = rBBirthDetails.getString("EVIL_NUMBERS");
            arrHeadingFAV[3] = rBBirthDetails.getString("GOOD_YEARS");
            arrHeadingFAV[4] = rBBirthDetails.getString("LUCKY_DAYS");
            arrHeadingFAV[5] = rBBirthDetails.getString("GOOD_PLANETS");
            arrHeadingFAV[6] = rBBirthDetails.getString("FRIENDLY_SIGNS");
            arrHeadingFAV[7] = rBBirthDetails.getString("GOOD_LAGNA");
            arrHeadingFAV[8] = rBBirthDetails.getString("LUCKY_METAL");
            arrHeadingFAV[9] = rBBirthDetails.getString("LUCKY_STONE");
           
            %>

			
			<table class="highlight striped bordered ui-table ui-font">
				<%  for(int i=0 ; i<=9 ;i++){ %>
				<tr>
					<td class="cellhead"><%=arrHeadingFAV[i]%> &nbsp;</td>
					<td class="cellcontent"><%=myArrayFAV[i]%>&nbsp;</td>
					<%}%>
				</tr>
			</table>
		</td>

		<!--include virtual="/DbConnection.inc"-->

		<%
/*
dim  StrSql, CmdObj,Rscity,ConnObj,cityid
cityid=Session("CityId")

 instantChart=request.QueryString("instantChart")
 


If cityid <> 0 Then

set Rscity=server.createObject("ADODB.Recordset")
 
StrSql="Select Country_Master.*,City_Master.* from city_Master LEFT JOIN Country_Master ON  City_Master.[countryCode]=Country_Master.[countrycode] where City_Master.city_ID=" & CityId


Rscity.Open StrSql,ConnObjInc,3,3


       if not Rscity.EOF then
           country=Rscity.Fields("country")
       end if
       
Else
  country = Request("country")
  
End If 

*/

%>
		<%!

//*********Function To Format The String
/*Function FormatString(strText ) 
	FormatString = UCase(Left(strText, 1)) & LCase(Mid(strText, 2, Len(strText)))
End Function*/
//*****************

%>

		<%
  
         Double d = new Double(myAstrologyObject.getMoon()/30 + 1);
         ObjGhatak.setJodiacSign(d.intValue());
        // ObjGhatak.setJodiacSign((Integer.parseInt(String.valueOf(myAstrologyObject.getMoon()/30 + 1))));
        
		  
		  String[] myArrayGHT =  new String[10];
		  myArrayGHT[0] = GetGhatakData(ObjGhatak.getGhatakDay(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  myArrayGHT[1] = GetGhatakData(ObjGhatak.getGhatakKaran(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  myArrayGHT[2] = GetGhatakData(ObjGhatak.getGhatakLagna(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  myArrayGHT[3] = GetGhatakData(ObjGhatak.getGhatakMonths(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  myArrayGHT[4] = GetGhatakData(ObjGhatak.getGhatakNakshatra(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  myArrayGHT[5] = ObjGhatak.getGhatakPrahar();
		  myArrayGHT[6] = GetGhatakData(ObjGhatak.getGhatakRasi(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  myArrayGHT[7] = ObjGhatak.getGhatakTithi();
		  myArrayGHT[8] = GetGhatakData(ObjGhatak.getGhatakYoga(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  myArrayGHT[9] = GetGhatakData(ObjGhatak.getEvilPlanets(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
		  //Code For Heading Of Ghatak Values
		  
		  String[] arrHeadingGHT = new  String[10];
		  arrHeadingGHT[0] = rBBirthDetails.getString("BAD_DAY");
		  arrHeadingGHT[1] = rBBirthDetails.getString("BAD_KARAN");
		  arrHeadingGHT[2] = rBBirthDetails.getString("BAD_LAGNA");
		  arrHeadingGHT[3] = rBBirthDetails.getString("BAD_MONTH");
		  arrHeadingGHT[4] = rBBirthDetails.getString("BAD_NAKSHATRA");
		  arrHeadingGHT[5] = rBBirthDetails.getString("BAD_PRAHAR");
		  arrHeadingGHT[6] = rBBirthDetails.getString("BAD_RASI");
		  arrHeadingGHT[7] = rBBirthDetails.getString("BAD_TITHI");
		  arrHeadingGHT[8] = rBBirthDetails.getString("BAD_YOGA");
		  arrHeadingGHT[9] = rBBirthDetails.getString("EVIL_PLANETS");
    %>
  </div>
  </div>
  
  <div class="col s12 l6">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBBirthDetails.getString("GHATAK")%> </h4>
  <table class="highlight striped bordered ui-table ui-font">
				
				<%  for(int i=0 ;i<=9 ; i++){ %>
				<tr>
					<td class="cellhead"><%=arrHeadingGHT[i] %> &nbsp;</td>
					<td class="cellcontent"><%=myArrayGHT[i]%>&nbsp;</td>
					<%}%>
				</tr>
			</table>
  </div>
  </div>
  
  </div>




<%@include file='calculations-footer.jsp'%>
<%!public String GetGhatakData(String Ghatakdata,String Firstdelimiter,String Seconddelimiter,int Languagecode ,MyProperties rBconstants,Hindi Hindi ,MyResourceBundle rBBirthDetails){
	 String flag = "0";
	 String Ghatakreturndata= "";
	 String tempstr ="";
	 String Delimiter = "";
	 String[] Ghatakarr = new String[4];
		if(Languagecode == 0 || Languagecode == 1)
		{
			 if(Ghatakdata.equals("ihyk uhye"))
			 {
			           Ghatakdata = "iq[kjkt";
			 }
		        Ghatakreturndata = Hindi.unicode(Ghatakdata,Languagecode);
		}
		        else{
		       tempstr = "" ;
		        
	           if(Ghatakdata.indexOf(Firstdelimiter)> 0){
		       
		              Ghatakarr = Ghatakdata.split(Firstdelimiter);
		              Delimiter = Firstdelimiter ;
		              flag = "1";}
		     
		         else if((Ghatakdata.indexOf(Seconddelimiter))>0 ){
		            Ghatakarr = Ghatakdata.split(Seconddelimiter);
		            Delimiter = Seconddelimiter;
		            flag = "1";}
		      
		        if(flag != "0"){
		            for(int arrcounter=0 ; arrcounter< Ghatakarr.length ; arrcounter++){
		            	try{
		                tempstr = tempstr + rBconstants.getString((Ghatakarr[arrcounter].toUpperCase()).replaceAll(" ", ""))+Delimiter ;
		              //  tempstr = tempstr + Ghatakarr[arrcounter].toUpperCase()+Delimiter ;
		            	}
		            	   catch(Exception e)
			               {
		            		 //  tempstr = tempstr + Ghatakarr[arrcounter].toUpperCase()+Delimiter ;
		            		 tempstr = tempstr + rBBirthDetails.getString((Ghatakarr[arrcounter].toUpperCase()).replaceAll(" ", ""))+Delimiter ;
			               }
			               
		              // tempstr = tempstr + Ghatakarr[arrcounter].toUpperCase()+Delimiter ;
		            }

		            tempstr =  tempstr.substring(0, tempstr.length()-1);
		        }
		        else{
		       	
		             //  tempstr = rBconstants.getString(Ghatakdata.toUpperCase());
		             try{
		            	 tempstr = rBBirthDetails.getString(Ghatakdata.toUpperCase().replaceAll(" ", ""));
		            	
		               }
		               catch(Exception e)
		               {
		            	   tempstr = rBconstants.getString(Ghatakdata.toUpperCase().replaceAll(" ", ""));; 
		               }
		             //tempstr = Ghatakdata;
		        }
		       Ghatakreturndata = tempstr;
		        
		        }
	return Ghatakreturndata;
}%>

