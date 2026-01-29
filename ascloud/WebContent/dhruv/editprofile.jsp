<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title></title>

<link rel="shortcut icon" href="https://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"  rel="stylesheet">
<%@include file='/dhruv/cssscript.jsp'%> 
</head>

<%
//Session check 
Object horoObE = session.getAttribute("HoroscopeObj");
Object userObE = session.getAttribute("userid");
UserDAO UDE = new UserDAO();

int getPlanIdE=1; // Set the this variable as basic plan
getPlanIdE = Integer.parseInt(UDE.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if(userObE != null ||  horoObE !=null){	
if (Util.isDhruvPlan(getPlanIdE)){
%>
	



<body class="dhruv-soft">	
	<%@include file='/dhruv/header.jsp'%>
		<div id="contentArea">
		<div class="wrapper">
			<%@include file='/dhruv/navbar.jsp'%>
			<section class="content" id="contentView">
<div class="row">
	<div class="col s12 l3"></div>
	<div class="col s12 l6">
		<div class="card-panel br-radius br-all z-depth-0 pnbox">

<%@include file='userprofile.jsp'%> 
</div>
		</div>
		</div>

</section>
		</div>
	</div>
<%@include file='/dhruv/footer.jsp'%> 
<%
}else{	
	response.sendRedirect("/dhruv/purchage-modal.jsp");
}

}
else{	
	session.setAttribute("dhruvNewKundli", "0");
	response.sendRedirect("/cloud/login.asp");
}
	%>
</body>
</html>


