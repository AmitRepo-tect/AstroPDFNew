/*
Copyright (c) 2020, Ojas Softech Pvt Ltd. All rights reserved.
*/
package com.ojassoft.astrosagecloud.util;

/**
 * @author punit
 * Class having important Web Keys constants
 *
 */
public class WebKeys {
	/*
	public static boolean isDevelopment() {
		   Object o;
		   try {
		      o = (new InitialContext()).lookup("java:comp/env/isDevelopment");
		   }  catch (NamingException e) {
		      o = Boolean.TRUE; // assumes FALSE if the value isn't declared
		   }
		   return o == null ? Boolean.TRUE : (Boolean) o;
		}
	*/
	//public static final String COOKIE_DOMAIN = ".astrosage.com";
	public static final String COOKIE_DOMAIN = "localhost";
	public static final String COOKIE_UID = "uidCookie";
	public static final String COOKIE_PWD = "pwdCookie";

	// use for saving chart, so that we can update chart in DB
	public static final String CHART_ID = "ChartId";
	
	//
	public static final String CONSTANTS = "constants";
	
	//DesktopHoro object of the kundli made
	public static final String HOROSCOPE_OBJ = "HoroscopeObj";
	
	//KP / Stellar object of the kundli made
	public static final String KP_OBJ = "KPObj";
	
	//As soon as user logs-in, we keep the user in session
	public static final String USER_ID = "userid";

	//similar to userid, but having true/ false value. Initialized at the same time as userid
	public static final String USER_EXISTS = "User_Exists";
	
	//
	public static final String LOGIN_USER = "LoginUser";
	
	//current language of the user
	public static final String LANGUAGE_CODE = "languageCode";
	
	//chart type of the user
	public static final String CHART_TYPE = "chartType";
	
	//if we received DST in input, we keep it in session
	public static final String IS_DST = "isDst";
	
	//if user clicked "done and save" button while creating kundli
	public static final String IS_SAVED = "IsSaved";
	
}
