<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>

<%
	Local local = new Local();
	Hindi hindi = new Hindi();
	int languageCode = (Integer) session.getAttribute("languageCode");
	DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
	MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
	MyResourceBundle moonSignConstants = (MyResourceBundle) local.loadPropertiesFileNew("moonsign", languageCode);
	MyResourceBundle ascPredConstants = (MyResourceBundle) local.loadPropertiesFileNew("ascendantprediction-moonsign", languageCode);
%>

<div class="hdg-lg card">
	<h1><%=baseConstants.getString("YOUR_MOON_SIGN")%></h1>	
</div>

<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<h2> <%=moonSignConstants.getString("WHAT_IS_MOON_SIGN")%> </h2>
<p><%=moonSignConstants.getString("MOON_SIGN_INTRO") %></p>
				
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
String  textReplacementArray[] = {unicodeRashiName};
String dynamicheadinghealth = local.getDesiredString(moonSignConstants.getString("DYNAMIC_HEALTH_MOON_SIGN"),textReplacementArray);
String dynamicheadperstempra = local.getDesiredString(moonSignConstants.getString("DYNAMIC_TEMP_PERSONALITY_MOON_SIGN"),textReplacementArray);
String dynamicphysicalappear = local.getDesiredString(moonSignConstants.getString("DYNAMIC_PHYSICAL_APPEARANCE_MOON_SIGN"),textReplacementArray);

	String replacedHealthPrediction = healthPrediction.replaceAll("Ascendant", "Moon Sign ");	
	String replacedPersonalityPrediction = personalityPrediction.replaceAll("Ascendant", "Moon Sign ");	
	String replacedPhysicalAppearancePrediction = physicalAppearancePrediction.replaceAll("Ascendant", "Moon Sign ");	
    %>
</div>
</div>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>

<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<h2> <%=dynamicheadinghealth %></h2>
<p><%=replacedHealthPrediction%></p>
</div>
</div>
</div>

<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<h2> <%=dynamicheadperstempra %></h2>
<p><%=replacedPersonalityPrediction%></p>
</div>
</div>
</div>

<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<h2> <%=dynamicphysicalappear%></h2>
<p><%=replacedPhysicalAppearancePrediction%></p>
</div>
</div>
</div>


