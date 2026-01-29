<%@page import="java.util.Calendar"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DO.HealthFeedback"%>
<%@page import="java.util.List"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Health Feedback Report</title>
</head>
<%
CloudDAO dao = new CloudDAO();
List<HealthFeedback> feedbacks = dao.getFeedbacks();
%>
<body>
<table>
<tr>

<td><b>Sr.No</b></td>
<td><b>Name/UserId</b></td>
<td><b>Date of Birth</b></td>
<td><b>Place of Birth</b></td>
<td><b>Calculated Immunity</b></td>
<td><b>Agree/Disagree</b></td>
<td><b>Actual Immunity</b></td>
<td><b>Feedback</b></td>
<td><b>HoroLink</b></td>
</tr>

<% DesktopHoro objHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
int i=1;
for(HealthFeedback feedback:feedbacks) { %>
<tr>
<td><%=i++ %>.</td>
<td><%=feedback.getName()%> <% if(feedback.getUserId() != null && !feedback.getUserId().equals("")) { %>(<%=feedback.getUserId()%>) <% } %></td>
<td><%=feedback.getDateOfBirth() %></td>
<td><%=feedback.getPlace() %></td>
<td><%=feedback.getCalcImmunity() %></td>
<td><%=feedback.isAgree() %></td>
<td><%=feedback.getActualImmunity() %></td>
<td><%=feedback.getFeedback() %></td>
<%
Calendar cal = Calendar.getInstance();
cal.setTime(feedback.getDateOfBirth());

%>
<td>Util.createHoro("<%=feedback.getName()%>","<%=cal.get(Calendar.DATE)%>","<%=cal.get(Calendar.MONTH)+1%>",
	"<%=cal.get(Calendar.YEAR)%>","<%=cal.get(Calendar.HOUR_OF_DAY)%>","<%=cal.get(Calendar.MINUTE)%>",
	"<%=cal.get(Calendar.SECOND)%>","<%=feedback.getLatdeg()%>","<%=feedback.getLatmin() %>",
	"<%=feedback.getLatns() %>","<%=feedback.getLongdeg() %>","<%=feedback.getLongmin() %>",
	"<%=feedback.getLongew() %>","<%=feedback.getTimezone() %>")
</tr>
<% } %>
</table>

</body>
</html>