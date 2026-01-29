<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.matchmaking.MatchMaking"%>
<%@page import="com.cslsoftware.ghatakfavourable.GhatakFavourable"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%
  	  Local localBD = new Local();
      Hindi hindiBD = new Hindi();
      int languageCodeBD = Util.safeInt(session.getAttribute("languageCode"));
      com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction desktopHoroDllFunction = new com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction();
      com.cslsoftware.util.Util util = new com.cslsoftware.util.Util();

     
      MyProperties rBConstantsBD = (MyProperties) session.getAttribute("constants");
      
      MyResourceBundle rBBirthDetailsBD = localBD.loadPropertiesFileNew("birthdetails",languageCodeBD);
      MyResourceBundle rBBirthDetailsVarshphalallPagesBD = localBD.loadPropertiesFileNew("birthdetails-varshphalallpages",languageCodeBD);
      MyResourceBundle rBBirthDetailsMatchMakOutBD = localBD.loadPropertiesFileNew("birthdetails-matchmakingoutput",languageCodeBD);
      
      DesktopHoro myAstrologyObjectBD = (DesktopHoro)session.getAttribute("HoroscopeObj");
      GhatakFavourable ObjGhatak = new GhatakFavourable();
      MatchMaking MatchMaking= new MatchMaking();

      if(languageCodeBD == 1)
      { 	
      MatchMaking.setLanguageCode("1");
      MatchMaking.initializesArrayValues();
      myAstrologyObjectBD.setLanguageCode("1");
      myAstrologyObjectBD.initialize();
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
      myAstrologyObjectBD.setLanguageCode("0");
      myAstrologyObjectBD.initialize();
      ObjGhatak.setLanguageCode("0");
      ObjGhatak.init();
      }

      int RasiNumber = myAstrologyObjectBD.getRasi() + 1;
      double DegOfMoon = myAstrologyObjectBD.getMoon();



      String Timezoneval =  myAstrologyObjectBD.getTimeZone();
      String Longitudedegree = myAstrologyObjectBD.getDegreeOfLongitude();
      String Longitudeminute = myAstrologyObjectBD.getMinuteOfLongitude();
      String hrs = myAstrologyObjectBD.getHourOfBirth();
      String min = myAstrologyObjectBD.getMinuteOfBirth();
      String sec = myAstrologyObjectBD.getSecondOfBirth(); 
      String longew = myAstrologyObjectBD.getEastWest();

      if(longew.toLowerCase().equals("w") || longew.toLowerCase().equals("0"))
      {
      Longitudedegree = String.valueOf(Integer.parseInt(Longitudedegree) * (-1));
      Longitudeminute = String.valueOf(Integer.parseInt(Longitudeminute) * (-1));
      }

      //CODE TO PRINT PERSON DETAILS

      String[] arrHeading = new String[22];
      arrHeading[0] = rBBirthDetailsVarshphalallPagesBD.getString("SEX_MF");
      arrHeading[1] = rBConstantsBD.getString("DATE_OF_BIRTH");
      arrHeading[2] = rBConstantsBD.getString("TIME_OF_BIRTH");
      arrHeading[3] = rBBirthDetailsVarshphalallPagesBD.getString("DAY_OF_BIRTH");
      arrHeading[4] = rBBirthDetailsBD.getString("ISHTKAAL");
      arrHeading[5] = rBConstantsBD.getString("PLACE_OF_BIRTH");
      arrHeading[6] = rBBirthDetailsVarshphalallPagesBD.getString("BIRTH_COUNTRY");
      arrHeading[7] = rBConstantsBD.getString("TIME_ZONE");
      arrHeading[8] = rBConstantsBD.getString("LATITUDE");
      arrHeading[9] = rBConstantsBD.getString("LONGITUDE");
      arrHeading[10] = rBBirthDetailsVarshphalallPagesBD.getString("LOCAL_TIME_CORRECTION");
      arrHeading[11] = rBBirthDetailsVarshphalallPagesBD.getString("WAR_TIME_CORRECTION");
      arrHeading[12] = rBBirthDetailsVarshphalallPagesBD.getString("LMT_AT_BIRTH");
      arrHeading[13] = rBBirthDetailsBD.getString("GMT_AT_BIRTH");

      arrHeading[14] = rBConstantsBD.getString("TITHI");
      arrHeading[15] = rBBirthDetailsBD.getString("HINDU_WEEK_DAY");
      arrHeading[16] = rBBirthDetailsBD.getString("PAKSHA");
      arrHeading[17] = rBBirthDetailsVarshphalallPagesBD.getString("YOGA");
      arrHeading[18] = rBBirthDetailsVarshphalallPagesBD.getString("KARAN");
      arrHeading[19] = rBBirthDetailsVarshphalallPagesBD.getString("SUNRISE");
      arrHeading[20] = rBBirthDetailsVarshphalallPagesBD.getString("SUNSET");
      arrHeading[21] = rBBirthDetailsBD.getString("DAY_DURATION");

      //code for Vlaues Of person Detail

      String[] myArray = new String[22];
      myArray[0] = rBConstantsBD.getString(myAstrologyObjectBD.getMaleFemale().toUpperCase());
      myArray[1] = myAstrologyObjectBD.getDayOfBirth() + " : " +	myAstrologyObjectBD.getMonthOfBirth() +" : "+	myAstrologyObjectBD.getYearOfBirth();
      myArray[2] = myAstrologyObjectBD.getHourOfBirth() + " : " +	myAstrologyObjectBD.getMinuteOfBirth() +" : "+  myAstrologyObjectBD.getSecondOfBirth();
      myArray[3] = hindiBD.unicode(myAstrologyObjectBD.getWeekdayName(),languageCodeBD);
      myArray[4] = hindiBD.unicode(myAstrologyObjectBD.getIshtkaalDms(),languageCodeBD);  
      myArray[5] = myAstrologyObjectBD.getPlace();//+":" + Space(1) + frmAstrologyNew.txtCity.Text();

      myArray[6] = "";//country;
      myArray[7] = myAstrologyObjectBD.getTimeZone();
      myArray[8] = myAstrologyObjectBD.getDegreeOfLattitude() + " : " + myAstrologyObjectBD.getMinuteOfLattitude() + " : " +myAstrologyObjectBD.getNorthSouth(); //ns 
      myArray[9] = myAstrologyObjectBD.getDegreeOfLongitude() + " : " + myAstrologyObjectBD.getMinuteOfLongitude() + " : " +myAstrologyObjectBD.getEastWest(); //ew
      myArray[10] = localBD.correctSeperator(myAstrologyObjectBD.getLMTCorrectionHms());

      myArray[11] =  localBD.correctSeperator(myAstrologyObjectBD.getWarDaylightCorrectionHms());
      myArray[12] =  localBD.correctSeperator(String.valueOf(desktopHoroDllFunction.GetLMTOfBirth(hrs,min,sec,Timezoneval,Longitudedegree,Longitudeminute)));
      myArray[13] =  localBD.correctSeperator(String.valueOf(myAstrologyObjectBD.getGmtAtBirth()));

      myArray[19] =  localBD.correctSeperator(myAstrologyObjectBD.getSunRiseTimeHms());
      myArray[20] =  localBD.correctSeperator(myAstrologyObjectBD.getSunSetTimeHms());
      myArray[21] =  localBD.correctSeperator(myAstrologyObjectBD.getDayDurationHms());
      myArray[14] =  hindiBD.unicode(myAstrologyObjectBD.getTithiName(),languageCodeBD);

      String[] Weekdays = new String[7];

      Weekdays[0]=rBBirthDetailsBD.getString("MONDAY");
      Weekdays[1]=rBBirthDetailsBD.getString("TUESDAY");
      Weekdays[2]=rBBirthDetailsBD.getString("WEDNESDAY");
      Weekdays[3]=rBBirthDetailsBD.getString("THURSDAY");
      Weekdays[4]=rBBirthDetailsBD.getString("FRIDAY");
      Weekdays[5]=rBBirthDetailsBD.getString("SATURDAY");
      Weekdays[6]=rBBirthDetailsBD.getString("SUNDAY");

      int weekday;

      if(String.valueOf(myAstrologyObjectBD.getHinduWeekday()).equals("0"))
      	
      	weekday = myAstrologyObjectBD.getHinduWeekday() + 6; 
      else
      	weekday = myAstrologyObjectBD.getHinduWeekday() - 1;


      myArray[15] =  Weekdays[weekday];
      myArray[16] =  hindiBD.unicode(myAstrologyObjectBD.getPakshaName(),languageCodeBD);
      myArray[17] =  hindiBD.unicode(com.ojassoft.astrosagecloud.util.Util.correctYogaName(myAstrologyObjectBD.getYoganame()),languageCodeBD);
      myArray[18] =  hindiBD.unicode(myAstrologyObjectBD.getKaranName(),languageCodeBD);


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
         myArray[12] = localBD.correctSeperator1(String.valueOf(LMTtime1));
         myArray[13] = localBD.correctSeperator1(String.valueOf(GMTtime1));
  %>
<div align="center">
    <h2>
        <%=rBBirthDetailsBD.getString("PERSON_DETAILS")%></h2>
</div>
<table class="table table-striped">
    <tbody>
        <%  for(int i=0;i<=21;i++) { %>
        <tr>
            <td align="right" width="49%">
                <b>
                    <%=arrHeading[i] %>
                </b>
            </td>
            <td align="center" width="1%">
                :
            </td>
            <td width="49%">
                <%=myArray[i]%>
            </td>
            <% } %>
        </tr>
    </tbody>
</table>
