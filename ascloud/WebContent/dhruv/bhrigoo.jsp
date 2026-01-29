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
                <div class="card-panel-view br-radius z-depth-0 pnbox">
                <div class="bhrigoo-header bg-dark-blue">
                 <h2 class="white-text"> Artificial Intelligence Astrology </h2>
                </div>
                <div class="row bhrigoo-body bg-white">
                
                 <div class="col s12 l12"> 
                  <div class="right bhrigoo-right br-chat"> 
                    <div class="bhri-chat"> 
                    <p class="bg-light-purple"> Please tell my future
                     <span> 15 feb 20, 08:59 PM </span> </p>
                     </div>
                   </div>
                  </div>
                   <div class="col s12 l12"> 
                  <div class="left bhrigoo-left br-chat"> 
                  <div class="bhri-chat-1"> 
                   <p class="bg-gray"> Your lagna is Gemini, the Rasi is Aries and in your kundli, there is Amla Yoga, Anapha Yoga, Ubhayachari Yoga, Chandra-Mangal Yoga,
                     Maha Bhagya Yoga, Sjakata Yoga, Vimal Vipreet Raj Yoga which will show that your life is good. 
                     <span> 15 feb 20, 08:59 PM </span></p>
                     </div>
                   </div>
                  </div>                 
                  
                  
                  <div class="col s12 l12"> 
                  <span id="rightchat"> </span>
                  <span id="leftchat"> </span>                  
                  </div>
                  
                  
                </div>
                
                <div class="bhrigoo-footer">
                
                <div class="row">
                 <div class="col s2 l1"> 
                 <img src="/dhruv/images/bhrigoo-icon.png" class="logo-ic">   
                 </div>
                 <div class="col s8 l10">
                 <textarea class="form-controls" id="ingoingmsg" rows="4" cols="50" placeholder="Type & ask questions..."></textarea> 
                 </div>
                 <div class="col s2 l1">
                 <button type="submit" wrap=”off” class="bg-dark-orange ft-icon" id="submitmsg"> <img src="/dhruv/images/enter-icon.png"> </button>                 
                 </div>
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
		
		$('#submitmsg').click(function(){			
			var getVal = $('#ingoingmsg').val();			
			$('#rightchat').html('<div class="right bhrigoo-right br-chat"><div class="bhri-chat"> <p class="bg-light-purple">'+getVal+'<span> 15 feb 20, 08:59 PM </span></p></div></div>');
			$('#ingoingmsg').val("");
			setTimeout(function(){
				printanswer();
			},1200)
			
		});
		
	});
	function printanswer(){
		$('#leftchat').html('<div class="left bhrigoo-left"> <div class="bhri-chat-1">  <p class="bg-gray">As per my in-depth reading of your natal chart, there are strong yogas for your marriage and it may take place from 5/11/2024 to 4/12/2024.The next best time for wedding bells to ring is starting from 22/1/2044 to 5/2/2044, in case the previous period does not get you desired results. <span> 15 feb 20, 08:59 PM </span></p></div> </div>')	
		
	}
	</script>
</body>
</html>