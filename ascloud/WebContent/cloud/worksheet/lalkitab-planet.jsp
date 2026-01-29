<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro myAstrologyObject= (DesktopHoro) session.getAttribute("HoroscopeObj");
int languageCode = (Integer)session.getAttribute("languageCode");
Local local = new Local();
MyResourceBundle rBLalplanet = local.loadPropertiesFileNew("planetposition-lalplanethouse", languageCode);
MyResourceBundle rBLalhouse = local.loadPropertiesFileNew("lalplanethouse-lalkitabvarshaphal", languageCode);
%>
<div align="center" class="ui-global-table RScroll ui-hgt-ovr">
<%
SharedFunction sf = new SharedFunction();
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
UtilLalkitab lalKitabUtil = new UtilLalkitab();
String[] arrMaalik=new String[12];
int[] arrMalificBenefic=new int[10];
String[] arrHeading=new String[6];
String[] arrPlanet=new String[12];
String[] arrSign=new String[9];
String[] arrPosition=new String[9];
String[] arrSoya=new String[9];
String[] arrKismatJagaanewala=new String[9];
String[] maleficBenefic=new String[3];


/*objLalKitab.setName (myAstrologyObject.getName());
objLalKitab.setPlace (myAstrologyObject.getPlace());
objLalKitab.setTimeZone (myAstrologyObject.getTimeZone());
objLalKitab.setMaleFemale (myAstrologyObject.getMaleFemale());
objLalKitab.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
objLalKitab.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
objLalKitab.setHourOfBirth (myAstrologyObject.getHourOfBirth());
objLalKitab.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
objLalKitab.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
objLalKitab.setYearOfBirth (String.valueOf(myAstrologyObject.getYearOfBirth()));
objLalKitab.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
objLalKitab.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
objLalKitab.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
objLalKitab.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
objLalKitab.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
objLalKitab.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
objLalKitab.setEastWest (myAstrologyObject.getEastWest());
objLalKitab.setNorthSouth (myAstrologyObject.getNorthSouth());
objLalKitab.setDST (myAstrologyObject.getDST());
objLalKitab.setLanguageCode("0");
objLalKitab.initialize();
*/
 
int[] mRaashiNoCorrespondingToPlanetsNew=new int[12];
mRaashiNoCorrespondingToPlanetsNew = objLalKitab.getPlanetInBhav(1);

for(int iCount = 0; iCount<= 8; iCount++)
{
	arrSign[iCount] = objLalKitab.getPlanetaryRashiNameForLalkitab(iCount + 1).toUpperCase();
}
arrHeading[0] = "PLANETS";
arrHeading[1] = "RASHI";
arrHeading[2] = "POSITION";
arrHeading[3] = "SOYA";
arrHeading[4] = "KISMAT_JAGANEWALA";
arrHeading[5] = "BENEFIC_MALEFIC";

arrPlanet[0]="SUN";
arrPlanet[1]="MOON";
arrPlanet[2]="MARS";									   
arrPlanet[3]="MERCURY";					  
arrPlanet[4]="JUPITER";				   
arrPlanet[5]="VENUS";
arrPlanet[6]="SATURN"; 
arrPlanet[7]="RAHU";
arrPlanet[8]="KET";

arrPosition[0] = "DASH";
arrPosition[1] = "EXALTED";
arrPosition[2] = "DEBILITATED";
arrPosition[3] = "OWN";
arrPosition[4] = "FRSIGN";
arrPosition[5] = "ENSIGN";
arrPosition[6] = "NUSIGN";						

for(int iCount = 0; iCount<= 8; iCount++)
{
  
  if (objLalKitab.isPlanetSoya(iCount + 1))
	{
	  arrSoya[iCount] = rBConstants.getString("YES");
	}
else if(!objLalKitab.isPlanetSoya(iCount + 1))
    {
	arrSoya[iCount] = rBConstants.getString("NO");
  	}
	
}

for(int iCount = 0; iCount<= 8; iCount++){
//arrKismatJagaanewala(iCount) = objLalKitab.isPlanetKismatJagganewala(iCount+1)
if (objLalKitab.isPlanetKismatJagganewala(iCount+1))
	{
	arrKismatJagaanewala[iCount] = rBConstants.getString("YES");
	}
else if(!objLalKitab.isPlanetKismatJagganewala(iCount+1))
      {
	 arrKismatJagaanewala[iCount] = rBConstants.getString("NO");
    	}
	}


maleficBenefic[0] = "<font color=red>"+ rBConstants.getString("MALEFIC") +"</font>"; 
maleficBenefic[1] = rBConstants.getString("BENEFIC");

for(int iCount = 0; iCount<= 8; iCount++)
{
  arrMalificBenefic[iCount] = lalKitabUtil.getMaleficBenafic (iCount+1 , mRaashiNoCorrespondingToPlanetsNew[iCount ]);
}
%>
<table>
    <tr>
        <% for (int ij=0; ij<=5; ij++){ %>
        <td>
            <b>
                <%=rBLalhouse.getString(arrHeading[ij])%></b>&nbsp;
        </td>
        <% }%>
    </tr>
    <% for(int i=0; i<=8; i++){%>
    <tr>
        <td class="cellcontent">
            <%=rBConstants.getString(arrPlanet[i])%>&nbsp;
        </td>
        <td class="cellcontent">
            <%=rBConstants.getString(arrSign[i]+"_FULL")%>&nbsp;
        </td>
        <td class="cellcontent">
        <%
        //System.out.println(objLalKitab.getRelationship(i+1));
        %>
            <%=rBLalhouse.getString(arrPosition[objLalKitab.getRelationship(i+1)])%>&nbsp;
        </td>
        <td class="cellcontent">
            <%=arrSoya[i]%>&nbsp;
        </td>
        <td class="cellcontent">
            <%=arrKismatJagaanewala[i]%>&nbsp;
        </td>
        <td class="cellcontent">
            <%=maleficBenefic[arrMalificBenefic[i]]%>&nbsp;
        </td>
    </tr>
    <%}%>
</table>
</div>