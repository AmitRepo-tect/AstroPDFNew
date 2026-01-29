<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.cslsoftware.printhoroscope.SouthChart"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page import="com.cslsoftware.printhoroscope.Chart"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>


<%	
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBLalKitabvarshaphalCharts = local.loadPropertiesFileNew("lalkitabvarshaphalcharts",languageCode);
MyResourceBundle rBLalkitabVar_charts = local.loadPropertiesFileNew("lalkitabvarshaphalprediction-lalkitabvarshaphal-lalkitabvarshaphalcharts",languageCode);

String[] maleficBenefic =  new String[2];

maleficBenefic[0] = "<font color=red>Malefic</font>";
maleficBenefic[1] = "Benefic";

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");

  SharedFunction sf = new SharedFunction();
  LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
  UtilLalkitab lalKitabUtil = new UtilLalkitab();


//*************Code For Palnetory Degrees & Positions ******
String[] arrHeading =  new String[6];
arrHeading[0] = "Planets";
arrHeading[1] = "Sign";
arrHeading[2] = "Position";
arrHeading[3] = "Soya";
arrHeading[4] = "Kismat Jaganewala";
arrHeading[5] =  "Benefic/Malefic";

String[] arrSign = new String[9];
String[] arrPlanet = new String[9];
String[] arrPosition = new String[9];

int[] mRaashiNoCorrespondingToPlanets = new int[13];
mRaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);

for(int iCount = 0 ; iCount<=8 ;iCount++){
arrSign[iCount] = objLalKitab.getPlanetaryRashiNameForLalkitab(iCount + 1);
}

arrPlanet[0]="Sun";
arrPlanet[1]="Moon";
arrPlanet[2]="Mars";								   
arrPlanet[3]="Mercury";					  
arrPlanet[4]="Jupiter";					   
arrPlanet[5]="Venus";
arrPlanet[6]="Saturn-Ret";
arrPlanet[7]="Rahu-Ret";
arrPlanet[8]="Ketu-Ret";

arrPosition[0] = "Dblitted";
arrPosition[1] = "NuSign";
arrPosition[2] = "NuSign";
arrPosition[3] = "FrSign";
arrPosition[4] = "NuSign";
arrPosition[5] = "Dblitted";
arrPosition[6] ="NuSign";
arrPosition[7] ="NuSign";
arrPosition[8] ="EnSign";

//************* code for current year ***********
String getYear = request.getParameter("ChangeYear");
if(getYear!=null && getYear!=""){
session.setAttribute("tt", getYear);
}

Calendar cal = Calendar.getInstance();
int myvalue;
if(getYear!=null && !getYear.equals("")){
    myvalue=Integer.parseInt(getYear);
}else{
    myvalue=cal.get(Calendar.YEAR);
}
 
myvalue = (int)(myvalue) - (int)(myAstrologyObject.getYearOfBirth());  

int period=myvalue;
int day1=myAstrologyObject.getDayOfBirth();
int month1=myAstrologyObject.getMonthOfBirth();
int month2=cal.get(Calendar.MONTH);


int currentMonth;
if(month2<=month1){
    period=period+0;
    currentMonth=0;
}else{
    currentMonth=1;
    period=period+1;
}

if(period==0){
period=1;
}    
int currYear=myvalue + myAstrologyObject.getYearOfBirth();

String chartTypeString = Util.safestr(session.getAttribute("chartType"));
int chartType=Util.safeInt(chartTypeString);
Chart objchart = null;

if(chartType==0) {
    objchart=new NorthChart();
}else{
   objchart=new SouthChart();
}

objLalKitab.initializesArrayValuesOfLalKitab();

int[] raashiNoCorrespondingToPlanets = new int[13];
raashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
 
int[] raashiNoCorrespondingToPlanets1 = new int[13];
for(int iCount = 0 ; iCount<= 11 ; iCount++){
raashiNoCorrespondingToPlanets1[iCount + 1] = raashiNoCorrespondingToPlanets[iCount];
}

raashiNoCorrespondingToPlanets1[0] = 1;

int[] raashiNo = SharedFunction.getRaashi(raashiNoCorrespondingToPlanets1[0]);
int[] tempraashi = new int[13]; 
int[] myRashi = new int[13]; 
int[] planetinBhav = new int[12]; 

int count=0;
for(int i=0 ; i<= 12 ;i++){
    if(raashiNo[i]>=1){
        tempraashi[count]=raashiNo[i];
        count=count+1;
    }
}
int mycount=count;
int mycount2=count;
for(int i=0 ; i<= mycount-1 ; i++){
    tempraashi[mycount2]=raashiNo[i];
}
  
