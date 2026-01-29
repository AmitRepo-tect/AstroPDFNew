<%@page import="com.ojassoft.astrosagecloud.WorksheetServlet"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
WorksheetServlet Wk = new WorksheetServlet();
Wk.initialize(request, response);

Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = 0;
languageCode = Util.safeInt(session.getAttribute("languageCode"));


MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle filemenuChartstyle = local.loadPropertiesFileNew("filemenu-chartstyle",languageCode);
MyResourceBundle activationPage = local.loadPropertiesFileNew("activationpage",languageCode);
MyResourceBundle signUp = local.loadPropertiesFileNew("signup",languageCode);
MyResourceBundle defaultWK = local.loadPropertiesFileNew("WK_default",languageCode);

%>
<% 
  /*if(request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("english")) {
       session.setAttribute("languageCode",0);
        if(session.getAttribute("HoroscopeObj")!=null && !session.getAttribute("HoroscopeObj").equals("")) {
        	DesktopHoro obj = (DesktopHoro)session.getAttribute("HoroscopeObj");
        	obj.setLanguageCode("0");
        	obj.initialize();
        }
  }


if(request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("hindi")) {
	session.setAttribute("languageCode",1);
	 if(session.getAttribute("HoroscopeObj")!=null && !session.getAttribute("HoroscopeObj").equals("")) {
		 DesktopHoro obj = (DesktopHoro)session.getAttribute("HoroscopeObj");
    	obj.setLanguageCode("1");
    	obj.initialize();
} }*/

    if(request.getParameter("charttype")!=null && request.getParameter("charttype").equals("south")){
       session.setAttribute("chartType",1);
    }

    
    if(request.getParameter("charttype")!=null && request.getParameter("charttype").equals("north")){
        session.setAttribute("chartType",0);
     }

    if(session.getAttribute("chartType")!=null && session.getAttribute("chartType").equals("")){
    	 session.setAttribute("chartType",0);
    }
    
    /*if(session.getAttribute("languageCode")!=null && session.getAttribute("languageCode").equals("")){
   	 session.setAttribute("languageCode",0);
   }*/

   %>
   <%
 String ischartexist = "0";
 if(session.getAttribute("HoroscopeObj")==null || session.getAttribute("HoroscopeObj").equals("") || session.getAttribute("User_Id")==null || session.getAttribute("User_Id").equals("")){
	 //response.sendRedirect("/cloud/defaultchartlogin.asp?methodName=fromJSP&referrer=/cloud/worksheet/"); 
	 response.sendRedirect("/cloud/login.asp");
	 //return;
 }
 else
 {
 if(languageCode > 1)
 {
 	//languageCode = 0;
 	DesktopHoro obj = (DesktopHoro)session.getAttribute("HoroscopeObj");
 	obj.setLanguageCode("0");
 	obj.initialize();
 	//languageCode 
 	
 }
  
 %>
 
 <%
 String Languagecode= "",name="",gender="",dob="",mob="",yob="",hob=",",minob="",sob="",DST="",kphn="";
 String latdeg="",latmin="",longdeg="",longmin="",longew="",latns="",timezone="",place="",AyanamsaType="";
 
 SharedFunction shr = new SharedFunction();
 DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
 String uri = request.getRequestURI();
 
 if(myAstrologyObject!=null && !myAstrologyObject.equals("")) {
    Languagecode = "0";//GetLanguageCode();
    name = myAstrologyObject.getName();
    gender = myAstrologyObject.getMaleFemale();
    dob = String.valueOf(myAstrologyObject.getDayOfBirth());
    mob = String.valueOf(myAstrologyObject.getMonthOfBirth());
    yob = String.valueOf(myAstrologyObject.getYearOfBirth());
    hob = myAstrologyObject.getHourOfBirth();
    minob = myAstrologyObject.getMinuteOfBirth();
    sob = myAstrologyObject.getSecondOfBirth();
    latdeg = myAstrologyObject.getDegreeOfLattitude();
    latmin = myAstrologyObject.getMinuteOfLattitude();
    longdeg = myAstrologyObject.getDegreeOfLongitude();
    longmin = myAstrologyObject.getMinuteOfLongitude();
    longew = myAstrologyObject.getEastWest();
    latns = myAstrologyObject.getNorthSouth();
    timezone = myAstrologyObject.getTimeZone();
    place = myAstrologyObject.getPlace();
    DST = myAstrologyObject.getDST();
    AyanamsaType = shr.getAyan(myAstrologyObject);
    kphn = String.valueOf(myAstrologyObject.getKPHorarySeed());
 }

 String  json = "{";
        json = json + "chartname\"\":" + name + "\"\",";
        json = json + "gender\"\":" + gender + "\"\",";
        json = json + "DOB\"\":" + dob + "\"\",";
        json = json + "MOB\"\":" + mob + "\"\",";
        json = json + "YOB\"\":" + yob + "\"\",";
        json = json + "Hrs\"\":" + hob + "\"\",";
        json = json + "Min\"\":" + minob + "\"\",";
        json = json + "Sec\"\":"+ sob + "\"\",";
        json = json + "Place\"\":" + place + "\"\",";
        json = json + "LongDeg\"\":" + longdeg + "\"\",";
        json = json + "LongMin\"\":" + longmin + "\"\",";
        json = json + "LongEW\"\":" + longew + "\"\",";
        json = json + "LatDeg\"\":" + latdeg + "\"\",";
        json = json + "LatMin\"\":" + latmin + "\"\",";
        json = json + "LatNS\"\":" + latns + "\"\",";
        json = json + "Timezone\"\":" + timezone + "\"\",";
        json = json + "DST\"\":" + DST + "\"\",";
        json = json + "AyanamsaType\"\":" + AyanamsaType + "\"\",";
        json = json + "kphn\"\":" + kphn + "\"\",";
        json = json +"}" ;

      
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
 	<link rel="shortcut icon" href="http://www.astrosage.com/assets/ico/favicon.png" />     
    <title>AstroSage Worksheet - Design Your Own AstroSage</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />    
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />    
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <link rel="stylesheet" href="css/global-ui.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/app.css">   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="js/draw-chart.js"></script>
    <script type="text/javascript" src="js/canvas.js"></script>
    <script type="text/javascript" src="js/constants.js"></script>   
    <script src="js/global-ui-js.jsp" type="text/javascript"></script>
    <script src="js/google-analytics.js" type="text/javascript"></script>
    <script src="js/shared-functions.js" type="text/javascript"></script>
	<script type='text/javascript' src='js/functions.js'></script>
	<script type='text/javascript' src='/dist/js/jquery.autocomplete.min.js'></script>  
	<link rel="stylesheet" type="text/css" href="/atlas/css/jquery.autocomplete.css" />

<!-- default popup window --->

<div id="dialog-form-default-chart" style=" border:#000 0px solid;">
 <div class="dialognotification">
 <img src="" id="imgdialog" /></div>
 <div align="left" style="border:#000 0px solid; text-align:left;">
    <font size="3" color="maroon"> 
    <b id="dynamictext"></b></font>
 </div>
</div>

<!--End---->
 
<script type="text/javascript">
    $(function () {
        var language = '<%=languageCode%>';
        var chartype = '<%=session.getAttribute("chartType")%>';
        

       
       // alert(chartype);
        if (language == '0') {
            $('#eng').removeClass('ui-top-center').addClass('ui-new');
        }

        if (language == '1') {
            $('#hin').removeClass('ui-top-center').addClass('ui-new');
        }

        if (chartype == '0') {
            $('#north').removeClass('ui-top-center').addClass('ui-new');
        }

        if (chartype == '1') {
            $('#south').removeClass('ui-top-center').addClass('ui-new');
        }

    });

     function alertbox(data) {
         $("#alertdiv").addClass("alert-box");
         $('#alertdiv').html(data);
         $('.ui-wrapper').addClass("alertbox");
         
         setTimeout(function () {
             $('#alertdiv').removeClass('alert-box');
             $('#alertdiv').html("");
             $('.ui-wrapper').removeClass("alertbox");
         }, 3000);
     }


     function resetcookies() {
         $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'WorksheetServlet?methodName=reset_cookies',
                    'data': ({ setgetcookies: 2 }),
                    'success': function (data) {
                     //alert("data=" + data);
                     location.reload();
                    }
                });
         }

     function markDefaultChart(userid, chartid) {
         
         sendurl = "methodName=markDefaultChart&userchartidentity=" + chartid + "&useridentity=" + userid;
         var getObjReturnreports = $.get("/cloud/ChartServlet", sendurl, function (data, status, xhr) {
             //alert(data);
             if (data == "0") {
                 $('#imgdialog').attr('src', '/cloud/images/alert.png');
                 $('#dynamictext').html('<%=rBConstants.getString("RECORD_NOT_FOUND_MISMATCH_USER_AND_CHART_ID") %>');
                 $('#dialog-form-default-chart').dialog('open');
             }
             else if (data == "1") {
                 $('#imgdialog').attr('src', '/cloud/images/availableimg.png');
                 $('#dynamictext').html('<%=rBConstants.getString("CHART_MARKED_DEFAULT1") %>' + "  '" + '<%=name %>' + "' " + '<%=rBConstants.getString("CHART_MARKED_DEFAULT2") %>' + " '" + '<%=session.getAttribute("User_Id") %>' + "' " + '<%=rBConstants.getString("CHART_MARKED_DEFAULT3") %>');
                 $('#dialog-form-default-chart').dialog('open');
             }
             else if (data == "2") {
                 $('#imgdialog').attr('src', '/cloud/images/alert.png');
                 $('#dynamictext').html('<%=rBConstants.getString("ERR_OCCURRED") %>');
                 $('#dialog-form-default-chart').dialog('open');
             }
             else if (data == "3") {
                 $('#imgdialog').attr('src', '/cloud/images/alert.png');
                 $('#dynamictext').html('<%=rBConstants.getString("USER_SESSION_EXPIRED") %>');
                 $('#dialog-form-default-chart').dialog('open');
                 //alert('<%=rBConstants.getString("USER_SESSION_EXPIRED") %>');
             }
             else if (data == "4") {
                 $('#imgdialog').attr('src', '/cloud/images/alert.png');
                 $('#dynamictext').html('<%=rBConstants.getString("VALUES_NOT_SUPPLIED") %>');
                 $('#dialog-form-default-chart').dialog('open');
             }
             else if (data == "5") {
                 $('#imgdialog').attr('src', '/cloud/images/alert.png');
                 $('#dynamictext').html('<%=rBConstants.getString("AUTHENTICATION_FAILED") %>');
                 $('#dialog-form-default-chart').dialog('open');
             }
         });
     }

         $("#dialog-form-default-chart").dialog(
            {
                autoOpen: false,
                title: '<%=rBConstants.getString("MESSAGE") %>',
                height: 180,
                width: 520,
                modal: true,
                open: function (event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '160px');
                    $(event.target).parent().css('center');
                },
                buttons:
                {
                    '<%=rBConstants.getString("OKVAL") %>': function () {
                        $(this).dialog('close');
                    }

                },
                close: function () {
                }
            });

       function checklogin() {
                $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': '/cloud/worksheet/control/getcookiesession.jsp',
                    'success': function (data) {
                        //alert(data);
                        if (data >= 0) {
                           // alert("kk" + data);
                        }
                    }
                });
            }
 </script>
 </head>
