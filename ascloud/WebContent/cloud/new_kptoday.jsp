<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.cslsoftware.printhoroscope.SouthChart"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page import="com.cslsoftware.printhoroscope.Chart"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%
SharedFunction sf = new SharedFunction();
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle kpTodayConstants = local.loadPropertiesFileNew("kptoday",languageCode);
MyResourceBundle plTrKpConstants = local.loadPropertiesFileNew("planetposition-transittodaychart-kpplanetcusp-kptoday",languageCode);
MyResourceBundle uraNepPlutoConstants = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday", languageCode);
                                                                     
%>
<div class="hdg-lg card">
 <h1><%=rBConstants.getString("MY_KP_TODAY") %></h1>	
</div>

<% 
    DesktopHoro ObjHoro= (DesktopHoro) session.getAttribute("HoroscopeObj");
    String name=ObjHoro.getName();
    String place=ObjHoro.getPlace();
    String timezone=ObjHoro.getTimeZone();
    String sex=ObjHoro.getMaleFemale();
    String SoB=ObjHoro.getSecondOfBirth();
    String MinOB=ObjHoro.getMinuteOfBirth();
    String HoB=ObjHoro.getHourOfBirth();
    int DoB=ObjHoro.getDayOfBirth();
    int MoB=ObjHoro.getMonthOfBirth();
    int YoB=ObjHoro.getYearOfBirth();
    String LatDegree=ObjHoro.getDegreeOfLattitude();
    String LongDegree=ObjHoro.getDegreeOfLongitude();
	
    String LongMinute=ObjHoro.getMinuteOfLongitude();
    String LatMinute=ObjHoro.getMinuteOfLattitude();
    String LongEW=ObjHoro.getEastWest();
    String LatNS=ObjHoro.getNorthSouth();
    String DST=ObjHoro.getDST();	
    //String ayanamsaval=sf.getAyan(ObjHoro);
    int ayanamsaval=Integer.parseInt(sf.getAyan(ObjHoro));
    
    DesktopHoro ObjKPHoro = new DesktopHoro();
	DesktopHoro ObjCurrHoro = new DesktopHoro();
	Constants ObjConst = new Constants();
	
	ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
    //SET THE VALUES FOR OBJECT ObjKPHoro 
	ObjKPHoro.setName(name);
    ObjKPHoro.setPlace(place);
	ObjKPHoro.setCompanyAddLine1 ("Delhi");
	ObjKPHoro.setCompanyName ("CSL Software Ltd");
	ObjKPHoro.setTimeZone(timezone);
	ObjKPHoro.setMaleFemale(sex);
	ObjKPHoro.setSecondOfBirth(SoB);
	ObjKPHoro.setMinuteOfBirth(MinOB);
	ObjKPHoro.setHourOfBirth(HoB);
	ObjKPHoro.setDayOfBirth(String.valueOf(DoB));
	ObjKPHoro.setMonthOfBirth(String.valueOf(MoB));
	ObjKPHoro.setYearOfBirth(String.valueOf(YoB));
	ObjKPHoro.setDegreeOfLattitude(LatDegree);
	ObjKPHoro.setDegreeOfLongitude(LongDegree);
	ObjKPHoro.setSecondOfLattitude("00");
	ObjKPHoro.setSecondOfLongitude("00");
	ObjKPHoro.setMinuteOfLongitude(LongMinute);
	ObjKPHoro.setMinuteOfLattitude(LatMinute);
	ObjKPHoro.setEastWest(LongEW);
	ObjKPHoro.setNorthSouth(LatNS);
	ObjKPHoro.setDST("00");
	ObjKPHoro.setLanguageCode(String.valueOf(languageCode));
	ObjKPHoro.setAyanamsaType(ayanamsaval);
	ObjKPHoro.initialize();

    //SET THE VALUES FOR OBJECT objCurrKPHoro 
    Calendar cal = Calendar.getInstance();
    
    ObjCurrHoro.setName(name);
    ObjCurrHoro.setPlace(place);
	ObjCurrHoro.setCompanyAddLine1 ("Delhi");
	ObjCurrHoro.setCompanyName ("CSL Software Ltd");
	ObjCurrHoro.setTimeZone(timezone);
	ObjCurrHoro.setMaleFemale(sex);
	ObjCurrHoro.setSecondOfBirth(String.valueOf(cal.get(Calendar.SECOND)));
	ObjCurrHoro.setMinuteOfBirth(String.valueOf(cal.get(Calendar.MINUTE)));
	ObjCurrHoro.setHourOfBirth(String.valueOf(cal.get(Calendar.HOUR_OF_DAY)));
	ObjCurrHoro.setDayOfBirth(String.valueOf(cal.get(Calendar.DAY_OF_MONTH)));
	ObjCurrHoro.setMonthOfBirth(String.valueOf(cal.get(Calendar.MONTH)+1));
	ObjCurrHoro.setYearOfBirth(String.valueOf(cal.get(Calendar.YEAR)));
	ObjCurrHoro.setDegreeOfLattitude(LatDegree);
	ObjCurrHoro.setDegreeOfLongitude(LongDegree);
	ObjCurrHoro.setSecondOfLattitude("00");
	ObjCurrHoro.setSecondOfLongitude("00");
	ObjCurrHoro.setMinuteOfLongitude(LongMinute);
	ObjCurrHoro.setMinuteOfLattitude(LatMinute);
	ObjCurrHoro.setEastWest(LongEW);
	ObjCurrHoro.setNorthSouth(LatNS);
	ObjCurrHoro.setDST("00");
	ObjCurrHoro.setLanguageCode(String.valueOf(languageCode));
	ObjCurrHoro.setAyanamsaType(ayanamsaval);
	ObjCurrHoro.initialize();
   //out.println(cal.getTime().getSeconds()+","+cal.getTime().getMinutes()+","+cal.getTime().getHours()+","+cal.get(Calendar.DAY_OF_MONTH)+","+cal.get(Calendar.MONTH)+1+","+cal.get(Calendar.YEAR));
	if(languageCode == 1)
	{
		ObjKPHoro.setLanguageCode("1");
		ObjCurrHoro.setLanguageCode("1");
        ObjKPHoro.initialize();
        ObjCurrHoro.initialize();
	}
	else
	{
		ObjKPHoro.setLanguageCode("0");
		ObjCurrHoro.setLanguageCode("0");
        ObjKPHoro.initialize();
        ObjCurrHoro.initialize();
	}
    
	 //Set myAstrologyObject=session("HoroscopeObj")
	int chartType = 0;
	Object obje = session.getAttribute("chartType");
	Chart objChart = null;
	Chart objChart1 = null;
    if(obje != null)
    {
    	if(obje.toString().equals("0"))
    	{
    		objChart=new NorthChart();
    		objChart1=new NorthChart();
    	}
    	else
    	{
    		objChart=new SouthChart();
    		objChart1=new SouthChart();
    		chartType = 1;
    	}
    }
       
    int[] rashiPosition = new int[13];
    double[] bhavaPositions = new double[13];
    double longitudeDifference;
    for(int j = 0 ; j<=11;j++){
       longitudeDifference = ObjKPHoro.getKPCuspLongitude(j + 1);
       if(longitudeDifference >= 360.0)
       {  
    	   longitudeDifference = longitudeDifference - 360.0 ;
       }
       bhavaPositions[j] = longitudeDifference;
      
       rashiPosition[j] = (int)(longitudeDifference / 30) + 1;
     
    }
    int[] rashiPositionnew =  new int[13];
    int[] bhavPositionnew =  new int[13];
    int[] bhavPosition =  new int[13];
    
   
     for(int k = 0; k<=11; k++){
         longitudeDifference = ObjCurrHoro.getKPPlanetLongitude(k + 1)+ ayanamsaval;
         
         //out.println(longitudeDifference+"<br/>");
         if(longitudeDifference >= 360.00 ){
 	        longitudeDifference = longitudeDifference - 360.00;
         }
         
         //Add new condition so that it will not crash when negative value will come.
         if(longitudeDifference<0){ 
     	    longitudeDifference = longitudeDifference+360.00;
         }
         
         bhavPosition[k] = sf.getPlanetBhavaPosition(longitudeDifference, bhavaPositions); // same functinality getKPPlanetBhavaPosition
         //out.println(bhavPosition[k]+"<br/>");
     }
     int[] RaashiNo = new int[13];
     for(int i = 0;i<=11;i++)
     {
    	 RaashiNo[i] = rashiPosition[i];
     }   		
     
