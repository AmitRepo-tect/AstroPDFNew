<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%
  UserDAO UD = new UserDAO();
  if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")) {
  String chartid = String.valueOf(session.getAttribute("ChartId"));
  String chartname = UD.publicChartName(chartid);
    out.println(chartname);
  }else{
	  out.println("You are not authorized to view this page.");   
  }
%>