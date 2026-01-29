package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ojassoft.astrosagecloud.DAO.UserDAO;
import com.ojassoft.astrosagecloud.util.WebKeys;

/**
 * All the links first pass through this filter.
 * @author developer
 *
 */
public class CloudFilter implements Filter 
{
	public void init(FilterConfig arg0) throws ServletException {}  
	
	public void doFilter(ServletRequest req, ServletResponse response,  
		    FilterChain chain) throws IOException, ServletException 
	{  
		HttpServletRequest request = (HttpServletRequest)req;
		validateCookieAndSession(request);
		
		String uri = request.getRequestURI(); 
		String queryString = request.getQueryString();
		List<String> signInParams = new ArrayList<String>();
		signInParams.add("/cloud/signin.asp");
		signInParams.add("/cloud/signin.jsp");
		signInParams.add("/cloud/new_login.jsp");
		signInParams.add("/cloud/signup.asp");
		signInParams.add("/cloud/signup.jsp");
		signInParams.add("/cloud/new_signup.jsp");
		//signInParams.add("/cloud/loginchk.jsp");
		signInParams.add("/cloud/login.asp");

		boolean proceed = true;
		if(signInParams.contains(uri))
		{
			Object obj = request.getSession().getAttribute("User_Id");
			if(obj != null && !obj.equals(""))
			{
				proceed = false;
			}
			else
			{
				((HttpServletResponse)response).sendRedirect("/cloud/home.asp?openloginpopup=1");
				return;
			}
		}
		if(proceed && uri.contains(".asp"))
		{
			String uriMFolder[] = uri.split("/");
			String uriWOQS = uriMFolder[uriMFolder.length-1].toLowerCase();
			//request.getRequestURI().replace(uriWOQS, uriWOQS.toLowerCase());
			req.getRequestDispatcher(uriWOQS).forward(req, response);
		}
		else 
		{
			if(proceed)
			{
				chain.doFilter(req, response);
			}
			else
			{
				HttpServletResponse httpResponse = (HttpServletResponse) response;
				httpResponse.sendRedirect("/cloud/home.asp?msgsignup=1");
			}
		}
		
		    
	}  
	public void validateCookieAndSession(HttpServletRequest request)
	{
		String uidCookie = "";
		String pwdCookie = "";
		Cookie cookies[] = request.getCookies();
		if(cookies != null)
		{
			for(Cookie cookie : cookies)
			{
				if(cookie.getName().equals(WebKeys.COOKIE_UID))
				{
					uidCookie = cookie.getValue();
				}
				if(cookie.getName().equals(WebKeys.COOKIE_PWD))
				{
					pwdCookie = cookie.getValue();
				}
				if(!uidCookie.equals("") && !pwdCookie.equals(""))
				{
					break;
				}
			}
		}
		HttpSession session = request.getSession();
		
		if((uidCookie == null || uidCookie.equals("")) && session.getAttribute("User_Id") != null)
		{
			session.removeAttribute("User_Exists");
			session.removeAttribute("User_Id");
			//session.removeAttribute("HoroscopeObj");
		}
		/*else if(uidCookie != null && !uidCookie.equals("") && (session.getAttribute("User_Id") == null || session.getAttribute("User_Id").equals("")))
		{
			UserDAO userDAO = new UserDAO();
			HashMap<String, String> hm = userDAO.getRecordOfUserWithPassword(uidCookie, pwdCookie, null)
		}*/
	}
	
	public void destroy() {}  
}
