<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
DesktopHoro ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
DesktopHoro ObjCurrHoro = new DesktopHoro();
Constants ObjConst = new Constants();

//ObjConst.setConstPath(System.getProperty("user.dir")+"/cloud/");
ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
Calendar jCal = Calendar.getInstance();
int day = jCal.get(Calendar.DATE);
int month = jCal.get(Calendar.MONTH)+1;
int year = jCal.get(Calendar.YEAR);
int currHour =  jCal.get(Calendar.HOUR_OF_DAY);
int currMin =   jCal.get(Calendar.MINUTE);
int currSec = 	jCal.get(Calendar.SECOND);
//ObjCurrHoro.setName(name);
//ObjCurrHoro.setPlace(place);
ObjCurrHoro.setCompanyAddLine1 ("Delhi");
ObjCurrHoro.setCompanyName ("CSL Software Ltd");
ObjCurrHoro.setTimeZone(ObjHoro.getTimeZone());
ObjCurrHoro.setMaleFemale(ObjHoro.getMaleFemale());
ObjCurrHoro.setSecondOfBirth(String.valueOf(currSec));
ObjCurrHoro.setMinuteOfBirth(String.valueOf(currMin));
ObjCurrHoro.setHourOfBirth(String.valueOf(currHour));
ObjCurrHoro.setDayOfBirth(String.valueOf(day));
ObjCurrHoro.setMonthOfBirth(String.valueOf(month));
ObjCurrHoro.setYearOfBirth(String.valueOf(year));
ObjCurrHoro.setDegreeOfLattitude(ObjHoro.getDegreeOfLattitude());
ObjCurrHoro.setDegreeOfLongitude(ObjHoro.getDegreeOfLongitude());
ObjCurrHoro.setSecondOfLattitude("00");
ObjCurrHoro.setSecondOfLongitude("00");
ObjCurrHoro.setMinuteOfLongitude(ObjHoro.getMinuteOfLongitude());
ObjCurrHoro.setMinuteOfLattitude(ObjHoro.getMinuteOfLattitude());
ObjCurrHoro.setEastWest("E");
ObjCurrHoro.setNorthSouth("N");
ObjCurrHoro.setDST("00");
//ObjCurrHoro.setAyan(ayanamsa1);
ObjCurrHoro.initialize();

int[] arrPlanetsShodashvarga = ObjHoro.getPositionForShodasvarg(0);
int[] T_arrPlanetsShodashvarga = ObjCurrHoro.getPositionForShodasvarg(0);
int[] raashiNoCorrespondingToPlanets1 = new int[13];
for(int k = 0 ;k<= 12;k++){
   raashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];   
}
int[] tempraashi = new int[13];
int[] myRashi = new int[13];
int[] T_planetno = new int[13];
int[] T_planetnonew = new int[13];
int[] RaashiNo  =  SharedFunction.getRaashi(raashiNoCorrespondingToPlanets1[0]);
int count=0;

for(int i=0 ;i<= 12;i++){
    if(RaashiNo[i]>=1){
        tempraashi[count]=RaashiNo[i];     
        count=count+1;
    }
}
for(int i=0 ;i<= 11 ;i++){
    myRashi[i+1]=tempraashi[i]+1;    
}
//Neha*******************
for(int i=0 ;i<= 12;i++){   
	if(myRashi[i]<=0 ){
		myRashi[i]=myRashi[i]+12;
	   }
	   if(myRashi[i]>12 ){
		   myRashi[i]=myRashi[i]-12;
		   }
}
//Redim T_planetno(12)

for(int i=1 ; i<= 12; i++){  
   T_planetno[i-1]=T_arrPlanetsShodashvarga[i];
   
}  
int detect=tempraashi[0]-1;
for(int i=0 ;i<= 11;i++){   
   T_planetno[i]=T_planetno[i]-detect;   
   if(T_planetno[i]<=0 ){
      T_planetno[i]=T_planetno[i]+12;
   }
   if(T_planetno[i]>12 ){
	      T_planetno[i]=T_planetno[i]-12;
	   }
   
  
}
for(int i=0 ;i<= 11;i++){
    T_planetnonew[i+1] = T_planetno[i];
}  
T_planetnonew[0] = myRashi[12];
T_arrPlanetsShodashvarga[0] = myRashi[12];


String ReturnJSONObj = "[{";
ReturnJSONObj = ReturnJSONObj+"'arrayval':["+T_planetnonew[0]+","+T_planetnonew[1]+","+T_planetnonew[2]+","+T_planetnonew[3]+","+T_planetnonew[4]+","+T_planetnonew[5]+","+T_planetnonew[6]+","+T_planetnonew[7]+","+T_planetnonew[8]+","+T_planetnonew[9]+","+T_planetnonew[10]+","+T_planetnonew[11]+","+T_planetnonew[12]+"],";
ReturnJSONObj = ReturnJSONObj+"'RashiPlanetForSouth':["+T_arrPlanetsShodashvarga[0]+","+T_arrPlanetsShodashvarga[1]+","+T_arrPlanetsShodashvarga[2]+","+T_arrPlanetsShodashvarga[3]+","+T_arrPlanetsShodashvarga[4]+","+T_arrPlanetsShodashvarga[5]+","+T_arrPlanetsShodashvarga[6]+","+T_arrPlanetsShodashvarga[7]+","+T_arrPlanetsShodashvarga[8]+","+T_arrPlanetsShodashvarga[9]+","+T_arrPlanetsShodashvarga[10]+","+T_arrPlanetsShodashvarga[11]+","+T_arrPlanetsShodashvarga[12]+"]";
ReturnJSONObj = ReturnJSONObj+"}]";
out.println(ReturnJSONObj);  

%>