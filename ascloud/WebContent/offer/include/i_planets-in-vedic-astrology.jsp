<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@include file='/cloud/planets-detailed-informations.jsp'%>
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
<div align="center" class="heading-sec">
    <h2>
        <%=rBPlanetsInVedicastrology.getString("PLANET_CONSIDERATION")%>
    </h2>
</div>

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
<div class="inner-sec">
<h3>
    <%=rbConstants.getString(aryPlanet[i].toUpperCase()) +" "+rBPlanetsInVedicastrology.getString("CONSIDERATION")%>
</h3>

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
        for(int j=0 ;j<arrPlanetAspects.length-1 ; j++) {
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
        
        for(int k=0; k<=arrPlanetAspectsfrom.length-1;k++){
        	//out.println(arrPlanetAspectsfrom[k]);
        	
        	if(!arrPlanetAspectsfrom[k].equals("Null")){
            aspectsPlanetFromName = aspectsPlanetFromName+" "+rbConstants.getString(arrPlanetAspectsfrom[k].toUpperCase())+",";
        	}
        	else{
        	aspectsPlanetFromName = aspectsPlanetFromName+" ";
        	}
        }
        
        aspectsPlanetFromName = aspectsPlanetFromName.substring(0,aspectsPlanetFromName.length()-1);
        if(languageCode != 1 && i < 7){
        	String lordHouse = String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace("\"", "").replace("]","").replace("[","").replace(",0","");
        	if(!lordHouse.contains(","))
        	{
        		lordHouse += SharedFunction.NoSuffix(lordHouse);
        	}
            if(planetAspectsfromlist.equals("Null")){
                 
                out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rBPlanetsInVedicastrology.getString("SIGN_WHICH_IS_A") + utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants)  + " " + rBPlanetsInVedicastrology.getString("SIGN_FOR") + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) +". "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("IS_LORD_OF") +  lordHouse + " " + rBPlanetsInVedicastrology.getString("HOUSE_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues + " "+rbConstants.getString("IS_HOUSE")+" .");
             }
			else{
                
            	out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rBPlanetsInVedicastrology.getString("SIGN_WHICH_IS_A") + utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants)  + " " + rBPlanetsInVedicastrology.getString("SIGN_FOR") + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) +". "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("IS_LORD_OF") + lordHouse  + " "+ rBPlanetsInVedicastrology.getString("HOUSE_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues + rBPlanetsInVedicastrology.getString("HOUSE_ASPECTED_BY") + aspectsPlanetFromName +".");
             }
        	
        
        }

        else if(languageCode != 1 && i > 6 ){
            if(planetAspectsfromlist.equals("Null")){
                
            	out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rbConstants.getString("SIGN")+" ."+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rbConstants.getString("IS_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues + " " +rbConstants.getString("IS_HOUSE")+" .");
          }else{
                
        	  out.println(rbConstants.getString("YOUR") +" "+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + " "+ rbConstants.getString("IS_IN") +" "+ rbConstants.getString(ObjPlanetJSON.getString("Sign").toUpperCase()+"_FULL") + " " + rbConstants.getString("SIGN")+" ."+ rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rbConstants.getString("IS_SITUATED_IN") + ObjPlanetJSON.getString("House")+SharedFunction.NoSuffix(Integer.parseInt(ObjPlanetJSON.getString("House"))) + " " +rbConstants.getString("IS_HOUSE")+" . "  + rbConstants.getString(ObjPlanetJSON.getString("PlanetName").toUpperCase()) + rBPlanetsInVedicastrology.getString("ASPECTS") + fullPlanetAspectsVallues +" " + rBPlanetsInVedicastrology.getString("HOUSE_ASPECTED_BY") + aspectsPlanetFromName +".");
         
        }
        }

        
        
        fullPlanetAspectsVallues = "";
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

          if(languageCode == 1 && i < 7 ){
              
               if(planetAspectsfromlist.equals("Null")){
               	out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है, जो की " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की "+ utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants) +" है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+ aspectsPlanetLord + " घर का स्वामी होकर आपकी कुण्डली में " +utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। "  + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। ");
               }else{
               	out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+  utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है, जो की " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की "+ utl.relationshipWithPlanet(ObjPlanetJSON.getString("Relationship"),rbConstants) +" है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+aspectsPlanetLord + " घर का स्वामी होकर आपकी कुण्डली में " +utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। "  + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+ aspectsPlanetFromName +" की पूर्ण दृष्टि "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" पर है।"); 
               }
           }

          
          else if(languageCode == 1 && i > 6){
              if(planetAspectsfromlist.equals("Null")){
              	out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+  utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" "+ utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। ");
              }else{
              	out.println("आपकी कुण्डली में " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" "+  utl.ConvertSignNameInHindi(tempsignname) +" राशि में स्थित है। "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" "+ utl.newConvertNoSuffixHI(Integer.parseInt(ObjPlanetJSON.getString("House")))  + " घर में स्थित है। " + utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " की दृष्टि "+ fullPlanetAspectsVallues_HI + " घर पर है। "+ aspectsPlanetFromName +" की पूर्ण दृष्टि "+ utl.convertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName"))+" पर है।"); 
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
<%
}
%>
