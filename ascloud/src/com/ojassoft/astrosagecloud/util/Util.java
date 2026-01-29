package com.ojassoft.astrosagecloud.util;

import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.localization.Hindi;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;

import java.util.Enumeration;


public class Util 
{

int signs;
	int varga[][];
	/**
	 * This method is called to identify if the application is being accessed from a mobile.
	 * @param request
	 * @return boolean
	 */
	public int getHouseLord(int houseNo,int rashi) {
		   int owner[] = { 3, 6, 4, 2, 1, 4, 6, 3, 5, 7, 7, 5 };
		   int rasiInHouse = houseNo + getPlanetsSign(rashi) - 1;
		   if (rasiInHouse > 12)
		      rasiInHouse -= 12;
		   return owner[rasiInHouse - 1];
		}

		public int getPlanetsSign(int planet) {
		   return planet;
		   // return varga[planet][0];
		}
	public void initialize(int signArray) {
		   signs = signArray; // Sun at 1, Lagna at 0

		}
	public void setVarga(int varga[][]) {
		this.varga = varga;
		}
	
	public int getHouseLord(int houseNo) {
		int owner[] = { 3, 6, 4, 2, 1, 4, 6, 3, 5, 7, 7, 5 };
		int rasiInHouse = houseNo + getPlanetsSign(0) - 1;
		if (rasiInHouse > 12)
		rasiInHouse -= 12;
		return owner[rasiInHouse - 1];
		}
	
	public String getHouseLordName(int planetNuber) {
		String lordName = "";
		switch (planetNuber) {
		case 1:
		lordName = "SURYA";
		break;
		case 2:
		lordName = "MOON";
		break;
		case 3:
		lordName = "MARS";
		break;
		case 4:
		lordName = "MERCURY";
		break;
		case 5:
		lordName = "JUPITER";
		break;
		case 6:
		lordName = "VENUS";
		break;
		case 7:
		lordName = "SATURN";
		break;

		default:
		break;
		}

		return lordName;

		}
	
	public int[] getPositionForShodasvarg(int position) {
		int shodaspoint[] = new int[13];
		for (int i = 0; i < 13; i++)
		shodaspoint[i] = this.varga[i][position];
		return shodaspoint;
		}
	/**
	 * This method is called to identify if the application is being accessed from a mobile.
	 * @param request
	 * @return boolean
	 */
	
	public static boolean isMobileDevice(HttpServletRequest request) {
		 String ua = request.getHeader("User-Agent");
		 if(ua!=null){
			 //Comment by ambuj on 21/07/2016
			 //ua=ua.toLowerCase();
//			if ((ua.indexOf("mobile") != -1) || (ua.matches("(?i).*((android|bb\\d+|meego).+mobile|avantgo|bada\\/|blackberry|playbook|blazer|compal|elaine|ipad|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\\.(browser|link)|vodafone|wap|windows ce|xda|xiino).*"))
//					|| (ua.length() >=4 && ua.substring(0, 4)
//							.matches(
//									"(?i)1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\\-|your|zeto|zte\\-"))) 
			 if(ua.matches("(?i).*(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone|windows ce|pda|mobile|mini|palm|ipad|Android|BlackBerry|PlayBook|iPhone|iPod|Palm|Symbian).*"))
			 {
				return true;
			} else 
				return false;
		 }
		 else
			 return false;
		}
	
