<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%@include file='/cloud/kp_south.jsp'%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Free Kundli Software Online, Janam Kundli, Prashna Kundli, KP Horary Astrology Software</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="pragma" content="no-cache" />
    <link rel='stylesheet' type='text/css' href='css/stylesheet.css'>
</head>
<body>

<%
 
	String AyanamsaInSession = SharedFunction.getAyan(myAstrologyObject);
	// myAstrologyObject.setAyanamsaType(1);
	 myAstrologyObject.setAyan(1);
	 myAstrologyObject.initialize();
	 //UtilDesktop objUtil = new UtilDesktop();
	 
	 int ayanamsa = 0;
	 
	 
    int[] rashiPosition = new int[12];
    double[] bhavaPositions = new double[12];

    for(int i = 0;i<=11;i++)
    {
      double longitudeDifference = myAstrologyObject.getKPCuspLongitude(i + 1) + ayanamsa;
      if(longitudeDifference > 360)
   	  {
   	  	longitudeDifference = longitudeDifference - 360;
   	  }
      bhavaPositions[i] = longitudeDifference;
      rashiPosition[i] = (int)(longitudeDifference / 30) + 1;
    }

    int[] bhavPosition = new int[12];
    int[] RasiOfPlanet = new int[12];
    SharedFunction sf = new SharedFunction();

    for(int i = 0;i<=11;i++)
    {
      double longitudeDifference = myAstrologyObject.getKPPlanetLongitude(i + 1) + ayanamsa;
      RasiOfPlanet[i] = (int)(longitudeDifference/30)+1;
      if(longitudeDifference > 360)
   	  {
   	  	longitudeDifference = longitudeDifference - 360;
   	  } 
      bhavPosition[i] = sf.getPlanetBhavaPosition(longitudeDifference, bhavaPositions);
    }
     //Call getRaashiPosition(rashiPosition)
		int[] RaashiNo =  new int[13];
        for(int l=0 ;l<12;l++)
        {
     	   RaashiNo[l]=   rashiPosition[l];
        }
        int[] tempraashi =  new int[12];
	 int count=0;
	for(int i=0;i<12;i++)
	{
	    if( RaashiNo[i]>=1)
	    {
	     tempraashi[count]=RaashiNo[i];
	     count=count+1;
	    }
	}
	 int mycount=count;
	 int mycount2=count;
	 for(int i=0;i<mycount-1;i++)
	 {
	   tempraashi[mycount2-1]=RaashiNo[i];
	 }	    
	 int[] myRashi =  new int[12];
	 for(int i=0;i<=11;i++)
	 {
	   myRashi[i]=tempraashi[i]+1;
	 } 

	 //This is to set lagna at 0th position.
	 int[] bhavPositionnew =  new int[13];
	 for(int k = 0 ;k<= 11;k++){
         bhavPositionnew[k+1] = bhavPosition[k];
      }
	 bhavPositionnew[0] = rashiPosition[0];
	
	//dim x,y,x1,y1,x2,y2,q1,r1,q2,r2,W1,W2,H1,H2,z,ns,ew,CurrentX,CurrentY,avi 
	String[] myPlanetNames = new String[13];

	String spacebetweentwowords = " ";

	   myPlanetNames[1]="SU";
	   myPlanetNames[2]="MO";
	   myPlanetNames[3]="MA";									   
	   myPlanetNames[4]="ME";					  
	   myPlanetNames[5]="JU";					   
	   myPlanetNames[6]="VE";
	   myPlanetNames[7]="SA";
	   myPlanetNames[8]="RA";
	   myPlanetNames[9]="KE";
	   myPlanetNames[10]="UR";
	   myPlanetNames[11]="NE";
	   myPlanetNames[12]="PL";
	   
      String[] myArrayNo = new String[12];
			myArrayNo[0] = "I";
			myArrayNo[1] = "II";
			myArrayNo[2] = "III";
			myArrayNo[3] = "IV";
			myArrayNo[4] = "V";
			myArrayNo[5] = "VI";
			myArrayNo[6] = "VII";
			myArrayNo[7] = "VIII";
			myArrayNo[8] = "IX";
			myArrayNo[9] = "X";
			myArrayNo[10] = "XI";
			myArrayNo[11] = "XII";

			String UserName = Util.safestr(session.getAttribute("User_Id"));//earlier it was userid
			if(!UserName.equals("")) 
		        	out.println("Web Address: http://astrosage.com/ch/" + UserName + "<br>" );
			 
				int chartType= Util.safeInt(session.getAttribute("chartType"));
		%>
		<canvas id="CanvasKpPCusp" width="600px" height="400px"
					class="ui-canvas"></canvas>
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
    mySyn2 = mySyn2 + rashiPosition[i] +"," ;
}

