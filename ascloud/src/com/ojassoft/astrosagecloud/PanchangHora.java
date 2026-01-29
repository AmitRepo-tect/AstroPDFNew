package com.ojassoft.astrosagecloud;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.panchagamduration.PanchagamDuration;
import com.cslsoftware.util.Constants;
import com.ojassoft.astrosagecloud.DAO.CloudDAO;
import com.ojassoft.astrosagecloud.localization.Hindi;
import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;
import com.ojassoft.astrosagecloud.util.CacheKeyPool;
import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.OjasCache;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * Servlet implementation class PanchangHora
 */
public class PanchangHora extends HttpServlet {
	
	private final static Logger LOGGER = Logger.getLogger(PanchangHora.class.getName());
	private String POST_URL;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		doPost(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	{
		try
		{
			POST_URL = request.getScheme() + "://" +   // "http" + "://
		             request.getServerName() +       // "myhost"
		             ":" +                           // ":"
		             request.getServerPort() +       // "8080"
		             request.getRequestURI() +       // "/people"
		             "?" +                           // "?"
		             request.getQueryString();
			
            String uri = request.getRequestURI();
            String referer = request.getHeader("Referer");
            //String referer= "http://www.astrosage.com/";
            if(referer == null || referer.isEmpty())
            {
            	response.getWriter().print("jsonCallback([{\"Error\":\"You are not authorized to view this page..\"}])");
            }
            else 
            {
            	URL url = new URL(referer);
            	
            	String hostName = url.getHost();
            	if(!Arrays.asList(ConstantValues.allowedDomains).contains(hostName))
	            {
            		response.getWriter().print("jsonCallback([{\"Error\":\"You are not authorized to view this page..\"}])");
	            }
            	else
            	{
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
            	}
            }
		}
		catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
	}
	
	
	//Method for chogadia1 calculation
	public void chogadia(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			int languageCode = 0;
			//only for Hindi And English language's 
		  	String langCode = request.getParameter("languagecode");
		  	if(langCode != null && langCode.equals("1")) {
				  languageCode = 1;
			 } 
			  
			  //------- Caching -----
			  String cityId = request.getParameter("cityidval");
			  String cacheDefaultKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.CHOGADIA_API_KEY, languageCode);
			  String cacheDefaultDateKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.CHOGADIA_API_DATE_KEY, languageCode);
			  String curDateKey = getCurrentDayKey(CacheKeyPool.CHOGADIA_API_KEY, languageCode); // default for Delhi.
			  String actualKey = CacheKeyPool.getCacheKey(CacheKeyPool.CHOGADIA_API_KEY, cityId, request.getParameter("a_day"), request.getParameter("a_month"), request.getParameter("a_year"), languageCode);
			  boolean isCacheNotfound = true;
			  boolean putInCache = false;
			  
			  OjasCache objOjasCache = new OjasCache();
			  if(curDateKey.equals(actualKey)){
				  putInCache = true;
				  if(objOjasCache.retrieveFromCache(cacheDefaultKey) == null || !getCurrentDateStr().equals(objOjasCache.retrieveFromCache(cacheDefaultDateKey)) ){		  
					  isCacheNotfound = true;
					} else {
						isCacheNotfound = false;
					}
			  } else {
				  isCacheNotfound = true;
			  }
			  //----------
			  
