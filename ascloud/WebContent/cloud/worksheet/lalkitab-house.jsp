<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
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
<%@page import="java.util.PropertyResourceBundle"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div align="center" class="ui-global-table RScroll" style="max-height:262px; overflow-y:scroll;">
<%	
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro myAstrologyObject= (DesktopHoro) session. getAttribute("HoroscopeObj");
int languageCode = (Integer)session.getAttribute("languageCode");
Local local = new Local();
MyResourceBundle rBLalplanet = local.loadPropertiesFileNew("lalplanethouse-lalkitabvarshaphal", languageCode); 

SharedFunction sf = new SharedFunction();
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
objLalKitab.initializesArrayValuesOfLalKitab();
int[] RaashiNoCorrespondingToPlanets=new int[12];
RaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
UtilLalkitab lalKitabUtil = new UtilLalkitab();


				   
String[] arrHeading2=new String[7];
int[] arrKhana=new int[12];
String[] planetName=new String[10];
String[] arrPakkaGhar=new String[12];
String[] arrKismat=new String[12];
String[] arrSoya2=new String[12];
String[] arrExalt=new String[12];
String[] arrDeblt=new String[12];

String[] arrMaalik=new String[12];


/*objLalKitab.setName (myAstrologyObject.getName());
objLalKitab.setPlace (myAstrologyObject.getPlace());
objLalKitab.setTimeZone (myAstrologyObject.getTimeZone());
objLalKitab.setMaleFemale (myAstrologyObject.getMaleFemale());
objLalKitab.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
objLalKitab.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
objLalKitab.setHourOfBirth (myAstrologyObject.getHourOfBirth());
objLalKitab.setDayOfBirth(String.valueOf(myAstrologyObject.getDayOfBirth()));
objLalKitab.setMonthOfBirth(String.valueOf(myAstrologyObject.getMonthOfBirth()));
objLalKitab.setYearOfBirth(String.valueOf(myAstrologyObject.getYearOfBirth()));
objLalKitab.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
objLalKitab.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
objLalKitab.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
objLalKitab.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
objLalKitab.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
objLalKitab.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
objLalKitab.setEastWest (myAstrologyObject.getEastWest());
objLalKitab.setNorthSouth (myAstrologyObject.getNorthSouth());
objLalKitab.setDST (myAstrologyObject.getDST());
objLalKitab.setLanguageCode ("0");
objLalKitab.initialize();
*/

for(int i=0; i<=11;i++)
{
    arrKhana[i]=i+1;
}
	      
  				
arrMaalik[0]="MARS";
arrMaalik[1]="VENUS";
arrMaalik[2]="MERCURY";
arrMaalik[3]="MOON";
arrMaalik[4]="SUN";
arrMaalik[5]="MERCURY";
arrMaalik[6]="VENUS";
arrMaalik[7]="MARS";
arrMaalik[8]="JUPITER";
arrMaalik[9]="SATURN";
arrMaalik[10]="SATURN";
arrMaalik[11]="JUPITER";

planetName[1]="SUN";
planetName[2]="MOON";
planetName[3]="MARS" ;									   
planetName[4]="MERCURY";					  
planetName[5]="JUPITER"	;				   
planetName[6]="VENUS";
planetName[7]="SATURN";
planetName[8]="RAHU";
planetName[9]="KET";

arrHeading2[0] = "KHANANO";
arrHeading2[1] = "MAALIK";
arrHeading2[2] = "PAKKAGHAR";
arrHeading2[3] = "KISMAT";
arrHeading2[4] = "SOYA";
arrHeading2[5] = "EXALLT";
arrHeading2[6] = "DEBLT";
 
