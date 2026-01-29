<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.WorksheetUtilityFunctions"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
int[] RaashiNo = new int[12];
int[] bhavPosition = new int[12];
int[] RaashiNoCorrespondingToPlanets1 = new int[12];
int[] tempraashi = new int[12];
int[] myrashi = new int[13];
int[] arrPlanetsShodashvarga=new int[13];

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);
 

myrashi[12] = arrPlanetsShodashvarga[2];

String ReturnJSONObj = "[{'arrayval':["+myrashi[12]+","+arrPlanetsShodashvarga[1]+","+arrPlanetsShodashvarga[2]+","+arrPlanetsShodashvarga[3]+","+arrPlanetsShodashvarga[4]+","+arrPlanetsShodashvarga[5]+","+arrPlanetsShodashvarga[6]+","+arrPlanetsShodashvarga[7]+","+arrPlanetsShodashvarga[8]+","+arrPlanetsShodashvarga[9]+","+arrPlanetsShodashvarga[10]+","+arrPlanetsShodashvarga[11]+","+arrPlanetsShodashvarga[12]+"]}]";  
out.println(ReturnJSONObj);
%>
