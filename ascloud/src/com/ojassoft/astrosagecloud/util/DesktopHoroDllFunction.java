package com.ojassoft.astrosagecloud.util;

public class DesktopHoroDllFunction {
	/**
	 * This method gives the LMTOfBirth
	 * @param  hrs min sec timezone longdeg longmin 
     * @return Double GetLMTOfBirth
	 */
	public Double GetLMTOfBirth(String hrs,String min,String sec,String timezone,String longdeg,String longmin)
	{
		
	   Double  longi = Double.parseDouble(longdeg)+(Double.parseDouble(longmin)/60) ;
	   Double  temptimzone =Double.parseDouble(timezone)* 15.0;
	   Double lmtcorrection = temptimzone - longi;
	   lmtcorrection = lmtcorrection * 4;
	   lmtcorrection = lmtcorrection / 60 ;
	    
	   Double birthtime = Double.parseDouble(hrs)+Double.parseDouble(min)/60+Double.parseDouble(sec)/3600;
	   Double lmtatbirth = birthtime - lmtcorrection;
	   Double GetLMTOfBirth = lmtatbirth  ;
	    return GetLMTOfBirth;
	    }

	
}
