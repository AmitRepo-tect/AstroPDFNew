<%@page import="java.text.MessageFormat"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>

<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.*"%>

<%@include file='planets-detailed-informations.jsp'%>
<%
int languageCode = (Integer)session.getAttribute("languageCode");
Hindi hindi = new Hindi();
Local local = new Local();
CloudDAO predic = new CloudDAO();
Util utl =  new  Util();
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBPlanetsInVedicastrology = local.loadPropertiesFileNew("planetsinvedicastrology",languageCode);
MyResourceBundle rBPlanetPosition = local.loadPropertiesFileNew("planetposition",languageCode);
MyResourceBundle rBPlanetsPositionFriendship = local.loadPropertiesFileNew("planetposition-friendship",languageCode);
MyResourceBundle rBPlanetPositionLalplanethouse = local.loadPropertiesFileNew("planetposition-lalplanethouse",languageCode);
DesktopHoro myAstrologyObject= (DesktopHoro) session.getAttribute("HoroscopeObj");

%>

<div class="hdg-lg card">
	<h1><%=rBPlanetsInVedicastrology.getString("PLANET_CONSIDERATION")%></h1>	
</div>
<%--
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<h5>
		<%=rBPlanetsInVedicastrology.getString("PLANET_CONSIDERATION")%></h5>
</div>
</div>
</div>
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $('#cellheaddiv, #cellheaddiv div').addClass('cellheaddiv');
        $('#cellTextdiv, #cellTextdiv div').addClass('cellTextdiv');
        $('#NameofBook, #NameofBook Span').addClass('NameofBook');
    });
</script>

<%
int[] arrPlanetsVedicAstrology = myAstrologyObject.getPositionForShodasvarg(0);
String aryPlanet[] = {"Sun", "Moon", "Mars", "Mercury", "Jupiter", "Venus", "Saturn", "Rahu", "Ketu", "Uranus", "Neptune", "Pluto"};
String zodiacSignName[] = {"Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"};
String langCode ="";
if(languageCode == 0)/* || languageCodeInt == 2 || languageCodeInt == 4 || languageCodeInt == 5 || 
	languageCodeInt == 6 || languageCodeInt == 7 || languageCodeInt == 8 || languageCodeInt== 9 )*/
{
langCode = "100";
}
else
{
langCode =String.valueOf(session.getAttribute("languageCode"));
}

String chartpref ="";
if(session.getAttribute("chartType").equals("1")){
chartpref = "south";
}
if(session.getAttribute("chartType").equals("0")){
chartpref = "north";
}


int []planetHouseNo = new int[12];
for(int i=0; i<=11; i++)
{ 
	// ********************getPlanetInBhava(AscendentPosition, PlanetPosition)
	planetHouseNo[i] = Astrology.GetPlanetInBhava(arrPlanetsVedicAstrology[0], arrPlanetsVedicAstrology[i+1]);
}
String[] predictionsText = new String[12];
String plnetAspectedBy = "" , bookName="";

for(int i=0 ;i<= 11;i++){
predictionsText[i] = predic.ClassicalPredictionsExceptEnglish(aryPlanet[i], planetHouseNo[i], "House", plnetAspectedBy, bookName, Integer.parseInt(langCode),null);
}


