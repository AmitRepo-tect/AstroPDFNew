package com.ojassoft.astrosagecloud;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.DO.InPlanetKpCusp;
import com.ojassoft.astrosagecloud.util.KCILUtil;
import com.ojassoft.astrosagecloud.util.Util;

public class KCILServlet extends AstrosageServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		String forwardTo = "/cloud/home.asp";
		String uri = request.getRequestURI();
		String str = uri.substring(7, uri.indexOf(".asp")+4);
		try
		{
			HttpSession session = request.getSession();
			DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj");
			InPlanetKpCusp inPlanetCusp = null;
			Object kpObj = session.getAttribute("KPObj");
			if(kpObj != null)
			{
				inPlanetCusp = (InPlanetKpCusp) kpObj;
				forwardTo = "/kcilp/"+str;
			}
			else if(myAstrologyObject != null)
			{
			
				String params = Util.getParamsFromHoroscopeObject(myAstrologyObject);
				String url = "http://akxml.astrosage.com/freekphorary/chartxmlv2.asp?"+params;
			
				
				    URL obj = new URL(url);
				    HttpURLConnection con = (HttpURLConnection) obj.openConnection();
				    String responseString = "";
				    con.setRequestMethod("GET");
				    int responseCode = con.getResponseCode();
				    if(responseCode==200){
					   BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF8"));
					   String inputLine;
					   StringBuffer responseTxt = new StringBuffer();
				   
					    while ((inputLine = in.readLine()) != null) {
					   		responseTxt.append(inputLine);
					   	}
				   		in.close();
				   		responseString = responseTxt.toString();
				   }
				    if(responseString == null || responseString.isEmpty())
				    {
				    	System.out.println("ResponseString received empty. URL is : "+url);
				    }
				    else
				    {
				    	inPlanetCusp = KCILUtil.initValuesForMyKundli(responseString);
				    	session.setAttribute("KPObj", inPlanetCusp);
				    	forwardTo = "/kcilp/"+str;
				    }
				
		    	
			}
			request.getRequestDispatcher(forwardTo).forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
}