	public HashMap<String, String[]> planetsVedicAstrology(JSONObject ObjPlanetJSON, MyResourceBundle constants)
	{
		HashMap<String, String[]> hm = new HashMap<String, String[]>();
		
		try
		{
			String planetName = ObjPlanetJSON.getString("PlanetName");
			String planetNameConstant = constants.getString(planetName);
			String sign = ObjPlanetJSON.getString("Sign");
			String relationship = ObjPlanetJSON.getString("Relationship");
			String lordOf = ObjPlanetJSON.getString("LordOf").replace(",0", "");
			int house = ObjPlanetJSON.getInt("House");
			String aspectFrom = ObjPlanetJSON.getString("AspectsFrom");
			String FullPlanetAspectsValues = "";
			String AspectsPlanetLord = "";
			String AspectsPlanetName = "";
			String FullPlanetAspectsValues_HI = "";
			String relationshipProperties = "-";
			try
			{
				relationshipProperties = constants.getString(relationship.toUpperCase()+"_RELATION");
			}
			catch(Exception e)
			{
				
			}
			
			String[] Planetaspects1 = {"Your " + planetName + " is in "+ sign +" sign which is a "+ relationship +" sign for "+ planetName +". "+ planetName + " is lord of " + lordOf + " house and situated in " + house +SharedFunction.NoSuffix(house) + " house. "  + planetName + " aspects "+ FullPlanetAspectsValues + " house.","à¤†à¤ªà¤•à¥€ à¤•à¥�à¤£à¥�à¤¡à¤²à¥€ à¤®à¥‡à¤‚ " + ConvertPlanetNameinHI(planetName) +" "+ ConvertSignNameinHI(sign) +" à¤°à¤¾à¤¶à¤¿ à¤®à¥‡à¤‚ à¤¸à¥�à¤¥à¤¿à¤¤ à¤¹à¥ˆ, à¤œà¥‹ à¤•à¥€ " + ConvertPlanetNameinHI(planetName) + " à¤•à¥€ "+ constants.getString(relationship.toUpperCase()+"_RELATION") +" à¤¹à¥ˆà¥¤ "+ ConvertPlanetNameinHI(planetName) +" "+ AspectsPlanetLord + " à¤˜à¤° à¤•à¤¾ à¤¸à¥�à¤µà¤¾à¤®à¥€ à¤¹à¥‹à¤•à¤° à¤†à¤ªà¤•à¥€ à¤•à¥�à¤£à¥�à¤¡à¤²à¥€ à¤®à¥‡à¤‚ " + Common.hindiNumbers[house-1]  + " à¤˜à¤° à¤®à¥‡à¤‚ à¤¸à¥�à¤¥à¤¿à¤¤ à¤¹à¥ˆà¥¤ "  + ConvertPlanetNameinHI(planetName) + " à¤•à¥€ à¤¦à¥ƒà¤·à¥�à¤Ÿà¤¿ "+ FullPlanetAspectsValues_HI + " à¤˜à¤° à¤ªà¤° à¤¹à¥ˆà¥¤ ","Your " + planetNameConstant + " is in "+ constants.getString(sign+"_FULL") +" sign which is a '"+ relationshipProperties +"' sign for "+ planetNameConstant +". "+ planetNameConstant + " is lord of " + lordOf + " house and situated in " + house+SharedFunction.NoSuffix(house) + " house. "  + planetNameConstant + " aspects "+ FullPlanetAspectsValues + " house."};
			String[] Planetaspects2 = {"Your " + planetName + " is in "+ sign +" sign which is a "+ relationship +" sign for "+ planetName +". "+ planetName + " is lord of " + lordOf + " house and situated in " + house +SharedFunction.NoSuffix(house) + " house. "  + planetName + " aspects "+ FullPlanetAspectsValues + " house and aspected by "+ aspectFrom +".","à¤†à¤ªà¤•à¥€ à¤•à¥�à¤£à¥�à¤¡à¤²à¥€ à¤®à¥‡à¤‚ " + ConvertPlanetNameinHI(planetName) +" "+ ConvertSignNameinHI(sign) +" à¤°à¤¾à¤¶à¤¿ à¤®à¥‡à¤‚ à¤¸à¥�à¤¥à¤¿à¤¤ à¤¹à¥ˆ, à¤œà¥‹ à¤•à¥€ " + ConvertPlanetNameinHI(planetName) + " à¤•à¥€ "+ relationshipProperties +" à¤¹à¥ˆà¥¤ "+ ConvertPlanetNameinHI(planetName) +" "+ AspectsPlanetLord + " à¤˜à¤° à¤•à¤¾ à¤¸à¥�à¤µà¤¾à¤®à¥€ à¤¹à¥‹à¤•à¤° à¤†à¤ªà¤•à¥€ à¤•à¥�à¤£à¥�à¤¡à¤²à¥€ à¤®à¥‡à¤‚ " + Common.hindiNumbers[house-1]  + " à¤˜à¤° à¤®à¥‡à¤‚ à¤¸à¥�à¤¥à¤¿à¤¤ à¤¹à¥ˆà¥¤ "  + ConvertPlanetNameinHI(planetName) + " à¤•à¥€ à¤¦à¥ƒà¤·à¥�à¤Ÿà¤¿ "+ FullPlanetAspectsValues_HI + " à¤˜à¤° à¤ªà¤° à¤¹à¥ˆà¥¤ "+ AspectsPlanetName +" à¤•à¥€ à¤ªà¥‚à¤°à¥�à¤£ à¤¦à¥ƒà¤·à¥�à¤Ÿà¤¿ "+ ConvertPlanetNameinHI(planetName)+" à¤ªà¤° à¤¹à¥ˆà¥¤","Your " + planetNameConstant+ " is in "+ constants.getString(sign+"_FULL") +" sign which is a "+ relationshipProperties +" sign for "+ planetNameConstant +". "+ planetNameConstant + " is lord of " + lordOf + " house and situated in " + house+SharedFunction.NoSuffix(house) + " house. "  + planetNameConstant + " aspects "+ FullPlanetAspectsValues + " house and aspected by '"+ aspectFrom +"'."};
			String[] Planetaspects3 = {"Your " + planetName + " is in "+ sign +" sign."+ planetName +" is situated in " +house+SharedFunction.NoSuffix(house) + " house. "  + planetName + " aspects "+ FullPlanetAspectsValues + " house.","à¤†à¤ªà¤•à¥€ à¤•à¥�à¤£à¥�à¤¡à¤²à¥€ à¤®à¥‡à¤‚ " + ConvertPlanetNameinHI(planetName) +" "+ ConvertSignNameinHI(sign) +" à¤°à¤¾à¤¶à¤¿ à¤®à¥‡à¤‚ à¤¸à¥�à¤¥à¤¿à¤¤ à¤¹à¥ˆà¥¤ "+ ConvertPlanetNameinHI(planetName)+" "+ Common.hindiNumbers[house-1]  + " à¤˜à¤° à¤®à¥‡à¤‚ à¤¸à¥�à¤¥à¤¿à¤¤ à¤¹à¥ˆà¥¤ " + ConvertPlanetNameinHI(planetName) + " à¤•à¥€ à¤¦à¥ƒà¤·à¥�à¤Ÿà¤¿ "+ FullPlanetAspectsValues_HI + " à¤˜à¤° à¤ªà¤° à¤¹à¥ˆà¥¤ ","Your " + planetNameConstant + " is in "+ sign +" sign."+ planetName +" is situated in " + house+SharedFunction.NoSuffix(house) + " house. "  + planetName + " aspects "+ FullPlanetAspectsValues + " house."};
			String[] Planetaspects4 = {"Your " + planetName + " is in "+ sign +" sign."+ planetName +" is situated in " + house+SharedFunction.NoSuffix(house) + " house. "  + planetName + " aspects "+ FullPlanetAspectsValues + " house and aspected by "+ aspectFrom +".","à¤†à¤ªà¤•à¥€ à¤•à¥�à¤£à¥�à¤¡à¤²à¥€ à¤®à¥‡à¤‚ ","Your " + planetNameConstant + " is in "+ sign +" sign."+ planetName +" is situated in " + house+SharedFunction.NoSuffix(house) + " house. "  + planetName + " aspects "+ FullPlanetAspectsValues + " house and aspected by "+ aspectFrom +"."};
			
			hm.put("Planetaspects1", Planetaspects1);
			hm.put("Planetaspects2", Planetaspects2);
			hm.put("Planetaspects3", Planetaspects3);
			hm.put("Planetaspects4", Planetaspects4);
		}
		catch(Exception e)
		{
			
		}
		return hm;
	}
	
