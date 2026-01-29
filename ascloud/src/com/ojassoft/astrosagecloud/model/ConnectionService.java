package com.ojassoft.astrosagecloud.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.json.JSONObject;

public class ConnectionService 
{
	
	//All FB IDs and URLs
	//Local - public static final String FB_APP_ID = "501624204081669";
	//Local - public static final String FB_APP_SECRET = "474e7b8ea9cc507e4b1e328e56ec289d";
	public static final String FB_APP_ID = getValue("FBClientId");
	public static final String FB_APP_SECRET = getValue("FBClientKey");
	//public static final String FB_APP_ID = "213654749671068";
	//public static final String FB_APP_SECRET = "e24c5282d2cbf453ecc2b7a95ec7847d";
	public static String FB_REDIRECT_URI = getValue("FBCallbackURL");
	
	public static final String URL_FB_AUTH = "http://www.facebook.com/dialog/oauth?client_id="
											 + FB_APP_ID + "&redirect_uri="
											 + FB_REDIRECT_URI+"&scope=email&auth_type=rerequest";
	public String URL_FB_ACCESS_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id="
										+ FB_APP_ID + "&redirect_uri="+FB_REDIRECT_URI+"&client_secret="
										+ FB_APP_SECRET + "&code=";
	public String URL_FB_USER_INFO = "https://graph.facebook.com/v2.9/me?fields=email,name&access_token=";
	
	//Astrosage FB URLs
	// -- Start --
	public static final String ASTRO_FB_APP_ID = getValue("FBClientId");
	public static final String ASTRO_FB_APP_SECRET = getValue("FBClientKey");
	public static String ASTRO_FB_REDIRECT_URI = "https://www.astrosage.com/astrologin/astrofbhome";
	public static final String URL_ASTRO_FB_AUTH = "http://www.facebook.com/dialog/oauth?client_id="
			 + ASTRO_FB_APP_ID + "&redirect_uri="
			 + ASTRO_FB_REDIRECT_URI+"&scope=email&auth_type=rerequest";
	public String URL_ASTRO_FB_ACCESS_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id="
		+ ASTRO_FB_APP_ID + "&redirect_uri="+ASTRO_FB_REDIRECT_URI+"&client_secret="
		+ ASTRO_FB_APP_SECRET + "&code=";
	
	// -- End ----
	//All Google IDs and URLs
	//WorkingLocal -public static final String GOOGLE_CLIENT_ID = "41737015694-u76n6hnefk07qvt87cnqurfl8vdiuqij.apps.googleusercontent.com";
	//WorkingLocal -public static final String GOOGLE_CLIENT_SECRET = "goDfbm3Si8ysg2Vf2eXduXXp";
	public static final String GOOGLE_CLIENT_ID = getValue("GoogleClientId");
	public static final String GOOGLE_CLIENT_SECRET = getValue("GoogleClientKey");
	//public static final String GOOGLE_CLIENT_ID = "41737015694-ivcmvs23il5lllsho8lp4usf7hp4u4kv.apps.googleusercontent.com";
	//public static final String GOOGLE_CLIENT_SECRET = "053e1X6xk0vxTRel_dwhYBdQ";
	
	public static String GOOGLE_REDIRECT_URI = getValue("GoogleCallbackURL");
	
	//public static final String GOOGLE_REDIRECT_URI = "http://localhost:8081/astrologin/googlehome";
	public static final String URL_GOOGLE_AUTH = "https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri="
									+GOOGLE_REDIRECT_URI+"&response_type=code&client_id="+GOOGLE_CLIENT_ID
									+"&approval_prompt=force";
	public String URL_GOOGLE_ACCESS_TOKEN = "https://accounts.google.com/o/oauth2/token";
	public String URL_GOOGLE_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	
	//public static String URL_GOOGLE_USER_INFO = "https://www.googleapis.com/plus/v1/people/me";
	//Astrosage Google URLs
	// -- Start --
	public static final String ASTRO_GOOGLE_CLIENT_ID = getValue("GoogleClientId");
	public static final String ASTRO_GOOGLE_CLIENT_SECRET = getValue("GoogleClientKey");
	public static String ASTRO_GOOGLE_REDIRECT_URI = "https://www.astrosage.com/astrologin/astrogooglehome";
	public static final String URL_ASTRO_GOOGLE_AUTH = "https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri="
			+ASTRO_GOOGLE_REDIRECT_URI+"&response_type=code&client_id="+ASTRO_GOOGLE_CLIENT_ID
			+"&approval_prompt=force";
	// -- End ----
	public String invokeURLRetrieveData(String url, String urlParams, String key) 
	{
		Map<String, String> hm = new HashMap<String, String>();
		if(key == null || key.equals(""))
		{
			key = "UNKNOWN";
			hm.put("UNKNOWN", "");
		}
		else
		{
			hm.put(key, "");
		}
		hm = invokeURLRetrieveData(url, urlParams, hm);
		
		return hm.get(key);
	}
	
	public Map<String, String> invokeURLRetrieveData(String url, String urlParams, Map<String, String> map)
	{
		String outputString = "";
		String value = "";
		try {
			URL urlLink = new URL(url);
			URLConnection urlConn = urlLink.openConnection();
			urlConn.addRequestProperty("User-Agent", "Mozilla");
			//if the parameters have to be posted
			if(urlParams != null && !urlParams.isEmpty())
			{
				urlConn.setDoOutput(true);
				OutputStreamWriter writer = new OutputStreamWriter(
				urlConn.getOutputStream());
				writer.write(urlParams);
				writer.flush();
			} 
			BufferedReader reader = new BufferedReader(new InputStreamReader(
	                urlConn.getInputStream(), "UTF-8"));
			String line = "";
	        while ((line = reader.readLine()) != null) {
	            outputString += line;
	        }
	        //System.out.println("Json : SMRITI : "+outputString);
		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new RuntimeException("Invalid URL " + url);
		} catch(IOException e)
		{
			e.printStackTrace();
		}
		try
		{
			if(map.get("UNKNOWN") != null)
			{
				map.put("UNKNOWN", outputString);
			}
			else
			{
				JSONObject json = new JSONObject(outputString);
				for (Map.Entry<String,String> entry : map.entrySet()) 
				{
					try
					{
						map.put(entry.getKey(), json.get(entry.getKey()).toString());
					}
					catch(Exception e)
					{
						map.put(entry.getKey(), "Not Available");
						//e.printStackTrace();
					}
				}
			}
		}
		catch(Exception e)
		{
			throw new RuntimeException("ERROR: Invalid Json"+outputString);
		}
		return map;
	}
	
	
	public static String getValue(String key) 
	{
		String val = "NotFound";
		try
		{
			Context initCtx = new InitialContext();
			Context envContext = (Context ) initCtx.lookup("java:comp/env");
			val = envContext.lookup(key).toString();
		}
		catch(NamingException ne)
		{
			ne.printStackTrace();
		}
		return val;
	}
}
