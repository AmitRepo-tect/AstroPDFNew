<%@page import="com.ojassoft.astrosagecloud.DO.UserData"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_RandomNo"%>
<%@page import="com.ojassoft.astrosagecloud.model.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>

<%!
public String signUpUser(String userid,String password,String fname,String email,String mobileno,String category,String regsource,HttpServletRequest request,String headerMsg, String footerMsg,ServletContext application){
	
	String isShowMailFooter ="",isShowMAilHeader="";
    String checkuserid = userid ,isuseridexist ="";
    String Emailresult ="", msgtext= "",ip="",regcode="" , subject="",msg="";
    UserData UD = new UserData();
    I_RandomNo random = new I_RandomNo();
    
    I_SendMail send = new I_SendMail();
    
    if(userid.equals("")  || password.equals("")  || fname.equals("") || email.equals("") || category.equals("")){
       return ConstantValues.ALL_FIELD_VALUES_ARE_REQUIRED;       
    }else{
        if(userid.length() < 8){
            return  ConstantValues.USER_ID_INVALID_LENGTH;
        } else{
            isuseridexist = UD.checkUserIdAvail(checkuserid) ;
            if(isuseridexist == ConstantValues.USERIDEXIST){
                return ConstantValues.USERID_ALREADY_EXIST;
            }else{
                Emailresult = UD.isEmailIdExist(email);
                if(isValidEmail(email)){
                    if(Emailresult.equals("true")){
                        return ConstantValues.EMAIL_ALREADY_EXIST;
                    } else{
                        if(!mobileno.equals("")){
                            if((isNumeric(mobileno))){
                            	ip = request.getRemoteAddr();
                                ip = ip.replace(".", "");
                                regcode = ip + random.generateRandomNo();
    
                                msgtext = UD.signUpData(userid,password,fname,email,mobileno,category, regcode,regsource);
                                
                                if(msgtext == ConstantValues.SIGNUP_SUCCESSFULLY){
                                	
                                     request.getSession().setAttribute("UserId",Util.safestr(request.getParameter("userId")));
                                     subject = "Just one more step to get started on AstroSage";
                                     msg = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=http://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + ">http://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
                              
                                     send.sendMail(email,subject, msg,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");

                                     
                                    return ConstantValues.SIGNUP_SUCCESSFULLY;
                                }else{
                                    return ConstantValues.SIGNUP_FAILED;
                                }
                            }else{
                                return ConstantValues.INVALID_MOBILE; 
                            }
                        }else{
                             ip = request.getRemoteAddr();
                             ip = ip.replace(".", "");
                             regcode = ip + random.generateRandomNo();
                             
                            msgtext = UD.signUpData(userid,password,fname,email,mobileno,category, regcode,regsource);
                            
                            if(msgtext == ConstantValues.SIGNUP_SUCCESSFULLY){
                            	
                            	request.getSession().setAttribute("UserId",Util.safestr(request.getParameter("userId")));
                                subject = "Just one more step to get started on AstroSage";
                                msg = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=http://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + ">http://www.astrosage.com/freechart/reg-activation.asp?userid=" +SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
                                send.sendMail(email,subject, msg,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");
                             
                                return ConstantValues.SIGNUP_SUCCESSFULLY;
                            }else{
                                return ConstantValues.SIGNUP_FAILED;
                            }
                        }
                    }
                }else{
                   return ConstantValues.INVALID_EMAIL_ID;
                }
            }
        }
    }      
}


public boolean isValidEmail(String email){
	if(email.indexOf("@")>0){
		if(email.indexOf(".")>0){
			return true;
		}
		else{
			return false;
		}
	}
	else
	{
		return false;
	}
}

public static boolean isNumeric(String string) {
    return string.matches("^[-+]?\\d+(\\.\\d+)?$");
}
%>