<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
       DesktopHoro myAstrologyObj = (DesktopHoro)session.getAttribute("HoroscopeObj");
       int languageCode = 1;//(Integer)session.getAttribute("languageCode");
       String[] myPlanetNames = new String[12];
       int rasiForPrediction = myAstrologyObj.getAscendentSign();
       Hindi hindi = new Hindi();
        
        myPlanetNames[1]="सूर्य";
        myPlanetNames[2]="चंद्र";
        myPlanetNames[3]="मंगल";										   
        myPlanetNames[4]="बुध";				  
        myPlanetNames[5]="गुरु";					   
        myPlanetNames[6]="शुक्र";
        myPlanetNames[7]="शनि";
        myPlanetNames[8]="राहु";
        myPlanetNames[9]="केतु";
        
        int[] planetrasi = myAstrologyObj.getPositionForShodasvarg(0);
        myAstrologyObj.getVimsottariDasaTwoLevel();

//*****************************************Print विंषोत्तरी महादशा फल in Hindi Language*****************************************
%>


<div class="hdg-lg card">
	<h1>विंषोत्तरी महादशा फल</h1>	
</div>



<div class="mrt-30 mrb-30"> 



<%
for(int i = 1 ;i<= 9;i++){

    String  dasa = myAstrologyObj.getMahaDasa(i-1);
    String dasaLord = myAstrologyObj.getMahaDasa(i-1).substring(0, 3);//Left(myAstrologyObj.getMahaDasa(i-1), 3);
    int dasaLordNumber = PlanetNumber(dasaLord);
    String dasaTill = hindi.unicode(dasa.substring(dasa.length()-10),0);;//dasa.substring(dasa.length()-1,8);//Right(dasa, 8)
    String dasaFrom = "";
    if(i == 1){ 
        dasaFrom = "जन्म";
    }else {
    	dasaFrom = myAstrologyObj.getMahaDasa(i-2);
	    dasaFrom = hindi.unicode(dasaFrom.substring(dasaFrom.length()-8),0);
        //dasaFrom =myAstrologyObj.getMahaDasa(i-2).substring(myAstrologyObj.getMahaDasa(i-2).length()-1,8);// Right(myAstrologyObj.getMahaDasa(i-2), 8)
    }
    
    int bhava = planetrasi[dasaLordNumber] - rasiForPrediction + 1;
    if(bhava < 1 ){
	    bhava = bhava + 12;
    }
   CloudDAO CD = new CloudDAO();
   String rsdata =  CD.GetPrediction(dasaLordNumber,bhava,1,null,hindi);
    
    String MuddaPrediction = "";
    if(!rsdata.equals("")) {
        MuddaPrediction = rsdata;
    } else  {
    	MuddaPrediction = " ";
    }
   // dim PlanetaryRasiName
   String PlanetaryRasiName = myAstrologyObj.getPlanetaryRasiName(dasaLordNumber);
        switch(PlanetaryRasiName){
        case  "Aries":
	            PlanetaryRasiName = "मेष";
	            break;
        case  "Taurus":
	            PlanetaryRasiName = "वृषभ";
	            break;
        case  "Gemini":
	            PlanetaryRasiName = "मिथुन";
                break;
        case  "Cancer":
	            PlanetaryRasiName = "कर्क";
	            break;
        case  "Leo":
	            PlanetaryRasiName = "सिंह";
	            break;
        case  "Virgo":
	            PlanetaryRasiName = "क्न्या";
	            break;
        case  "Libra":
	            PlanetaryRasiName = "तुला";
	            break;
        case  "Scorpion":
	            PlanetaryRasiName = "वृश्चिक";
	            break;
        case  "Sagittarius":
	            PlanetaryRasiName = "धनु";
	            break;
        case  "Capricorn":
	            PlanetaryRasiName = "मकर";
	            break;
        case  "Aquarius":
	            PlanetaryRasiName = "कुम्भ";
	            break;
        case  "Pisces":
	            PlanetaryRasiName = "मीन";
	            break;    
        }
    out.println("<div class='card hdg-content padding-all mrt-20'><h2>" + myPlanetNames[dasaLordNumber] +  " महादशा फल (" + dasaFrom + " - " + dasaTill + ")</h2>");
    out.println("<p><b>" + myPlanetNames[dasaLordNumber] + " " + PlanetaryRasiName + " राशि में आपके  " + bhava + " भाव में स्थिति हैं</b></p>");
    out.println("<p>" + FormatString(MuddaPrediction).replace("year","period") + "</p></div>");
    //shmRsCity.Close
}




//*****************************************Print End  Transit Today in Hindi Language***************************************** 
%>


<%@include file='hindiprediction-footer.jsp'%>



 
 </div>

 
 <%!
 public int PlanetNumber (String PlanetName){
 int PlanetNumber =0;
 switch(PlanetName){
 case "SUN":
	    PlanetNumber = 1;
	    break;
 case "MON":
	    PlanetNumber = 2;
	    break;
 case "MAR":
	    PlanetNumber = 3;
	    break;
 case "MER":
	    PlanetNumber = 4;
	    break;
 case "JUP":
	    PlanetNumber = 5;
	    break;
 case "VEN":
	    PlanetNumber = 6;
	    break;
 case "SAT":
	    PlanetNumber = 7;
	    break;
 case "RAH":
	    PlanetNumber = 8;
	    break;
 case "KET":
	    PlanetNumber = 9;
	    break;
 }
 return PlanetNumber;
 }
 
 //********************Code Of Function FormartString
public String FormatString(String strText)
	{
	   return SharedFunction.ProperCaseL(strText, 0);
	}

 %>
 