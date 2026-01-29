<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int languageCodeAP = Util.safeInt(session.getAttribute("languageCode"));
Local localAP = new Local();
Hindi hindiAP = new Hindi();
DesktopHoro ObjHoroChalitAP = (DesktopHoro)session.getAttribute("HoroscopeObj");
MyProperties rBConstantsAP = (MyProperties) session.getAttribute("constants");
MyResourceBundle ascendentPrediction = localAP.loadPropertiesFileNew("ascendantprediction",languageCodeAP);
MyResourceBundle ascendentPredictionMoonSign = localAP.loadPropertiesFileNew("ascendantprediction-moonsign",languageCodeAP);

if(languageCodeAP == 1){
	ObjHoroChalitAP.setLanguageCode("1");
	ObjHoroChalitAP.initialize();
}
else
{
	ObjHoroChalitAP.setLanguageCode("0");
	ObjHoroChalitAP.initialize();
}

String[] zodicsingName = localAP.getStringArray(ascendentPredictionMoonSign.getString("ZODIAC_SIGN"));
String[] health = localAP.getStringArray(ascendentPredictionMoonSign.getString("HEALTH_PREDICTION"));
String[] temperamentandpersonality = localAP.getStringArray(ascendentPredictionMoonSign.getString("TEMPERAMENT_AND_PERSONALITY_PREDICTION"));
String[] physicalappearence = localAP.getStringArray(ascendentPredictionMoonSign.getString("PHYSICAL_APPEARANCE_PREDICTION"));

String[] rashiNameForApearence = new String[13];
String healthprediction = "";
String personalityprediction = "";
String physicalappearenceprediction = "";

for(int i=0 ;i<=11;i++){
		double value=ObjHoroChalitAP.getMidBhavForBhava(i+1);
		String[] rashiAndDegree=ObjHoroChalitAP.getRasiAndItsDegree(value);
		rashiNameForApearence[i]=rashiAndDegree[0];
        if(hindiAP.unicode(rashiNameForApearence[0],languageCodeAP).equals(zodicsingName[i])){
                healthprediction = health[i];
                personalityprediction = temperamentandpersonality[i];
                physicalappearenceprediction = physicalappearence[i];
        }  
}

%>
<div align="center" class="heading-sec">
    <h2>
        <%=rBConstantsAP.getString("YOUR_ASCENDANT")%>
    </h2>
</div>
<div class="inner-sec">
    <h3>
        <%=ascendentPrediction.getString("WHAT_IS_ASCENDANT")%>
    </h3>
    <p>
        <%=ascendentPrediction.getString("ASCENDANT_PREDICTION") %>
    </p>
    <p>
        <strong>
            <%=ascendentPrediction.getString("YOUR_ASCENDANT_IS") %>&nbsp;<%=hindiAP.unicode(rashiNameForApearence[0], languageCodeAP)%>
        </strong>
    </p>
    <h3>
        <%=ascendentPredictionMoonSign.getString("WELLNESS")+" "+ hindiAP.unicode(rashiNameForApearence[0], languageCodeAP)+" "+ ascendentPrediction.getString("ASCENDANT1")+" " +ascendentPrediction.getString("TAM_WELLNESS") %>
    </h3>
    <p>
        <%=healthprediction %></p>
    <h3>
        <%=ascendentPredictionMoonSign.getString("DISPOSITION_PERSONALITY")+" "+ hindiAP.unicode(rashiNameForApearence[0], languageCodeAP)+" "+ ascendentPrediction.getString("ASCENDANT1")+" " +ascendentPrediction.getString("TAM_DISPOSITION_PERSONALITY") %>
    </h3>
    <p>
        <%=personalityprediction %></p>
    <h3>
        <%=ascendentPredictionMoonSign.getString("PHYSICAL_APPEARANCE")+" "+ hindiAP.unicode(rashiNameForApearence[0], languageCodeAP)+" "+ ascendentPrediction.getString("ASCENDANT1")+" " +ascendentPrediction.getString("TAM_PHYSICAL_APPEARANCE") %>
    </h3>
    <p>
        <%=physicalappearenceprediction %></p>
</div>
