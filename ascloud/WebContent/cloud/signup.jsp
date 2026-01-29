<%@page import="com.ojassoft.astrosagecloud.model.ConnectionService"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title>SignUp</title>
<link rel="shortcut icon" href="http://www.astrosage.com/assets/ico/favicon.png" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="dist/css/materialize.min.css" media="screen,projection" />
<link type="text/css" rel="stylesheet" href="dist/css/theme.css">
<link type="text/css" rel="stylesheet" href="dist/css/app.css">
<link type="text/css" rel="stylesheet" href="dist/css/responsive.css">

<script type="text/javascript" src="dist/js/jquery-3.3.1.min.js"></script>
 <script type="text/javascript" src="dist/js/materialize.min.js"></script>
 <script type="text/javascript" src="dist/js/perfect-scrollbar.min.js"></script>
 <script type="text/javascript" src="dist/js/app.js"></script>      
 


<%
int langCodeSignUp = Util.safeInt(session.getAttribute("languageCode"));
Local localSignUp = new Local();

Object objct = session.getAttribute("constants");
MyProperties rBConstantFile = null;
if(objct != null)
{
	rBConstantFile = (MyProperties) objct;
}
else
{
	rBConstantFile = new MyProperties(localSignUp.loadPropertiesFile("constants", langCodeSignUp));
	session.setAttribute("constants", rBConstantFile);
}


MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBSignup = localSignUp.loadPropertiesFileNew("signup",langCodeSignUp);
%>

<script type="text/javascript">
    // Sign Up Form Validation starting from here.

    function validateSignUpForm() {
        if (document.getElementById('userId').value != "") {
            if (document.getElementById('userId').value.length < 8) {
                alert('<%=rBSignup.getString("USER_ID_SHOULD_BE_8_OR_MORE_THAN_8_CHARACTERS") %>');
                document.getElementById('userId').focus();
                return false;
            }
        }
        else {
            alert('<%=rBSignup.getString("USER_ID_SHOULD_NOT_BE_BLANK") %>');
            document.getElementById('userId').focus();
            return false;
        }
        var checkOK = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        var checkStr = document.getElementById('userId').value;
        var allValid = true;
        var decPoints = 0;
        var allNum = "";
        for (i = 0; i < checkStr.length; i++) {
            ch = checkStr.charAt(i);
            for (j = 0; j < checkOK.length; j++)
                if (ch == checkOK.charAt(j))
                break;
            if (j == checkOK.length) {
                allValid = false;
                break;
            }
            if (ch != ",")
                allNum += ch;
        }
        if (!allValid) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_ONLY_DIGIT_ALPHABAT_CHARACTERS_IN_THE_USER_ID_FIELD") %>');
            document.getElementById('userId').focus();
            return (false);
        }

        if (document.getElementById('password').value == "") {
            alert('<%=rbConstants.getString("PASSWORD_SHOULD_NOT_BE_BLANK") %>');
            document.getElementById('password').focus();
            return false;
        }
        if (document.getElementById('firstName').value == "") {
            alert('<%=rbConstants.getString("FULL_NAME_SHOULD_NOT_BE_BLANK")%>');
            document.getElementById('firstName').focus();
            return false;
        }
        if (document.getElementById('emailAddress').value == "") {
            alert('<%=rbConstants.getString("EMAIL_SHOULD_NOT_BE_BLANK")%>');
            document.getElementById('emailAddress').focus();
            return false;
        }
        if (!echeck(document.getElementById('emailAddress').value)) {
            document.getElementById('emailAddress').focus();
            return false;
        }
        if (document.getElementById('mobileNo').value != "") {
            if (isNaN(document.getElementById('mobileNo').value) || document.getElementById('mobileNo').value.length != 10) {
                alert('<%=rbConstants.getString("PLEASE_ENTER_CORRECT_MOBILE_NO")%>');
                document.getElementById('mobileNo').focus();
                return false;
            }
        }
        return true;
    }
    function echeck(str) {
        var at = "@"
        var dot = "."
        var lat = str.indexOf(at)
        var lstr = str.length
        var ldot = str.indexOf(dot)

        if (str.indexOf(at) == -1) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS_FOR_REGISTRATION_INFORMATION") %>');
            return (false);
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS_FOR_REGISTRATION_INFORMATION") %>');
            return (false);
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS_FOR_REGISTRATION_INFORMATION") %>');
            return (false);
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS_FOR_REGISTRATION_INFORMATION") %>');
            return (false);
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS_FOR_REGISTRATION_INFORMATION") %>');
            return (false);
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS_FOR_REGISTRATION_INFORMATION") %>');
            return (false);
        }

        if (str.indexOf(" ") != -1) {
            alert('<%=rBSignup.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS_FOR_REGISTRATION_INFORMATION") %>');
            return (false);
        }

        return true
    }
    // Sign Up Form Validation Ending here.

    function resetform() {
        document.forms.reset();
    }

    function chkIdExistence() {
    	//alert("hii");
        if (document.getElementById("userId").value.length > 0) {
            var valuechk = "";
            valuechk = (function() {
                var val = null;
                value = document.getElementById("userId").value;
                $.ajax(
            {
                'type': 'POST',
                'async': false,
                'global': false,
                'url': 'control/ajax_check_userid.jsp?value=' + value,
                'data': value,
                'success': function(data) {
                    val = data;
                }
            });
        
                return val;
            })();
            //alert("neha"+valuechk);
            if (valuechk == "") {
                document.getElementById("spndiv").innerHTML = "<img src='/img/loader.gif'>";
            }
            else if (valuechk == 1) {
                //alert(valuechk);
                document.getElementById("spndiv").style.color = "#008000";
                document.getElementById("spndiv").style.fontWeight = "bold";
                document.getElementById("spndiv").style.fontSize = '12'
                document.getElementById("spndiv").innerHTML = '<%=rBSignup.getString("USER_ID_AVAILABLE") %>';
            }
            else {
                document.getElementById("spndiv").style.color = "#CC0000";
                document.getElementById("spndiv").style.fontWeight = "bold";
                document.getElementById("spndiv").style.fontSize = '12'
                document.getElementById("spndiv").innerHTML = '<%=rBSignup.getString("USER_ID_NOT_AVAILABLE") %>';
            }

            document.getElementById("spndiv").style.display = 'block';
        }
        if (document.getElementById("userId").value.length > 7)
            document.getElementById("spndiv").style.display = 'block';
        else
            document.getElementById("spndiv").style.display = 'none';
    }
