package com.ojassoft.astrosagecloud.util;

import com.ojassoft.astrosagecloud.localization.Hindi;

public class GetAstrologyFullNames {
	
	public static void main(String[] args) {
		
		GetAstrologyFullNames obj =  new GetAstrologyFullNames();
		Hindi hindi = new Hindi();
		System.out.print(hindi.unicode(obj.getFullDaysName("ea",1,1),1));
	}
	
	public static String[] EngConstantValuesOfdaysOld = new String[]
		{"SUN","MON","TUE","WED","THU","FRI","SAT"}
		
	;
	public static String[] HinConstantValuesOfdaysOld = new String[]
		
		{"jfo","xq#","'kqd","cq/k","'kfu","'kqdz","eaxy","lkse"};
		
		
	;
	
	public static String[] EngConstantValuesOfdays = new String[]
		
		{"Sunday","Monday","Tueday","Wednesday","Thursday","Friday","Saturday"}
	;
	public static String[] HinConstantValuesOfdays = new String[]
		
	
		{"jfookj","xq:okj","xq#okj","'kqØokj","cq/kokj","'kfuokj","'kqØokj","eaxyokj","lkseokj"};
		
	;
	
	public static String[] EngConstantValuesOfRashi = new String[]
			
			{"Aries", "Taurus", "Gemini" ,"Cancer" ,"Leo" ,"Virgo", "Libra" ,"Scorpion" ,"Sagittarius" , "Capricorn" , "Aquarius" , "Pisces"}
		;
		public static String[] HinConstantValuesOfRashi = new String[]
			
		
			{"es\"k" , "o`\"kHk" , "feFkqu" , "ddZ" , "flag" , "dU;k" , "rqyk" , "o`f'pd" , "/kuq"  , "edj" , "dqaHk" , "ehu"};
			
		;
	
		public static String[] EngConstantValuesOfPlanet = new String[]
				
				{"Ascendent","Sun", "Moon" , "Mars" , "Mercury" , "Jupiter" , "Venus",  "Saturn","Rahu","Ketu","Uranus", "Neptune", "Pluto"
}
			;
			public static String[] HinConstantValuesOfPlanet = new String[]
				
			
				{"yXu" , "lw;Z" , "panz", "eaxy", "cq/k" , "xq:" , "'kqØ" , "'kfu" , "jkgq" , "dsrq" , ";wjsul" , "usiP;wu" ,"IywVks"};
				
			;
	
	public static String[][] langConstants = new String[][]{EngConstantValuesOfdays, HinConstantValuesOfdays};
	public static String[][] langConstantsRashi = new String[][]{EngConstantValuesOfRashi, HinConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi,EngConstantValuesOfRashi};
	public static String[][] langConstantsPlanet = new String[][]{EngConstantValuesOfPlanet, HinConstantValuesOfPlanet};
	
	// 1 for day , 2 for rashi , 3 for planet
		 public String getFullDaysName(String fullStr,int lang,int isDayRashiPlanet){
			String finalstr= fullStr;
			String delimeter= ", ";
			if(lang ==1){ delimeter="] ";}
			//if(lang ==0){
				boolean ifComma = fullStr.contains(",");
				boolean ifSpace = fullStr.contains(" ");
				String[] splStr= null ;
				String SplVal = "";
				
				if(ifComma){SplVal= ",";}
				
				else if(ifSpace){
					SplVal= " ";}
				
				if(ifComma ||  ifSpace){
					splStr = fullStr.split(SplVal);
				}
				else{
					splStr = new String[1];
					splStr[0] =fullStr;
				}
				
			if(isDayRashiPlanet==1 && (lang==0 || lang==1)){
			finalstr ="";
			String[] dayNameInEngNew =  langConstants[lang];// {"Sunday","Monday","Tueday","Wednesday","Thursday","Friday","Saturday"};
			for(int j= 0 ;j<splStr.length;j++){
			for (int i = 0; i < dayNameInEngNew.length; i++) {
				
				if(splStr[j].trim().substring(0,3).equals(dayNameInEngNew[i].substring(0,3))){
					//System.out.println(splStr[j].trim().substring(0,3)+","+dayNameInEngNew[i].substring(0,3));
					finalstr = finalstr+dayNameInEngNew[i];
					
							if(j <splStr.length-1){finalstr = finalstr+delimeter;}
					break ;
			   }
				
				
			}
				}
			 }
			
			  if(isDayRashiPlanet==2 && lang!=1){

					finalstr ="";
                    String[] rashiNameInEngNew =  langConstantsRashi[lang];// {"Sunday","Monday","Tueday","Wednesday","Thursday","Friday","Saturday"};
					for(int j= 0 ;j<splStr.length;j++){
					for (int i = 0; i < rashiNameInEngNew.length; i++) {
						
						if(SharedFunction.ProperCase(splStr[j].trim().substring(0,3)).equals(rashiNameInEngNew[i].substring(0,3))){
							//System.out.println(splStr[j].trim().substring(0,3)+","+rashiNameInEngNew[i].substring(0,3));
							finalstr = finalstr+rashiNameInEngNew[i];
							
									if(j <splStr.length-1){finalstr = finalstr+delimeter;}
							break ;
					   }
						
						
					}
						}
					 
			}
			  if(isDayRashiPlanet==3&& lang==0){
				  int checkChar = 3;
				  if(lang==0){checkChar=2;}
				  finalstr ="";
                  String[] planetNameInEngNew =  langConstantsPlanet[lang];// {"Sunday","Monday","Tueday","Wednesday","Thursday","Friday","Saturday"};
					for(int j= 0 ;j<splStr.length;j++){
					for (int i = 0; i < planetNameInEngNew.length; i++) {
						
						if(SharedFunction.ProperCase(splStr[j].trim().substring(0,checkChar)).equals(planetNameInEngNew[i].substring(0,checkChar))){
							//System.out.println(splStr[j].trim().substring(0,checkChar)+","+planetNameInEngNew[i].substring(0,checkChar));
							finalstr = finalstr+planetNameInEngNew[i];
							
									if(j <splStr.length-1){finalstr = finalstr+delimeter;}
							break ;
					   }
						
						
					}
						}
			}
			

			//}
			return finalstr;
		}
	
}
