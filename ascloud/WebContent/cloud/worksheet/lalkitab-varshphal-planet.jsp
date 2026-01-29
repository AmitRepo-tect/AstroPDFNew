<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
int planetLangCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro planetHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
Local planetLocal = new Local();
MyResourceBundle rBLalplanet_varsh = planetLocal.loadPropertiesFileNew("lalplanethouse-lalkitabvarshaphal",planetLangCode);
%>
<div align="center" class="ui-global-table RScroll ui-hgt-ovr">
<% 
SharedFunction sf = new SharedFunction();
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
UtilLalkitab lalKitabUtil = new UtilLalkitab();

String[] maleficBenefic = new String[3];
maleficBenefic[0] = "<font color=red>" + rBConstants.getString("MALEFIC") + "</font>";
maleficBenefic[1] = rBConstants.getString("BENEFIC");
//************* code for current year ***********

String getYear = request.getParameter("ChangeYear");
if(getYear!=null && getYear!=""){
session.setAttribute("tt", getYear);
}

Calendar cal = Calendar.getInstance();
		 
int myvalue = 0;
if(getYear!=null && !getYear.equals("")){
  myvalue=Integer.parseInt(getYear);
}else{
  myvalue=cal.get(Calendar.YEAR);
}

myvalue = (int)(myvalue) - (int)(myAstrologyObject.getYearOfBirth());  

int period;
if(myvalue==0) {//if date of birth is current year
  period=1;
}else{
  period=myvalue;
}

int day1=myAstrologyObject.getDayOfBirth();
int year1=myAstrologyObject.getYearOfBirth();
int month1=myAstrologyObject.getMonthOfBirth();
int month2=cal.get(Calendar.MONTH);

int currentMonth;
if(month2<=month1){
  period=period+0;
  currentMonth=0;
}else{
  currentMonth=1;
  period=period+1;
  year1=year1+1;
}

int currYear=myvalue + myAstrologyObject.getYearOfBirth();

objLalKitab.initializesArrayValuesOfLalKitab();
int[] raashiNoCorrespondingToPlanets =  new int[13];
raashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
 
int[] raashiNoCorrespondingToPlanets1  = new int[13];
for(int iCount = 0 ; iCount<=11; iCount++){
    raashiNoCorrespondingToPlanets1[iCount + 1] = raashiNoCorrespondingToPlanets[iCount];
}
  
raashiNoCorrespondingToPlanets1[0] = 1;
int[] raashiNo = SharedFunction.getRaashi(raashiNoCorrespondingToPlanets1[0]);
int count=0;
int[] tempraashi = new int[14];
for(int i=0 ;i<= 12 ;i++){
    if(raashiNo[i]>=1) {
        tempraashi[count]=raashiNo[i];
        count=count+1;
    }
}

int mycount=count;
int mycount2=count;
for(int i=0;i<=mycount-1;i++){
    tempraashi[mycount2]=raashiNo[i];
}

int[] myRashi= new int[13];
for(int i=0 ;i<= 11 ; i++){
    myRashi[i+1]=tempraashi[i]+1;
}
//--------Code To Draw the Planets----------
int[] planetno =  new int[13];
for(int  i=1 ;i<=12;i++){
   planetno[i-1]=raashiNoCorrespondingToPlanets1[i];
}	
  
int[] planetinBhav=  new int[12];
int detect=tempraashi[0]-1;
for(int i=0 ;i<= 11;i++){
   planetno[i]=planetno[i]-detect;
   if(planetno[i]<=0){
      planetno[i]=planetno[i]+12;
   }
   planetinBhav[i]=planetno[i];
}	


RLalKitab WebSmslalkitab = new RLalKitab();
WebSmslalkitab.set(planetinBhav);

 int[] planetinBhavForVarshaphal =  WebSmslalkitab.getAlteredKundli(period,1);
int[] planetinBhav2 =  new int[13];


WebSmslalkitab.setSun(planetinBhavForVarshaphal[0]);
WebSmslalkitab.setMoon(planetinBhavForVarshaphal[1]);
WebSmslalkitab.setMars(planetinBhavForVarshaphal[2]);
WebSmslalkitab.setMercury(planetinBhavForVarshaphal[3]);
WebSmslalkitab.setJupiter(planetinBhavForVarshaphal[4]);
WebSmslalkitab.setVenus(planetinBhavForVarshaphal[5]);
WebSmslalkitab.setSaturn(planetinBhavForVarshaphal[6]);
WebSmslalkitab.setRahu(planetinBhavForVarshaphal[7]);
WebSmslalkitab.setKetu(planetinBhavForVarshaphal[8]);