<body >
<header class="header">
<% if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")){ %>

<div class="top-header">
<div class="container">
<div class="row">
<div class="col-lg-5">
<ul class="top-left"> 
<li> <a href="/cloud/home.asp" id="goastro" class="btn bg-dark-blue text-white btn-radius"> <img src="images/back.png" class="img-size" />  <%=defaultWK.getString("GO_TO_ASTROSAGE_CLOUD")%> </a> </li>
<li> <p class="btn btn-radius text-orange txt-class"> <%=name %>, <%=dob %>-<%=mob %>-<%=yob %>, <%=hob %>:<%=minob %>:<%=sob %>, <%=place %>(<%=longdeg+longew+longmin %>, <%=latdeg+latns+latmin %>, <%=timezone %>) </p> </li>
</ul>
</div>
<div class="col-lg-7">
  <div class="ui-users user-design">
    <a href="#" id="loginButton"><span class="ui-user-link"><%=rBConstants.getString("WELCOME")%>, 
    <% if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals(""))
    { 
    	out.println(session.getAttribute("User_Id"));
    	} 
    else
    { out.println("Guest");
    }%></span></a>
    </div>
    <%@include file='loginmenu.jsp'%>
<div class="top-right pull-right">
<button class="btn bg-dark-blue btn-radius text-white btn-change" id="addbox"><%=rBConstants.getString("ADD_BOX") %> &nbsp;  <img src="images/add-box.png" /></button>
<button onclick="openfeedbackform()" class="btn bg-dark-purple btn-radius text-white btn-change"><%=rBConstants.getString("FEEDBACK")%></button>
<button class="btn bg-dark-orange btn-radius text-white btn-change" onclick="resetcookies();"><%=defaultWK.getString("WK_RESET") %></button>