</script>
<%
//Util utl = new Util();
String msgtext="";
String getSubmit =  request.getParameter("submit");
String headerMsg="";
String fmail  = ConstantValues.MAILFROM;
String footerMsg = "<br/><br/><div style='line-height:15px;font-size:11px;font-family:Arial;color:rgb(119,119,119);padding:0px 0px 10px'>This message was sent to&nbsp;"+fmail+"<br>Ojas Softech Pvt. Ltd., Attention: A-139, Sector 63, Noida (UP) INDIA</div><div style='font-family:arial,sans-serif;font-size:13px' align='center'><b><a href='https://play.google.com/store/apps/details?id=com.ojassoft.astrosage&referrer=utm_source=astrosageemail&utm_medium=email&utm_content=footer&utm_campaign=mobileapp' target='_blank'>Love us? Download AstroSage Kundli Software Mobile App.</a></b></div></div><div style='font-family:arial,sans-serif;font-size:13px' align='center'><br></div><div style='font-family:arial,sans-serif' align='center'><font size='1'><a href='http://www.astrosage.com/about-us.asp' target='_blank'>About Us</a> | <a href='http://www.astrosage.com/privacy-policy.asp' target='_blank'>Privacy Policy</a> | Unsubscribe | &copy; AstroSage.com</font></div>";

%>

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
<script>
  $( function() {
	  if(<%=request.getParameter("msgsignup") != null && !request.getParameter("msgsignup").equals("")%>)
		  {
    		$( "#popup" ).modal('open');
    		
    		
		  }
  } );
  </script>
 <style>
	html{display:table;margin:0 auto;}
</style>

</head>

 <body class="bg-body-signin pg-signin">
 <div id="popup" class="modal" style="display: none;">
 <div class="modal-content">
    <%=rBConstantFile.getString("EMAIL_NOT_RECEIVED") %>
    <div class="modal-footer" style="border-top:1px solid #ddd;">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat text-orange">OK</a>
         </div>
         </div>
</div>
 
<div class="overlay-color"></div>

<h5 class="center">
<% 
msgtext = String.valueOf(request.getAttribute("msgtext"));
if(!msgtext.equals(null) && !msgtext.equals("") && !msgtext.equals("null"))
{
out.println(msgtext);
} 
%>
</h5>
 
<% 
  
