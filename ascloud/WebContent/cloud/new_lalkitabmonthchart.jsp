<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.Calendar"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");

MyResourceBundle rBLalKitabChart = local.loadPropertiesFileNew("lalkitabmonthchart",languageCode);
MyResourceBundle rBLalKitabWorksheetMonthChart = local.loadPropertiesFileNew("lalkitabworksheet2-lalkitabmonthchart",languageCode);
%>
<div class="hdg-lg card">
	<h1><%=rBLalKitabChart.getString("LALKITAB_MONTH_CHART") %></h1>	
</div>


<%
RLalKitab lalKitabNew = new RLalKitab();
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");

Calendar cal = Calendar.getInstance();

int currentYear =cal.get(Calendar.YEAR);
int baseYear = (int)(myAstrologyObject.getYearOfBirth());
int period = currentYear -  baseYear;
if(period == 0){
  period = 1;
}
//*****************************Get Birth Chart Planet Position Corresponding To Bhav Number
int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);
int[] newRashiNoCorrespondingToPlanets =  new int[12];
for(int i = 1;i<=12 ;i++){
    newRashiNoCorrespondingToPlanets[i - 1] = Astrology.rasiToBhava (arrPlanetsShodashvarga[0], arrPlanetsShodashvarga[i]);
}
//*******************************Get Planet Position in Bhav********************************


int[] planetinBhav =  new int[12];
for(int i=0; i<=8 ; i++){
    planetinBhav[i] = newRashiNoCorrespondingToPlanets[i];
    }
planetinBhav[9] = 6;
planetinBhav[10] = 6;
planetinBhav[11] = 6;

//********Set Bhav Position For Planet for Varshphal Kundali
lalKitabNew.set(planetinBhav);

//********Get Bhav Position For Planet for Varshphal Kundali
int YEAR_CHART_TYPE = 1;
		
//out.println(planetinBhav);		
int[] planetinBhavForVarshaphal = lalKitabNew.getAlteredKundli (period, YEAR_CHART_TYPE);

//********Set Bhav Position For Planet for Month Kundali
lalKitabNew.set(planetinBhavForVarshaphal);
%>
<%
//Dim period, DayOfBirth, YearOfBirth, monthofbirth, month2, currentMonth, currYear
int myValue = cal.get(Calendar.YEAR) - (int)(myAstrologyObject.getYearOfBirth()); 
if(myValue==0){
    period=0;
}else{
    period=myValue;
}
int currentMonth ;      
int dayOfBirth=myAstrologyObject.getDayOfBirth();
int yearOfBirth=myAstrologyObject.getYearOfBirth();
int monthOfBirth=myAstrologyObject.getMonthOfBirth();
int month2=cal.get(Calendar.MONTH);

if(month2<monthOfBirth) {
    period=period+0;
    currentMonth=0;
}else if(month2==monthOfBirth){
    period=period+1;
    currentMonth=1;
}else{
    currentMonth=1;
    period=period+1;
    yearOfBirth=yearOfBirth+1;
} 

int currYear = myValue + myAstrologyObject.getYearOfBirth();
String yearStr, fromYear,toYear;
int userYear;
//Dim fromyear , toyear
String[] yearArr =  null;
if(currentMonth==0){
   yearStr = rBLalKitabWorksheetMonthChart.getString("LK_VARSHPHAL_PERIOD_CHART_HEADING");
   fromYear = dayOfBirth + "/" + monthOfBirth +"/"+(currYear-1);
   toYear   =   dayOfBirth+"/"+monthOfBirth+"/"+(currYear);
   yearArr =  new String[] {fromYear,toYear};
   userYear = currYear-1;
}else{
   yearStr = rBLalKitabWorksheetMonthChart.getString("LK_VARSHPHAL_PERIOD_CHART_HEADING");
   fromYear = dayOfBirth+"/"+ monthOfBirth +"/"+(currYear);
   toYear   = dayOfBirth+"/"+monthOfBirth+"/"+(currYear+1);
   yearArr =  new String[] {fromYear,toYear};
   userYear = currYear;
}

String[] headArr = {"MANGLIK_HOUSE_NO1","MANGLIK_HOUSE_NO2","MANGLIK_HOUSE_NO3","MANGLIK_HOUSE_NO4","MANGLIK_HOUSE_NO5","MANGLIK_HOUSE_NO6","MANGLIK_HOUSE_NO7","MANGLIK_HOUSE_NO8","MANGLIK_HOUSE_NO9","MANGLIK_HOUSE_NO10","MANGLIK_HOUSE_NO11","MANGLIK_HOUSE_NO12"};
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
cal.set(Calendar.DATE,dayOfBirth);
cal.set(Calendar.MONTH,monthOfBirth-1);
cal.set(Calendar.YEAR,userYear);

//out.println(yearStr+","+yearArr[0]+","+yearArr[1]);
String yearheaderText = "<div class='hdg-content mrt-20'><h2>"+local.getDesiredString(yearStr,yearArr)+ " (" + period + " " + rBLalKitabWorksheetMonthChart.getString("YEAR_FULL") + ")"+"</h2></div>";
out.println(yearheaderText);

for (int chart= 1 ;chart<=12;chart++){
	%>
	
<div class="row mrt-30"> 
<div class="col s12 l12"> 
<div class="card ui-paragraph-style">


		<table align="center">
			<tr>
				<td align="center" id="td<%=chart%>">
					<p align="center">  <%             
                Date firstDate = cal.getTime();
                String date1 = sdf.format(firstDate);
                
                cal.add(Calendar.MONTH, 1);
                Date secondDate = cal.getTime();
                String date2  = sdf.format(secondDate);
                //out.println(date1+","+date2);
                String [] lKarr = {rBConstants.getString(headArr[chart-1]),date1, date2};
                out.println("<b>"+local.getDesiredString(rBLalKitabChart.getString("LK_KUNDALI_MONTH"),lKarr)+"</br>");
             %> </p>
				</td>
			</tr>
			<tr>
				<td>
					<%
                int[] planetinBhav1 = new int[13];
                planetinBhav1 = initializeMonthChartPlanet(lalKitabNew,chart);	
                //********************canvas chart for 1st month(Neha)*************************************
                 %>

					<div id="chartText"></div>
					<div align="center">
						<canvas id="Canvasmonth<%=chart%>" width="600px" height="400px" class="responsive-canvas-m"></canvas>
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
          var c=document.getElementById("Canvasmonth<%=chart%>");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
      String mySyn= "";
      for(int i = 1; i<= 12;i++){
      if(i==12){
      mySyn = mySyn + planetinBhav1[i-1];  
      }else{
      mySyn = mySyn + planetinBhav1[i-1] + ","; 
      }
      }

     mySyn = "1"+","+mySyn;
    out.println("arrPlanets = new Array(" + mySyn + ")"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;
    y1_canvas= 20;
    x2_canvas= 520;
    y2_canvas= 380;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

          }  
else {
   $('#Canvasmonth<%=chart%>').hide();
  //  myval = '<center><div align=center style=padding-top:5px;>Please upgrade browser</div></center>';
}
</script>

					</div>
				</td>
			</tr>
		</table>
		
		
		</div>
		</div>
		</div>
		

		<%
}

%>
		<%@include file='lalkitab-footer.jsp'%>
		<%!
public int[] initializeMonthChartPlanet(RLalKitab lalKitabNew , int num){
	int MONTH_CHART_TYPE = 2;
	int[] PlanetinBhavForChart = lalKitabNew.getAlteredKundli (num, MONTH_CHART_TYPE);
	return PlanetinBhavForChart;
}
%>