<%-- <button class="btn bg-dark-blue btn-radius text-white btn-change" id="addbox"><%=rBConstants.getString("ADD_BOX") %> &nbsp;  <img src="images/add-box.png" /></button>
<button onclick="openfeedbackform()" class="btn bg-dark-purple btn-radius text-white btn-change" id="feedback"><%=rBConstants.getString("FEEDBACK")%></button>
<button class="btn bg-dark-orange btn-radius text-white btn-change" onclick="resetcookies();" id="reset"><%=defaultWK.getString("WK_RESET") %></button> --%>

<div class="btn-group">
    <button type="button" class="btn bg-dark-blue btn-radius text-white btn-change mr-0 dropdown-toggle" data-toggle="dropdown">
       Setting &nbsp; 
    </button>
    <div class="dropdown-menu menu-adjust">
     <a class="dropdown-item" id="eng" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=english" %>" title='English'>English</a>
     <a class="dropdown-item" id="hin" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=hindi" %>"  title='Hindi'>हिंदी</a>
     <a class="dropdown-item" id="tam" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=tamil" %>"  title='Tamil'>தமிழ்</a>
	 <a class="dropdown-item" id="tel" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=telugu" %>"  title='Telugu'>తెలుగు</a>
	 <a class="dropdown-item" id="ben" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=bengali" %>"  title='Bengali'>বাংলা</a>
	 <a class="dropdown-item" id="guj" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=gujarati" %>"  title='Gujarati'>ગુજરાતી</a>
	 <a class="dropdown-item" id="kan" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=kannada" %>"  title='Kannada'>ಕನ್ನಡ</a>
	 <a class="dropdown-item" id="mal" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=malayalam" %>"  title='Malayalam'>മലയാളം</a>
	 <a class="dropdown-item" id="mar" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=marathi" %>"  title='Marathi'>मराठी</a>
	 <a class="dropdown-item" id="north" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?charttype=north" %>"  title=<%//=filemenuChartstyle.getString("NORTH") %>><%=filemenuChartstyle.getString("NORTH") %></a>
     <a class="dropdown-item" id="south" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?charttype=south" %>" title=<%//=filemenuChartstyle.getString("SOUTH") %>><%=filemenuChartstyle.getString("SOUTH") %></a>
     <%if(session.getAttribute("ChartId")!=null && !session.getAttribute("ChartId").equals("")){ %>
     <a class="dropdown-item" style="cursor:pointer" id="md" onclick="markDefaultChart('<%=session.getAttribute("User_Id")%>','<%=session.getAttribute("ChartId")%>');" title="<%=rBConstants.getString("MAKE_DEFAULT") %>"><%=rBConstants.getString("MAKE_DEFAULT") %></a>
     <%} %>  
      
    </div>
  </div>

  
