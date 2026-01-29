
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<script type="text/javascript" src="js/draw-chart.js"></script>
<script type="text/javascript" src="js/canvas.js"></script>
<script type="text/javascript" src="js/constents.js"></script>

<%

int languageCodeKY = (Integer)session.getAttribute("languageCode");
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rbKalsarpaYoga = new Local().loadPropertiesFileNew("kalsarpayoga",languageCodeKY);
MyResourceBundle rbManglikKalsarpaYoga = new Local().loadPropertiesFileNew("manglikdetails-kalsarpayoga",languageCodeKY);
MyResourceBundle astrology = new Local().loadPropertiesFileNew("astrology",languageCodeKY);
%>
<div align="center" class="heading-sec">
    <h2>
        <%=rbConstants.getString("KALSHARP_DOSH")%>
    </h2>
</div>


<%
DesktopHoro myAstrologyObjectKY= (DesktopHoro) session.getAttribute("HoroscopeObj");
DesktopHoro ObjHoroChalitKY= (DesktopHoro) session.getAttribute("HoroscopeObj");
UtilDesktop objUtil =  new UtilDesktop();
//*************Get Planet Position in array named arrPlanetsShodashvarga
int[] arrPlanetsShodashvargaKY = myAstrologyObjectKY.getPositionForShodasvarg(0);

//*************Get Rahu Bhav Position and Ketu Bhav Position
int RahuinBhav = Astrology.GetPlanetInBhava(arrPlanetsShodashvargaKY[0],arrPlanetsShodashvargaKY[8]);
int KetuinBhav = Astrology.GetPlanetInBhava(arrPlanetsShodashvargaKY[0],arrPlanetsShodashvargaKY[9]);

//*************Get Planet Degree(not Minutes, Second) in array named myPlanetDMS
//Dim myPlanetDMS(12),arrPlanetDMS(12),arrPlanetPos(12)

%>
<div class="inner-sec">
            <h3>
                <%=rbConstants.getString("LAGNA") +" "+ rbConstants.getString("KUNDLI") %></h3>

<%

int planetChartKY = 0;
Object ctObjKY = session.getAttribute("chartType");
if(ctObjKY != null)
{
 planetChartKY = Integer.parseInt(ctObjKY.toString());
}
String chartprefKY = "north";
if(planetChartKY == 1)
{
	chartprefKY = "south";
}
else if(planetChartKY == 2)
{
	chartprefKY = "east";
}

double[] myPlanetDMS = new double[12];
for(int j=1;j<=10;j++){	
	myPlanetDMS[j] = myAstrologyObjectKY.getKPPlanetLongitude(j);
}
String kalsarpaintroduction = rbKalsarpaYoga.getString("INTRODUCTION_KALSARP_YOG");
String Dosh = Astrology.getTypesofKalsarpaYoga(String.valueOf(RahuinBhav),String.valueOf(KetuinBhav),astrology, false);
int[] arrPlanetPos =  new int[13];
for(int i=1 ;i<=12;i++){
   arrPlanetPos[i-1] = arrPlanetsShodashvargaKY[i];
}   
  
int Temphold = arrPlanetsShodashvargaKY[0]-1;
for(int i =0 ;i<= 11; i++){
   arrPlanetPos[i] = arrPlanetPos[i] - Temphold;
   if(arrPlanetPos[i] <=0){
      arrPlanetPos[i] = arrPlanetPos[i]+12;
    }
}
%>
<%//******************************Neha (Canvas Chart)*************************** %>
<div id="chartText"></div>
<div align="center">
	<canvas id="CanvasKalsarpa" width="600px" height="400px"
		class="ui-canvas"></canvas>
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
String mySyn1= "";
for(int i = 1;i<= 12;i++){
    if(i==12){
    mySyn1 = mySyn1 + arrPlanetsShodashvargaKY[i];
    }else{
    mySyn1 = mySyn1 + arrPlanetsShodashvargaKY[i] + ","; 
    }

}
mySyn1 = arrPlanetsShodashvargaKY[0]+","+mySyn1;
out.println("arrPlanetsShodashvarga = new Array(" + mySyn1 + ");"); //(Asc, sun,moon,....pl)


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
	<%//******************************End of (Canvas Chart)*************************** %>

            <h3 id="h31">
                <%=rbKalsarpaYoga.getString("KALSHARP_DOSH_YOG_REMEDY") %>
            </h3>
               
       
            <%if(isKalsarpDosh(myPlanetDMS)) {%>
                   <h2><%out.println(rbKalsarpaYoga.getString("YOURENG")+" "+rbKalsarpaYoga.getString("KUNDLIENG")+" "+rbKalsarpaYoga.getString("HAS")+rbKalsarpaYoga.getString("KALSARPHIN")+Dosh+rbKalsarpaYoga.getString("PRESENTHIN")+rbManglikKalsarpaYoga.getString("ISHIN"));%></h2>
            <%}else{ %>
                    <h2><%out.println(rbKalsarpaYoga.getString("KALSARP")+rbKalsarpaYoga.getString("YOG")+rbManglikKalsarpaYoga.getString("ISENG")+rbManglikKalsarpaYoga.getString("NOTENG")+rbKalsarpaYoga.getString("PRESENT")+rbManglikKalsarpaYoga.getString("NOTHIN")+rbManglikKalsarpaYoga.getString("ISHIN"));%></h2>                    
            <% } %>              
     
   
            <p>
                <%=kalsarpaintroduction%>
            </p>
       
                <%
                if(isKalsarpDosh(myPlanetDMS)) {
                    out.println("<p><b>" +  rbKalsarpaYoga.getString("KAL_RESULT") +": " + "</b>" + rbKalsarpaYoga.getString("AFFLICTED_WITH_KALSHARP_DOSH") +"<b>"+ Dosh +"</b></p>");
             }else{
             	 out.println("<p><b>" +  rbKalsarpaYoga.getString("KAL_RESULT") +": " + "</b>" + rbKalsarpaYoga.getString("FREE_FROM_KALSHARP_DOSH") +"</p>");
             }
                %>
       
    <%
    if(isKalsarpDosh(myPlanetDMS)) {
    %>   
  
        <h3>
                <%
                out.println(rbKalsarpaYoga.getString("WHAT_IS") + Dosh + " ?");
                %>
         </h3>       
       
            <p>
                <%               
                String[] KalsarpaYogaIntroduction = Astrology.getKalsarpaYogaIntroduction(Astrology.getTypesofKalsarpaYoga(String.valueOf(RahuinBhav),String.valueOf(KetuinBhav),null, true),rbKalsarpaYoga).split("#");//Split(Cstr(GetKalsarpaYogaIntroduction(getTypesofKalsarpaYoga(RahuinBhav,KetuinBhav))),"#")
                out.println(KalsarpaYogaIntroduction[0]);
                out.println("<ul style='text-align:left;line-height:2;' >" + KalsarpaYogaIntroduction[1] + "</ul>");
                %>
            </p>
       
    <%
    }
    %>


</div>
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