	/**
	 * This method localizes 'BalanceOfDasha' (i.e. returns the balance of dasha in the language preferred
	 * by the user.
	 * @param balDasha
	 * @param languageCode
	 * @param rb
	 * @return String
	 */
	public static String localizeBalOfDasha(String balDasha, int languageCode, MyProperties rb)
	{
		String balOfDashaFull = balDasha;
	    String[] arrBalDasha= balDasha.split(" ",2);
	    String dashaName = arrBalDasha[0];
	     switch(languageCode)
	     {
	        case 0:
	        	balOfDashaFull = balDasha;
	            break;
	        case 1:
	        	Hindi hindi = new Hindi();
	            String arrHindiDasha = hindi.unicode(balDasha, languageCode);
	            String[] hindiDashaParts = arrHindiDasha.split(" ",2);
	            String hindiDashaName = hindiDashaParts[0];
	            //This replacement is different from the one in ASP because hindi.unicode returns different values. In ASP, since there is 
	            //no distinction between lettercase, it returns à¤²à¥�,à¤¡,à¤•à¥� for Y,M,D.(which is same as y,m,d). But in JAVA it is case sensitive.
	            balOfDashaFull = hindiDashaName + " " + ((hindiDashaParts[1].replace("ल्","वर्ष")).replace("ड"," माह ")).replace("क्"," दिन ");

	            break;
	        case 2:
	        	balOfDashaFull = rb.getString(dashaName)+" "+((arrBalDasha[1].replace("Y","வருடம்")).replace("M"," மாதம் ")).replace("D"," தினம் ");
	        	break;
	        case 5:
	            balOfDashaFull = rb.getString(dashaName)+" "+((arrBalDasha[1].replace("Y","సంవత్సరం")).replace("M"," నెల ")).replace("D"," రోజు ");
	            break;
	        case 6:
	        	balOfDashaFull = rb.getString(dashaName)+" "+((arrBalDasha[1].replace("Y","বর্ষ")).replace("M"," মাস ")).replace("D"," দিন ");
	            break;
	        case 7:
	        	balOfDashaFull = rb.getString(dashaName)+" "+((arrBalDasha[1].replace("Y","વર્ષ")).replace("M"," મહિનો ")).replace("D"," દિવસ ");
	        	break;
	        case 8:
	        	balOfDashaFull = rb.getString(dashaName)+" "+((arrBalDasha[1].replace("Y","വർഷം")).replace("M"," മാസം ")).replace("D"," ദിവസം ");
	        	break;
	        case 9:
	        	balOfDashaFull = rb.getString(dashaName)+" "+((arrBalDasha[1].replace("Y","वर्ष")).replace("M"," माह ")).replace("D"," दिन ");
	            break;
	        case 4:
	            balOfDashaFull = rb.getString(dashaName)+" "+((arrBalDasha[1].replace("Y","ವರ್ಷ")).replace("M","ತಿಂಗಳು")).replace("D","ದಿನ");
	            break;
	        default:
	        	balOfDashaFull = balDasha;
	        	break;
	     } 
	    return balOfDashaFull;
	}
	