mySyn = mySyn + bhavPositionnew[12] ;
mySyn1 = mySyn1 + rashiPosition[11] ;
mySyn2 = mySyn2 + rashiPosition[11]; 
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
<br />

<div class="textad">
	<b>Basic Details:</b><br> 
        <table><tr><td><b>Sun Rise:</b></td>
	<td><%=myAstrologyObject.getSunRiseTimeHms()%></td></tr>

        <tr><td><b>Sun Set:</b></td>
       <td><%=myAstrologyObject.getSunSetTimeHms()%></td></tr>
       <tr><td><b>Tithi:</b></td>
        <td><%=SharedFunction.ProperCase(myAstrologyObject.getTithiName()) %></td></tr>
      <tr><td><b>Yoga:</b></td>
      <td><%=SharedFunction.ProperCase(myAstrologyObject.getYoganame())%></td></tr>


        <tr><td><b>Karan:</b></td>
        <td><%=SharedFunction.ProperCase(myAstrologyObject.getKaranName())%></td></tr>
       <tr><td><b>Lagna:</b></td>
       <td><%=myAstrologyObject.getAscendentSignName()%></td></tr>
       <tr><td><b>Lagna Lord:</td></b>
        <td><%=myAstrologyObject.getLagnaLordName()%></td></tr>
        <tr><td><b>Rasi:</b></td>
        <td><%=myAstrologyObject.getRasiName()%></td></tr>
       <tr><td><b>Rasi Lord:</td></b>
       <td><%=myAstrologyObject.getRasiLordName()%></td></tr>
     <tr><td><b>Nakshatra:</td></b>
        <td><%=SharedFunction.ProperCase(myAstrologyObject.getNakshatraName()) + "-" + myAstrologyObject.getPadaOfPlanet(2)%></td></tr>
        <tr><td><b>Nskshatra Lord:</b></td>
        <td><%=myAstrologyObject.getNakshatraLordName()%></td></tr>


       <tr><td><b>Name:</b></td>
        <td><%=myAstrologyObject.getName()%></td></tr>
        <tr><td><b>Gender:</b></td>
        <td><%=myAstrologyObject.getMaleFemale()%></td></tr>
        <tr><td><b>Date:</b></td>
        <td><%=myAstrologyObject.getDayOfBirth() + " : " +	myAstrologyObject.getMonthOfBirth() +" : "+	myAstrologyObject.getYearOfBirth() %></td></tr>
        <tr><td><b>Day:</b></td>
        <td><%=myAstrologyObject.getWeekdayName()%></td></tr>
        <tr><td><b>Time:</b></td>
        <td><%=myAstrologyObject.getHourOfBirth() + " : " +	myAstrologyObject.getMinuteOfBirth() + " : " +  myAstrologyObject.getSecondOfBirth() %></td></tr>
        <tr><td><b>SID:</b></td>
        <td><%=myAstrologyObject.getSiderealTimeHms()%></td></tr>


