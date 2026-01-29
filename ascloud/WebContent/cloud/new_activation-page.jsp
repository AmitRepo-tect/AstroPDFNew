<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_SendMail"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_RandomNo"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
Hindi hindi = new Hindi();
Local local = new Local();
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBActivationPage = local.loadPropertiesFileNew("activationpage",languageCode);

%>
<div class="hdg-lg card">
  <h1> <%=rbConstants.getString("ACTIVATION") %> </h1>
   </div>
   
   <div class="row mrt-20">
<div class="col s12">
<div class="card padding-all ui-paragraph-style">

<script type="text/javascript">
    function showemailbox() {
        if (document.getElementById('emailbox').style.display == 'none') {
            document.getElementById('emailbox').style.display = "block";
        }
        else {
            document.getElementById('emailbox').style.display = 'none';
        }
    }

    function isvalidemailid() {
        if (document.getElementById('newemail').value == "") {
            alert('<%=rBActivationPage.getString("PLEASE_ENTER_EMAIL_ADDRESS")%>');
            document.getElementById('newemail').focus();
            return false;
        }
        else {
            if (!echeck(document.getElementById('newemail').value)) {
                document.getElementById('newemail').focus();
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
            alert('<%=rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert('<%=rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert('<%=rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            alert('<%=rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert('<%=rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert('<%=rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(" ") != -1) {
            alert('<%=rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }
        return true
    }
    function sendemailtouser(subject, msg) {
        $.ajax({
            'async': true,
            'global': false,
            'url': '/freechart/ajax-sendemail.asp',
            'data': ({ subject: subject, msg: msg }),
            'success': function (data) {
            }
        });
    }
</script>
<%
out.println("<script type='text/javascript'>_gaq.push(['_trackEvent', 'goal', 'signup_success','inside_cloud']);</script>"); 
%>
<%

boolean isvalidemailid = true;
String ip="",regcode="",subjectforupdatestatus="",msg="";
I_RandomNo random = new I_RandomNo();

String currentemail = Util.safestr(request.getParameter("email")).trim();
String userid = Util.safestr(request.getParameter("userid")).trim();
String name = Util.safestr(request.getParameter("name")).trim();



 //*************Neha******************
 
 if(userid.equals("")) {
	 
    userid = Util.safestr(session.getAttribute("profile_userid"));
 }

if(currentemail.equals("")) {
    currentemail = Util.safestr(session.getAttribute("profile_email"));
}

 if(name.equals("")) {
    name = Util.safestr(session.getAttribute("profile_name"));
 }
 UserDAO UD = new UserDAO();
 String userId = Util.safestr(session.getAttribute("User_Id"));

 if(currentemail.equals("") && name.equals("") && !userId.equals("")){
	        HashMap<String, String> stremail = UD.getRecordOfUser(userId, null);
	        name = stremail.get("firstname");
	        currentemail = stremail.get("email");
	        String checkuserstatus = UD.updateStatusNull(userId);
	        if(checkuserstatus.equals("1")){
	         ip = request.getRemoteAddr();
             ip = ip.replace(".", "");
             regcode = ip + random.generateRandomNo();
             request.getSession().setAttribute("useremailid", currentemail);
	            if(UD.updateUserEmailId(currentemail, userId, regcode).equals(ConstantValues.EMAILIDUPDATIONSUCCESS)){
	                subjectforupdatestatus = "Just one more step to get started on AstroSage";
                    msg = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=https://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userId) + "&rgcode=" + regcode + ">https://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userId) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn\'t work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
	                out.println("<script type='text/javascript'>sendemailtouser('"+subjectforupdatestatus+"', '"+msg+"')</script>");
	                UD.updateUserOldUsersStatus(userId);
	            }
	        } 
	          
 }
 String emailid="",msgval="",subject="";
 String submitemailid = Util.safestr(request.getParameter("submitemailid"));
 if(submitemailid!=null && !submitemailid.equals("") ){
 emailid =Util.safestr(request.getParameter("newemail")).trim();
 userid = Util.safestr(request.getParameter("userid")).trim();
 currentemail = Util.safestr(request.getParameter("email")).trim();
 name = Util.safestr(request.getParameter("name")).trim();
 
if(emailid.equals("")){
     msg = rBActivationPage.getString("PLEASE_ENTER_EMAIL_ADDRESS");
     msgval = ConstantValues.BLANK_EMAIL_INVALID_ID;
}
 
 if(emailid.length()>90){
     msg = rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS");
     msgval = ConstantValues.BLANK_EMAIL_INVALID_ID;
 }
 
 if(userid.equals("")){
     msg = rbConstants.getString("YOUR_SESSION_HAS_BEEN_EXPIRED_PLEASE_LOGIN");
     msgval = ConstantValues.SESSION_EXPIRED;
 }
 
 if(SharedFunction.isvalidemail(emailid)==false){
     isvalidemailid = false;
     msg = rbConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS");
     msgval = ConstantValues.BLANK_EMAIL_INVALID_ID;
 }
 
 if(!emailid.equals("") && !userid.equals("") && isvalidemailid == true){

     String isShowMailFooter ="",isShowMAilHeader="",headerMsg="",footerMsg="";
     ip = request.getRemoteAddr();
     ip = ip.replace(".", "");
     regcode = ip + random.generateRandomNo();
     I_SendMail send = new I_SendMail();

     if(UD.isEmailIdExistForUpdate(userId,emailid).equals("false")){
         msg = rBActivationPage.getString("EMAIL_ADDRESS_ALREADY_ASSOCIATED_WITH_OTHER_ACCOUNT");
         msgval = ConstantValues.EMAIL_ALREADY_EXIST;
     }else{
         if(UD.updateUserEmailId(emailid, userId, regcode).equals(ConstantValues.EMAILIDUPDATEDSUCCESSFULLY)) {
             subject = "Activate your new email on AstroSage";
             msg = "Dear Sir/Madam, <br><br>You have updated your email id on your AstroSage.com profile. Please click on the link below to activate your account: <br><br><a href=https://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + ">https://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";                    
             send.sendMail(emailid,subject, msg,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");
             msg = rBActivationPage.getString("EMAIL_ID_HAS_BEEN_UPDATED_SUCCESSFULLY");
             msgval = ConstantValues.EMAILIDUPDATEDSUCCESSFULLY;
         }else{
             msg = rBActivationPage.getString("EMAIL_ID_UPDATION_FAILED");
             msgval = ConstantValues.EMAILIDUPDATIONFAIL;
         }
     }
 }
 }
 
 %>
<%if(msgval.equals(ConstantValues.EMAILIDUPDATIONSUCCESS)){ %>

	

	<div>
				<%=msg %>
			</div>
		

<% }
 %>
<%if(msgval.equals(ConstantValues.SESSION_EXPIRED)){ %>
	
			<div>
				<%=msg %>
			</div>
	
<% 
out.close();
return;
 }
 %>
<% if(msgval.equals(ConstantValues.EMAIL_ALREADY_EXIST) || msgval.equals(ConstantValues.BLANK_EMAIL_INVALID_ID)|| msgval.equals(ConstantValues.EMAILIDUPDATIONFAIL)){ %>

<% }%>

<%
 if(!msgval.equals(ConstantValues.EMAILIDUPDATIONSUCCESS)){%>
<%String  Activationmsg = "<b>"+name+", "+rBActivationPage.getString("NOT_YET_VERIFIED")+" "+rBActivationPage.getString("GO_TO")+currentemail+" "+rBActivationPage.getString("TO_COMPLETE_THE_SIGN_UP_PROCESS")+"</b>"; %>

	<form name="activationform" action="activation-page.asp" method="post">
		<div>
			
				<div id="divhead">
					<h5> <%=rbConstants.getString("ACTIVATION") %> </h5>
				</div>
			
		
				<p>	<img align="left" style="margin-right:5px;" src="images/email-icon.png"/>
			    <%=Activationmsg %> </p>
				
			<p>
				<%=rBActivationPage.getString("DONOT_RECEIVED_EMAIL")%>
				<a href="/cloud/reg-activate-mail.asp" class="text-orange">&nbsp;<%=rbConstants.getString("CLICK_HERE")%>&nbsp;</a>
				<%=rBActivationPage.getString("AUR")%>
				<a href="#pseudo" onclick="showemailbox()" class="text-orange"><%=rBActivationPage.getString("CHANGE_EMAIL_ADDRESS").toLowerCase()%></a>
			  </p>
			
			 <div id="emailbox">
				<span><%=rBActivationPage.getString("CURRENT_EMAIL") %>:</span>&nbsp;<%=currentemail %>
				<span><%=rBActivationPage.getString("NEW_EMAIL") %>:</span>&nbsp;
				<div class="row"> 
				<div class="input-field col l12"> 
				<input type="text" name="newemail" id="newemail" maxlength="60" " />
				<label for="newemail"> <%=rBActivationPage.getString("ENTER_NEW_EMAIL_ADDRESS") %> </label>
				</div>
				</div>
				<div class="row"> 
				<div class="input-field col l12">
				<div align="center">
			     <input type="submit" class="waves-effect waves-light btn amber darken-4 box-shadow" name="submitemailid" onclick="return isvalidemailid();" value="<%=rBActivationPage.getString("CHANGE_EMAIL") %>" />
				</div>
				</div>
				</div>
				<input type="hidden" name="userid" value="<%=session.getAttribute("UserId") %>" /> 
				<input type="hidden" name="email" value="<%=currentemail %>" /> 
				<input type="hidden" name="name" value="<%=name %>" />
			</div>
		</div>
	</form>

	</div>
		</div>
			</div>
<%}%>