	/**
	 * This method checks if the passed in string is null, then it returns a blank string.
	 * If not, it checks if the string containd 'cast' or 'char(', If yes it returns a string 'gotoastrocamp'.
	 * If not, then it replaces ' with '' and returns the string.
	 * @param theval
	 * @return String
	 */
	public static String safestr(String theval)
	{
		String returnVal = "";
		if(theval != null)
		{
			if(theval.indexOf("cast(") > 0 || theval.indexOf("char(") > 0)
			{
				returnVal = "gotoastrocamp";
			}
			else
			{
				returnVal= theval.replace("'", "''").trim();
			}
		}
		return returnVal;
	}
	
	
	/**
	 * This method checks if the passed in string is null, then it returns a blank string.
	 * If not, it checks if the string containd 'cast' or 'char(', If yes it returns a string 'gotoastrocamp'.
	 * If not, then it replaces ' with '' and returns the string.
	 * @param theval
	 * @return String
	 */
	public static String safestrWithNull(String theval)
	{
		String returnVal = "";
		if(theval != null)
		{
			if(theval.indexOf("cast(") > 0 || theval.indexOf("char(") > 0)
			{
				returnVal = "gotoastrocamp";
			}
			else
			{
				returnVal= theval.replace("'", "''").trim();
			}
			
			if(theval.equalsIgnoreCase("null")) {
				returnVal = "";
			}
		}
		
		return returnVal;
	}
	
	/**
	 * This method takes an object and checks if it is null, then returns a blank string.
	 * If it is not null, then it calls the above method to check and return the corresponding string value.
	 * @param theval
	 * @return String
	 */
	public static String safestr(Object theval)
	{
		String returnVal = "";
		if(theval != null)
		{
			returnVal = safestr(theval.toString());
		}
		return returnVal;
	}
	
	
	/**
	 * This method checks if the passed in object is null or blank, then it returns 0, else 
	 * it returns the integer value.
	 * @param theval
	 * @return int
	 */
	public static int safeInt(Object theval)
	{
		int returnVal = 0;
		if(theval != null)
		{
			returnVal = safeInt(theval.toString());
		}
		return returnVal;
	}
	
	/**
	 * This method checks if the passed in object is null or blank, then it returns 0, else 
	 * it returns the integer value as a string.
	 * @param theval
	 * @return String
	 */
	public static String safeStringInt(Object theval)
	{
		int returnVal = 0;
		try
		{
			if(theval != null)
			{
				returnVal = safeInt(theval.toString());
			}
		}
		catch(Exception e)
		{
			// do nothing
		}
		return returnVal+"";
	}
	
	/**
	 * This method checks if the passed in string is null or blank, then it returns 0, else 
	 * it returns the integer value.
	 * @param theval
	 * @return
	 */
	public static int safeInt(String theval)
	{
		int returnVal = 0;
		if(theval != null && !theval.trim().equals(""))
		{
			returnVal = Integer.parseInt(theval);
		}
		return returnVal;
	}
	
	/**
	 * This method checks if the passed in string is null or blank, then it returns float value 0, else 
	 * it returns the float value.
	 * @param theval
	 * @return
	 */
	public static float safeFloat(String theval)
	{
		float returnVal = 0.0f;
		if(theval != null && !theval.trim().equals(""))
		{
			returnVal = Float.parseFloat(theval);
		}
		return returnVal;
	}
     
	/**
	 * This method returns the date expressed in hindi by making use of the Pre-defined Constant values of
	 * English and Hindi Month names.
	 * @param dateEN
	 * @param isNumeric
	 * @return
	 */
	public static String getHindiDateNameHI(String dateEN, boolean isNumeric)
	{
		String date_HI = "";
		String dt = "";
		String onlyDate = "";
		if( isNumeric)
		{
		  String[] temp = dateEN.split(" ");
		  dt = temp[0];
		  onlyDate = temp[1];
		} else
		{
		  dt = dateEN.trim();
		}
		for(int i=0;i<=Common.engMonthNames.length;i++)
		{
			if(Common.engMonthNames[i].equals(dt))
			{
				date_HI = Common.hindiMonthNames[i];
			}
		}
		if(isNumeric)
		  date_HI = date_HI +" "+onlyDate;
		return date_HI;
	}
	