<% int ns = 0;
int ew = 0;
%>
        <tr><td><b>Latitude:</b></td>
        <td><%=myAstrologyObject.getDegreeOfLattitude() + " : " + myAstrologyObject.getMinuteOfLattitude() + " : " +ns %></td></tr>
        <tr><td><b>Longitude:</b></td>
        <td><%=myAstrologyObject.getDegreeOfLongitude() + " : " + myAstrologyObject.getMinuteOfLongitude() + " : " +ew%></td></tr>
        <tr><td><b>Place:</b></td>
        <td><%=myAstrologyObject.getPlace()%><br> 

        <tr><td><b>Ayanamsa Type:</b></td>
        <td>KP</td></tr>
        <tr><td><b>Ayanamsa Val:</b></td>
        <td><%=objUtil.dms1(myAstrologyObject.getKPAyanamsaLongitude())%></td></tr>
        <tr><td><b>Bal. Dasa:</b></td>
        <td><%=myAstrologyObject.getBalanceOfDasa()%></td></tr>

</table>
</div>
<br />

<div class="textad">
<%
	/*Dim planetNames(12)  
				 Dim iCount,iJ
				 Dim myArray(9)
				 
				 Dim  planetCount , bhavaCount , readValue 
               Dim myArrayNo(12)
               Dim BhavArray(12, 12)
               Dim tempPlanet
               
               Dim myArrayHeading(6)
               Dim myArrayValue(6) */ 
  	  int[][] myArray = new int[10][];         
       for(int i = 0;i<9;i++)
       {
           myArray[i] = myAstrologyObject.getKPPlanetSignification(i+1);
       }
%>
       <b>Planet Signification:</b><br>
        <table><tr><td><b>Planets</b></td>
        <td><b>Houses</b></td></tr>
<%
   for(int icount = 0;icount<9;icount++)
   {
	   %>
        <tr><td><%=myPlanetNames[icount+1]%></td><td>
	  <%   
	  String fDigit = "";
        for(int iJ = 0;iJ<=11;iJ++)
        {
          if( myArray[icount][iJ] == 0)
            break;
          else
          {
            int digit=myArray[icount][iJ];
            
            fDigit = String.valueOf(digit);
          } 
%>
          <%=fDigit + " " %>
		<%
		}
        %>
            </td></tr>


    <% } %>
    </table>
</div>
<br />

<div class="textad">
<%
/*dim x,y

'Response.Write ("session="&session("userid")) & "<br>"
           'declare variable
           Dim planetNames(12)  
			 Dim iCount,iJ
			 Dim myArray(9)	

			 
			 Dim  planetCount , bhavaCount , readValue 

           Dim BhavArray(12, 12)
           Dim tempPlanet
           ' Variables For Ruling Planets
           Dim myArrayHeading(6)
           Dim myArrayValue(6)  
	          'Set myAstrologyObj=session("HoroscopeObj")

          '##SUMMARY will show Planet's Signification   */   
          
          int[][] BhavArray = new int[20][20];

			
       for(int i = 1;i<=9;i++)
    	   myArray[i] = myAstrologyObject.getKPPlanetSignification(i);
       
		for(int planetCount = 1;planetCount<=9;planetCount++)
		{
			for(int bhavaCount = 0;bhavaCount<=11;bhavaCount++)
			{
			    int readValue = myArray[planetCount][bhavaCount];
			    
			    if( readValue == 0) 
			    	break;
			    
			    BhavArray[readValue - 1][planetCount - 1] = planetCount;
			}
		}

%>


     <b>Significators of Houses:</b><br>
    <table><tr><td><b>House</b></td>
    <td><b>Planets</b></td></tr>

