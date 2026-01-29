<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int languageCode = (Integer)session.getAttribute("languageCode");
Hindi hindi = new Hindi();
Local local = new Local();

MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBNakshatraReport = local.loadPropertiesFileNew("nakshatrareport",languageCode);
%>

<div align="center" class="heading-sec">
    <h2>
        <%=rBNakshatraReport.getString("WHAT_IS_NAKSHATRA")%>
    </h2>
</div>

<% 
DesktopHoro myAstrologyObject= (DesktopHoro) session.getAttribute("HoroscopeObj");
if(languageCode == 1){
    myAstrologyObject.setLanguageCode("1");
    myAstrologyObject.initialize();
}else{
    myAstrologyObject.setLanguageCode("0");
    myAstrologyObject.initialize();
}
%>
<div class="inner-sec">
 
                <h3>
                    <%=rBNakshatraReport.getString("WHAT_IS_NAKSHATRA")%>
                </h3>
            
                <p>
                    <%=rBNakshatraReport.getString("NAKSHATRA_INTRO") %>
                </p>
            
                <h3>
                    <%=rbConstants.getString("YOUR_NAKSHATRA")%></h3>
            
                <p>
                    <strong><%=rbConstants.getString("YOUR_NAKSHATRA")%>: </strong>
                    <% 
                    if(languageCode == 0){ %>
					<%out.println(SharedFunction.ProperCase(myAstrologyObject.getNakshatraName()));%>
					<%}else{%>
					<%out.println(hindi.unicode(myAstrologyObject.getNakshatraName(),languageCode));%>
					<%}%>
                    <br />
                    <strong><%=rBNakshatraReport.getString("YOUR_NAKSHATRA_PADA")%>: </strong>
                    <%=myAstrologyObject.getPadaOfPlanet(2) %>
                </p>
          
        <%  String plnetAspectedBy ="";
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
       
               <h3>
               <% if(languageCode == 0) { %>
                    <strong><% out.println(SharedFunction.ProperCase(myAstrologyObject.getNakshatraName()) +" "+ rBNakshatraReport.getString("NAKSHATRA_PREDICTION_ACCORD_BRIHAT_JATAKA"));%> </strong>
               <% } else { %>
                    <strong><% out.println(hindi.unicode(myAstrologyObject.getNakshatraName(),languageCode) +" "+ rBNakshatraReport.getString("NAKSHATRA_PREDICTION_ACCORD_BRIHAT_JATAKA"));%> </strong>
               <% } %>     
               </h3>
                    
           
                <p>
                   <% if(!predictionsResult.equals("")){%>
					
					<%=arrayResultofPredictions[3].replace("^@",">").replace("@^","<")%>
					<%} %>
                </p>
           
</div>

