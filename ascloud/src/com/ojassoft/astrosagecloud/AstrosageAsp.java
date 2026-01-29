package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.net.URL;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ojassoft.astrosagecloud.util.ConstantValues;

public class AstrosageAsp extends HttpServlet{
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException
	{
		String forwardUrl = "";
		String chkPageAccess = "";
		String referer =  request.getHeader("Referer");
		
		if(request.getParameter("isapi")!=null && !request.getParameter("isapi").equals(""))
		{
			chkPageAccess = request.getParameter("isapi");
		}
		if((referer != null && !referer.isEmpty()) || chkPageAccess.equals("1"))
		{
		if(chkPageAccess.equals("1")){referer = "http://astrosage.com";} //this condition comes from bhrigoo app
		URL url = new URL(referer);
		
		String hostName = url.getHost();
        if(Arrays.asList(ConstantValues.allowedDomains).contains(hostName))
		{ 
		
		try
		{
		//Getting urlValue
			String uri = request.getRequestURI();
			//uri = uri.replaceAll(".asp", ".jsp");
					
			String str = uri.substring(1, uri.indexOf(".asp")+4);
			str = str.replaceAll(".asp$", ".jsp");
			//str = "new_" + str;
			request.setAttribute("includeFile", str);
			
			//### **** Add by ambuj on 21/12/2017 *** request's redirect of m folder ******	
			String uriMFolder[] = uri.split("/");
			if(uriMFolder[1].equals("m")){
				str = uriMFolder[uriMFolder.length-1];
				str = str.replaceAll(".asp$", ".jsp");
				forwardUrl = str;
			//### *****************
			} else {
				forwardUrl = "/content-source.asp";
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
		else
		{
			forwardUrl = "/cloud/login.asp";
		}
		}
		else
		{
			forwardUrl = "/cloud/login.asp";
		}
		try
		{
			request.getRequestDispatcher(forwardUrl).forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
	
	}