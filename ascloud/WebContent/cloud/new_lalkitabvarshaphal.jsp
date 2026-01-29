<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.cslsoftware.printhoroscope.SouthChart"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page import="com.cslsoftware.printhoroscope.Chart"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page import="com.cslsoftware.horo.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBLalKitabvarshaphal = local.loadPropertiesFileNew("lalKitabvarshaphal",languageCode);
MyResourceBundle rBLalkitabVar_charts = local.loadPropertiesFileNew("lalkitabvarshaphalprediction-lalkitabvarshaphal-lalkitabvarshaphalcharts",languageCode);
MyResourceBundle rBLalplanet_varsh = local.loadPropertiesFileNew("lalplanethouse-lalkitabvarshaphal",languageCode);
                                                                     
                                                                   
%>

<script language="JavaScript">  

function Validation(theform,period)
{
    var yy, Fvalue;   
     Fvalue=document.LKVarshphal.ChangeYear.value;
   if (Fvalue == "")
{
  alert("Please enter the correct year");
  document.LKVarshphal.ChangeYear.focus();
  return (false);
}

  var checkOK = "0123456789-!";
  var checkStr = Fvalue;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
	break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    if (ch != ",")
      allNum += ch;
  }
   if (!allValid)
   {
    alert("Please enter only digit characters in the Year field.");
    document.LKVarshphal.ChangeYear.focus();
    return (false);
   }
   if((birthYear>=Fvalue) || ((birthYear+120)<Fvalue)) 
    {
	 alert ("Your age must be in between 1 and 120");
     return false;
    }
    LKVarshphal.submit();
    return true;
}

</script>

<script language="JavaScript">

  function forwordMove(birthYear)
  {  
    var yy, Fvalue ;
    Fvalue=document.LKVarshphal.ChangeYear.value;
    if (Fvalue == "")
    {
        alert("Please enter the correct year");
        document.LKVarshphal.ChangeYear.focus();
        return (false);
    }

  var checkOK = "0123456789-!";
  var checkStr = Fvalue;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
	break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    if (ch != ",")
      allNum += ch;
  }
   if (!allValid)
   {
    alert("Please enter only digit characters in the Year field.");
    document.LKVarshphal.ChangeYear.focus();
    return (false);
   }
   if((birthYear>=Fvalue) || ((birthYear+120)<Fvalue)) 
    {
	 alert ("Your age must be in between 1 and 120");
     return false;
    }
   
    yy=Fvalue;
    yy=parseInt(yy) + 1;
    document.LKVarshphal.ChangeYear.value= yy //CInt(document.LKVarshphal.ChangeYear.value)+1;
   LKVarshphal.submit();
      
 return true; 
  }
  
  function backMove(birthYear)
  {
    var yy, Fvalue;
   
      Fvalue=document.LKVarshphal.ChangeYear.value;
   if (Fvalue == "")
{
  alert("Please enter the correct year");
  document.LKVarshphal.ChangeYear.focus();
  return (false);
}

  var checkOK = "0123456789-!";
  var checkStr = Fvalue;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
	break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    if (ch != ",")
      allNum += ch;
  }
   if (!allValid)
   {
    alert("Please enter only digit characters in the Year field.");
    document.LKVarshphal.ChangeYear.focus();
    return (false);
   }
   if((birthYear>=Fvalue) || ((birthYear+120)<Fvalue)) 
    {
	alert ("Your age must be in between 1 and 120");
     return false;
    }
    yy=Fvalue;
     yy=yy-1;
     document.LKVarshphal.ChangeYear.value=yy;
      LKVarshphal.submit();
       return true;
    }  

</script>
<%	       
SharedFunction sf = new SharedFunction();
String[] maleficBenefic = new String[3];
maleficBenefic[0] = "<font color=red>" + rBConstants.getString("MALEFIC") + "</font>";
maleficBenefic[1] = rBConstants.getString("BENEFIC");
	
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");

LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
UtilLalkitab lalKitabUtil = new UtilLalkitab();
 
//*************Code For Palnetory Degrees & Positions ******
String[] arrHeading = new String[6];
arrHeading[0] = rBConstants.getString("PLANETS");
arrHeading[1] = rBConstants.getString("SIGN");
arrHeading[2] = rBLalplanet_varsh.getString("POSITION");
arrHeading[3] = rBLalplanet_varsh.getString("SOYA");
arrHeading[4] = rBLalplanet_varsh.getString("KISMAT_JAGANEWALA");
arrHeading[5] = rBLalplanet_varsh.getString("BENEFIC_MALEFIC");


int[] mRaashiNoCorrespondingToPlanets = new int[13];
mRaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);

