<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer) session.getAttribute("languageCode");
MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle planetposition = local.loadPropertiesFileNew("planetposition", languageCode); 

if(languageCode == 1) {
myAstrologyObject.setLanguageCode("1");
}
//If session("LanguageCode") = "0" Then
else{
myAstrologyObject.setLanguageCode("0");
}
myAstrologyObject.initialize();  %>

<script type="text/javascript" src="js/drill-dasha.jsp?moon=<%=myAstrologyObject.getMoon() %>&DoB=<%=myAstrologyObject.getDayOfBirth()%>&MoB=<%=myAstrologyObject.getMonthOfBirth() %>&YoB=<%=myAstrologyObject.getYearOfBirth()%>&Hour=<%=myAstrologyObject.getHourOfBirth()%>&Min=<%=myAstrologyObject.getMinuteOfBirth()%>&Sec=<%=myAstrologyObject.getSecondOfBirth() %>&LanguageCode=<%=languageCode%>"></script>
<div class="ui-global-table RScroll ui-hgt-ovr">
    <% String[] GetVimshottariDaSortPlanetName = {"Su","Mo","Ma","Me","Ju","Ve","Sa","Ra","Ke","Ur","Ne","Pl"};
    	    %>
    	    <table align="left" cellpadding="0" cellspacing="0">
    	    <tr> 
    	    <td align="center">
    	    <% // Dim balanceDasha
    	     String balanceDasha = myAstrologyObject.getBalanceOfDasa().toString();
    	    %>
    	    <%=constants.getString("BAL_OF_DASA")+ ((hindi.unicode(balanceDasha,languageCode).replace("ल्","वर्ष")).replace("ड","माह")).replace("क्","दिन") %>
    	    </td>
    	    </tr>
    	    </table>
    	    <div class="ui-grid-view-alt">
    	       <div class="dasa ui-grid-1 ui-table-content"></div>
    	        <div align="center" class="ui-back">
    	            <a class="as-ui-button" href='javascript:back()'><%=planetposition.getString("LEVEL_UP") %></a>
    	        </div>
    	    </div>  
    	
</div>