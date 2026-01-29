<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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
<div align="center">
<center>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" style="border-collapse: collapse">
            <tbody>
                <tr>
                    <td width="100%" class="boxtopbg">
                        <div class="boxhdg">
                            ||&nbsp;&nbsp;<%="Activation"%>&nbsp;&nbsp;||
                         </div>
                        <div id="headad" align="center" style=" padding-top:10px;"></div>
                    </td>
                </tr>
            </tbody>
        </table>
    </center>
</div>

 
     <form name="emailactivationform" method="post" action="updateemailid.jsp">
       <%
       UserDAO UD =  new UserDAO();
       if(!session.getAttribute("User_Id").equals("")){
    	   HashMap<String, String> getRecord =  UD.getRecordOfUser(String.valueOf(session.getAttribute("User_Id")),null);
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
               <img align="left" src="images/email-icon.png" style="vertical-align: middle; padding-right: 5px;" />
               <b><%=getRecord.get("firstname") %><%=", your email id is not yet verified. Please go to "%><%=getRecord.get("email") %> <%="to complete the sign-up process."%>"</b>                             
           </p>
             <div  class="ui-button-global" style=" font-size:12px;">
                  <%="Didn't receive activation email on your email Id?"%><a href="/reg-activate-mail.jsp" style=" font-weight:bold;font-size:14px;"><%="Click here"%></a><%="to resend email"%><b><%="OR"%>
                  <a href="javascript:void(0)" style="color:#990000; font-size:12px;box-shadow:0px 0px 0px #000; font-weight:bold;font-size:14px;" onclick="showemailbox()"><%="Change email address"%></a>
             </div>                      
        
           <div style=" display:none; margin:10px;" id="emailbox">
           <fieldset>
           <label style=" margin-top:0px;"><%="Current Email:"%></label><%=getRecord.get("email")%>
           <div class="ui-clear"></div>
           <label><%="New Email:"%></label>
           <input type="text" placeholder="Enter a new email address" name="email" id="email" maxlength="60"/>
           <input type="hidden" name="userid" value="<%=session.getAttribute("User_Id") %>" />
           <div class="ui-clear"></div>
           <div align="right" style=" padding-right:123px;"><input type="submit" class="mybutton" name="submitemailid" onclick="return isvaliemailid();" value="Change Email" /></div>
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
               <%="Or"%> <a href="/login.jsp"><%="click here"%></a><%="to open login page."%></p>
           <%
       }
           %>
    </form>
    </table>
    </center>

    