<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
int languageCode = (Integer)session.getAttribute("languageCode");

Local local = new Local();

MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle basicConstants = local.loadPropertiesFileNew("basicdetails",languageCode);

MyResourceBundle homeConstants = local.loadPropertiesFileNew("home-basicdetails",languageCode);
%>


 <%@include file='ui-control/calculation.jsp'%>
  
