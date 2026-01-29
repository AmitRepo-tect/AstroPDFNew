<%@page import="com.ojassoft.astrosagecloud.util.TitleConstants"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@include file='/include/topmeta.jsp'%>
<% String strprint = Util.safestr(request.getAttribute("includeFile")); %>
<title><%=TitleConstants.titleMap.get(strprint)%></title>
<%if(request.getParameter("languagecode")!=null && request.getParameter("languagecode").equals("1")){ %>
<%@include file='/include/hi/cssscript-other.jsp'%>
<%}else{ %>
<%@include file='/include/cssscript-other.jsp'%>
<%} %>
</head>
<body>
<%if(request.getParameter("languagecode")!=null && request.getParameter("languagecode").equals("1")){ %>
 
	<%@include file='/include/hi/header.jsp'%>
	<%}else{ %>
	<%@include file='/include/header-no.jsp'%>
	<%} %>
	<jsp:include page="${includeFile}" />
<%if(request.getParameter("languagecode")!=null && request.getParameter("languagecode").equals("1")){ %>
	<%@include file='/include/hi/footer-no.jsp'%>
	<%}else{ %>
	<%@include file='/include/footer-no.jsp'%>
	<%} %>

</body>
</html>
