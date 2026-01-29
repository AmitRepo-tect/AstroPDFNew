package com.ojassoft.astrosagecloud;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.TimeZone;

import com.astrocamp.sms.RequestProcessing;
import com.cslsoftware.desktophoro.DesktopHoro;



public class PersonalizedHoroscope {
	
	public static RequestProcessing  getPersonalizedHoroscope(DesktopHoro horoObj){
		
		String dayval = String.valueOf(horoObj.getDayOfBirth());
		String monthval = String.valueOf(horoObj.getMonthOfBirth());
		String yearval = String.valueOf(horoObj.getYearOfBirth());
		
		String hrs =String.valueOf(horoObj.getHourOfBirth());
		String min =String.valueOf(horoObj.getMinuteOfBirth());
		String sec = "00";//String.valueOf(horoObj.getSecondOfBirth());
		
		
		if (Integer.parseInt(dayval)<10 && dayval.length()< 2) 
			dayval="0" + dayval;

		if (Integer.parseInt(monthval)<10 && monthval.length()< 2)
			monthval="0" + monthval;

		if (Integer.parseInt(hrs)<10  && hrs.length()< 2)
			hrs="0" + hrs;

		if (Integer.parseInt(min)<10 && min.length()< 2)
			min="0" + min;

		if (Integer.parseInt(sec) <10 && sec.length()< 2)
			sec ="0" + sec; 

		String DateoB = dayval + monthval + yearval;
		String TimeoB =  hrs + min + sec;
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
		sdf1.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
		String[] dateSplitValue = sdf1.format(new Date()).split("-");
		String Cday = dateSplitValue[0]+"";
		String CMonth = dateSplitValue[1]+"";
		String CYear = dateSplitValue[2]+"";
		
		RequestProcessing SmsHoro = new RequestProcessing();

		SmsHoro.setDateOfBirth (DateoB);
		SmsHoro.setTimeOfBirth (TimeoB);
		SmsHoro.setDateOfPrediction (Cday+CMonth+CYear);
		//SmsHoro.setDateOfPrediction ("09062015");
		SmsHoro.setLatitudeDegree (horoObj.getDegreeOfLattitude());
		SmsHoro.setLongitudeDegree (horoObj.getDegreeOfLongitude());
		SmsHoro.setLatitudeSecond ("0");
		SmsHoro.setLongitudeSecond ("0");
		SmsHoro.setLongitudeMinute (horoObj.getMinuteOfLongitude());
		SmsHoro.setLatitudeMinute (horoObj.getMinuteOfLattitude());
		SmsHoro.setEastWest (horoObj.getEastWest());
		SmsHoro.setNorthSouth (horoObj.getNorthSouth());
      	SmsHoro.setDst("0");
		SmsHoro.setTimeZone(horoObj.getTimeZone());
		//SmsHoro.setLanguageCode(languageCode);
		try{
		SmsHoro.initializeRequest(Integer.parseInt(horoObj.getLanguageCode()));
		}
		catch(Exception e){
			e.printStackTrace();
		}
		//String dailyPrediction = SmsHoro.getMiscPrediction();
		//return dailyPrediction;
		
		return SmsHoro;
		
		
		//RequestProcessing SmsHoro = new RequestProcessing();
		//SmsHoro.getPersonalizedPrediction(horoObj);
		//return SmsHoro;
	}
	
	
	public static LinkedHashMap<Integer, String> sortHashMapByValues(
	        HashMap<Integer, String> passedMap) {
	    List<Integer> mapKeys = new ArrayList<>(passedMap.keySet());
	    List<String> mapValues = new ArrayList<>(passedMap.values());
	    Collections.sort(mapValues);
	    Collections.sort(mapKeys);

	    LinkedHashMap<Integer, String> sortedMap =
	        new LinkedHashMap<>();

	    Iterator<String> valueIt = mapValues.iterator();
	    while (valueIt.hasNext()) {
	        String val = valueIt.next();
	        Iterator<Integer> keyIt = mapKeys.iterator();

	        while (keyIt.hasNext()) {
	            Integer key = keyIt.next();
	            String comp1 = passedMap.get(key);
	            String comp2 = val;

	            if (comp1.equals(comp2)) {
	                keyIt.remove();
	                sortedMap.put(key, val);
	                break;
	            }
	        }
	    }
	    return sortedMap;
	}

	
   
}
