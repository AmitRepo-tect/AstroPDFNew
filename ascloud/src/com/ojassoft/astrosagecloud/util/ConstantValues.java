
package com.ojassoft.astrosagecloud.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * This class return the constants values of properties corresponding to the key provided.
 * This class also provides some arrays of constants value 
 */
public final class ConstantValues {
	public final static String DEFAULT_TIMEZONE_VALUE = "5.5";
	public final static String DEFAULT_CHART_STYLE = "0";
	public final static String DEFAULT_KPHN_VALUE = "0";
	public final static String DEFAULT_AYANAMSA_VALUE = "0";
	public final static String LONGITUDE_DIR_EAST_INT = "1";
	public final static String LONGITUDE_DIR_EAST = "E";
	public final static String LONGITUDE_DIR_WEST = "W";
	public final static String LATITUDE_DIR_NORTH_INT = "1";
	public final static String LATITUDE_DIR_NORTH = "N";
	public final static String LATITUDE_DIR_SOUTH = "S";
	public final static String BLANK_VALUE="";
	public final static int COOKIES_FOUND=0;
	public final static String KEY_VAL_WEB = "Web";
	
	public final static String TRUEVAL = "1";
	public final static String FALSEVAL = "0";
	public final static String SESSION_TIME_OUT = "3";
	public final static String SIGNUP_ERROR = "0";
    public final static String SIGNUP_SUCCESS = "1";
    public final static String UPDATED_SUCCESSFULLY = "1";
	public final static String UPDATION_UNSUCCESSFULL = "0";
	public final static String UPDATION_SUCCESSFULL_SEND_EMAIL = "7";
	public final static	String ERROR_IN_UPDATION = "2";
	public final static	String GET_CHART_VALUE_ERR = "1";
	public final static String EXE_QUERY_ERR = "2";
	public final static String RECORD_NOT_FOUND = "0";
	public final static String MAIL_SEND_SUCCESSFULLY = "1";
    public final static String MAIL_SEND_FAILED = "0";
	//----/cloud/Control/signup.asp
    public final static String	EMAIL_ALREADY_EXIST = "2";
    public final static String	SIGNUP_SUCCESSFULLY = "1";
    public final static String	SIGNUP_FAILED = "0";
    public final static String	INVALID_EMAIL_ID = "3";
    public final static String INVALID_MOBILE = "4";
    public final static String ALL_FIELD_VALUES_ARE_REQUIRED = "5";
    public final static String INVALID_EMAIL_ID_FOR_UPDATION = "6";
    public final static String USERIDEXIST = "0";
    public final static String USERID_ALREADY_EXIST = "7";
    public final static String USER_ID_INVALID_LENGTH = "8";
    //----/cloud/Model/updateemailid.asp
    public final static String	EMAILIDUPDATEDSUCCESSFULLY = "1";
    public final static String	EMAILIDUPDATIONFAILED = "0";

   //----/cloud/new_activation-page.asp

    public final static String	EMAILIDUPDATIONSUCCESS = "1";
    public final static String	EMAILIDUPDATIONFAIL = "0";
    public final static String	BLANK_EMAIL_INVALID_ID = "0";
    public final static String  SESSION_EXPIRED = "2";
    public final static String	EMAIL_ID_ALREADY_EXIST_VAL = "0";
    
	//------ Constant for i_SendMail.java
	public final static  String MAILFROM = "info@astrosage.com";
	public final static  String MAILREPLYTO = "info@astrosage.com";
	//openChart
	public final static String CHART_DELETION_FAILED = "0";
	public final static String NO_OF_RECORDS = "1";
	public final static String DELETION_SUCCESSFULLY = "1";
	public final static String UNKNOWN_ERROR_CODE = "3";
	public final static String IS_TRUE = "1";
	public final static String CONDITION_FAILED = "4" ;
	public final static String DELETING_OPENED_CHART = "2";
	public static final String DOMAIN_URL = getDomainName();
	
