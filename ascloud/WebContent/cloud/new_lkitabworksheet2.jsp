<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.Enumeration"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<script type="text/javascript">
    function chk(g, kt) {
        if (isNaN(g.period.value)) {
            alert("Please enter positive and numeric value");
            g.period.focus();
            return false;
         }
        kt++;
        if (g.KundliType.value == '2' && (g.period.value < 1 || g.period.value > 12)) {

            alert("For month kundli period must be positive and less than 13");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '3' && (g.period.value < 1 || g.period.value > 31)) {

            alert("For Day kundli period must be positive and less than 31");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '4' && (g.period.value < 1 || g.period.value > 24)) {

            alert("For hour kundli period must be positive and less than 25");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '5' && (g.period.value < 1 || g.period.value > 60)) {

            alert("For minute kundli period must be positive and less than 61");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '6' && (g.period.value < 1 || g.period.value > 60)) {

            alert("For second kundli period must be positive and less than 61");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '7' && (g.period.value < 1 || g.period.value > 60)) {

            alert("For degree kundli period must be positive and less than 61");
            g.period.focus();
            return false;

        }
        return true;

        alert(kt);
    }
</script>

<%

Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBLalKitabWorksheet = local.loadPropertiesFileNew("lalkitabworksheet2",languageCode);
MyResourceBundle rBLalKitabWorksheetMonthChart = local.loadPropertiesFileNew("lalkitabworksheet2-lalkitabmonthchart",languageCode);

%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LAL_KITAB_WORKSHEET") %></h1>	
</div>

<%
int[] planetinBhav = new int[12];
int period;
int kundliType;
int langCode = Integer.parseInt(String.valueOf(session.getAttribute("languageCode")));
 
String[] maleficBenefic = new String[2];
maleficBenefic[0] = "<font color=red>"+ rBConstants.getString("MALEFIC") +"</font>";  
maleficBenefic[1] = rBConstants.getString("BENEFIC");

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
Calendar cal = Calendar.getInstance();

//first time all values are populated from DLL, next time onwards from form 
 String pl = request.getParameter("planet1");

 if( pl == null || pl.equals("")) {

   int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);
    int[] newRashiNoCorrespondingToPlanets =  new int[12];
    
    for(int i = 1 ; i<= 12 ; i++){
        newRashiNoCorrespondingToPlanets[i - 1] = Astrology.rasiToBhava(arrPlanetsShodashvarga[0], arrPlanetsShodashvarga[i]);
    }
    
    for(int i=0 ;i<=8; i++){
        planetinBhav[i] = newRashiNoCorrespondingToPlanets[i];
    }
    planetinBhav[9] = 6;
    planetinBhav[10] = 6;
    planetinBhav[11] = 6;
    
    
    int currentYear = cal.get(Calendar.YEAR);
    int baseYear = (int)(myAstrologyObject.getYearOfBirth());
    kundliType = 1;
    period = (int)(currentYear) - (int)(baseYear);
    if(period == 0){
      period = 1;
    }
    
 int dayOfBirth   = myAstrologyObject.getDayOfBirth();
 int yearOfBirth  = myAstrologyObject.getYearOfBirth();
 int monthOfBirth = myAstrologyObject.getMonthOfBirth();
 int monthOfBirth2= cal.get(Calendar.MONTH)+1;
 int day2= cal.get(Calendar.DAY_OF_MONTH);

    if(monthOfBirth2<=monthOfBirth && day2<=dayOfBirth){
     period=period+0;
    }else{
    period=period+1;
    }
    
}else{

    planetinBhav[0] = Integer.parseInt(request.getParameter("planet1"));
    planetinBhav[1] = Integer.parseInt(request.getParameter("planet2"));
    planetinBhav[2] = Integer.parseInt(request.getParameter("planet3"));
    planetinBhav[3] = Integer.parseInt(request.getParameter("planet4"));
    planetinBhav[4] = Integer.parseInt(request.getParameter("planet5"));
    planetinBhav[5] = Integer.parseInt(request.getParameter("planet6"));
    planetinBhav[6] = Integer.parseInt(request.getParameter("planet7"));
    planetinBhav[7] = Integer.parseInt(request.getParameter("planet8"));
    planetinBhav[8] = Integer.parseInt(request.getParameter("planet9"));
    planetinBhav[9] = 6;
    planetinBhav[10] = 6;
    planetinBhav[11] = 6;
    period = Integer.parseInt(request.getParameter("period"));
    kundliType = Integer.parseInt(request.getParameter("KundliType"));
  
}

