<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%        

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
SharedFunction sf =  new SharedFunction();
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
		      
int[] RaashiNoCorrespondingToPlanets = new int[13];


Calendar cal = Calendar.getInstance();
int myvalue=cal.get(Calendar.YEAR); 
myvalue = (int)(myvalue) - (int)(myAstrologyObject.getYearOfBirth());  
int period= 0;
if(myvalue==0){   //if date of birth is current year
    period=1;
}else{
    period=myvalue;
}

int day1=myAstrologyObject.getDayOfBirth();
int year1=myAstrologyObject.getYearOfBirth();
int month1=myAstrologyObject.getMonthOfBirth();
int month2=cal.get(Calendar.MONTH);
int currentMonth;
if(month2<=month1){
    period=period+0;
    currentMonth=0;
}else{
    currentMonth=1;
    period=period+1;
}

int currYear=myvalue + myAstrologyObject.getYearOfBirth();

int[] raashiNoCorrespondingToPlanets = new int[13];
raashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);

int[] raashiNoCorrespondingToPlanets1 = new int[13];
for(int iCount = 0 ; iCount<= 11 ; iCount++){
raashiNoCorrespondingToPlanets1[iCount + 1] = raashiNoCorrespondingToPlanets[iCount];
}

raashiNoCorrespondingToPlanets1[0] = 1;
int[] raashiNo = SharedFunction.getRaashi(raashiNoCorrespondingToPlanets1[0]);
int[] tempraashi = new int[13]; 
int[] planetinBhav = new int[12];
int[] planetinBhav2 = new int[13];
int[] planetinBhav3 = new int[13];



int count=0;
for(int i=0 ; i<= 12 ;i++){
    if(raashiNo[i]>=1){
        tempraashi[count]=raashiNo[i];
        count=count+1;
    }
}
int mycount=count;
int mycount2=count;
for(int i=0 ; i<= mycount-1 ; i++){
    tempraashi[mycount2]=raashiNo[i];
} 
//--------Code To Draw the Planets----------
int[] planetno = new int[12];
for(int i=1;i<= 12; i++){
 planetno[i-1] = raashiNoCorrespondingToPlanets1[i];
}	  
int detect=tempraashi[0]-1;
for(int i=0; i<= 11 ; i++){
    planetno[i] = planetno[i]-detect;
    if(planetno[i]<=0){
        planetno[i]=planetno[i]+12;
    }
    planetinBhav[i]=planetno[i];
}	

RLalKitab  lalKitab = new RLalKitab();
lalKitab.set(planetinBhav);
int[] planetinBhavForVarshaphal = lalKitab.getAlteredKundli(period, 1);
for(int i = 0 ;i<= 11;i++){
   planetinBhav2[i] = planetinBhavForVarshaphal[i];   
}

//planetinBhav2[9] = 6;
//planetinBhav2[10] = 6;
//planetinBhav2[11] = 6;

for(int k=0 ;k<= 11;k++){
    planetinBhav3[k+1] = planetinBhav2[k];
}


planetinBhav3[0] = 1; 
String ReturnJSONObj = "[{'arrayval':["+planetinBhav3[0]+","+planetinBhav3[1]+","+planetinBhav3[2]+","+planetinBhav3[3]+","+planetinBhav3[4]+","+planetinBhav3[5]+","+planetinBhav3[6]+","+planetinBhav3[7]+","+planetinBhav3[8]+","+planetinBhav3[9]+","+planetinBhav3[10]+","+planetinBhav3[11]+","+planetinBhav3[12]+"]}]";
out.println(ReturnJSONObj);       
%>