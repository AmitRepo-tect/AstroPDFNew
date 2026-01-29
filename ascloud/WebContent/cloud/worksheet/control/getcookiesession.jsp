<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%
	if (session.getAttribute("HoroscopeObj") != null && !session.getAttribute("HoroscopeObj").equals("")) {
		out.println("1");
	} else if (session.getAttribute("HoroscopeObj").equals("") && !session.getAttribute("userid").equals("")) {
		UserDAO UD = new UserDAO();
		if (UD.isUserHasDefaultChart(String.valueOf(session.getAttribute("userid")), null)) {
			out.println("2");
		}
	} else {
		out.println("0");
	}
%>