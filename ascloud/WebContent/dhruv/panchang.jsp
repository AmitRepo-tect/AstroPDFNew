<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

Local localpn = new Local();
int langpn = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle dasPn = localpn.loadPropertiesFileNew("dhruv", langpn);
String printLang = "";
String printUrlH ="";
String printUrlR ="";
String printUrlC ="";
if(langpn == 1){
	printLang = "hi";
	printUrlH = "https://hindi.astrosage.com/hora.asp";
	printUrlR = "https://hindi.astrosage.com/rahukaal.asp";
	printUrlC = "https://hindi.astrosage.com/choghadiya.asp";
}else{
	printLang = "en";
	printUrlH = "https://www.astrosage.com/hora.asp";
	printUrlR = "https://www.astrosage.com/rahukaal.asp";
	printUrlC = "https://www.astrosage.com/chogadia.asp";
}
	
%>
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
<div class="row" id="swar">
	<div class="col s12 l3"></div>
	<div class="col s12 l6">
		<div class="card-panel br-radius br-all z-depth-0 pnbox">
		 <h2 class="center-align"><%=dasPn.getString("PANCHANG") %></h2>
		
			<div class="row mrt-30">
				<div class="col s4 m3">
					<a href="https://panchang.astrosage.com/panchang/monthly-panchang?language=<%=printLang %>" class="menu-class block center-align">
						<div class="icon-img br-purple-1"><img src="/dhruv/images/ic_monthly.png"></div>
						<span class="truncate"><%=dasPn.getString("M_EPHEMERIS") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="https://panchang.astrosage.com/panchang?language=<%=printLang %>" class="menu-class block center-align">
						<div class="icon-img br-orange-1"><img src="/dhruv/images/ic_panchang.png"></div>
						<span class="truncate"><%=dasPn.getString("D_PANCHANG") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="<%=printUrlH %>" class="menu-class block center-align">
						<div class="icon-img br-blue-1"><img src="/dhruv/images/ic_hora.png"></div>
						<span><%=dasPn.getString("HORA") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="<%=printUrlC %>" class="menu-class block center-align">
						<div class="icon-img br-purple-1"><img src="/dhruv/images/ic_time.png"></div>
						<span class="truncate"><%=dasPn.getString("CHAUGHADIA") %></span>						
					</a>
				</div>
				
					<div class="col s4 m3">
					<a href="<%=printUrlR %>" class="menu-class block center-align">
						<div class="icon-img br-orange-1"><img src="/dhruv/images/ic_rahu.png"></div>
						<span class="truncate"><%=dasPn.getString("RAHUKAAL") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="https://panchang.astrosage.com/muhurat/do-ghati-muhurat?language=<%=printLang %>" class="menu-class block center-align">
						<div class="icon-img br-blue-1"><img src="/dhruv/images/ic_do_ghati.png"></div>
						<span><%=dasPn.getString("DOGHATI") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="https://panchang.astrosage.com/muhurat/panchak?language=<%=printLang %>" class="menu-class block center-align">
						<div class="icon-img br-purple-1"><img src="/dhruv/images/ic_panchak.png"></div>
						<span><%=dasPn.getString("PANCHANK") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="http://panchang.astrosage.com/muhurat/bhadra?language=<%=printLang %>" class="menu-class block center-align">
						<div class="icon-img br-orange-1"><img src="/dhruv/images/ic_bhadra.png"></div>
						<span><%=dasPn.getString("BHADRA") %></span>						
					</a>
				</div>
				
					<div class="col s4 m3">
					<a href="https://panchang.astrosage.com/muhurat/?language=<%=printLang %>" class="menu-class block center-align">
						<div class="icon-img br-blue-1"><img src="/dhruv/images/ic_muhurat_panchang.png"></div>
						<span><%=dasPn.getString("MUHURAT") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="https://panchang.astrosage.com/panchang/lagna-table?language=<%=printLang %>" class="menu-class block center-align">
						<div class="icon-img br-purple-1"><img src="/dhruv/images/ic_lagna_table.png"></div>
						<span><%=dasPn.getString("L_TABLE") %></span>						
					</a>
				</div>
				<div class="col s4 m3">
				<a href="/ephemeris" class="menu-class block center-align">
						<div class="icon-img br-purple-1"><img src="/dhruv/images/ic_ephemeris.png"></div>
						<span><%=dasPn.getString("EPHEMERIS") %></span>						
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