arrPakkaGhar[0] = rBConstants.getString(planetName[1]);
arrPakkaGhar[1] = rBConstants.getString(planetName[5]);
arrPakkaGhar[2] = rBConstants.getString(planetName[3]);
arrPakkaGhar[3] = rBConstants.getString(planetName[2]);
arrPakkaGhar[4] = rBConstants.getString(planetName[5]);
arrPakkaGhar[5] = rBConstants.getString(planetName[4]) + " " + rBConstants.getString(planetName[9]);
arrPakkaGhar[6] = rBConstants.getString(planetName[6]) + " " + rBConstants.getString(planetName[4]);
arrPakkaGhar[7] = rBConstants.getString(planetName[3]) + " " + rBConstants.getString(planetName[7]);
arrPakkaGhar[8] = rBConstants.getString(planetName[5]);
arrPakkaGhar[9] = rBConstants.getString(planetName[7]);
arrPakkaGhar[10] = rBConstants.getString(planetName[7]);
arrPakkaGhar[11] = rBConstants.getString(planetName[5]) + " " + rBConstants.getString(planetName[8]);

arrKismat[0] = planetName[3];
arrKismat[1] = planetName[2];
arrKismat[2] = planetName[4];
arrKismat[3] = planetName[2];
arrKismat[4] = planetName[1];
arrKismat[5] = planetName[9];
arrKismat[6] = planetName[6];
arrKismat[7] = planetName[2];
arrKismat[8] = planetName[7];
arrKismat[9] = planetName[7];
arrKismat[10] = planetName[5];
arrKismat[11] = planetName[8];
for(int icount=1; icount<=9;icount++)
{
	
    if(objLalKitab.isPlanetSoya(icount))
    	{
    	arrSoya2[icount] = rBConstants.getString("YES");
    	}
        
    else if(!objLalKitab.isPlanetSoya(icount)){
        arrSoya2[icount] = rBConstants.getString("NO");
    }
}

arrExalt[0] = rBConstants.getString(planetName[1]);
arrExalt[1] = rBConstants.getString(planetName[2]);
arrExalt[2]=  rBConstants.getString(planetName[8]);
arrExalt[3] = rBConstants.getString(planetName[5]);
arrExalt[4] = " ";
arrExalt[5] = rBConstants.getString(planetName[4]) + " " + rBConstants.getString(planetName[8]);
arrExalt[6] = rBConstants.getString(planetName[7]);
arrExalt[7] = " ";
arrExalt[8] = rBConstants.getString(planetName[9]);
arrExalt[9] = rBConstants.getString(planetName[3]);
arrExalt[10] = " ";
arrExalt[11] = rBConstants.getString(planetName[6]) + " " + rBConstants.getString(planetName[9]);
arrDeblt[0] = rBConstants.getString(planetName[7]);
arrDeblt[1] = " ";
arrDeblt[2] = rBConstants.getString(planetName[9]);
arrDeblt[3] = rBConstants.getString(planetName[3]);
arrDeblt[4] = " ";
arrDeblt[5] = rBConstants.getString(planetName[6]) + " " + rBConstants.getString(planetName[9]);
arrDeblt[6] = rBConstants.getString(planetName[1]);
arrDeblt[7] = rBConstants.getString(planetName[2]);
arrDeblt[8] = rBConstants.getString(planetName[8]);
arrDeblt[9] = rBConstants.getString(planetName[5]);
arrDeblt[10] = " ";
arrDeblt[11] = rBConstants.getString(planetName[4]) + " " + rBConstants.getString(planetName[8]);
       
for(int i =0; i<=11; i++)
{
  if(arrExalt[i]==null && arrExalt[i]==" ")
  {
        arrExalt[i]="---";
  } 
    if(i==0 || i==10 || i==11)
    	{
        arrSoya2[i]="---";
    	}
    if(arrDeblt[i]==" " && arrDeblt[i]==null)
    	{
        arrDeblt[i]="---";
    	}  
}    
%>
<table>
<tr>
<% for (int ij=0; ij<= 6; ij++){ %>
<td>
    <b><%=rBLalplanet.getString(arrHeading2[ij])%></b>
</td>
<% }%>
</tr>
<% for (int i=0; i<= 11; i++){%>
<tr>
<td class="cellcontent">
    <%=arrKhana[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%=rBConstants.getString(arrMaalik[i])%>&nbsp;
</td>
<td class="cellcontent">
    <%=arrPakkaGhar[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%=rBConstants.getString(arrKismat[i])%>&nbsp;
</td>
<td class="cellcontent">
    <%= arrSoya2[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%= arrExalt[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%= arrDeblt[i]%>&nbsp;
</td>
</tr>
<%}%>
</table>
</div>