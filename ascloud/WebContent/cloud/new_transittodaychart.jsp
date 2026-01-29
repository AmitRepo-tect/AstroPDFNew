<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.printhoroscope.*"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<% 
Local local = new Local();
Hindi hindi = new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBTransitTodayChart = local.loadPropertiesFileNew("transittodaychart", languageCode);
MyResourceBundle rBPlanetTransit = local.loadPropertiesFileNew("planetposition-transittodaychart-kpplanetcusp-kptoday", languageCode);
MyResourceBundle rBShodWesVar = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday", languageCode);
                                                   

int ayanamsa1 = 0;
DesktopHoro objHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
DesktopHoro objCurrHoro = new DesktopHoro();
Constants objConst = new Constants();
Chart objChart,objChart1;	
objConst.setConstPath(getServletContext().getRealPath("/cloud/"));

GregorianCalendar gcalendar = new GregorianCalendar();
int currMonth = gcalendar.get(Calendar.MONTH),currDay = gcalendar.get(Calendar.DATE),currYear = gcalendar.get(Calendar.YEAR);
int nowHour = gcalendar.get(Calendar.HOUR_OF_DAY),nowMinute = gcalendar.get(Calendar.MINUTE),nowSecond = gcalendar.get(Calendar.SECOND);

objCurrHoro.setName("");
objCurrHoro.setPlace("");
objCurrHoro.setCompanyAddLine1 ("Delhi");
objCurrHoro.setCompanyName("CSL Software Ltd");
objCurrHoro.setTimeZone("5.5");
objCurrHoro.setMaleFemale(objHoro.getMaleFemale());
objCurrHoro.setSecondOfBirth(String.valueOf(nowSecond));
objCurrHoro.setMinuteOfBirth(String.valueOf(nowMinute));
objCurrHoro.setHourOfBirth(String.valueOf(nowHour));
objCurrHoro.setDayOfBirth(String.valueOf(currDay));
objCurrHoro.setMonthOfBirth(String.valueOf(currMonth+1));
objCurrHoro.setYearOfBirth(String.valueOf(currYear));
objCurrHoro.setDegreeOfLattitude("27");
objCurrHoro.setDegreeOfLongitude("78");
objCurrHoro.setSecondOfLattitude("00");
objCurrHoro.setSecondOfLongitude("00");
objCurrHoro.setMinuteOfLongitude("00");
objCurrHoro.setMinuteOfLattitude("09");
objCurrHoro.setEastWest("E");
objCurrHoro.setNorthSouth("N");

objCurrHoro.setDST("00");
int langCode = Integer.parseInt(String.valueOf(session.getAttribute("languageCode")));
if(langCode == 1){
	objCurrHoro.setLanguageCode("1");  //Hindi languagecde
}
else{                
	objCurrHoro.setLanguageCode("0");  //English languagecde
}

objCurrHoro.setAyan(ayanamsa1);
objCurrHoro.initialize();

int chartType = getSessionInt(session, "chartType"); 
if(chartType==0){
	objChart = new NorthChart();
}
else{
	objChart = new SouthChart();
}

if(chartType==0){
	objChart1 = new NorthChart();
}
else{
	objChart1 = new SouthChart();
}   

//-----------------##Code Of Lagna and transit Chart##------------------
//-----------Code For Draw raashi---------
//Use array RaashiNo For Raashi & RaashiNoCorrespondingToPlanets1
//For Planet number.
int[] arrPlanetsShodashVarga = new int[13],transitArrPlanetsShodashVarga = new int[13];
int[] raashiNoCorrespondingToPlanets1 = new int[13],tempRaashi = new int[13],returnRaashiNo = new int[12],myRashi = new int[13];

arrPlanetsShodashVarga = objHoro.getPositionForShodasvarg(0); 
transitArrPlanetsShodashVarga = objCurrHoro.getPositionForShodasvarg(0);

for(int k=0;k<=12;k++){
   raashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashVarga[k];   
}

returnRaashiNo = getRaashi1(raashiNoCorrespondingToPlanets1[0]);
  
int count=0;
for(int i=0;i<=12;i++){ 
    if(returnRaashiNo[i]>=1){
    	tempRaashi[count]=returnRaashiNo[i];
     	count=count+1;
    }
}
 int mycount = count, mycount2=count; 
 for(int k=0;k<=mycount-1;k++){
   tempRaashi[mycount2]=returnRaashiNo[k];   
 }
  
 for(int m=0;m<=11;m++){
   myRashi[m+1]=tempRaashi[m]+1;
 }
//--------Code To Draw the Planets----------
int[] planetNo = new int[13], transitPlanetNo=new int[13];

