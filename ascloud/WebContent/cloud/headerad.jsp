<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<% 

int getPlanIdRGA=1; // Set the this variable as basic plan
UserDAO udRGA = new UserDAO();
getPlanIdRGA = Integer.parseInt(udRGA.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if (getPlanIdRGA != 8 && getPlanIdRGA != 9 && getPlanIdRGA != 10 ){
 
if(application.getAttribute("IsShowAdOnLocal")=="" || application.getAttribute("IsShowAdOnLocal")==null){ %>
<% if(!(request.getAttribute("includeFile").toString().indexOf("signup.asp")>0 || (request.getAttribute("includeFile").toString().indexOf("edituserprofile.asp")>0 || request.getAttribute("includeFile").toString().indexOf("activation-page.asp")>0))){%>

<script type="text/javascript"><!--
		google_ad_client = "pub-7494543079410386";
		/* 336x280, created 11/10/08, astrosage astrowap header */
		google_ad_slot = "3481485376";
		google_ad_width = 336;
		google_ad_height = 280;
		//-->
		</script>
<script type="text/javascript" src="https://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
<% } %>
<% } 
}
%>