%>

<%
//-------------------------------------------

UtilLalkitab lalKitabUtil = new UtilLalkitab();
RLalKitab lalKitabNew = new RLalKitab();
lalKitabNew.set(planetinBhav);

int[] planetinBhavForVarshaphal = lalKitabNew.getAlteredKundli (period, kundliType);
int[] planetinBhav2 =  new int[12];
for(int i = 0 ;i<= 8;i++){
    planetinBhav2[i] = planetinBhavForVarshaphal[i];
}
planetinBhav2[9] = 6;
planetinBhav2[10] = 6;
planetinBhav2[11] = 6;

String kundali_Type2 ="";
String kundali_Type = lalKitabNew.getChartTypeName(kundliType-1);
String kundali_Type1 = lalKitabNew.getChartTypeName(kundliType);
int KT =0;
if(request.getParameter("KundliType") !="" && request.getParameter("KundliType") !=null)
{
KT=Integer.parseInt(request.getParameter("KundliType"));
}
//int KT = Integer.parseInt(session.getAttribute("KundliType").toString());
if(KT!=7){
    kundali_Type2 = lalKitabNew.getChartTypeName(kundliType+1);  
   
}
String getStr = "";
String getStr1 = "";
String getStr2 = "";
//out.println(kundali_Type+","+kundali_Type1+","+kundali_Type2);

if(kundali_Type.toUpperCase().equals("YEAR")){
	getStr = rBLalKitabWorksheetMonthChart.getString((kundali_Type+"_FULL").toUpperCase());
	}
else if(!kundali_Type.equals(""))
{
	getStr = rBLalKitabWorksheet.getString((kundali_Type+"_FULL").toUpperCase());
	}

if( kundali_Type1.toUpperCase().equals("YEAR")){
	getStr1 = rBLalKitabWorksheetMonthChart.getString((kundali_Type1+"_FULL").toUpperCase());
	}
else if(!kundali_Type1.equals(""))
{
	getStr1 = rBLalKitabWorksheet.getString((kundali_Type1+"_FULL").toUpperCase());
}

if(kundali_Type2.toUpperCase().equals("YEAR")){
	getStr2 = rBLalKitabWorksheetMonthChart.getString((kundali_Type2+"_FULL").toUpperCase());
	}
else if(!kundali_Type2.equals(""))
{
	getStr2 = rBLalKitabWorksheet.getString((kundali_Type2+"_FULL").toUpperCase());
}


%>
<script>
   var kType=<%=kundliType%>;
</script>


<div class="row mrt-30">
<div class="col s12">
<div class="card hdg-content" id="Mhd">
	
	<%out.println(getVarshphalTimePeriod(myAstrologyObject ,cal , rBLalKitabWorksheetMonthChart));%>

<hr />

<div class="row mrt-30">
<div class="col s12 l12">

<h6 class="center">  <%out.println(getStr +" "+ rBLalKitabWorksheet.getString("CHARTT"));%>   </h6>

<div id="chartText"></div>
			<div align="center">
				<canvas id="chart1" width="600px" height="400px" class="responsive-canvas"></canvas>
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
          var c=document.getElementById("chart1");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=session.getAttribute("chartType")%>'; 
<%
      String mySyn ="";
      for(int i = 1 ;i <=12 ; i++){
      if(i==12){
      mySyn = mySyn + planetinBhav[i-1]; 
      }else{
      mySyn = mySyn + planetinBhav[i-1] + ","; 
      }
      }

     mySyn = "1"+","+mySyn;
    out.println("arrPlanets = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 85;//10+40;
    y1_canvas= 10;
    x2_canvas= 515;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

          }  
else {
   $('#chart1').hide();
    myval = '<center><div align=center style=padding-top:5px;>Please upgrade browser</div></center>';
}
</script>
			</div>


</div>

<div class="col s12 l12">