for(int i=0 ; i<= 11 ; i++){
    myRashi[i+1]=tempraashi[i]+1;
} 
//--------Code To Draw the Planets----------
int[] planetno = new int[12];
for(int i=1;i<= 12; i++){
   planetno[i-1] = raashiNoCorrespondingToPlanets1[i];
}	
  
int detect=tempraashi[0]-1;
for(int i=0; i<= 11 ; i++){
    planetno[i] = planetno[i]-detect;
    if(planetno[i]<=0){
        planetno[i]=planetno[i]+12;
    }
    planetinBhav[i]=planetno[i];
}	

RLalKitab lalKitabNew = new RLalKitab();

%>
<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LAL_KITAB_VARSHAPHAL_CHARTS")%></h1>	
</div>


<div class="row mrt-30 mrb-30">
  <div class="col s12 l12">
<% 

String varshChartHeading = rBLalKitabvarshaphalCharts.getString("LK_VARSHPHAL_PERIOD_CHART_HEADING");
if(period > 5){%>


     <div class="card table-panel">
     <%if(currentMonth==0){%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<% 
                String fromdate = day1+"/"+month1+"/"+(currYear-5-1);
                String todate = day1+"/"+month1+"/"+(currYear-5);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
				<%
                %>
			</h4> <%
	}else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear-5);
                String todate = day1+"/"+month1+"/"+(currYear-5+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                 %>
			</h4> 
	<%}%> 
			
			
			<% 

             int[] array1 = vashaphalChartsCanvas(planetinBhav,period-5,lalKitabNew);
            %>

			<div id="chartText"></div> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart1" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
            else{
            chartpref = "south";
            }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart1");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString%>'; 
<%
      String mySyn ="";
      for(int i = 1 ;i<= 12 ; i++){
      if(i==12) {
      mySyn = mySyn + array1[i-1];  
      }else{
      mySyn = mySyn + array1[i-1] + ","; 
      }
      }

     mySyn = "1"+","+mySyn;
    out.println("arrPlanets = new Array(" + mySyn + ")"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
    myval="";

          }  
else {
   $('#chart1').hide(); 
}
</script>  
			
	</div> 
</div>

<%} %>




