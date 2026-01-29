<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%  String json="";
     I_SendMail send = new I_SendMail();
     if(Util.safestr(request.getParameter("feedname")).equals("") || Util.safestr(request.getParameter("feedemail")).equals("") || Util.safestr(request.getParameter("feedsuggestion")).equals("")){
        json="{success:0}";
        out.println(json);
     }else{ 
    	 String Useridsession = Util.safestr(request.getParameter("useridsession"));
    	 String Name = Util.safestr(request.getParameter("horoobjname"));
    	 String dob = Util.safestr(request.getParameter("horoobjdob"));
    	 String tob = Util.safestr(request.getParameter("horoobjtob"));
    	 String place = Util.safestr(request.getParameter("horoobjplace"));
    	 String longitudeval = Util.safestr(request.getParameter("horoobjlongitude"));
    	 String latitudeval = Util.safestr(request.getParameter("horoobjlatitude"));
    	 String timezoneval = Util.safestr(request.getParameter("horoobjtimezone"));
    	 String ayan = Util.safestr(request.getParameter("horoobjayanamsa"));
    	 String dstval = Util.safestr(request.getParameter("horoobjdst"));
    	 String birthdetails = "<b>Birth Details</b><br>"+ Useridsession +Name + dob + tob + place + longitudeval + latitudeval + timezoneval+ ayan + dstval;
    	 String  phoneno ="";  
    	 String isShowMailFooter ="",isShowMAilHeader="";
    	 String headerMsg ="",footerMsg="";
              
    	 String MailTo1 = "feedback@astrosage.com";        
        //MailReplyTo = "feedback@astrosage.com"       
        String MailReplyTo = Util.safestr(request.getParameter("feedemail"));
        //String MailFrom1 = "info@astrosage.com";
        String subject = "";
       if(request.getParameter("urlval").contains("cloud/worksheet")){
    	  subject = "Feedback from AstroSage.com (AstrosageWorksheetNew)";  
       }
    	  else{
    	  subject = "Feedback from AstroSage.com(AstrosageCloudNew)";
    	  }
       
        
        String Body = "<b>Name: </b>"+ Util.safestr(request.getParameter("feedname")) +"<BR><b>Email: </b>"+Util.safestr(request.getParameter("feedemail"))+"<BR> <b>Phone: </b>" + Util.safestr(request.getParameter("feedphone")) +"<BR><b> Message: </b>" + Util.safestr(request.getParameter("feedsuggestion"))+"<br><b>URL: </b>"+Util.safestr(request.getParameter("urlval")) + "<br>" + birthdetails + "<b>Language Code:</b> " + session.getAttribute("languageCode") + "<br><b>Browser Info: </b>" + request.getHeader("User-Agent");
        
        //SendMail MailTo1, MailFrom1, Subject, Body
       
        send.sendMail(MailTo1,subject, Body,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,MailReplyTo);
     
        if(Util.safestr(request.getParameter("feedphone")).equals("")){
        	phoneno = "0";
        }

        UserDAO UD = new UserDAO();
        String getName = Util.safestr(request.getParameter("feedname"));
        String getEmail = Util.safestr(request.getParameter("feedemail"));
        String getMsg = Util.safestr(request.getParameter("feedsuggestion"))+ ". URL: "+request.getParameter("urlval");
        String resultVal = UD.getfeedbackdata(getName,getEmail,phoneno,getMsg);
        json="{success:1}";
        out.println(json);  
     }
//*************************************************************************************'
 %>