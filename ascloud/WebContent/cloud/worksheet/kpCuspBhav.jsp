
<%@page import="javax.mail.Session"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.*"%>

<% 

Hindi hindi=new Hindi();
Local local=new Local();
 int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>
<div align="center" class="ui-global-table RScroll" style="max-height:262px; overflow-y:scroll;">
<%    

int ayanamsa1=0;  
String[] rashiName=new String[13];
String[] nakName=new String[13];
String[] subLordName=new String[13];
String[] subSubLordName=new String[13];
String[] strDeLimiter=new String[13];
String[] rnss=new String[13];
String[] planetDegreeArr=new String[13];
String[] rnssOfPlanet=new String[13]; 
 
DesktopHoro myAstrologyObject= (DesktopHoro) session. getAttribute("HoroscopeObj");


UtilDesktop objUtil = new UtilDesktop();


        for(int i=1;i<=12; i++)
           {
        	strDeLimiter[i] = ""; // no result found in asp
        	rashiName[i] = myAstrologyObject.getRashiNameForKPCusp(i);
            nakName[i] = myAstrologyObject.getNakshatraLordNameForKPCusp(i);
            subLordName[i] = myAstrologyObject.getSubLordNameForKPCusp(i);
            subSubLordName[i] = myAstrologyObject.getSubSubLordNameForKPCusp(i);
            rnss[i] = rashiName[i]	+ strDeLimiter[i] + "-" + nakName[i] + strDeLimiter[i] + "-" + subLordName[i] +  strDeLimiter[i] + "-" + subSubLordName[i];
           // System.out.println(strDeLimiter[i]+"<br/>");
            }

       for(int j=1;j<=12; j++)
        {
    	   objUtil.dms1 ((myAstrologyObject.getKPPlanetLongitude(j)) + ayanamsa1);
           planetDegreeArr[j - 1] = objUtil.dms1((myAstrologyObject.getKPCuspLongitude(j)) + ayanamsa1);
           rnssOfPlanet[j - 1] = local.getRNSSData(rnss[j], "-",  (Integer)session.getAttribute("languageCode"));
           
         }


%>

<table>
    <tr>
        <td class="cellhead">
            <%=rBConstants.getString("CUSP") %>
        </td>
        <td class="cellhead">
            <%=rBConstants.getString("DEGREE") %>
        </td>
        <td class="cellhead">
            <%=rBConstants.getString("RAS_NAK_SUB_SS") %>
        </td>
    </tr>
    <%for(int i=0;i<12; i++)
    {
    %>
    <tr>
        <td class="cellcontent" style="text-align:center;">
            <%=i+1%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <%=hindi.unicode(planetDegreeArr[i],languageCode)%>
        </td>
        <td class="cellcontent" style="text-align:center;">
         <%=rnssOfPlanet[i].replace(".","-")%>
        </td>
    </tr>
    <% }%>
</table>

</div>