	public final static String COOKIES_SET_SUCCESS = "1";
	public final static String COOKIES_SET_FAILURE = "0";
	public final static String SETTING_COOKIES = "2";
	public final static String GETTING_COOKIES = "3";
	public final static String GET_COOKIES_FAILED = "4";
	public final static String GET_COOKIES_SUCCESS = "1";
	// used when we just want to make Kundli, but do not want to pass userid and password information
	public final static String[] internalAllowedDomains = {"k.astrosage.com","astrocamp.com","www.astrocamp.com","cloud.astrosage.com", "hindikundli.com","www.hindikundli.com","hindilok.com","www.hindilok.com","gpshorary.com", "www.gpshorary.com", "mykundali.com", "www.mykundali.com", "kundlifree.com", "www.kundlifree.com","mykusthi.com", "www.mykusthi.com", "myrashifal.com","www.myrashifal.com","ascloud.astrosage.com", "celebrity.astrosage.com", "cogniastro.com", "dhruv.astrosage.com", "panchang.astrosage.com", "babynames.astrosage.com", WebKeys.COOKIE_DOMAIN};
	// used when userid and trust information is coming from previous screen
	public final static String[] allowedDomains = {"k.astrosage.com","astrocamp.com","www.astrocamp.com","hindikundli.com","www.hindikundli.com","hindilok.com","www.hindilok.com","hindi.astrosage.com","static.astrosage.com","astrosage.com", "www.astrosage.com", "gpshorary.com", "www.gpshorary.com", "mykundali.com", "www.mykundali.com", "kundlifree.com", "www.kundlifree.com", "mykusthi.com", "www.mykusthi.com","myrashifal.com","www.myrashifal.com", "cloud.astrosage.com","ascloud.astrosage.com","kundlipdf.com", "www.kundlipdf.com", "celebrity.astrosage.com", "cogniastro.com", "dhruv.astrosage.com", "panchang.astrosage.com", "babynames.astrosage.com", WebKeys.COOKIE_DOMAIN};
	public final static String PROPERTIES_PATH = "C:/Documents and Settings/Administrator/workspace/cloud/WebContent/cloud/";
	
	//4 Step
	public final static String STAR_LORD_TITLE = "2.Star Lord  ";
	public final static String SUB_LORD_TITLE = "3.Sub Lord  ";
	public final static String STAR_LORD_SUB_LORD_TITLE = "4.Star Lord of Sub Lord  ";
	public final static List<String> cityCache = getList();
	private static List<String> getList() { 
		List<String> list = new ArrayList<String>();
		list.add("new");
		list.add("ben");
		list.add("mum");
		list.add("pun");
		list.add("luc");
		list.add("ahm");
		list.add("ind");
		list.add("hyd");
		list.add("che");
		list.add("cha");
		list.add("kol");
		list.add("jai");
		list.add("pat");
		list.add("agr");
		list.add("noi");
		list.add("bar");
		list.add("ban");
		list.add("kan");
		list.add("bha");
		list.add("man");
		list.add("kha");
		list.add("nag");
		return list;
	}
	
	public final static List<String> PANCHANG_CITY_CACHE = getPanchangList();
	private static List<String> getPanchangList() { 
		List<String> list = new ArrayList<String>();
		list.add("3245");
		
		return list;
	}
	
	private static String getDomainName()
    {
		return "localhost";
    }
	
	public static final String DEFAULT_PLAN_ID = "1";
	public static final String USER_UNDEFINED = "0";
	public static final String USER_CREATED_ACTIVE = "10";
	public static final String USER_CREATED_INACTIVE = "20";
	public static final String PASSWORDS_DO_NOT_MATCH = "30";
	public static final String EMAIL_ID_DOES_NOT_EXIST = "40";
	public static final String EMAIL_EXISTS_PASSWORD_NOT_MATCH = "50";
	public static final String EMAIL_EXISTS_INACTIVE = "60";

}

