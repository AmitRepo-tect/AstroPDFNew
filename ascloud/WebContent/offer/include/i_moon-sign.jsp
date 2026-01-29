<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>

<%
	Local local = new Local();
	Hindi hindi = new Hindi();
	int languageCode = (Integer) session.getAttribute("languageCode");
	DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
	MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
	MyResourceBundle moonSignConstants = (MyResourceBundle) local.loadPropertiesFileNew("moonsign", languageCode);
	MyResourceBundle ascPredConstants = (MyResourceBundle) local.loadPropertiesFileNew("ascendantprediction-moonsign", languageCode);
%>

<div align="center" class="heading-sec">
    <h2>
        <%=baseConstants.getString("MOON_SIGN")%>
    </h2>
</div>
<div class="inner-sec">
    <h3>
        <%=moonSignConstants.getString("WHAT_IS_MOON_SIGN")%></h3>
    <p>
        <%=moonSignConstants.getString("MOON_SIGN_INTRO") %>
    </p>
    <%
    /*String MoonSign = "";
    for(int i=0;i<=11;i++) 
    {
    	if(Common.engRashiNames[i].equals(myAstrologyObject.getRasiName()))
    	{
    		MoonSign = i+1;
    		break;
    	}
    }*/
   
String unicodeRashiName = hindi.unicode(myAstrologyObject.getRasiName(), languageCode);
String[] zodiacSignNames = local.getStringArray(ascPredConstants.getString("ZODIAC_SIGN"));
String[] health = local.getStringArray(ascPredConstants.getString("HEALTH_PREDICTION"));
String[] temperamentAndPersonality = local.getStringArray(ascPredConstants.getString("TEMPERAMENT_AND_PERSONALITY_PREDICTION"));
String[] physicalAppearance = local.getStringArray(ascPredConstants.getString("PHYSICAL_APPEARANCE_PREDICTION"));

String healthPrediction = "";
String personalityPrediction = "";
String physicalAppearancePrediction = "";
for(int i=0;i<=11;i++)
{
     if(unicodeRashiName.equals(zodiacSignNames[i]))
     {
        healthPrediction = health[i];
        personalityPrediction = temperamentAndPersonality[i];
        physicalAppearancePrediction = physicalAppearance[i];
        
     }
}
	String replacedHealthPrediction = healthPrediction.replaceAll("Ascendant", "Moon Sign ");	
	String replacedPersonalityPrediction = personalityPrediction.replaceAll("Ascendant", "Moon Sign ");	
	String replacedPhysicalAppearancePrediction = physicalAppearancePrediction.replaceAll("Ascendant", "Moon Sign ");	
    %>
    <h3>
        <%=ascPredConstants.getString("WELLNESS")+" "+ unicodeRashiName+" "+ moonSignConstants.getString("MOON_SIGN_FOR") %></h3>

<p>
    <%=replacedHealthPrediction%></p>
<h3>
    <%=ascPredConstants.getString("DISPOSITION_PERSONALITY")+" "+ unicodeRashiName+" "+ moonSignConstants.getString("MOON_SIGN_FOR") %></h3>
<p>
    <%=replacedPersonalityPrediction%></p>
<h3>
    <%=ascPredConstants.getString("PHYSICAL_APPEARANCE")+" "+ unicodeRashiName+" "+ moonSignConstants.getString("MOON_SIGN_FOR") %>
</h3>
<p>
    <%=replacedPhysicalAppearancePrediction%></p>
</div> 