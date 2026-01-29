<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.text.MessageFormat"%>
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>


<script type="text/javascript" src="js/draw-chart.js"></script>
<script type="text/javascript" src="js/canvas.js"></script>
<script type="text/javascript" src="js/constents.js"></script>
<%
Local local = new Local();
Hindi hindi =  new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rbKalsarpaYoga = local.loadPropertiesFileNew("kalsarpayoga",languageCode);
MyResourceBundle rbManglikKalsarpaYoga = local.loadPropertiesFileNew("manglikdetails-kalsarpayoga",languageCode);
MyResourceBundle astrology = local.loadPropertiesFileNew("astrology",languageCode);
%>

<div class="hdg-lg card">
	<h1><%=rbConstants.getString("KALSHARP_DOSH")%></h1>	
</div>





<%
DesktopHoro myAstrologyObject= (DesktopHoro) session.getAttribute("HoroscopeObj");
DesktopHoro ObjHoroChalit= (DesktopHoro) session.getAttribute("HoroscopeObj");
UtilDesktop objUtil =  new UtilDesktop();
//*************Get Planet Position in array named arrPlanetsShodashvarga
int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);

//*************Get Rahu Bhav Position and Ketu Bhav Position
int RahuinBhav = Astrology.GetPlanetInBhava(arrPlanetsShodashvarga[0],arrPlanetsShodashvarga[8]);
int KetuinBhav = Astrology.GetPlanetInBhava(arrPlanetsShodashvarga[0],arrPlanetsShodashvarga[9]);

//*************Get Planet Degree(not Minutes, Second) in array named myPlanetDMS
//Dim myPlanetDMS(12),arrPlanetDMS(12),arrPlanetPos(12)

%>



<%
//Set objchart=Nothing
//objchart
//Dim kalsarpaintroduction,Dosh
/*int chartType = session.getAttribute("chartType");

if(chartType== 0) {
   Set objchart=Server.Createobject("Horodesktop.NorthChart")
}else{
   Set objchart=Server.Createobject("Horodesktop.SouthChart")
}
*/
int planetChart = 0;
Object ctObj = session.getAttribute("chartType");
if(ctObj != null)
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

double[] myPlanetDMS = new double[12];
for(int j=1;j<=10;j++){	
	myPlanetDMS[j] = myAstrologyObject.getKPPlanetLongitude(j);
}
String kalsarpaintroduction = rbKalsarpaYoga.getString("INTRODUCTION_KALSARP_YOG");
String Dosh = Astrology.getTypesofKalsarpaYoga(String.valueOf(RahuinBhav),String.valueOf(KetuinBhav),astrology, false);
int[] arrPlanetPos =  new int[13];
for(int i=1 ;i<=12;i++){
   arrPlanetPos[i-1] = arrPlanetsShodashvarga[i];
}   
  
int Temphold = arrPlanetsShodashvarga[0]-1;
for(int i =0 ;i<= 11; i++){
   arrPlanetPos[i] = arrPlanetPos[i] - Temphold;
   if(arrPlanetPos[i] <=0){
      arrPlanetPos[i] = arrPlanetPos[i]+12;
    }
}
%>
<%//******************************Neha (Canvas Chart)*************************** %>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R"><%=rbConstants.getString("LAGNA") +" "+ rbConstants.getString("KUNDLI") %></h2>
<div id="chartText"></div>
<div class="center"> 
<canvas id="CanvasKalsarpa" width="600px" height="400px"
		class="responsive-canvas-m"></canvas>
	<script language="JavaScript" type="text/javascript">
//var myval;
LanguageCode = <%=session.getAttribute("languageCode")%>;
if (LanguageCode=="")
{
LanguageCode =0;
}
var textcolor = COLOR_INFO;

if(<%=session.getAttribute("chartType")%> =="0"){
chartpref = "north";
}
else{
chartpref = "south";
}
if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasKalsarpa");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
String mySyn= "";
for(int i = 1;i<= 12;i++){
    if(i==12){
    mySyn = mySyn + arrPlanetsShodashvarga[i];
    }else{
    mySyn = mySyn + arrPlanetsShodashvarga[i] + ","; 
    }

}
mySyn = arrPlanetsShodashvarga[0]+","+mySyn;
out.println("arrPlanetsShodashvarga = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl)


%>
    x1_canvas= 80;//10+40;
    y1_canvas= 20;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, LanguageCode,false);  
      myval="";

          }  