<% if(period > 4){ %>
<div class="card table-panel mrt-20">

			<% if(currentMonth==0){ %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear-4-1);
                String todate = day1+"/"+month1+"/"+(currYear-4);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%} else {%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                 String fromdate = day1+"/"+month1+"/"+(currYear-4);
                 String todate = day1+"/"+month1+"/"+(currYear-4+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%}%>
		
			<%
            int[] array2 = vashaphalChartsCanvas(planetinBhav,period-4,lalKitabNew);
            %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart2" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
           else{
           chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart2");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString%>'; 
<%
      String mySyn2 ="";
      for(int i = 1 ; i<=12 ; i++){
      if(i==12){
      mySyn2 = mySyn2 + array2[i-1];
      }else{
      mySyn2 = mySyn2 + array2[i-1] + "," ;
      }
      }

     mySyn2 = "1"+","+mySyn2;
    out.println("arrPlanets = new Array(" + mySyn2 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

  }  
  else {
   $('#chart2').hide();
}
   </script>
			</div> <%//***************End of canvas chart**************************** %>
		
</div>


<%}%>

<% if(period > 3) {%>
     <div class="card table-panel mrt-20">

			<% if(currentMonth==0) { %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear-3-1);
                String todate = day1+"/"+month1+"/"+(currYear-3);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% }else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate =day1+"/"+month1+"/"+(currYear-3);
                String todate = day1+"/"+month1+"/"+(currYear-3+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%}%>
		
			<%
            int[] array3 = vashaphalChartsCanvas(planetinBhav,period-3,lalKitabNew);
            %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart3" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
          else{
          chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart3");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString %>'; 
<%
      String mySyn3 = "";
      for(int i = 1;i<= 12 ;i ++){
      if(i==12) {
      mySyn3 = mySyn3 + array3[i-1];  
      }else{
      mySyn3 = mySyn3 + array3[i-1] + ","; 
      }
      }

     mySyn3 = "1"+","+mySyn3;
     out.println("arrPlanets = new Array(" + mySyn3 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

  }  
  else {
   $('#chart3').hide();
}
   </script>
			</div> <%//***************End of canvas chart**************************** %>
	
</div>
<% } %>
<% if(period > 2) { %>
     <div class="card table-panel mrt-20">

			<% if(currentMonth==0){ %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate =day1+"/"+month1+"/"+(currYear-2-1);
                String todate = day1+"/"+month1+"/"+(currYear-2);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% }else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate =day1+"/"+month1+"/"+(currYear-2);
                String todate = day1+"/"+month1+"/"+(currYear-2+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%} %>
		
			<%
            int[] array4 = vashaphalChartsCanvas(planetinBhav,period-2,lalKitabNew);
            %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart4" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
          else{
          chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart4");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString%>'; 
<%
      String mySyn4 = ""; 
      for(int i = 1 ;i<=12; i++){
      if(i==12) {
      mySyn4 = mySyn4 + array4[i-1];  
      }else{
      mySyn4 = mySyn4 + array4[i-1] + "," ;
      }
      }

     mySyn4 = "1"+","+mySyn4;
     out.println("arrPlanets = new Array(" + mySyn4 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
     myval="";

  }  
  else {
   $('#chart4').hide();
}
   </script>
			</div> <%//***************End of canvas chart**************************** %>
		
</div>
<% } %>
<% if(period > 1){%>
     <div class="card table-panel mrt-20">

			<% if(currentMonth==0){ %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate =day1+"/"+month1+"/"+(currYear-1-1);
                String todate = day1+"/"+month1+"/"+(currYear-1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% }else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate =day1+"/"+month1+"/"+(currYear-1);
                String todate = day1+"/"+month1+"/"+(currYear-1+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%}%>
		
			<%
            int[] array5 = vashaphalChartsCanvas(planetinBhav,period-1,lalKitabNew);
          %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart5" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
          else{
          chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart5");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString %>'; 
<%
      String mySyn5 = "";
      for(int i = 1 ; i<= 12 ; i++){
      if(i==12) {
      mySyn5 = mySyn5 + array5[i-1];  
      }else{
      mySyn5 = mySyn5 + array5[i-1] + ","; 
      }
      }

     mySyn5 = "1"+","+mySyn5;
     out.println("arrPlanets = new Array(" + mySyn5 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

  }  
  else {
   $('#chart5').hide();
}
   </script>
			</div> <%//***************End of canvas chart**************************** %>
		
</div>
<%} %>


     <div class="card table-panel mrt-20">

			<% if(currentMonth==0) {%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear-1);
                String todate = day1+"/"+month1+"/"+(currYear);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%} else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate =day1+"/"+month1+"/"+(currYear);
                String todate = day1+"/"+month1+"/"+(currYear+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% }%>
		<%
            int[] array6 = vashaphalChartsCanvas(planetinBhav,period,lalKitabNew);
             %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart6" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
              languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
           else{
           chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart6");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString %>'; 
<%
      String mySyn6 = "";
      for(int i = 1 ;i<= 12;i++){
      if(i==12) {
      mySyn6 = mySyn6 + array6[i-1];  
      }else{
      mySyn6 = mySyn6 + array6[i-1] + ","; 
      }
      }

     mySyn6 = "1"+","+mySyn6;
    out.println("arrPlanets = new Array(" + mySyn6 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

  }  
  else {
   $('#chart6').hide();
}
   </script>
			</div> <%//***************End of canvas chart**************************** %>
		
</div>
     <div class="card table-panel mrt-20">

			<% if(currentMonth==0){ %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+1-1);
                String todate = day1+"/"+month1+"/"+(currYear+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% }else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+1);
                String todate = day1+"/"+month1+"/"+(currYear+1+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% } %>
		
			<%
           int[] array7 = vashaphalChartsCanvas(planetinBhav,period+1,lalKitabNew);
            %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart7" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
           else{
           chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart7");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString %>'; 
<%
      String mySyn7 ="";
      for(int i = 1 ; i<= 12 ; i++){
      if(i==12){
      mySyn7 = mySyn7 + array7[i-1] ;
      }else{
      mySyn7 = mySyn7 + array7[i-1] + ","; 
      }
      }

     mySyn7 = "1"+","+mySyn7;
     out.println("arrPlanets = new Array(" + mySyn7 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

  }  
  else {
   $('#chart7').hide();
}
   </script>
			</div> <%//***************End of canvas chart**************************** %>
	
</div>
     <div class="card table-panel mrt-20">

			<% if(currentMonth==0){ %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+2-1);
                String todate = day1+"/"+month1+"/"+(currYear+2);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%} else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+2);
                String todate = day1+"/"+month1+"/"+(currYear+2+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%}%>
		
			<%
            int[] array8 = vashaphalChartsCanvas(planetinBhav,period+2,lalKitabNew);
             %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart8" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
           else{
           chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart8");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString%>'; 
<%
      String mySyn8= "";
      for(int i = 1 ; i<=12 ;i++){
      if(i==12) { 
      mySyn8 = mySyn8 + array8[i-1];  
      }else{
      mySyn8 = mySyn8 + array8[i-1] + "," ;
      }
      }

     mySyn8 = "1"+","+mySyn8;
    out.println("arrPlanets = new Array(" + mySyn8 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

  }  
  else {
   $('#chart8').hide();
}
   </script>
			</div> <%//***************End of canvas chart**************************** %>
	
</div>
     <div class="card table-panel mrt-20">

			<% if(currentMonth==0) { %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+3-1);
                String todate = day1+"/"+month1+"/"+(currYear+3);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% }else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                 String fromdate = day1+"/"+month1+"/"+(currYear+3);
                 String todate = day1+"/"+month1+"/"+(currYear+3+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%} %>
		
			<%
           int[] array9 = vashaphalChartsCanvas(planetinBhav,period+3,lalKitabNew);
           %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart9" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
           else{
           chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart9");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString%>'; 
<%
      String mySyn9 ="";
      for(int i = 1; i<=12 ;i++){
      if(i==12) {
      mySyn9 = mySyn9 + array9[i-1];
      }else{
      mySyn9 = mySyn9 + array9[i-1] + ","; 
      } 
      }
      
     mySyn9 = "1"+","+mySyn9;
    out.println("arrPlanets = new Array(" + mySyn9 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
     myval="";

  }  
  else {
   $('#chart9').hide();
}
   </script>
				<%//***************End of canvas chart**************************** %>
			
	
</div>
<div class="card table-panel mrt-20">

			<% if(currentMonth==0){ %>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+4-1);
                String todate = day1+"/"+month1+"/"+(currYear+4);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%} else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+4);
                String todate = day1+"/"+month1+"/"+(currYear+4+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% }%>
		
			<%
            int[] array10 = vashaphalChartsCanvas(planetinBhav,period+4,lalKitabNew);
            %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart10" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
           else{
           chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart10");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString %>'; 
<%
      String mySyn10 = "";
      for(int i = 1 ;i<= 12;i++){
      if(i==12) {
      mySyn10 = mySyn10 + array10[i-1];  
      }else{
      mySyn10 = mySyn10 + array10[i-1] + ","; 
      }
      }
     mySyn10 = "1"+","+mySyn10;
     out.println("arrPlanets = new Array(" + mySyn10 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

  }  
  else {
   $('#chart10').hide();
}
          
   </script>
			</div> <%//***************End of canvas chart**************************** %>
	
</div>



<div class="card table-panel mrt-20">

			<% if(currentMonth==0) {%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+5-1);
                String todate = day1+"/"+month1+"/"+(currYear+5);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <%} else{%>
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%
                String fromdate = day1+"/"+month1+"/"+(currYear+5);
                String todate = day1+"/"+month1+"/"+(currYear+5+1);
                String[] datearr = {fromdate, todate};
                out.println(local.getDesiredString(varshChartHeading,datearr));
                %>
			</h4> <% } %>
		
			<%
           int[] array11 = vashaphalChartsCanvas(planetinBhav,period+5,lalKitabNew);
           %> <%//*************************Canvas Chart (neha)***************** %>
			<div align="center" class="mrt-10">
				<canvas id="chart11" width="600px" height="400px" class="responsive-canvas-m"></canvas>
				<script language="JavaScript" type="text/javascript">
             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            chartpref = "north";
            }
           else{
           chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart11");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString %>'; 
<%
      String mySyn11 ="";
      for(int i = 1 ;i<= 12;i++){
      if(i==12) {
      mySyn11 = mySyn11 + array11[i-1];  
      }else{
      mySyn11 = mySyn11 + array11[i-1] + "," ;
      }
      }

     mySyn11 = "1"+","+mySyn11;
     out.println("arrPlanets = new Array(" + mySyn11 + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
     myval="";

  }  
  else {
   myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
   $('#chart11').hide();
   $('#td1').hide();$('#td2').hide();$('#td3').hide();$('#td4').hide();
   $('#td5').hide();$('#td6').hide();$('#td7').hide();$('#td8').hide();
   $('#td9').hide();$('#td10').hide();$('#td11').hide();
}
 </script>
				<script language="JavaScript" type="text/javascript">
    $("#chartText").append(myval);
</script>

			</div> <%//***************End of canvas chart**************************** %>
		


 </div>
 
 
 
     </div>
     </div>
     </div>
     
     
  
<%!

//*********** Code for varshaphal for canvas ******* 
public int[] vashaphalChartsCanvas(int[] a_planetinBhav,int period , RLalKitab lalKitab){

    int[] planetinBhav2= new int[13];
    lalKitab.set(a_planetinBhav);
    int[] planetinBhavForVarshaphal = lalKitab.getAlteredKundli(period, 1);

    for(int i = 0 ;i<=8 ; i++){
        planetinBhav2[i] = planetinBhavForVarshaphal[i];
    }
    planetinBhav2[9] = 6;
    planetinBhav2[10] = 6;
    planetinBhav2[11] = 6;
    return planetinBhav2;
}
%>

<%@include file='lalkitab-footer.jsp'%>