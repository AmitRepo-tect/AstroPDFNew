<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.printhoroscope.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%@include file='kp_south.jsp'%>
<%
Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle ascendentPrediction = local.loadPropertiesFileNew("planetposition-transittodaychart-kpplanetcusp-kptoday",languageCode);
MyResourceBundle ascendentPredictionMoonSign = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday",languageCode);
                                                                            

%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("KP_SYSTEM_PLANETS_CUSPS") %></h1>	
</div>

<%

               //DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");// already used in kp_south

	           if(languageCode ==1){
	        	   myAstrologyObject.setLanguageCode("1");
	                myAstrologyObject.initialize();
	           }else{
	                myAstrologyObject.setLanguageCode("0");
	                myAstrologyObject.initialize();
	           }
	          
	           String DashaOutput = myAstrologyObject.getVimsottariDasaTwoLevel().toString();
	           String balanceDasha = myAstrologyObject.getBalanceOfDasa().toString();

	           int chartType = Integer.parseInt(String.valueOf(session.getAttribute("chartType")));
	          // UtilDesktop objUtil = new  UtilDesktop();  // already used in kp_south

		        		
		       String[] myPlanetNames =  new String[13];
		       String[] myPlanetDMS = new String[13];
		       String[] myPlanetRNSS =  new String[13];
               int ayanamsa1 = 0;
               myPlanetNames[1]=rBConstants.getString("SUN");
               myPlanetNames[2]=rBConstants.getString("MOON");
               myPlanetNames[3]=rBConstants.getString("MARS");									   
               myPlanetNames[4]=rBConstants.getString("MERCURY");				  
               myPlanetNames[5]=rBConstants.getString("JUPITER");					   
               myPlanetNames[6]=rBConstants.getString("VENUS");
               myPlanetNames[7]=rBConstants.getString("SATURN");
               myPlanetNames[8]=rBConstants.getString("RAHU");
               myPlanetNames[9]=rBConstants.getString("KETU");
               myPlanetNames[10]=ascendentPredictionMoonSign.getString("URANUS");
               myPlanetNames[11]=ascendentPredictionMoonSign.getString("NEPTUNE");
               myPlanetNames[12]=ascendentPredictionMoonSign.getString("PLUTO");	
																													   
               double planetLongitudeVal;
               for(int i = 1; i<=12;i++){
                   planetLongitudeVal=myAstrologyObject.getKPPlanetLongitude(i);                
                   if(planetLongitudeVal<0) {
                 	    planetLongitudeVal=planetLongitudeVal+360.0;
                   }
                   myPlanetDMS[i] = objUtil.dms1((myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa1);
                   myPlanetRNSS[i] = local.getRNSSData(myAstrologyObject.rnss(myAstrologyObject.getKPPlanetLongitude(i)), "-", languageCode);
                  }
%>

<div class="row mrt-30">
   <div class="col s12 l12 ui-btm ui-btm-zero">
      <div class="card table-panel">
          <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBConstants.getString("PLANETS") %> </h4>
             <table class="highlight striped bordered ui-table ui-font">
             <%
  String[]  planetarray ={"SUN", "MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KETU"};%>
  <thead>
  <tr>
		<th class="cellhead"><%=rBConstants.getString("PLANETS") %></th>
		<th class="cellhead"><%=rBConstants.getString("DEGREE") %></th>
		<th class="cellhead"><%=rBConstants.getString("RAS_NAK_SUB_SS") %></th>
		<th class="cellhead"><%=ascendentPrediction.getString("RET_DIR")%></th>
	</tr>
	</thead>
	<% for(int i= 1 ; i<= 12 ; i++){ %>
	<tr>
		<td class="cellcontent"><%=myPlanetNames[i]%></td>
		<td class="cellcontent"><%=myPlanetDMS[i]%>
		</td>
		<td class="cellcontent"><%=myPlanetRNSS[i]%>
		</td>
		<td class="cellcontent">
			<% if(myAstrologyObject.isPlanetDirect(i)==true){ %> <%=ascendentPrediction.getString("DIR")%>
			<%} else{ %> <%=ascendentPrediction.getString("RET")%> <% }%>
		</td>
	</tr>
	<% }%>
</table>

<%   String[] rashiName = new String[13];
     String[] nakName = new String[13];
     String[] subLordName = new String[13];
     String[] subSubLordName = new String[13];
     String[] rnss = new String[13];
     String[] strDeLimiter = new String[13];
     String[] planetDegreeArr = new String[13];
     String[] rnssOfPlanet = new String[13];

        for(int i = 1 ; i<=12; i++){
        	strDeLimiter[i] = ""; // no result found in asp
        	rashiName[i] = myAstrologyObject.getRashiNameForKPCusp(i);
            nakName[i] = myAstrologyObject.getNakshatraLordNameForKPCusp(i);
            subLordName[i] = myAstrologyObject.getSubLordNameForKPCusp(i);
            subSubLordName[i] = myAstrologyObject.getSubSubLordNameForKPCusp(i);
            rnss[i] = rashiName[i]	+ strDeLimiter[i] + "-" + nakName[i] + strDeLimiter[i] + "-" + subLordName[i] +  strDeLimiter[i] + "-" + subSubLordName[i];
           
        }

        for(int i = 1; i<=12;i++){
            objUtil.dms1 ((myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa1);
            planetDegreeArr[i - 1] = objUtil.dms1((myAstrologyObject.getKPCuspLongitude(i)) + ayanamsa1);
            rnssOfPlanet[i - 1] = local.getRNSSData(rnss[i], "-",  languageCode);
        }
%>
             
             </table>
             </div>
             </div>
             </div>
             
             
  <div class="row mrt-30">
   <div class="col s12 l12 ui-btm ui-btm-zero">
      <div class="card table-panel">
          <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBConstants.getString("BHAV") %></h4>
             <table class="highlight striped bordered ui-table ui-font">
             <thead>
             <tr>
		<th class="cellhead"><%=rBConstants.getString("CUSP")%></th>
		<th class="cellhead"><%=rBConstants.getString("DEGREE")%></th>
		<th class="cellhead"><%=rBConstants.getString("RAS_NAK_SUB_SS")%></th>
	</tr>
	</thead>
	<%
    for(int i= 0 ; i<=11;i++){ %>
	<tr>
		<td class="cellcontent"><%=i+1%>&nbsp;</td>
		<td class="cellcontent"><%=planetDegreeArr[i]%>
		</td>
		<td class="cellcontent"><%=rnssOfPlanet[i].replace(".","-")%></td>
	</tr>
	<%}%>
             
             </table>
             </div>
             </div>
             </div>





<% 
if(chartType==0 ){
    	Chart objchart= new NorthChart() ;
} else { 
	   Chart objchart= new SouthChart();
}

    //int ayanamsa1 = 0; again assign
    int[] rashiPosition = new int[13];
    double[] bhavaPositions = new double[13];
    double longitudeDifference;
    for(int j = 0 ; j<=11;j++){
       longitudeDifference = myAstrologyObject.getKPCuspLongitude(j + 1) + ayanamsa1;
       if(longitudeDifference >= 360.0){  longitudeDifference = longitudeDifference - 360.0 ;}
       bhavaPositions[j] = longitudeDifference;
       rashiPosition[j] = (int)(longitudeDifference / 30) + 1;
     
    }
    int[] rashiPositionnew =  new int[13];
    int[] bhavPositionnew =  new int[13];
    int[] bhavPosition =  new int[13];
    
    SharedFunction sf = new SharedFunction();
     for(int k = 0; k<=11; k++){
         longitudeDifference = myAstrologyObject.getKPPlanetLongitude(k + 1) + ayanamsa1;
         rashiPositionnew[k] = (int)(longitudeDifference / 30) + 1	;
        
         if(longitudeDifference >= 360.0 ){
 	        longitudeDifference = longitudeDifference - 360.0;
         }
         //Add new condition so that it will not crash when negative value will come.
         if(longitudeDifference<0){ 
     	    longitudeDifference = longitudeDifference+360.0;
         }
         bhavPosition[k] = sf.getPlanetBhavaPosition(longitudeDifference, bhavaPositions); // same functinality getKPPlanetBhavaPosition
        
         
     }
    

     for(int k = 0 ;k<= 11;k++){
         bhavPositionnew[k+1] = bhavPosition[k];
      }
     bhavPositionnew[0] = rashiPosition[0];

     //getRaashiPosition(rashiPosition);
     int[] RaashiNo =  new int[13];
        for(int l=0 ;l<=12;l++){
     	   RaashiNo[l]=   rashiPosition[l];
        }
    int count=0;
    int[] tempraashi =  new int[13];
     for(int m=0 ;m<=12;m++){
         if(RaashiNo[m] >=1 ){
             tempraashi[count]=RaashiNo[m];
             count=count+1;
         }
     }
     int mycount=count;
     int mycount2=count;
     for(int n=0 ;n<=mycount-1;n++){
         tempraashi[mycount2]=RaashiNo[n];
     }
     int[] myRashi =  new int[13];
     for(int a=0 ;a<=11;a++){
         myRashi[a+1]=tempraashi[a]+1;
     }

    %>
    
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg">
<h2 class="br-amber-b amber lighten-5 head-R"> <%=rBConstants.getString("CUSP") %>&nbsp;
				<%=rBConstants.getString("CHART") %>   </h2>
				
				<%
           //Declare array for JPEG
            String rashiarray = rashiPosition[0]+","+rashiPosition[1]+","+rashiPosition[2]+","+rashiPosition[3]+","+rashiPosition[4]+","+rashiPosition[5]+","+rashiPosition[6]+","+rashiPosition[7]+","+rashiPosition[8]+","+rashiPosition[9]+","+rashiPosition[10]+","+rashiPosition[11];
             %> <%

            %>
            <div class="center"> 
            <div id="chart"></div>
				<canvas id="CanvasKpPCusp" width="600px" height="400px"
					class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">
//var myval;

LanguageCode = <%=session.getAttribute("languageCode")%>;
if (LanguageCode=="")
{
LanguageCode =0;
}
var textcolor = COLOR_INFO;
if('<%=session.getAttribute("chartType")%>' =="0"){
chartpref = "north";
}

else{
chartpref = "south";
}

if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasKpPCusp");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType")%>'; 
   
<%
String mySyn = "";
String mySyn1 = "";
String mySyn2 = "";
String mySyn3 = "";


for(int i = 0; i<= 11;i++){
    mySyn = mySyn + bhavPositionnew[i]+ ","; 
    mySyn1 = mySyn1 +rashiPosition[i] + ","; 
    mySyn2 = mySyn2 + rashiPositionnew[i] +"," ;
}

mySyn = mySyn + bhavPositionnew[12] ;
mySyn1 = mySyn1 + rashiPosition[11] ;
mySyn2 = mySyn2 + rashiPositionnew[11]; 
mySyn3 = mySyn3+"{"+array1+"}"+","+"{"+array2+"}"+","+"{"+array3+"}"+","+"{"+array4+"}"+","+"{"+array5+"}"+","+"{"+array6+"}"+","+"{"+array7+"}"+","+"{"+array8+"}"+","+"{"+array9+"}"+","+"{"+array10+"}"+","+"{"+array11+"}"+","+"{"+array12+"}";

out.println("bhavPositionnew = new Array(" + mySyn + ");");
out.println("rashiPosition = new Array(" + mySyn1 + ");");
out.println("rashiPositionnew = new Array(" + mySyn2 + ");");
out.println("RaashiNoCorrespondingToPlanets = new Array(" + mySyn3 + ");");

%>
    x1_canvas= 50+40;
    y1_canvas= 5;
    x2_canvas= 400-5+120+20;
    y2_canvas= 300+20+60;
  
    PrintChartofKP(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, bhavPositionnew,rashiPositionnew,rashiPosition,RaashiNoCorrespondingToPlanets, Chart_Type, LanguageCode,true);  
      myval="";
          }  
