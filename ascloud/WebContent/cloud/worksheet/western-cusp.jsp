<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center" class="ui-global-table RScroll ui-hgt-ovr">
<% 
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties Constants = (MyProperties) session.getAttribute("constants");
Hindi hindi = new Hindi();
         

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
UtilDesktop objUtil = new UtilDesktop();

double ayanamsa1 = myAstrologyObject.getKPAyanamsaLongitude();				   					  

String[] planetDegreeArr = new String[12];
for(int i = 1 ;i<=12 ; i++){
	 double cuspalLongitude = (myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa1;
       if(cuspalLongitude >= 360)  {
       	cuspalLongitude = cuspalLongitude - 360; 
       }
       objUtil.dms1 (cuspalLongitude);
       
       double planetLongitude1 = (myAstrologyObject.getKPCuspLongitude(i)) + ayanamsa1;
       if( planetLongitude1 >= 360)
       planetLongitude1 = planetLongitude1 - 360;
       planetDegreeArr[i - 1] = objUtil.dms1(planetLongitude1);
}
%>
<table>
    <tr>
        <td>
            <%=Constants.getString("CUSP")%>
        </td>
        <td>
            <%=Constants.getString("DEGREE") %>
        </td>
    </tr>
    <% for(int i=1 ;i<= 12 ; i++){ %>
    <tr>
        <td style=" text-align:center;">
            <%=(i)%>&nbsp;
        </td>
        <td style=" text-align:center;">
            <%=hindi.unicode(planetDegreeArr[i-1],languageCode)%>
        </td>
    </tr>
    <% }%>
</table>
</div>