<h6 class="center">  <%out.println(getStr1 +" "+ rBLalKitabWorksheet.getString("CHARTT"));%> </h6>
<div id="chartText"></div>


<div align="center">
				<canvas id="chart2" width="600px" height="400px" class="responsive-canvas"></canvas>
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
          var c=document.getElementById("chart2");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=session.getAttribute("chartType")%>'; 
<%
      String mySyn1 = "";
      for(int i = 1; i<=12 ; i++){
      if(i==12){
      mySyn1 = mySyn1 + planetinBhav2[i-1];  
      }else{
      mySyn1 = mySyn1 + planetinBhav2[i-1] + ","; 
      }
      }

     mySyn1 = "1"+","+mySyn1;
     out.println("arrPlanets = new Array(" + mySyn1 + ");"); //(Asc, sun,moon,....pl)
%>
     x1_canvas= 85;//10+40;
    y1_canvas= 10;
    x2_canvas= 515;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, languageCode,true);  
      myval="";

          }  
else {
   
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
    $('#chart2').hide(); $('#Mhd').hide(); $('#td1').hide(); $('#td2').hide();
}
</script>
			</div> <script language="JavaScript" type="text/javascript">
    $("#chartText").append(myval);
</script>

</div>
</div>

</div>
</div>
</div>


<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-content">

<form method="get" action="lkitabworksheet2.asp" name="FrontPage_Form1" onsubmit="return chk(this,kType)">
	<input type="hidden" name="KundliType" value="<%=kundliType+1%>">
	<%
    for(int i = 1 ;i<= 9;i++){
    out.println("<input type=hidden name=planet" + i + " " + "value=" + planetinBhavForVarshaphal[i-1] + ">" + "\r");
    }
        %>
			<input type="hidden" name="planet10" value="7">
			<input type="hidden" name="planet11" value="7">
			<input type="hidden" name="planet12" value="7">
			
			
            
            
            
            
            <div class="col l3"></div>
            <div class="input-field col s12 l6">            
             <input type="text" name="period" size="5" maxlength="5">		
			<label><%
            if(kundliType!=7) {
               out.println(getStr2+" "+ rBLalKitabWorksheet.getString("CHARTT")); 
            }
            %>
            </label>
		 </div>
		  <div class="col l3">  </div>	
		  	  
		 
		 
 <div class="row center">  
 <div class="col s12"> 
 <%if(kundliType!=7) { %>    
				<input class="waves-effect waves-light btn amber darken-4 box-shadow" type="submit" value="<%out.println(rBLalKitabWorksheet.getString("GETV")+getStr2 +" "+ rBLalKitabWorksheet.getString("GET_CHART_VAL"));%>" ame="B1" /> 
				
				<input class="waves-effect waves-light btn amber darken-4 box-shadow" type="button" onclick="javascript:history.back()" value="<%=rBConstants.getString("GOBACK") %>" /> 
				<% }%> 
				<% if(kundliType == 7){ %>
				<input class="waves-effect waves-light btn amber darken-4 box-shadow" type="button" onclick="javascript:history.back()" value="<%=rBConstants.getString("GOBACK") %>" /> 
				<% }%>
 </div>
 </div>
</form>
</div>
<br />

<div class="card table-panel rt-custom">
<table class="highlight striped bordered responsive-table" id="ui-table">

