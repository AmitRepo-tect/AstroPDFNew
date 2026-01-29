<%@page import="com.ojassoft.astrosagecloud.util.I_SendMail"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_RandomNo"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String userid ="",ip="",regcode="";
String isShowMailFooter ="",isShowMAilHeader="",headerMsg="",footerMsg="";

I_RandomNo random = new I_RandomNo();
I_SendMail send = new I_SendMail();

if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")) {
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
String msg = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=//www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + ">//www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
send.sendMail(hm.get("email"),subject, msg,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");
%>

 <div class="hdg-lg card">
  <h1> <%="Mail Resent"%> </h1>
</div>

<div class="row mrt-20">
<div class="col s12">
<div class="card padding-all ui-paragraph-style">

	
		<p> <b> <%="Another email was sent to:"%></b>
			<b><%=hm.get("email")%></b> <br />
		<%="Please click on the link in that email to confirm your email address. Be sure to  check your spam folder."%>
		</p>
		<p> <%="Go"%> 
		<a href="javascript:history.back()" class="text-orange"><%="Back"%></a> <%="or"%>
		<a href="http://www.astrosage.com" class="text-orange"><%="Home Page"%></a>
		</p>
	

</div>
</div>
</div>