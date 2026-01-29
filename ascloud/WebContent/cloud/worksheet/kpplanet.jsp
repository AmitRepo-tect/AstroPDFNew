<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.*"%>
<div align="center" class="ui-global-table RScroll" style="max-height:262px; overflow-y:scroll;">
<%  	            
  int ayanamsa1=0;  
  String[] myPlanetNames=new String[13];
  String[]myPlanetDMS=new String[13];
  String[]myPlanetRNSS=new String[13]; 
  DesktopHoro myAstrologyObject= (DesktopHoro) session. getAttribute("HoroscopeObj");
  UtilDesktop objUtil = new UtilDesktop();
  Hindi hindi=new Hindi();
  Local local=new Local();
  int languageCode = (Integer)session.getAttribute("languageCode");
  MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
  myPlanetNames[1]=rBConstants.getString("SUN");
  myPlanetNames[2]=rBConstants.getString("MOON");
  myPlanetNames[3]=rBConstants.getString("MARS");										   
  myPlanetNames[4]=rBConstants.getString("MERCURY");				  
  myPlanetNames[5]=rBConstants.getString("JUPITER");					   
  myPlanetNames[6]=rBConstants.getString("VENUS");
  myPlanetNames[7]=rBConstants.getString("SATURN");
  myPlanetNames[8]=rBConstants.getString("RAHU");
  myPlanetNames[9]=rBConstants.getString("KETU");
  myPlanetNames[10]=rBConstants.getString("URANUS");
  myPlanetNames[11]=rBConstants.getString("NEPTUNE");
  myPlanetNames[12]=rBConstants.getString("PLUTO");
																									   
for(int i=1;i<=12;i++)
{
    myPlanetDMS[i] = objUtil.dms1((myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa1);
    //myPlanetRNSS[i] = myAstrologyObject.Rnss(myAstrologyObject.getKPPlanetLongitude(i));
    myPlanetRNSS[i] = local.getRNSSData(myAstrologyObject.rnss(myAstrologyObject.getKPPlanetLongitude(i)), "-", (Integer)session.getAttribute("languageCode"));
}		     
%>
<table>
    <tr>
        <td class="cellhead">
            <%=rBConstants.getString("PLANETS") %>
        </td>
        <td class="cellhead">
            <%=rBConstants.getString("DEGREE") %>
        </td>
        <td class="cellhead">
            <%=rBConstants.getString("RAS_NAK_SUB_SS") %>
        </td>
        <td class="cellhead">
             <%=rBConstants.getString("RET_DIR")%>
        </td>
    </tr>
    <% for(int i=1; i<=12;i++){ %>
    <tr>
        <td class="cellcontent" style="text-align:center;">
            <%=myPlanetNames[i]%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <%=hindi.unicode(myPlanetDMS[i], languageCode)%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <%=hindi.unicode(myPlanetRNSS[i], languageCode)%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <% if(myAstrologyObject.isPlanetDirect(i)){ %>
            <%=rBConstants.getString("DIR")%>
            <% }
             else { %>
            <%=rBConstants.getString("RET")%>
            <%}%>
        </td>
    </tr>
    <% }%>
</table>

</div>
