<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%
Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBAshtaktable = local.loadPropertiesFileNew("ashtaktable",languageCode);
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBPrastharashtakvarga = local.loadPropertiesFileNew("prastharashtakvarga", languageCode); 


String [] arrZodiac1 = new String[12];

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
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("ASHTAKVARGA_TABLE")%>-<%=rBAshtaktable.getString("SARVASHTAKVARGA")%></h1>	
</div>

<div class="card table-panel rt-custom">
<div class="row mrt-30"> 
<div class="col s12 l12">

	<table class="highlight striped bordered ui-table responsive-table" id='ui-table'>
		<%
    DesktopHoro ObjHoroAshtak = (DesktopHoro)session.getAttribute("HoroscopeObj");
	//set ObjHoroAshtak = session("HoroscopeObj")
    if(languageCode == 1)
        ObjHoroAshtak.setLanguageCode("1");
    else
    {
        ObjHoroAshtak.setLanguageCode("0");
    }
   
    ObjHoroAshtak.initialize();
    int[][] ashtakVargaBindu =  new int[7][12];
	int[] totalAshtakVargaValue = new int[12];

	for(int i=0; i<=6 ;i++){
		for(int k=0 ; k<=11 ; k++){
			ashtakVargaBindu[i][k]=ObjHoroAshtak.getAshtakvargaBinduForSignAndPlanet(i,k);
			}
	}
	
	for(int j = 0 ; j<=11 ; j++){ 
		
		totalAshtakVargaValue = ObjHoroAshtak.getTotalAshtakVargaValue();
	}
        %>
        <thead>
		<tr class="amber lighten-5">
			<th class="cellhead"><%//=rBAshtaktable.getString("RASHINO")%>&nbsp;</th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[0])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[1])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[2])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[3])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[4])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[5])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[6])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[7])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[8])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[9])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[10])%></th>
			<th class="cellhead"><%=rBConstants.getString(arrZodiac1[11])%></th>
		</tr>
		</thead>
		<% for(int i=0 ; i<=6 ;i++){%>
		<tr>
			<td class="cellhead"><%=hindi.unicode(ObjHoroAshtak.getPlanetName(i+1),languageCode)%>&nbsp;
			</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][0]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][1]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][2]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][3]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][4]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][5]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][6]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][7]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][8]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][9]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][10]%>&nbsp;</td>
			<td class="cellcontent"><%=ashtakVargaBindu[i][11]%>&nbsp;</td>
		</tr>
		<%}%>
		<tr>
			<td class="cellhead"><%=rBConstants.getString("TOTAL")%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[0]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[1]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[2]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[3]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[4]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[5]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[6]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[7]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[8]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[9]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[10]%>&nbsp;</td>
			<td class="cellcontent"><%=totalAshtakVargaValue[11]%>&nbsp;</td>
		</tr>
	</table>
	
	</div></div>

	<%int[] arrPlanetsShodashvarga = ObjHoroAshtak.getPositionForShodasvarg(0); %>
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
			
</div>
</div>
<div class="col l6"> 

<div id="chartTextaSH"></div>

<canvas id="CanvasaSH" width="400px" height="350px" class="responsive-canvas"></canvas> 
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
    var c=document.getElementById("CanvasaSH");
    var cxt = c.getContext("2d");
    
    cxt.strokeStyle = "#f96d06";     
    Chart_Type = '<%=Util.safeInt(session.getAttribute("chartType"))%>'; 
<%
String mySyn= "";
for(int i = 1;i<= 12;i++){
    if(i==12){
    mySyn = mySyn + totalAshtakVargaValue[i-1];
    }else{
    mySyn = mySyn + totalAshtakVargaValue[i-1] + ","; 
    }

}

int[] totalAshtakVargaValueNew =  new int[12];
int getstartindex = arrPlanetsShodashvarga[0];
int remainingIndex = 12 - arrPlanetsShodashvarga[0];

int count =0;
for(int i = getstartindex;i<= 12;i++){
	totalAshtakVargaValueNew[count]=totalAshtakVargaValue[i-1];
	count++;
}

if(getstartindex>1){
for(int i = 0;i< getstartindex-1;i++){
	
	totalAshtakVargaValueNew[count]=totalAshtakVargaValue[i];
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
if(Util.safeInt(session.getAttribute("chartType"))==0){finalChartString=mySyn1;}else{finalChartString=mySyn;};
finalChart = arrPlanetsShodashvarga[0]+","+finalChartString;
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
   $('#CanvasKalsarpa').hide();$('#h311').hide();
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>

<script language="JavaScript" type="text/javascript">
    $('#chartTextaSH').append(myval);
   
</script>

</div>
</div>
</div>
  
<div class="center-align mrt-20">  <a href="prastharashtakvarga.asp" class="waves-effect waves-light btn amber darken-4 box-shadow"> <%=rBConstants.getString("PRASTHARASHTAKVARGA_TABLE")%> - <%=rBConstants.getString("KUNDLI")%>  </a></div>

	<%@include file='ui-control/ad-content-area.jsp'%>
	
	
	<p><%@include file='calculations-footer.jsp'%></p>

<div style="padding-bottom: 20px;"></div>