<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script type="text/javascript">
        function showemailbox() {
            if (document.getElementById('emailbox').style.display == 'none') {
                document.getElementById('emailbox').style.display = "block";
            }
            else {
                document.getElementById('emailbox').style.display = 'none';
            }
        }
        function isvaliemailid() {
            if (document.getElementById('email').value == "") {
                alert("Please enter email address.");
                document.getElementById('email').focus();
                return false;
            }
            else {
                //if (!echeck(document.getElementById('email').value))
                if (!Emailvalid(document.getElementById('email').value))
                 {
                    document.getElementById('email').focus();
                    return false;
                }
            }
            return true;
        }


        function Emailvalid(emailInputBox) {
            var emailStr =emailInputBox;
            var emailRegexStr = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            var isvalid = emailRegexStr.test(emailStr);

            if (!isvalid) {
                alert('Please enter valid email address.');
                return false;
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
                alert('Please enter valid email address.');
                return (false);
            }

            if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
                alert('Please enter valid email address.');
                return (false);
            }

            if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
                alert('Please enter valid email address.');
                return (false);
            }

            if (str.indexOf(at, (lat + 1)) != -1) {
                alert('Please enter valid email address.');
                return (false);
            }

            if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                alert('Please enter valid email address.');
                return (false);
            }

            if (str.indexOf(dot, (lat + 2)) == -1) {
                alert('Please enter valid email address.');
                return (false);
            }

            if (str.indexOf(" ") != -1) {
                alert('Please enter valid email address.');
                return (false);
            }
            return true
        }
        function sendemailtouser(subject, msg) {
            $.ajax({
                'async': true,
                'global': false,
                'url': 'ajax-sendemail.jsp',
                'data': ({ subject: subject , msg:msg}),
                'success': function (data) {                    
                }
            });
        }
    </script>
    <div class="hdg-lg card">
  <h1> <%="Activation"%> </h1>

   </div>


<div class="row mrt-20">
<div class="col s12">
<div class="card padding-all ui-paragraph-style">
<form name="emailactivationform" method="post" action="updateemailid.asp">
	<%
	String actUser = Util.safestr(session.getAttribute("User_Id"));
       UserDAO UD =  new UserDAO();
       if(!actUser.equals("")){
    	   HashMap<String, String> getRecord =  UD.getRecordOfUser(actUser,null);
    	  // out.println(getRecord.get("result"));
    	   /*sqlcheckuserstatus = "Select Top 1 1 From updatestatusnull Where userid = '"& session("User_Id") &"' And iscurrentlyverified <> 1" 
    	            rsgetuserupdatestatus.open sqlcheckuserstatus, ConnObjInc, 3, 3
    	            If Not rsgetuserupdatestatus.EOF Then
    	                If Request.ServerVariables("HTTP_X_FORWARDED_FOR") <> "" Then
    	                    ip = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
    	                Else
    	                    ip = Request.ServerVariables("REMOTE_ADDR")
    	                End If
    	                                    
    	                ip = Replace(ip, ".", "")

    	                regcode = ip & GenerateRandomNo
    	                session("useremailid") = rsgetuserdetails("email")
    	                If UpdateUserEmailId(rsgetuserdetails("email"), session("User_Id"), regcode) = EMAILADDUPDATIONSUCCESS Then
    	                    subject = "Just one more step to get started on AstroSage"
    	                    msgval = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=http://www.astrosage.com/freechart/reg-activation.asp?userid=" & encryptstring(session("User_Id")) & "&rgcode=" & regcode & ">http://www.astrosage.com/freechart/reg-activation.asp?userid=" & encryptstring(session("User_Id")) & "&rgcode=" & regcode & "</a><br><br><b>Note:</b> If above link doesn\'t work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team"
    	                    Response.Write "<script type='text/javascript'>sendemailtouser('"&subject&"', '"&msgval&"')</script>"                    
    	                    UpdateUserOldUsersStatus(session("User_Id"))                
    	                End If
    	            End If
    	       */
    	       if(getRecord.get("result").equals("2")){
    	    	   
    	      %>
	<p>
		<i class="material-icons left"> email </i>  <%=getRecord.get("firstname") %><%=", your email id is not yet verified. Please go to "%><%=getRecord.get("email") %> <%="to complete the sign-up process."%>
	</p>
	<div>
		<%="Didn't receive activation email on your email Id?"%>
		<a href="reg-activate-mail.asp" class="text-orange"> <%="Click here"%></a>
		<%="to resend email"%> <b> <%="OR"%>
		<a href="javascript:void(0)" class="text-orange" onclick="showemailbox()"><%="Change email address"%></a>
	</div>

	<div style="display: none;" class="mrt-20" id="emailbox">
	<div class="row">
	<div class="col s12 l12">
	<span> <%="Current Email:"%></span>
	<%=getRecord.get("email")%>
	</div>
	</div>
	<div class="row">
	<div class="input-field col s12 l12">
	<input type="text" name="email" id="email" maxlength="60" /> <input type="hidden" name="userid" value="<%=actUser %>" />
	<label for="email"><%="New Email:"%></label>
	</div>
	</div>
	
	<div class="row">
	<div class="input-feild col s12 l12">
	<div align="center">
			 <input type="submit" class="waves-effect waves-light btn amber darken-4 box-shadow" name="submitemailid" onclick="return isvaliemailid();" value="Change Email" />
			</div>
	</div>
	</div>
		<fieldset>
			
			
			 
			
			
		</fieldset>
	</div>
	<%
    	       }else{
           %>
	<div>
		<%="No records found"%></div>
	<%
    	       }
           %>
	<%
       }else{
           %>
	<p>
		<%="Your session has been expired, Kindly login again in right panel."%></p>
	<p>
		<%="Or"%>
		<a href="/signin.asp"><%="click here"%></a><%="to open login page."%></p>
	<%
       }
           %>
</form>
</div>
</div>
</div>


