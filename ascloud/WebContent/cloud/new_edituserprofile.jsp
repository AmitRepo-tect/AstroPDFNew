<%@page import="com.ojassoft.astrosagecloud.util.I_SendMail"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_RandomNo"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
<%

Local local = new Local();

int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");

MyResourceBundle rBEditUserProfile = local.loadPropertiesFileNew("edituserprofile",languageCode);
%>

<script type="text/javascript">
    
    function validateEditProfileForm() {
    	
    	if (document.getElementById('passwordEdit').value == "") {
            alert('<%=rBConstants.getString("PASSWORD_SHOULD_NOT_BE_BLANK") %>');
            document.getElementById('passwordEdit').focus();
            return false;
        }
    	if (document.getElementById('firstName').value == "") {
            alert('<%=rBConstants.getString("FULL_NAME_SHOULD_NOT_BE_BLANK")%>');
            document.getElementById('firstName').focus();
            return false;
        }
        if (document.getElementById('emailAddress').value == "") {
            alert('<%=rBConstants.getString("EMAIL_SHOULD_NOT_BE_BLANK")%>');
            document.getElementById('emailAddress').focus();
            return false;
        }
        if (!echeck(document.getElementById('emailAddress').value)) {
            document.getElementById('emailAddress').focus();
            return false;
        }
        if (document.getElementById('mobileNo').value != "") {
            if (isNaN(document.getElementById('mobileNo').value) || document.getElementById('mobileNo').value.length != 10) {
                alert('<%=rBConstants.getString("PLEASE_ENTER_CORRECT_MOBILE_NO")%>');
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
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(at, (lat + 1)) != -1) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(dot, (lat + 2)) == -1) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }

        if (str.indexOf(" ") != -1) {
            alert('<%=rBConstants.getString("PLEASE_ENTER_VALID_EMAIL_ADDRESS") %>');
            return (false);
        }
        return true
    }
</script>
<%
String[] userprofile =  new String[8];
String[] userCloudPlanDetails =  new String[3]; //This array var is used to store the value of cloud plan details of platinum plan
String msgtext = "";
String msgval = "";
int usercategory = 0;
int getPlanId=1; // Set the this variable as basic plan

if(request.getAttribute("msgtextRs")!=null && !request.getAttribute("msgtextRs").equals("")) {
     msgval = request.getAttribute("msgtextRs").toString();//updateuserprofile(safestr(request("userId")),safestr(request("password")) ,safestr(request("firstName")),safestr(request("emailAddress")) ,safestr(request("mobileNo")), safestr(request("category")))
    //msgval = ConstantValues.UPDATION_SUCCESSFULL_SEND_EMAIL;
    if(msgval.equals(ConstantValues.UPDATED_SUCCESSFULLY)){
        msgtext = rBEditUserProfile.getString("YOUR_PROFILE_UPDATED_SUCCESSFULLY");
    }else{
        msgtext = rBEditUserProfile.getString("YOUR_PROFILE_NOT_UPDATED_PLEASE_TRY_AGAIN");
    }
}

boolean isuserloggedin;
if(String.valueOf(session.getAttribute("UserExists")).equals("true")){
    isuserloggedin = true; 
}else{
    isuserloggedin = false;
}
UserDAO UD = new UserDAO();
if(isuserloggedin){
 if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")){
	 HashMap<String, String> retdata = UD.getRecordOfUser(String.valueOf(session.getAttribute("User_Id")),null);//getuserprofile();
	 getPlanId = Integer.parseInt(UD.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
	 // This If condition is used to get the details of platinum plan user details
	 if (Util.isDhruvPlan(getPlanId)){
		HashMap<String,String> cloudPlanDetails = UD.getCloudPlanDetails(String.valueOf(session.getAttribute("User_Id")),null);
		if(cloudPlanDetails.get("companyName")!=null){
		userCloudPlanDetails[0] = cloudPlanDetails.get("companyName");
		}
		if(cloudPlanDetails.get("addressLine1")!=null){
	    userCloudPlanDetails[1] = cloudPlanDetails.get("addressLine1");
		}
		if(cloudPlanDetails.get("addressLine2")!=null){
	    userCloudPlanDetails[2] = cloudPlanDetails.get("addressLine2");
		}
	 }
     //userprofile = retdata.split("|");// split(retdata,"|");
     //out.println(retdata.get("password"));
     
    userprofile[0] = String.valueOf(session.getAttribute("User_Id"));
    userprofile[1] = retdata.get("password");
    userprofile[2] = retdata.get("firstname");
    userprofile[3] = retdata.get("mobile");
    userprofile[4] = retdata.get("email");
    userprofile[5] = retdata.get("category");
    //This two new added field to edit the user profile
    userprofile[6] = retdata.get("maritalstatus");
    userprofile[7] = retdata.get("occupation");
    
    if(userprofile[5]== null || userprofile[5].equals("")){//isnull(userprofile(5)) Then
        usercategory = 4;
    }else{
        usercategory = Integer.parseInt(userprofile[5]);
    }
 }else{
	    msgval = ConstantValues.SESSION_TIME_OUT;
	    msgtext = rBConstants.getString("YOUR_SESSION_HAS_BEEN_EXPIRED_PLEASE_LOGIN");
	} 
}else{
    msgval = ConstantValues.SESSION_TIME_OUT;
    msgtext = rBConstants.getString("YOUR_SESSION_HAS_BEEN_EXPIRED_PLEASE_LOGIN");
}
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("EDIT_PROFILE") %></h1>	
</div>

