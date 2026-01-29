package com.ojassoft.astrosagecloud.util;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.lalkitab.LalKitab;

public class SharedFunction 
{
	/**
	 * Return a string with the first letter of the word capitalized
	 */
	public static String ProperCase(String X)
	{
		String changedSentence = "";
		if(X != null && !X.equals(""))
		{
	    	String[] words = X.toLowerCase().split(" ");
	 		
	 		for(String word : words)
	 		{
	 			String temp = String.valueOf(word.charAt(0)).toUpperCase();
	 			
	 			if(word.length() > 1)
	 			{
		 			temp += word.substring(1);
		 			
	 			}
	 			changedSentence += temp + " ";
	 		}
		}
 		return changedSentence.trim();
	}
	
	/**
	 * Every first letter of the word in a sentence is capitalized.
	 * @param X - The Sentence which is to be changed
	 * @param Y - languageCode
	 * @return String
	 */
	public static String ProperCaseL(String X,int Y)
	{
		String changedSentence = X;
		 if (Y == 0) 
		 {
		     if (X != null) 
		     {
		    	 changedSentence = ProperCase(X);
		     }
		 }
		 return changedSentence;
	}

	
	public static int IIIf(boolean condition, int truecase, int falsecase){
		if(condition){
			return(truecase);
		}
		else
		{
			return(falsecase);
		}
	}

	public int getPlanetBhavaPosition(double planetLongitude, double[] cuspsLongitudes){
	double pl, d3, startd, endd;    
	int bhava=0;
	pl = planetLongitude;
	d3=0.0;
	for(int j=0;j<=11;j++){    	
		startd = cuspsLongitudes[j];
		endd = cuspsLongitudes[IIIf(j >= 11, j - 11, j + 1)];
		if(startd > endd){
			d3 = endd;
			endd = endd +360;
		}
		  	if(d3!= 0) { 
			if(pl < d3){
			  pl = pl + 360;
			  d3 = 0;
		  		}
		  	}
		 if(pl >= startd && pl < endd){
		bhava = j + 1;
			break;
		 }
	}
	return(bhava);
	}

	/**
	 * This method returns the suffix that needs to be attached to the passed in number (bhava).
	 * @param bhava
	 * @return String
	 */
	public static String NoSuffix(int bhava)
	{
		String returnVal = "th";
		if(bhava == 1)
			returnVal = "st";
		else if (bhava== 2)
			returnVal = "nd";
		else if(bhava == 3)
			returnVal = "rd";
		return returnVal;
	}

	/**
	 * This method returns the ayanamsa corresponding to the ayanamsa type of the Horoscope Object.
	 * @param obj
	 * @return String
	 */
	public static String getAyan(DesktopHoro obj)
	{
		String result = "0";
		int ayanamsaType = obj.getAyanamsaType();
		if (ayanamsaType == 1)
		{
			int kpAyan = obj.getKPAyanamsaType();
		    if (kpAyan == 0) 
		    {
		    	result = "1"; //KP New
		    }
		    else if (kpAyan == 1)
		    {
		    	result = "2"; //KP Old
		    }
		    else if(kpAyan == 2)
		    {
		    	result = "4"; //KP Khullar
		    }
		}
		else if (ayanamsaType == 2) 
		{
			result = "3";  // Raman
		}
		else if (ayanamsaType == 3) 
		{
			result = "5";  // Sayan
		}
		else if (ayanamsaType == 4) 
		{
			result = "6";  // Customized
		}
		
		return result;
	}
	
	public static String getAyanName(DesktopHoro obj)
	{
		String result = "Lahiri";
		int ayanamsaType = obj.getAyanamsaType();
		if (ayanamsaType == 1)
		{
			int kpAyan = obj.getKPAyanamsaType();
		    if (kpAyan == 0) 
		    {
		    	result = "KP New"; //KP New
		    }
		    else if (kpAyan == 1)
		    {
		    	result = "KP Old"; //KP Old
		    }
		    else if(kpAyan == 2)
		    {
		    	result = "KP Khullar"; //KP Khullar
		    }
		}
		else if (ayanamsaType == 2) 
		{
			result = "Raman";  // Raman
		}
		else if (ayanamsaType == 3) 
		{
			result = "Sayan";  // Sayan
		}
		else if (ayanamsaType == 4) 
		{
			result = "Customized";  // Customized
		}
		
		return result;
	}

