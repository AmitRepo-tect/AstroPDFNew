package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.ojassoft.astrosagecloud.model.ConnectionService;
import com.ojassoft.apilogic.service.LoginService;
import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.SharedFunction;
import com.ojassoft.astrosagecloud.util.Util;


/**
 * This Servlet is invoked in case of Login/Signup from login popup (from ascloud as well as external domains)
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends BaseLoginServlet {
	private static final long serialVersionUID = 1L;
	//private String code="";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * This method performs following tasks:
	 * 1) Checks if the request is coming from authorized domain.
	 * 2) Validate the data (email, username, password).
	 * 3) If it is a cross domain request, then the response is prefixed with callback method.
	 * 4) login method is called from the base class in order to perform related operations.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		String message = "";
		String prefix = "";
		String suffix = "";
		
		boolean isAllowedDomain = domainCheck(request);
		if(isAllowedDomain)
		{
			if(code.equals("login") || code.equals("signup"))
			{
				regSource = "Web";
				message = validateData(code);
				String crossDomainRequest = request.getParameter("fromastrosage");
				if(crossDomainRequest != null && crossDomainRequest.equals("1"))
				{
					prefix = "myCallback(";
					suffix = ");";
				}
			}
			else
			{
				message = "Not a valid operation.";
			}
		}
		else
		{
			message = "You are not authorized to view this.";
		}
		if(message.equals(""))
		{
			response.getWriter().print(prefix+login(request, response)+suffix);
		}
		else
		{
			response.getWriter().print(prefix+"{\"status\":\"error\", \"msg\":\""+message+"\"}"+suffix);
		}
	}

	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}