	/**
	 * This method returns the translation of 'passed in key' in the language(corresponding to the languageCode)
	 * as desired. It makes use of the DictionaryConstants class which contains arrays of 9 languages written in
	 * corresponding order. The English array will have the values in the same order as in the other languages.
	 * Note: This method only works if the passed in language code is other than 0(English).
	 * Logic: 1)Get the Language Specific DictionaryConstants. (It is an array of 68 arrays).
	 * 2)Execute the following steps in a loop of 68 (until it ends or it finds a match to the passed in key).
	 *   a) Split the English DictionaryConstants array with the delimiter "ÿ" and name it keyArray
	 *   b) Split the LanguageSpecific DictionaryConstants array with the delimiter "ÿ" and name it valueArray.
	 *   c) Check if both the array size is not equal, log an error.
	 *   d) Execute the following step in a loop of arraySize.
	 *      i) If key matches the keyArray[j], corresponding valueArray[j] is retrieved.
	 *         Since both arrays are in order, this is the translated value of english key in desired language.
	 *         break from the loop.
	 *      ii) Else continue.
	 *   e) If match is found, break from the loop, else continue.
	 *        
	 * @param key
	 * @param langCode
	 * @return String (Translated value of English Key in the desired language(corresponding to languageCode).
	 */
	public static String getValuesFromDictionary(String key, int langCode) 
	{
		//String returnVal = key;
		
		String returnVal = "";
	    
	    if(langCode !=0)
	    {
	    	//returnVal = "";
	    	if(key.indexOf(",") > 0)
	    	{
	    		String[] splitedvalues = key.split(",");
	            for(int i=0;i<splitedvalues.length;i++)
	            {
	                returnVal = returnVal + splitedvalues[i] +",";
	            }
	            returnVal = returnVal.replaceAll(",$","");
	    	} 
            else
            {
            	
            	//HashMap<String, String> hm = new HashMap<String, String>();
            	String[] dictionaryConstants = DictionaryConstants.langConstants[langCode];
            	for(int i=0;i<=67;i++)
            	{
            		String[] keys = DictionaryConstants.EngConstantValues[i].split("ÿ");
            		String[] values = dictionaryConstants[i].split("ÿ");
            		if(keys.length != values.length)
            		{
            			System.out.println("Length Mismatch : KEYS LENGTH : "+ keys.length+", VALUES : "+values.length + " at i : "+i+", key : "+keys[0]);
            		}
            		for(int j=0;j<keys.length;j++)
            		{
            			if(keys[j].trim().equals(key))
            			{
            				returnVal = values[j].trim();
            				break;
            			}
               		}
            		if(!returnVal.equals(""))
            		{
            			break;
            		}
            		
            	}
            	
	    	}
	    	
	    }
	    if(returnVal.equals(""))
	    {
	    	returnVal = key;
	    }
	  
	    return returnVal;
	}
	
	/**
	 * This method returns the English Long Planet Name in Hindi, by making use of 
	 * pre-defined arrays in Common class. The names are written in order, so the names are at same index.
	 * @param planetname
	 * @return String
	 */
	public static String ConvertPlanetNameinHI(String planetname )
	{
		String returnVal = "Null";
		for(int i = 0;i<Common.arrLongPlanetName.length;i++)
		{
		
			if(planetname.trim().equals(Common.arrLongPlanetName[i]))
			{
				returnVal = Common.arrHindiPlanetName[i];
				break;
			}
		}
		return returnVal;
	}
	
	/**
	 * This method returns the English Sign Name in Hindi, by making use of 
	 * pre-defined arrays in Common class. The names are written in order, so the names are at same index.
	 * @param rashiName
	 * @return
	 */
	public static String ConvertSignNameinHI(String rashiName )
	{
		String returnVal = "Null";
		for(int i = 0;i<Common.engRashiNames.length;i++)
		{
			if(rashiName.equals(Common.engRashiNames[i]))
			{
				returnVal = Common.hindiRashiNames[i];
				break;
			}
		}
		return returnVal;
	}
	
	/**
	 * This method returns the date with full month name in the languageCode passed.
	 * @param dateVal
	 * @param prefixYOB
	 * @param languageCode
	 * @param rbConstants
	 * @return String - Date is returned in String.
	 */
	public String getDate(String dateVal,String prefixYOB,int languageCode ,MyProperties rbConstants)
	{
		String Spcrmv = dateVal.replace("/ ","/"); // To replace the space from date from page mahadasha-phala.jsp
		String[] dateEval = Spcrmv.split("/");
		return fullMonthName(Integer.parseInt(dateEval[1]),languageCode,rbConstants)+" "+dateEval[0]+", "+prefixYOB+dateEval[2];
	}
	
	/**
	 * This method returns the full month name in Hindi if the languageCode is 1(Hindi),
	 * else it returns the full month name in English.
	 * @param MonthN
	 * @param languageCode
	 * @param rbConstants
	 * @return String - Month Name.
	 */
	public String fullMonthName(int MonthN , int languageCode,MyProperties rbConstants)
	{
		
	String monthName = "";
	if(languageCode == 1){ 
	 
	switch(MonthN){
	case 1:
		monthName = "जनवरी";
		break;
	case 2:
		monthName = "फरवरी";
		break;
	case 3:
		monthName = "मार्च";
		break;
	case 4:
		monthName = "अप्रैल";
		break;
	case 5:
		monthName = "मई";
		break;
	case 6:
		monthName = "जून";
		break;
	case 7:
		monthName = "जुलाई";
		break;
	case 8:
		monthName = "अगस्त";
		break;
	case 9:
		monthName = "सितम्बर";
		break;
	case 10:
		monthName = "अक्टूबर";
		break;
	case 11:
		monthName = "नवम्बर";
		break;
	case 12:
		monthName = "दिसम्बर" ;   
	}
	    return monthName ; 
	
	}else{
	      
	    switch(MonthN){
	    case 1:
	    	monthName = rbConstants.getString("JANUARY");
	    	break;
	    case 2:
	    	monthName = rbConstants.getString("FEBRUARY");
	    	break;
	    case 3:
	    	monthName = rbConstants.getString("MARCH");
	    	break;
	    case 4:
	    	monthName = rbConstants.getString("APRIL");
	    	break;
	    case 5:
	    	monthName = rbConstants.getString("MAY");
	    	break;
	    case 6:
	    	monthName = rbConstants.getString("JUNE");
	    	break;
	    case 7:
	    	monthName = rbConstants.getString("JULY");
	    	break;
	    case 8:
	    	monthName = rbConstants.getString("AUGUST");
	    	break;
	    case 9:
	    	monthName = rbConstants.getString("SEPTEMBER");
	    	break;
	    case 10:
	    	monthName = rbConstants.getString("OCTOBER");
	    	break;
	    case 11:
	    	monthName = rbConstants.getString("NOVEMBER");
	    	break;
	    case 12:
	    	monthName = rbConstants.getString("DECEMBER");	    
	    }
	    return monthName;
	}  
	
	}
	
