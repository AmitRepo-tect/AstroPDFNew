<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<% 
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBConstants = local.loadPropertiesFileNew("constants", languageCode);
MyResourceBundle rBPrastharashtakvarga = local.loadPropertiesFileNew("prastharashtakvarga", languageCode); 
MyResourceBundle rBAshtaktable = local.loadPropertiesFileNew("ashtaktable",languageCode);
%>

<%

String[] planetName = {"SUN","MOON","MARS","MERCURY","JUPITER","VENUS","SATURN"}; 
String[] kun1 = {"FATHER","GOVERNMENT","HEALTH"}; 
String[] kun2 = {"MOTHER","MIND","EYE"};
String[] kun3 = {"SIBLINGS","COURAGE","PROPERTY"};
String[] kun4 = {"BUSINESS","INTELLIGENCE","EDUCATION"};
String[] kun5 = {"CHILDREN","KNOWLEDGE","MONEY","RELIGION"};
String[] kun6 = {"VEHICLE","SPOUSE","LUXURY","MARRIAGE"};
String[] kun7 = {"EMPLOYMENT","LONGEVITY","SERVENT"};
String[][] knarrays = {kun1, kun2, kun3, kun4, kun5,kun6,kun7};
%>

<div class="hdg-lg card">
	<h1><%=rBPrastharashtakvarga.getString("PRASTHARASHTAKVARGA_TABLES")%></h1>	
</div>

<%
  String[] arrPlanetNames = new String[10];
  String [] arrZodiac1 = new String[13];
  String[] arrPlanets = new String[9];
  int[][] arrColTotal = new int[7][12];
  int[][][] arrPrVarga = new int[9][9][13];
  int iCountI, iCountJ, iCountK;
  int[] totArr =  new int[13];

 	DesktopHoro ObjHoroPrastharashtakvarga = (DesktopHoro)session.getAttribute("HoroscopeObj");
//Initilaze The array with Planet Names
arrPlanetNames[0] = "";
arrPlanetNames[1] = "Su";
arrPlanetNames[2] = "Mo";
arrPlanetNames[3] = "Ma";
arrPlanetNames[4] = "Me";
arrPlanetNames[5] = "Ju";
arrPlanetNames[6] = "Ve";
arrPlanetNames[7] = "Sa";
arrPlanetNames[8] = "As";
arrPlanetNames[9] = "Total";

// Vlaue in Zodiac Array
arrZodiac1[0] = "ARIES";
arrZodiac1[1] = "TAURUS";
arrZodiac1[2] = "GEMINI";
arrZodiac1[3] = "CANCER";
arrZodiac1[4] = "LEO";
arrZodiac1[5] = "VIRGO";
arrZodiac1[6] = "LIBRA";
arrZodiac1[7] = "SCORPIO";
arrZodiac1[8] = "SAGITTARIUS";
arrZodiac1[9] = "CAPRICORN";
arrZodiac1[10] = "AQUARIUS";
arrZodiac1[11] = "PISCES";
arrZodiac1[12] = "TOT";

for(iCountI=0;iCountI<=6;iCountI++){
	for(iCountJ=0;iCountJ<=11;iCountJ++){
    arrColTotal[iCountI][iCountJ] = ObjHoroPrastharashtakvarga.getAshtakvargaBinduForSignAndPlanet(iCountI,iCountJ);
  }
  }
for(iCountI=0;iCountI<=7;iCountI++){
	for(iCountJ=0;iCountJ<=7;iCountJ++){	
	    for(iCountK=0;iCountK<=12;iCountK++){
	      arrPrVarga[iCountI][iCountJ][iCountK] = ObjHoroPrastharashtakvarga.getPrastharashtakvargaTables(iCountI + 1,iCountJ + 1,iCountK + 1);
	    }
	}
}