String[] arrSign = new String[10];
String[] arrPlanet = new String[13];
String[] arrPosition = new String[10];

for(int iCount = 0 ; iCount<= 8; iCount++){
    arrSign[iCount] = rBConstants.getString((objLalKitab.getPlanetaryRashiNameForLalkitab(iCount + 1).toUpperCase()));
}
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
   
int chartType=Integer.parseInt(String.valueOf(session.getAttribute("chartType")));
Chart objchart = null;
Chart pChart2 = null;
if(chartType==0){
	
	objchart= new NorthChart() ;
    pChart2 = new NorthChart();
	
}else{
	objchart= new SouthChart();
	pChart2 = new SouthChart();
}

objLalKitab.initializesArrayValuesOfLalKitab();
int[] raashiNoCorrespondingToPlanets =  new int[13];
raashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
 
int[] raashiNoCorrespondingToPlanets1  = new int[13];
for(int iCount = 0 ; iCount<=11; iCount++){
    raashiNoCorrespondingToPlanets1[iCount + 1] = raashiNoCorrespondingToPlanets[iCount];
}
  
raashiNoCorrespondingToPlanets1[0] = 1;
int[] raashiNo = SharedFunction.getRaashi(raashiNoCorrespondingToPlanets1[0]);
//Call GetRaashi1(RaashiNoCorrespondingToPlanets1(0))
 
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

%>
<% //*********** Code for varshaphal ******* 

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
for(int i = 0 ;i<= 11; i++){
   planetinBhav2[i] = planetinBhavForVarshaphal[i];
}

//planetinBhav2(9) = 6
//planetinBhav2(10) = 6
//planetinBhav2(11) = 6
String[] arrSoya =  new String[9];
pChart2.setBhavPositionForPlanets(planetinBhav2);
pChart2.setBhavPositionForRashi(1);

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
<script>

 var birthYear;
 birthYear=<%=year1%>

</script>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LAL_KITAB_VARSHAPHAL")%></h1>	
</div>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">

	
	<form name="LKVarshphal" method="Get" action="lalkitabvarshaphal.asp" onsubmit="return Validation(this,birthYear)" id="form1"> 
	
<div class="row mrt-20"> 
<div class="col s2 l2">   <button class="btn amber darken-4 waves-effect waves-light" onclick="return backMove(birthYear)" type="button" value="&lt;&lt;" name="butYearNavigation1">&lt;&lt;</button>   </div>
<div class="col s8 l8">  <input name="ChangeYear" size="20" value="<%=currYear%>">   </div>
<div class="col s2 l2">  <button class="btn amber darken-4 waves-effect waves-light right" type="button" value="&gt;&gt;" name="butYearNavigation2" onclick="return forwordMove(birthYear)">&gt;&gt;</button> </div>
<div class="col s12 l12">
<div align="center"><button class="btn amber darken-4 waves-effect waves-light" type="submit" name="Submit" value="<%=rBConstants.getString("CHANGE_YEAR")%>"><%=rBConstants.getString("CHANGE_YEAR")%></button></div>
</div>
</div>

   
    
    
	
</form>
</div>
</div>
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1 ui-paragraph-head">
<h2 class="br-amber-b amber lighten-5 head-R"> <% if(currentMonth==0){%>

						<%=rBConstants.getString("VARSHAPHAL") %>
						&nbsp;
						<%=rBLalkitabVar_charts.getString("FROM_ENG") %>
						<%=day1+"/"+month1+"/"+(currYear-1)%>
						<%=rBLalkitabVar_charts.getString("FROM_HINDI") %>
						<%=rBLalkitabVar_charts.getString("TO_ENG") %>
						<%=day1+"/"+month1+"/"+(currYear)%>
						<%=rBLalkitabVar_charts.getString("TO_HINDI") %>
						<%}else{%>

						<%=rBConstants.getString("VARSHAPHAL") %>
						&nbsp;
						<%=rBLalkitabVar_charts.getString("FROM_ENG") %>
						<%=day1+"/"+month1+"/"+(currYear)%>
						<%=rBLalkitabVar_charts.getString("FROM_HINDI") %>
						<%=rBLalkitabVar_charts.getString("TO_ENG") %>
						<%=day1+"/"+month1+"/"+(currYear+1)%>
						<%=rBLalkitabVar_charts.getString("TO_HINDI") %>
						<%} %>  </h2>
						
						<h5 class="padding-all"> <%=rBLalplanet_varsh.getString("LAL_KITAB_CHART") %></h5>
						
						<div id="chartText"></div>
	<div align="center">
		<canvas id="CanvasLKV" width="600px" height="400px" class="responsive-canvas-m"></canvas>
		<script language="JavaScript" type="text/javascript">
