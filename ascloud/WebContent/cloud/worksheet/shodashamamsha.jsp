<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.WorksheetUtilityFunctions"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
int[] planetpositionarr = WorksheetUtilityFunctions.Getplanetpositionarr(9 ,myAstrologyObject);
String ReturnJSONObj = "[{'arrayval':["+planetpositionarr[0]+","+planetpositionarr[1]+","+planetpositionarr[2]+","+planetpositionarr[3]+","+planetpositionarr[4]+","+planetpositionarr[5]+","+planetpositionarr[6]+","+planetpositionarr[7]+","+planetpositionarr[8]+","+planetpositionarr[9]+","+planetpositionarr[10]+","+planetpositionarr[11]+","+planetpositionarr[12]+"]}]";
out.println(ReturnJSONObj);
%>