</div>
</div>
</div>
</div>
</div>


<div class="nav_header bg-dark-purple" id="navbar-header">
<div class="container">
<div class="row">
<div class="col-lg-12"> 
<nav class="navbar navbar-expand-sm navbar-dark">
        <a class="navbar-brand" href=""><img src="images/logo.png" /></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
  </button>
   <div class="collapse navbar-collapse navbar-setting" id="navbarTogglerDemo01">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/"><span class="nav-icons"><img src="images/home.png" /></span> <%=rBConstants.getString("HOME") %></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" onclick="openChart('manage');" href="javascript:void(0);"><span class="nav-icons"><img src="images/delete.png" /></span> <%=rBConstants.getString("DELETE_CHART")%></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" onclick="editchartform('1');" href="javascript:void(0);"><span class="nav-icons"><img src="images/edit-chart.png" /></span> <%=rBConstants.getString("EDIT_CHART") %></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" onclick="savechart();" href="javascript:void(0);"><span class="nav-icons"><img src="images/save-chart.png" /></span> <%=rBConstants.getString("SAVCHART") %></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" onclick="openprintdialog();" href="javascript:void(0);"><span class="nav-icons"><img src="images/print.png" /></span> <%=rBConstants.getString("PRINT") %></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link" onclick="openChart('open');" href="javascript:void(0);"><span class="nav-icons"><img src="images/open-chart.png" /></span> <%=rBConstants.getString("OPEN_CHART") %></a>
            </li>                                                                                                   
            <li class="nav-item">                                                                                   
                <a class="nav-link pr-0" onclick="opennewchartform();" href="javascript:void(0);"><span class="nav-icons"><img src="images/new-chart.png" /></span> <%=rBConstants.getString("NEW_CHART") %></a>
            </li>
            
        </ul>
        </div>
    </nav>
    </div>