//var myval;
languageCode = <%=session.getAttribute("languageCode")%>;
if (languageCode=="")
{
	languageCode =0;
}
var textcolor = COLOR_INFO;

if(<%=session.getAttribute("chartType")%> =="0"){
chartpref = "north";
}
else{
chartpref = "south";
}
if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasLKV");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
String mySyn= "";
for(int i = 0 ;i<= 11 ; i++){
    if(i==11){
    mySyn = mySyn + planetinBhav2[i];
    }else{
    mySyn = mySyn + planetinBhav2[i] + ","; 
    }
}
mySyn = 1+","+mySyn;
out.println("arrPlanetsShodashvarga = new Array(" + mySyn + ")"); //(Asc, sun,moon,....pl)-->


%>
    x1_canvas= 80;//10+40;
    y1_canvas= 20;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, languageCode,false);  
      myval="";

          }  
else {
   $('#CanvasLKV').hide();
   $("#td1").hide();
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>
	</div>
	<script language="JavaScript" type="text/javascript">
    $("#chartText").append(myval);
</script>

</div>
</div>
</div>



<div class="row planet-table">
  <div class="col s12 l12">
     <div class="card table-panel">
     <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBLalKitabvarshaphal.getString("PLANETORY_DEGREE_AND_THEIR_POSITIONS") %> </h4>
        <table class="highlight striped bordered ui-table ui-font responsive-table">
             <thead>
             
            <tr>
			<% for(int ij=0 ;ij<= 5; ij++) {%>
			<th class="cellhead"><%=arrHeading[ij]%></th>
			<%}%>
		</tr>
		</thead>
		<% for(int i=0 ;i<=8 ; i++){ %>
		<tr>
			<td class="cellcontent"><%=arrPlanet[i]%></td>
			<td class="cellcontent"><%=rBConstants.getString((SignName[planetinBhavForVarshaphal[i]-1]).toUpperCase())%>
			</td>
			<td class="cellcontent"><%=arrPosition[i]%></td>
			<td class="cellcontent"><%=rBConstants.getString((arrSoya[i]).toUpperCase())%>
			</td>
			<td class="cellcontent"><%=rBConstants.getString((arrKismatJagaanewala[i]).toUpperCase())%>
			</td>
			<td class="cellcontent"><%=maleficBenefic[arrMalificBenefic[i]]%>
			</td>
		</tr>
		<%}%>
               
               
               
               
               </table>
               </div>
               </div>
               </div>
               
               <div class="row planet-table">
  <div class="col s12 l12">
     <div class="card table-panel">
     <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBLalplanet_varsh.getString("HOUSE_POSITIONS") %> </h4>
        <table class="highlight striped bordered ui-table ui-font responsive-table">
        <%   
    String[] arrHeading2 =  new String[7];
                    int[] arrkhana =  new int[13];
                   
                    
					arrHeading2[0] = rBLalplanet_varsh.getString("KHANANO");
					arrHeading2[1] = rBLalplanet_varsh.getString("MAALIK");
					arrHeading2[2] = rBLalplanet_varsh.getString("PAKKAGHAR");
					arrHeading2[3] = rBLalplanet_varsh.getString("KISMAT");
					arrHeading2[4] = rBLalplanet_varsh.getString("SOYA");
					arrHeading2[5] = rBLalplanet_varsh.getString("EXALLT");
					arrHeading2[6] = rBLalplanet_varsh.getString("DEBLT");
					
				 for(int i=0 ;i<= 11 ; i++){
				   arrkhana[i]=i+1;
				 }
	            String[] arrMaalik ={"Mar","Ven","Mer","Mon","Sun","Mer","Ven","Mar","Jup","Sat","Sat","Jup"};
	            String[] planetName = {"","Sun","Moon","Mars","Mercury","Jupiter","Venus","Saturn","Rahu","Ketu"}; 

                     String[] arrPakkaGhar=  new String[13];
                     String[] arrKismat   =  new String[13];
                   
				     arrPakkaGhar[0] = rBConstants.getString((planetName[1]).toUpperCase());
					 arrPakkaGhar[1] = rBConstants.getString((planetName[5]).toUpperCase());
				     arrPakkaGhar[2] = rBConstants.getString((planetName[3]).toUpperCase());
					 arrPakkaGhar[3] = rBConstants.getString((planetName[2]).toUpperCase());
					 arrPakkaGhar[4] = rBConstants.getString((planetName[5]).toUpperCase());
					 arrPakkaGhar[5] = rBConstants.getString((planetName[4]).toUpperCase()) + " " + rBConstants.getString((planetName[9]).toUpperCase());
					 arrPakkaGhar[6] = rBConstants.getString((planetName[6]).toUpperCase()) + " " + rBConstants.getString((planetName[4]).toUpperCase());
					 arrPakkaGhar[7] = rBConstants.getString((planetName[3]).toUpperCase()) + " " + rBConstants.getString((planetName[7]).toUpperCase());
					 arrPakkaGhar[8] = rBConstants.getString((planetName[5]).toUpperCase());
					 arrPakkaGhar[9] = rBConstants.getString((planetName[7]).toUpperCase());
					 arrPakkaGhar[10] = rBConstants.getString((planetName[7]).toUpperCase());
					 arrPakkaGhar[11] = rBConstants.getString((planetName[5]).toUpperCase()) + " " + rBConstants.getString((planetName[8]).toUpperCase());
					 
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

String[] arrSoya2 = new String[12];
for(int icount = 1 ;icount<= 9 ; icount++){
  
 if(WebSmslalkitab.isPlanetSoya(icount)){ 
    arrSoya2[icount] = "Yes";
  } else  {
    arrSoya2[icount] = "No";
  }
}

String[] arrExalt = new String[13];
arrExalt[0] = rBConstants.getString((planetName[1]).toUpperCase());
arrExalt[1] = rBConstants.getString((planetName[2]).toUpperCase());
arrExalt[2] = rBConstants.getString((planetName [8]).toUpperCase());
arrExalt[3] = rBConstants.getString((planetName[5]).toUpperCase());
arrExalt[4] = " ";
arrExalt[5] = rBConstants.getString((planetName[4]).toUpperCase()) + " " + rBConstants.getString((planetName[8]).toUpperCase());
arrExalt[6] = rBConstants.getString((planetName[7]).toUpperCase());
arrExalt[7] = " ";
arrExalt[8] = rBConstants.getString((planetName[9]).toUpperCase());
arrExalt[9] = rBConstants.getString((planetName[3]).toUpperCase());
arrExalt[10] = " ";
arrExalt[11] = rBConstants.getString((planetName[6]).toUpperCase()) + " " + rBConstants.getString((planetName[9]).toUpperCase());

String[] arrDeblt = new String[13];
arrDeblt[0] = rBConstants.getString((planetName[7]).toUpperCase());
arrDeblt[1] = " ";
arrDeblt[2] = rBConstants.getString((planetName[9]).toUpperCase());
arrDeblt[3] = rBConstants.getString((planetName[3]).toUpperCase());
arrDeblt[4] = " ";
arrDeblt[5] = rBConstants.getString((planetName[6]).toUpperCase()) + " " + rBConstants.getString((planetName[9]).toUpperCase());
arrDeblt[6] = rBConstants.getString((planetName[1]).toUpperCase());
arrDeblt[7] = rBConstants.getString((planetName[2]).toUpperCase());
arrDeblt[8] = rBConstants.getString((planetName[8]).toUpperCase());
arrDeblt[9] = rBConstants.getString((planetName[5]).toUpperCase());
arrDeblt[10] = " ";
arrDeblt[11] = rBConstants.getString((planetName[4]).toUpperCase()) + " " + rBConstants.getString((planetName[8]).toUpperCase());

    %>
    
    
    	<%int y = 0;
    for(y =0; y<= 11; y++){
    if(arrExalt[y].equals(" ")){
     arrExalt[y]="---";
    }
     if(y==0 || y==10 | y==11)  {
      arrSoya2[y]="---";
     }
     if(arrDeblt[y].equals(" ")) {
      arrDeblt[y]="---";
     }
    }
     
    %>
    
     <thead>
             
            
    <tr>
			<% for(int ij=0 ; ij<= 6; ij++){ %>
			<th class="cellhead"><%=arrHeading2[ij]%></th>
			<%}%>
		</tr>
		 </thead>
		<% for(int i=0 ;i<= 11 ;i++){%>
		<tr>
			<td class="cellcontent"><%=arrkhana[i]%></td>
			<td class="cellcontent"><%=rBConstants.getString((arrMaalik[i]).toUpperCase())%>
			</td>
			<td class="cellcontent"><%=arrPakkaGhar[i]%></td>
			<td class="cellcontent"><%=rBConstants.getString((arrKismat[i]).toUpperCase())%>
			</td>
			<td class="cellcontent">
				<%  if(!arrSoya2[i].equals("---")) {
                        out.println(rBConstants.getString((arrSoya2[i]).toUpperCase()));
                }else{
                        out.println(arrSoya2[i]);
                }
                %>
			</td>
			<td class="cellcontent"><%= arrExalt[i]%></td>
			<td class="cellcontent"><%= arrDeblt[i]%></td>
		</tr>
		<%}%>
            
             
             </table>
             </div>
             </div>
             </div>


<%@include file='lalkitab-footer.jsp'%>


