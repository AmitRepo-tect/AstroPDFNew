package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.*;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.Constants;

import java.util.Arrays;
import java.util.HashMap;
import java.util.logging.Logger;

import com.ojassoft.astrosagecloud.DAO.UserDAO;
import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.util.Common;
import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.WebKeys;
import com.ojassoft.astrosagecloud.util.SharedFunction;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * This Class is invoked corresponding to the links which need to be opened through content-template.jsp
 * Common Tasks for these jsps are performed in this class. Also the necessary checks are made here.
 * @author developer
 *
 */
public class CloudServlet extends AstrosageServlet 
{
	public final static Logger LOGGER = Logger
  			.getLogger(CloudServlet.class.getName());
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String forwardUrl = "";
		try
		{
			//Getting urlValue
			String uri = request.getRequestURI();
			//request.setCharacterEncoding("UTF-8");			
			//uri = uri.replaceAll(".asp", ".jsp");
			String str = uri.substring(7, uri.indexOf(".asp")+4);
			
			if(str.equals("createsession.asp"))
			{
				request.getSession().removeAttribute("ChartId");
				request.getSession().removeAttribute("constants");
				request.getSession().removeAttribute("languageCode");
				request.getSession().removeAttribute("HoroscopeObj");
				request.getSession().removeAttribute("KPObj");
				// this method will log-in user, if user id and trusted information is coming from previous interface
				// if request from external websites/ interfaces, but from verified domain, then forwardUrl will be null
				forwardUrl = setUserId(request, response);

				if(forwardUrl.equals(""))
				{
					forwardUrl = "createsession-jsp.asp";
				}
			}
			//matchmaking is being done and session is being created for the same.
			//Can be called from external domains as well.
			else if(str.equals("createsession-matchmaking.asp"))
			{
				request.getSession().removeAttribute("ChartId");
				request.getSession().removeAttribute("constants");
				request.getSession().removeAttribute("languageCode");
				request.getSession().removeAttribute("HoroscopeObj");
				request.getSession().removeAttribute("KPObj");
				forwardUrl = setUserId(request, response);
				if(forwardUrl.equals(""))
				{
					forwardUrl = "createsession-matchmaking-jsp.asp";
				}
			}
			//initialise will set languagecode and constants in the session.
			initialize(request, response);
			//forwardUrl blank means that session has not yet been created.
			if(forwardUrl.equals("")) 
			{
				//the default chart of the user needs to be picked up from 
				//db and session will be created.
				if(str.equals("defaultchartlogin.asp"))
				{
					request.getSession().removeAttribute("HoroscopeObj");
					request.getSession().removeAttribute("KPObj");
					//this method will set valid userId in session
					
					setUserId(request, response);
					//Get default chart of the user and and create session for the same.
					//if chart is not found, then the user is redirected to new chart creation.
					forwardUrl = getDefaultChart(request, response);
					if(forwardUrl.equals(""))
					{
						forwardUrl = "createsession-jsp.asp";
					}
					else
					{
						response.sendRedirect(forwardUrl);
						return;
					}
				
				}
				else
				{
					//This session will be called in cases:
					//1. Horoscope object is present. Any page is hit, and the user is already logged in.
					//2. No Horoscope object is present in the session. In this case, we need to check
					//	a) Sign up/activation/updateEmail case.
					//	b) Case of login / matchmakingoutput.
					// 	c) Are cookies present?
					//	d) Case of new signin.
					
					HttpSession session = request.getSession();
					Object horoObj = session.getAttribute("HoroscopeObj");
					Object userObj = session.getAttribute("userid");
					Object loginUserObj = session.getAttribute("LoginUser");
					
					if(horoObj == null ) // case 2 as mentioned above.
					{
						if(userObj == null) //Cant find this session variable anywhere, so will always be null.
						{
							//Case 2(a) the jsp name is set in a variable and correspondingly called in content-template.
							if(str.contains("signup") || str.contains("activation") || str.contains("updateemailid") || str.contains("activate"))
							{
								str = str.replaceAll(".asp$", ".jsp");
								str = "new_" + str;
							}
							//No signup/activation/updateemail. Check cookies. If these are present, loginchk.jsp is called for further action.
							//else If it is a case of new signin, then the user is sent to new_chart page to enter birth details.
							//If the session expired, or the user is coming for the first time, then the user is sent to home page
							//with signup popup open.
							else
							{
								HashMap<String, String> returnedMap = Util.getCookiesAndLogin(request);
								if(!(str.contains("login") || str.contains("matchmakingoutput")))
								{
									session.setAttribute("GOTO_THISPAGE", str);
								}
								//if userid and password not found in cookie
								if(returnedMap.size() != 2)
								{
									//str = str.replaceAll(".asp$", ".jsp");
									//When the user is coming via new signin.
									if(loginUserObj != null && !loginUserObj.toString().equals(""))
									{
										str = "new_newchart.jsp";
									}
									else
									{
										response.sendRedirect("home.asp?openloginpopup=1");
										return;
									}
								}
								else
								{
									session.setAttribute("DONT_GOTO_HOME", "1");
									response.sendRedirect("loginchk.jsp?submit=1&txtUserID="+returnedMap.get("UserId")+"&txtPassword="+returnedMap.get("Password"));
									//response.sendRedirect("loginchk.jsp?submit=1&txtUserID=rs&txtPassword=ritu");
									return;
									//request.setAttribute("txtUserId", returnedMap.get("UserId"));
								}
							}
							session.setAttribute("languageCode",0);
							Local local = new Local();
							MyProperties constantBundle = new MyProperties(local.loadPropertiesFile("constants", 0));
							session.setAttribute("constants", constantBundle);
						}
						
					}
					else //case 1 as mentioned above.
						//Here, the captured asp url is just converted to jsp and set in a variable
						//content-template is the main outer jsp which includes the required jsp.
						//In case of match making, the outer jsp is different which is called thus.
					{
						str = str.replaceAll(".asp$", ".jsp");
						str = "new_" + str;
						int lc = (Integer) session.getAttribute("languageCode");
						if(lc > 1)
						{
							DesktopHoro myHoroObj = (DesktopHoro) horoObj;
							myHoroObj.setLanguageCode("0");
							myHoroObj.initialize();						}
						
					} //end else
					request.setAttribute("includeFile", str);
					if(str.equalsIgnoreCase("new_matchmakingoutput.jsp"))
					{
						forwardUrl = "/cloud/matchmakingoutput1.asp";
					}
					else
					{
						forwardUrl = "/cloud/content-template.asp";
					}
					
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			response.setCharacterEncoding("UTF-8");
			request.getRequestDispatcher(forwardUrl).forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} //end method
	
	
	/**
	 * This method is called inside from cloud servlet doGet method.
	 * purpose of this method is to set userid in session after successful checking for domain
	 * if domain verification fails then it forward to login.asp
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private String setUserId(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String forwardUrl = "";
		String methodName = request.getParameter("methodName");
		if(methodName == null || !methodName.equals("fromJSP"))
		{
			String userId = "";
			String swa = request.getParameter("swa");
			if(swa != null && !swa.trim().equals(""))
			 userId = URLDecoder.decode(request.getParameter("swa").trim(),"UTF-8");
			//URLEncoder.encode("","");
			
			String decryptedUserId = SharedFunction.DeCrypt(userId);
			String isVerified = request.getParameter("vfd");
			
			String referer = request.getHeader("Referer");//case-insensitive//http://www.astrosage.com - http://astrosage.com
			//request.getSession().setAttribute("REMOTE_ADD","1: "+remoteAddr+" 2: "+referer);
			if(referer != null && !referer.isEmpty())
			{
				URL url = new URL(referer);
				String hostName = url.getHost();
				
				//Allowed Domains mean that these domains send user information.
				//Internal allowed ones only create kundli.
				if(Arrays.asList(ConstantValues.allowedDomains).contains(hostName))
				{
					if(isVerified != null && isVerified.equals("1"))
					{
						request.getSession().setAttribute("User_Id",decryptedUserId);
						request.getSession().setAttribute("UserExists", "true");
					}
					else if(isVerified == null && userId.equals(""))
					{
						if(Arrays.asList(ConstantValues.internalAllowedDomains).contains(hostName))
						{
							forwardUrl = "";
						}
					}
				}
				else
				{
					forwardUrl = "login.asp";
				}
			}
			
		}
		return forwardUrl;
	}
	/**
	 * This method is calls inside from cloud servlet doGet method.
	 * This method is load user default chart according to userid fetch from session.
	 * If user id exits in session then load default chart otherwise redirect it to birth details.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private String getDefaultChart(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String returnUrl = "";
		Object obj = request.getSession().getAttribute("User_Id");
		if(obj != null)
		{
			String userId = obj.toString();
			UserDAO userDAO = new UserDAO();
			HashMap<String, Object> userHoro = userDAO.openUserDefaultChart(userId);
			if(userHoro.get("ChartId") != null)
			{
				int langCode = 0;
				Object objLang = request.getSession().getAttribute("languageCode");
				if(objLang != null && !objLang.equals(""))
				{
					langCode = (Integer)objLang;
				}
				Object chartTypeObj = userHoro.get("Charting");
				String chartType = "0";
				if(chartTypeObj != null && !chartTypeObj.toString().equals(""))
				{
					chartType = chartTypeObj.toString();
				}
				request.getSession().setAttribute("chartType",chartType);
				DesktopHoro objHoro = (DesktopHoro) userHoro.get("HoroObject");
				float timeZone = Util.safeFloat(objHoro.getTimeZone());
				if (Integer.parseInt(objHoro.getDST()) > 0) {
					
					timeZone = timeZone + Integer.parseInt(objHoro.getDST());
					objHoro.setDST("0");
					objHoro.setTimeZone(timeZone+"");
					request.getSession().setAttribute("isDst","1");
				}
				try
				{
					String languageType = request.getParameter("languagetype");
					if(languageType != null && !languageType.isEmpty())
					{
						for(int i=0;i<11;i++)
						{
							if(languageType.equals(Common.languageType[i]))
							{
								langCode = i;
								objHoro.setLanguageCode(Common.horoLangCode[i]);
								objHoro.initialize();
						        
						        break;
							} //end if
						} //end for
					} //end if
				} //end try
				catch(Exception e)
				{
					
				}
				request.getSession().setAttribute("IsSaved", 0);  
				//request.getSession().setMaxInactiveInterval(120);
				request.getSession().setAttribute("ChartId", userHoro.get("ChartId"));
				request.getSession().setAttribute("HoroscopeObj", objHoro);
				request.getSession().setAttribute("languageCode", langCode);
			}
			else
			{
				request.getSession().setAttribute("LoginUser", userId);
				returnUrl = "/cloud/session-destroy-for-newchart.asp?methodName=newChart";
				//response.sendRedirect("http://k.astrosage.com/birthdetails.asp?Ispersondetailfound=No");
			}
		}
		return returnUrl;
	}
	/**
	 * This method is calls from chart servlet .
	 * To create horoObject for user according to values is provide from new chart. 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public DesktopHoro createHoroscopeObject(HttpServletRequest request, ServletContext ctx) throws Exception
	{
		DesktopHoro ObjHoro = new DesktopHoro();
		Constants ObjConst = new Constants();
		String getname=request.getParameter("name");
		String name = new String(getname.getBytes("ISO-8859-1"), "UTF-8");
		if(ctx == null)
		{
			ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		}
		else
		{
			ObjConst.setConstPath(ctx.getRealPath("/cloud/"));
		}
		ObjHoro.setName(name);
		ObjHoro.setPlace(request.getParameter("place"));
		ObjHoro.setMaleFemale(request.getParameter("sex"));
		ObjHoro.setSecondOfBirth(request.getParameter("sec"));
		ObjHoro.setMinuteOfBirth(request.getParameter("min"));
		ObjHoro.setHourOfBirth(request.getParameter("hrs"));
		ObjHoro.setDayOfBirth(request.getParameter("day"));
		ObjHoro.setMonthOfBirth(request.getParameter("month"));
		ObjHoro.setYearOfBirth(request.getParameter("year"));
		ObjHoro.setDegreeOfLongitude(request.getParameter("longdeg"));
		ObjHoro.setMinuteOfLongitude(request.getParameter("longmin"));
		ObjHoro.setEastWest(request.getParameter("longew"));
		ObjHoro.setDegreeOfLattitude(request.getParameter("latdeg"));
		ObjHoro.setMinuteOfLattitude(request.getParameter("latmin"));
		ObjHoro.setNorthSouth(request.getParameter("latns"));
		
		ObjHoro.setAyan(Util.safeInt(request.getParameter("ayanamsa")));
		ObjHoro.setLanguageCode(Util.safestr(request.getSession().getAttribute("languageCode")));
		//ObjHoro.set
		/*String langCode = request.getParameter("languageCode");
		if(langCode == null || langCode.equals(""))
		{
			langCode = "0";
		}
		ObjHoro.setLanguageCode(langCode);
		request.getSession().setAttribute("languageCode",langCode);*/
		String chartType = request.getParameter("charting"); // by neha for the edit chart by worksheet (chart type)
		if(chartType == null || chartType.equals(""))
		{
			chartType = "0";
		}
		request.getSession().setAttribute("chartType",chartType);
		
		ObjHoro.setKPHorarySeed(Util.safeInt(request.getParameter("kphn")));
		
		String dST = request.getParameter("dst");
		String tz = request.getParameter("timezone");
		if (dST == null || dST.equals(""))
			dST = "0";
		else { 
			if (Integer.parseInt(dST) > 0) {
				tz = tz + Integer.parseInt(dST);
				dST = "0";
			}
		}
		ObjHoro.setDST(dST);
		ObjHoro.setTimeZone(tz);
		
		ObjHoro.initialize();

		
		return ObjHoro;
	}
	
	public DesktopHoro createHoroscopeObject(HttpServletRequest request) throws Exception
	{
		return createHoroscopeObject(request, null);
	}
}