	/**
	 * This method returns the number suffix in hindi.
	 * @param Number
	 * @return String - Number Suffix
	 */
	public String newConvertNoSuffixHI(int Number){
	String newNumber_HI ="";
    switch(Number){
        case 1:
        	newNumber_HI = "पहले";
        	break;
        case 2:
        newNumber_HI = "दूसरे";
    	break;
        case 3:
        newNumber_HI = "तीसरे";
    	break;
        case 4:
        newNumber_HI = "चौथे";
    	break;
        case 5:
        newNumber_HI = "पांचवें";
    	break;
        case 6:
        newNumber_HI = "छठें";
    	break;
        case 7:
        newNumber_HI = "सातवें";
    	break;
        case 8:
        newNumber_HI = "आठवें";
    	break;
        case 9:
        newNumber_HI = "नौवें";
    	break;
        case 10:
        newNumber_HI = "दसवें";
    	break;
        case 11:
        newNumber_HI = "ग्यारहवें";
    	break;
        case 12:
        newNumber_HI = "बारहवें";
    	break;
    }
     return newNumber_HI;
	}
	
	/**
	 * This method returns the planet name in hindi.
	 * @param planetname
	 * @return String - Planet Name
	 */
	public String convertPlanetNameinHI(String planetname){
		String planetname_HI ="";
		if(planetname.equals("Sun")){
			planetname_HI = "सूर्य";
	    }
		else if(planetname.equals("Moon")){
			planetname_HI = "चन्द्र";
	    }
		else if(planetname.equals("Mars")){
			planetname_HI = "मंगल";
	    }
		else if(planetname.equals("Mercury")){
			planetname_HI = "बुध";
	    }
		else if(planetname.equals("Jupiter")){
			planetname_HI = "गुरु";
	    }
		else if(planetname.equals("Venus")){
			planetname_HI = "शुक्र" ;
	    }
		else if(planetname.equals("Saturn")){
			planetname_HI = "शनि";
	    }
		else if(planetname.equals("Rahu")){
			planetname_HI = "राहु";
	    }
		else if(planetname.equals("Ketu")){
			planetname_HI = "केतु";
	    }
		else if(planetname.equals("Null")){
			planetname_HI = "Null";
	    }
		return planetname_HI;
	}
	
	/**
	 * This method returns the relationship with planet from the properties file.
	 * @param relationship
	 * @param rbConstants
	 * @return String - relationshipWithPlanet.
	 */
	public String relationshipWithPlanet(String relationship,MyProperties rbConstants)
	{
		String relationshipValue ="";
		
		if(relationship.equals("Exalted"))
		{
			relationshipValue = rbConstants.getString("EXALTED_RELATION");
		}
		else if(relationship.equals("Debilitated")){
			relationshipValue = rbConstants.getString("DEBILITATED_RELATION");
		}
		else if(relationship.equals("Own")){
			relationshipValue = rbConstants.getString("OWN_RELATION");
		}
		else if(relationship.equals("Friendly")){
			relationshipValue = rbConstants.getString("FRIENDLY_RELATION");
		}
		else if(relationship.equals("Enemy")){
			relationshipValue = rbConstants.getString("ENEMY_RELATION");
		}
		else if(relationship.equals("Neutral")){
			relationshipValue = rbConstants.getString("NEUTRAL_RELATION");
		}
		else
		{
			relationshipValue = "-";
		}
		return relationshipValue;
	}
	