			  if(isCacheNotfound) {
				DesktopHoro myChogadiaObject=new DesktopHoro();
				Constants ObjConst = new Constants();
				ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
				String arrChogadiaDayName[], arrChogadiaNightName[],arrChogadiaDayTime[],arrChogadiaNightTime[], arrChogadiaAusInausResult[];
				
				  myChogadiaObject.setDayOfBirth((request.getParameter("a_day")));
				  myChogadiaObject.setMonthOfBirth((request.getParameter("a_month")));
				  myChogadiaObject.setYearOfBirth((request.getParameter("a_year")));
				  myChogadiaObject.setHourOfBirth ("12");
				  myChogadiaObject.setMinuteOfBirth ("0");
				  myChogadiaObject.setSecondOfBirth ("0");
				  
				  myChogadiaObject.setDegreeOfLattitude(request.getParameter("latdeg"));
				  myChogadiaObject.setDegreeOfLongitude(request.getParameter("longdeg"));
				  myChogadiaObject.setCompanyAddLine1(request.getParameter("city"));
				  myChogadiaObject.setCompanyName ("AstroCAMP");
				  myChogadiaObject.setDST ("0");
				  myChogadiaObject.setEastWest(request.getParameter("longew"));
				  myChogadiaObject.setMinuteOfLattitude(request.getParameter("latmin"));
				  myChogadiaObject.setMinuteOfLongitude(request.getParameter("longmin"));
				  myChogadiaObject.setNorthSouth(request.getParameter("latns"));
				  myChogadiaObject.setTimeZone(request.getParameter("timezone"));
				  myChogadiaObject.setLanguageCode(languageCode+"");
				  
				  myChogadiaObject.initialize();
				  myChogadiaObject.initializeChoghadiaStartDayAndNight();
		
				  arrChogadiaDayName = myChogadiaObject.getChogadiaDayName();
				  arrChogadiaNightName = myChogadiaObject.getChogadiaNightName();
				  arrChogadiaDayTime = myChogadiaObject.getChoghadiaDayTime();
				  arrChogadiaNightTime = myChogadiaObject.getChoghadiaNightTime();
				  //arrAusInausResult = myChogadiaObject.
				  //JSONObject jsonReturnData=new JSONObject(); 
				  Hindi objHindi = new Hindi();
				 
				  String jsonReturnData = "jsonCallback([";

				  for(int chogadiaCounter = 0; chogadiaCounter<=arrChogadiaDayName.length-1; chogadiaCounter++)
				  {
					  String dayChogStr = objHindi.unicode(arrChogadiaDayName[chogadiaCounter], languageCode);
					  String nightChogStr = objHindi.unicode(arrChogadiaNightName[chogadiaCounter], languageCode);
				      jsonReturnData +="{\"ChogadiaDayName\":\""+dayChogStr+"\",";
				      jsonReturnData += "\"ChogadiaDayTime\":\""+arrChogadiaDayTime[chogadiaCounter]+"\",";
				      jsonReturnData += "\"ChogadiaDayAusInaus\":\""+getChogadiaAusInausResult(dayChogStr, languageCode)+"\",";
				      jsonReturnData += "\"ChogadiaNightName\":\""+nightChogStr+"\",";
				      jsonReturnData += "\"ChogadiaNightTime\":\""+arrChogadiaNightTime[chogadiaCounter]+"\",";
				      jsonReturnData += "\"ChogadiaNightAusInaus\":\""+getChogadiaAusInausResult(nightChogStr, languageCode)+"\"},";
				     
				  }
				  StringBuffer sb=new StringBuffer(jsonReturnData);
				  int i=sb.lastIndexOf(",");
				  sb.replace(i, i+1, "");
				  response.setContentType("text/plain; charset=UTF-8");
				  response.getWriter().print(sb.toString()+"])");
				  
				//----- put object into cache -----
				  if(putInCache){
					  objOjasCache.putInCache(cacheDefaultKey, sb.toString()+"])");
					  objOjasCache.putInCache(cacheDefaultDateKey, getCurrentDateStr());
				  }
			  } else {
				response.setContentType("text/plain; charset=UTF-8");
				response.getWriter().print(objOjasCache.retrieveFromCache(cacheDefaultKey));
			  }
			  //--------------
		}
		catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
	}
	
	//Method for Hora1 calculation
	
	public void hora(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			int languageCode = 0;
			//only for Hindi And English language's 
			String langCode = request.getParameter("languagecode");
			if(langCode != null && langCode.equals("1")) {
				  languageCode = 1;
			} 
			  
		  //------- Caching -----
		  String cityId = request.getParameter("cityidval");
		  String cacheDefaultKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.HORA_API_KEY, languageCode);
		  String cacheDefaultDateKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.HORA_API_DATE_KEY, languageCode);
		  String curDateKey = getCurrentDayKey(CacheKeyPool.HORA_API_KEY, languageCode); // default for Delhi.
		  String actualKey = CacheKeyPool.getCacheKey(CacheKeyPool.HORA_API_KEY, cityId, request.getParameter("a_day"), request.getParameter("a_month"), request.getParameter("a_year"), languageCode);
		  boolean isCacheNotfound = true;
		  
		  OjasCache objOjasCache = new OjasCache();
		  if(curDateKey.equals(actualKey)){
			  if(objOjasCache.retrieveFromCache(cacheDefaultKey) == null || !getCurrentDateStr().equals(objOjasCache.retrieveFromCache(cacheDefaultDateKey)) ){		  
				  isCacheNotfound = true;
				} else {
					isCacheNotfound = false;
				}
		  } else {
			  isCacheNotfound = true;
		  }
		  //----------
		  
		if(isCacheNotfound) {
			DesktopHoro myHoroObject=new DesktopHoro();
			String  arrPlanetNightName[], arrPlanetDayName[],arrHoraExitTime1[],arrHoraExitTime2[];
			
			Constants ObjConst = new Constants();
			ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
			  
			myHoroObject.setDayOfBirth((request.getParameter("a_day")));
			myHoroObject.setMonthOfBirth((request.getParameter("a_month")));
			myHoroObject.setYearOfBirth((request.getParameter("a_year")));
			myHoroObject.setHourOfBirth ("5");
			myHoroObject.setMinuteOfBirth ("30");
			myHoroObject.setSecondOfBirth ("0");
			  
			myHoroObject.setDegreeOfLattitude(request.getParameter("latdeg"));
			myHoroObject.setDegreeOfLongitude(request.getParameter("longdeg"));
			myHoroObject.setCompanyAddLine1(request.getParameter("city"));
			myHoroObject.setCompanyName ("AstroCAMP");
			myHoroObject.setDST ("0");
			myHoroObject.setEastWest(request.getParameter("longew"));
			myHoroObject.setMinuteOfLattitude(request.getParameter("latmin"));
			myHoroObject.setMinuteOfLongitude(request.getParameter("longmin"));
			myHoroObject.setNorthSouth(request.getParameter("latns"));
			myHoroObject.setTimeZone(request.getParameter("timezone"));
			myHoroObject.setLanguageCode("0");
		  	 	  
			myHoroObject.initialize();
			  		  
			myHoroObject.calcHoraDayTimeAndDayLordValue();
			myHoroObject.calcHoraNightTimeAndDayLordValue();
			arrHoraExitTime1 = myHoroObject.getDayHoraTime();
			arrHoraExitTime2 = myHoroObject.getNightHoraTime();
			arrPlanetDayName = myHoroObject.getDayLrdForHora();
			arrPlanetNightName = myHoroObject.getNightLrdForHora();
			Local local = new Local();
			MyResourceBundle rBConstants = local.loadPropertiesFileNew("panchangmuhurat", languageCode);
				
			String jsonReturnData = "jsonCallback([";
			  
			for(int horaCounter = 0; horaCounter<=arrPlanetDayName.length-1; horaCounter++)
			{
			      jsonReturnData +="{\"arrPlanetDayName\":\""+rBConstants.getString(arrPlanetDayName[horaCounter])+"\",";
			      jsonReturnData +="\"arrPlanetDayNameKey\":\""+arrPlanetDayName[horaCounter]+"\",";
			      jsonReturnData += "\"arrHoraExitTime2\":\""+arrHoraExitTime2[horaCounter]+"\",";
			      jsonReturnData += "\"arrHoraExitTime1\":\""+arrHoraExitTime1[horaCounter]+"\",";
			      jsonReturnData += "\"arrPlanetNightName\":\""+rBConstants.getString(arrPlanetNightName[horaCounter])+"\",";
			      jsonReturnData += "\"arrPlanetNightNameKey\":\""+arrPlanetNightName[horaCounter]+"\"},";
			}
			StringBuffer sb=new StringBuffer(jsonReturnData);
			int i=sb.lastIndexOf(",");
			sb.replace(i, i+1, "");
			response.setContentType("text/plain; charset=UTF-8");
			response.getWriter().print(sb.toString()+"])");	
			  
			//----- put object into cache -----
			if(curDateKey.equals(actualKey)){
				  objOjasCache.putInCache(cacheDefaultKey, sb.toString()+"])");
				  objOjasCache.putInCache(cacheDefaultDateKey, getCurrentDateStr());
			}
			  
		} else {
				response.setContentType("text/plain; charset=UTF-8");
				response.getWriter().print(objOjasCache.retrieveFromCache(cacheDefaultKey));
		}
		//--------------	
	} catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
	}
	
	
	//Method for rahuKaal1 calculation
	
	public void rahukaal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			int languageCode = 0;
			//only for Hindi And English language's 
			  String langCode = request.getParameter("languagecode");
			  if(langCode != null && langCode.equals("1")) {
				  languageCode = 1;
			  } 
			
	  		//------- Caching -----
			  String cityId = request.getParameter("cityidval");
			  String cacheDefaultKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.RAHUKAAL_API_KEY, languageCode);
			  String cacheDefaultDateKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.RAHUKAAL_API_DATE_KEY, languageCode);
			  String curDateKey = getCurrentDayKey(CacheKeyPool.RAHUKAAL_API_KEY, languageCode); // default for Delhi.
			  String actualKey = CacheKeyPool.getCacheKey(CacheKeyPool.RAHUKAAL_API_KEY, cityId, request.getParameter("a_day"), request.getParameter("a_month"), request.getParameter("a_year"), languageCode);
			  boolean isCacheNotfound = true;
			  
			  OjasCache objOjasCache = new OjasCache();
			  if(curDateKey.equals(actualKey)){
				  if(objOjasCache.retrieveFromCache(cacheDefaultKey) == null || !getCurrentDateStr().equals(objOjasCache.retrieveFromCache(cacheDefaultDateKey)) ){		  
					  isCacheNotfound = true;
					} else {
						isCacheNotfound = false;
					}
			  } else {
				  isCacheNotfound = true;
			  }
			  //----------
			  
			  if(isCacheNotfound) {
				DesktopHoro myHoroObject=new DesktopHoro();
			    Constants ObjConst = new Constants();
				
				ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		        myHoroObject.setDayOfBirth((request.getParameter("a_day")));
				myHoroObject.setMonthOfBirth((request.getParameter("a_month")));
				myHoroObject.setYearOfBirth((request.getParameter("a_year")));
				myHoroObject.setHourOfBirth ("5");
				myHoroObject.setMinuteOfBirth ("30");
				myHoroObject.setSecondOfBirth ("0");
				  
				myHoroObject.setDegreeOfLattitude(request.getParameter("latdeg"));
				myHoroObject.setDegreeOfLongitude(request.getParameter("longdeg"));
				myHoroObject.setCompanyAddLine1(request.getParameter("city"));
				myHoroObject.setCompanyName ("AstroCAMP");
				  myHoroObject.setDST ("0");
				  myHoroObject.setEastWest(request.getParameter("longew"));
				  myHoroObject.setMinuteOfLattitude(request.getParameter("latmin"));
				  myHoroObject.setMinuteOfLongitude(request.getParameter("longmin"));
				  myHoroObject.setNorthSouth(request.getParameter("latns"));
				  myHoroObject.setTimeZone(request.getParameter("timezone"));
				  myHoroObject.initialize();
				  myHoroObject.printRahuKaal1();
				  
							  
				  String DayForRahu[] = myHoroObject.getDayForRahu();
				  String RahukaalTime[] = myHoroObject.getRahukaalTime();
		   	      int  ilowerLimit = 0;
			      int iUpperLimit = 1;
				  String jsonReturnData = "jsonCallback([";
				  for(int RaahuCounter = 0; RaahuCounter<=DayForRahu.length-1; RaahuCounter++)
				  {
					  jsonReturnData +="{\"arrDayForRahu\":\""+DayForRahu[RaahuCounter]+"\",";
				      jsonReturnData += "\"arrRahukaalStartTime\":\""+RahukaalTime[ilowerLimit]+"\",";
				      jsonReturnData += "\"arrRahukaalEndTime\":\""+RahukaalTime[iUpperLimit]+"\"},";
				      ilowerLimit +=2;
				      iUpperLimit +=2;		     
				  }
				  StringBuffer sb=new StringBuffer(jsonReturnData);
				  int i=sb.lastIndexOf(",");
				  sb.replace(i, i+1, "");		  		  
				  response.getWriter().print(sb.toString()+"])");
				  
				//----- put object into cache -----
				  if(curDateKey.equals(actualKey)){
					  objOjasCache.putInCache(cacheDefaultKey, sb.toString()+"])");
					  objOjasCache.putInCache(cacheDefaultDateKey, getCurrentDateStr());
				  }
			  } else {
				response.getWriter().print(objOjasCache.retrieveFromCache(cacheDefaultKey));
			  }
			  //--------------		
		}
		catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
	}
	
	//Method for sunrise1 calculation	
	public void sunrise(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			int languageCode = 0;
			//only for Hindi And English language's 
		    String langCode = request.getParameter("languagecode");
			  if(langCode != null && langCode.equals("1")) {
				  languageCode = 1;
			  } 
			
			//------- Caching -----
			  String cityId = request.getParameter("cityidval");
			  String cacheDefaultKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.SUNRISE_API_KEY, languageCode);
			  String cacheDefaultDateKey = CacheKeyPool.getCacheDefaultKey(CacheKeyPool.SUNRISE_API_DATE_KEY, languageCode);
			  String curDateKey = getCurrentDayKey(CacheKeyPool.SUNRISE_API_KEY, languageCode); // default for Delhi.
			  String actualKey = CacheKeyPool.getCacheKey(CacheKeyPool.SUNRISE_API_KEY, cityId, request.getParameter("a_day"), request.getParameter("a_month"), request.getParameter("a_year"), languageCode);
			  boolean isCacheNotfound = true;
			  
			  OjasCache objOjasCache = new OjasCache();
			  if(curDateKey.equals(actualKey)){
				  if(objOjasCache.retrieveFromCache(cacheDefaultKey) == null || !getCurrentDateStr().equals(objOjasCache.retrieveFromCache(cacheDefaultDateKey)) ){		  
					  isCacheNotfound = true;
					} else {
						isCacheNotfound = false;
					}
			  } else {
				  isCacheNotfound = true;
			  }
			  //----------
		    
			  if(isCacheNotfound) {
				DesktopHoro ObjHoro=new DesktopHoro();
			    Constants ObjConst = new Constants();
				
				ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
			    ObjHoro.setPlace("");
				ObjHoro.setDayOfBirth((request.getParameter("a_day")));
				ObjHoro.setMonthOfBirth((request.getParameter("a_month")));
				ObjHoro.setYearOfBirth((request.getParameter("a_year")));
				ObjHoro.setHourOfBirth ("12");
				ObjHoro.setMinuteOfBirth ("0");
				ObjHoro.setSecondOfBirth ("0");
				ObjHoro.setMaleFemale("M");
				ObjHoro.setDegreeOfLattitude(request.getParameter("latdeg"));
				ObjHoro.setDegreeOfLongitude(request.getParameter("longdeg"));
				ObjHoro.setCompanyAddLine1(request.getParameter("city"));
				ObjHoro.setCompanyName ("AstroCAMP");
				ObjHoro.setDST ("0");
				ObjHoro.setEastWest(request.getParameter("longew"));
				ObjHoro.setMinuteOfLattitude(request.getParameter("latmin"));
				ObjHoro.setMinuteOfLongitude(request.getParameter("longmin"));
				ObjHoro.setNorthSouth(request.getParameter("latns"));
				ObjHoro.setTimeZone(request.getParameter("timezone"));
				ObjHoro.setAyan(0);
				ObjHoro.initialize();
			    String ObjHoroValues = "";
			    
			    ObjHoroValues="jsonCallback([{\"SunRise\":\""+ObjHoro.getSunRiseTimeHms();
			    ObjHoroValues+="\",\"SunSet\":\""+ObjHoro.getSunSetTimeHms()+"\"}])";
			    response.getWriter().print(ObjHoroValues);
			    //----- put object into cache -----
			    if(curDateKey.equals(actualKey)){
				  objOjasCache.putInCache(cacheDefaultKey, ObjHoroValues);
				  objOjasCache.putInCache(cacheDefaultDateKey, getCurrentDateStr());
			   } 
			} else {
				response.getWriter().print(objOjasCache.retrieveFromCache(cacheDefaultKey));
			}
		   //--------------
		}
		catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
	}
	
	public void kppanchang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			
		PanchagamDuration myAstrologyObject=new PanchagamDuration();
	    Constants ObjConst = new Constants();
		
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd G','HH:mm:ss z", Locale.UK);
        dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata")); //London?
        String[] timestamp = dateFormat.format(new Date()).split(",");
        String datearr[]=timestamp[0].split("\\.");
		String timearr[]=timestamp[1].split(":");
	    
		ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
	    myAstrologyObject.setName("Name");
	    myAstrologyObject.setPlace("Delhi");
	    myAstrologyObject.setCompanyAddLine1 ("Delhi");
	    myAstrologyObject.setCompanyName ("AstroCAMP");
	    myAstrologyObject.setTimeZone("5.5");
	    myAstrologyObject.setMaleFemale("sex");
	    myAstrologyObject.setSecondOfBirth(timearr[2].split(" ")[0]);
	    myAstrologyObject.setMinuteOfBirth(timearr[1]);
	    myAstrologyObject.setHourOfBirth(timearr[0]);
	    myAstrologyObject.setDayOfBirth(datearr[2].split(" ")[0]);
	    myAstrologyObject.setMonthOfBirth(datearr[1]);
	    myAstrologyObject.setYearOfBirth(datearr[0]);
	    myAstrologyObject.setDegreeOfLattitude("28");
	    myAstrologyObject.setDegreeOfLongitude("77");
	    myAstrologyObject.setSecondOfLattitude("00");
	    myAstrologyObject.setSecondOfLongitude("00");
	    myAstrologyObject.setMinuteOfLongitude("13");
	    myAstrologyObject.setMinuteOfLattitude("39");
	    myAstrologyObject.setEastWest("E");
	    myAstrologyObject.setNorthSouth("N");
	    myAstrologyObject.setDST("00");
	    myAstrologyObject.setLanguageCode("0");
	    myAstrologyObject.initialize();
	    myAstrologyObject.setPanchagamTime();
	    
	    String jsonpObj=myAstrologyObject.getKPPanchang(2).toString().replace("\n", "");
	    jsonpObj="jsonCallback([{\"kpPanchang\":\""+jsonpObj+"\"}])";
	    response.getWriter().print(jsonpObj);
	}
		catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
	}
	
	/**
	 * This method serves as the API for astrosage where it returns the KP Ruling Planet corresponding to the 
	 * details sent.
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void kprp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{			
			DesktopHoro myAstrologyObject=new DesktopHoro();
		    Constants ObjConst = new Constants();
			
		    ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		    
		    myAstrologyObject.setName("Name");
	    	myAstrologyObject.setPlace(Util.safestr(request.getParameter("city")));
	    	myAstrologyObject.setCompanyAddLine1 ("Delhi");
	    	myAstrologyObject.setCompanyName ("AstroCAMP");
	        
	    	myAstrologyObject.setTimeZone(Util.safestr(request.getParameter("timezone")));
	    	myAstrologyObject.setMaleFemale("sex");
	    	myAstrologyObject.setSecondOfBirth(Util.safestr(request.getParameter("a_second")));

	    	myAstrologyObject.setMinuteOfBirth(Util.safestr(request.getParameter("a_minute")));
	    	myAstrologyObject.setHourOfBirth(Util.safeStringInt(request.getParameter("a_hour")));
	    	myAstrologyObject.setDayOfBirth(Util.safeStringInt(request.getParameter("a_day")));
	    	myAstrologyObject.setMonthOfBirth(Util.safeStringInt(request.getParameter("a_month")));
	    	myAstrologyObject.setYearOfBirth(Util.safeStringInt(request.getParameter("a_year")));
	    	myAstrologyObject.setDegreeOfLattitude(Util.safestr(request.getParameter("latdeg")));
	    	myAstrologyObject.setDegreeOfLongitude(Util.safestr(request.getParameter("longdeg")));
	    	myAstrologyObject.setSecondOfLattitude("00");
	    	myAstrologyObject.setSecondOfLongitude("00");
	    	myAstrologyObject.setMinuteOfLongitude(Util.safestr(request.getParameter("longmin")));
	    	myAstrologyObject.setMinuteOfLattitude(Util.safestr(request.getParameter("latmin")));
	    	myAstrologyObject.setEastWest(Util.safestr(request.getParameter("longew")));
	    	myAstrologyObject.setNorthSouth(Util.safestr(request.getParameter("latns")));
	    	myAstrologyObject.setDST("0");
	    	myAstrologyObject.setLanguageCode("0");
		    myAstrologyObject.initialize();
		    
		    String jsonReturnData = "jsonCallback([";
		    
		    jsonReturnData += "{\"AscNakshatraLordNameStr\":\"Ascendant Nakshatra Lord:\",";
    	    jsonReturnData += "\"AscNakshatraLordName\":\""+myAstrologyObject.getKPAscendentNakshatraLordName()+"\",";
    	    jsonReturnData += "\"AscSignLordNameStr\":\"Ascendant Sign Lord:\",";
    	    jsonReturnData += "\"AscSignLordName\":\""+myAstrologyObject.getKPAscendentSignLordName()+"\",";
    	    jsonReturnData += "\"MoonNakshatraLordNameStr\":\"Moon Nakshatra Lord:\",";
    	    jsonReturnData += "\"MoonNakshatraLordName\":\""+myAstrologyObject.getKPMoonNakshatraLordName()+"\",";
    	    jsonReturnData += "\"MoonSignLordNameStr\":\"Moon Sign Lord:\",";
    	    jsonReturnData += "\"MoonSignLordName\":\""+myAstrologyObject.getKPMoonSignLordName()+"\",";
    	    jsonReturnData += "\"DayLordNameStr\":\"Day Lord:\",";
    	    jsonReturnData += "\"DayLordName\":\""+myAstrologyObject.getKPDayLordName()+"\",";
    	    jsonReturnData += "\"AscSubLordNameStr\":\"Ascendant Sub Lord:\",";
    	    jsonReturnData += "\"AscSubLordName\":\""+myAstrologyObject.getKPAscendentSubLordName()+"\",";
    	    jsonReturnData += "\"MoonSubLordNameStr\":\"Moon Sub Lord:\",";    
    	    jsonReturnData += "\"MoonSubLordName\":\""+myAstrologyObject.getKPMoonSubLordName()+"\"}])";    
    	    
    	    response.getWriter().print(jsonReturnData);

	}
		catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
	}
	
	//---- Get chogadia result by chogadia name -----
	String getChogadiaAusInausResult(String chogadiaName, int languageCode) {
		Local local = new Local();
		MyResourceBundle rBConstants = local.loadPropertiesFileNew("panchangmuhurat", languageCode);
		
		if (rBConstants.getString("SHOOBH").equals(chogadiaName) || rBConstants.getString("AMRUT").equals(chogadiaName) || rBConstants.getString("LAABH").equals(chogadiaName)) {
			return rBConstants.getString("AUSPICIOUS");
	    }
	    else if (rBConstants.getString("ROG").equals(chogadiaName) || rBConstants.getString("KAAL").equals(chogadiaName) || rBConstants.getString("UDVEG").equals(chogadiaName)) {
	    	return rBConstants.getString("INAUSPICIOUS");
	    }
	    else {
	    	return rBConstants.getString("INTERMEDIATE");
	    }
	}
	
	//------ get key of current day ------
	private String getCurrentDayKey(String cachekey, int languageCode){
		
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Kolkata"));
		String day = cal.get(Calendar.DAY_OF_MONTH) + "";
		String month = (cal.get(Calendar.MONTH) + 1)+"";
		String year = cal.get(Calendar.YEAR) + "";
		
		return CacheKeyPool.getCacheKey(cachekey, day, month, year, languageCode);	
		}
	
	private String getCurrentDateStr(){
		
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Kolkata"));
		String day = cal.get(Calendar.DAY_OF_MONTH) + "";
		String month = (cal.get(Calendar.MONTH) + 1)+"";
		String year = cal.get(Calendar.YEAR) + "";
		
		return day+"_"+month+"_"+year;	
		}
	
	public void chogadiasmriti(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String returnString = "";
		try
		{
		DesktopHoro myChogadiaObject=new DesktopHoro();
		Constants ObjConst = new Constants();
		ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		int languageCode = 0;
		String arrChogadiaDayName[], arrChogadiaNightName[],arrChogadiaDayTime[],arrChogadiaNightTime[], arrChogadiaAusInausResult[];
		
		  myChogadiaObject.setDayOfBirth((request.getParameter("a_day")));
		  myChogadiaObject.setMonthOfBirth((request.getParameter("a_month")));
		  myChogadiaObject.setYearOfBirth((request.getParameter("a_year")));
		  myChogadiaObject.setHourOfBirth ("12");
		  myChogadiaObject.setMinuteOfBirth ("0");
		  myChogadiaObject.setSecondOfBirth ("0");
		  
		  myChogadiaObject.setDegreeOfLattitude(request.getParameter("latdeg"));
		  myChogadiaObject.setDegreeOfLongitude(request.getParameter("longdeg"));
		  myChogadiaObject.setCompanyAddLine1(request.getParameter("city"));
		  myChogadiaObject.setCompanyName ("AstroCAMP");
		  myChogadiaObject.setDST ("0");
		  myChogadiaObject.setEastWest(request.getParameter("longew"));
		  myChogadiaObject.setMinuteOfLattitude(request.getParameter("latmin"));
		  myChogadiaObject.setMinuteOfLongitude(request.getParameter("longmin"));
		  myChogadiaObject.setNorthSouth(request.getParameter("latns"));
		  myChogadiaObject.setTimeZone(request.getParameter("timezone"));
		  
		  //only for Hindi And English language's 
		  String langCode = request.getParameter("languagecode");
		  if(langCode != null && langCode.equals("1")) {
			  languageCode = 1;
		  } 
		  
		  //------- Caching -----
		  boolean getDataFromDB = true;
		  boolean putInCache = false;
		  OjasCache ojasCache = new OjasCache();
		  String currentDate = getCurrentDateStr();
		  String cityId = request.getParameter("cityidval");
		  if(ConstantValues.PANCHANG_CITY_CACHE.contains(cityId))
		  {
			  putInCache = true;
			  
			  Object objInCache = ojasCache.retrieveFromCache("CUR_DATE_CHOGADIA");
			  if(objInCache != null && objInCache.toString().equals(currentDate))
			  {
				  Object obj = ojasCache.retrieveFromCache(cityId+"_CHOGADIA_"+langCode);
				  if(obj != null)
				  {
					  returnString = obj.toString();
					  getDataFromDB = false;
				  }
			  }
		  }
		  //----------
		  if(getDataFromDB)
		  {
		  	  myChogadiaObject.initialize();
			  myChogadiaObject.initializeChoghadiaStartDayAndNight();
	
			  arrChogadiaDayName = myChogadiaObject.getChogadiaDayName();
			  arrChogadiaNightName = myChogadiaObject.getChogadiaNightName();
			  arrChogadiaDayTime = myChogadiaObject.getChoghadiaDayTime();
			  arrChogadiaNightTime = myChogadiaObject.getChoghadiaNightTime();
			  //arrAusInausResult = myChogadiaObject.
			  //JSONObject jsonReturnData=new JSONObject(); 
			  Hindi objHindi = new Hindi();
			 
			  String jsonReturnData = "jsonCallback([";
			  
	
			  for(int chogadiaCounter = 0; chogadiaCounter<=arrChogadiaDayName.length-1; chogadiaCounter++)
			  {
				  String dayChogStr = objHindi.unicode(arrChogadiaDayName[chogadiaCounter], languageCode);
				  String nightChogStr = objHindi.unicode(arrChogadiaNightName[chogadiaCounter], languageCode);
			      jsonReturnData +="{\"ChogadiaDayName\":\""+dayChogStr+"\",";
			      jsonReturnData += "\"ChogadiaDayTime\":\""+arrChogadiaDayTime[chogadiaCounter]+"\",";
			      jsonReturnData += "\"ChogadiaDayAusInaus\":\""+getChogadiaAusInausResult(dayChogStr, languageCode)+"\",";
			      jsonReturnData += "\"ChogadiaNightName\":\""+nightChogStr+"\",";
			      jsonReturnData += "\"ChogadiaNightTime\":\""+arrChogadiaNightTime[chogadiaCounter]+"\",";
			      jsonReturnData += "\"ChogadiaNightAusInaus\":\""+getChogadiaAusInausResult(nightChogStr, languageCode)+"\"},";
			     
			  }
			  StringBuffer sb=new StringBuffer(jsonReturnData);
			  int i=sb.lastIndexOf(",");
			  sb.replace(i, i+1, "");
			  response.setContentType("text/plain; charset=UTF-8");
			  returnString = sb.toString()+"])";
			  if(putInCache)
			  {
				  ojasCache.putInCache(cityId+"_CHOGADIA_"+langCode, returnString);
				  ojasCache.putInCache("CUR_DATE_CHOGADIA", currentDate);
			  }
		  }
		  //--------------
		
	}
		catch(Exception e)
		{
			LOGGER.log(Level.INFO, "Problem in this URL: " + POST_URL + "  , and error is: "  + e.getMessage());
		}
		response.getWriter().print(returnString);
	}
	
	public void saveFeedback(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String feedback = request.getParameter("feedbackhealth");
		DesktopHoro objHoro = (DesktopHoro) (request.getSession().getAttribute("HoroscopeObj"));
		String userId = Util.safestr(request.getSession().getAttribute("User_Id"));
		String agree = request.getParameter("yesno");
		String actualImmunity = request.getParameter("actualimmunity");
		String calcImmunity = request.getParameter("calcimmunity");
		if(Integer.valueOf(agree) == 1)
		{
			actualImmunity = calcImmunity;
		}
		CloudDAO dao = new CloudDAO();
		boolean isSaved = dao.saveFeedback(objHoro, userId, feedback,Integer.valueOf(agree),calcImmunity, actualImmunity);
		String redirectUrl = "/cloud/healthindex.asp";
		if(isSaved)
		{
			redirectUrl += "?usermsg="+URLEncoder.encode("Thank you for your Feedback.", "UTF-8");
		}
		response.sendRedirect(redirectUrl);
				
	}
}