<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%   Hindi hindi = new Hindi();
     final DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
     Date date = new Date();
     String FullDate[]=sdf.format(date).split(" ");
     String year[]=FullDate[0].split("/");
     String time[]=FullDate[1].split(":");
	//INITIALIZE HORODESKTOP OBJECT WITH EITHER FORM OR DATABASE VALUES
	DesktopHoro ObjHoro=new DesktopHoro();
    Constants ObjConst=new Constants();
    ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
	ObjHoro.setName("punit");
    ObjHoro.setPlace("noida");
    ObjHoro.setCompanyAddLine1("Delhi");
    ObjHoro.setCompanyName("AstroCAMP");
    ObjHoro.setTimeZone("5.5");
    ObjHoro.setMaleFemale("F");
    ObjHoro.setSecondOfBirth("0");
    ObjHoro.setMinuteOfBirth("0");
    ObjHoro.setHourOfBirth("0");
    ObjHoro.setDayOfBirth(year[2]);
    ObjHoro.setMonthOfBirth(year[1]);
    ObjHoro.setYearOfBirth(year[0]);
    ObjHoro.setDegreeOfLattitude("27");
    ObjHoro.setDegreeOfLongitude("78");
    ObjHoro.setSecondOfLattitude("00");
    ObjHoro.setSecondOfLongitude("00");
    ObjHoro.setMinuteOfLongitude("00");
    ObjHoro.setMinuteOfLattitude("00");
    ObjHoro.setEastWest("E");
    ObjHoro.setNorthSouth("N");
    ObjHoro.setDST("0");
    ObjHoro.setLanguageCode("1");
    ObjHoro.setAyan(0);
	ObjHoro.initialize();
	DesktopHoro myAstrologyObj = (DesktopHoro)session.getAttribute("HoroscopeObj");
	
    int RasiForPrediction = myAstrologyObj.getAscendentSign();
    String[] myPlanetNames =  new String[12];
        myPlanetNames[1]="सूर्य";
        myPlanetNames[2]="चंद्र";
        myPlanetNames[3]="मंगल";										   
        myPlanetNames[4]="बुध";					  
        myPlanetNames[5]="गुरु";					   
        myPlanetNames[6]="शुक्र";
        myPlanetNames[7]="शनि";
        myPlanetNames[8]="राहु";
        myPlanetNames[9]="केतु";
        int[] planetrasi = ObjHoro.getPositionForShodasvarg(0);
        
      
       //*****************************************Print Transit Today in Hindi Language****************************************
 %>
<div class="hdg-lg card">
	<h1>विंषोत्तरी महादशा फल</h1>	
</div>



<div class="mrt-30 mrb-30"> 
 <%       
                   
       for(int i = 1 ;i<=9;i++){
            
            int bhava = planetrasi[i] - RasiForPrediction + 1;
            if(bhava < 1){
	            bhava = bhava + 12;
             }
                
               String MuddaPrediction="";
               CloudDAO CD = new CloudDAO();
                String rsdata =  CD.GetPrediction(i,bhava,1,null,hindi);
                if(!rsdata.equals("")){
                    MuddaPrediction = rsdata;
                }else {
                    MuddaPrediction = " ";
                }
                out.print("<div class='card hdg-content padding-all mrt-20'><h2>" + myPlanetNames[i] + " " + FormatString(hindi.unicode(ObjHoro.getPlanetaryRasiName(i),1)) + " राशि में आपके  " + bhava + " भाव में स्थिति हैं</h2>");
                out.print("<p>" + FormatString(MuddaPrediction) + "</p></div>");
               // shmRsCity.Close
       }
      
       //*****************************************Print End  Transit Today in Hindi Language*****************************************        
%>

  <%@include file='hindiprediction-footer.jsp'%>


 </div>
 <%!
 
//********************Code Of Function FormartString
public String FormatString(String strText)
	{
	   return SharedFunction.ProperCaseL(strText, 0);
	}

%>
 