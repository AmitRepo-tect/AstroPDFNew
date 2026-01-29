<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util" %>

<%
	out.print("<b>General Prediction</b>" + "<br/>");
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	try{
		connObj = dBUtils.getConnection();
	    DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj");
		CloudDAO dao = new CloudDAO();  
		Local local = new Local();
		Hindi hindi = new Hindi();
		int langCode = Util.safeInt((Integer)session.getAttribute("languageCode"));
%>
	
	<div class="textad"><b>CAREER</b><br/><%=dao.getPredictionForAspect(3,"CAREER", myAstrologyObject, langCode, hindi, connObj )%></div><br/>
    <div class="textad"><b>OCCUPATION</b><br/><%=dao.getPredictionForAspect(4,"OCCUPATION", myAstrologyObject, langCode, hindi, connObj )%></div><br/>
    <div class="textad"><b>HEALTH</b><br/><%=dao.getPredictionForAspect(5,"HEALTH", myAstrologyObject, langCode, hindi, connObj )%></div>
  	<b><a href="new_prediction1.jsp">Back</a>||<a href="new_prediction3.jsp">Next</a></b></p>
 <% 
	}  catch(Exception ex) {
			ex.printStackTrace();
	} finally {
		dBUtils.closeConnection(connObj, null, null);
	}
 %>