String[] arrPosition = new String[10];
String[] arrSoya =  new String[9];
String[] arrPlanet = new String[13];

arrPlanet[0]=rBConstants.getString(("Sun").toUpperCase());
arrPlanet[1]=rBConstants.getString(("Moon").toUpperCase());
arrPlanet[2]=rBConstants.getString(("Mars").toUpperCase());							   
arrPlanet[3]=rBConstants.getString(("Mercury").toUpperCase());				  
arrPlanet[4]=rBConstants.getString(("Jupiter").toUpperCase());					   
arrPlanet[5]=rBConstants.getString(("Venus").toUpperCase());
arrPlanet[6]=rBConstants.getString("SATURN");
arrPlanet[7]=rBConstants.getString("RAHU");
arrPlanet[8]=rBConstants.getString("KETU");


    arrPosition[0] = rBLalplanet_varsh.getString(("Dblitted").toUpperCase());
    arrPosition[1] = rBLalplanet_varsh.getString(("NuSign").toUpperCase());
    arrPosition[2] = rBLalplanet_varsh.getString(("NuSign").toUpperCase());
    arrPosition[3] = rBLalplanet_varsh.getString(("FrSign").toUpperCase());
    arrPosition[4] = rBLalplanet_varsh.getString(("NuSign").toUpperCase());
    arrPosition[5] = rBLalplanet_varsh.getString(("Dblitted").toUpperCase());
    arrPosition[6] = rBLalplanet_varsh.getString(("NuSign").toUpperCase());
    arrPosition[7] = rBLalplanet_varsh.getString(("NuSign").toUpperCase());
    arrPosition[8] = rBLalplanet_varsh.getString(("EnSign").toUpperCase());
    
    String[] arrHeading = new String[6];
    arrHeading[0] = rBConstants.getString("PLANETS");
    arrHeading[1] = rBConstants.getString("SIGN");
    arrHeading[2] = rBLalplanet_varsh.getString("POSITION");
    arrHeading[3] = rBLalplanet_varsh.getString("SOYA");
    arrHeading[4] = rBLalplanet_varsh.getString("KISMAT_JAGANEWALA");
    arrHeading[5] = rBLalplanet_varsh.getString("BENEFIC_MALEFIC");
   
    for(int iCount = 0; iCount<=8; iCount++){
        if(WebSmslalkitab.isPlanetSoya(iCount + 1)) {
            arrSoya[iCount] ="Yes";
        } else {
            arrSoya[iCount] ="No";
        }
    }

    String[] arrKismatJagaanewala = new String[9];
    for(int iCount = 0 ;iCount<= 8;iCount++){

      if(WebSmslalkitab.isPlanetKismatJagganewala(iCount)) {
        arrKismatJagaanewala[iCount] = "Yes"; 
      }else {
        arrKismatJagaanewala[iCount] = "No"; 
      }
    }
    int[] arrMalificBenefic =  new int[9];
    for(int iCount = 0 ; iCount<=8 ; iCount++){
      arrMalificBenefic[iCount] =lalKitabUtil.getMaleficBenafic (iCount+1 , planetinBhavForVarshaphal[iCount]);
    }
    String[] SignName = {"Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"};  
    %>    
<table>
    <tr>
        <% for(int ij=0 ;ij<= 5;ij++){ %>
        <td>
                <%=arrHeading[ij]%>
        </td>
        <%} %>
    </tr>
    <% for(int i=0 ;i<= 8 ;i++){%>
    <tr>
        <td class="cellcontent" style="text-align:center;">
            <%=arrPlanet[i]%>
        </td>
        <td class="cellcontent" style="text-align:center;">               
            <%=rBConstants.getString((SignName[planetinBhavForVarshaphal[i]-1]).toUpperCase())%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <%=arrPosition[i]%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <%=rBConstants.getString((arrSoya[i]).toUpperCase())%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <%=rBConstants.getString((arrKismatJagaanewala[i]).toUpperCase())%>
        </td>
        <td class="cellcontent" style="text-align:center;">
            <%=maleficBenefic[arrMalificBenefic[i]]%>
        </td>
    </tr>
    <%}%>
</table>
</div>