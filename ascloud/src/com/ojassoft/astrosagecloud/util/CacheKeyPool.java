package com.ojassoft.astrosagecloud.util;

public class CacheKeyPool {

	public static final String HORA_API_KEY = "horaapi";
	public static final String HORA_API_DATE_KEY = "horaapi_date";
	
	public static final String CHOGADIA_API_KEY = "chogadiaapi";
	public static final String CHOGADIA_API_DATE_KEY = "chogadiaapi_date";
	
	public static final String RAHUKAAL_API_KEY = "rahukaalapi";
	public static final String RAHUKAAL_API_DATE_KEY = "rahukaalapi_date";
	
	public static final String SUNRISE_API_KEY = "sunriseapi";
	public static final String SUNRISE_API_DATE_KEY = "sunriseapi_date";
	
	public static String getCacheDefaultKey(String module, int languageCode){	
		return module+"_"+languageCode;
	}
	
	//default city for Delhi(3245)
	public static String getCacheKey(String module,String day,String month,String year,int languageCode){		
		return module+"_"+"3245"+"_"+day+"_"+month+"_"+year+"_"+languageCode;
	}
	
	public static String getCacheKey(String module,String cityId,String day,String month,String year,int languageCode){		
		return module+"_"+cityId+"_"+day+"_"+month+"_"+year+"_"+languageCode;
	}
}