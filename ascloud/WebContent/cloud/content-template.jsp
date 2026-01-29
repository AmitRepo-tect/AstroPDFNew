<%@page import="com.ojassoft.astrosagecloud.util.TitleConstants"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<%//@include file="control/ischartexistintblchart.asp"%>
<%//@include file="cookie.inc"%>

<%
try
{
Local local = new Local();
int langCode = Util.safeInt(session.getAttribute("languageCode"));
Object objct = session.getAttribute("constants");
MyProperties rBConstantFile = null;
if(objct != null)
{
	rBConstantFile = (MyProperties) objct;
}
else
{
	rBConstantFile = new MyProperties(local.loadPropertiesFile("constants", langCode));
	session.setAttribute("constants", rBConstantFile);
}

DesktopHoro ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
String strprint = Util.safestr(request.getAttribute("includeFile"));

int getPlanIdIn=1; // Set the this variable as basic plan
UserDAO UDIn = new UserDAO();
getPlanIdIn = Integer.parseInt(UDIn.getPlanId(String.valueOf(session.getAttribute("User_Id"))));

 

%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
	<%
	String x = TitleConstants.titleMap.get(strprint);
	if(x == null || x.equals(""))
	{
		x = strprint;
	}
	%>
<title><%=x%></title>

<link rel="shortcut icon"
	href="https://www.astrosage.com/assets/ico/favicon.png" />
<link
	href='https://fonts.googleapis.com/css?family=Titillium+Web:400,600,700'
	rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />

<link type="text/css" rel="stylesheet"
	href="dist/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="dist/css/theme.css">
<link type="text/css" rel="stylesheet" href="dist/css/app.css">
<link type="text/css" rel="stylesheet" href="dist/css/responsive.css">
<link type="text/css" rel="stylesheet"
	href="dist/css/perfect-scrollbar.css">
<link type="text/css" rel="stylesheet"
	href="js/script/jquery.autocomplete.css" />

<script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/content-template-script.js"></script>
<script type="text/javascript" src="js/sharedfunction.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/script/validation.js"></script>

<!-- Change ".autocomplete" method to ".mtautocomplete" in materialize Js (Conflict issue) -->
<script type="text/javascript" src="dist/js/materialize.min.js"></script>
<script type="text/javascript" src="dist/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="dist/js/modernizr.js"></script>
<script type='text/javascript' src='js/script/jquery.autocomplete.js'></script>
<script type="text/javascript" src="dist/js/app.js"></script>

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
<%TopicLang = "KA";}%>

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
   
</script>

<script type="text/javascript">
    $(document).ready(function() {        
        var count;
        count = 0;
        URL = window.location.href;
        indexval = URL.lastIndexOf("/");
        subURL = URL.substr(indexval + 1);
        var LogingflagVar = false;       
        // Change page heading dynamically.
        changeHeading();        
        // print Option On File Menu
        print();
        ajaxcallforcontent();
    });   
    function ChangePlanetImage()
    {
     if('<%=session.getAttribute("languageCode") %>' ==1) 
     {
       $('#main-content img[src$=".gif"]').each(function(n) {     
                var imgurl = this.src;
                newimgurl = "hi-" + Right(imgurl, imgurl.length - imgurl.indexOf('images'));
                this.src = newimgurl;
            });
     }
     else if('<%=session.getAttribute("languageCode") %>' ==2)
     {
        $('#main-content img[src$=".gif"]').each(function(n) {     
                var imgurl = this.src;
                newimgurl = "ta-" + Right(imgurl, imgurl.length - imgurl.indexOf('images'));
                this.src = newimgurl;
            });
     }
     else if('<%=session.getAttribute("languageCode") %>' == 5)
    {
        $('#main-content img[src$=".gif"]').each(function(n)
        {     
            var imgurl = this.src;
            newimgurl = "te-" + Right(imgurl, imgurl.length - imgurl.indexOf('images'));
            this.src = newimgurl;
        });
     }
    }  
    
</script>
<%
String fullColIn = "";
//out.println(getPlanId);
if (getPlanIdIn == 8 || getPlanIdIn == 9 || getPlanIdIn == 10 ){	
	fullColIn = "l12";
	
}else{
	
	fullColIn = "l8";
}
%>
</head>

<body>
	<%@include file='ui-control/header.jsp'%>
	<jsp:include page='ui-control/loginpopup.jsp'/>

	<div id="main">
		<!-- START WRAPPER -->
		<div class="wrapper">

			<%@include file='ui-control/menu.jsp'%>

			<section class="right-part">
				<div class="container">
				 <%
               if (getPlanIdIn == 8 || getPlanIdIn == 9 || getPlanIdIn == 10 ){
            	  %>
            	  <div class="mrt64"></div>
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
						<div class="col s12 <%=fullColIn%>">
							<div id="main-content">
								<jsp:include page="${includeFile}" />								
                                <%@include file='ui-control/responsive-ad.jsp'%>                                	
							</div>						

							<%@include file='all-category.jsp'%>
							
							<div id="main-content-report"></div>

						</div>


						<%
						if (getPlanIdIn != 8 && getPlanIdIn != 9 && getPlanIdIn != 10 ){
               
            	%>
            	   		<%@include file='ui-control/right.jsp'%>
              	<%
              			}
       			%>

					</div>
				</div>
			</section>

			<div id="notimsg"></div>

		</div>
	</div>

	<footer class="page-footer">
		<%@include file='ui-control/footer.jsp'%>		
	</footer>
<%
if (getPlanIdIn != 8 && getPlanIdIn != 9 && getPlanIdIn != 10 ){
%>
<%@include file='/include/popupbox.jsp'%>
<%
}
%>
	<%@include file='usernotes-box/comment.jsp'%>
	<%@include file='feedback-form.jsp'%>
	<%@include file='sharechartpublicly.jsp'%>
	<%@include file='savechart.jsp'%>
	<%@include file='openchart.jsp'%>
	<%@include file='print.jsp'%>
	<%@include file='toolbar.jsp'%>
	<%@include file='service-order-popup.jsp'%>
<%if(Util.isMobileDevice(request)) { %>	
	<%@include file='ui-control/app-install.jsp'%>
<%} %>
</body>
</html>
<%
}
catch(Exception e)
{
	e.printStackTrace();
}
%>