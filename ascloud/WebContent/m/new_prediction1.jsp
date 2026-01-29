<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <div class="textad"><b>CHARACTER</b><br/><%=dao.getPredictionForAspect(0,"CHARACTER", myAstrologyObject, langCode, hindi, connObj )%></div><br/>
    <div class="textad"><b>HAPPINESS AND FULFILLMENT</b><br/><%=dao.getPredictionForAspect(1,"HAPPINESS AND FULFILLMENT", myAstrologyObject, langCode, hindi, connObj )%></div><br/>
    <div class="textad"><b>LIFE STYLE</b><br/><%=dao.getPredictionForAspect(2,"LIFE STYLE", myAstrologyObject, langCode, hindi, connObj )%></div>
  	<p><b><a href="new_prediction2.jsp">Next</a></b></p>
  	
 <% 
	}  catch(Exception ex) {
			ex.printStackTrace();
	} finally {
		dBUtils.closeConnection(connObj, null, null);
	}
 %>