	public static String NoSuffix(String number)
	{
		String returnVal = "";
		try
		{
			returnVal = NoSuffix(Integer.parseInt(number));
		}
		catch(Exception e)
		{
			
		}
		
	    return returnVal;
	}
    
public LalKitab getLalKitab(DesktopHoro myAstrologyObject)
{
	
	LalKitab objLalKitab = new LalKitab();
	objLalKitab.setName(myAstrologyObject.getName());
	objLalKitab.setPlace(myAstrologyObject.getPlace());
	objLalKitab.setTimeZone(myAstrologyObject.getTimeZone());
	objLalKitab.setMaleFemale(myAstrologyObject.getMaleFemale());
	objLalKitab.setSecondOfBirth(myAstrologyObject.getSecondOfBirth());
	objLalKitab.setMinuteOfBirth(myAstrologyObject.getMinuteOfBirth());
	objLalKitab.setHourOfBirth(myAstrologyObject.getHourOfBirth());
	objLalKitab.setDayOfBirth(String.valueOf(myAstrologyObject.getDayOfBirth()));
	objLalKitab.setMonthOfBirth(String.valueOf(myAstrologyObject.getMonthOfBirth()));
	objLalKitab.setYearOfBirth(String.valueOf(myAstrologyObject.getYearOfBirth()));
	objLalKitab.setDegreeOfLongitude(myAstrologyObject.getDegreeOfLongitude());
	objLalKitab.setMinuteOfLongitude(myAstrologyObject.getMinuteOfLongitude());
	objLalKitab.setSecondOfLongitude(myAstrologyObject.getSecondOfLongitude());
	objLalKitab.setDegreeOfLattitude(myAstrologyObject.getDegreeOfLattitude());
	objLalKitab.setMinuteOfLattitude(myAstrologyObject.getMinuteOfLattitude());
	objLalKitab.setSecondOfLattitude(myAstrologyObject.getSecondOfLattitude());
	objLalKitab.setEastWest(myAstrologyObject.getEastWest());
	objLalKitab.setNorthSouth(myAstrologyObject.getNorthSouth());
	objLalKitab.setDST(myAstrologyObject.getDST());
	objLalKitab.setLanguageCode("0");
	try{
	objLalKitab.initialize();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}

	return(objLalKitab);
}
public static int[] getRaashi(int ascendent){
	int[] raashiNo =  new int[13]; 
	int i;
	raashiNo[0] = ascendent;
		    for(i = 0 ;i<=11 - ascendent ; i++){
		    raashiNo[i + 1] = raashiNo[i] + 1;
		    }
		    int k = i;
		  for(int j = 0; j <=10 - k ; j++){
		   raashiNo[i + 1] = j + 1;
		   i = i + 1;
		  }
		  return raashiNo; 
}

public static int modOf(int value , int base){
	int result = value - (int)(value/base)*base;
	return result;
}

public static String encryptstring(String stringtobeencrypt)
{          String encryptedstring ="";
	      int lengthofstr = stringtobeencrypt.length();
		    for(int  i=0 ;i<=lengthofstr-1 ;i++){    
		    	String ch = stringtobeencrypt.substring(i,i+1);
		        String tempval = Integer.toHexString((int)(ch.charAt(0)));
		        if(tempval.length() < 2 ){
		            tempval = "0"+tempval;
		        }      
		        
		        encryptedstring = encryptedstring + tempval.toLowerCase();
		    }  
		    return encryptedstring;
}

public static String decryptstring(String stringtobedecrypt)  {  
String decryptedstring="";
 char tempval;
int lengthofstr = stringtobedecrypt.length();
for(int  i=0 ;i<=lengthofstr-1; i+=2){   
        tempval = ((char)Integer.parseInt(String.valueOf((Long.decode("0x"+(stringtobedecrypt.substring(i, i+2)))))));
      decryptedstring = decryptedstring + tempval;
}

    return decryptedstring;
}

public static boolean isvalidemail(String email)
{
	String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
    //String email1 = "user@domain.com";
    Boolean b = email.matches(EMAIL_REGEX);
	return b;   
}

public static String DeCrypt(String strEncrypted)
{
	//String key = readFile("c:\\logs\\key.txt");
	String key = "9%EY&$R$>P<K5N*S3[9PJ7RY9[XGFQJLLP#TQ36;NAP05Y792'R.GX1=-@LGD%G$;XI&)E9OO.5H31;Y%9^II9X<,@T(SL&^EC6`4%VA]VV*#*LQ]#+1=@F18[#^9KO;K1VN',N7FK@CUSQ(ROK=D4;`JQ]S1=W==R<:ZBV7O8NS:FO`-)H)QV7D]%DHX17<0*($X[UXLT?4HPPB#>`S2O?R@ZL(OJ0;3]K5=M^-VMGIR9;]QNPA.>Y91E].],22`@&GX<ZA5#G$?J'J0SM[9U?+2M;Z?T($WI]Q`@TUKG*@O=PD*U%5^13@*V@*G?JM$#Q@FS54_>%0YWX^:=#$]NEB:`)Z3=R3>53KXABMP41@P9]RO&.8=[ZHK<.FA#4Y#:N5_^O6%L&$_#Z250`$(Y(&J*[1*TYR@G.V?(*]J2UHM3?VWEJ90S.7Q.+.71_`+81S;$-5*U`9T5*GB163^H.U`Q:O0FKZZ*>;`7C0B%^E$3";
	String decryptedString = "";
	int iKeyChar,iStringChar, iDecryptChar;
  
   for(int i = 0;i< strEncrypted.length();i++)
   {
	   iKeyChar = (int)key.charAt(i);
       iStringChar = (int)strEncrypted.charAt(i);
      //' *** uncomment below to decrypt with subtraction	
      iDecryptChar = iStringChar - iKeyChar;
      iDecryptChar = iKeyChar ^ iStringChar;
      decryptedString =  decryptedString + String.valueOf((char)iDecryptChar);
   }
   return decryptedString;
}

public static String EnCrypt(String strEncrypted)
{
	//String key = readFile("c:\\logs\\key.txt");
	String key = "9%EY&$R$>P<K5N*S3[9PJ7RY9[XGFQJLLP#TQ36;NAP05Y792'R.GX1=-@LGD%G$;XI&)E9OO.5H31;Y%9^II9X<,@T(SL&^EC6`4%VA]VV*#*LQ]#+1=@F18[#^9KO;K1VN',N7FK@CUSQ(ROK=D4;`JQ]S1=W==R<:ZBV7O8NS:FO`-)H)QV7D]%DHX17<0*($X[UXLT?4HPPB#>`S2O?R@ZL(OJ0;3]K5=M^-VMGIR9;]QNPA.>Y91E].],22`@&GX<ZA5#G$?J'J0SM[9U?+2M;Z?T($WI]Q`@TUKG*@O=PD*U%5^13@*V@*G?JM$#Q@FS54_>%0YWX^:=#$]NEB:`)Z3=R3>53KXABMP41@P9]RO&.8=[ZHK<.FA#4Y#:N5_^O6%L&$_#Z250`$(Y(&J*[1*TYR@G.V?(*]J2UHM3?VWEJ90S.7Q.+.71_`+81S;$-5*U`9T5*GB163^H.U`Q:O0FKZZ*>;`7C0B%^E$3";
	String decryptedString = "";
	int iKeyChar,iStringChar, iDecryptChar;
  
   for(int i = 0;i< strEncrypted.length();i++)
   {
	   iKeyChar = (int)key.charAt(i);
       iStringChar = (int)strEncrypted.charAt(i);
      //' *** uncomment below to decrypt with subtraction	
      iDecryptChar = iStringChar + iKeyChar;
      iDecryptChar = iKeyChar ^ iStringChar;
      decryptedString =  decryptedString + String.valueOf((char)iDecryptChar);
   }
   return decryptedString;
}

/**
 * This method returns the encrypted string.
 * @param strEncrypted
 * @return String
 */
public static String encryptString(String strEncrypted)
{
	String encryptedString = "";
	for(int i = 0;i< strEncrypted.length();i++)
   {
	   int iKeyChar = (int)strEncrypted.charAt(i);
	   char x = (char)(iKeyChar+1);
	   encryptedString += x;
   }
   return encryptedString;
}

public static boolean isNumeric(String string) {
    return string.matches("^[-+]?\\d+(\\.\\d+)?$");
}

public static String readFile(String fileName)
{
	String data = "";
	try
	{
	
		data = new String(Files.readAllBytes(Paths.get(fileName)));
	}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("Could not read file : "+fileName);
	}
    return data;
}

