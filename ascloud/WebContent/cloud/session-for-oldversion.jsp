<%@page language="java" session="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%
    if(session.getAttribute("HoroscopeObj")!= null){
    	DesktopHoro ObjHoroOldVersion = (DesktopHoro)session.getAttribute("HoroscopeObj");
    	ObjHoroOldVersion.setLanguageCode("0");
        ObjHoroOldVersion.initialize();
        session.setAttribute("languageCode", 0);
        response.sendRedirect("http://cloud.astrosage.com/cloud/home.asp");
    }
    else{
     out.println("Sorry your session has been expired. Please <a href='/'>Login</a> again.");          
    }
%>