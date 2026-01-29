<%@page import="com.ojassoft.astrosagecloud.model.ConnectionService"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

Hindi hindi = new Hindi();
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

String serverName = request.getServerName();
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBLogin = local.loadPropertiesFileNew("login",langCode);
session.setAttribute("DONT_GOTO_HOME", "1");
ConnectionService connService = new ConnectionService();

%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type"	content="text/html; charset=windows-1252" />
<title>Login</title>
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
   
    function validation() {
    		Materialize.Toast.removeAll();
    	if (document.getElementById('txtUserID').value == "") {
        	Materialize.toast('<%=rBLogin.getString("PLEASE_ENTER_USER_ID") %>',5000)
            document.getElementById('txtUserID').focus();
            return false;
        }
        if (document.getElementById('txtPassword').value == "") {
        	Materialize.toast('<%=rBLogin.getString("PLEASE_ENTER_PASSWORD") %>')
            document.getElementById('txtPassword').focus();
            return false;
        }
        return true;
    }
   
    
</script>
 <style>
	html{display:table;margin:0 auto;}
</style>

</head>

 <body class="bg-body-signin pg-signin">
<div class="overlay-color"></div>
 
 
<% String msg = request.getParameter("msg");  %>

	<% if(msg!="" || msg!=null){ %>	
		<div>
		<% if(msg== "0"){ %>
			<p><%=rBLogin.getString("YOU_ENTERED_THE_WRONG_USER_ID_OR_PASSWORD") %></p>
		<% } %>
		</div>
	
	<% } %>
	
	
	  <div id="login-page" class="row user-page">
         <div class="col l12">
         <div class="card-view bg-color">
            <form class="login-form" name="loginfrm" action="loginchk.jsp" method="post">            
                  <div class="input-field ht col s12 center">
                     <img src="images/gabesha.png" alt="" class="responsive-img profile-image-login">
                  </div>
               <div class="row margin">
                  <div class="input-field col s12">
                     <i class="material-icons prefix pt-5">&#xe7ff</i>
                     <input id="txtUserID" name="txtUserID" type="text">
                     <label for="txtUserID"><%=rbConstants.getString("USER_ID")%></label>
                  </div>
                  
               </div>
               <div class="row margin">
                  <div class="input-field col s12">
                     <i class="material-icons prefix pt-5">&#xe899</i>
                     <input id="txtPassword" name="txtPassword" type="password">
                     <label for="txtPassword"><%=rbConstants.getString("PASSWORD")%></label>
                  </div>
               </div>
               <div class="row">
                  <div class="col s12 m12 l12 ml-2 mt-3"> 
      					<input type="checkbox" class="filled-in" id="Staysignedin" name="Staysignedin" value="1"/>
      					<label for="Staysignedin"><%=rBLogin.getString("STAY_SIGN_IN") %></label>
                  </div>
                  <input type="hidden" value=<%=Util.safestr(request.getParameter("refferurl")) %>	name="refferurl" />
                  
               </div>
            
				<div class="row">
					<div class="col s12">
						<input type="submit" value="<%=rbConstants.getString("LOGIN") %>" class="btn waves-effect amber darken-4 btn-block" onclick="return validation();"/>
					</div>
					
					
                  	<div class="input-field col s6">        
						<p class="margin left-align medium-small"><a class="white-text text-darken-4" href="http://www.astrosage.com/forgetPassword.asp"><%=rBLogin.getString("FORGOT_PWD") %></a></p>            
                  	</div>
                  	<div class="input-field col s6">
						<p class="margin right-align medium-small"><a class="white-text text-darken-4" href="http://www.astrosage.com/forgetUserid.asp"><%=rBLogin.getString("FORGOT_USERNAME") %></a></p>
                  	</div>
               </div>
            </form>
            
            <div class="form-group">
          <i class="pos or_txt"></i>
          </div>
            <div class="form-group">
            <div class="col s12 l12"> 
          <div class="center"> 
       <a href="<%=ConnectionService.URL_FB_AUTH%>" class="btn fb-bg btn-style"> 
			<img src="images/icons/fb.png"> Login with Facebook
			</a>
		
			<a	href="<%=ConnectionService.URL_GOOGLE_AUTH%>"
			class="btn google-bg btn-style"> <img src="images/icons/gmail.png"> Login with Google
			</a>
			
			</div>
			</div>
			</div>
			
			 <div class="form-group">
            <div class="sp-box">
            <p> <%=rBLogin.getString("DONT_HAVE_A_USER_ID") %> <a href="signup.jsp"><%=rbConstants.getString("SIGN_UP") %></a> </p>
            </div>
            </div>
            </div>
            
         </div>
      </div>	
      
</body>
</html>