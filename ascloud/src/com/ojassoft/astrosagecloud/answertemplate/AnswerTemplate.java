package com.ojassoft.astrosagecloud.answertemplate;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.Constants;
import com.ojassoft.astrosagecloud.localization.Hindi;
import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;

public class AnswerTemplate {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		    int langCode = 1;
		    
		    //For Write in text 
		    String DOB = "11/05/2006";
		    String TOB = "15:35";
		    String Place = "noida";
		    String Gender = "male";
		    
		    String[] DOBSplit = DOB.split("/");
			String Day = DOBSplit[0];
			String Month = DOBSplit[1];
			String Year = DOBSplit[2];

			String[] TOBSplit = TOB.split(":");
			String Hour = TOBSplit[0];
			String Min = TOBSplit[1];
			/***************************************/
			// 1 - > health , 2-> Wealth, Finance , 3-> Family,4-> Mother,5-> Education, 6-> Loan / Debt ,7-> Marriage 
			// 8-> Inheritance  , 9-> Luck , 10 -> Father , 11 -> Job, Career, Profession, Promotion , 12->Spirituality 
			Local local = new Local();
			Hindi hindi = new Hindi();
			MyResourceBundle rBHouseKeys = local.loadPropertiesFileNew("housekeys",langCode);
			MyResourceBundle rBAnsTemaplate = local.loadPropertiesFileNew("anstemplate",langCode);
			MyResourceBundle rBSignCharacteristics = local.loadPropertiesFileNew("signcharacteristics",langCode);
		
		   DesktopHoro phoro = createHoro(Day, Month, Year, Hour, Min, "0", "28", "39", "N", "77", "13","E", "5.5" ,"agra","m",null);
		     
