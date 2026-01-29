<%@page import="com.ojassoft.astrosagecloud.util.WebKeys"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>

<%-- 
Generally we come to this file after login.asp or i_login.asp (inside control)
Also we come here from CloudServlet when there is no session but cookies are present
--%>

<%
	String redirectUrl = "";
	UserDAO UI = new UserDAO();

	String planid = "", uidCookie = "", pwdCookie = "", CrSession = "";
	String submitval = request.getParameter("submit"); //to avoid directly hitting this page, previous form must be submitted
	if (Util.safestr(submitval) != "" || Util.safestr(submitval) != null) {
		String uid = Util.safestr(request.getParameter("txtUserID")).trim();
		String pwd = Util.safestr(request.getParameter("txtPassword")).trim();
		String refferurl = Util.safestr(request.getParameter("refferurl")).trim();
		// savedcookiesvalues is variable to save userid and password in cookie for future auto-login
		String savedcookiesvalues = "1";//Util.safestr(request.getParameter("Staysignedin")).trim();
		//out.println(savedcookiesvalues+"neha");
		HashMap<String, String> getRecord = UI.getRecordOfUserWithPassword(uid, pwd, null);
		//out.println(getRecord.get("result"));
		if (getRecord.get("result").equals("1")) {
			killCookie(WebKeys.COOKIE_UID, response);
			killCookie(WebKeys.COOKIE_PWD, response);
			redirectUrl = "login.asp?msg=0";
			//out.println("login");
		} else if (getRecord.get("result").equals("2")) {
			request.getSession().setAttribute("User_Id", uid);
			//out.println("activation");
			// response.sendRedirect ("/freechart/activation-problem.asp");
			//redirectUrl = "http://www.astrosage.com/freechart/activation-problem.asp";
			redirectUrl = "activation-problem.asp";
		} else {
			request.getSession().setAttribute("UserExists", "true");
			request.getSession().setAttribute("User_Id", uid);
			planid = UI.getPlanId(uid);
			//out.println(planid + "," + uid);
			if (planid.equals("0")) {
				request.getSession().setAttribute("planid", "");
			} else {
				request.getSession().setAttribute("planid", planid);
			}

			Cookie[] cookieObj = null;
			cookieObj = request.getCookies();

			for (int cookieCount = 0; cookieCount < cookieObj.length; cookieCount++) {
				if (cookieObj[cookieCount].getName()
						.compareToIgnoreCase("UserId") == ConstantValues.COOKIES_FOUND) {
					uidCookie = cookieObj[cookieCount].getValue();
					//out.println(uidCookie+"cookiesuid");
				}
				if (cookieObj[cookieCount].getName()
						.compareToIgnoreCase("Password") == ConstantValues.COOKIES_FOUND) {
					pwdCookie = cookieObj[cookieCount].getValue();
					//out.println(pwdCookie+"cookiespass");
				}
			}
		}
		//activated found in user database
		if (redirectUrl.equals("")) {
			//set cookie for the user
			if (uidCookie.equals(ConstantValues.BLANK_VALUE) && pwdCookie.equals(ConstantValues.BLANK_VALUE)
					&& savedcookiesvalues.equals("1")) {
				Cookie userId = new Cookie(WebKeys.COOKIE_UID, uid);
				Cookie password = new Cookie(WebKeys.COOKIE_PWD, pwd);
				userId.setMaxAge(365 * 24 * 60 * 60); //setting cookies expiry for one year
				userId.setPath("/");
				//userId.setDomain("localhost:8080");
				userId.setDomain(WebKeys.COOKIE_DOMAIN);
				password.setMaxAge(365 * 24 * 60 * 60); //setting cookies expiry for one year
				password.setPath("/");
				password.setDomain(WebKeys.COOKIE_DOMAIN);
				//password.setDomain("localhost:8080");
				response.addCookie(userId);
				response.addCookie(password);
			}
			
			if (session.getAttribute("HoroscopeObj") == "" || session.getAttribute("HoroscopeObj") == null) {
				redirectUrl = "defaultchartlogin.asp?methodName=fromJSP";
			} 
			else //when kundli is already made 
			{
				if (refferurl.equals("") && getRecord.get("result").equals("0")) {
					//******************Neha***********************************************
					// request.getSession().setAttribute("chartid",CrSession);
					request.getSession().setAttribute("profile_name", getRecord.get("firstname"));
					request.getSession().setAttribute("profile_email", getRecord.get("email"));
					//session("profile_name") = getRecord.get("firstname");
					//session("profile_email") = getRecord.get("email");
					redirectUrl = "activation-page.asp";
					//Response.Redirect("activation-page.asp?name="&RsLogin("firstname")&"&email="&RsLogin("email"))
					//************************************************************************
				} else if (refferurl.equals("")) {
					CrSession = SetSessionChartId(String.valueOf(session.getAttribute("User_Id")),
							String.valueOf(session.getAttribute("chartid")), UI);
					request.getSession().setAttribute("chartid", CrSession);
					redirectUrl = "home.asp";
				} 
				else 
				{
					CrSession = SetSessionChartId(String.valueOf(session.getAttribute("User_Id")),
							String.valueOf(session.getAttribute("chartid")), UI);
					request.getSession().setAttribute("chartid", CrSession);
					//SetSessionChartId session("UserId"), session("chartid")
					redirectUrl = refferurl;
				}
			}
		}

	}
	response.sendRedirect(redirectUrl);
%>

<%!
	public void killCookie(String cookieName, HttpServletResponse response) {
		Cookie killMyCookie = new Cookie(cookieName, null);
		killMyCookie.setDomain(WebKeys.COOKIE_DOMAIN);
		killMyCookie.setMaxAge(0);
		killMyCookie.setPath("/");
		response.addCookie(killMyCookie);

	}
	
	//this method matches chart id with user id and returns chart id if chart is of supplied user
	public String SetSessionChartId(String userid, String chartid, UserDAO UI) {
		String result = "";
		if (!userid.equals("") && !chartid.equals("")) {
			if (UI.matchinguseridandchartid(userid, chartid, null)) {
				//result = "";
				result = chartid; // interchanged to match ASP
			} else {
				//result = chartid;
				result = ""; // interchanged to match ASP
			}
		} else {
			//session("chartid") = ""
			result = "";
		}

		return result;
	}
%>