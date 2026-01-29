package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.ojassoft.astrosagecloud.model.ConnectionService;
import com.ojassoft.astrosagecloud.util.SharedFunction;

/**
 * This method is called when FB/Google signin in clicked from login popup.
 */
@WebServlet("/SocialMediaLoginServlet")
public class SocialMediaLoginServlet extends BaseLoginServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SocialMediaLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * This method performs the following tasks:
	 * 1) After checking the origin of request (i.e. FB or Google), it further sends two more requests, first to get the 
	 * access token, and then to get the user info(email and name) from social platforms.
	 * 2) If the email is not received, then it redirects to home page with an error stating that email is unavailable.
	 * 3) If the user is already logged in, then an error pops up stating the same.
	 * 4) If there is no such erroneous condition, it calls login method from base class to perform related operations.
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		String accessTokenURL = "";
		String userInfoURL = "";  
		String url = request.getRequestURL().toString();
		try
		{
			ConnectionService connService = new ConnectionService();
			if(url.endsWith(SharedFunction.getLastUriFromQueryString(ConnectionService.FB_REDIRECT_URI)))
			{
				accessTokenURL = connService.URL_FB_ACCESS_TOKEN+code;
				String accessToken = connService.invokeURLRetrieveData(accessTokenURL, null, "access_token");
				userInfoURL = connService.URL_FB_USER_INFO+accessToken;
				regSource = "Web-FB";
			}
			else
			{
				accessTokenURL = connService.URL_GOOGLE_ACCESS_TOKEN;
				String urlParams = "code="
					+ code
	                + "&client_id=" + ConnectionService.GOOGLE_CLIENT_ID
	                + "&client_secret=" + ConnectionService.GOOGLE_CLIENT_SECRET
	                + "&redirect_uri=" + ConnectionService.GOOGLE_REDIRECT_URI
	                + "&grant_type=authorization_code";
				String accessToken = connService.invokeURLRetrieveData(accessTokenURL, urlParams, "access_token");
				userInfoURL = connService.URL_GOOGLE_USER_INFO+accessToken;
				regSource = "Web-Google";
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
		if(email == null || email.isEmpty() || email.equals("Not Available"))
		{
			redirectURL = "/cloud/home.asp?emailunavailable=1";
		}
		else
		{
			//If the user is already logged in, then the user is sent to home page.
			Object obj = request.getSession().getAttribute("User_Id");
			if(obj != null && !obj.equals(""))
			{
				redirectURL = "/cloud/home.asp?msgsignup=1";
			}
			else
			{
				code = "socialmedia";
				try
				{
					JSONObject json = new JSONObject(login(request, response));
					redirectURL = json.getString("msg");
				}
				catch(Exception e)
				{
					
				}
			}
		}
		response.sendRedirect(redirectURL);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