for(int n=1;n<=12;n++){
	planetNo[n-1] = arrPlanetsShodashVarga[n];
   	transitPlanetNo[n-1] = transitArrPlanetsShodashVarga[n];
}
  
int detect=tempRaashi[0]-1;
for(int p=0;p<=11;p++){
   planetNo[p] = planetNo[p]-detect;
   transitPlanetNo[p] = transitPlanetNo[p]-detect;
   if(planetNo[p]<=0){
	   planetNo[p] = planetNo[p]+12;
   }
   if(transitPlanetNo[p]<=0){
	   transitPlanetNo[p] = transitPlanetNo[p]+12;
   }
}
%>

<div class="hdg-lg card">
	<h1><%=rBTransitTodayChart.getString("TRANSIT_GOCHAR_TODAY") %></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card vd-panel"> 
<h4 class="vd-hdg amber lighten-5 br-amber-b"> <%=rBConstants.getString("LAGNA_CHART") %> </h4>
<div id="chartText"></div>
			<div align="center">
				<canvas id="chart1" width="500px" height="360px" class="respnv-cnv-mw"></canvas>
				
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if('<%=session.getAttribute("chartType")%>' =="0"){
            chartpref = "north";
            }
            else{
            chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart1");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
      String mySyn ="";
      for(int i = 1;i<= 12;i++){
      if(i==12) {
      mySyn = mySyn + planetNo[i-1];
      }else{
      mySyn = mySyn + planetNo[i-1] + ","; 
      }
      }

      
     mySyn = myRashi[12]+","+mySyn;
     out.println("arrPlanets = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl)
     out.println("lagna = " + myRashi[12]+";");  //(lagna

%>
    x1_canvas= 20;//10+40;
    y1_canvas= 20;
    x2_canvas= 480;//320+75;
    y2_canvas= 350;//300-20;
    SetFontSize(14);    
 
    PrintChartOthers(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets,lagna, Chart_Type, languageCode,true);  
      myval="";

          }  
else {
   $('#chart1').hide();
    //myval = '<center><div align=center style=padding-top:5px;>Please upgrade browser</div></center>';
}
</script>

			</div>
</div>
</div>


<div class="col s12 l12">
<div class="card vd-panel"> 
<h4 class="vd-hdg amber lighten-5 br-amber-b"> <%=rBConstants.getString("TRANSIT_CHART") %> </h4>

<div align="center">
				<canvas id="chart2" width="500px" height="360px" class="respnv-cnv-mw"></canvas>
				
				<script language="JavaScript" type="text/javascript">

             languageCode = <%=session.getAttribute("languageCode")%>;
             if (languageCode=="")
              {
            	 languageCode =0;
              }
             var textcolor = COLOR_INFO;

            if('<%=session.getAttribute("chartType")%>' =="0"){
            chartpref = "north";
            }
          else{
          chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart2");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
      String mySyn1 ="";
      for(int i = 1 ;i<= 12;i++){
      if(i==12)  {
      mySyn1 = mySyn1 + transitPlanetNo[i-1];  
      }else{
      mySyn1 = mySyn1 + transitPlanetNo[i-1] + ","; 
      }
      }

     mySyn1 = myRashi[12]+","+mySyn1;
     out.println("arrPlanets = new Array(" + mySyn1 + ");"); //(Asc, sun,moon,....pl)
     out.println("lagna = " + myRashi[12]+";");  //(lagna

%>
    x1_canvas= 20;//10+40;
    y1_canvas= 20;
    x2_canvas= 480;//320+75;
    y2_canvas= 350;//300-20;
    SetFontSize(14);    
 
    PrintChartOthers(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets,lagna, Chart_Type, languageCode,true);  
      myval="";

          }  
else {
   $('#chart2').hide();$('#td1').hide();$('#td2').hide();
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
          
</script>
			</div> <script language="JavaScript" type="text/javascript">
    $("#chartText").append(myval);
</script>
</div>
</div>
</div>

<%
    int birthStar = objHoro.getNakshatra();
    int transitStar = objCurrHoro.getNakshatra();
    int taraDiff = transitStar - birthStar;
    if(taraDiff < 0 ){
    	taraDiff = taraDiff + 27;
    }
    int finalTara = taraDiff % 9;
    String[] arrOfTaraValue ={"JANMA","SAMPAT","VIPAT","KSHEMA","PRETYERI","SAADHAK","VADH","MAITREE","ADHI_MAITREE"};
    String[] arrOfTaraProperties = {"NOT_GOOD","VERY_GOOD_MASTROSAGE","BAD_MASTROSAGE","GOOD_MASTROSAGE","NOT_GOOD","VERY_GOOD_MASTROSAGE","TOTALLY_BAD","GOOD_MASTROSAGE","GOOD_MASTROSAGE"};
    String[] arrOfTaraRamedies = {"TARA_RAMEDY_FIRST","","TARA_RAMEDY_SECOND","","TARA_RAMEDY_FIFTH","","TARA_RAMEDY_SEVENTH","",""};

   %>
   
   <%@include file='ui-control/ad-content-area.jsp'%>
   
<div class="row mrt-30">

<div class="col s12 l12">
<div class="card table-panel rt-custom">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBTransitTodayChart.getString("TARA_WITH_RAMEDIES_HEADING") %></h4>
<table class="highlight striped bordered ui-table ui-font">	
<thead>
<tr>
		<th class="cellhead">
			<%=rBConstants.getString("TARAA_NAME")%>
		</th>
		<th class="cellcontent">
			<%try{ %> <%=rBTransitTodayChart.getString(arrOfTaraValue[finalTara])+" ("+rBTransitTodayChart.getString(arrOfTaraProperties[finalTara])+")" %>
			<%
                 }
            catch(Exception e){%> <%=rBTransitTodayChart.getString(arrOfTaraValue[finalTara])+" ("+rBConstants.getString(arrOfTaraProperties[finalTara])+")" %>
			<% } %>

		</th>
	</tr>
	</thead>
	<tbody>

	<% if(!arrOfTaraRamedies[finalTara].equals("")){ %>
	<tr>
		<td><%=rBTransitTodayChart.getString("RAMEDIES") %></td>
		<td><%=rBTransitTodayChart.getString(arrOfTaraRamedies[finalTara]) %></td>
	</tr>
	<%}%>
	</tbody>
</table>



</div>


<%
   int[][] ashtakVargaBindu = new int[12][12];

	for(int q=0;q<=6;q++){
		for(int r=0;r<=11;r++){
			ashtakVargaBindu[q][r] = objHoro.getAshtakvargaBinduForSignAndPlanet(q,r);
		}
	}
    %>
    
    </div>
</div>

<div class="row mrt-30">
<div class="col s12 l12">

<div class="card table-panel rt-custom">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBTransitTodayChart.getString("ASHTAKVARGA_POINTS_FOR_TRANSIT") %></h4>
<table class="highlight striped bordered ui-table ui-font responssive-table">

	<%	
	for(int s=0;s<=12;s++){  
        %>
	<tr>
		<%
		 if(s==0){
            %>
	</tr>
	
	</table>
	
	<table class="highlight striped bordered responsive-table ui-table ui-font">
	
<thead> 
<tr>
		<th class="cellhead"><%=rBConstants.getString("PLANETS")%></th>
		<th class="cellhead"><%=rBConstants.getString("RASHI")%></th>
		<th class="cellhead"><%=rBConstants.getString("LONGITUDE")%></th>
		<th class="cellhead"><%=rBConstants.getString("NAKSHATRA")%></th>
		<th class="cellhead"><%=rBPlanetTransit.getString("RET_DIR")%></th>
		<th class="cellhead"><%=rBTransitTodayChart.getString("AVPOINTS")%></th>
	</tr>
	</thead>
	<tr>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getPlanetName(0), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getAscendentSignName(), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getAscendentRasiDms(), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getAscendentNakshatraName(), languageCode)%>
		</td>
		<td class="cellcontent">&nbsp;</td>
		<td class="cellcontent">&nbsp;</td>
		<%
		 }  else if (s >=8) {
       %>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getPlanetName(s),languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getPlanetaryRasiName(s), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getPlanetaryRasiDms(s), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getNakshatraNameForPlanet(s), languageCode)%>
		</td>
		<td class="cellcontent">&nbsp;</td>
		<td class="cellcontent">&nbsp;</td>
		<%
		 }
		else{
            %>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getPlanetName(s), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getPlanetaryRasiName(s), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getPlanetaryRasiDms(s), languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(objCurrHoro.getNakshatraNameForPlanet(s), languageCode)%>
		</td>
		<td class="cellcontent">
			<% 	if(objCurrHoro.isPlanetDirect(s)){            		   
			    		out.println(rBPlanetTransit.getString("DIR")); 
               		}
             		else{ 
             			out.println(rBPlanetTransit.getString("RET")); 
               		}
               %>
		</td>
		<td class="cellcontent">
			<%
                out.println(ashtakVargaBindu[s-1][(int)(objCurrHoro.getPlanetaryRasi(s))]);
                %>
		</td>
		<%
		}
	}
            %>
	</tr>
