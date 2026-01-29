<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>

<%@include file = '/include/get-set-cookies.jsp'%>
<%
Calendar jCal = Calendar.getInstance();
int day = jCal.get(Calendar.DATE);
int month = jCal.get(Calendar.MONTH)+1;
int year = jCal.get(Calendar.YEAR);

Util utl = new Util();
String cookiename = Util.safestr(request.getParameter("cookiesname"));
createcookies("lastadvshowonday", String.valueOf(day), 7,response);
createcookies("lastadvshowonmonth", String.valueOf(month), 7,response);
createcookies("lastadvshowonyear", String.valueOf(year), 7,response);
createcookies(cookiename, "false", 7,response);        
%>