		   getDataForTemplate(phoro,hindi,local,rBSignCharacteristics,rBHouseKeys,rBAnsTemaplate,Gender,DOB,TOB,Place,langCode,"5");

	}
	
	       static void getDataForTemplate(DesktopHoro ObjHoro,Hindi hindi ,Local local , MyResourceBundle rBSignCharacteristics ,MyResourceBundle rBHouseKeys,MyResourceBundle rBAnsTemaplate ,String Gender,String DOB,String TOB,String Place, int langCode,String QRT){
		
		        String result = "";
		        String houseDescrption = "";
		        List<String> houseDes = new ArrayList<String>();
	
                int moonsign = ObjHoro.getMoonSign()+1;
				String[] signHeading = {rBSignCharacteristics.getString(getSignCharacteristics(moonsign))};
				List<Integer> arrFinal = getArrayOfQuesRelTo(QRT);
				
				 for (int j=0; j < arrFinal.size(); j++){
					 
					 houseDescrption = houseDescrption+rBAnsTemaplate.getString(getStringValueOfHouseNum(arrFinal.get(j)));
			         houseDescrption = houseDescrption+" ("+rBHouseKeys.getString(getStringValueOfHouse(arrFinal.get(j)))+") ";
				 
				 }
                houseDes.add(houseDescrption);
				houseDes.add(Gender);
				houseDes.add(DOB);
				houseDes.add(TOB);
				houseDes.add(Place);
				houseDes.add(Place);
				
				String lagna = langCode ==0 ? ObjHoro.getLagnaSign().substring(0, 1).toUpperCase() + ObjHoro.getLagnaSign().substring(1):ObjHoro.getLagnaSign() ;
				String rasi = langCode ==0 ? ObjHoro.getRasiName().substring(0, 1).toUpperCase() + ObjHoro.getRasiName().substring(1):ObjHoro.getRasiName();
				String lanLordame = langCode ==0 ? getStringOfLordName(ObjHoro.getLagnaLordName()) :ObjHoro.getLagnaLordName() ;//ObjHoro.getLagnaLordName().substring(0, 1).toUpperCase() + ObjHoro.getLagnaLordName().substring(1);
				String rashiLord =  langCode ==0 ?getStringOfLordName(ObjHoro.getRasiLordName()) : ObjHoro.getRasiLordName();//ObjHoro.getRasiLordName().substring(0, 1).toUpperCase() + ObjHoro.getRasiLordName().substring(1);

	
				System.out.print(rBAnsTemaplate.getString("ANALYSIS_INTER"));
				String[] footerArr = {hindi.unicode(lagna,langCode),hindi.unicode(rasi,langCode),hindi.unicode(lanLordame,langCode),hindi.unicode(lagna,langCode),hindi.unicode(rashiLord,langCode),hindi.unicode(rasi,langCode)};
				System.out.print(local.getDesiredString(rBAnsTemaplate.getString("ASCSIGNTEXT"),footerArr));
				String head = rBAnsTemaplate.getString("HEADERTEXT");
				String[] replArr = houseDes.toArray(new String[0]);
				//out.println(rBAnsTemaplate.getString("HEADERTEXT"));
				System.out.print(local.getDesiredString(head,replArr));
                System.out.print("you will have a good married life.");
                System.out.println(local.getDesiredString(rBAnsTemaplate.getString("SIGN_CHAR_SENTENCE"),signHeading));
				System.out.print(rBAnsTemaplate.getString("WISHES"));
	
          }
	
	  public  static List<Integer> getArrayOfQuesRelTo(String QRT){
		
	    List<Integer> list = new ArrayList<Integer>();
		int[] healtharr = {1,6}; 
		int[] wealth_financearr = {2,6,11}; 
		int[] familtarr = {2,11}; 
		int[] motherarr ={4,11};
		int[] educationarr = {4,5,11};
		int[] loan_debtarr = {2,6,11};
		int[] marriagearr ={2,7,11};
		int[] inheritancearr = {8,11}; 
		int[] luckarr = {9,11};
		int[] fatherarr = {9};
		int[] job_career_profession_promotionarr = {1,6,10,11};
		int[] spiritualityarr = {9,11,12}; 
		
		int[][] getarrayindex = {{},healtharr,wealth_financearr,familtarr,motherarr,educationarr,loan_debtarr,marriagearr,inheritancearr,luckarr,fatherarr,job_career_profession_promotionarr,spiritualityarr};
		
        for (int i=0; i< 13 ; i++)
		{
		 if(i == Integer.parseInt(QRT) )
		      {
			 for (int j=0; j < getarrayindex[i].length ; j++){
			    // System.out.println(getarrayindex[i][j]+"<br/>");
			     
			     list.add(getarrayindex[i][j]); 
			 }
		      }
		  }
		return list;
	}
	
	
	static DesktopHoro createHoro(String day, String month, String year, String hrs, String min, String sec, String latDeg, String latMin, String latNS, String longDeg, String longMin, String longEW, String timeZone,String place,String gender, ServletContext ctx) {

	
		//const1.setConstPath("C:\\Data\\workspace\\horo");
		
		//if(ctx == null)
		//{
		//	const1.setConstPath(getServletContext().getRealPath("/cloud/"));
		//}
		//else
		//{
		//	const1.setConstPath(ctx.getRealPath("/cloud/"));
		//}
	
		
		DesktopHoro phoro = new DesktopHoro();
		Constants const1 = new Constants();
		const1.setConstPath(System.getProperty("user.dir"));
		
		try {

			phoro.setCompanyName("CSL SOFTWARE LTD., G-4A, Green park Extn., New Delhi-110 016");
			phoro.setCompanyAddLine1("Phone:011-6867329, 9811356741, E-Mail: info@astrocamp.com http://www.astrocamp.com");
			phoro.setName("punit");
			phoro.setPlace(place);
			phoro.setTimeZone(timeZone);
			phoro.setMaleFemale(gender);
			phoro.setSecondOfBirth(sec);
			phoro.setMinuteOfBirth(min);
			phoro.setHourOfBirth(hrs);
			phoro.setDayOfBirth(day);
			phoro.setMonthOfBirth(month);
			phoro.setYearOfBirth(year);
			phoro.setDegreeOfLattitude(latDeg);
			phoro.setDegreeOfLongitude(longDeg);
			phoro.setSecondOfLattitude("00");
			phoro.setSecondOfLongitude("00");
			phoro.setMinuteOfLongitude(longMin);
			phoro.setMinuteOfLattitude(latMin);
			phoro.setEastWest(longEW);
			phoro.setNorthSouth(latNS);
			phoro.setLanguageCode("0");
			phoro.setDST("0");
			phoro.setAyanamsaType(1);
			// phoro.setAyanamsaType(3);
			phoro.setLanguageCode("0");
			// phoro.setCustomizedAyanamsa("23.000");
			phoro.initialize();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return phoro;
		
	}
	      
	      
		
	static String getStringValueOfHouse(int honum) 
		{
			String HouseString= "";
			
			switch (honum) 
			{
			    case 1:  HouseString = "FIRST_HOUSE";
			             break;
			    case 2:  HouseString = "SECOND_HOUSE";
			             break;
			    case 3:  HouseString = "THIRD_HOUSE";
			             break;
			    case 4:  HouseString = "FOURTH_HOUSE";
			             break;
			    case 5:  HouseString = "FIFTH_HOUSE";
			             break;
			    case 6:  HouseString = "SIXTH_HOUSE";
			             break;
			    case 7:  HouseString = "SEVENTH_HOUSE";
			             break;
			    case 8:  HouseString = "EIGHTH_HOUSE";
		                 break;
			    case 9:  HouseString = "NINTH_HOUSE";
		                 break;
			    case 10:  HouseString = "TENTH_HOUSE";
		                  break;
			    case 11:  HouseString = "ELEVENTH_HOUSE";
		                  break;
			    case 12:  HouseString = "TWELFTH_HOUSE";
		                  break;
			    default: HouseString = "";
			             break;
			}
			return HouseString;
			
			
		}

		static String getStringValueOfHouseNum(int honum) 
		{
			String HouseString= "";
			
			switch (honum) 
			{
			    case 1:  HouseString = "FIRST";
			             break;
			    case 2:  HouseString = "SECOND";
			             break;
			    case 3:  HouseString = "THIRD";
			             break;
			    case 4:  HouseString = "FOURTH";
			             break;
			    case 5:  HouseString = "FIFTH";
			             break;
			    case 6:  HouseString = "SIXTH";
			             break;
			    case 7:  HouseString = "SEVENTH";
			             break;
			    case 8:  HouseString = "EIGHTH";
		                 break;
			    case 9:  HouseString = "NINTH";
		                 break;
			    case 10:  HouseString = "TENTH";
		                  break;
			    case 11:  HouseString = "ELEVENTH";
		                  break;
			    case 12:  HouseString = "TWELFTH";
		                  break;
			    default: HouseString = "";
			             break;
			}
			return HouseString;
		}


		static String getSignCharacteristics(int sinum) 
		{
			String SignString= "";
			
			switch (sinum) 
			{
			    case 1:  SignString = "SIGN_CHARACTERISTICS1";
			             break;
			    case 2:  SignString = "SIGN_CHARACTERISTICS2";
			             break;
			    case 3:  SignString = "SIGN_CHARACTERISTICS3";
			             break;
			    case 4:  SignString = "SIGN_CHARACTERISTICS4";
			             break;
			    case 5:  SignString = "SIGN_CHARACTERISTICS5";
			             break;
			    case 6:  SignString = "SIGN_CHARACTERISTICS6";
			             break;
			    case 7:  SignString = "SIGN_CHARACTERISTICS7";
			             break;
			    case 8:  SignString = "SIGN_CHARACTERISTICS8";
		                 break;
			    case 9:  SignString = "SIGN_CHARACTERISTICS9";
		                 break;
			    case 10:  SignString = "SIGN_CHARACTERISTICS10";
		                  break;
			    case 11:  SignString = "SIGN_CHARACTERISTICS11";
		                  break;
			    case 12:  SignString = "SIGN_CHARACTERISTICS12";
		                  break;
			    default: SignString = "";
			             break;
			}
			return SignString;
			}
		static String getStringOfLordName(String lordName) 
		{
			String LordString= "";
			
			if(lordName.equals("SUN")){
				LordString= "Sun";
			}
			else if (lordName.equals("MOON")){
				LordString= "Sun";
			}
	       else if (lordName.equals("MAR")){
	    	   LordString= "Mars";
			   }
	       else if (lordName.equals("MER")){
	    	   LordString= "Mercury";
	        }
	       else if (lordName.equals("JUP")){
	    	   LordString= "Jupiter";
	        }
	       else if (lordName.equals("VEN")){
	    	   LordString= "Venus";
	       }
	       else if (lordName.equals("SAT")){
	    	   LordString= "Saturn";
	        }
	      else if (lordName.equals("RAH")){
	    	  LordString= "Rahu";
	       }
	       else if (lordName.equals("KET")){
	    	   LordString= "Ketu";
	      }
			return LordString;
		}

}