</table>
</div>

   </div>
   </div> 

<!-- <table  cellSpacing="0" cellPadding="0" width="100%" border="1" style="border-collapse: collapse"-->


<%
String[] myPlanetNames =  new String[13];

myPlanetNames[1]=rBConstants.getString("SUN");
myPlanetNames[2]=rBConstants.getString("MOON");
myPlanetNames[3]=rBConstants.getString("MARS");										   
myPlanetNames[4]=rBConstants.getString("MERCURY");				  
myPlanetNames[5]=rBConstants.getString("JUPITER");					   
myPlanetNames[6]=rBConstants.getString("VENUS");
myPlanetNames[7]=rBConstants.getString("SATURN");
myPlanetNames[8]=rBConstants.getString("RAHU");
myPlanetNames[9]=rBConstants.getString("KETU");
myPlanetNames[10]=rBShodWesVar.getString("URANUS");
myPlanetNames[11]=rBShodWesVar.getString("NEPTUNE");
myPlanetNames[12]=rBShodWesVar.getString("PLUTO");
 //Dim planetLongitudeVal
               UtilDesktop objUtil = new UtilDesktop();
               
                double planetLongitudeVal;
                String[] myPlanetDMS = new String[13];
                String[] myPlanetRNSS = new String[13];

                if(languageCode != 1)
                {
                	objHoro.setLanguageCode("0");
                    objHoro.initialize();
                }
                for(int i = 1 ;i<=12;i++){
                    planetLongitudeVal =objHoro.getKPPlanetLongitude(i);              
                    if(planetLongitudeVal<0 ){
                  	    planetLongitudeVal=planetLongitudeVal+360.0;
                    }
                    myPlanetDMS[i] = objUtil.dms1((objHoro.getKPPlanetLongitude(i)) + ayanamsa1);
                   // myPlanetRNSS[i] = local.getRNSSData(objHoro.rnss(objHoro.getKPPlanetLongitude(i)), "-", Integer.parseInt(String.valueOf(session.getAttribute("languagecode"))));
                   
                    myPlanetRNSS[i] = local.getRNSSData(objHoro.rnss(objHoro.getKPPlanetLongitude(i)), "-", languageCode);
                }

 %>

 <div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel">