<%

	 for(int icount =0;icount<=11;icount++)
	 {
		 %>
	 
    <tr><td><%=myArrayNo[icount]%></td><td>
    <%
   for(int iJ = 0;iJ<=11;iJ++)
   {
	   
   String tempPlanet = "";
      if(BhavArray[icount][iJ] != 0 && !myPlanetNames[(int)(BhavArray[icount][iJ])].equals(""))
    	  tempPlanet=myPlanetNames[(int)(BhavArray[icount][iJ])];
     
   %>
   
    <%=tempPlanet+spacebetweentwowords%>
 
   

  <% } %>

   </td></tr>

<% } %>
</table>
</div>
<br />

<div class="textad">
	<%
		 
		for(int i = 0;i<9;i++)
		{
		     myArray[i] = myAstrologyObject.getKPPlanetSignification(i);
		}
		
		for(int planetCount = 0;planetCount<9;planetCount++)
		{
			for(int bhavaCount = 0;bhavaCount<11;bhavaCount++)
			{
				int readValue = myArray[planetCount][bhavaCount];
				if(readValue == 0)
					break;
			    BhavArray[readValue - 1][planetCount - 1] = planetCount;
			}
		}
		String[] myArrayValue = new String[7];
		myArrayValue[0] = SharedFunction.ProperCase(myAstrologyObject.getKPAscendentNakshatraLordName());
		myArrayValue[1] = SharedFunction.ProperCase(myAstrologyObject.getKPAscendentSignLordName());
		myArrayValue[2] = SharedFunction.ProperCase(myAstrologyObject.getKPMoonNakshatraLordName());
		myArrayValue[3] = SharedFunction.ProperCase(myAstrologyObject.getKPMoonSignLordName());
		myArrayValue[4] = SharedFunction.ProperCase(myAstrologyObject.getKPDayLordName());
		myArrayValue[5] = SharedFunction.ProperCase(myAstrologyObject.getKPAscendentSubLordName());
		myArrayValue[6] = SharedFunction.ProperCase(myAstrologyObject.getKPMoonSubLordName());
		
		%>
		
		<b>Ruling Planets:</b><br>
		<table><tr><td><b>Planet</b></td>
		<td><b>Rasi Lord</b></td>
		<td><b>Nak Lord</b></td>
		<td><b>Sub Lord</b></td></tr>
		
		<tr><td><b>Lagna</b></td>
		<td><%=myArrayValue[1]%></td>
		<td><%=myArrayValue[0]%></td>
		<td><%=myArrayValue[5]%></td></tr>
		
		<tr><td><b>Moon</b></td>
		<td><%=myArrayValue[3]%></td>
		<td><%=myArrayValue[2]%></td>
		<td><%=myArrayValue[6]%></td></tr>
		
		<tr><td><b>Day Lord</b></td>
		<td colspan=3><%=myArrayValue[4]%></td></tr>
		
		</table>
	
</div>

<br />

<div class="textad">
	<%
	   
	String[] myPlanetDMS = new String[12];
	String[] myPlanetRNSS = new String[12];
	
    for(int i = 1;i<=12;i++)
    {
     	myPlanetDMS[i-1] = objUtil.dms1((myAstrologyObject.getKPPlanetLongitude(i)) + ayanamsa);
 		myPlanetRNSS[i-1] = myAstrologyObject.rnss(myAstrologyObject.getKPPlanetLongitude(i));
    }

%>
<b>Planetary Positions:</b><br>
<table><tr><td><b>Planets</b></td>
<td><b>Degree</b></td>
<td><b>RAS-NAK-SUB-SS</b></td></tr>

<%

for(int i= 0;i<12;i++)
{
%>
<tr><td><%=myPlanetNames[i+1]%>
<%
if (!myAstrologyObject.isPlanetDirect(i))
{
%>
&nbsp;[R]&nbsp;
<% } %>

</td>
<td><%=myPlanetDMS[i]%></td>
<td><%=myPlanetRNSS[i]%></td></tr>


<% } %>     
</table>
	
</div>
<br />

