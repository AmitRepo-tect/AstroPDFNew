<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.cslsoftware.varshphala.Varshphala"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
Varshphala objVarshPhal = new Varshphala();
int languageCode = (Integer)session.getAttribute("languageCode");


    int  myvalue=Calendar.getInstance().get(Calendar.YEAR);
    myvalue = myvalue - Integer.parseInt(String.valueOf(myAstrologyObject.getYearOfBirth()));          
    int currYear=myvalue + myAstrologyObject.getYearOfBirth();
    
                 
   if(myvalue!=0) {   
	initializeVarshPhal(myvalue, myAstrologyObject.getYearOfBirth(),myAstrologyObject,objVarshPhal,languageCode);
 }
    
   int intJD = Integer.parseInt(String.valueOf(objVarshPhal.calculateJdForVarshphal()));
   int intVarshYear = objVarshPhal.getVarshphalYear();
   //out.println(intVarshYear+","+intJD);
   int[] arrVarshPhal = objVarshPhal.getVarshphal(intVarshYear, intJD);
   objVarshPhal.initializeForBirthTime();
   objVarshPhal.initializeForVarshphala();
   objVarshPhal.calculateMuntha();
   objVarshPhal.calculateOpeningDasa();
   
   int[] arrPlanetsShodashvarga = objVarshPhal.getPositionForShodasvarg(0);
   
   int[] raashiNoCorrespondingToPlanets1 =  new int[13]; 
   int[] tempraashi =  new int[13]; 
   int[] myRashi =  new int[13]; 
   int[] planetno =  new int[13]; 
   
    for(int k = 0 ; k<= 12;k++){
        raashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
    }
    
   int[] raashiNo =  SharedFunction.getRaashi(raashiNoCorrespondingToPlanets1[0]);
   int count=0;
   for (int i=0 ; i<= 12 ; i++){
        if(raashiNo[i]>=1){
            tempraashi[count]=raashiNo[i];
            count=count+1;
        }
   }
   
    int mycount=count;
    int mycount2=count;
    for(int i=0 ; i<= mycount-1; i++){
        tempraashi[mycount2]=raashiNo[i];   
    }    
      
    for(int i=0 ; i<= 11;i++){
        myRashi[i+1]=tempraashi[i]+1;
      }
    
    for(int i=1;i<= 12;i++){
        planetno[i-1]=raashiNoCorrespondingToPlanets1[i];
    }	
      
    int detect=tempraashi[0]-1;
    for(int i=0 ;i<= 11;i++){
        planetno[i]=planetno[i]-detect;
        if(planetno[i]<=0) {
            planetno[i]=planetno[i]+12;
        }
    }	  
      
    String ReturnJSONObj = "[{'arrayval':["+myRashi[12]+","+planetno[0]+","+planetno[1]+","+planetno[2]+","+planetno[3]+","+planetno[4]+","+planetno[5]+","+planetno[6]+","+planetno[7]+","+planetno[8]+","+planetno[9]+","+planetno[10]+","+planetno[11]+"]}]";
    out.println(ReturnJSONObj); 
    %>
    <%!
    public void initializeVarshPhal(int intInput ,int strYear,DesktopHoro myAstrologyObject,Varshphala objVarshPhal , int languageCode) throws Exception{
	objVarshPhal.setName (myAstrologyObject.getName());
	objVarshPhal.setPlace (myAstrologyObject.getPlace());
	objVarshPhal.setTimeZone (myAstrologyObject.getTimeZone());
	objVarshPhal.setMaleFemale (myAstrologyObject.getMaleFemale());
	objVarshPhal.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
	objVarshPhal.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
	objVarshPhal.setHourOfBirth (myAstrologyObject.getHourOfBirth());
	objVarshPhal.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
	objVarshPhal.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
	objVarshPhal.setYearOfBirth (String.valueOf(strYear)); 
	objVarshPhal.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
	objVarshPhal.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
	objVarshPhal.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
	objVarshPhal.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
	objVarshPhal.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
	objVarshPhal.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
	objVarshPhal.setEastWest (myAstrologyObject.getEastWest());
	objVarshPhal.setNorthSouth (myAstrologyObject.getNorthSouth());
	objVarshPhal.setDST (myAstrologyObject.getDST());
	 
	//objVarshPhal.setLanguageCode ("0")
	//if(languageCode==1) {
	   objVarshPhal.setLanguageCode(String.valueOf(languageCode));
	//}
	
	objVarshPhal.initialize(); 
	objVarshPhal.setVarshphalYear(intInput);

}
%>