public static String monthName(int monthN)
{

	String mon="";

 	switch(monthN)
 	{
   		case 1 : mon = "JANUARY";
   				 break;
   		case 2 : mon = "FEBRUARY";
   				 break;
    	case 3 : mon = "MARCH";
    			 break;
    	case 4 : mon = "APRIL";
    			 break;
    	case 5 : mon = "MAY";
    			 break;
    	case 6 : mon = "JUNE";
    			 break;
    	case 7 : mon = "JULY";
    			 break;
    	case 8 : mon = "AUGUST";
    			 break;
    	case 9 : mon = "SEPTEMBER";
    			 break;
		case 10 : mon = "OCTOBER";
				 break;
		case 11 : mon = "NOVEMBER";
				 break;
		case 12 : mon = "DECEMBER";	    
    }
    
    return mon;
}

/**
 * This method evaluates if the request is coming from mobile.
 * @param request
 * @return boolean
 */
public static boolean Is_Mobile(HttpServletRequest request){
boolean result = false;
  String pattern = "(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone|windows ce|pda|mobile|mini|palm|ipad|Android|BlackBerry|PlayBook|iPhone|iPod|Palm|Symbian)";

 String matchString = request.getHeader("user-agent");
      // Create a Pattern object
  Pattern r = Pattern.compile(pattern);
     // Now create matcher object.
      Matcher m = r.matcher(matchString);
      if (m.find( )) {
  //MatchM = Regex.test(Request.ServerVariables("HTTP_USER_AGENT"))
    result= true;
      }else{
    	  result = false;
      }
      return result;
  }
