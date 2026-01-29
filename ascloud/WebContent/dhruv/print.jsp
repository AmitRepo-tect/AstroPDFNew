<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%
Local localP = new Local();
int langCP = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle printKundli = localP.loadPropertiesFileNew("download-kundli",langCP);
MyResourceBundle dasPrint = localP.loadPropertiesFileNew("dhruv", langCP);
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
		 <h2 class="center-align">PRINT YOUR KUNDLI</h2>
		<div class="row mrt-30">
		<div class="col s12 l6">
            <a href="/cloud/vedic-chart-pdf.jsp" target="_blank" onClick="_gaq.push(['_trackEvent', 'print_page', 'new_full_pdf']);">
            <div class="center promo promo-example">
            	<div class="icon-img-lg br-purple-1"><img src="/dhruv/images/downloads.png"></div>
            	<p class="flow-text black-text font-weight-500"><%=printKundli.getString("Download_Life_Report".toUpperCase())%></p>
            	<p class="light center black-text"><%=dasPrint.getString("YOUR_200_PAGES_BIRTH_KUNDLI")%></p>
           	</div>
        	</a>
        </div>
                        <div class="col s12 l6">
                        <a href="/cloud/vedic-chart-pdf.jsp?isopenkundli=yes" target="_blank"  onClick="_gaq.push(['_trackEvent', 'view_page', 'new_full_pdf']);">
                          <div class="center promo promo-example">
                            <div class="icon-img-lg br-orange-1"><img src="/dhruv/images/view-report.png"></div>
                            <p class="flow-text black-text font-weight-500"><%=printKundli.getString("View_Life_Report".toUpperCase())%></p>
                            <p class="light center black-text"><%=dasPrint.getString("YOUR_200_PAGES_BIRTH_KUNDLI")%></p>
                          </div>
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