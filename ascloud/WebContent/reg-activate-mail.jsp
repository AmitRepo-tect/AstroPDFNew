<%@page import="com.ojassoft.astrosagecloud.util.I_SendMail"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_RandomNo"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String userid ="",ip="",regcode="";
String isShowMailFooter ="",isShowMAilHeader="",headerMsg="",footerMsg="";

I_RandomNo random = new I_RandomNo();
I_SendMail send = new I_SendMail();

if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")) {
userid = String.valueOf(session.getAttribute("User_Id"));
}else if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")) {
userid = String.valueOf(session.getAttribute("User_Id"));
}
UserDAO UD = new UserDAO();
HashMap<String, String> hm  = UD.getRecordOfUser(userid,null);

String emailId=hm.get("email");

if(hm.get("regcode").equals("") || hm.get("regcode") ==null){
	ip = request.getRemoteAddr();
    ip = ip.replace(".", "");
    regcode = ip + random.generateRandomNo();
    
    String sqlupdateregcode = UD.updateregcode(userid,regcode);
}
else
{
	 regcode = hm.get("regcode");
}
String subject = "Just one more step to get started on AstroSage";
String msg = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=http://www.astrosage.com/reg-activation.jsp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + ">http://www.astrosage.com/reg-activation.jsp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
send.sendMail(hm.get("email"),subject, msg,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");
%>
<div align="center">
<center>
        <table cellspacing="0" cellpadding="0" width="100%" border="0" style="border-collapse: collapse">
            <tbody>
                <tr>
                    <td width="100%" class="boxtopbg">
                        <div class="boxhdg">
                            ||&nbsp;&nbsp;<%="Mail Resent"%>&nbsp;&nbsp;||
                         </div>
                        <div id="headad" align="center" style=" padding-top:10px;"></div>
                    </td>
                </tr>
            </tbody>
        </table>
    </center>
</div>

<center>
    <table cellspacing="0" cellpadding="0" width="90%" border="1" bordercolor="#f96d06"
        style="border-collapse: collapse">
  <span style="font-size:14px;">
                    <%="Another email was sent to:"%> <b><%=hm.get("email")%></b>
                    <br /><br />
                    <%="Please click on the link in that email to confirm your email address. Be sure to  check your spam folder."%>
                </span><br /><br />
                <span style="font-size:14px;">
                         <%="Go"%> <a href="javascript:history.back()"  style="font-size:12px; font-weight:bold;"><%="Back"%></a><%="or"%> <a href="/" style="font-size:12px; font-weight:bold;"><%="Home Page"%></a>
                </span> 
                    </table>
</center>