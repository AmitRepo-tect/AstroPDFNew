<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.ResourceBundle"%>

<%
Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
DesktopHoro ObjHoroChalit = (DesktopHoro)session.getAttribute("HoroscopeObj");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle ascendentPrediction = local.loadPropertiesFileNew("ascendantprediction",languageCode);
MyResourceBundle ascendentPredictionMoonSign = local.loadPropertiesFileNew("ascendantprediction-moonsign",languageCode);

if(languageCode == 1){
	ObjHoroChalit.setLanguageCode("1");
	ObjHoroChalit.initialize();
}
else
{
	ObjHoroChalit.setLanguageCode("0");
	ObjHoroChalit.initialize();
}

String[] zodicsingName = local.getStringArray(ascendentPredictionMoonSign.getString("ZODIAC_SIGN"));
String[] health = local.getStringArray(ascendentPredictionMoonSign.getString("HEALTH_PREDICTION"));
String[] temperamentandpersonality = local.getStringArray(ascendentPredictionMoonSign.getString("TEMPERAMENT_AND_PERSONALITY_PREDICTION"));
String[] physicalappearence = local.getStringArray(ascendentPredictionMoonSign.getString("PHYSICAL_APPEARANCE_PREDICTION"));

String[] rashiNameForApearence = new String[13];
String healthprediction = "";
String personalityprediction = "";
String physicalappearenceprediction = "";

for(int i=0 ;i<=11;i++){
		double value=ObjHoroChalit.getMidBhavForBhava(i+1);
		String[] rashiAndDegree=ObjHoroChalit.getRasiAndItsDegree(value);
		rashiNameForApearence[i]=rashiAndDegree[0];
		String x = hindi.unicode(rashiNameForApearence[0],languageCode);
        if(x.equals(zodicsingName[i])){
                healthprediction = health[i];
                personalityprediction = temperamentandpersonality[i];
                physicalappearenceprediction = physicalappearence[i];
        }  
}

%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("YOUR_ASCENDANT")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<h5> <%=ascendentPrediction.getString("WHAT_IS_ASCENDANT")%> </h5>
<%
   
		String  langRashiName = hindi.unicode(rashiNameForApearence[0],languageCode);
    String  textReplacementArray[] = {langRashiName};
		%>
		
		<p>
					<%=ascendentPrediction.getString("ASCENDANT_PREDICTION") %>
					<br />
					<%=ascendentPrediction.getString("YOUR_ASCENDANT_IS") %>
					<strong> <%=langRashiName%>
					</strong>
				</p>
				
				
		<%
   
    
    String dynamicheadinghealth = local.getDesiredString(ascendentPrediction.getString("DYNAMIC_HEALTH_ASCEDANT_PRED"),textReplacementArray);
    String dynamicheadperstempra = local.getDesiredString(ascendentPrediction.getString("DYNAMIC_TEMP_PERSONALITY_PRED"),textReplacementArray);
    String dynamicphysicalappear = local.getDesiredString(ascendentPrediction.getString("DYNAMIC_PHYSICAL_APPEARANCE_PRED"),textReplacementArray);
 %>
</div>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<h5> <%=dynamicheadinghealth %></h5>
 <p><%=healthprediction%></p>
</div>
</div>
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<h5> <%=dynamicheadperstempra %></h5>
<p> <%=personalityprediction %></p>
</div>
</div>
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<h5> <%=dynamicphysicalappear %></h5>
<p><%=physicalappearenceprediction %></p>
</div>
</div>
</div>




