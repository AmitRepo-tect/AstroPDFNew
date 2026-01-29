<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    
    DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
    int[] rashiPosition =  new int[13];
    double[] bhavaBeginPositions =  new double[13];
    double[] arrPlanetsShodashvarga =  new double[13];
    
    SharedFunction SF =  new SharedFunction();
        
    for(int i = 0;i<= 11;i++){
      bhavaBeginPositions[i] = myAstrologyObject.getBhavBeginForBhav(i + 1);
    }   
    for(int i = 0 ;i<= 11;i++){
       arrPlanetsShodashvarga[i] = SF.getPlanetBhavaPosition(myAstrologyObject.getPlanetaryLongitude(i + 1), bhavaBeginPositions);       
       rashiPosition[i+1] = (int)(myAstrologyObject.getMidBhavForBhava(i + 1) / 30)+1;
    }
   String  ReturnJSONObj = "[{'arrayval':["+rashiPosition[1]+","+arrPlanetsShodashvarga[0]+","+arrPlanetsShodashvarga[1]+","+arrPlanetsShodashvarga[2]+","+arrPlanetsShodashvarga[3]+","+arrPlanetsShodashvarga[4]+","+arrPlanetsShodashvarga[5]+","+arrPlanetsShodashvarga[6]+","+arrPlanetsShodashvarga[7]+","+arrPlanetsShodashvarga[8]+","+arrPlanetsShodashvarga[9]+","+arrPlanetsShodashvarga[10]+","+arrPlanetsShodashvarga[11]+"]}]";    
    out.println(ReturnJSONObj);  
%>