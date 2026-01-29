package com.ojassoft.astrosagecloud;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ojassoft.astrosagecloud.DAO.UserDAO;
import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.I_RandomNo;
import com.ojassoft.astrosagecloud.util.I_SendMail;
import com.ojassoft.astrosagecloud.util.SharedFunction;
import com.ojassoft.astrosagecloud.util.Util;

public class EditUserProfileServlet extends AstrosageServlet  {
	
	String requestDispatcherUrl;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		String methodName = request.getParameter("methodName");
		requestDispatcherUrl = Util.safestrWithNull(request.getParameter("source"));
		if(methodName != null)
		{
			try
			{
				initialize(request, response);
				
				Class[] classParams = new Class[2];
				classParams[0] = HttpServletRequest.class;
				classParams[1] = HttpServletResponse.class;
				this.getClass().getMethod(methodName, classParams).invoke(this, request, response);
			}
			catch(Exception ite)
			{
				ite.printStackTrace();
			}
		}
	}

	public void editUserProfile(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		 String isShowMailFooter ="",isShowMAilHeader="";
		 String headerMsg ="",footerMsg="";
		  String userid = Util.safestr(request.getParameter("userId"));
		  String password = Util.safestr(request.getParameter("password"));
		  String fname = Util.safestr(request.getParameter("firstName"));
		  fname = new String(fname.getBytes("ISO-8859-1"), "UTF-8");
		  String category = Util.safestr(request.getParameter("category"));
		  String email = Util.safestr(request.getParameter("emailAddress"));
		  String mobileno = Util.safestr(request.getParameter("mobileNo"));
		  String maritalStatus = Util.safestr(request.getParameter("maritalStatus"));
		  String occupation = Util.safestr(request.getParameter("occupation"));
		  int getPlanId = Integer.parseInt(Util.safestr(request.getParameter("planIdValue")));
	      //int msgval = updateuserprofile(userid,password,fname,email,mobileno,category);
		    I_RandomNo random = new I_RandomNo();
		    I_SendMail send = new I_SendMail();
		    UserDAO UD =  new UserDAO();
			String result = "",ip="",regcode="" , subject="",msg="",msgtext="";
			
			try{
			 if(userid.equals("")  || password.equals("") || fname.equals("") || email.equals("") || category.equals("")){
				// result = ConstantValues.ALL_FIELD_VALUES_ARE_REQUIRED;  
				request.setAttribute("msgtextRs",ConstantValues.ALL_FIELD_VALUES_ARE_REQUIRED);
             	request.getRequestDispatcher(requestDispatcherUrl).forward(request, response);
			 }else{
				       String  Emailresult = UD.isEmailIdExistForUpdate(userid,email);
				      // System.out.println("neha"+Emailresult+"neha");
				        if(SharedFunction.isvalidemail(email)){
				        	 if(Emailresult.equals("false")){
				        		 //result = ConstantValues.EMAIL_ALREADY_EXIST;
				        		 request.setAttribute("msgtextRs",ConstantValues.EMAIL_ALREADY_EXIST);
				              	request.getRequestDispatcher(requestDispatcherUrl).forward(request, response);
				        	 }else{
				        		 if(mobileno.equals("")||(SharedFunction.isNumeric(mobileno))){
					        		  ip = request.getRemoteAddr();
		                              ip = ip.replace(".", "");
		                              regcode = ip + random.generateRandomNo();
			                                
				                        msgtext = UD.updateprofile(userid,password,fname,email,mobileno,category,regcode,maritalStatus,occupation);
				                        
				                        /*
						        		  This code is excuted only for the plantinum plan user and 
						        		  store data in cloud details table
						        		  */
						        		  if (Util.isDhruvPlan(getPlanId) && Util.safestrWithNull(request.getParameter("isfd")).equalsIgnoreCase("yes")){
						        			  String companyName = Util.safestr(request.getParameter("heading"));
						        			  companyName = new String(companyName.getBytes("ISO-8859-1"), "UTF-8");
						        			  String address1 = Util.safestr(request.getParameter("line1"));
						        			  address1 = new String(address1.getBytes("ISO-8859-1"), "UTF-8");
						        			  String address2 = Util.safestr(request.getParameter("line2"));
						        			  address2 = new String(address2.getBytes("ISO-8859-1"), "UTF-8");
						        			  String cmpLogoUrl = "";//for future use
						        			  String textCloud = UD.insertOrUpdateCloudPlanDetails(userid,companyName,address1,address2,cmpLogoUrl);
						        			  request.setAttribute("msgtextRs",textCloud);
						        			  
						        		  }
						        		  
				                        if(msgtext.equals(ConstantValues.UPDATED_SUCCESSFULLY)){
				                            //result  = ConstantValues.UPDATED_SUCCESSFULLY;
				                            request.setAttribute("msgtextRs",ConstantValues.UPDATED_SUCCESSFULLY);
							              	request.getRequestDispatcher(requestDispatcherUrl).forward(request, response);
				                        }else if(msgtext.equals(ConstantValues.UPDATION_SUCCESSFULL_SEND_EMAIL)){
				                            subject = "Activate your new email on AstroSage";
				                            
				                            msg = "Dear Sir/Madam, <br><br>You have updated your email id on your AstroSage.com profile. Please click on the link below to activate your account: <br><br><a href=http://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + ">http://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(userid) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";

				                           // ActivationMail email, subject, msg
				                             send.sendMail(email,subject, msg,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,"");
				                            //result = ConstantValues.UPDATION_SUCCESSFULL_SEND_EMAIL;
				                             request.getSession().setAttribute("profile_name",fname);
			                                 request.getSession().setAttribute("profile_email",email);
			                                 response.sendRedirect("activation-page.asp");
				                        }else{
				                            //result = ConstantValues.UPDATION_UNSUCCESSFULL;
				                            request.setAttribute("msgtextRs",ConstantValues.UPDATION_UNSUCCESSFULL);
							              	request.getRequestDispatcher(requestDispatcherUrl).forward(request, response);
				                        }
					        			  
					        		 
					        		  
				        		  
				        		 	}
				        		 else
				        		 {
			                        result = ConstantValues.INVALID_MOBILE; 
			                        request.setAttribute("msgtextRs",result);
			                        request.getRequestDispatcher(requestDispatcherUrl).forward(request, response);
			        			  }
				        	 	}
				        	 
				        	}
				        	else
				        	{	
			        			  //result = ConstantValues.INVALID_EMAIL_ID_FOR_UPDATION;
			        			  request.setAttribute("msgtextRs",ConstantValues.INVALID_EMAIL_ID_FOR_UPDATION);
					              request.getRequestDispatcher(requestDispatcherUrl).forward(request, response);
				        	 }
		 			}
			
			        	 }
			        	 catch(Exception e)
			     		{
			     			e.printStackTrace();
			     		}
			     	}
	
	
	//public int updateuserprofile(String userid,String password,String fname,String email,String mobileno,String category){
	public void friend(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
	}
	   
}
