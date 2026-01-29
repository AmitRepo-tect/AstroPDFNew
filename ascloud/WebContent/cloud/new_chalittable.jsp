<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.printhoroscope.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%@include file='chalit_south.jsp'%>
<%
	Local local = new Local();
	Hindi hindi = new Hindi();
	int languageCode = (Integer)session.getAttribute("languageCode");
	MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
	MyResourceBundle rBChalitTable = local.loadPropertiesFileNew("chalittable", languageCode);
%>


<div class="hdg-lg card">
	<h1><%=rBChalitTable.getString("CHALIT_TABLE")%></h1>	
</div>

<div class="row mrt-30 planet-table"> 
<div class="col s12 l12">
<div class="card table-panel rt-custom">
<table class="highlight striped bordered ui-table responsive-table" id='ui-table'>
		<%
	//dim rashiAndDegree,rashiNameForBhavBegin(11),bhavValueForBhavBegin(11)
	//dim rashiNameForMidBhav(11),bhavValueForMidBhav(11)
	DesktopHoro objHoroChalit = (DesktopHoro)session.getAttribute("HoroscopeObj");
    double value = 0.0;
    String[] rashiNameForBhavBegin = new String[12];
	String[] bhavValueForBhavBegin = new String[12];
	String[] rashiNameForMidBhav = new String[12];
	String[] bhavValueForMidBhav = new String[12];
	String[] rashiAndDegree = new String[2];
	
        for(int i=0;i<=11;i++){        	
		value = objHoroChalit.getBhavBeginForBhav(i+1);
		rashiAndDegree=objHoroChalit.getRasiAndItsDegree(value);
		rashiNameForBhavBegin[i] = rashiAndDegree[0];
		bhavValueForBhavBegin[i] = rashiAndDegree[1];
		value = objHoroChalit.getMidBhavForBhava(i+1);		
		rashiAndDegree = objHoroChalit.getRasiAndItsDegree(value);
		rashiNameForMidBhav[i] = rashiAndDegree[0];
		bhavValueForMidBhav[i] = rashiAndDegree[1];		
	}       
        
        %>
        <thead>
		<tr class="amber lighten-5">
			<th class="cellhead"><%=rBConstants.getString("BHAV")%></th>
			<th class="cellhead"><%=rBConstants.getString("RASHI")%></th>
			<th class="cellhead"><%=rBChalitTable.getString("BHAVBEGIN")%></th>
			<th class="cellhead"><%=rBConstants.getString("RASHI")%></th>
			<th class="cellhead"><%=rBChalitTable.getString("MIDBHAV")%></th>
		</tr>
		</thead>
		<% for(int i=0;i<=11;i++){ %>
		<tr>
			<td class="cellcontent"><%=(i+1)%>&nbsp;</td>
			<td class="cellcontent"><%=hindi.unicode(rashiNameForBhavBegin[i], languageCode) %>&nbsp;
			</td>
			<td class="cellcontent"><%=local.correctSeperatorDot(bhavValueForBhavBegin[i])%>&nbsp;
			</td>
			<td class="cellcontent"><%=hindi.unicode(rashiNameForMidBhav[i], languageCode)%>&nbsp;
			</td>
			<td class="cellcontent"><%=local.correctSeperatorDot(bhavValueForMidBhav[i])%>&nbsp;
			</td>
		</tr>
		<%
        }
        %>
	</table>
	<%
    int chartType = Integer.parseInt(String.valueOf(session.getAttribute("chartType")));
    double[] bhavaBeginPositions = new double[12];
    int[] bhavPosition = new int[13];
    int[] bhavPositionnew = new int[13];
    int[] rashiPosition = new int[13];
    
    if(chartType==0 ){
    	Chart objchart= new NorthChart() ;
	} else { 
	   Chart objchart= new SouthChart();
	}
    for(int i = 0;i<=11;i++)
    {
    	bhavaBeginPositions[i] = objHoroChalit.getBhavBeginForBhav(i + 1);
    }
    SharedFunction sf = new SharedFunction();
    for(int i = 0;i<=11;i++)
    {
    	bhavPosition[i] = sf.getPlanetBhavaPosition(objHoroChalit.getPlanetaryLongitude(i + 1), bhavaBeginPositions);  
    	rashiPosition[i+1] = (int)(objHoroChalit.getMidBhavForBhava(i + 1) / 30)+1;
    }  
    double longitudeDifference = 0;
    double longitudeDifference1 = 0;
    double[] bhavaPositions = new double[12];
    int[] rashiPositions = new int[12];
    int[] rashiPositionnew = new int[12];
    
    for(int i = 0;i<=11;i++)
    {
 	    longitudeDifference = objHoroChalit.getBhavBeginForBhav(i + 1) ;
 	    longitudeDifference1 = objHoroChalit.getMidBhavForBhava(i+1);
 	     
 	     if(longitudeDifference >= 360.0)
 	    	 longitudeDifference = longitudeDifference - 360.0;
 	     if(longitudeDifference1 >= 360.0) 
 	    	 longitudeDifference1 = longitudeDifference1 - 360.0;
 	      bhavaPositions[i] = longitudeDifference;
 	      rashiPositions[i] = (int)(longitudeDifference1 / 30) + 1;
 	      
    }

    	    for(int i = 0;i<=11;i++)
    	    {
    	        longitudeDifference = objHoroChalit.getPlanetaryLongitude(i + 1) ;
    	        rashiPositionnew[i] = (int)(longitudeDifference / 30) + 1;	
    	            
    	        if( longitudeDifference >= 360.0) 
    		        longitudeDifference = longitudeDifference - 360.0;
    	        
    	        if( longitudeDifference<0)
    	    	    longitudeDifference = longitudeDifference+360.0;
    	        
    	        bhavPosition[i] = sf.getPlanetBhavaPosition(longitudeDifference, bhavaPositions);
    	    }

    	    for(int k = 0;k<=11;k++)
    	    {
    	        bhavPositionnew[k+1] = bhavPosition[k];
    	    } 
    	    bhavPositionnew[0] = rashiPositions[0];
    %>
