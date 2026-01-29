<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.CloudServlet"%>
<%@page import="com.ojassoft.astrosagecloud.AstrosageServlet"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.*"%>


<%
 
//If there is no horoscopeObject and no userId, we check if the cookies are present and 
//follow the normal login procedure. 

if((session.getAttribute("HoroscopeObj")==null || session.getAttribute("HoroscopeObj").equals("")) && (session.getAttribute("User_Id")==null || session.getAttribute("User_Id").equals(""))){
	HashMap<String, String> returnedMap = Util.getCookiesAndLogin(request);
	if(returnedMap.size() == 2)
	{
		response.sendRedirect("loginchk.jsp?submit=1&txtUserID="+returnedMap.get("UserId")+"&txtPassword="+returnedMap.get("Password"));
	}
}

if((session.getAttribute("HoroscopeObj")==null || session.getAttribute("HoroscopeObj").equals("")) && (session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals(""))){
	UserDAO UD = new UserDAO();
//if(UD.isUserHasDefaultChart(String.valueOf(session.getAttribute("User_Id")))) {
    response.sendRedirect("defaultchartlogin.asp?methodName=fromJSP");      
    
//} 
    
   
}

int getPlanIdHo=1; // Set the this variable as basic plan
UserDAO UD1 = new UserDAO();
getPlanIdHo = Integer.parseInt(UD1.getPlanId(String.valueOf(session.getAttribute("User_Id"))));

//Since cookies.jsp is removed, the planid should get saved in the session corresponding to session userid.
//Added this 'session set' on 16 March, 2020 after encountering error that after coming from
//astrosage/kundali, the planid does not get set in the session and so, shows default planId for the user.
//Done by Smriti.
session.setAttribute("planid", getPlanIdHo);

boolean isPlanDhruv = Util.isDhruvPlan(getPlanIdHo);
 
//if(session.getAttribute("User_Id") == null)
//{
//	response.sendRedirect("default.jsp");
//}
//else
//{
request.setAttribute("includeFile", "home.jsp");
String ischartexist = "0"; // neha default value set
String strprint = "";// neha default value set

String title = "";
Local local = new Local();
CloudServlet serv = new CloudServlet();
serv.initialize(request, response);
	DesktopHoro ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");   
	
 
    int langCode = Util.safeInt(session.getAttribute("languageCode"));
	MyResourceBundle rBHome = local.loadPropertiesFileNew("home",langCode);
	MyResourceBundle rBHomeBasicdetails = local.loadPropertiesFileNew("home-basicdetails",langCode);
	Object consObj = session.getAttribute("constants");
	MyProperties rBConstantFile = null;
	if(consObj == null)
	{
		rBConstantFile = new MyProperties(local.loadPropertiesFile("constants",langCode));
		session.setAttribute("constants", rBConstantFile);
	}
	else
	{
		rBConstantFile = (MyProperties) consObj;
	}
	//request.setAttribute("constants", rBConstantFile);

    if(session.getAttribute("HoroscopeObj") != null){
    	//DesktopHoro ObjHoro1 = (DesktopHoro)session.getAttribute("HoroscopeObj"); 
        String tempname = ObjHoro.getName();
       // String titlefirstchar = UCase(left(tempname,1)); 
       
       if(tempname != null && tempname.length() >= 1)
       {
        String titlefirstchar =  tempname.substring(0, 1).toUpperCase();
        //String titleremain = right(tempname,len(tempname)-1);
        String titleremain =  tempname.substring((tempname.length())-(tempname.length()-1));
        //out.println(titlefirstchar+","+titleremain);
        title = titlefirstchar + titleremain;
       }
    }
    else
    {
        title = "Home";
    }
    
    
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title><%=title%></title>

<link rel="shortcut icon" href="https://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link type="text/css" rel="stylesheet" href="dist/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="dist/css/theme.css">
<link type="text/css" rel="stylesheet" href="dist/css/app.css">
<link type="text/css" rel="stylesheet" href="dist/css/responsive.css">
<link type="text/css" rel="stylesheet" href="dist/css/perfect-scrollbar.css">
<link type="text/css" rel="stylesheet" href="js/script/jquery.autocomplete.css" />

<script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/content-template-script.js"></script>
<script type="text/javascript" src="js/sharedfunction.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/script/validation.js"></script>

<!-- Change ".autocomplete" method to ".mtautocomplete" in materialize Js (Conflict issue) -->
 <script type="text/javascript" src="dist/js/materialize.min.js"></script>
 <script type="text/javascript" src="dist/js/perfect-scrollbar.min.js"></script>
 <script type='text/javascript' src='js/script/jquery.autocomplete.js'></script>
 <script type="text/javascript" src="dist/js/app.js"></script>   
    
   
<%
	if(request.getParameter("openPaidPopup")!=null){
%>
<script>	
	$(document).ready(function(){
	    $('#modal').modal();
	    $('#modal-cloud-plan').modal('open'); 
	 });
</script>
<%
   }
%>

<%
	if(request.getParameter("msgsignup")!=null){
%>
<script>	
	$(document).ready(function(){
		$("#msgString").html('<%=rBHome.getString("ALREADY_SIGNED_IN") %>');
	    $('#popup').modal('open'); 
	 });
</script>
<%
   }