if(msgtext == ConstantValues.SIGNUP_FAILED){
%>

<%=rBSignup.getString("YOU_ARE_UNABLE_TO_SIGN_UP")  %>

<%
}
if(msgtext == ConstantValues.EMAIL_ALREADY_EXIST){
%>

 <%=rBSignup.getString("EMAIL_ID_ALREADY_EXIST") %>


<%
}
if(msgtext == ConstantValues.INVALID_EMAIL_ID){
%>


<%
}
if(msgtext == ConstantValues.INVALID_MOBILE){
%>

<%=rbConstants.getString("INVALID_MOBILE_NO")%>

<%
}
if(msgtext == ConstantValues.ALL_FIELD_VALUES_ARE_REQUIRED){
%>

 <%=rbConstants.getString("ALL_FIELD_VALUES_REQUIRED") %>

<%
}
if(msgtext == ConstantValues.USER_ID_INVALID_LENGTH){
%>

 <%=rBSignup.getString("USER_ID_SHOULD_BE_8_OR_MORE_THAN_8_CHARACTERS") %>

<%
}
if(msgtext == ConstantValues.USERID_ALREADY_EXIST){
%>
 <%=rBSignup.getString("USER_ID_ALREADY_EXIST_CHOOSE_DIFFERENT") %>

<%
}
%>
	
	  <div id="login-page" class="row user-page">
         <div class="col s12">
         <div class="card-view bg-color">
         <form name="signup" id="signup" action="signupprocess.asp"	method="post" class="login-form">                      
                  <div class="input-field ht col s12 center">
                     <img src="images/gabesha.png" alt="" class="responsive-img profile-image-login">
                  </div>
               <div class="row margin">
                  <div class="input-field col s12">
                     <i class="material-icons prefix pt-5">&#xe7ff</i>
                     <input type="text" id="userId" name="userId" onblur="chkIdExistence();" onchange="chkIdExistence();" tabindex="4" maxlength="50" autocomplete="off" />
                     <label for="userId"><%=rbConstants.getString("USER_ID") %>*</label>
                     <div align="center" id="spndiv"></div>
                  </div>
               </div>
               <div class="row margin">
                  <div class="input-field col s12">
                     <i class="material-icons prefix pt-5">&#xe897</i>
                     <input id="password" name="password" type="password"  maxlength="50" />
                     <label for="password"><%=rbConstants.getString("PASSWORD")%>*</label>
                  </div>
               </div>
               <div class="row margin">
                  <div class="input-field col s12">
                     <i class="material-icons prefix pt-5">&#xe7fd</i>
                     <input id="firstName" name="firstName" type="text"  maxlength="50" autocomplete="off"/>
                     <label for="firstName"><%=rbConstants.getString("FULL_NAME")%>*</label>
                  </div>
               </div>
                <div class="row margin">
                  <div class="input-field col s12">
                     <i class="material-icons prefix pt-5">&#xe158</i>
                     <input id="emailAddress" name="emailAddress" type="email"  maxlength="70" autocomplete="off"/>
                     <label for="emailAddress"><%=rbConstants.getString("EMAIL")%>*</label>
                  </div>
               </div>
                <div class="row margin">
                  <div class="input-field col s12">
                     <i class="material-icons prefix pt-5">&#xe0b0</i>
                     <input id="mobileNo" name="mobileNo" type="tel"  maxlength="10" autocomplete="off"/>
                     <label for="mobileNo"><%=rbConstants.getString("MOBILE_NO")%>*</label>
                  </div>
               </div>
               
                <div class="row">
                  <div class="col s6">
                     <input class="with-gap" name="category" type="radio" id="astrologer" value="1" />
      				 <label for="astrologer">Astrologer</label>
                  </div>
                   <div class="col s6">
                     <input class="with-gap" name="category" type="radio" id="nAstrologer" value="4" checked />
      				 <label for="nAstrologer">Non Astrologer</label>
                  </div>
               </div>
                            
               
            
               <div class="row">
               <div class="col s6">
                     <input type="submit" value="<%=rbConstants.getString("SIGN_UP") %>" class="btn waves-effect amber darken-4 btn-block" onclick="return validateSignUpForm();"/>
                  </div>
                  <div class="col s6">
                     <input type="reset" name="reset" value="<%=rbConstants.getString("RESET") %>" class="btn waves-effect white black-text btn-block" onclick="resetform();"/>
                  </div>                 
               </div>
            </form>
            <div class="sp-box">
             Already have An Account <a href="signin.jsp"><%=rbConstants.getString("LOGIN") %></a>
            </div>
            
            <div class="form-group">
          <i class="pos or_txt"></i>
          </div>
            <div class="form-group">
            <div class="col s12 l12"> 
          <div class="center"> 
       <a href="<%=ConnectionService.URL_FB_AUTH%>" class="btn fb-bg btn-style"> 
			<img src="images/icons/fb.png"> Signup with Facebook
			</a>
		
			<a	href="<%=ConnectionService.URL_GOOGLE_AUTH%>"
			class="btn google-bg btn-style"> <img src="images/icons/gmail.png"> Signup with Google
			</a>
			
			</div>
			</div>
			</div>
			
            </div>
            
         </div>
      </div>	
      
</body>
</html>