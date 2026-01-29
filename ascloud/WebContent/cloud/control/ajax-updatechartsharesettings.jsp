<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
UserDAO UD =  new UserDAO();
String chartName="",getdata="";
if(session.getAttribute("ChartId")!=null && !String.valueOf(session.getAttribute("ChartId")).equals("")){
    chartName = Util.safestr(request.getParameter("chartName"));
    getdata = UD.updateChartShareSettings(chartName,String.valueOf(session.getAttribute("ChartId")));
    out.println(getdata);
}else{
   out.println("3");  
}

%>