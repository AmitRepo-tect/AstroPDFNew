<%@page import="com.ojassoft.astrosagecloud.model.ConnectionService"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int languageCode = (Integer)session.getAttribute("languageCode");
Hindi hindi = new Hindi();
Local local = new Local();
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBSignup = local.loadPropertiesFileNew("signup",languageCode);
%>
<script>
  $( function() {
	  if(<%=request.getParameter("msgsignup") != null && !request.getParameter("msgsignup").equals("")%>)
		  {
    		$( "#popup" ).modal('open');
    		
    		
		  }
  } );
  </script>
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

/*if(getSubmit!="" && getSubmit!=null)
{
    msgtext = signUpUser(Util.safestr(request.getParameter("userId")),Util.safestr(request.getParameter("password")) ,Util.safestr(request.getParameter("firstName")),Util.safestr(request.getParameter("emailAddress")) ,Util.safestr(request.getParameter("mobileNo")), Util.safestr(request.getParameter("category")),"Web",request,headerMsg,footerMsg,application);
}
*/

%>
<div class="hdg-lg card">
	<h1><%=rBSignup.getString("SIGNUP") %></h1>	
</div>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1 ui-paragraph-head padding-all">
<% 
msgtext = String.valueOf(request.getAttribute("msgtext"));
if(!msgtext.equals(null) && !msgtext.equals("") && !msgtext.equals("null"))
{
out.println(msgtext);
}
 /*  if(!msgtext.equals("") && msgtext== ConstantValues.SIGNUP_SUCCESSFULLY){
   out.println("activation-page.jsp");
   request.getSession().setAttribute("profile_name",Util.safestr(request.getParameter("firstName")));
   request.getSession().setAttribute("profile_email",Util.safestr(request.getParameter("emailAddress")));
   request.getSession().setAttribute("profile_userid",Util.safestr(request.getParameter("userId")));
   out.println("activation-page.jsp");
   request.getRequestDispatcher("activation-page.jsp").forward(request, response);
   //response.sendRedirect("activation-page.jsp");
   //response.sendRedirect("signup.jsp");
   //response.sendRedirect("new_activation-page.jsp");
   }
 */
 
%>

<% 
  
if(msgtext == ConstantValues.SIGNUP_FAILED){
%>

<h5> <%=rBSignup.getString("YOU_ARE_UNABLE_TO_SIGN_UP")  %></h5>

<%
}
if(msgtext == ConstantValues.EMAIL_ALREADY_EXIST){
%>

<h5> <%=rBSignup.getString("EMAIL_ID_ALREADY_EXIST") %></h5>


<%
}
if(msgtext == ConstantValues.INVALID_EMAIL_ID){
%>


<%
}
if(msgtext == ConstantValues.INVALID_MOBILE){
%>

<h5> <%=rbConstants.getString("INVALID_MOBILE_NO")%></h5>

<%
}
if(msgtext == ConstantValues.ALL_FIELD_VALUES_ARE_REQUIRED){
%>

<h5> <%=rbConstants.getString("ALL_FIELD_VALUES_REQUIRED") %></h5>

<%
}
if(msgtext == ConstantValues.USER_ID_INVALID_LENGTH){
%>

<h5> <%=rBSignup.getString("USER_ID_SHOULD_BE_8_OR_MORE_THAN_8_CHARACTERS") %></h5>

<%
}
if(msgtext == ConstantValues.USERID_ALREADY_EXIST){
%>
<h5> <%=rBSignup.getString("USER_ID_ALREADY_EXIST_CHOOSE_DIFFERENT") %></h5>

<%
}
%>
<div id="popup" class="modal" style="display: none;">
 <div class="modal-content">
    <%=rbConstants.getString("EMAIL_NOT_RECEIVED") %>
    <div class="modal-footer" style="border-top:1px solid #ddd;">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat text-orange">OK</a>
         </div>
         </div>
</div>

<p style="text-align: left; padding-left: 40px;">
				<font color="red"><b> * <%=rbConstants.getString("ALLFORM_FIELDS_ARE_REQUIRED")%></b></font>
			</p>
			
			<form name="signup" id="signup" action="signupprocess.asp" method="post">
			<div class="row">
        <div class="input-field col s12 l12">
        <input type="text" class="inputtext" title="User ID" name="userId" id="userId" onfocus="" onblur="chkIdExistence();" onchange="chkIdExistence();" tabindex="4" autocomplete="off" maxlength="50" size="36" />
		<label for="userId"> <%=rbConstants.getString("USER_ID") %>*</label>
        
        </div>
        </div>
        
        <div class="row">
        <div class="input-field col s12 l12">
        <input type="password" class="inputtext" maxlength="50" title="Password"
							name="password" id="password" value="" tabindex="5" size="36" />
							<label for="password"> <%=rbConstants.getString("PASSWORD") %>*</label>
        </div>
        </div>
        
         <div class="row">
        <div class="input-field col s12 l12">
        <input type="text" class="inputtext" name="firstName" autocomplete="off"
							id="firstName" value="" title="Full Name" tabindex="5"
							maxlength="50" size="36" />
							
							<label for="firstName"> <%=rbConstants.getString("FULL_NAME")%>*</label>
        </div>
        </div>
        
        <div class="row">
        <div class="input-field col s12 l12">
        <input name="emailAddress" class="inputtext" id="emailAddress" autocomplete="off"
							value="" title="Email" tabindex="5" type="text" maxlength="70"
							size="36" />
							
							<label for="emailAddress"> <%=rbConstants.getString("EMAIL")%>*</label>
        </div>
        </div>
        
        <div class="row">
        <div class="input-field col s12 l12">
        <input name="mobileNo" class="inputtext" id="mobileNo" autocomplete="off"
							title="Mobile" tabindex="5" type="text" maxlength="10" size="36" />
							<label for="mobileNo"> <%=rbConstants.getString("MOBILE_NO")%></label>
        </div>
        </div>
        
        <div class="row">
        
                  <div class="col s12">
                  <span class="astrologer-field"> <%=rbConstants.getString("CATEGORY") %> </span> 
                    <span class="astrologer-input"> <input class="with-gap" name="category" type="radio" id="astrologer" value="1" />
      				 <label for="astrologer"><%=rbConstants.getString("ASTROLOGER") %></label>  </span>
      				 <input class="with-gap" name="category" type="radio" id="nAstrologer" value="4" checked />
      				 <label for="nAstrologer"><%=rbConstants.getString("GENERAL_USER") %></label>
                  </div>
                   
               </div>
        
     
        
        <div class="row">
        <div class="input-field col s12 l12">
        <div align="center">
		<input name="submit" type="submit" onclick="return validateSignUpForm();" value="<%=rbConstants.getString("SIGN_UP") %>" class="waves-effect waves-light btn amber darken-4 box-shadow">
		<input name="reset" type="reset" onclick="resetform();" value="<%=rbConstants.getString("RESET") %>" class="waves-effect waves-light btn amber darken-4 box-shadow">
		</div>
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

</div>
</div>
</div>