%>
<%
	if(request.getParameter("openloginpopup")!=null){
%>
<script>	
	$(document).ready(function(){
		
	    $('#signin-popup').modal('open'); 
	 });
</script>
<%
   }
%>

<%
	if(request.getParameter("emailunavailable")!=null){
%>
<script>	
	$(document).ready(function(){
		$("#msgString").html("Email not available. Please grant AstroSage.com access to your email. ");
		$('#popup').modal('open'); 
		
	    
	 });
</script>
<%
   }
%>


   <%
   String TopicLang = "EN";
   %>

<%if (langCode == 2){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-tamil.css">	
<%TopicLang = "TA";}%>
<%if (langCode == 8){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-malayalam.css">	
<%TopicLang = "ML";}%>
<%if (langCode == 1){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-hindi.css">	
<%TopicLang = "HI";}%>
<%if (langCode == 9){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-marathi.css">	
<%TopicLang = "MR";}%>
<%if (langCode == 5){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-telugu.css">	
<%TopicLang = "TE";}%>
<%if (langCode == 7){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-gujarati.css">	
<%TopicLang = "GU";}%>
<%if (langCode == 6){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-bengali.css">	
<%TopicLang = "BN";}%>
<%if (langCode == 4){%>	 	
	<link type="text/css" rel="stylesheet" href="dist/css/app-kannada.css">	
<%TopicLang = "KA";}

%>

 <!--For FCM Subscribe-->
    <script src="https://www.gstatic.com/firebasejs/4.9.1/firebase.js"></script>
    <script>        var getAppLang = "CL_<%=TopicLang%>";</script>
    <script type="text/javascript" src="/dist/js/subscribe.min.js"></script>
 <!--End--> 
 
 

<script type="text/javascript">

//For Jquery conflict issue

    jQuery.browser = {};
    (function () {
        jQuery.browser.msie = false;
        jQuery.browser.version = 0;
        if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
            jQuery.browser.msie = true;
            jQuery.browser.version = RegExp.$1;
        }
    })();    
    $(document).ready(function() {     
        ajaxcallforcontent();
    });
    </script>
    


</head>
<%
String fullCol = "";
//out.println(getPlanId);
if (isPlanDhruv){	
	fullCol = "l12";
}else{
	
	fullCol = "l8";
}
%>
<body>

<div id="popup" class="modal modal-styles" style="display: none;">
 <div class="modal-content"> 
    <div class="modal-icons"> <img src="https://www.astrosage.com/images/logo-lg.png"> </div>
    <span id="msgString"></span>
    <div class="modal-footer">
     <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat text-orange">OK</a>
         </div>
         </div>
</div>
<%@include file='ui-control/header.jsp'%>


      <div id="main">
         <!-- START WRAPPER -->
         <div class="wrapper">
         
           <%@include file='ui-control/menu.jsp'%>
           
           <section class="right-part">
               <div class="container">               
               <%
               if (isPlanDhruv){
            	  %>
            	  <div class="mrt20"></div>
            	  <%
               }
            	else{
               %>
               	<%@include file='ui-control/promo-banner.jsp'%>
               <%
               }
               %>               
               	<%@include file='notification-bar.jsp'%>
        		
                  <div class="row class-main">
                     <div class="col s12 <%=fullCol%>">                   														
							
								<div id="main-content">
								
								<%@include file='report.jsp'%>
								<%@include file='ui-control/ad-content-area.jsp'%>
									<% if(title == "Home"){ %>
									
									<div class="card-panel">
										
												<h5 class="center-align">Your Session has been expired. Please <a href="signin.jsp">Login</a> again.</h5>
										
									</div>
									
									<% }else{ %>
									
									 <%@include file='ui-control/calculation.jsp'%>
									 
									<%  
                                }
                                %>
                                <%if(!Util.isMobileDevice(request)) { %>
                                 <div class="row">
                           			<div class="col s12 center-align">
                                		<%@include file='ui-control/responsive-ad.jsp'%>
                                	</div>
                                </div>
                                <%} %>
								</div>
							 </div>
              	<%
              	if (!isPlanDhruv){
              	%>          
	           		<%@include file='ui-control/right.jsp'%>
              	<%
              			}
       			%>
                  
                    </div>
                    </div>
                    </section>
						
						
				</div>
			</div>
			
<footer class="page-footer">
 	<%@include file='ui-control/footer.jsp'%>
</footer>	
<%
 if (!isPlanDhruv){
%>
	<%@include file='/include/popupbox.jsp'%>
 <% 
}
%>
	
	<%@include file='usernotes-box/comment.jsp'%>
	<%@include file='feedback-form.jsp'%>
	<%@include file='sharechartpublicly.jsp'%>		
	<%@include file='print.jsp'%>			
	<%@include file='openchart.jsp'%>
	<%@include file='savechart.jsp'%>
	<%@include file='toolbar.jsp'%>
	<%@include file='service-order-popup.jsp'%>
	<jsp:include page='ui-control/loginpopup.jsp' />
<%if(Util.isMobileDevice(request)) { %>	
	<%@include file='ui-control/app-install.jsp'%>
<%} %>
</body>
</html>
<%
//}%>

