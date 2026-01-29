<%@page import="com.ojassoft.astrosagecloud.util.I_SendMail"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
I_SendMail send = new I_SendMail();
String isShowMailFooter ="",isShowMAilHeader="";
String headerMsg ="",footerMsg="";
if(!Util.safestr(request.getParameter("isuseridsessionexist")).equals("")) {
  String emailaddresses = Util.safestr(request.getParameter("emailadd"));
  String  sharedURL = Util.safestr(request.getParameter("sharedurl"));
  String  Name = Util.safestr(request.getParameter("sendername"));
  String  loginname = Util.safestr(request.getParameter("loginname"));
  String[]  emailaddressarr = emailaddresses.split(",");

    for(int i=0;i<=emailaddressarr.length-1;i++){
        String MailTo = emailaddressarr[i];
        
        String  Subject = loginname +" Shared "+Name+"'s Chart";
        
        String  body = "Hi,<br/><br/>"+loginname+" shared "+ Name +"'s chart (kundli or jathakam). You can access it by clicking on following link -<br/><br/>"+sharedURL+"<br/><br/>Thanks and Regards<br/>"+loginname+"<br/><br/><i>AstroSage.com makes it easy to create and share charts online. If you do not have your account on <u>AstroSage.com</u>, do it now. </i>";
        send.sendMail(MailTo,Subject, body,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");
        //SendMail MailTo, MailFrom, Subject, Body
    }
    out.println(ConstantValues.MAIL_SEND_SUCCESSFULLY);
    }else{
    out.println(ConstantValues.MAIL_SEND_FAILED);
    }
%>