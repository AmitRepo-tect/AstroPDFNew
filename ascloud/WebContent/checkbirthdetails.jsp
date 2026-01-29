<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%UserDAO UD = new UserDAO();
//******************************
if(session.getAttribute("UserExists")!=null && !session.getAttribute("UserExists").equals("true")){
//If session("UserExists")<>"true" Then
    response.sendRedirect("/default.jsp");
}
String Referrer ="";
String Uid = request.getParameter("Msg");
String Reg = request.getParameter("Reg");
if(request.getAttribute("Referrer")!=null && request.getAttribute("Referrer").equals("")){
Referrer = request.getParameter("Referrer");
}


HashMap<String, String> isPerson = UD.isBirthDetailExist(SharedFunction.decryptstring(Uid));
if(isPerson.get("isExist").equals("false")){
    Reg = "true";
}

if(Reg.equals("true")){
    response.sendRedirect("HoroScopeData.jsp?Msg=Create");   
}else{
	response.sendRedirect("/cloud/defaultchartlogin.asp?methodName=fromJSP&referrer="+Referrer);
}	

%>