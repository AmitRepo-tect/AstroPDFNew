<%@page import="com.ojassoft.astrosagecloud.util.WebKeys"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>

<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
            <td width="100%" class="boxtopbg">
                <div class="boxhdg">
                    ||&nbsp;&nbsp;<%="Activation Message"%>&nbsp;&nbsp;||</div>
            </td>
        </tr>
    </tbody>
</table>

 <center>  <div align="center" style="width:60%;">
   
               <%
                  	//-------------- Resetting all sessions and cookies variables before new login 
                                                   String  msg ="",getUpdateData="";
                                                   int linkFlag = 0;
                                                   
                                                   request.getSession().setAttribute("Login", "");
                                                   request.getSession().setAttribute("Password", "");
                                                   request.getSession().setAttribute("chartType", "");
                                                   request.getSession().setAttribute("UserExists", "false");
                                                   request.getSession().setAttribute("User_Id", "");
                                                   request.getSession().setAttribute("planid", "");
                                                   request.getSession().setAttribute("ChartId", "");
                                                  // request.getSession().setAttribute("languageCode", "");
                                                  // request.getSession().setAttribute("horoscopeObj", "");
                                                  // request.getSession().setAttribute("isdst", "");
                                                   
                                                  Cookie[] cookieObj=null;               
                                               	  cookieObj = request.getCookies();

                                                  for(int cookieCount=0;cookieCount<cookieObj.length;cookieCount++){
                                                      if(cookieObj[cookieCount].getName().compareToIgnoreCase(WebKeys.COOKIE_UID)==ConstantValues.COOKIES_FOUND){
                                                    	  Cookie userId = new Cookie(WebKeys.COOKIE_UID,"");
                                                    	  userId.setMaxAge(0);    
                                                  		  userId.setPath("/");
                                                  			userId.setDomain(WebKeys.COOKIE_DOMAIN);
                                                  		  response.addCookie(userId);
                                                      }
                                                      if(cookieObj[cookieCount].getName().compareToIgnoreCase(WebKeys.COOKIE_PWD)==ConstantValues.COOKIES_FOUND){
                                                    	  Cookie password = new Cookie(WebKeys.COOKIE_PWD,"");
                                                    	  password.setMaxAge(0); 
                                                  		  password.setPath("/");
                                                  		password.setDomain(WebKeys.COOKIE_DOMAIN);
                                                  		  response.addCookie(password); 
                                                      }
                                              	}	
                                                   
                                            String regCode =  request.getParameter("rgcode");   
                                            String userId  =  SharedFunction.decryptstring(request.getParameter("userid")); 
                                            UserDAO UD =  new UserDAO();

                                            if(regCode!="" && regCode!=null && userId!="" && userId!=null) {
                                            String resData = UD.getRecordOfUserBasedReg(userId,regCode,null);
                                            //out.println(resData);
                                            if(resData.equals("2")){
                                            getUpdateData = UD.updateUserData(userId,null);
                                            }
                                            
                                            request.getSession().setAttribute("UserExists", "true");
                                            request.getSession().setAttribute("User_Id", userId);
                                            msg="Your account has been activated successfully. Click the below link for further proceed.";
                                            linkFlag=1;
                                          // out.println(String.valueOf(session.getAttribute("UserId")));
                                            }
                                            else
                                            {
                                            	 msg="Please put valid user id and reg code in the url.";
                                            }
                                            out.println("<p><b>" +  msg + "</b></p>");
                  %>
               <%if(linkFlag==1){ %>
               <br />
               <a href="/freechart/checkbirthdetails.jsp?Msg=<%=SharedFunction.encryptstring(String.valueOf(session.getAttribute("User_Id")))%>&Reg=false">
               <b><%
               out.println("Go to AstroSage Cloud");%></b></a>
               <%}%>

</div>
   
</center>
