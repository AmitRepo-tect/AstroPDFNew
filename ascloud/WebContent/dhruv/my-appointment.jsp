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
if (Util.isDhruvPlan(getPlanId)){
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
                <h2><%=dasNav.getString("APPOINTMENT_MY") %></h2>
                <div class="row mt-3 style-apoint">
            
                <div class="stle-btm"></div>
                <div class="mt-3 res-set"> 
                <div class="col s2 l2"> <span class="bg-dark-orange cal-ic">  <i class="material-icons">calendar_today</i> </span>  </div>
                <div class="col s10 l10"> 
                 <div class="right-appoint"> 
                 <h5> January, 28 | Scheduled</h5>
                 <ul> 
                 <li> <span class="bg-dark-blue bullets"></span> Mahesh Moolchandani <span class="text-mute-st"> (11am to 01pm) </span>  </li>
                 <li> <span class="bg-dark-purple bullets"></span> Ankesh Patel <span class="text-mute-st"> (02pm to 03pm) </span> </li>
                 <li> <span class="bg-dark-orange bullets"></span> Niyati Joshi <span class="text-mute-st"> (04pm to 05pm) </span> </li>
                 </ul>
                  </div>
                 </div>
                </div>
                <div class="stle-btm"></div>
                
                <div class="mt-2 line-widget"> 
                 <div class="col s3 l2"> <p class="txt-time"> 10:00 AM </p> </div>
                 <div class="col s7 l8 set-pd">  </div>
                 <div class="col s2 l2"> <a href="#" class="plus-ic"><img src="/dhruv/images/plus.png"></a> </div>
                </div>
                <div class="stle-btm1"></div>
                 <div class="mt-2 line-widget"> 
                 <div class="col s3 l2"> <p class="txt-time"> 11:00 AM </p> </div>
                 <div class="col s7 l8 set-pd"> <h6> <b>  Mahesh Moolchandani - 2 Hrs </b> <span class="text-mute-st1"> 11am to 01pm </span> </h6>  </div>
                 <div class="col s2 l2"> <a href="#" class="plus-ic"><img src="/dhruv/images/plus.png"></a> </div>
                </div>
                <div class="stle-btm1"></div>
                <div class="mt-2 line-widget"> 
                 <div class="col s3 l2"> <p class="txt-time"> 12:00 AM </p> </div>
                 <div class="col s7 l8 set-pd">  </div>
                 <div class="col s2 l2"> <a href="#" class="plus-ic"><img src="/dhruv/images/plus.png"></a> </div>
                </div>
                <div class="stle-btm1"></div>
                 <div class="mt-2 line-widget"> 
                 <div class="col s3 l2"> <p class="txt-time"> 01:00 PM </p> </div>
                 <div class="col s7 l8 set-pd"> <h6> <b>  Ankesh Patel - 3 Hrs </b> <span class="text-mute-st1"> 02pm to 03pm </span> </h6>  </div>
                 <div class="col s2 l2"> <a href="#" class="plus-ic"><img src="/dhruv/images/plus.png"></a> </div>
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
	
	
	<script>
	$(document).ready(function(){
		$(".book-appit").click(function(){
			$(".book-appit").css("display","none");
			$(".boked-btn").show();
			$(".dh-cn-md").show();
		
	});
		$(".cnfirm-btn-set").click(function(){
	 	$(".cnf-hide-sys").hide();
	 	$(".dh-cn-md").hide();
	 	$(".dwd-btn-h").show();
	});	
	});
	</script>
</body>
</html>