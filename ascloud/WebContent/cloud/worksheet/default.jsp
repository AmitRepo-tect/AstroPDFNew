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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta http-equiv="content-type" content="text/html; charset=utf-8" />  
 	<link rel="shortcut icon" href="http://www.astrosage.com/assets/ico/favicon.png" />     
    <title>AstroSage Worksheet - Design Your Own AstroSage</title>
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <link rel="stylesheet" href="css/global-ui.css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
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
 <body class="RScroll">
<div id="header">
<% if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")){ %>

<div class="ui-topbar">
<div style=" float:left; width:13%; padding:5px 0px 0px 20px;" class="ui-top-left">
<a href="/cloud/home.asp" id="goastro" class="link-top"><i class="glyphicon glyphicon-arrow-left"></i> <%=defaultWK.getString("GO_TO_ASTROSAGE_CLOUD")%></a>
</div>

<div style=" float:left; width:57%;">
<div align="center">

<a class="ui-top-center" id="eng" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=english" %>" title='English'><b>English</b></a>
<a class="ui-top-center" id="hin" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=hindi" %>"  title='Hindi'><b>हिंदी</b>
<div class="togle-btn"> <a class=""><b>More</b></a>
<ul class="toggle-mnu">
 

<li> <a  id="tam" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=tamil" %>"  title='Tamil'><b>தமிழ்</b></a></li>
<li> <a id="tel" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=telugu" %>"  title='Telugu'><b>తెలుగు</b></a></li>
<li> <a id="ben" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=bengali" %>"  title='Bengali'><b>বাংলা</b></a></li>
<li> <a id="guj" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=gujarati" %>"  title='Gujarati'><b>ગુજરાતી</b></a></li>
<li> <a id="kan" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=kannada" %>"  title='Kannada'><b>ಕನ್ನಡ</b></a></li>
<li> <a id="mal" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=malayalam" %>"  title='Malayalam'><b>മലയാളം</b></a></li>
<li> <a id="mar" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?LanguageType=marathi" %>"  title='Marathi'><b>मराठी</b></a></li>

</ul></div>
<a class="ui-top-center" id="north" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?charttype=north" %>"  title=<%//=filemenuChartstyle.getString("NORTH") %>><b><%=filemenuChartstyle.getString("NORTH") %></b></a>
<a class="ui-top-center" id="south" href="<%="http://" + request.getHeader("Host") + request.getRequestURI() + "?charttype=south" %>" title=<%//=filemenuChartstyle.getString("SOUTH") %>><b><%=filemenuChartstyle.getString("SOUTH") %></b></a>
 <%if(session.getAttribute("ChartId")!=null && !session.getAttribute("ChartId").equals("")){ %>
<a class="ui-top-center" style="cursor:pointer" id="md" onclick="markDefaultChart('<%=session.getAttribute("User_Id")%>','<%=session.getAttribute("ChartId")%>');" title="<%=rBConstants.getString("MAKE_DEFAULT") %>"><b><%=rBConstants.getString("MAKE_DEFAULT") %></b></a>
<%} %>  
</div>
</div>
<style>
.togle-btn {
	position: relative;
	cursor:pointer;
	color:#fff;
	font-size:16px;
	padding-left:5px;
	display:inline-block;
}
.togle-btn a {
    color:#fff;
	font-size:16px;
	display:block;
	margin:0px;
	line-height:0;
	padding:0 5px;
}
.toggle-mnu{
	position: absolute;
	background:#f5f5f5;
	display:none;
	left:auto;
	right:auto;
	top:17px;
	width:120px;
	}
	.toggle-mnu li {
	 list-style:none;
	}
	.toggle-mnu li a {
	 padding:10px;
	 border-bottom:1px solid #ddd;
	 text-align:left;
	 display:block;
	 color:#333;
	 line-height:1;
	}
	.toggle-mnu li a:hover {
	background:#fff;
	color:#333;
	}
	.ui-top-left a {
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	width:194px;
	display:inline-block;
	}