else {
   $('#CanvasKalsarpa').hide();$('#h31').hide();
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

<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<h2> <%=rbKalsarpaYoga.getString("KALSHARP_DOSH_YOG_REMEDY") %></h2> <br>
<img align="left" style="margin-right:10px;" src="images/report_icon/icon-karlsarp-yog.png" />
<%if(isKalsarpDosh(myPlanetDMS)) {%>
							<h2>
							<%out.println(MessageFormat.format(rbKalsarpaYoga.getString("KALSARPA_PRESENT"),Dosh));%>
								<%//out.println(rbKalsarpaYoga.getString("YOURENG")+" "+rbKalsarpaYoga.getString("KUNDLIENG")+" "+rbKalsarpaYoga.getString("HAS")+rbKalsarpaYoga.getString("KALSARPHIN")+Dosh+rbKalsarpaYoga.getString("PRESENTHIN")+rbManglikKalsarpaYoga.getString("ISHIN"));%>
							</h2>
							<%}else{ %>
							<h2>
							<%out.println(rbKalsarpaYoga.getString("KALSARPA_ABSENT"));%>
								<%//out.println(rbKalsarpaYoga.getString("KALSARP")+rbKalsarpaYoga.getString("YOG")+rbManglikKalsarpaYoga.getString("ISENG")+rbManglikKalsarpaYoga.getString("NOTENG")+rbKalsarpaYoga.getString("PRESENT")+rbManglikKalsarpaYoga.getString("NOTHIN")+rbManglikKalsarpaYoga.getString("ISHIN"));%>
							</h2>
							<%} %>
							
							<p>
						<%=kalsarpaintroduction%>
					</p>
					
				
					
					<p> <%
                if(isKalsarpDosh(myPlanetDMS)) {
                       out.println("<p><b>" +  rbKalsarpaYoga.getString("KAL_RESULT") +": " + "</b>" + rbKalsarpaYoga.getString("AFFLICTED_WITH_KALSHARP_DOSH") +"<b>"+ Dosh +"</b></p>");
                }else{
                	 out.println("<p><b>" +  rbKalsarpaYoga.getString("KAL_RESULT") +": " + "</b>" + rbKalsarpaYoga.getString("FREE_FROM_KALSHARP_DOSH") +"</p>");
                }
                %> </p>
                
               <%
    if(isKalsarpDosh(myPlanetDMS)) {
    %>
   
		
					<h2> 	<%
                out.println(rbKalsarpaYoga.getString("WHAT_IS") + Dosh + " ?");
                %> </h2>
					

			
					<p>
						<%               
                 String[] KalsarpaYogaIntroduction = Astrology.getKalsarpaYogaIntroduction(Astrology.getTypesofKalsarpaYoga(String.valueOf(RahuinBhav),String.valueOf(KetuinBhav),null, true),rbKalsarpaYoga).split("#");//Split(Cstr(GetKalsarpaYogaIntroduction(getTypesofKalsarpaYoga(RahuinBhav,KetuinBhav))),"#")
                 out.println(KalsarpaYogaIntroduction[0]);
                
                %>
					</p>    
					
					<%  if(KalsarpaYogaIntroduction.length == 2)
	                 {
	                 	out.println("<ul>" + KalsarpaYogaIntroduction[1] + "</ul>");
	                 } %>
			
			
			<%
    }
    %> 
</div>
</div>
</div>



	
	<%//******************************End of (Canvas Chart)*************************** %>


	<%!

public boolean isKalsarpDosh(double[] myPlanetDMS){

	for(int i=1;i<=10;i++){
 		//myPlanetDMS[i] = myAstrologyObject.getKPPlanetLongitude(i)
		if(myPlanetDMS[i]<0){
			myPlanetDMS[i] = myPlanetDMS[i]+360.0;
		}
	}

//*************Get init values for Rahu and Ketu
      
double planetRahu = myPlanetDMS[8];
double planetKetu = myPlanetDMS[9];

//*************kalsarpya is used as flag variable.

boolean kalsarpyoga = true;
if(planetRahu - planetKetu < 0){ 
	planetRahu = planetRahu + 360.0;
}

for(int n=1;n<=7;n++){
	if(myPlanetDMS[n]-planetKetu < 0){ 
   		myPlanetDMS[n] =  myPlanetDMS[n] + 360;
	}
 	if (!((int)myPlanetDMS[n] > (int)planetKetu && (int)myPlanetDMS[n] < (int)planetRahu)) {
 		kalsarpyoga = false;
 		break;
 	}
}
return(kalsarpyoga);
}
%>