</div>
</div>
</div>
<div style="clear:both"></div>
     <div id="alertdiv"> </div>
      <div style="clear:both"></div>
    <div class="ui-clear">
    </div>    
 </header>
 <%}else{ %>
   <div class="ui-topbar">
   </div>
  <div class="ui-header">
  <div class="ui-logo" style="float:left;"><img src="/freekundali/images/worksheet-logo2.png" width="200"/></div>

  <div class="ui-users">
    <a href="#" id="A1"><span class="ui-user-link">
    <%=rBConstants.getString("WELCOME")%>, <% if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")){ out.println(session.getAttribute("User_Id")); }else{ out.println("Guest"); }%>
    </span></a>
 </div>
 
  </div>
 
  <div class="login-box">
  <div style="text-align:center; font-size:24px; margin-top:15px;"><%=defaultWK.getString("LOGIN_TEXT")%></div>
  <div align="center" style=" margin:35px; font-size:16px;">
   <a href="/cloud/login.asp" class="ui-login"><%=rBConstants.getString("LOGIN")%></a><span style=" padding:0px 15px;"><%=activationPage.getString("AUR")%></span> <a href="/cloud/signup.asp" class="ui-register"><%=signUp.getString("SIGNUP")%></a>
  </div>
  </div>

<div align="center" class="ui-video-panel">
<iframe width="500px" height="315px" class="ui-video" src="https://www.youtube.com/embed/VFXbwWgmOSk" frameborder="0" allowfullscreen></iframe>

<iframe width="500px" height="315px" class="ui-video" src="https://www.youtube.com/embed/WqLX1jy3Wsc" frameborder="0" allowfullscreen></iframe>
</div>

  <%}%>
      <% if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")){ %>
    <div class="ui-wrapper" id="outerdiv">
    </div>
    
    
    <setion class="cloud-chart">
<div class="container">
<div class="row">
<div class="col-lg-4"> 
<div class="box-design bg-light-blue">
<div class="box-header">
<h4 class="text-left pull-left text-dark-blue"> Shadbala </h4>
<div class="right-icon text-right">
<ul> 
<li> <a href="#"> <i class="fa fa-minus" aria-hidden="true"></i> </a> </li>
<li> <a href="#"> <i class="fa fa-cog" aria-hidden="true"></i> </a> </li>
<li> <a href="#"> <i class="fa fa-times" aria-hidden="true"></i> </a> </li>
</ul>
</div>

</div>
<div class="box-body">
</div>
</div>
</div>
</div>
</div>

</setion>



  <%@include file='feedback-form.jsp'%>
   <%@include file='model/newchart.jsp'%>
    <%@include file='model/editchart.jsp'%>
     <%@include file='model/openchart.jsp'%>
      <%@include file='model/savechart.jsp'%>
       <%@include file='model/print.jsp'%> 
        <%@include file='include/i_options.jsp'%> 
        

  <%}
 }
  %>
</body>
</html>
 