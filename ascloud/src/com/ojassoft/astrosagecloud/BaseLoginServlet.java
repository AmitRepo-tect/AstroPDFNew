package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ojassoft.apilogic.service.LoginService;
import com.ojassoft.astrosagecloud.DAO.UserDAO;
import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.I_RandomNo;
import com.ojassoft.astrosagecloud.util.I_SendMail;
import com.ojassoft.astrosagecloud.util.WebKeys;
import com.ojassoft.astrosagecloud.util.SharedFunction;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * This is a base login class extended by LoginServlet and SocialMediaLoginServlet.
 */
@WebServlet("/BaseLoginServlet")
public class BaseLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String code = "";
	String name = "";
	String email = "";
	String userid = "";
	String password = "";
	String regSource = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaseLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		code = request.getParameter("code");
		
		if (code == null || code.equals("")) {
			throw new RuntimeException(
					"ERROR: Didn't get code parameter in callback.");
		}
		email = request.getParameter("email");
		password = request.getParameter("password");
		name = request.getParameter("uname");
		
		
		
	}
	
	/**
	 * This method sets the cookies (username and password).
	 * @param response
	 */
	public void setCookies(HttpServletResponse response)
	{
		try
		{
			userid = URLEncoder.encode(userid, "UTF-8");
			password = URLEncoder.encode(password, "UTF-8");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		Cookie userId = new Cookie(WebKeys.COOKIE_UID,userid);
		Cookie passwordCookie = new Cookie(WebKeys.COOKIE_PWD,password);
		userId.setMaxAge(365*24*60*60);    //setting cookies expiry for one year
		userId.setPath("/");
		userId.setDomain(WebKeys.COOKIE_DOMAIN);
		passwordCookie.setMaxAge(365*24*60*60);  //setting cookies expiry for one year
		passwordCookie.setPath("/");
		passwordCookie.setDomain(WebKeys.COOKIE_DOMAIN);
		response.addCookie(userId);
		response.addCookie(passwordCookie);   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * This method performs following tasks:
	 * 1) Call the login/signup method from the bean.
	 * 2) Check the status, if erroneous, then set the message accordingly.
	 * 3) If successful - 
	 * 	a) If the user did not get created, send to signup page. (Likely to be removed).
	 *  b) If the User exists, then forward to default login process.
	 *  c) If the User status is inactive, send to activation page.
	 *  d) If the user is created anew, send to new chart page to enter birth details.
	 * 4) This method returns a json String with status and a message field. If there is error, the message
	 * field has corresponding message, otherwise it contains the redirectURL.
	 * @param request
	 * @param response
	 * @return a jsonString with status and message / redirectURL.
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		String returnStr = "";
				
		String redirectURL = "";
		LoginService bean = new LoginService();
		Map<String, String> hm = bean.startSigninSignup(email, password, name, code, regSource);
		
		
		String status = hm.get("STATUS");
		if(status.equals(ConstantValues.PASSWORDS_DO_NOT_MATCH))
		{
			returnStr = "{\"status\":\"error\", \"msg\":\"Password does not match with the provided Email Id.\"}"; // Indicates Wrong Password
		}
		else if(status.equals(ConstantValues.EMAIL_EXISTS_PASSWORD_NOT_MATCH))
		{
			returnStr = "{\"status\":\"error\", \"msg\":\"User exists but the provided password does not match with the Email Id.\"}"; // Indicates Wrong Password
		}
		else if(status.equals(ConstantValues.EMAIL_ID_DOES_NOT_EXIST))
		{
			returnStr = "{\"status\":\"error\", \"msg\":\"No user found with this Email Id.\"}"; // Indicates Wrong Email 
		}
		else if(status.equals(ConstantValues.USER_UNDEFINED)) // Indicates that the user neither exists and nor could get created.
		{
			returnStr = "{\"status\":\"error\", \"msg\":\"User could not be created.\"}"; // User could not be created.
			
		}
		else 
		{
			if(status.equals(ConstantValues.USER_UNDEFINED)) // Indicates that the user neither exists and nor could get created.
			{
				redirectURL = "/cloud/signup.asp?msgsignup=1";
				
			}
			else if(status.equals(ConstantValues.EMAIL_ALREADY_EXIST)) // Indicates that the user already exists.
			{
				//If there already is a session for a user from external domains, then
				//the session is not cleared, and default chart is not opened.
				//Rather the existing HoroscopeObj should remain displayed.
				if(session.getAttribute("HoroscopeObj") == null)
				{
					redirectURL = "/cloud/defaultchartlogin.asp?methodName=fromJSP";
				}
				else
				{
					redirectURL = "/cloud/home.asp";
				}
			}
			else if(status.equals(ConstantValues.USER_CREATED_INACTIVE) || status.equals(ConstantValues.EMAIL_EXISTS_INACTIVE)) // Indicates that the user has been created anew.
			{
				//This code will be moved to LoginService in APIService project and will be optimized.
				I_SendMail send = new I_SendMail();
				String ip = request.getRemoteAddr();
                ip = ip.replace(".", "");
                I_RandomNo random = new I_RandomNo();
                String regcode = ip + random.generateRandomNo();
                UserDAO dao = new UserDAO();
                dao.updateUserEmailId(email, hm.get("USER_ID"), regcode);
				String subject = "Just one more step to get started on AstroSage";
                String msg = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=https://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(hm.get("USER_ID")) + "&rgcode=" + regcode + ">https://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(hm.get("USER_ID")) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
                
                send.sendMail(email,subject, msg,"","","","","");
                // 
				redirectURL = "/cloud/activation-page.asp";//Activate the newly created user.
			}
			else if(status.equals(ConstantValues.USER_CREATED_ACTIVE)) // Indicates that the user has been created anew.
			{
				redirectURL = "/cloud/session-destroy-for-newchart.asp?methodName=newChart";//Redirect to Create chart.
			}
			userid = hm.get("USER_ID");
			password = hm.get("PASSWORD");
			setCookies(response);
			session.setAttribute("UserExists","true");
			session.setAttribute("User_Id",hm.get("USER_ID"));
			session.setAttribute("LoginUser",hm.get("USER_ID"));
			session.setAttribute("planid",hm.get("PLAN_ID"));
			
						
			//response.sendRedirect(redirectURL);
			returnStr = "{\"status\":\"success\", \"msg\":\""+redirectURL+"\"}";
	
		}
		return returnStr;
	}
	
	/**
	 * This method validates the email and password passed in for signup operation.
	 * @param opName
	 * @param email
	 * @param pwd
	 * @return String message indicating the error or a blank in case of no error.
	 */
	public String validateData(String opName)
	{
		String message = "";
		if(email == null || email.isEmpty())
		{
			message = "Please enter Email Id.";
		}
		else if(password == null || password.isEmpty())
		{
			message = "Please enter Password.";
		}
		if(message.equals("") && opName.equals("signup"))
		{
			boolean isEmailValid = Util.isValidEmail(email);
			if(!isEmailValid)
			{
				message = "Please enter valid Email Id.";
			}
			else
			{
				if(password.length() < 8)
				{
					message = "Password should have minimum length 8.";
				}
			}
		}
		
		return message;
	}
	
	/**
	 * This method verifies that the reqest is coming from a verified domain.
	 * @param request
	 * @return true- if request is from verified domain, else false.
	 * @throws MalformedURLException
	 */
	public boolean domainCheck(HttpServletRequest request) throws MalformedURLException
	{
		boolean isAllowed = false;
	
		String referer = request.getHeader("Referer");
		if(referer != null && !referer.isEmpty())
		{
			URL url = new URL(referer);
			String hostName = url.getHost();
			
			if(Arrays.asList(ConstantValues.allowedDomains).contains(hostName))
			{
				isAllowed = true;
			}
		}
		return isAllowed;
	}
}
