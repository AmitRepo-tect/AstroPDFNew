<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
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
<%
//Session check 
Object horoObB = session.getAttribute("HoroscopeObj");
Object userObB = session.getAttribute("userid");
UserDAO UDB = new UserDAO();

int getPlanIdB=1; // Set the this variable as basic plan
getPlanIdB = Integer.parseInt(UDB.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if(userObB != null ||  horoObB !=null){	
if (Util.isDhruvPlan(getPlanIdB)){
%>
</head>
<body class="dhruv-soft">	
	<%@include file='/dhruv/header.jsp'%>
		<div id="contentArea">
		<div class="wrapper">
			<%@include file='/dhruv/navbar.jsp'%>
			<section class="content" id="contentView">
			
			
<div class="row" id="swar">
	<div class="col s12 l3"></div>
	<div class="col s12 l6">
		<div class="card-panel br-radius br-all z-depth-0 pnbox">					
				 <h2 class="center-align"><%=dasNav.getString("MYBUSINESS") %></h2>
		
			<div class="row mrt-30">
				<div class="col s4 m3">
					<a href="editprofile.jsp" class="menu-class block center-align">
						<div class="icon-img br-purple-1"><img src="/dhruv/images/edit-profile.png"></div>
						<span class="truncate"><%=dasNav.getString("EDIT_PROFILE") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
					<a href="editprofile.jsp?isfd=yes" class="menu-class block center-align">
						<div class="icon-img br-orange-1"><img src="/dhruv/images/footer-detail.png"></div>
						<span class="truncate"><%=dasNav.getString("CUSTOMIZE_FOOTER") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
					<a href="appointment.jsp" class="menu-class block center-align">
						<div class="icon-img br-blue-1"><img src="/dhruv/images/book-appointment.png"></div>
						<span class="truncate"><%=dasNav.getString("BOOK_APPOINTMENT") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
					<a href="my-appointment.jsp" class="menu-class block center-align">
						<div class="icon-img br-purple-1"><img src="/dhruv/images/appointment-today.png"></div>
						<span class="truncate"><%=dasNav.getString("APPOINTMENT_TODAY") %></span>						
					</a>
				</div>
				</div>
				
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