for(int i=0;i<= 8;i++){

String[] predictionsText1 = predictionsText[i].split("#");
//out.println("neha"+predictionsText1[3]);
%>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<div id="cellheaddiv">
	<h5> <%=rbConstants.getString(aryPlanet[i].toUpperCase()) +" "+rBPlanetsInVedicastrology.getString("CONSIDERATION")%> </h5>
</div>
<div id="cellTextdiv">

	<p>
	
		<%  try
      { 
      String PlanetInfo = subPrintPlanetNameDetails(aryPlanet[i].substring(0,2), "Rasi", myAstrologyObject, languageCode);
        //*****************Set JSON Object
        JSONObject ObjPlanetJSON = new JSONObject(PlanetJson);
      
        //*****************Create Array for PlanetAspects_EN
        String fullPlanetAspectsVal[] = new String[12];
       String fullPlanetAspectsVallues_HI ="";
       String fullPlanetAspectsVallues= "";
        String[] arrPlanetAspects = String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")).replace("\"", "").replace("[","").split(",");
        for(int j=0 ;j<=arrPlanetAspects.length-1 ; j++) {
            boolean fullPlanetAspects = arrPlanetAspects[j].contains("/");
            
            if(fullPlanetAspects == false){
              fullPlanetAspectsVal = arrPlanetAspects[j].split(":");
              fullPlanetAspectsVallues_HI = fullPlanetAspectsVallues_HI +" "+ utl.newConvertNoSuffixHI(Integer.parseInt(fullPlanetAspectsVal[0]))+",";
              fullPlanetAspectsVallues = fullPlanetAspectsVallues +" "+ fullPlanetAspectsVal[0]+SharedFunction.NoSuffix(Integer.parseInt(fullPlanetAspectsVal[0]))+",";
            }
          }

        
        
        //***************** 
        fullPlanetAspectsVallues_HI = fullPlanetAspectsVallues_HI.substring(0,fullPlanetAspectsVallues_HI.length()-1);// Left(FullPlanetAspectsVallues_HI,len(FullPlanetAspectsVallues_HI)-1)
        fullPlanetAspectsVallues = fullPlanetAspectsVallues.substring(0,fullPlanetAspectsVallues.length()-1) + " ";//Left(FullPlanetAspectsVallues,len(FullPlanetAspectsVallues)-1);
       
        //*****************Print Technical Detail in Simple English Language
         String aspectsPlanetFromName ="";
         String  planetAspectsfromlist = "";
         try{
        	 planetAspectsfromlist= String.valueOf(ObjPlanetJSON.getJSONArray("AspectsFrom")).replace("\"", "").replace("[","").replace("]","");
         }
         catch(Exception e)
         {
        	 planetAspectsfromlist=ObjPlanetJSON.getString("AspectsFrom").replace("\"", "").replace("[","").replace("]","");
         }
         String[] arrPlanetAspectsfrom = planetAspectsfromlist.split(",");
         String plNameConstants = rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase());
        
        for(int k=0; k<=arrPlanetAspectsfrom.length-1;k++){
        	//out.println(arrPlanetAspectsfrom[k]);
        	
        	if(!arrPlanetAspectsfrom[k].equals("Null")){
            aspectsPlanetFromName = aspectsPlanetFromName+" "+rbConstants.getString(arrPlanetAspectsfrom[k].toUpperCase())+",";
        	}
        	else{
        	aspectsPlanetFromName = aspectsPlanetFromName+" ";
        	}
        }
        
        String dynPlanetSentanceOne = "";
    	String dynPlanetSentanceTwo = "";
    	String dynPlanetSentanceThree = "";
    	String dynPlanetSentanceFour = "";
    	
    	
    	aspectsPlanetFromName = aspectsPlanetFromName.substring(0,aspectsPlanetFromName.length()-1);
		String planetName = SharedFunction.ProperCase(rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()));
     	String Sign = rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL");
     	String relationShip =  utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants);
     	String situatedHoue = ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House")));
     	String lordHouse = String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace("\"", "").replace("]","").replace("[","").replace(",0","");
     	 if((languageCode == 0 ||languageCode == 5 || languageCode == 8) && i < 7){
        	//String lordHouse = String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace("\"", "").replace("]","").replace("[","").replace(",0","");
        	if(!lordHouse.contains(","))
        	{
        		lordHouse += SharedFunction.NoSuffix(lordHouse);
        	}
            if(planetAspectsfromlist.equals("Null")){
                 
            	//if (languageCode == 4 || languageCode == 5 || languageCode == 7 || languageCode == 9)
	    		//{
	    			                                                      
	    			
	    			//String printValue [] = {plNameConstants,rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL"),plNameConstants,rbConstants.getString(ObjPlanetJSON.getString("Relationship").toUpperCase()+"_RELATION"),plNameConstants ,lordHouse, ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","") , SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))), plNameConstants, fullPlanetAspectsVallues };
		    		// dynPlanetSentanceOne = local.getDesiredString(rbConstants.getString("DYNAMIC_PLANET_CONSIDERATION_ONE"),printValue);
	    		//}
	    		//else
	    		//{
	    			//String printValue [] = {plNameConstants,rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL"),rbConstants.getString(ObjPlanetJSON.getString("Relationship").toUpperCase()+"_RELATION"),plNameConstants,plNameConstants ,lordHouse, ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","") , SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))), plNameConstants, fullPlanetAspectsVallues };
		    		// dynPlanetSentanceOne = local.getDesiredString(rbConstants.getString("DYNAMIC_PLANET_CONSIDERATION_ONE"),printValue);
	    		//}
	    		//out.println(dynPlanetSentanceOne);
                //out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rBPlanetsInVedicastrology.getString("SIGN_WHICH_IS_A") + utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants)  + " " + rBPlanetsInVedicastrology.getString("SIGN_FOR") + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) +". "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("IS_LORD_OF") +  lordHouse + " " + rBPlanetsInVedicastrology.getString("HOUSE_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues + " "+rbConstants.getString("IS_HOUSE")+" .");
            	out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_SUN_SATURN_ISNULL"),planetName,Sign,relationShip,planetName,planetName,lordHouse,situatedHoue,planetName,fullPlanetAspectsVallues));
             }
			else{
                
				/* if (languageCode == 4 || languageCode == 5 || languageCode == 7 || languageCode == 9)
	    		{
					String printValue [] = {plNameConstants , rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL"),plNameConstants,rbConstants.getString(ObjPlanetJSON.getString("Relationship").toUpperCase()+"_RELATION"),plNameConstants ,lordHouse, ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","") , SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))), plNameConstants, fullPlanetAspectsVallues,aspectsPlanetFromName ,plNameConstants};
					dynPlanetSentanceTwo = local.getDesiredString(rbConstants.getString("DYNAMIC_PLANET_CONSIDERATION_TWO"),printValue);
	    		}
				else
	    		{
	    			String printValue [] = {plNameConstants , rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL"),rbConstants.getString(ObjPlanetJSON.getString("Relationship").toUpperCase()+"_RELATION"),plNameConstants,plNameConstants ,lordHouse, ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","") , SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))), plNameConstants, fullPlanetAspectsVallues,aspectsPlanetFromName };
	    			dynPlanetSentanceTwo = local.getDesiredString(rbConstants.getString("DYNAMIC_PLANET_CONSIDERATION_TWO"),printValue);
	    		}
				out.println(dynPlanetSentanceTwo); */
            	//out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rBPlanetsInVedicastrology.getString("SIGN_WHICH_IS_A") + utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants)  + " " + rBPlanetsInVedicastrology.getString("SIGN_FOR") + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) +". "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("IS_LORD_OF") + lordHouse  + " "+ rBPlanetsInVedicastrology.getString("HOUSE_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues + rBPlanetsInVedicastrology.getString("HOUSE_ASPECTED_BY") + aspectsPlanetFromName +".");
				out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_SUN_SATURN_NOTNULL"),planetName,Sign,relationShip,planetName,planetName,lordHouse,situatedHoue,planetName,fullPlanetAspectsVallues,aspectsPlanetFromName));
             }
        	
        
        }
     	 else if((languageCode == 0 ||languageCode == 5 || languageCode == 8) && i > 6 ){
        //else if(languageCode != 1 && i > 6 ){
            if(planetAspectsfromlist.equals("Null")){
            	out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_RAHU_KETU_ISNULL"),planetName,Sign,planetName,situatedHoue,planetName,fullPlanetAspectsVallues));
            	/* String printValue [] = {plNameConstants,rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL"),plNameConstants, ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","") , SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))), plNameConstants, fullPlanetAspectsVallues };
	    		dynPlanetSentanceThree = local.getDesiredString(rbConstants.getString("DYNAMIC_PLANET_CONSIDERATION_THREE"),printValue);
	    		 
	    		out.println(dynPlanetSentanceThree); */
	    		
	    		
            	//out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rbConstants.getString("SIGN")+" ."+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rbConstants.getString("IS_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues + " " +rbConstants.getString("IS_HOUSE")+" .");
          }else{
        	  out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_RAHU_KETU_NOTNULL"),planetName,Sign,planetName,situatedHoue,planetName,fullPlanetAspectsVallues,aspectsPlanetFromName));
        	 /*  String printValue [] = {plNameConstants , rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL"),plNameConstants, ObjPlanetJSON.getString("House").replace("\"", "").replace("]","").replace("[","") , SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))), plNameConstants, fullPlanetAspectsVallues,aspectsPlanetFromName ,plNameConstants};
				dynPlanetSentanceFour = local.getDesiredString(rbConstants.getString("DYNAMIC_PLANET_CONSIDERATION_FOUR"),printValue);
				
				out.println(dynPlanetSentanceFour); */
				
        	  //out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rbConstants.getString("SIGN")+" ."+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rbConstants.getString("IS_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues +" " + rBPlanetsInVedicastrology.getString("HOUSE_ASPECTED_BY") + aspectsPlanetFromName +".");
         
        }
        }

        
        
        //fullPlanetAspectsVallues = "";
         //aspectsPlanetFromName = "";
     
         //*****************Get Planet Lordof in hindi
         String[] arrPlanetLord = String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace("\"", "").replace("]","").replace("[","").split(",");
         String aspectsPlanetLord ="";
         for(int k=0 ;k<= arrPlanetLord.length-1 ; k++){
             if(arrPlanetLord[k]!="0" ){
                aspectsPlanetLord = aspectsPlanetLord+" "+utl.newConvertNoSuffixHI(Integer.parseInt(arrPlanetLord[k]))+",";
             } 
           }
          //*****************Set Planet Lordof in AspectsPlanetLord
         if(!aspectsPlanetLord.equals("")){
             aspectsPlanetLord = aspectsPlanetLord.substring(0,aspectsPlanetLord.length()-1);//Left(AspectsPlanetLord,len(AspectsPlanetLord)-1)
           }
        
          //*****************Create Array for PlanetAspects_HI
         /*String planetAspect = ObjPlanetJSON.getString("AspectsFrom");
         arrPlanetAspects = planetAspect.split(",");
         String aspectsPlanetName ="";
         for(int l=0;l<=arrPlanetAspects.length-1;l++){
              aspectsPlanetName = aspectsPlanetName+" "+Util.ConvertPlanetNameinHI(arrPlanetAspects[l])+",";
         }
         aspectsPlanetName = aspectsPlanetName.substring(0,aspectsPlanetName.length()-1);*/
       
          //*****************Print Technical Detail in Simple Hindi Language                        
          String tempsignname ="";
          if(ObjPlanetJSON.getString("Sign").equals("esk")){
             tempsignname = "es\"k\""; 
          }else{
             tempsignname = ObjPlanetJSON.getString("Sign") ; 
          }
          planetName = SharedFunction.ProperCase(rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()));
          if(languageCode==1) {Sign = utl.ConvertSignNameInHindi(tempsignname);}
     	
     	if(languageCode==1) { relationShip =  utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants);};
     	if(languageCode==1) { situatedHoue =utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")));}
     	if(languageCode==1) {  lordHouse = aspectsPlanetLord;}
     	if(languageCode==1) { fullPlanetAspectsVallues = fullPlanetAspectsVallues_HI;}
        //  if(languageCode == 1 && i < 7 ){
        	  if((languageCode == 1 ||  languageCode == 2 || languageCode == 4 || languageCode == 6 || languageCode == 7 ||languageCode == 9 ) && i < 7 ){
              
               if(planetAspectsfromlist.equals("Null")){
            	   out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_SUN_SATURN_ISNULL"),planetName,Sign,planetName,relationShip,planetName,lordHouse,situatedHoue,planetName,fullPlanetAspectsVallues));
               //}
               //	out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है, जो की " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की "+ utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants) +" है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ aspectsPlanetLord + " घर का स्वामी होकर आपकी कुण्डली में " +utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। "  + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। ");
               }else{
            	   out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_SUN_SATURN_NOTNULL"),planetName,Sign,planetName,relationShip,planetName,lordHouse,situatedHoue,planetName,fullPlanetAspectsVallues,aspectsPlanetFromName,planetName));
               }
               //	out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+  utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है, जो की " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की "+ utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants) +" है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+aspectsPlanetLord + " घर का स्वामी होकर आपकी कुण्डली में " +utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। "  + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+ aspectsPlanetFromName +" की पूर्ण दृष्टि "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" पर है।"); 
        }
           

          
        	  else if((languageCode == 1 ||  languageCode == 2 || languageCode == 4 || languageCode == 6 || languageCode == 7 ||languageCode == 9 ) && i > 6){
              if(planetAspectsfromlist.equals("Null")){
              	//out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+  utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" "+ utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। ");
            	  out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_RAHU_KETU_ISNULL"),planetName,Sign,planetName,situatedHoue,planetName,fullPlanetAspectsVallues));
              }else{
            	  out.println(MessageFormat.format(rBPlanetPosition.getString("PLANET_RAHU_KETU_NOTNULL"),planetName,Sign,planetName,situatedHoue,planetName,fullPlanetAspectsVallues,aspectsPlanetFromName,planetName));
              
              	//out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+  utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" "+ utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+ aspectsPlanetFromName +" की पूर्ण दृष्टि "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" पर है।"); 
              }
          }
          fullPlanetAspectsVallues_HI = "";
          aspectsPlanetLord = "";
          //aspectsPlanetName = "";
          
          %>
  	</p>

  	<p>

  		<%=predictionsText1[3].replace("@^", "<").replace("^@", ">")%>

  	</p>
       
	<%
     
        }
		catch(Exception ex)
		{
			out.println(ex);
		}
      
		%>
</div>
</div>
</div>
</div>
<%}
%>
<div style="padding-top: 10px;"></div>
