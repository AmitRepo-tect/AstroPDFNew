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

int iCount,iJ,planetCount,bhavaCount,readValue;
String tempPlanet="";
//int myArray[]= new int[9];
int[][] myArray=new int[10][12];
String[] myArrayNo=new String[12];
int[][] BhavArray=new int[12][12];
DesktopHoro myAstrologyObject= (DesktopHoro) session. getAttribute("HoroscopeObj");
UtilDesktop objUtil = new UtilDesktop();
Hindi hindi=new Hindi();
Local local=new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
String[] myPlanetNames =new String[13];
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
int digit=0;
String fDigit="";
for(int i=1; i<=9; i++)
{
	  myArray[i] = myAstrologyObject.getKPPlanetSignification(i);
	 
}
 
    
    
        
    myArrayNo[0] = "I";
    myArrayNo[1] = "II";
    myArrayNo[2] = "III";
    myArrayNo[3] = "IV";
    myArrayNo[4] = "V";
    myArrayNo[5] = "VI";
    myArrayNo[6] = "VII";
    myArrayNo[7] = "VIII";
    myArrayNo[8] = "IX";
    myArrayNo[9] = "X";
    myArrayNo[10] = "XI";
    myArrayNo[11] = "XII";

    for( planetCount = 1; planetCount<= 9; planetCount++)
    {
        for( bhavaCount = 0; bhavaCount<=11; bhavaCount++)
        {
            readValue = myArray[planetCount][bhavaCount];
             if(readValue == 0)
            	 {
            	 break;
            	 }
            BhavArray[readValue - 1][planetCount - 1] = planetCount;
        }
    }
    MyResourceBundle rBKPSignIRP = local.loadPropertiesFileNew("kpsignirp",languageCode);
%>        
    <table>
        <tr>
            <td><%=rBKPSignIRP.getString("HOUSE_KP") %></td>
            <td><%=rBConstants.getString("PLANETS") %></td>
        </tr>
        <% 
       for( iCount = 0; iCount<=11; iCount++){ %>
        <tr>
            <td><%= myArrayNo[iCount]%></td>
            <td>
                <% for(iJ = 0; iJ<= 11; iJ++)
                {
                    if(myPlanetNames[BhavArray[iCount] [iJ]]!=  "" && myPlanetNames[BhavArray[iCount] [iJ]]!=null)
                    	{
                    	
                %>
                &nbsp;&nbsp;<%=myPlanetNames[BhavArray[iCount][iJ]]%>&nbsp;&nbsp;
                <%}%>
            <%  } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
