<%@page pageEncoding="UTF-8" session="true"%>
<%
session.removeAttribute("HoroscopeObj");

request.getRequestDispatcher("/cloud/createsession-jsp.asp").forward(request, response);
%>