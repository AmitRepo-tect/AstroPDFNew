package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.ojassoft.astrosagecloud.model.ConnectionService;

import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.I_RandomNo;
import com.ojassoft.astrosagecloud.util.I_SendMail;
import com.ojassoft.astrosagecloud.util.SharedFunction;


/**
 * Servlet implementation class AstrosageLoginServlet
 */
@WebServlet("/AstrosageLoginServlet")
public class AstrosageLoginServlet extends BaseLoginServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AstrosageLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		super.doGet(request, response);
		String url = request.getRequestURL().toString();
				
		String accessTokenURL = "";
		String userInfoURL = "";  
		try
		{
			ConnectionService connService = new ConnectionService();
			if(url.endsWith(SharedFunction.getLastUriFromQueryString(ConnectionService.ASTRO_FB_REDIRECT_URI)))
			{
				accessTokenURL = connService.URL_ASTRO_FB_ACCESS_TOKEN+code;
				String accessToken = connService.invokeURLRetrieveData(accessTokenURL, null, "access_token");
				userInfoURL = connService.URL_FB_USER_INFO+accessToken;
			}
			else
			{
				accessTokenURL = connService.URL_GOOGLE_ACCESS_TOKEN;
				String urlParams = "code="
					+ code
	                + "&client_id=" + ConnectionService.ASTRO_GOOGLE_CLIENT_ID
	                + "&client_secret=" + ConnectionService.ASTRO_GOOGLE_CLIENT_SECRET
	                + "&redirect_uri=" + ConnectionService.ASTRO_GOOGLE_REDIRECT_URI
	                + "&grant_type=authorization_code";
				String accessToken = connService.invokeURLRetrieveData(accessTokenURL, urlParams, "access_token");
				userInfoURL = connService.URL_GOOGLE_USER_INFO+accessToken;
				
			}
			Map<String, String> hmap = new HashMap<String, String>();
			hmap.put("email","");
			hmap.put("name", "");
			hmap = connService.invokeURLRetrieveData(userInfoURL, null, hmap);
			email = hmap.get("email");
			name = hmap.get("uname");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		String redirectURL = "";
			if(email == null || email.isEmpty())
			{
				redirectURL = "//www.astrosage.com/default.asp?emailunavailable=1";
			}
			else
			{
				//If the user is already logged in, then the user is sent to home page.
				Object obj = request.getSession().getAttribute("User_Id");
				if(obj != null && !obj.equals(""))
				{
					redirectURL = "//www.astrosage.com/default.asp?msgsignup=1";
				}
				else
				{
					code = "socialmedia";
					try
					{
						JSONObject json = new JSONObject(this.login(request, response));
						redirectURL = json.getString("msg");
					}
					catch(Exception e)
					{
						
					}
				}
			}
			response.sendRedirect(redirectURL);
	}
	
	public String login(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		String returnStr = "";
				
		String redirectURL = "";
		//LoginService bean = new LoginService();
		Map<String, String> hm = null;//bean.startSigninSignup(email, password, name, code, regSource);
		
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
		else 
		{
			if(status.equals(ConstantValues.USER_UNDEFINED)) // Indicates that the user neither exists and nor could get created.
			{
				redirectURL = "//www.astrosage.com/login.asp?msgsignup=1";
				
			}
			else if(status.equals(ConstantValues.EMAIL_ALREADY_EXIST)) // Indicates that the user already exists.
			{
				redirectURL = "//www.astrosage.com/freechart/loginchk.asp?txtLoginId="+hm.get("USER_ID")+"&txtLoginPassword="+hm.get("PASSWORD");
			}
			else if(status.equals(ConstantValues.USER_CREATED_INACTIVE) || status.equals(ConstantValues.EMAIL_EXISTS_INACTIVE)) // Indicates that the user has been created anew.
			{
				I_SendMail send = new I_SendMail();
				String ip = request.getRemoteAddr();
                ip = ip.replace(".", "");
                I_RandomNo random = new I_RandomNo();
                String regcode = ip + random.generateRandomNo();
                
				String subject = "Just one more step to get started on AstroSage";
                String msg = "Dear Sir/Madam, <br><br>Thank you for registering at AstroSage.com. Please click on the link below to activate your account: <br><br><a href=http://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(hm.get("USER_ID")) + "&rgcode=" + regcode + ">http://www.astrosage.com/freechart/reg-activation.asp?userid=" + SharedFunction.encryptstring(hm.get("USER_ID")) + "&rgcode=" + regcode + "</a><br><br><b>Note:</b> If above link doesn't work, copy the above link and paste into the address bar of your browser.<br><br>Thanks with Warm Regards, <br>The AstroSage.com Team";
         
                send.sendMail(email,subject, msg,"","","","","");
               
				redirectURL = "//www.astrosage.com/freechart/activation-problem.asp";//Activate the newly created user.
			}
			else if(status.equals(ConstantValues.USER_CREATED_ACTIVE)) // Indicates that the user has been created anew.
			{
				redirectURL = "//www.astrosage.com/freechart/HoroScopeData.asp";//Redirect to Create chart.
			}
			userid = hm.get("USER_ID").replaceAll("^\"+|\"+$", "");
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