//Modified Code For Raashi
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
 
//*********** CODE FOR KP CUSPS
int[] KPbhavPosition = new int[12];
double KPlongitudeDifference;
for(int i = 0; i<=11; i++){
	KPlongitudeDifference = ObjKPHoro.getKPPlanetLongitude(i + 1);
         
         if(KPlongitudeDifference >= 360.0 ){
        	 KPlongitudeDifference = KPlongitudeDifference - 360.0;
         }
         //Add new condition so that it will not crash when negative value will come.
         if(KPlongitudeDifference<0){ 
        	 KPlongitudeDifference = KPlongitudeDifference+360.0;
         }
         KPbhavPosition[i] = sf.getPlanetBhavaPosition(KPlongitudeDifference, bhavaPositions); // same functinality getKPPlanetBhavaPosition
         
     }
 
%>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R"> <%=rBConstants.getString("CUSP") %>&nbsp;<%=rBConstants.getString("CHART") %>  </h2>
<div id="chartText"></div>
				<div class="center mrt-10">
					<canvas id="Canvaskp" width="500px" height="400px"
						class="responsive-canvas"></canvas>						
					<script language="JavaScript" type="text/javascript">
var myval;
var languageCode = <%=languageCode%>;
var textcolor = COLOR_INFO;

if(<%=chartType%> ==0){
chartpref = "north";
}
else{
chartpref = "south";
}
if(window.HTMLCanvasElement) {
    var c=document.getElementById("Canvaskp");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
String mySyn3 = "";
for(int i = 0;i<=11;i++)
{
	mySyn3 = mySyn3 + KPbhavPosition[i]  + "," ;
}
mySyn3= mySyn3.replaceAll(",$","");

mySyn3 = myRashi[12]+","+mySyn3;
out.println("arrPlanets = new Array(" + mySyn3 + ");"); //(Asc, sun,moon,....pl)
out.println("lagna = " + myRashi[12]+";");  //(lagna


%>
    x1_canvas= 20;//10+40;
    y1_canvas= 5;
    x2_canvas= 490;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChartOthers(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets,lagna, Chart_Type, languageCode,true);  
      myval="";

          }  
