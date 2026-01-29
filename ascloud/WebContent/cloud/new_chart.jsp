<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.printhoroscope.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%
Local local = new Local();

int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBChart = local.loadPropertiesFileNew("chart",languageCode);
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

<div class="hdg-lg card">
	<h1><%=rBChart.getString("LAGNA_CHANDRA_CHART")%></h1>	
</div>


<%

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");

	
int[] RaashiNoCorrespondingToPlanets1 =  new int[14];
String[] tempraashi =  new  String[13];
String[] myrashi =  new  String[13];
int[] planetno =  new int[12];
String detect ;

%>

<%
//-----------------##Code Of Lagna Chart##------------------
//-----------Code For Draw raashi---------
//Use array RaashiNo For Raashi & RaashiNoCorrespondingToPlanets1
//For Planet number.
int[] arrPlanetsShodashvarga =  new int[13];
arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);

for(int k = 0; k <=12; k++)
	{
	RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];

	}

for(int i=0; i<=11 ; i++){ 
	planetno[i] = GetPlanetInBhava(RaashiNoCorrespondingToPlanets1[0], RaashiNoCorrespondingToPlanets1[i+1]);
} 
%>

<div class="row mrt-30">
<div class="col s12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=rBConstants.getString("LAGNA_CHART")%>   </h2>
<div align="center">
	<canvas id="Canvas1" width="520px" height="400px"  class="respnv-cnv-mw"></canvas>
	<script language="JavaScript" type="text/javascript">
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
    var c=document.getElementById("Canvas1");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
String mySyn = "";
for(int i = 0 ;i<= 11;i++){
    mySyn = mySyn + RaashiNoCorrespondingToPlanets1[i] + ","; 
}

mySyn = mySyn + RaashiNoCorrespondingToPlanets1[12]; 
out.println("arrPlanetsShodashvarga = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl)


%>
    x1_canvas= 60;//10+40;
    y1_canvas= 20;
    x2_canvas= 455;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, languageCode,false);  
      myval="";

          }  
else {
   $('#Canvas1').hide();
   // myval = '<center><div align=center style=padding-top:5px;>Please upgrade browser</div></center>';
}
</script>
</div>


<%

//objChart.setBhavPositionForPlanets(planetno);
//objChart.setBhavPositionForRashi (RaashiNoCorrespondingToPlanets1[0]);
//out.println(objChart.printChart());

//-----------------##Code For Chandra Chart##-----------
 arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);
    for(int k = 0 ; k<=12 ;k++){
      RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
    }

for(int i=0 ; i<=11 ; i++){ 
planetno[i] = GetPlanetInBhava(RaashiNoCorrespondingToPlanets1[2], RaashiNoCorrespondingToPlanets1[i+1]);
}
    %>
</div>
</div>

<div class="col s12 mrt-10">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=rBChart.getString("CHANDRA_CHART")%> </h2>
<div id="chartText"></div>




<div align="center">
	<canvas id="Canvas2" width="520px" height="400px" class="respnv-cnv-mw"></canvas>
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
    var c=document.getElementById("Canvas2");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
String mySyn3= "";
for(int i = 1 ; i<=12;i++){
if(i==12) {
    mySyn3 = mySyn3 + RaashiNoCorrespondingToPlanets1[i]; 
}else{
    mySyn3 = mySyn3 + RaashiNoCorrespondingToPlanets1[i] + ",";
}

}
mySyn3 = RaashiNoCorrespondingToPlanets1[2]+","+mySyn3; 
out.println("arrPlanetsShodashvarga = new Array(" + mySyn3 + ");"); //(Asc, sun,moon,....pl)


%>
    x1_canvas= 60;//10+40;
    y1_canvas= 20;
    x2_canvas= 455;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, languageCode,false);  
      myval="";

          }  
else {
   $('#Canvas2').hide();
   $('#Cdiv1').hide();
   $('#Cdiv2').hide();
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>
	<script language="JavaScript" type="text/javascript">
    $("#chartText").append(myval);
</script>
</div>
</div>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>

<div style="padding-bottom: 20px;">
	<%@include file='calculations-footer.jsp'%>
</div>

<%!
    
 // Function For getPlanetInBhav
    public int GetPlanetInBhava(int AscendentPosition ,int  planetPosition) {
        int tempBhava; 
        tempBhava = planetPosition - AscendentPosition + 1 ;
        if( tempBhava <= 0)
        	{
        	tempBhava = tempBhava + 12;
        	}
       return tempBhava;
    }
  
    %>