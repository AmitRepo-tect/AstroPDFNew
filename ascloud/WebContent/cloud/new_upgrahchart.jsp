
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.cslsoftware.util.SUtil"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%@include file='planets-detailed-informations.jsp'%>
<%
Local planetLocal = new Local();
int planetLangCode = Util.safeInt(session.getAttribute("languageCode"));
MyProperties planetConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle planetPositionConstants = planetLocal.loadPropertiesFileNew("planetposition",planetLangCode);
MyResourceBundle rBYoginiDasha = planetLocal.loadPropertiesFileNew("yoginidasha",planetLangCode);
DesktopHoro planetHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
planetHoro.setLanguageCode("0");
planetHoro.initialize();
%>

<div class="hdg-lg card">
	<h1> <%=planetPositionConstants.getString("UPGRAH_CHART")%></h1>	
</div>


<div class="mrt-30">
		<div align="center" class="card-panel">		
			<canvas id="CanvasUpGrah" width="400px" height="350px" class="responsive-canvas-m"></canvas>
			</div>
</div>
<div id ="chart">
</div>
<%

double[] grahDegree = planetHoro.getUpgraha();
double[] upgrahDegree = planetHoro.getUpgrahasMaandiAadi();
Astrology astro =  new Astrology();
//**********Find out 1st five grah position respective to rashi
int[] rashiPosition = new int[11];
double[] bhavaPositions = new double[11];
String[] rashiArr = new String[11];
String[] degreeArr = new String[11];

String[] nakshatra = new String[11];
int[] nakshatraPada = new int[11];
double longitudeDifference;
for(int j = 0 ; j<5;j++){
   longitudeDifference = grahDegree[j];
   if(longitudeDifference >= 360.0)
   {  
	   longitudeDifference = longitudeDifference - 360.0 ;
   }
   bhavaPositions[j] = longitudeDifference;
  
  rashiPosition[j] = (int)(longitudeDifference / 30) + 1;
  String[] rashiAndDegreeArr = planetHoro.getRasiAndItsDegree(bhavaPositions[j]);
  rashiArr[j] = SharedFunction.ProperCaseL(Util.getValuesFromDictionary(rashiAndDegreeArr[0],planetLangCode),planetLangCode);
  degreeArr[j]= rashiAndDegreeArr[1];
  nakshatra[j] = SharedFunction.ProperCase(Util.getValuesFromDictionary(astro.getNakshtraName(planetHoro.getNakshatra(bhavaPositions[j])+1),planetLangCode));
  nakshatraPada[j]= astro.getPadaOfGrahUpGrah(bhavaPositions[j]);
  
}

//**********Find out 1st six upgrah position respective to rashi
    for(int j = 5 ; j<11;j++){
	   longitudeDifference = upgrahDegree[j-5];
	   //System.out.println(longitudeDifference+"<br/>");
	   if(longitudeDifference >= 360.0)
	   {  
		   longitudeDifference = longitudeDifference - 360.0 ;
	   }
	   bhavaPositions[j] = longitudeDifference;
	  
	   rashiPosition[j] = (int)(longitudeDifference / 30) + 1;
	   String[] rashiAndDegreeArr = planetHoro.getRasiAndItsDegree(bhavaPositions[j]);
	   rashiArr[j] = SharedFunction.ProperCaseL(Util.getValuesFromDictionary(rashiAndDegreeArr[0],planetLangCode),planetLangCode);
	   degreeArr[j]= rashiAndDegreeArr[1];
	   nakshatra[j] = SharedFunction.ProperCase(Util.getValuesFromDictionary(astro.getNakshtraName(planetHoro.getNakshatra(bhavaPositions[j])+1),planetLangCode));
	   nakshatraPada[j]= astro.getPadaOfGrahUpGrah(bhavaPositions[j]);
	}
    
   for(int i = 0 ;i<rashiPosition.length;i++){
	   //out.println(rashiPosition[i]+","+rashiArr[i]+","+degreeArr[i]+","+nakshatra[i]+","+nakshatraPada[i]+"<br/>");
   }
   
   
 //************************************'Decalare The Variables **************************************
   int planetChart = 0;
   Object ctObj = session.getAttribute("chartType");
   if(ctObj != null && !ctObj.equals(""))
   {
   planetChart = Integer.parseInt(ctObj.toString());
   }
   String chartpref = "north";
   if(planetChart == 1)
   {
   	chartpref = "south";
   }
   else if(planetChart == 2)
   {
   	chartpref = "east";
   }
   int[] arrPlanetsShodashvarga = planetHoro.getPositionForShodasvarg(0); 
   int rashiLn = arrPlanetsShodashvarga[0];