else {
   $('#CanvasKpPCusp').hide();   $('#h31').hide();
     myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>

				<script language="JavaScript" type="text/javascript">
    $("#chart").append(myval);
</script>
</div>
</div>
</div>
</div>


<%@include file='kp-footer.jsp'%>
<%!

/*public int IIIf(boolean condition, int truecase, int falsecase){
	if(condition){
		return(truecase);
	}
	else
	{
		return(falsecase);
	}
}

public int getKPPlanetBhavaPosition(double planetLongitude, double[] cuspsLongitudes){
double pl, d3, startd, endd;    
int bhava=0;
pl = planetLongitude;
d3=0.0;
for(int j=0;j<=11;j++){    	
	startd = cuspsLongitudes[j];
	endd = cuspsLongitudes[IIIf(j >= 11, j - 11, j + 1)];
	if(startd > endd){
		d3 = endd;
		endd = endd +360;
	}
	  	if(d3!= 0) { 
		if(pl < d3){
		  pl = pl + 360;
		  d3 = 0;
	  		}
	  	}
	 if(pl >= startd && pl < endd){
	bhava = j + 1;
		break;
	 }
}
return(bhava);
}
*/
/*
public void getRaashiPosition(int[] rashiPosition){
int[] RaashiNo =  new int[13];
for(int i = 0 ;i<= 11 ;i++){
RaashiNo[i] = rashiPosition[i];
}
}
*/
%>