<div class="row mrt-30"> 
<div class="col s12 l12"> 
<div class="card padding-all"> 

<% if(msgval.equals(ConstantValues.UPDATED_SUCCESSFULLY) || msgval.equals(ConstantValues.SESSION_TIME_OUT)){ %>
<p><%=msgtext %></p>
			
<% 
}
if(msgval.equals(ConstantValues.UPDATION_UNSUCCESSFULL)){
%>

<Font color="red" size="4"><%=msgtext %></Font>

<%
}
if(msgval.equals(ConstantValues.ALL_FIELD_VALUES_ARE_REQUIRED)) {
%>

<Font color="red" size="4"><%=rBConstants.getString("ALL_FIELD_VALUES_REQUIRED") %></Font>

<%
}
if(msgval.equals(ConstantValues.INVALID_MOBILE)){
%>
<Font color="red" size="4"><%=rBConstants.getString("INVALID_MOBILE_NO")%></Font>

<%
}
if(msgval.equals(ConstantValues.INVALID_EMAIL_ID_FOR_UPDATION)){
%>
<Font color="red" size="4"><%=rBConstants.getString("INVALID_EMAIL_ID_TEXT") %></Font>
<%
}
if(msgval.equals(ConstantValues.EMAIL_ALREADY_EXIST)){
%>

<Font color="red" size="4"><%=rBEditUserProfile.getString("EMAIL_ID_ALREADY_EXIST_CHOOSE_DIFFERENT") %></Font>

<%
}
%>
<%if(!msgval.equals(ConstantValues.UPDATED_SUCCESSFULLY)){
/* 
This is used to fill in password field to show all user and check to update on server side
IF user change the password other than encryptedPassword then password is updated Else there is no password updated 
 */
 String encryptedPass="encryptedPassword";
%>

<p>
			<font color="red"><b> * <%=rBConstants.getString("ALLFORM_FIELDS_ARE_REQUIRED")%></b></font>
		</p>
		
		<form name="editprofile" id="editprofile" class="detail-box pg-checkout mrt-10" action="edituserprofileprocess.asp" method="post">
		<div class="row"> 
			<div class="col s12 l6"> 
			<label for="userId"> <%=rBConstants.getString("USER_ID") %>* </label>
			<input type="text" class="inputtext" value="<%=userprofile[0] %>" title="User ID" name="userId" id="userId" tabindex="1" autocomplete="off" size="40" maxlength="50" readonly />
		 	</div>
			<div class="col s12 l6"> 
						<label for="password"> <%=rBConstants.getString("PASSWORD") %>* </label>
		                  <input type="password" class="inputtext"
						value="<%=encryptedPass %>" maxlength="50"
						title="Password" name="password" id="passwordEdit" tabindex="2" />
						
						</div>
						
		</div>
		<div class="row"> 
		<div class="col s12 l6"> 
		<label for="firstName"> <%=rBConstants.getString("FULL_NAME") %>* </label>
		<input type="text" value="<%=userprofile[2] %>" name="firstName" autocomplete="off"
						id="firstName" value="" title="Full Name" tabindex="3"
						maxlength="50" />
						
		</div>
		<div class="col s12 l6"> 
		<label for="emailAddress"> <%=rBConstants.getString("EMAIL") %>* </label>
		<input name="emailAddress" value="<%=userprofile[4] %>" id="emailAddress"
						autocomplete="off" value="" title="Email" tabindex="4" type="text"
						maxlength="70" />
						
		</div>
		</div>
		
		<div class="row"> 
		<div class="col s12 l12"> 
		<label for="mobileNo"> <%=rBConstants.getString("MOBILE_NO") %></label>
		<input name="mobileNo" value="<%=userprofile[3] %>" id="mobileNo"
						autocomplete="off" title="Mobile" tabindex="5" type="text"
						maxlength="10" />
						
		</div>
	
		
		</div>
		<div class="row">
			<div class="col s6">
			<label><%=rBConstants.getString("MARITAL_STATUS") %></label>
		    	<select name="maritalStatus" id="maritalStatus" tabindex="6" class="browser-default">                            
				    <option value="0" <% if (userprofile[6].equals("0")){%>selected<%}%>><%=rBConstants.getString("NOT_SPECIFIED") %></option>
				    <option value="1" <% if (userprofile[6].equals("1")){%>selected<%}%>><%=rBConstants.getString("SINGLE") %> </option>
				    <option value="2" <% if (userprofile[6].equals("2")){%>selected<%}%>><%=rBConstants.getString("MARRIED") %> </option>
				    <option value="3" <% if (userprofile[6].equals("3")){%>selected<%}%>><%=rBConstants.getString("DIVORCED") %> </option>
		    	</select>
		    	
			</div>
			<div class="col s6">
			<label for="occupation"><%=rBConstants.getString("OCCUPATION") %></label>
			    <select name="occupation" id="occupation" tabindex="7" class="browser-default">                            
				    <option value="0" <% if (userprofile[7].equals("0")){%>selected<%}%>><%=rBConstants.getString("NOT_SPECIFIED") %></option>
				    <option value="1" <% if (userprofile[7].equals("1")){%>selected<%}%>><%=rBConstants.getString("STUDENT") %></option>
				    <option value="2" <% if (userprofile[7].equals("2")){%>selected<%}%>><%=rBConstants.getString("BUSINESSPERSON") %></option>
				    <option value="3" <% if (userprofile[7].equals("3")){%>selected<%}%>><%=rBConstants.getString("EMPLOYEE") %></option>
				    <option value="4" <% if (userprofile[7].equals("4")){%>selected<%}%>><%=rBConstants.getString("RETIRED") %></option>
				    <option value="5" <% if (userprofile[7].equals("5")){%>selected<%}%>><%=rBConstants.getString("HOUSEWIFE") %></option>
			    </select>
			    
			</div>
		</div>
		<%//This input field is show only for the platinum plan user %>
		<%if (Util.isDhruvPlan(getPlanId)){%>
		<div style="display: none">
		<div class="show-line"> 
		  <strong> 	<%=rBConstants.getString("PDF_FOOTER_DETAILS")+" ("+rBConstants.getString("DHRUV_TEXT")+")" %>  </strong></div>    
		
		<div class="row"> 
			<div class="col s12 l12"> 
			<label for="mobileNo"><%=rBConstants.getString("HEADING") %></label>
			<input name="heading" value="<%=userCloudPlanDetails[0] %>" id="heading"
							autocomplete="off" title="Heading" tabindex="8" type="text"
							maxlength="50" placeholder="<%=rBConstants.getString("HEADING_CUSTOM") %>"/>
							
			</div>
		</div>
		<div class="row"> 
			<div class="col s12 l12"> 
			<label for="address1"><%=rBConstants.getString("ADDRESS1") %></label>
			<input name="line1" value="<%=userCloudPlanDetails[1] %>" id="line1"
							autocomplete="off" title="Line1" tabindex="9" type="text"
							maxlength="80" placeholder="<%=rBConstants.getString("LINE1") %>"/>
							
			</div>
		</div>
		<div class="row"> 
			<div class="col s12 l12"> 
			<label for="address2"><%=rBConstants.getString("ADDRESS2") %></label>
			<input name="line2" value="<%=userCloudPlanDetails[2] %>" id="line2"
							autocomplete="off" title="Line2" tabindex="10" type="text"
							maxlength="80" placeholder="<%=rBConstants.getString("LINE2") %>"/>
							
			</div>
		</div>
	<%} %> 
		<div class="row"> 
		<div class="col s4"> 
			<%=rBConstants.getString("CATEGORY") %>
		</div>
		<div class="col s8"> 		
			<input class="with-gap" type="radio" value="1" id="astrologer" name="category"<%if(usercategory == 1 ) {%> checked <% } %> />
			<label for="astrologer"><%=rBConstants.getString("ASTROLOGER")%> </label>
			
			<input class="with-gap" type="radio" value="4" id="nAstrologer" name="category" <%if(usercategory == 4) {%> checked <%}%> />
        	<label for="nAstrologer"><%=rBConstants.getString("GENERAL_USER")%></label>
		</div>
		</div>
		</div>
		<input type="hidden" name="planIdValue" id="planIdValue" value="<%=getPlanId%>"> 
		<input type="hidden" name="source" id="source" value="edituserprofile.asp"> 
		<div class="row center"> 
		<div class="input-field col s12 l12"> 
		<button value="editUserProfile" name="methodName" type="submit" onclick="return validateEditProfileForm();"
								
								class="waves-effect waves-light btn amber darken-4 box-shadow"><%=rBEditUserProfile.getString("UPDATE") %>
								
								</button>
								</div>
								</div>
		
		</form>
</div>
</div>
</div>
<%}%>