%>

<script language="JavaScript" type="text/javascript">
//var myval;
var LanguageCode = <%=planetLangCode%>;

var textcolor = COLOR_INFO;
var chartpref = '<%=chartpref%>';

if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasUpGrah");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=planetChart %>'; 
<%
String bhavPosition = "";
String valueInArr = "";
String[] value = new String[] {planetPositionConstants.getString("DH"),planetPositionConstants.getString("VP"),planetPositionConstants.getString("PV"),planetPositionConstants.getString("IC"),planetPositionConstants.getString("UK"),planetPositionConstants.getString("KL"),planetPositionConstants.getString("MR"),planetPositionConstants.getString("AP"),planetPositionConstants.getString("YG"),planetPositionConstants.getString("MD"),planetPositionConstants.getString("GK")};
String[] planet = new String[] {planetConstants.getString("SU"),planetConstants.getString("MO"),planetConstants.getString("MA"),planetConstants.getString("ME"),planetConstants.getString("JU"),planetConstants.getString("VE"),planetConstants.getString("SA"),planetConstants.getString("RA"),planetConstants.getString("KE")};
//Adding first planet number rashi numer and then grah and upgrah rashi number 9+12=21
for(int i = 1;i<=9;i++) {
	bhavPosition = bhavPosition + arrPlanetsShodashvarga[i] + "," ;
}

for(int i = 0;i<=9;i++) {
	bhavPosition = bhavPosition + rashiPosition[i] + "," ;
}
//Adding first planet from sun to ketu name and then Arudha langa total 9+12=21
for(int i = 0;i<=8;i++) {
	if(planetLangCode==0){planet[i] = SharedFunction.ProperCase(planet[i].trim()); }
	valueInArr = valueInArr+ "'"+planet[i].trim()+"'" + "," ;
}

for(int i = 0;i<=9;i++) {
	valueInArr = valueInArr+ "'"+value[i]+"'" + "," ;
}

bhavPosition = bhavPosition + rashiPosition[10]; 
valueInArr = valueInArr+  "'"+value[10]+"'" ;

out.println("arrPosition= new Array("+ bhavPosition + ");");
out.println("arrValue = new Array(" + valueInArr + ");");
out.println("lagnaRashi= " + rashiLn + ";");

%>

if(arrPosition.length==arrValue.length){
 
    x1_canvas= 10;//10+40;    
    y1_canvas= 30;
    x2_canvas= 400-5;//320+75;
    y2_canvas= 300+20;//300-20;
    SetFontSize(14);   

   
    if(parseInt(LanguageCode) == 1){
        PrintText((x1_canvas*2)-(5*2),6,"उपग्रह कुंडली");     
      }
      else if(parseInt(LanguageCode) == 2){
        PrintText((x1_canvas*2)-(5*1),6,"உப்கிரக கட்டம்");
       
      }
      else if(parseInt(LanguageCode) == 4){
        PrintText((x1_canvas*2)-(5*2),6, "ಉಪಗ್ರಹ ಕುಂಡಲಿ (ಜಾತಕ)");
      }
      else if(parseInt(LanguageCode) == 5){
       PrintText((x1_canvas*2)-(5*2),6, "ఉపగ్రహ చార్టు"); 
      
      }
      else if(parseInt(LanguageCode) == 6){
      PrintText((x1_canvas*2)-(5*2),6, "উপগ্রহ কুন্ডলি ");     
      }
      else if(parseInt(LanguageCode) == 7){
       PrintText((x1_canvas*2)-(5*2),6, "ઉપગ્રહ ચાર્ટ"); 
      }
      else if(parseInt(LanguageCode) == 8){
      
     
       PrintText((x1_canvas*2)-(5*2),6, "ഉപഗ്രഹ ജാതകം"); 
      }
      else if(parseInt(LanguageCode) == 9){
       PrintText((x1_canvas*2)-(5*2),6, "उपग्रह कुंडली"); 
      }
      else{
        PrintText((x1_canvas*3)-(5*5),6, "Upgraha Chart");
       
        }
    
     PrintChartPada(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPosition,arrValue, Chart_Type, LanguageCode,false,lagnaRashi);  
     myval="";

          } 