else {
   $('#Canvaskp').hide();
}
</script>
				</div>
</div>
</div>

<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R"> <%=kpTodayConstants.getString("TODAYS_KP_CHART") %> </h2>
<div class="center mrt-10">
					<canvas id="CanvasTKP" width="500px" height="400px"
						class="responsive-canvas"></canvas>
						
					<script language="JavaScript" type="text/javascript">
var myval;
var languageCode = <%=languageCode%>;
var textcolor = COLOR_INFO;

if(<%=chartType%> =="0"){
chartpref = "north";
}
else{
chartpref = "south";
}
if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasTKP");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
String mySyn1 = "";
for(int i = 0;i<= 11;i++)
{
	mySyn1 = mySyn1 + bhavPosition[i]  + "," ;
}
mySyn1= mySyn1.replaceAll(",$","");

mySyn1 = myRashi[12]+","+mySyn1;
out.println("arrPlanets = new Array(" + mySyn1 + ");"); //(Asc, sun,moon,....pl)
out.println("lagna = " + myRashi[12]+";");  //(lagna

%>
    x1_canvas= 20;//10+40;
    y1_canvas= 5;
    x2_canvas= 490;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);
 
    PrintChartOthers(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets,lagna, Chart_Type, languageCode,true);  
      myval="";

          }  