<%//*********************End of canvas chart************************* %>
	<thead>
		
				<tr class="amber lighten-5">
					<th> <%=rBConstants.getString("PLANETS") %>
					</th>
					<th>&nbsp;</th>
					<th>
							<%
                            out.println(getStr +" "+ rBLalKitabWorksheet.getString("CHARTT")); 
                            %>
					</th>
					<th>&nbsp;</th>
					<th>
						<%
                            out.println(getStr1 +" "+ rBLalKitabWorksheet.getString("CHARTT"));
                            %>
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("JUPITER"),langCode)%>
					</td>
					<td><%= planetinBhav[4] %>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (5, planetinBhav[4])]%>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[4] %>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (5, planetinBhavForVarshaphal[4])]%>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("SUN"),langCode)%>
					</td>
					<td><%= planetinBhav[0]%>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (1, planetinBhav[0])] %>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[0] %>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (1, planetinBhavForVarshaphal[0])] %>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("MOON"),langCode) %>
					</td>
					<td><%= planetinBhav[1]%>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (2, planetinBhav[1])] %>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[1] %>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (2, planetinBhavForVarshaphal[1])]%>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("VENUS"),langCode) %>
					</td>
					<td><%= planetinBhav[5] %>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (6, planetinBhav[5])]%>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[5] %>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (6, planetinBhavForVarshaphal[5])]%>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("MARS"),langCode) %>
					</td>
					<td><%= planetinBhav[2] %>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (3, planetinBhav[2])] %>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[2] %>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (3, planetinBhavForVarshaphal[2])]%>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("MERCURY"),langCode)%>
					</td>
					<td><%=planetinBhav[3]%>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (4, planetinBhav[3])]%>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[3] %>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (4, planetinBhavForVarshaphal[3])]%>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("SATURN"),langCode) %>
					</td>
					<td><%= planetinBhav[6] %>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (7, planetinBhav[6])]%>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[6] %>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (7, planetinBhavForVarshaphal[6])]%>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("RAHU"),langCode) %>
					</td>
					<td><%= planetinBhav[7]%>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (8, planetinBhav[7])]%>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[7]%>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (8, planetinBhavForVarshaphal[7])]%>&nbsp;
					</td>
				</tr>
				<tr>
					<td><%=SharedFunction.ProperCaseL(rBConstants.getString("KETU"),langCode) %>
					</td>
					<td><%= planetinBhav[8]%>&nbsp;</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (9, planetinBhav[8])]%>&nbsp;
					</td>
					<td><%= planetinBhavForVarshaphal[8]%>&nbsp;
					</td>
					<td><%= maleficBenefic[lalKitabUtil.getMaleficBenafic (9, planetinBhavForVarshaphal[8])] %>&nbsp;
					</td>
				</tr>
			</tbody>
			
</table>

</div>
</div>
</div>

<%!
public String getVarshphalTimePeriod(DesktopHoro myAstrologyObject ,Calendar cal , MyResourceBundle rBLalKitabWorksheetMonthChart){
int period,currentMonth,currYear;
int YearOfBirth = 0;
String YearInfo;
int myValue = cal.get(Calendar.YEAR) - (int)(myAstrologyObject.getYearOfBirth());
    if(myValue==0){
        period=1;
    }else{
        period=myValue;
    }
    
    int dayOfBirth   = myAstrologyObject.getDayOfBirth();
    int yearOfBirth  = myAstrologyObject.getYearOfBirth();
    int monthOfBirth = myAstrologyObject.getMonthOfBirth();
    int month2= cal.get(Calendar.MONTH)+1;
	int day2= cal.get(Calendar.DAY_OF_MONTH);

    if(month2<=monthOfBirth && day2<=dayOfBirth){
        period=period+0;
        currentMonth=0;
    }else{
        currentMonth=1;
        period=period+1;
        YearOfBirth=YearOfBirth+1;
    }

    currYear = (int)myValue + (int)myAstrologyObject.getYearOfBirth();
    
    if(currentMonth==0){
       YearInfo	= "<h2 class='ml-10 mrt-10'>"+ rBLalKitabWorksheetMonthChart.getString("LK_VARSHPHAL_PERIOD_CHART")+" "+ dayOfBirth + "/" + monthOfBirth +"/"+(currYear-1) +" "+ rBLalKitabWorksheetMonthChart.getString("LK_TO") +" "+ dayOfBirth+"/"+monthOfBirth+"/"+(currYear)+ " (" + period + " " + rBLalKitabWorksheetMonthChart.getString("YEAR_FULL") + ")" +"</h2>";
    } else{
       YearInfo = "<h2 class='ml-10 mrt-10'>"+ rBLalKitabWorksheetMonthChart.getString("LK_VARSHPHAL_PERIOD_CHART")+" "+ dayOfBirth+"/"+ monthOfBirth +"/"+(currYear) +" "+ rBLalKitabWorksheetMonthChart.getString("LK_TO") +" "+ dayOfBirth+"/"+monthOfBirth+"/"+(currYear+1)+ " (" + period + " " + rBLalKitabWorksheetMonthChart.getString("YEAR_FULL") + ")" +"</h2>";
    }
   return YearInfo;
}


%>

