package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Properties;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;
import com.ojassoft.astrosagecloud.util.Common;
import com.ojassoft.astrosagecloud.util.ConstantValues;

public abstract class AstrosageServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		doPost(req, resp);
	}
	
	public abstract void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException;
	
	/**
	 * This is a common method that is called in all other servlets. This does the basic tasks of setting
	 * languageCode, English Constants file and Horoscope Object in the session.
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public void initialize(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		//if(session.getAttribute("User_Id") == null)
		//{
		//	forwardUrl = "/default.jsp";
		//}
		//else
		//{
			int languageCode = 0;
			Object obj = session.getAttribute("languageCode");
			if(obj != null && !obj.equals(""))
			{
				languageCode = (Integer.parseInt(obj.toString()));
			}
			
			boolean isChangeNeeded = false;
			int newLanguageCode = 0;
			// LanguageType is used from within cloud, languageCode is used from outside interfaces
			String languageType = request.getParameter("LanguageType");
			if(languageType != null && !languageType.equals(""))
			{
				newLanguageCode = Arrays.asList(Common.languageType).indexOf(languageType);
				isChangeNeeded = true;
			}
			else
			{
				String paramLangCode = request.getParameter("languageCode");
				if(paramLangCode != null && !paramLangCode.equals(""))
				{
					newLanguageCode = (Integer.parseInt(paramLangCode));
					isChangeNeeded = true;
				}
				else
				{
					paramLangCode = request.getParameter("languagecode");
					if(paramLangCode != null && !paramLangCode.equals(""))
					{
						newLanguageCode = (Integer.parseInt(paramLangCode));
						isChangeNeeded = true;
					}
				}
			}
			if(isChangeNeeded)
			{
				if(languageCode != newLanguageCode)
				{
					session.setAttribute("languageCode", newLanguageCode);
					Object obj1 = session.getAttribute("HoroscopeObj");
					if(obj1 != null && !obj1.equals(""))
					{
						DesktopHoro horo = (DesktopHoro) obj1;
						horo.setLanguageCode(String.valueOf(newLanguageCode));
						try
						{
							horo.initialize();
						}
						catch(Exception ex)
						{
							ex.printStackTrace();
							System.out.println("Error Encountered while initialising HoroObject");
						}
					}
					Local local = new Local();
					MyProperties constantBundle = new MyProperties(local.loadPropertiesFile("constants", newLanguageCode));
					session.setAttribute("constants", constantBundle);
				}
			}
			Object obj2 = session.getAttribute("constants");
			if(obj2 == null || obj2.equals(""))
			{
				Local local = new Local();
				MyProperties constantBundle = new MyProperties(local.loadPropertiesFile("constants", languageCode));
				session.setAttribute("constants", constantBundle);
			}
			Object chartTypeObj = request.getParameter("charttype");
			if(chartTypeObj != null && !chartTypeObj.equals(""))
			{
				session.setAttribute("chartType",chartTypeObj.toString());
			}
			
		//}
	}
	
	/**
	 * This method converts the MyResourceBundle (properties) file to java.Util.Properties
	 * @param resource
	 * @return Properties
	 */
	public Properties convertResourceBundleToProperties(MyResourceBundle resource) {
	    Properties properties = new Properties();

	    Enumeration<String> keys = resource.getRb().getKeys();
	    while (keys.hasMoreElements()) {
	      String key = keys.nextElement();
	      properties.put(key, resource.getString(key));
	    }

	    return properties;
	  }
			
	/**
	 * This is a private method which is used to check if the domain of the request is allowed to gain 
	 * access to this application.
	 * @param request
	 * @return boolean
	 * @throws Exception
	 */
	public boolean isAllowed(HttpServletRequest request) throws Exception
	{
		boolean isDomainAllowed = false;
		URL url = new URL(request.getHeader("Referer"));
		if(Arrays.asList(ConstantValues.internalAllowedDomains).contains(url.getHost()))
		{
			isDomainAllowed = true;
		}
		return isDomainAllowed;		
		
	}
}
