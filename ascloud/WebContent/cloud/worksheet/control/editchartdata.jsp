<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%
String chartid = request.getParameter("chartid");

if(request.getParameter("chartid")!=null && !request.getParameter("chartid").equals("")) {
	String chrtId = request.getParameter("chartid");
	UserDAO UD = new UserDAO();
	out.println(UD.getChartDetails(chrtId));
}
%>