arrPlanets[0]="SUN";
arrPlanets[1]="MOON";
arrPlanets[2]="MARS";
arrPlanets[3]="MERCURY";
arrPlanets[4]="JUPITER";
arrPlanets[5]="VENUS";
arrPlanets[6]="SATURN";
arrPlanets[7]="RAHU";
arrPlanets[8]="TOTAL";

//********************Code For Printing%>

                              
<table class="ui-table-asth">
	<tr>
		<td class="ui-table-varga">
			
			<% for(iCountI=0;iCountI<=6;iCountI++){ %>
			<div class="card mrt-20">
			<table> 
				<tr>
					<td align="center" class="amber lighten-5 vd-hdg br-amber-b" colspan="14" style="padding-top:5px; padding-bottom:5px;">
					
                     <h4 class="ui-h4"><%=rBConstants.getString(arrPlanets[iCountI])%> </h4>    
                           
					</td>
				</tr>
			  
		    </table>
			<table class="highlight striped bordered ui-table" id="ui-table">
			
				<tr class="ui-table-panel">
					<td class="cellhead"></td>
					<% for(int m=0;m<=12;m++){ %>
					<%if(m==12){ %>
					<td class="cellhead"><%=rBConstants.getString("TOTAL")%>
					</td>
					<%}
                    else{ %>
					<td class="cellhead"><%=rBConstants.getString(arrZodiac1[m])%>
					</td>
					<%} %>
					<%} %>
				</tr>
				<%  for(iCountJ=0;iCountJ<=8;iCountJ++){ %>
				<%   // Printing Of Horizontal Planet Names %>
				<tr>

					<% if(iCountJ==8){ %>
					<td class="cellhead"><%=rBConstants.getString("TOTAL")%></td>
					<%
                    }
                    else{ %>
					<% if(iCountJ==7){ %>
					<td class="cellhead"><%=rBConstants.getString("ASCENDANT")%></td>
					<%}
                    else{ %>
					<td class="cellhead"><%=rBConstants.getString(arrPlanets[iCountJ])%></td>
					<% 
                    } 
                    }      

        for(iCountK=0;iCountK<=12;iCountK++){
          if(iCountK==0){  
          }
          if(iCountJ==0){
          }
           
         if(iCountJ==8){
           if(iCountK==12){
           } 
           else{%>
					<td class="cellcontent"><%=arrColTotal[iCountI][iCountK]%>
					</td>
					<%totArr[iCountK] =arrColTotal[iCountI][iCountK]; %>
					<%  }
         }else { %>
					<td class="cellcontent"><%=arrPrVarga[iCountI][iCountJ][iCountK]%>
						</td>
					<% }
         
        }
                }
 
				%>
					</table>
					<%	//*************************Chart Draw %>
<%int[] arrPlanetsShodashvarga = ObjHoroPrastharashtakvarga.getPositionForShodasvarg(0); %>
<div class="row"> 
<div class="col l6"> 
<div class="pdl-15">
<div class="shortHead">
			<h3><b>
				<span class="blt-sq bg-5"></span>
				<%=rBPrastharashtakvarga.getString("INDICATOR") %>
				</b>
				
			</h3>
		</div>

			<ul class="pdl-15">
			<li><span class="blt-cl bg-5"></span><%=rBPrastharashtakvarga.getString("AUSPICIOUS") %></li>
			<li><span class="blt-cl bg-3"></span><%=rBPrastharashtakvarga.getString("INAUSPICIOUS") %></li>
			<li><span class="blt-cl bg-1"></span><%=rBPrastharashtakvarga.getString("MIXED") %></li>
			</ul>
			<div class="shortHead">
			<h3><b>
				<span class="blt-sq bg-1"></span>
				<%=rBConstants.getString(planetName[iCountI])%>&nbsp;<%=rBConstants.getString("SIGNIFICATION") %>
				</b>
				
			</h3>
		</div>
			
			<ul class="pdl-15">
			<%
			
			for(int i = 0 ; i< knarrays[iCountI].length;i++){ 
			int colCheck = i+1;
			
			if((colCheck)%2!=0){
				
				colCheck = colCheck+3;
			}
			
			%>
			<li><span class="blt-cl bg-<%=colCheck%>"></span> <%=rBPrastharashtakvarga.getString(knarrays[iCountI][i])%></li>
			<%} %>
			
			
			</ul>
</div>
</div>

<div class="col l6"> 
<div id="achartTextpsh<%=iCountI%>"></div>

<canvas id="chartTextpsh<%=iCountI%>" width="400px" height="350px" class="responsive-canvas"></canvas> 
<script language="JavaScript" type="text/javascript">
//var myval;
LanguageCode = <%=Util.safeInt(request.getParameter("LanguageCode"))%>;
if (LanguageCode=="")
{
LanguageCode =0;
}
var textcolor = COLOR_INFO;

if(<%=Util.safeInt(session.getAttribute("chartType"))%> =="0"){
chartpref = "north";
}
else{
chartpref = "south";
}
if(window.HTMLCanvasElement) {
    var c=document.getElementById("chartTextpsh<%=iCountI%>");
    var cxt = c.getContext("2d");
    
    cxt.strokeStyle = "#f96d06";    
    Chart_Type = '<%=Util.safeInt(session.getAttribute("chartType"))%>'; 
   // alert(Chart_Type);
<%
String mySyn= "";
for(int i = 1;i<= 12;i++){
    if(i==12){
    mySyn = mySyn + totArr[i-1];
    }else{
    mySyn = mySyn + totArr[i-1]+ ","; 
    }

}

int[] totalAshtakVargaValueNew =  new int[12];
int getstartindex = arrPlanetsShodashvarga[iCountI+1];
int remainingIndex = 12 - arrPlanetsShodashvarga[iCountI+1];

int count =0;
for(int i = getstartindex;i<= 12;i++){
	totalAshtakVargaValueNew[count]=totArr[i-1];
	count++;
}

if(getstartindex>1){
for(int i = 0;i< getstartindex-1;i++){
	
	totalAshtakVargaValueNew[count]=totArr[i];
	count++;
}
}
String mySyn1= "";
for(int i = 1;i<= 12;i++){

    if(i==12){
    mySyn1 = mySyn1 + totalAshtakVargaValueNew[i-1];
    }else{
    mySyn1 = mySyn1 + totalAshtakVargaValueNew[i-1] + ","; 
    }

}
String finalChartString ="";
String finalChart ="";
out.println("arrP = new Array(" + Util.safeInt(session.getAttribute("chartType")) + ");"); //(Asc, sun,moon,....pl)
if(Util.safeInt(session.getAttribute("chartType"))==0){finalChartString=mySyn1;}else{finalChartString=mySyn;};
finalChart = arrPlanetsShodashvarga[iCountI+1]+","+finalChartString;
out.println("arrPlanetsShodashvarga = new Array(" + finalChart + ");"); //(Asc, sun,moon,....pl)


%>
x1_canvas= 10;//10+40;    
y1_canvas= 30;
x2_canvas= 400-5;//320+75;
y2_canvas= 300+20;//300-20;
    SetFontSize(14);    
 
    PrintChartofAstak(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, LanguageCode,false);  
      myval="";

          }  
else {
   $('#chartTextpsh<%=iCountI%>').hide();$('#h311').hide();
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>

<script language="JavaScript" type="text/javascript">
    $('#achartTextpsh<%=iCountI%>').append(myval);
   
</script>
</div>

</div>	
<%	//*************************Chart Draw End%>
	</div>
				<%
           }
                    %>
				
		 
				
		</td>
	</tr>

</table>

<div class="center-align mrt-20">  <a href="ashtaktable.asp" class="waves-effect waves-light btn amber darken-4 box-shadow"> <%=rBConstants.getString("ASHTAKVARGA_TABLE")%>- <%=rBAshtaktable.getString("SARVASHTAKVARGA")%> </a></div>



<%@include file='calculations-footer.jsp'%>
                             