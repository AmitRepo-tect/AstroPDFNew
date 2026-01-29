<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userid = Util.safestr(request.getParameter("userid"));
	String chart_id = Util.safestr(request.getParameter("chartid"));

	UserDAO dao = new UserDAO();
	
    //out.println(dao.openchartdata(userid, "", 0, (MyProperties)session.getAttribute("constants")));
    out.println(dao.openchartdata(userid, chart_id, 0, (MyProperties)session.getAttribute("constants")));
%>