package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.Constants;
import com.ojassoft.astrosagecloud.DAO.UserDAO;
import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;
import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * This Servlet is used when some task related to Charts need to be done.
 * So newChart, editChart, saveChart, saveChartAndShare - all these operations
 * call this servlet.
 * @author developer
 *
 */
public class ChartServlet extends AstrosageServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		doPost(request, response);
		
	}
	
	/**
	 * Based on the request parameter 'methodName', corresponding method is called.
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			String uri = request.getRequestURI();
			
			initialize(request, response);
			//String methodName = request.getParameter("methodName");
			String methodName = request.getParameter("methodName");
			
			if(methodName != null)
			{
				try
				{
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
			else 
			{
				try
				{
					String qString = request.getParameter("q");
					if(qString != null)
					{
						//request.get
						UserDAO dao = new UserDAO();
						response.getWriter().write(dao.findChartName(qString));
					}
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}
	}
	
	/**
	 * This method returns a json string of chart names which start with the passed in letters.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void openChartAutoComplete(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		Object userIdObj = request.getSession().getAttribute("User_Id");
		if(userIdObj != null)
		{
			String chartName = request.getParameter("q");
			if(chartName == null || chartName.equals(""))
			{
				response.getWriter().write("1");
			}
			else
			{
				UserDAO dao = new UserDAO();
				String jsonString = dao.openChartAutoComplete(userIdObj.toString(), chartName);
				response.getWriter().write(jsonString);
			}
		}
	}
	
	/**
	 * This method returns the chart details corresponding to the passed in chart name.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void getPublicChartDetails(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		Object userIdObj = request.getSession().getAttribute("User_Id");
		if(userIdObj != null)
		{
			String chartName = request.getParameter("chartname");
			if(chartName == null || chartName.equals(""))
			{
				response.getWriter().write("1");
			}
			else
			{
				UserDAO dao = new UserDAO();
				String jsonString = dao.getPublicChartName(chartName);
				response.getWriter().write(jsonString);
			}
		}
	}
	
	/**
	 * This method returns the chart details corresponding to the passed in chartId.
	 * It first checks if the chartId corresponds to the logged in userId.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void getChartDetails(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		Object userIdObj = request.getSession().getAttribute("User_Id");
		if(userIdObj != null)
		{
			String chartId = request.getParameter("Chartid");
			if(chartId == null || chartId.equals(""))
			{
				response.getWriter().write("1");
			}
			else
			{
				UserDAO dao = new UserDAO();
				String jsonString = dao.getChartDetails(chartId);
				response.getWriter().write(jsonString);
			}
		}
		else
		{
			response.getWriter().write("3");
		}
	}
	
	/**
	 * This method returns the saved charts of opposite gender of the loggedIn user.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void getSavedCharts(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		String chart_id = request.getParameter("chartid");
		Object userIdObj = session.getAttribute("User_Id");
		Object horoObj = session.getAttribute("HoroscopeObj");
		if(horoObj != null)
		{
			if(userIdObj != null)
			{
				DesktopHoro horo = (DesktopHoro) horoObj;
				String userId = userIdObj.toString();
				UserDAO dao = new UserDAO();
				response.getWriter().write(dao.getSavedCharts(userId, horo.getMaleFemale(), chart_id));
			}
			else
			{
				response.getWriter().write("3");//Not Login
			}
		}
		else
		{
			response.getWriter().write("2");//session expired
		}
		
		
		response.setContentType("text/html;charset=UTF-8");
        
	}
	
	
	
	/**
	 * This method returns the saved charts of opposite gender of the loggedIn user for Autocomplete.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void getSavedChartsForAutoComplete(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		Object userIdObj = session.getAttribute("User_Id");
		Object horoObj = session.getAttribute("HoroscopeObj");
		if(horoObj != null)
		{
			if(userIdObj != null)
			{			
				
				String chartName = request.getParameter("q");
				if(chartName == null || chartName.equals(""))
				{
					response.getWriter().write("1");
				}
				else
				{
					DesktopHoro horo = (DesktopHoro) horoObj;
					String userId = userIdObj.toString();
					UserDAO dao = new UserDAO();
					response.getWriter().write(dao.getSavedChartsForAutoComplete(userId, horo.getMaleFemale(), chartName));
				}
				
			}
			else
			{
				response.getWriter().write("3");//Not Login
			}
		}
		else
		{
			response.getWriter().write("2");//session expired
		}
		
		
		response.setContentType("text/html;charset=UTF-8");
        
	}
	
	/**
	 * This method is called to mark the current open chart as the default chart of logged in user.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void markDefaultChart(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		Object chartId = session.getAttribute("ChartId"); 
		Object userId = session.getAttribute("User_Id");
		if((userId != null && !userId.equals("")) && (chartId != null && !chartId.equals("")))
		{
			UserDAO dao = new UserDAO();
			response.getWriter().write(dao.markDefaultChart(userId.toString(), chartId.toString()));
		}
		else
		{
			response.getWriter().write("4");
		}
	}
	
	/**
	 * 
	 * This method does the following tasks:
	 * 1) First it checks if it is a new chart, i.e. there is no chartId present, then it directly saves
	 * the chart corresponding to the logged in userId.
	 * 2) If the chartId is present, then it checks if the chartId is corresponding to logged in userId,
	 * If yes, then it proceeds to update the chart. If no, it saves it as a new chart for logged in userId.
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void checkAndSaveChart(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String isSaved = "";
		UserDAO dao = new UserDAO();
		HttpSession session = request.getSession();
		Object chartId = session.getAttribute("ChartId"); 
		
		Object userId = session.getAttribute("User_Id");
		String ChartName =  request.getParameter("hideChartName");
		DesktopHoro horoObj = (DesktopHoro) session.getAttribute("HoroscopeObj");
		
		if(userId != null && !userId.equals(""))
		{
			if(chartId == null || chartId.equals(""))
			{
				HashMap<String, Integer> hm = dao.saveChart(horoObj, userId.toString(), String.valueOf(session.getAttribute("chartType")),ChartName,"Web","", 0, null, false);
				isSaved = String.valueOf(hm.get("SaveChart"));
				if(isSaved.equals("1"))
				{
					request.getSession().setAttribute("ChartId", hm.get("ChartId"));
				}
				
			}
			else
			{
				boolean isMatching = dao.matchinguseridandchartid(userId.toString(), chartId.toString(), null);
				if(isMatching)
				{
					isSaved = dao.updateChart(chartId.toString(), horoObj, userId.toString(), String.valueOf(session.getAttribute("chartType")), ChartName, "", "", 0);
				}
				else 
				{
					HashMap<String, Integer> hm = dao.saveChart(horoObj, userId.toString(), String.valueOf(session.getAttribute("chartType")),ChartName,"Web","", 0, null, false);
					isSaved = String.valueOf(hm.get("SaveChart"));
					if(isSaved.equals("1"))
					{
						request.getSession().setAttribute("ChartId", hm.get("ChartId"));
					}
				}
			}
			response.getWriter().write(isSaved);
		}
	}
	
	public void getTagValue(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		UserDAO dao = new UserDAO();
		response.getWriter().write(dao.getTagValue(request.getParameter("chartid")));
	}
	
	/**
	 * This method does the following tasks:
	 * 1) It checks if the chartId which is to be deleted is the one which is open right now. If yes, it returns
	 * a code '2' indicating that it cannot be deleted.
	 * 2) In the DAO method, it first checks if the chartId to be deleted is corresponding to the logged in userId.
	 * If yes, then only the chart will be deleted, otherwise related code will be returned. 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void deleteChart(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String loggedInUserId = Util.safestr(request.getSession().getAttribute("User_Id"));
		String chartIdToBeDeleted = request.getParameter("deleteChartId");
		Object obj = request.getSession().getAttribute("ChartId");
		if(obj != null && obj.toString().equals(chartIdToBeDeleted))
		{
			response.getWriter().write("2");
		}
		else
		{
			UserDAO dao = new UserDAO();
			response.getWriter().write(dao.deleteChart(chartIdToBeDeleted, loggedInUserId));
		}
	}
	
	/**
	 * This method checks, if the request for opening charts is coming from a reliable domain.
	 * If yes, it proceeds further to load the charts corresponding to the logged in userId.
	 * If chartId is passed in the request, then only one chart is returned, else all the charts corresponding to 
	 * the loggedIn userId are returned.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void loadCharts(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		if(isAllowed(request))
		 {
			UserDAO dao = new UserDAO();
			String userId = request.getParameter("userId");
			String chartId = request.getParameter("ChartId");
			response.setContentType("text/html;charset=UTF-8");
	        response.getWriter().write(dao.openchartdata(userId,chartId,0, (MyProperties)request.getSession().getAttribute("constants")));
		 }
		 else
		 {
			 response.getWriter().write("You are not authorized to view this page");
		 }
	}
	
	/**
	 * This method is called on click of 'Open' in the OpenChart Dialog.
	 * It returns the chart details of the passed in chartId which is corresponding to the logged in userId
	 * and passed it to createsession to set chart details in the session.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void openChart(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String userId = "";
		String chartId = request.getParameter("ChartId");
		String isDhruv = request.getParameter("fromDhruv");
		Object obj = request.getSession().getAttribute("User_Id");
		HttpSession session = request.getSession();
		if(session.getAttribute("User_Id") == null || session.getAttribute("User_Id").equals(""))
		{
			response.sendRedirect("login.asp");
		}
		if(obj != null)
		{
			userId = obj.toString();
		}
		UserDAO dao = new UserDAO();
		HashMap<String, Object> hm = dao.getUserChart(userId,chartId);
		request.getSession().setAttribute("ChartId", chartId);
		DesktopHoro horoObj = (DesktopHoro) hm.get("HoroObject");
		float timeZone = Util.safeFloat(horoObj.getTimeZone());
		if (Integer.parseInt(horoObj.getDST()) > 0) {
			
			timeZone = timeZone + Integer.parseInt(horoObj.getDST());
			horoObj.setDST("0");
			horoObj.setTimeZone(timeZone+"");
			session.setAttribute("isDst","1");
		}
		int langCode = (Integer) request.getSession().getAttribute("languageCode");
		horoObj.setLanguageCode(langCode+"");
		//****************neha
		Constants ObjConst = new Constants();
		//ObjConst.setConstPath(System.getProperty("user.dir")+"/cloud/");
		ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		horoObj.initialize();
		//***************neha
		request.getSession().setAttribute("HoroscopeObj", horoObj);
		request.getSession().removeAttribute("KPObj");
		request.getSession().setAttribute("chartType", hm.get("Charting")); //neha
		/*String rstLst = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies)
		{
			if(cookie.getName().equals("RstLst"))
			{
				String[] cookieValues = cookie.getValue().split("\\|");
				if(cookieValues.length == 5)
				{
					cookieValues[4] = chartId;
					for(String value : cookieValues)
					{
						rstLst += value + "|";
					}
					rstLst = rstLst.substring(0, rstLst.length()-1);
				}
				rstLst = chartId + "|" + cookie.getValue();
				cookie.setValue(rstLst);
				cookie.setMaxAge(1800);
				response.addCookie(cookie);
				break;
			}
		}
		if(rstLst.equals(""))
		{
			rstLst = chartId;
			Cookie newCookie = new Cookie("RstLst", rstLst);
			newCookie.setMaxAge(1800);
			response.addCookie(newCookie);
		}*/
		String rstLst = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies)
		{
			if(cookie.getName().equals("RstLst"))
			{
				String[] rstKeys = cookie.getValue().split("\\|");
				if(rstKeys.length == 5)
					rstKeys[4] = null;
				for(String key : rstKeys)
				{
					if(key != null && !chartId.equals(key))
					{
						rstLst += key+"|";
					}
				}
				break;
			}
		}
		
		rstLst = chartId + "|"+rstLst;
		Cookie rsCookie = new Cookie("RstLst", rstLst);   
		rsCookie.setMaxAge(1800);
		response.addCookie(rsCookie);
		
		request.getSession().setAttribute("IsSaved", 0);
		if(!"1".equals(isDhruv)){
		request.getRequestDispatcher("/cloud/createsession-jsp.asp").forward(request, response);
		}else{
			
		request.getRequestDispatcher("/dhruv/createsession.jsp").forward(request, response);
		}
	}
	
	/**
	 * This method is called from the EditChart Page on click of 'Done and Save'.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void editChartDoneAndSave(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		if(isAllowed(request))
		{
			request.setAttribute("doneandsave", "1");
			editChartDone(request, response);
		}
		else
		{
			Local local = new Local();
			int langCode = (Integer) request.getSession().getAttribute("languageCode");
			MyResourceBundle rBConstants = local.loadPropertiesFileNew("constants", langCode);
			String msg=rBConstants.getString("UNKNOWN_ERROR_PLEASE_TRY_AGAIN");
			response.sendRedirect("usermessage.asp?msgval=0&msg="+URLEncoder.encode(msg, "UTF-8"));
		}
		
	}
	
	/**
	 * This method is called from EditChart Page on click of 'Done' button.
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void editChartDone(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HttpSession session = request.getSession();
		DesktopHoro horoObj = (DesktopHoro) session.getAttribute("HoroscopeObj");
		
		if(horoObj == null)
		{
			request.getRequestDispatcher("/cloud/home.asp").forward(request, response);
		}
		String chartId = request.getParameter("chartid");
		if(chartId != null && !chartId.isEmpty())
		{
			session.setAttribute("ChartId", chartId);
		}
		Object doneSave = request.getAttribute("doneandsave");
		String Ischartupdate = "";
		if(doneSave == null || doneSave.toString().isEmpty())
		{
			Ischartupdate = "1";
			session.setAttribute("IsSaved", "1");
		}
		session.setAttribute("isDST", 0);
		String dst = request.getParameter("dst");
		String timezone = request.getParameter("timezone");
		if(dst != null && !dst.equals(""))
		{
			int dstInt = Integer.parseInt(dst);
			if(dstInt > 0)
			{
				timezone = timezone + dstInt;
				dst = "0";
				session.setAttribute("isDST", "1");
			}
		}
		else
		{
			dst = "0";
		}
		Local local = new Local();
		int langCode = (Integer) request.getSession().getAttribute("languageCode");
		MyResourceBundle editChartSessionConst = local.loadPropertiesFileNew("editchart-session", langCode);
		MyResourceBundle rBConstants = local.loadPropertiesFileNew("constants", langCode);
		Object userId = session.getAttribute("User_Id");
		DesktopHoro horoObject = null;
		if(userId != null && !userId.equals(""))
		{
			CloudServlet cloudServlet = new CloudServlet();
			horoObject = cloudServlet.createHoroscopeObject(request, getServletContext());
			if(Ischartupdate.equals(""))
			{
				session.setAttribute("IsSaved", "0");
				UserDAO userDAO = new UserDAO();
				Ischartupdate = userDAO.editSaveChart(horoObject, userId.toString(), request.getParameter("charting"), chartId, "", ConstantValues.KEY_VAL_WEB, "", 0, null, false);
			}
		}
		//Check if this is to be set only in session (Done button has been clicked)
		//In that case, we should not check for userId being null.
		else if(!Ischartupdate.equals("1"))
		{
			Ischartupdate = "2";
		}
		if(Ischartupdate.equals("1"))
		{
			request.getSession().setAttribute("HoroscopeObj",horoObject);
			request.getSession().removeAttribute("KPObj");
			request.getRequestDispatcher("createsession-jsp.asp").forward(request, response);
			//System.out.println(session.getAttribute("ChartId")+"neha5");
			
		}
		 else if(Ischartupdate.equals("0"))
		{
			String msg=editChartSessionConst.getString("USER_ID_DOES_NOT_MATCH_WITH_CURRENT_CHART_PLEASE_TRY_AGAIN");
			response.sendRedirect("usermessage.asp?msgval=0&msg="+URLEncoder.encode(msg, "UTF-8"));
		}
		else if(Ischartupdate.equals("2"))
		{
			String msg=editChartSessionConst.getString("YOU_ARE_NOT_LOGGED_IN") + " "+ editChartSessionConst.getString("PLEASE_LOGIN_BEFORE_SAVING_CHART");
			response.sendRedirect("usermessage.asp?msgval=0&msg="+URLEncoder.encode(msg, "UTF-8"));
		}
		else
		{
			String msg=rBConstants.getString("UNKNOWN_ERROR_PLEASE_TRY_AGAIN");
			response.sendRedirect("usermessage.asp?msgval=0&msg="+URLEncoder.encode(msg, "UTF-8"));
		}
		
	}
	/**This method is called from worksheet by new chart option on click DONE.
	 * .
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void newChartDone(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		commonChart(request);
		String Isnewchartsave = "1";
		request.getSession().setAttribute("IsSaved", 1);
		request.getSession().removeAttribute("HoroscopeObj");
		request.getSession().removeAttribute("KPObj");
		doTheRestBaby(Isnewchartsave, request, response, null);
	}
	/**This method is called from worksheet by new chart option on click Done And Save.
	 * .
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void newChartDoneAndSave(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		commonChart(request);
		HttpSession session = request.getSession();
		Object userId = session.getAttribute("User_Id");
		if(userId != null && !userId.equals(""))
		{
			session.setAttribute("IsSaved", "0");
			UserDAO userDAO = new UserDAO();
			CloudServlet cloudServlet = new CloudServlet();
			DesktopHoro horoObject = cloudServlet.createHoroscopeObject(request, getServletContext());
			HashMap<String, Integer> hm = userDAO.saveChart(horoObject, userId.toString(), request.getParameter("charting"), "", ConstantValues.KEY_VAL_WEB, "", 0, null, false);
			
			session.setAttribute("ChartId", hm.get("ChartId"));
			String Isnewchartsave = hm.get("SaveChart").toString();
			doTheRestBaby(Isnewchartsave, request, response, horoObject);
		}
		
	}
	/**This method is called from main menu option new chart or from icon new chart to open a new chart page.
	 * .
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void newChart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		HttpSession session = request.getSession();
		session.setAttribute("chartType", "0");
		session.setAttribute("ChartId", "");
		String isDhruv = request.getParameter("fromDhruv"); //Neha
		String referrer = request.getParameter("referrer"); //Neha
	
		if((session.getAttribute("User_Id") == null || session.getAttribute("User_Id").equals("")) 
				&& (session.getAttribute("LoginUser") == null || session.getAttribute("LoginUser").equals("")))
		{
			response.sendRedirect("login.asp");
		}
		else
		{
			request.setAttribute("includeFile", "new_newchart.jsp");
			//Neha
			if(!"1".equals(isDhruv)){
			request.getRequestDispatcher("/cloud/content-template.jsp").forward(request, response);}
			else{
			session.setAttribute("dhruvNewKundli", "1");
			response.sendRedirect(referrer);
			}
			session.setAttribute("ChartId", session.getAttribute("ChartId"));
		}
	}
	/**This method is called inside newChartDone and newChartDoneAndSave methods to check weather user is permit or not to save or update chart.
	 * .
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void doTheRestBaby(String Isnewchartsave, HttpServletRequest request, HttpServletResponse response, DesktopHoro horoObject) throws Exception
	{
		
		if(Isnewchartsave.equals("1"))
		{
			if(horoObject != null)
			{
				request.getSession().setAttribute("HoroscopeObj",horoObject);
				request.getSession().removeAttribute("KPObj");
			}
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			request.getRequestDispatcher("createsession-jsp.asp").forward(request, response);
		}
		else 
		{
			String str = request.getParameter("catchupgrade");
			Local local = new Local();
			int langCode = (Integer) request.getSession().getAttribute("languageCode");
			MyResourceBundle rBConstants = local.loadPropertiesFileNew("constants", langCode);
			MyResourceBundle sessionConst = local.loadPropertiesFileNew("newchartsession",langCode);
			
			if((Isnewchartsave.equals("2") || Isnewchartsave.equals("-2")))
			{
				if(str == null || str.equals(""))
				{
					String msg=rBConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN"); 
					response.sendRedirect("usermessage.asp?msgval=0&msg="+URLEncoder.encode(msg, "UTF-8"));
				}
				else if(!str.equals(""))
				{
					response.sendRedirect("/cloud/worksheet/?upgrade=1");
				}
			}
			else if((Isnewchartsave.equals("3") || Isnewchartsave.equals("-3")))
			{
				if(str == null || str.equals(""))
				{
					String msg=rBConstants.getString("YOU_CAN_NOT_SAVE_500_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN");
					response.sendRedirect("usermessage.asp?msgval=0&msg="+URLEncoder.encode(msg, "UTF-8"));
				}
				else if(!str.equals(""))
				{
					response.sendRedirect("/cloud/worksheet/?upgrade=1");
				}
			}
			else
			{
				String msg=sessionConst.getString("UNKNOWN_ERROR_ENCOUNTERED_IN_SAVING_CHART_PLEASE_TRY_AGAIN");    
				response.sendRedirect("usermessage.asp?msgval=1&msg="+URLEncoder.encode(msg, "UTF-8"));
			}
		}
	}
	/**This method is called inside newChartDone and newChartDoneAndSave methods to set value of session.setAttribute("isDST") 0 or 1;.
	 * .
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private void commonChart(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.setAttribute("ChartId", "");
		session.setAttribute("isDST", 0);
		String dst = request.getParameter("dst");
		String timezone = request.getParameter("timezone");
			    //isnewchartdoneandsave=0
		if(dst != null && !dst.equals(""))
		{
			int dstInt = Integer.parseInt(dst);
			if(dstInt > 0)
			{
				timezone = timezone + dstInt;
				dst = "0";
				session.setAttribute("isDST", "1");
			}
		}
		else
		{
			dst = "0";
		}
	}
	public void createsessionOfMatchmaking(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.getSession().removeAttribute("HoroscopeObj");
		request.getSession().removeAttribute("KPObj");
		request.getRequestDispatcher("/cloud/createsession-jsp.asp").forward(request, response);
		
	}	   
}
