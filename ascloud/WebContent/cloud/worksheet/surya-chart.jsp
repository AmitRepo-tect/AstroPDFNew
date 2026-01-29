<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
//Dim RaashiNo(12),bhavPosition(13),RaashiNoCorrespondingToPlanets1(12),tempraashi(12),myrashi(12)
//Dim arrPlanetsShodashvarga

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
int[] raashiNoCorrespondingToPlanets1 =  new int[13];
int[] tempraashi = new int[13];
int[] myRashi = new int[13];

int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);
for(int k = 0 ; k<= 12; k++){
	raashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
}

raashiNoCorrespondingToPlanets1[0] = raashiNoCorrespondingToPlanets1[1];
int[]raashiNo =  SharedFunction.getRaashi(raashiNoCorrespondingToPlanets1[0]);
int count=0;
for(int i=0 ;i<= 12;i++){   
    if(raashiNo[i]>=1) {
        tempraashi[count]=raashiNo[i];
        count=count+1;
    }
}
int mycount=count;
int mycount2=count;
for(int i=0 ;i<= mycount-1 ;i++){
   tempraashi[mycount2]=raashiNo[i];   
}  
for(int i=0 ;i<= 11;i++){
    myRashi[i+1]=tempraashi[i]+1;
} 
String ReturnJSONObj = "[{'arrayval':["+myRashi[12]+","+arrPlanetsShodashvarga[1]+","+arrPlanetsShodashvarga[2]+","+arrPlanetsShodashvarga[3]+","+arrPlanetsShodashvarga[4]+","+arrPlanetsShodashvarga[5]+","+arrPlanetsShodashvarga[6]+","+arrPlanetsShodashvarga[7]+","+arrPlanetsShodashvarga[8]+","+arrPlanetsShodashvarga[9]+","+arrPlanetsShodashvarga[10]+","+arrPlanetsShodashvarga[11]+","+arrPlanetsShodashvarga[12]+"]}]";
out.println(ReturnJSONObj);
%>