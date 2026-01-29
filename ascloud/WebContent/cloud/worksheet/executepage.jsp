<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("HoroscopeObj")!=null && !session.getAttribute("HoroscopeObj").equals("")) {
String	pagename = Util.safestr(request.getParameter("pagename"));
%>
<jsp:include page="<%=pagename %>"/>
<%
}else if(session.getAttribute("HoroscopeObj").equals("") &&  !session.getAttribute("userid").equals("")) {
         UserDAO UD = new UserDAO();
        //if(ischartexist.equals("1")) {
        	 if(UD.isUserHasDefaultChart(String.valueOf(session.getAttribute("userid")), null)) {
              out.println("CHKDEF");
               
        }
}else{
	out.println("SESSION_EXPIRED_MSG");         
}
%>