else{
	$('#CanvasUpGrah').hide();
	 myval = '<div align=center style=padding-top:5px;><span>SomeThing went Wrong </span></div>';
}
}
else {

   $('#CanvasUpGrah').hide();
    myval = '<div align=center style=padding-top:5px;><img width="590" height="350" src="lagna-navamsa-chart.asp?Chart_type=LagnaNavmasa&LanguageCode=<%=planetLangCode %>&textcolor=0&planetstyle=0&border=1&colorcode=f96d06&chartpref=<%=chartpref %>" onload=resizeimg(this,"0"); /></div>';
}

</script>

<script language="JavaScript" type="text/javascript">
$("#chart").append(myval);
</script>
<%//*********Table of grah and upgrah *************************************%>
<div class="row mrt-30">

<div class="col s12 l8"> 
<div class="card-panel no-padding no-margin table-panel rt-custom">
 <table class="highlight striped bordered ui-table responsive-table" id="ui-table">
          
            	<%
                String[] PlanetaryHeading = new String[]{"PLANETS","RASHI", "LONGITUDE", "NAKSHATRA", "PADA"};
                String[] ShortPlanetName = new String[]{"DHUMA","VYATIPAATA","PARIVESHA","INDRACHAAPA","UPAKETU","KAALA","MRITYU","ARTHAPRAHAARA","YAMAGHANTAKA","MAANDI","GULIKA"};
            %>

            <thead>
				<tr class="amber lighten-5">
					<% for(int planetheading = 0;planetheading<= 4;planetheading++)
                	{
                %>
					<th><%=SharedFunction.ProperCaseL(planetConstants.getString(PlanetaryHeading[planetheading]),planetLangCode) %>
					</th>
					<% } %>
				</tr>
				</thead>
				<%
              for(int grahvalues = 0;grahvalues<= 10;grahvalues++)
            	{
               %>
				<tr class="table-include">
                <td><%=planetPositionConstants.getString(ShortPlanetName[grahvalues])%></td>
             	<td><%=rashiArr[grahvalues]%></td>
			    <td><%=degreeArr[grahvalues]%></td>
				<td><%=nakshatra[grahvalues]%></td>
				<td><%=nakshatraPada[grahvalues]%></td>
				</tr>
				<%} 
            	%>                     
                              
        </table>
       </div>
      </div>
	<div class="col s12 l4"> 
<div class="card table-panel rt-custom">
			<table
				class="highlight striped bordered ui-table" id="ui-table">
<thead>
<tr class="amber lighten-5">
 <th><%=planetConstants.getString("SHORT_NAME") %></th>
 <th><%=planetConstants.getString("FULL_NAME") %></th>
 </tr>
</thead>
				<tr>
					<td><%=planetPositionConstants.getString("DH")%></td>
					<td><%=planetPositionConstants.getString("DHUMA")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("VP")%></td>
					<td><%=planetPositionConstants.getString("VYATIPAATA")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("PV")%></td>
					<td><%=planetPositionConstants.getString("PARIVESHA")%></td>

				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("IC")%></td>
					<td><%=planetPositionConstants.getString("INDRACHAAPA")%></td>

				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("UK")%></td>
					<td><%=planetPositionConstants.getString("UPAKETU")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("KL")%></td>

					<td><%=planetPositionConstants.getString("KAALA")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("MR")%></td>
					<td><%=planetPositionConstants.getString("MRITYU")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("AP")%></td>
					<td><%=planetPositionConstants.getString("ARTHAPRAHAARA")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("YG")%></td>
					<td><%=planetPositionConstants.getString("YAMAGHANTAKA")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("MD")%></td>
					<td><%=planetPositionConstants.getString("MAANDI")%></td>
				</tr>
				<tr>
					<td><%=planetPositionConstants.getString("GK")%></td>
					<td><%=planetPositionConstants.getString("GULIKA")%></td>

				</tr>
	       </table>

		 </div>
		</div>
	  </div>
       
       
