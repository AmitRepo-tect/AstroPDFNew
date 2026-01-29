<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
Object horoOb = session.getAttribute("HoroscopeObj");
Object userOb = session.getAttribute("userid");
UserDAO UD = new UserDAO();

int getPlanId=1; // Set the this variable as basic plan
getPlanId = Integer.parseInt(UD.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if(userOb != null ||  horoOb !=null){	
	
if (getPlanId == 8 || getPlanId == 9 || getPlanId == 10 ){
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
                <div class="card-panel br-radius br-all z-depth-0">
                <h2>Fill Details</h2>
                <form class="das-form mrt-30 forms-appoint" action="https://www.astrosage.com/swarodaya/swardetail.asp" method="post" onsubmit="return formValidation();" name="dataReadForm">
				<div class="row">
					<div class="col s12 l6">
						<input type="text" placeholder="Ravi Thakur" name="text1" id="name" readonly>
					</div>
					<div class="col s12 l6 adgs">
						<input type="text" placeholder="ravi@ojassoft.com" name="text1" id="email" readonly>

					</div>
				</div>
				<div class="row">
					<div class="col s6 l6">
						<input type="text" placeholder="9990713023" name="text1" id="name" readonly>
					</div>
					<div class="col s6 l6">
						<input type="text" placeholder="12-03-1993" name="text1" id="email" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col s6 l6"> 
						<input type="text" placeholder="09:00" name="text1" id="name" readonly>
					</div>
					<div class="col s6 l6">
						<input type="text" placeholder="Moradabad" name="text1" id="email" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col s6 l6"> 
						<input type="text" placeholder="Yes" name="text1" id="name" readonly>
					</div>
					<div class="col s6 l6">
						<input type="text" placeholder="20-feb-2020" name="text1" id="email" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col s12 l12"> 
						<input type="text" placeholder="Remarks" name="text1" id="name" readonly>    
					</div>
					
				</div>

				<div class="center">
					<button class="btn btn-large waves-effect bg-dark-purple center well-css" value="Book Now" type="submit">Remarks</button>
					<button class="btn btn-large waves-effect bg-dark-orange center well-css" value="Book Now" type="submit">See Kundli</button>
					<button class="btn btn-large waves-effect bg-dark-blue center well-css" value="Book Now" type="submit">Add Notes</button>
					

				</div>


			</form>
                
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