</style>
<script>
$(document).ready(function(){
    $(".togle-btn").click(function(){
        $(".toggle-mnu").slideToggle();
    });
});
</script>
<div style=" float:right; width:30%;">
<button class="ui-float-r ui-margin-r" onclick="resetcookies();" id="reset" style="margin-top: 1px;"><%=defaultWK.getString("WK_RESET") %></button>
<button onclick="openfeedbackform()" class="ui-float-r ui-margin-r" id="feedback" style="margin-top: 1px;"><%=rBConstants.getString("FEEDBACK")%></button>
<button class="ui-float-r ui-margin-r" id="addbox" style="margin-top: 1px;"><%=rBConstants.getString("ADD_BOX") %></button>

 <!--<button class="ui-float-r ui-margin-r" id="savebox"style="margin-top: 1px;">Save</button>-->
  </div>

  <div style="clear:both"></div>
  </div>
  
 <div class="ui-header">
  <div class="ui-logo"><img src="/cloud/images/worksheet-logo2.png" width="200"/></div>
  <div style=" float:left; background:#A54121; border: 2px solid #fff; margin-top:13px;-webkit-border-radius:5px;-moz-border-radius:5px; border-radius:5px; padding:5px; color:#fff; font-size:large;">
  <%=name %>, <%=dob %>-<%=mob %>-<%=yob %>, <%=hob %>:<%=minob %>:<%=sob %>, <%=place %>(<%=longdeg+longew+longmin %>, <%=latdeg+latns+latmin %>, <%=timezone %>)</div>
  <div class="ui-users">
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
  </div>

 <div>
 <!--include file = 'notification-bar.asp'-->
 </div>


   <div class="ui-toolbar">
        <div class="ui-toolbar-btnset">
            <div class="ui-toolbarbtn-group">
                   <a onclick="opennewchartform();" class="ui-toolbtn"  style="cursor:pointer" title="<%=rBConstants.getString("NEW_CHART") %>">
                    <i class="icon-file"></i></a>
                    </div>
            <div class="ui-toolbarbtn-group">
                <a class="ui-toolbtn" onclick="openChart('open');" style="cursor:pointer" title="<%=rBConstants.getString("OPEN_CHART") %>">
                    <i class="icon-folder-open"></i></a>
                    </div>
            <div class="ui-toolbarbtn-group">
                <a class="ui-toolbtn" onclick="openprintdialog();" style="cursor:pointer" title="<%=rBConstants.getString("PRINT") %>">
                   <i class="icon-print"></i></a>
                    </div>
            <div class="ui-toolbarbtn-group">
                <a class="ui-toolbtn" onclick="savechart();" style="cursor:pointer" title="<%=rBConstants.getString("SAVCHART") %>">
                    <i class="icon-ok-sign"></i></a>
                    </div>
            <div class="ui-toolbarbtn-group">
                <a onclick="editchartform('1');" class="ui-toolbtn" style="cursor:pointer" title="<%=rBConstants.getString("EDIT_CHART") %>">
                  <i class="icon-pencil"></i></a>
            </div>
            <div class="ui-toolbarbtn-group">
                <a class="ui-toolbtn" onclick="openChart('manage');" style="cursor:pointer" title="<%=rBConstants.getString("DELETE_CHART")%>">
                    <i class="icon-trash"></i></a>
                    </div>
            <div class="ui-toolbarbtn-group">
                <a href="/" class="ui-toolbtn" style="cursor:pointer" title="<%=rBConstants.getString("HOME") %>">
                    <i class="icon-home"></i></a>
                    </div>
           
           
           </div></div> 
         

 
 <div style="clear:both"></div>
     <div id="alertdiv"> </div>
      <div style="clear:both"></div>
    <div class="ui-clear">
    </div>    
 </div>
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
 