	/**
	 * This method returns the sign name in hindi, where the rashiName passed is in 'krutidev' font.
	 * @param rashiname
	 * @return String - SignName in hindi.
	 */
	public String ConvertSignNameInHindi(String rashiname){
		String signName_Hindi="";
		if(rashiname.equals("es\"k\"")){
			signName_Hindi = "मेष";
		}
		else if(rashiname.equals("o`kHk")){
			signName_Hindi = "वृषभ";
		}
		else if(rashiname.equals("feFkqu")){
			signName_Hindi = "मिथुन";
		}
		else if(rashiname.equals("ddZ")){
			signName_Hindi = "कर्क";
		}
		else if(rashiname.equals("flag")){
			signName_Hindi =  "सिंह"  ;
		}
		else if(rashiname.equals("dU;k")){
			signName_Hindi =  "कन्या"  ;
		}
		else if(rashiname.equals("rqyk")){
			signName_Hindi =  "तुला"  ;
		}
		else if(rashiname.equals("o`f'pd")){
			signName_Hindi =  "वृश्चिक"  ;
		}
		else if(rashiname.equals("/kuq")){
			signName_Hindi =  "धनु"  ;
		}
		else if(rashiname.equals("edj")){
			signName_Hindi =  "मकर" ;
		}
		else if(rashiname.equals("dqaHk")){
			signName_Hindi =  "कुंभ" ;
		}
		else if(rashiname.equals("ehu")){
			signName_Hindi =  "मीन";
		}
    
      return signName_Hindi;
	}
  
	/**
	 * This method returns the mangal dosh compatibility of girl and boy using their mangal dosh level.
	 * @param boymangaldoshlevel
	 * @param girlmangaldoshlevel
	 * @return boolean - isCompatible or not.
	 */
	public static boolean calculateCompatibilityForMangalDosh(String boymangaldoshlevel, String girlmangaldoshlevel)
	{
		return (boymangaldoshlevel.equals(girlmangaldoshlevel));
	}
	
	/**
	 * This method returnd the corrected yogaName as some garbage entry is inserted in the yogname krutidev font.
	 * @param YogaName
	 * @return Stirng - YogaName
	 */
	public static String correctYogaName(String YogaName) 
	{
	  String YogaNameVal = "";
	    switch(YogaName)
	    {
	     case "kqHk" :
	         YogaNameVal = "'kqHk" ;
	         break;
	     case "lÂ©HkkX;":
	         YogaNameVal = "lkSHkkX;";
	         break;
	     case "Â’kqDy":
	         YogaNameVal = "'kqDy";
	         break;
	     case "Â’kksHku":
	         YogaNameVal = "'kksHku";
	         break;
	     case "/kÂ¤fr":
	         YogaNameVal = "/k`fr";
	         break;
	     case "Â’kwy":
	         YogaNameVal = "'kwy";
	         break;
	     case "o`fËœ":
	         YogaNameVal = "o`f)";
	         break;
	     case "flfÂ˜":
	         YogaNameVal = "flf)";
	         break;
	     case "flÂ˜":
	         YogaNameVal = "fl)";
	         break;
	     case "fÂ’ko":
	         YogaNameVal = "f'ko";
	         break;
	     case "cSj":
	         YogaNameVal = "otz";
	         break;
	         
	     case "kwy":
	         YogaNameVal = "'kwy"; //neha sula
	         break;
	         
	     case "fl":
	         YogaNameVal = "fl)"; //neha siddha
	         break;
	     case "l©HkkX;":
	         YogaNameVal = "lkSHkkX;"; //neha swabhagya
	         break;
	         
	     case "o`f":
	         YogaNameVal = "o`f)"; //neha vriddhi
	         break;
	         
	     case "/k¤fr":
	         YogaNameVal = "/k`fr"; //neha DHRITI 
	         break;
	     default:
	         YogaNameVal = YogaName;
	    }
	    return YogaNameVal;
	}
	
	/**
	 * This method returns the rasshiName in the passed in languageCode.
	 * Corresponding to the passed in english rashi name.
	 * @param engRashiName
	 * @param languageCode
	 */
	public static String getRashiName(String engRashiName, int languageCode)
	{
		String langRashiName = engRashiName;
		int i=0;
		for(String langRashi : Common.engRashiNames)
		{
			if(engRashiName.equals(langRashi))
			{
				langRashiName = Common.langRashiNames[languageCode][i];
				break;
			}
			i++;
		}
		return langRashiName;
	}
	
	public static String getParamsFromHoroscopeObject(DesktopHoro horoObj) throws Exception
	{
		String paramStr = "name="+URLEncoder.encode(horoObj.getName(), "UTF-8")+"&sex="+horoObj.getMaleFemale()+"&day="+horoObj.getDayOfBirth()+
				"&month="+horoObj.getMonthOfBirth()+"&year="+horoObj.getYearOfBirth()+"&hrs="+horoObj.getHourOfBirth()+
				"&min="+horoObj.getMinuteOfBirth()+"&sec="+horoObj.getSecondOfBirth()+"&dst="+horoObj.getDST()+
				"&place="+URLEncoder.encode(horoObj.getPlace(), "UTF-8")+"&LongDeg="+horoObj.getDegreeOfLongitude()+"&LongMin="+horoObj.getMinuteOfLongitude()+
				"&LongEW="+horoObj.getEastWest()+"&LatDeg="+horoObj.getDegreeOfLattitude()+
				"&LatMin="+horoObj.getMinuteOfLattitude()+"&LatNS="+horoObj.getNorthSouth()+
				"&timeZone="+horoObj.getTimeZone()+"&ayanamsa="+horoObj.getAyan()+"&charting=1"+"&kphn="+horoObj.getKPHorarySeed()+"&languageCode=0";
		return paramStr;
	}
	
