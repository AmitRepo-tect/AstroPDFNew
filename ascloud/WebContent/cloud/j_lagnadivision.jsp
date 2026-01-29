<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>j_lagnadivision.asp (827×1169)</title>
<%
   //out.println(session.getAttribute("HoroscopeObj") == null);
   //out.println(session.getAttribute("HoroscopeObj").equals(""));
    if(session.getAttribute("HoroscopeObj") == null || session.getAttribute("HoroscopeObj").equals("")) {
            response.sendRedirect("login.asp");           
    }
    else{
%>
<%
DesktopHoro JPEGHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
String userDetails_jp="Name="+JPEGHoro.getName()+"&Place="+JPEGHoro.getPlace().trim()+"&timeZone="+JPEGHoro.getTimeZone()+
"&Sex="+JPEGHoro.getMaleFemale()+"&Sec="+JPEGHoro.getSecondOfBirth()+"&Min="+ JPEGHoro.getMinuteOfBirth()+
"&Hrs="+JPEGHoro.getHourOfBirth()+"&Day="+ JPEGHoro.getDayOfBirth()+"&Month="+JPEGHoro.getMonthOfBirth()+
"&Year="+ JPEGHoro.getYearOfBirth()+"&LatDeg="+JPEGHoro.getDegreeOfLattitude()+"&LongDeg="+
JPEGHoro.getDegreeOfLongitude()+"&LatSec="+JPEGHoro.getSecondOfLattitude()+"&LongSec="+JPEGHoro.getSecondOfLongitude()+
"&LongMin="+JPEGHoro.getMinuteOfLongitude()+"&LatMin="+JPEGHoro.getMinuteOfLattitude()+"&LongEW="+
JPEGHoro.getEastWest()+"&LatNS="+JPEGHoro.getNorthSouth()+"&Dst="+JPEGHoro.getDST()+"&Ayanamsa="+
SharedFunction.getAyan(JPEGHoro)+"&kphn="+JPEGHoro.getKPHorarySeed()+"&chartType="+session.getAttribute("chartType")+"&userid="+session.getAttribute("User_Id");

%>
<img  src="http://www.astrosage.com/cloud/j_lagnadivision-jsp.asp?<%=userDetails_jp%>" />  
<%} %>
  