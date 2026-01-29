
<%@page import="com.ojassoft.astrosagecloud.util.WebKeys"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
	UserDAO UD= new UserDAO();

String referrer ="",referrervalues="",open="",staySignedIn="";
String getReferrer = request.getParameter("referrer");
if(getReferrer!=null && !getReferrer.equals("")){
referrer = Util.safestr(request.getParameter("referrer"));
}

if(request.getParameter("referrervalues")!=null && !request.getParameter("referrervalues").equals("")){
referrervalues = Util.safestr(request.getParameter("referrervalues"));
}
String uidCookie= "",pwdCookie="";

if(request.getParameter("open")!=null){
open = Util.safestr(request.getParameter("open"));
}
//out.println(open);
if(!open.equals("")) {
   referrer=referrer+"&open="+open;
}

  String uid = Util.safestr(request.getParameter("txtLoginID"));
  String pwd=Util.safestr(request.getParameter("txtLoginPassword"));
  
  if(request.getParameter("Staysignedin")!=null){
   staySignedIn = request.getParameter("Staysignedin");
  }


HashMap<String, String> getRecord = UD.getRecordOfUserWithPassword(uid, pwd, null);

if(getRecord.get("result").equals("1")){
	
    if(referrer!=null && !referrer.equals("")) {
    	response.sendRedirect("/login.jsp?LoginInfo=fail&referrer="+referrer);
    }else{
    	response.sendRedirect("/login.jsp?LoginInfo=fail");
    }
}
    else if(getRecord.get("result").equals("2")){
    	request.getSession().setAttribute("User_Id",uid);
    
    	response.sendRedirect("/activation-problem.jsp");
    }else{        
    if(referrer!=null && !referrer.equals("")) {
    	//out.println(referrer);
    	request.getSession().setAttribute("UserExists","true");
		request.getSession().setAttribute("User_Id",uid);

		 Cookie[] cookieObj=null;               
	    	cookieObj = request.getCookies();
	   
	        for(int cookieCount=0;cookieCount<cookieObj.length;cookieCount++){
	            if(cookieObj[cookieCount].getName().compareToIgnoreCase("UserId")==ConstantValues.COOKIES_FOUND){
	          	  	uidCookie = cookieObj[cookieCount].getValue();
	          	  	//out.println(uidCookie+"cookiesuid");
	            }
	            if(cookieObj[cookieCount].getName().compareToIgnoreCase("password")==ConstantValues.COOKIES_FOUND){
	          	  	pwdCookie = cookieObj[cookieCount].getValue();
	          		//out.println(pwdCookie+"cookiespass");
	            }
	    	}	

	        if(uidCookie.equals(ConstantValues.BLANK_VALUE) && pwdCookie.equals(ConstantValues.BLANK_VALUE) && staySignedIn.equals("1")){
	    		Cookie userId = new Cookie(WebKeys.COOKIE_UID,uid);
	    		Cookie password = new Cookie(WebKeys.COOKIE_PWD,pwd);
	    		userId.setDomain(WebKeys.COOKIE_DOMAIN);
	    		userId.setMaxAge(365*24*60*60);    //setting cookies expiry for one year
	    		userId.setPath("/");
	    		password.setMaxAge(365*24*60*60);  //setting cookies expiry for one year
	    		password.setDomain(WebKeys.COOKIE_DOMAIN);
	    		password.setPath("/");
	    		response.addCookie(userId);
	    		response.addCookie(password);              	
	    	}
	        response.sendRedirect(referrer);
	       //out.println("1");
    } else{

      HashMap<String, String> isPerson = UD.isBirthDetailExist(uid);
       
       if(isPerson.get("isExist").equals("false")){

           request.getSession().setAttribute("UserExists","true");
		   request.getSession().setAttribute("User_Id",uid);   
         
            String isChart = UD.matchinguserid(uid,null);//UD.matchinguseridandchartid(uid,"",null);
            //System.out.println(isChart);
            if(isChart.equals("1")){     
            	response.sendRedirect("HoroScopeData.jsp?Msg=Create&uid="+SharedFunction.encryptstring(uid)+"&referrer="+referrer);
       } else{
    	   Cookie[] cookieObj=null;               
	    	cookieObj = request.getCookies();
	   
	        for(int cookieCount=0;cookieCount<cookieObj.length;cookieCount++){
	            if(cookieObj[cookieCount].getName().compareToIgnoreCase(WebKeys.COOKIE_UID)==ConstantValues.COOKIES_FOUND){
	          	  	uidCookie = cookieObj[cookieCount].getValue();
	          	  	//out.println(uidCookie+"cookiesuid");
	            }
	            if(cookieObj[cookieCount].getName().compareToIgnoreCase(WebKeys.COOKIE_PWD)==ConstantValues.COOKIES_FOUND){
	          	  	pwdCookie = cookieObj[cookieCount].getValue();
	          		//out.println(pwdCookie+"cookiespass");
	            }
	    	}	

	        if(uidCookie.equals(ConstantValues.BLANK_VALUE) && pwdCookie.equals(ConstantValues.BLANK_VALUE) && staySignedIn.equals("1")){
	    		Cookie userId = new Cookie(WebKeys.COOKIE_UID,uid);
	    		Cookie password = new Cookie(WebKeys.COOKIE_PWD,pwd);
	    		userId.setMaxAge(365*24*60*60);    //setting cookies expiry for one year
	    		userId.setPath("/");
	    		userId.setDomain(WebKeys.COOKIE_DOMAIN);
	    		password.setMaxAge(365*24*60*60);  //setting cookies expiry for one year
	    		password.setPath("/");
	    		password.setDomain(WebKeys.COOKIE_DOMAIN);
	    		response.addCookie(userId);
	    		response.addCookie(password);              	
	    	}
                if(!referrer.equals("")) {
                	//response.sendRedirect(referrer);
                	 out.println("2");
                }else if(getRecord.get("result").equals("2")){
                    
 		            response.sendRedirect("cloud/defaultchartlogin.asp?methodName=fromJSP&referrer=activation-page.asp");
                } else{
                   
                	response.sendRedirect("cloud/defaultchartlogin.asp?methodName=fromJSP");
                }
       }
       }else{
          
    	   Cookie[] cookieObj=null;               
	    	cookieObj = request.getCookies();
	   
	        for(int cookieCount=0;cookieCount<cookieObj.length;cookieCount++){
	            if(cookieObj[cookieCount].getName().compareToIgnoreCase(WebKeys.COOKIE_UID)==ConstantValues.COOKIES_FOUND){
	          	  	uidCookie = cookieObj[cookieCount].getValue();
	          	  	//out.println(uidCookie+"cookiesuid");
	            }
	            if(cookieObj[cookieCount].getName().compareToIgnoreCase(WebKeys.COOKIE_PWD)==ConstantValues.COOKIES_FOUND){
	          	  	pwdCookie = cookieObj[cookieCount].getValue();
	          		//out.println(pwdCookie+"cookiespass");
	            }
	    	}	
		  
	        if(uidCookie.equals(ConstantValues.BLANK_VALUE) && pwdCookie.equals(ConstantValues.BLANK_VALUE) && staySignedIn.equals("1")){
	    		Cookie userId = new Cookie(WebKeys.COOKIE_UID,uid);
	    		Cookie password = new Cookie(WebKeys.COOKIE_PWD,pwd);
	    		userId.setMaxAge(365*24*60*60);    //setting cookies expiry for one year
	    		userId.setPath("/");
	    		userId.setDomain(WebKeys.COOKIE_DOMAIN);
	    		password.setMaxAge(365*24*60*60);  //setting cookies expiry for one year
	    		password.setPath("/");
	    		password.setDomain(WebKeys.COOKIE_DOMAIN);
	    		response.addCookie(userId);
	    		response.addCookie(password);              	
	    	}
	        request.getSession().setAttribute("UserExists","true");
	   request.getSession().setAttribute("User_Id",uid);   

	  if(!referrer.equals("")){
		 // response.sendRedirect(referrer);
		  out.println("3");
	  }else if(getRecord.get("result").equals("2")){
                
		  response.sendRedirect("cloud/defaultchartlogin.asp?methodName=fromJSP&referrer=activation-page.asp");
	  } else{
		            
		  response.sendRedirect("cloud/defaultchartlogin.asp?methodName=fromJSP");
	  }
       }
    }}
%>