<div class="textad">
	<%
	/*Dim ayanamsa  
	 
	dim myPlanetDMS(12) 
	dim myPlanetRNSS(12) 
	Dim planetDegreeArr(12) 
	Dim RNSSOfPlanet(12) 
	Dim rashiName(12)
	Dim nakName(12) ,strDeLimiter(12)
	Dim subLordName(12) 
	Dim subSubLordName (12)
	Dim Rnss(12)
	chartType=session("ChartType")



	      Set myAstrologyObject=session("HoroscopeObj")
	      'Set objUtil =Server.createObject("HoroDesktop.UtilDesktop")
	  'Use this line in case of Western System
				 ' ayanamsa = myAstrologyObject.getKPAyanamsaLongitude
				 ' Use this in case of KP */
				   
	String[] rashiName = new String[12];
	String[] nakName = new String[12];
	String[] subLordName = new String[12];
	String[] subSubLordName = new String[12];
	String[] Rnss = new String[12];
	String[] planetDegreeArr = new String[12];
	String[] RNSSOfPlanet = new String[12];
	
		for(int i = 1;i<=12;i++)
		{
			rashiName[i-1] = myAstrologyObject.getRashiNameForKPCusp(i);
			nakName[i-1] = myAstrologyObject.getNakshatraLordNameForKPCusp(i);
			subLordName[i-1] = myAstrologyObject.getSubLordNameForKPCusp(i);
			subSubLordName[i-1] = myAstrologyObject.getSubSubLordNameForKPCusp(i);
			//Rnss[i] = rashiName[i]	+ strDeLimiter[i] + "-" + nakName[i] + strDeLimiter[i] + "-" + subLordName[i] +  strDeLimiter[i] + "-" + subSubLordName[i];
			Rnss[i-1] = rashiName[i-1]	+ "-" + nakName[i-1] + "-" + subLordName[i-1] +  "-" + subSubLordName[i-1];
		}
		
		
		for(int i = 1;i<=12;i++)
		{
			planetDegreeArr[i-1] = objUtil.dms1((myAstrologyObject.getKPCuspLongitude(i)) + ayanamsa);
			RNSSOfPlanet[i-1] = Rnss[i-1];
			
		}
		
		
		
		%>
		
		    <b>Cuspal Positions:</b><br>
		
		
		    <table><tr><td><b>Cusp</b></td>
		    <td><b>Degree</b></td>
		    <td><b>RAS-NAK-SUB-SS</b></td></tr>
		<%
			for(int i= 0;i<=11;i++)
			{
				
			%>
		    <tr><td><%=i+1%></td>
		    <td><%=planetDegreeArr[i]%></td>
		    <td><%=RNSSOfPlanet[i]%></td></tr>
		<% } %>     
		</table>
	
</div>
<br />

<div class="textad">
	<%
        String DashaOutput = myAstrologyObject.getVimsottariDasaTwoLevel().toString();
        String balanceDasha = myAstrologyObject.getBalanceOfDasa().toString();
       %>
       
        <b>VimsottariDasha:</b><br>

	<%
        for(int k = 1;k<=9;k++)
        {
            //'Divide Dasha in Slots            
            String[] splittedCells = DashaOutput.split("\\+");
            //'response.write (splittedCells(3))
            //'Print The Values of MahaDasha & AntarDasha              
            String[] splittedLines = splittedCells[k].split("\n");
     %>  
            <table><tr><td colspan=2><b><%=splittedLines[1]%></b></td></tr>
            
            <tr><td colspan=2><b>From: <%=splittedLines[3]%></b></td></tr>
            <tr><td colspan=2><b>To: <%=splittedLines[4]%></b></td></tr>
	<%
		    for(int i=6;i<=14;i++)
		    {
		    	
	%>
                <tr><td><b><%=splittedLines[i].substring(0,3) %></b></td>
                <td><%=splittedLines[i].substring(3) %></td></tr>
		    <% } %>
		    <br/>
        <% } %>
        </table>
</div>
<br />
<%@include file='/m/include/i_footer.jsp'%>
</body>
</html>
