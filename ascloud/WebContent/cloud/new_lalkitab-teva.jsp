<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>

<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");

MyResourceBundle rBLalkitabTeva = local.loadPropertiesFileNew("lalkitabteva",languageCode);
MyResourceBundle rBLalkitabtevaDebts = local.loadPropertiesFileNew("lalkitabteva-lalkitabdebtsteva",languageCode);
%>
<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LK_TEVA") %></h1>	
</div>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1 padding-all hdg-content">

<%
SharedFunction sf = new SharedFunction();
String[] tevastring = local.getStringArray(rBLalkitabTeva.getString("TEVA"));
//-------------------------------------------------------------------------
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);


int[] RaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);
int[] RashiNoCorrespondingToPlanets =  new int[13];
//Dim DharmiTevaResult
for(int i = 1;i<= 12;i++){
    RashiNoCorrespondingToPlanets[i - 1] = Astrology.rasiToBhava(arrPlanetsShodashvarga[0], arrPlanetsShodashvarga[i]);
}
   
String[] tevaResult = new String[4];

for(int i=0 ; i<=RashiNoCorrespondingToPlanets.length-1 ; i++){
  if(objLalKitab.isDharmi(RashiNoCorrespondingToPlanets[i]).equals("No")) {
	  tevaResult[0] = rBLalkitabTeva.getString("DHARMI_TEVA_FALSE");
  }
  else {
	  tevaResult[0] = rBLalkitabTeva.getString("DHARMI_TEVA_TRUE");
  }
}
 
if(objLalKitab.isRataandhTeva().equals("NO")) {
  tevaResult[1] = rBLalkitabTeva.getString("RATAANDHA_TEVA_FALSE");
}else{
  tevaResult[1] = rBLalkitabTeva.getString("RATAANDHA_TEVA_TRUE");
}

String andhaaTeva= "NO";
try
{
	andhaaTeva = objLalKitab.isAndhaaTeva();
}
catch(Exception e)
{
	
}
if(andhaaTeva.equals("NO")) {
  tevaResult[2] = rBLalkitabTeva.getString("ANDHA_TEVA_FALSE");
}else{
  tevaResult[2] = rBLalkitabTeva.getString("ANDHA_TEVA_TRUE");
}
//out.println(objLalKitab.getTimeZone()+","+objLalKitab.getMinuteOfBirth()+","+objLalKitab.getHourOfBirth());
//out.println(objLalKitab.getDayOfBirth()+","+objLalKitab.getMonthOfBirth()+","+objLalKitab.getYearOfBirth());
//out.println(objLalKitab.getDegreeOfLongitude()+","+objLalKitab.getMinuteOfLongitude()+","+objLalKitab.getDegreeOfLattitude());
//out.println(objLalKitab.getMinuteOfLattitude()+","+objLalKitab.getDST());
if(objLalKitab.isNabaligTeva().equals("NO")) {
  tevaResult[3] = rBLalkitabTeva.getString("NABALIG_TEVA_FALSE");
}else{
  tevaResult[3] = rBLalkitabTeva.getString("NABALIG_TEVA_TRUE");
}


//dim TevaIntro
String[] tevaIntro = {"LK_DHARMI_TEVA","LK_NIGHT_BLIND_HOROSCOPE","LK_BLIND_HOROSCOPE","LK_MINOR_HOROSCOPE"};
 for(int i=0 ; i<=3 ; i++){ %>
<div class="cellheaddiv">
	<h2> <% out.println((tevastring[i]));%> </h2>
</div>
<div class="cellTextdiv">
	<p>
		<b><%=rBLalkitabtevaDebts.getString("LK_CAUSE")%>: </b><%=rBLalkitabTeva.getString(tevaIntro[i])%>
		<br /> <b><%=rBLalkitabtevaDebts.getString("LK_RESULT") %>: </b><%=tevaResult[i] %></p>
</div>

<%}

%>
</div>
</div>
</div>
<div style="padding-top: 10px;"></div>