<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int languageCode = (Integer)session.getAttribute("languageCode");
Hindi hindi = new Hindi();
Local local = new Local();

MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBNakshatraReport = local.loadPropertiesFileNew("nakshatrareport",languageCode);
%>

<div class="hdg-lg card">
	<h1><%=rBNakshatraReport.getString("YOUR_NAKSHATRA")%></h1>	
</div>




<% //languagecode = session.getAttribute("languageCode");

DesktopHoro myAstrologyObject= (DesktopHoro) session.getAttribute("HoroscopeObj");
if(languageCode == 1){
    myAstrologyObject.setLanguageCode("1");
    myAstrologyObject.initialize();
}else{
    myAstrologyObject.setLanguageCode("0");
    myAstrologyObject.initialize();
}
%>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<h2> <%=rBNakshatraReport.getString("WHAT_IS_NAKSHATRA")%></h2>
<p>
					<%=rBNakshatraReport.getString("NAKSHATRA_INTRO") %>
				</p>
				
				<p><b>  <%=rbConstants.getString("YOUR_NAKSHATRA")%> </b> </p>
				
				<p>
					<b><%=rbConstants.getString("YOUR_NAKSHATRA")%>: </b> 
					<% //SharedFunction sf =  new SharedFunction();
                    if(languageCode == 0){ %>
					<%out.println(SharedFunction.ProperCase(myAstrologyObject.getNakshatraName()));%>
					<%}else{%>
					<%out.println(hindi.unicode(myAstrologyObject.getNakshatraName(),languageCode));%>
					<%}%></p>
					<p><b><%=rBNakshatraReport.getString("YOUR_NAKSHATRA_PADA")%>:
					</b>
					<%=myAstrologyObject.getPadaOfPlanet(2)%></p>
				
				
			<h2> 	<%  String plnetAspectedBy ="";
            CloudDAO predic = new CloudDAO();
            int nakshatraNumber = myAstrologyObject.getNakshatra() + 1;
            String[] arrayResultofPredictions = new String[12];
            String predictionsResult = predic.ClassicalPredictionsNakshatra("Moon", nakshatraNumber, "Nakshatra", plnetAspectedBy, "Brihat Jataka", languageCode,null);
            if(!predictionsResult.equals("")){
               arrayResultofPredictions = predictionsResult.split("#");
            }else{
               arrayResultofPredictions[0] = "";
            }
        %>
        
        <% if(languageCode == 0) { %>
					
						<% out.println(SharedFunction.ProperCase(myAstrologyObject.getNakshatraName()) +" "+ rBNakshatraReport.getString("NAKSHATRA_PREDICTION_ACCORD_BRIHAT_JATAKA"));%>
				
					<% }else{ %>
					
						<% out.println(hindi.unicode(myAstrologyObject.getNakshatraName(),languageCode) +" "+ rBNakshatraReport.getString("NAKSHATRA_PREDICTION_ACCORD_BRIHAT_JATAKA"));%>
					
					<% }%></h2>
					
						<p>
					<% if(!predictionsResult.equals("")){%>
					<%//=replace(replace(ArrayResultofPredictions(3),"^@",">"),"@^","<") %>
					<%=arrayResultofPredictions[3].replace("^@",">").replace("@^","<")%>
					<%} %>
				</p>
</div>
</div>
</div>