else {
   $('#CanvasTKP').hide();
   $('#td1').hide();
   $('#td2').hide();
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

String[] myPlanetNames = new String[13];
String[] myPlanetDMS = new String[13];
String[] myPlanetRNSS = new String[13];
int[][] myArray = new int[10][12];
Hindi hindi = new Hindi();
			  
UtilDesktop objUtil = new UtilDesktop();
		 
    ayanamsaval = 0;
    myPlanetNames[1]=rBConstants.getString("SUN");
    myPlanetNames[2]=rBConstants.getString("MOON");
    myPlanetNames[3]=rBConstants.getString("MARS");										   
    myPlanetNames[4]=rBConstants.getString("MERCURY");					  
    myPlanetNames[5]=rBConstants.getString("JUPITER");					   
    myPlanetNames[6]=rBConstants.getString("VENUS");
    myPlanetNames[7]=rBConstants.getString("SATURN");
    myPlanetNames[8]=rBConstants.getString("RAHU");
    myPlanetNames[9]=rBConstants.getString("KETU");
    myPlanetNames[10]=uraNepPlutoConstants.getString("URANUS");
    myPlanetNames[11]=uraNepPlutoConstants.getString("NEPTUNE");
    myPlanetNames[12]=uraNepPlutoConstants.getString("PLUTO");
					  
	double planetLongitudeVal;																											   
    for(int i = 1;i<=12;i++)
    {
        planetLongitudeVal=ObjCurrHoro.getKPPlanetLongitude(i);
        if( planetLongitudeVal<0) {
            planetLongitudeVal=planetLongitudeVal+360.0;
        }
        myPlanetDMS[i] = hindi.unicode(objUtil.dms1((ObjCurrHoro.getKPPlanetLongitude(i)) + ayanamsaval), languageCode);       
        myPlanetRNSS[i] = local.getRNSSData(ObjCurrHoro.rnss(ObjCurrHoro.getKPPlanetLongitude(i)), "-", languageCode);
    }

    for(int i = 1;i<=9;i++)
    {
    	myArray[i] = ObjKPHoro.getKPPlanetSignification(i);
    } 

%>
<div class="row mrt-30 planet-table">
   <div class="col s12 l12 ui-btm ui-btm-zero">
      <div class="card table-panel rt-custom">
          <h4 class="vd-hdg br-amber-b amber lighten-5"><%=kpTodayConstants.getString("TODAYS_PLANET_POSITION") %></h4>
             <table class="highlight striped bordered ui-table ui-font responsive-table">
             <thead>
             <tr>
				<th><%=rBConstants.getString("PLANETS") %></th>
				<th><%=rBConstants.getString("DEGREE") %></th>
				<th><%=rBConstants.getString("RAS_NAK_SUB_SS") %></th>
				<th><%=plTrKpConstants.getString("RET_DIR") %></th>
				<th><%=rBConstants.getString("SIGNIFICATION") %></th>
			</tr>
			</thead>
			<% for(int icount= 1;icount<=9;icount++) { %>
			<tr>
				<td><%=myPlanetNames[icount]%>&nbsp;</td>
				<td><%=myPlanetDMS[icount]%>&nbsp;</td>
				<td><%=myPlanetRNSS[icount]%>&nbsp;</td>
				<td>
					<% if( ObjCurrHoro.isPlanetDirect(icount)) { %> <%=plTrKpConstants.getString("DIR") %>
					<% } else { %> <%=plTrKpConstants.getString("RET") %> <% }%>
				</td>
				<td>
					<%
    	int digit;
    
        for(int iJ = 0;iJ< 11;iJ++) 
        {
        	digit = 0;
        	if( myArray[icount][iJ] != 0) 
            {
              digit = myArray[icount][iJ];
            } 
            if(digit != 0)      
            	out.println(digit+" ");

		} 
    %> &nbsp;
				</td>
			</tr>
			<% }%>
             </table>
             </div>
             </div>
             </div>