//***************** fetch DST or not from Time_Zone_String ***************
public static boolean isDst(String timezoneString, Date date) {
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
   /* cal.set(Calendar.HOUR_OF_DAY, 23);
    cal.set(Calendar.MINUTE, 0);
    cal.set(Calendar.SECOND, 0);
    cal.set(Calendar.MILLISECOND, 0);*/
    Date dateTime = cal.getTime();
    boolean inDs;
    try {
        TimeZone tz = TimeZone.getTimeZone(timezoneString);
        inDs = tz.inDaylightTime(dateTime);
    } catch (Exception ex) {
        inDs = false;
    }
    return inDs;
}

public static String dms(double x) {
	String parts[] = new String[3];
	double temp;
	String sdms;
	int deg = (int) x;
	parts[0] = makelength(String.valueOf(deg), 2);
	temp = (x - (double) ((int) x));
	int min = (int) (temp * 60);
	parts[1] = makelength(String.valueOf(min), 2);
	temp = temp * 60;
	temp = (temp - (double) ((int) temp));
	int sec = (int) (temp * 60 );
	
	parts[2] = makelength(String.valueOf(sec), 2);
	sdms = parts[0] + ":" + parts[1] + ":" + parts[2];
	return sdms;
}

/**
 * Added by Ankit on 13-feb-2020
 * @param x
 * @return
 */
public static String getdms(double x) {
	String parts[] = new String[3];
	double temp;
	String sdms;
	int deg = (int) x;
	parts[0] = makelength(String.valueOf(deg), 2);
	temp = (x - (double) ((int) x));
	int min = (int) (temp * 60);
	parts[1] = makelength(String.valueOf(min), 2);
	temp = temp * 60;
	temp = (temp - (double) ((int) temp));
	int sec = (int) (temp * 60 );
	
	parts[2] = makelength(String.valueOf(sec), 2);
	sdms = parts[0] + "°" + parts[1] + "'" + parts[2] + "\"";
	return sdms;
}

public static String makelength(String x, int y) {
	int diff = y - x.length();
	for (int i = 0; i < diff; i++)
		x = "0" + x;
	return x;
}

//Function For getPlanetInBhav
public static int GetPlanetInBhava(int AscendentPosition ,int  planetPosition) {
    int tempBhava; 
    tempBhava = planetPosition - AscendentPosition + 1 ;
    if( tempBhava <= 0)
    	{
    	tempBhava = tempBhava + 12;
    	}
   return tempBhava;
}

public String getTime(String hour, String minute)
{
	String returnTime = "";
	int hr = Integer.parseInt(hour);
	int min = Integer.parseInt(minute);
	if(hr < 12)
	{
		returnTime = hour+":"+minute+" AM";
	}
	else if (hr > 12)
	{
		returnTime = (hr-12)+":"+minute+" PM";
	}
	else if(hr == 12)
	{
		returnTime = hour+":"+minute+" PM";
	}
	return returnTime;
}

/**
 * @param queryString
 * @return
 */
public static String getLastUriFromQueryString(String queryString){
	String tokens[] = queryString.split("/");
	int length = tokens.length;
	String tokensArray = tokens[length-1];
	
	
	return tokensArray;
	
}

}




