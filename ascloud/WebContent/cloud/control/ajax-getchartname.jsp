<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
    UserDAO UD =  new UserDAO();
	String chartName = Util.safestr(request.getParameter("chartname"));
	String chartId ="";
	if(session.getAttribute("ChartId")!=null && !session.getAttribute("ChartId").equals("")){
	chartId = Util.safestr(String.valueOf(session.getAttribute("ChartId")));
	}else{
	chartId = Util.safestr(request.getParameter("chartid"));
	}
	
	String chartval = UD.checkchartnameavailability(chartName,chartId);
	out.println(chartval);
%>