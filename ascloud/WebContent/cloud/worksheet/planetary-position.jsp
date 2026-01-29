<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int planetLangCode = (Integer)session.getAttribute("languageCode");

MyProperties planetConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro planetHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
planetHoro.setLanguageCode("0");
planetHoro.initialize();

Local planetLocal = new Local();
MyResourceBundle planetPositionConstants = planetLocal.loadPropertiesFileNew("planetposition",planetLangCode);
%>
<div align="center" class="ui-global-table RScroll ui-hgt-ovr">
<table>
    <%String[] PlanetaryHeading = {"PLANETS", "COMBUST","RET_DIR","RASHI", "LONGITUDE", "NAKSHATRA", "PADA", "RELATIONSHIP"}; %>
    <tr>
        <%for(int planetheading = 0 ;planetheading<= 7;planetheading++){ %>
        <td id="PlanetaryTableTD" class="cellhead">
        <%=SharedFunction.ProperCaseL(planetConstants.getString(PlanetaryHeading[planetheading]),planetLangCode)%></td>
        <% } %>
    </tr>        
    <% for(int planetvalues = 0 ;planetvalues<= 12 ;planetvalues++){
          if(planetvalues == 0) {
        	  String replacedString = planetHoro.getAscendentRasiDms().replace("&", ":").substring(1);
    %>
   <tr class="tdbackground">
					<td id="PlanetaryTableTD"><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetName(0),planetLangCode),planetLangCode)%></td>
					<td id="PlanetaryTableTD"></td>
					<td id="PlanetaryTableTD"></td>
					<td id="PlanetaryTableTD"><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getAscendentSignName(),planetLangCode),planetLangCode)%></td>
					<td id="PlanetaryTableTD"><%=replacedString %></td>
					<td id="PlanetaryTableTD"><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getAscendentNakshatraName(),planetLangCode),planetLangCode)%></td>
					<td id="PlanetaryTableTD"><%=planetHoro.getAscendentPada()%></td>
					<td id="PlanetaryTableTD"></td>
				</tr>
    <%}else{ %>
     <tr class="tdbackground">         
        <td style="text-align:left; padding-left:5px;"><%=changeplanetname(SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetName(planetvalues),planetLangCode),planetLangCode))%></td>
        <td id="PlanetaryTableTD" >
                           <%  
                            	boolean isPlanetCombust = planetHoro.isCombust(planetvalues-1);
                            	if(isPlanetCombust  && planetvalues!=8 && planetvalues!=9) 
                                    out.println(planetPositionConstants.getString("COMBUST"));
                            	else if (isPlanetCombust && (planetvalues == 8 || planetvalues == 9))  
                            		out.println (planetPositionConstants.getString("ECLIPSE"));
                             String relationship = getRelationshipInString(planetHoro.getRelationshipForShodashvargaDivision(planetvalues, 0));  
                             
                            %>
        <td id="PlanetaryTableTD">
        						<%  if(planetHoro.isPlanetDirect(planetvalues)) 
                            		out.println(planetConstants.getString("DIR"));
                            	else 
                                	out.println(planetConstants.getString("RET"));
                            String replacedPlanetString = planetHoro.getPlanetaryRasiDms(planetvalues).replace("&", ":").substring(1);
                            %>
        </td>     
                  
        <td id="PlanetaryTableTD"><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetaryRasiName(planetvalues),planetLangCode),planetLangCode)%></td>
	    <td id="PlanetaryTableTD"><%=replacedPlanetString%></td>
		<td id="PlanetaryTableTD"><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getNakshatraNameForPlanet(planetvalues),planetLangCode),planetLangCode)%></td>
		<td id="PlanetaryTableTD"><%=planetHoro.getPadaOfPlanet(planetvalues)%></td>      
        <td id="PlanetaryTableTD"><%if(!relationship.equals("-")){%> <%=planetConstants.getString(relationship.toUpperCase()+"_RELATION") %>
						<% } %></td>
    </tr>
    <% }
    } %>
</table>
</div>

<%!
    public String changeplanetname(String planetname)
    {
		String returnPlName = planetname;
		if(planetname != null)
		{
			if(planetname.equals("अरूण"))
			{
				returnPlName = "यूरे";
			}
			else if(planetname.equals("वरूण"))
			{
				returnPlName = "नेप";
			}
			else if(planetname.equals("यम"))
			{
				returnPlName = "प्लू";
			}
		}
        return returnPlName;
    }

public String getRelationshipInString(int iRelationship)
{
	String strReturnValue = "-";
	if(iRelationship > 0 && iRelationship <= 6)
		strReturnValue = Common.relationship[iRelationship-1];
	return strReturnValue;
}
    %>