	public static void getRequestObjectValue(HttpServletRequest request)
	{
		
		Enumeration e = request.getParameterNames();
		String logparam="";
		while(e.hasMoreElements())
		{
		  Object obj = e.nextElement();
		  String fieldName = (String) obj;
		  String fieldValue = request.getParameter(fieldName);
		  logparam+="\""+fieldName+"\":"+"\""+fieldValue+"\",";
		  
		  
		}
	System.out.println("URI==="+request.getRequestURI());	
	System.out.println("Request Log==="+logparam);
	}
	
	public static String getRashiNameinHindi(String sign) {
		String signName = "";
		switch (sign) {
		    case "aries":
		    signName = "Mesh";
		    break;
		    case "taurus":
		    signName = "Vrishabha";
		    break;
		    case "gemini":
		    signName = "Mithun";
		    break;
		   case "cancer":
		    signName = "Karka";
		    break;
		        case "leo":
		    signName = "Simha";
		    break;
		    case "virgo":
		    signName = "Kanya";
		    break;
		    case "libra":
		    signName = "Tula";
		    break;
		case "scorpio":
		    signName = "Vrishchika";
		    break;
		case "sagittarius":
		    signName = "Dhanu";
		    break;
		    case "capricorn":
		    signName = "Makara";
		    break;
		    case "aquarius":
		    signName = "Kumbha";
		    break;
		case "pisces":
		    signName = "Meena";
		    break;
		default:
		break;
		}
		return signName;
		}
	
	public static String ParsingTimeZone(String startZone)
	{
		String newTz = "";
		double newTzInt = 0;
		int intPosition=startZone.indexOf("E");
		    if(intPosition != -1) 
		    {
			       String tz=startZone.replace("E","");
			       if(tz.indexOf(":") != -1)
			       {
			    	   String[] atz = tz.split(":");
			    	
			    	   if(atz[1].length() == 1)
			    	   {
			    		   atz[1] += "0"; // Make it two digit number
			    	   }
			    	   atz[1] = String.valueOf(Double.valueOf(atz[1])/60);
		    		   newTzInt = Double.valueOf(atz[0]).doubleValue() + Double.valueOf(atz[1]).doubleValue(); 
			       }
			       else
			    	   newTzInt=Double.valueOf(tz);
			       
			       DecimalFormat f = new DecimalFormat("##.00");
			       newTz=String.valueOf(f.format(newTzInt/15));
		    }
		    else
		    {
		    	String tz=startZone.replace("W","");
		    	if(tz.indexOf(":") != -1)
		    	{
		    		String[] atz = tz.split(":");
		    		if(atz[1].length() == 1)
			    	   {
			    		   atz[1] += "0"; // Make it two digit number
			    	   }
		    		atz[1] = String.valueOf(Double.valueOf(atz[1])/60);
		    		newTzInt = Double.valueOf(atz[0]).doubleValue() + Double.valueOf(atz[1]).doubleValue(); 
				         
		    	}
		    	else
				    newTzInt=Integer.valueOf(tz);
				     
	    		DecimalFormat f = new DecimalFormat("##.00");
		        newTz=f.format(newTzInt/15);
		        
			    if  (newTz.equals("0"))
			        newTz="-"+startZone;
			    
			   
		    }
		    return newTz;

	}
	
	public static int getNormalSeq(int nakLordinVimSeq) {
		int [] chng = {9,6,1,2,3,8,5,7,4};
		return chng[nakLordinVimSeq]; 
	}
	
	
	

	/**
	 * Insert the method's description here.
	 * Creation date: (11-03-2003 12:23:49 PM)
	 */
	public static boolean isKhanaBhavaKendra(int khanaNo) {
		boolean result = false;
		if (khanaNo == 1 || khanaNo == 4 || khanaNo == 7 || khanaNo == 10)
			result = true;
		return result;
	}

	
	  // ***************** fetch DST or not from Time_Zone_String ***************
    public boolean isDst(String timezoneString, Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
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
    /**
	 * this method returns user has dhruv plan or not
	 */
	public static boolean isDhruvPlan(int planId) {
		boolean result = false;
		if (planId == 8 || planId == 9 || planId == 10) {
			result = true;
		}
		return result;
	}

    
    public static boolean isValidEmail(String str)
	{
		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	    return str.matches(regex);
	}
    
    /**
     * This method is called inside from cloud servlet doGet method for getting cookies with respect to login user.
     * @param request
     * @param response
     * @throws Exception
     */
    public static HashMap<String, String> getCookiesAndLogin(HttpServletRequest request)
    {
    	HashMap<String, String> map = new HashMap<String, String>();
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null)
    	{
    		
    		for(Cookie cookie : cookies)
    		{
    			if(cookie.getName().equals(WebKeys.COOKIE_UID))
    			{
    				map.put("UserId", cookie.getValue());
    				
    			}
    			else if(cookie.getName().equals(WebKeys.COOKIE_PWD))
    			{
    				map.put("Password", cookie.getValue());
    				
    			}
    		}
    		
    	}
    	return map;
    }
}
