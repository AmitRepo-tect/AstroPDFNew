<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center" class="ui-global-table RScroll ui-hgt-ovr">
<% 

Hindi hindi = new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties Constants = (MyProperties) session.getAttribute("constants");
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
UtilDesktop objUtil = new UtilDesktop();
double ayanamsa1 = myAstrologyObject.getKPAyanamsaLongitude();	

String[] myPlanetNames = new String[13];
myPlanetNames[1]=Constants.getString("SUN");
myPlanetNames[2]=Constants.getString("MOON");
myPlanetNames[3]=Constants.getString("MARS");					   					   
myPlanetNames[4]=Constants.getString("MERCURY");
myPlanetNames[5]=Constants.getString("JUPITER");				   
myPlanetNames[6]=Constants.getString("VENUS");
myPlanetNames[7]=Constants.getString("SATURN");
myPlanetNames[8]=Constants.getString("RAHU");
myPlanetNames[9]=Constants.getString("KETU");
myPlanetNames[10]="";
myPlanetNames[11]="";
myPlanetNames[12]="";

String[] myPlanetDMS =  new String[13];   
for(int i = 1 ; i<=12 ; i++){
    double planetLongitude = (myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa1;
      if(planetLongitude >= 360){ 
        planetLongitude = planetLongitude - 360;
      } 
       myPlanetDMS[i] = objUtil.dms1(planetLongitude);
   	}		   					   					   					   					  
%>
<table>
    <tr>
        <td><%=Constants.getString("PLANETS") %></td>
        <td><%=Constants.getString("DEGREE") %></td>
    </tr>
    <% for(int i=1 ;i<= 12;i++){ %>
    <tr>
        <td style="text-align:center;"><%=myPlanetNames[i]%></td>
        <td style="text-align:center;"><%=hindi.unicode(myPlanetDMS[i],languageCode)%></td>
    </tr>
    <% }%>
</table>
</div>