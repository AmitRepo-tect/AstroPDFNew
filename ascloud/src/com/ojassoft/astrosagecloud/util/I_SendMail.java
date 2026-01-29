package com.ojassoft.astrosagecloud.util;

import java.util.*; 

import javax.mail.*; 
import javax.mail.internet.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.mail.Session; 

import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyProperties;

public class I_SendMail {
	/**
	 * This method sends the Emails
	 * @param mailTo1 subject body headerMsg footerMsg isShowMailHeader isShowMailFooter mailReplyTo 
      * @return void
	 */
	public void sendMail(String mailTo1,String subject, String body, String headerMsg, String footerMsg,
			String isShowMailHeader, String isShowMailFooter,String mailReplyTo)
	{
		//String username="mail@astrocamp.com";
		//String username="mail@astrosage.com";
		//String password="java#76383";
		//String password="J#76383";
		try
		{
			if(isShowMailHeader.equals(""))
			{
				body = headerMsg + body;
			}
			if(isShowMailFooter.equals(""))
			{
				body = body + footerMsg; 
			}
			Local local = new Local();
			
			Context initCtx = new InitialContext();
			Context envContext = (Context ) initCtx.lookup("java:comp/env");
			
			//String hostName = properties.getString("mail.smtp.host");
	        //String userName = properties.getString("mail.smtp.user");
	        //String password = properties.getString("mail.smtp.password");
	        
	        String username = String.valueOf(envContext.lookup("username"));
			String password = String.valueOf(envContext.lookup("password"));
			String portno = String.valueOf(envContext.lookup("portno"));
			String hostName = String.valueOf(envContext.lookup("smtpserver"));
			
	        Properties propObj = new Properties();
	        
	        propObj.put("mail.smtp.starttls.enable", "true");
			propObj.put("mail.smtp.host", hostName);
			propObj.put("mail.smtp.user", username);
			propObj.put("mail.smtp.password", password);
			propObj.put("mail.smtp.port", portno);
			propObj.put("mail.smtp.auth", "false");
	        
			Session sessionObj = Session.getInstance(propObj, null);
			Message msgObj = new MimeMessage(sessionObj);
			msgObj.setFrom(new InternetAddress(ConstantValues.MAILFROM));
			msgObj.setRecipients(Message.RecipientType.TO,
			InternetAddress.parse(mailTo1, false));
			msgObj.setSubject(subject);						
			msgObj.setSentDate(new Date());
			if(!mailReplyTo.equals("")){
			msgObj.setReplyTo(InternetAddress.parse(mailReplyTo));
			}
			
			msgObj.setContent(body,"text/html; charset=UTF-8");
			Transport transportObj = sessionObj.getTransport("smtp");        
			transportObj.connect(hostName, username, password);
			transportObj.sendMessage(msgObj, msgObj.getAllRecipients());			
			transportObj.close();   

		}
		catch(Exception ex)
		{
			System.out.println("Got exception in I_SendMail : "+ex.getMessage());
		}
	}
	
	public void sendMail()
	{
		Properties propObj = new Properties();
		propObj.put("mail.smtp.starttls.enable", "true");
		propObj.put("mail.smtp.host", "smtp.gmail.com");
        propObj.put("mail.smtp.user", "mail@astrosage.com");
        propObj.put("mail.smtp.password", "java#76383");
        propObj.put("mail.smtp.port", "587");
        propObj.put("mail.smtp.auth","false");
		Session sessionObj = Session.getInstance(propObj, null);
		try
		{
			Message msgObj = new MimeMessage(sessionObj);
			msgObj.setFrom(new InternetAddress("info@astrosage.com"));
			msgObj.setRecipients(Message.RecipientType.TO,
			InternetAddress.parse("smriti@ojassoft.com", false));
			msgObj.setSubject("Cloud Astrosage is Down");						
			msgObj.setSentDate(new Date());
			msgObj.setContent("Restart the server","text/html; charset=UTF-8");
			
			Transport transportObj = sessionObj.getTransport("smtp");        
			transportObj.connect("smtp.gmail.com", "mail@astrosage.com", "java#76383");
			transportObj.sendMessage(msgObj, msgObj.getAllRecipients());			
			transportObj.close(); 
		}
		catch(Exception ex)
		{
			
		}
	}

}
