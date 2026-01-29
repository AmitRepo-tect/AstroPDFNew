<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.model.*"%>

<%
	CheckUserIdAvail chkId = new CheckUserIdAvail();
    String valUserId = Util.safestr(request.getParameter("value")).trim();
    String isUserIdVail = chkId.checkUserIdAvail(valUserId) ;
    out.println(isUserIdVail);

%>