<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBTransitTodayChart.getString("KP_PLANETS")%></h4>
<% String[]  planetarray = {"SUN", "MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KETU"};%>
<table class="highlight striped bordered ui-table ui-font">
<thead>
<tr>
		<th class="cellhead"><%=rBConstants.getString("PLANETS") %></th>
		<th class="cellhead"><%=rBConstants.getString("DEGREE") %></th>
		<th class="cellhead"><%=rBConstants.getString("RAS_NAK_SUB_SS") %></th>
		<th class="cellhead"><%=rBPlanetTransit.getString("RET_DIR")%></th>
	</tr>
	</thead>
	<% for(int i= 1 ;i<= 12;i++){ %>
	<tr>
		<td class="cellcontent"><%=myPlanetNames[i]%></td>
		<td class="cellcontent"><%=hindi.unicode(myPlanetDMS[i], languageCode)%>
		</td>
		<td class="cellcontent"><%=hindi.unicode(myPlanetRNSS[i], languageCode).replace(".","-")%>
		</td>
		<td class="cellcontent">
			<% if(objHoro.isPlanetDirect(i)==true){ %> <%=rBPlanetTransit.getString("DIR")%>
			<% }else {%> <%=rBPlanetTransit.getString("RET")%> <%}%>
		</td>
	</tr>
	<%}%>
</table>
</div>
</div>
</div>







	<%@include file='calculations-footer.jsp'%>

<div style="padding-bottom: 20px;"></div>
<%!
public int getSessionInt(HttpSession session, String attributeName)
{
	int returnValue = 0;
	Object obj = session.getAttribute(attributeName);
	if(obj != null && !obj.equals(""))
	{
		returnValue = Integer.parseInt(obj.toString());
	}
	return returnValue;
}

	public int[] getRaashi1(int ascendent)
    {
		int[] raashiNo = new int[13];
		raashiNo[0] = ascendent;
		int i=0;
		int loopLimit = 11-ascendent;
	   	for(i=0;i<=loopLimit;i++){
		   raashiNo[i + 1] = raashiNo[i] + 1;
	   	}
	   	int loopLimit1 = 10 - i;
	 	for(int j=0;j<=loopLimit1;j++){
			raashiNo[i + 1] = j + 1;
			i = i + 1;
	 	}
	 	return(raashiNo);
    }
    %>