<%@page import="com.ojassoft.astrosagecloud.util.I_SendMail"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_RandomNo"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div align="center">
<center>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" style="border-collapse: collapse">
            <tbody>
                <tr>
                    <td width="100%" class="boxtopbg">
                        <div class="boxhdg">
                            ||&nbsp;&nbsp;<%="Message"%>&nbsp;&nbsp;||
                         </div>
                        <div id="headad" align="center" style=" padding-top:10px;"></div>
                    </td>
                </tr>
            </tbody>
        </table>
    </center>
</div>
<%
   I_RandomNo random = new I_RandomNo();
   I_SendMail send = new I_SendMail();
    boolean isvalidemailid = true;
    String msg ="";
    String subject= "";
    String ip= "",regcode="";
    String isShowMailFooter ="",isShowMAilHeader="",headerMsg="",footerMsg="";
    
    String emailid =Util.safestr(request.getParameter("email")).trim();
    String userid = Util.safestr(request.getParameter("userid")).trim();
   
    if(emailid.equals("")){
        msg = "Please enter Email Id.";
    } 
    
    if(userid.equals("")) {
        msg = "Your session has been expired.";
    }
    
    if(!SharedFunction.isvalidemail(emailid)){
        isvalidemailid = false;
        msg = "Please enter valid email id.";
    }
    
    if(! emailid.equals("") && !userid.equals("") && isvalidemailid == true ){
        ip = request.getRemoteAddr();
        ip = ip.replace(".", "");
        regcode = ip + random.generateRandomNo();
        
        UserDAO UD =  new UserDAO();
        if(UD.isEmailIdExistForUpdate(userid,emailid).equals("false")){
            msg = "Email Id already exist with other account.";
        }
        else{
           if(UD.updateUserEmailId(emailid, userid, regcode).equals(ConstantValues.EMAILIDUPDATEDSUCCESSFULLY)){
                subject = "Just one more step to get started on AstroSage";
                msg = "Dear Sir/Madam, <br><br>You have updated your email id on your AstroSage.com profile. Please click on the link below to activate your account: <br><br><a href=http://www.astrosage.com/cloud/reg-activation.jsp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + ">http://www.astrosage.com/cloud/reg-activation.jsp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
                send.sendMail(emailid,subject, msg,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");
                msg = "Your Email Id has been updated successfully.";
        }else{
                msg = "Email Id updation failed.";
        }
    }
    }
%>

<center>
    <table cellspacing="0" cellpadding="0" width="90%" border="1" bordercolor="#f96d06"
        style="border-collapse: collapse">
         <span style="font-size:14px;"><%=msg%></span>
                         <br /><br />                        
                        <span style="font-size:14px;">
                         <%="Go"%> <a href="javascript:history.back()"  style="font-size:12px; font-weight:bold;"><%="Back"%></a> <%="or"%> <a href="/" style="font-size:12px; font-weight:bold;"><%="Home Page"%></a>
                        </span>     
    </table>
</center>