</div>
</div>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="row mrt-30">
	<div class="col s12 l12">
	<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=rBChalitTable.getString("CHALIT_CHART")%>   </h2>
<div id="chartText"></div>
	<div align="center">
		<canvas id="CanvasChalit" width="600px" height="400px" class="responsive-canvas-m"></canvas>
		<script language="JavaScript" type="text/javascript">
var myval;
var LanguageCode = <%=languageCode%>;

var textcolor = COLOR_INFO;
if('<%=session.getAttribute("chartType")%>' =="0"){
	chartpref = "north";
	}

	else{
	chartpref = "south";
	}

if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasChalit");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType")%>'; 
   
<%
String mySyn = "";
String mySyn1 = "";
String mySyn2 = "";
String mySyn3 = "";

for(int i = 0;i<=11;i++)
{
    mySyn = mySyn + bhavPositionnew[i] + "," ;
     mySyn1 = mySyn1 + rashiPositions[i] + "," ;
      mySyn2 = mySyn2 + rashiPositionnew[i] + "," ;
}

mySyn = mySyn + bhavPositionnew[12]; 
mySyn1 = mySyn1 + rashiPositions[11] ;
mySyn2 = mySyn2 + rashiPositionnew[11] ;
mySyn3 = mySyn3+"{"+array1+"},{"+array2+"},{"+array3+"},{"+array4+"},{"+array5+"},{"+array6+"},{"+array7+"},{"+array8+"},{"+array9+"},{"+array10+"},{"+array11+"},{"+array12+"}";

out.println("bhavPositionnew = new Array(" + mySyn +");");
out.println("rashiPosition = new Array(" + mySyn1 + ");");
out.println("rashiPositionnew = new Array(" + mySyn2 + ");");
out.println("RaashiNoCorrespondingToPlanets = new Array(" + mySyn3 + ");");

%>
    x1_canvas= 50+40;//10+40;
    y1_canvas= 5+20;
    x2_canvas= 400-5+120+20;//320+75;
    y2_canvas= 300+20+60;//300-20;
  
    PrintChartofKP(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, bhavPositionnew,rashiPositionnew,rashiPosition,RaashiNoCorrespondingToPlanets, Chart_Type, LanguageCode,true);  
      myval="";
          }  
else {
   $('#CanvasChalit').hide();
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

	



	