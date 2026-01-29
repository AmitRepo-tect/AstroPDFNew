<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

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

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");

int[] RaashiNoCorrespondingToPlanets1 =  new int[14];
int[] planetno =  new int[12];

//-----------------##Code Of Lagna Chart##------------------
//-----------Code For Draw raashi---------
//Use array RaashiNo For Raashi & RaashiNoCorrespondingToPlanets1
//For Planet number.
int[] arrPlanetsShodashvarga =  new int[13];
arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);

for(int k = 0; k <=12; k++)
	{
	RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];

	}

for(int i=0; i<=11 ; i++){ 
	planetno[i] = GetPlanetInBhava(RaashiNoCorrespondingToPlanets1[0], RaashiNoCorrespondingToPlanets1[i+1]);
} 
%>
	
%>

<!--#include file = "Functions.asp"-->

<%
	
	/*dim x,y,x1,y1,x2,y2,q1,r1,q2,r2,W1,W2,H1,H2,z,ns,ew,CurrentX,CurrentY,m,avi 
	Dim myPlanetNames(12)
dim spacebetweentwowords
spacebetweentwowords=" "




					   myPlanetNames(1)="SU"
					   myPlanetNames(2)="MO"
					   myPlanetNames(3)="MA"										   
					   myPlanetNames(4)="ME"					  
					   myPlanetNames(5)="JU"					   
					   myPlanetNames(6)="VE"
					   myPlanetNames(7)="SA"
					   myPlanetNames(8)="RA"
					   myPlanetNames(9)="KE"
					   myPlanetNames(10)="UR"
					   myPlanetNames(11)="NE"
					   myPlanetNames(12)="PL"
      Dim myArrayNo(12)
			myArrayNo(0) = "I"
			myArrayNo(1) = "II"
			myArrayNo(2) = "III"
			myArrayNo(3) = "IV"
			myArrayNo(4) = "V"
			myArrayNo(5) = "VI"
			myArrayNo(6) = "VII"
			myArrayNo(7) = "VIII"
			myArrayNo(8) = "IX"
			myArrayNo(9) = "X"
			myArrayNo(10) = "XI"
			myArrayNo(11) = "XII"



	''Set myAstrologyObject=session("HoroscopeObj")


	'Response.Write  "Web: http://www.AstroSage.com, E-mail: info@AstroSage.com" & "<br>" 
     '   Response.Write   myAstrologyObject.getname'user name & "<br>" 
*/
	String UserName = Util.safestr(session.getAttribute("User_Id"));//earlier it was userid
	if(!UserName.equals("")) 
        	out.println("Web Address: http://astrosage.com/ch/" + UserName + "<br>" );
	 
		int chartType= Util.safeInt(session.getAttribute("chartType"));
%>
<div class="textad">
<canvas id="Canvas1" width="600px" height="400px" class="ui-canvas"></canvas>
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
    var c=document.getElementById("Canvas1");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
String mySyn = "";
for(int i = 0 ;i<= 11;i++){
    mySyn = mySyn + RaashiNoCorrespondingToPlanets1[i] + ","; 
}

mySyn = mySyn + RaashiNoCorrespondingToPlanets1[12]; 
out.println("arrPlanetsShodashvarga = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl)


%>
    x1_canvas= 80;//10+40;
    y1_canvas= 20;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, languageCode,false);  
      myval="";

          }  
else {
   $('#Canvas1').hide();
   // myval = '<center><div align=center style=padding-top:5px;>Please upgrade browser</div></center>';
}
</script>
</div>
<br />
<%


//'#####################  BASIC DETAILS ###################
//' basicdetails functions draw the table .table has some detail o 
//'x1,y1,is the starting coordinate of basic details table which position we want to print the table 
//x2,y2 is the ending coordinate of basic details table 
//'z is that varriable which gives the spaces after column to print the values  that 
//' how much space you want to give away from the line
%>
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
        <td><%=SharedFunction.getAyanName(myAstrologyObject) %></td></tr>
        <tr><td><b>Ayanamsa Val:</b></td>
        <td><%=myAstrologyObject.getAyanamsaDms()%></td></tr>
        <tr><td><b>Bal. Dasa:</b></td>
        <td><%=myAstrologyObject.getBalanceOfDasa()%></td></tr>

</table>
</div>
<br />

<%


//'################  PLANETORY POSITION ############3333


%>
<div class="textad">
	<b>Planetary Positions:</b><br> 
    <table><tr><td><b>Planets</b></td>
    <td><b>Sign</b></td>
    <td><b>Longitude</b></td>
    <td><b>Nakshatra</b></td>
    <td><b>Pada</b></td></tr>

<%
    for(int i= 0;i<=12;i++)
    {
        if( i==0)
        {
        	%>
        
            <tr><td><%=myAstrologyObject.getPlanetName(0).substring(0,3)%></td>
            <td><%=myAstrologyObject.getAscendentSignName().toUpperCase()%></td>
            <td><%=myAstrologyObject.getAscendentRasiDms()%></td>
            <td><%=myAstrologyObject.getAscendentNakshatraName()%></td>
            <td><%=myAstrologyObject.getAscendentPada()%></td></tr>
            <%
        }
        else 
        {
            %>
        	       
            <tr><td><%=myAstrologyObject.getPlanetName(i).substring(0,3)%>
			<%
	            if (!myAstrologyObject.isPlanetDirect(i)) {
	            	
	            %>
	            	[R]    
	            <% } %>
	            
	             </td>
	
	            <td><%=myAstrologyObject.getPlanetaryRasiName(i).toUpperCase()%></td> 
	            <td><%=myAstrologyObject.getPlanetaryRasiDms(i)%></td> 
	            <td><%=myAstrologyObject.getNakshatraNameForPlanet(i)%></td> 
	            <td><%=myAstrologyObject.getPadaOfPlanet(i)%></td></tr>
        <%
        } 
        }
        %>	
    
    
    </table>
</div>
<br />
<%
//'########### ASHTAKVARGA TABLE ############

	
%>
<div class="textad">
	
	<b>Ashtakvarga Table:</b>
    <table><tr><td><b>Sign No</b></td>
    <% 
	for(int i = 2;i<=13;i++)
	{ %>
        <td><b><%=i - 1%></b></td>
	<% } %>

    </tr>
<%
	/*set ObjHoroAshtak = session("HoroscopeObj")
    dim ashtakVargaBindu(6,11)
	dim totalAshtakVargaValue*/

	int[] totalAshtakVargaValue = new int[12];
	int[][] ashtakVargaBindu = new int[7][12]; 
	for(int i = 0;i<=6;i++) 
	{
        for(int k = 0;k<=11;k++)
        {
            ashtakVargaBindu[i][k] = myAstrologyObject.getAshtakvargaBinduForSignAndPlanet(i, k);
        }
	}
	
	for(int j = 0;j<=11;j++)
	{
		totalAshtakVargaValue=myAstrologyObject.getTotalAshtakVargaValue();
		
	}

	for(int i = 0;i<=6;i++)
	{
		
	%>
		<tr><td><%=myAstrologyObject.getPlanetName(i+1).substring(0, 3)%></td>
	<%
		for(int j = 0;j<=11;j++)
		{
			
		%>
            <td><%=ashtakVargaBindu[i][j]%></td> 
	    <% } %>
	    
        </tr>
   	<% } %>
   	
    <tr><td><b>Total: </b></td>
	<%
	for(int j = 0;j<=11;j++)
	{
	%>
		<td><%=totalAshtakVargaValue[j]%></td>
	<% } %>

    </tr></table>
	
</div>
<br />

<%

//'############## CHALIT TABLE ###############3


%>
<div class="textad">
	<b>Chalit Table:</b>
        <table><tr><td><b>Bhav</b></td>
        <td><b>Sign</b></td>
        <td><b>Bhav Begin</b></td>
        <td><b>Sign</b></td>
        <td><b>Mid Bhav</b></td></tr>

<%
	    //dim rashiAndDegree,rashiNameForBhavBegin(11),bhavValueForBhavBegin(11)
	    //dim rashiNameForMidBhav(11),bhavValueForMidBhav(11)
	    
	    String[] rashiNameForBhavBegin = new String[12];
		String[] bhavValueForBhavBegin = new String[12];
		String[] rashiNameForMidBhav = new String[12];
		String[] bhavValueForMidBhav = new String[12];
	    for(int i=0;i<=11;i++)
	    {
            double value=myAstrologyObject.getBhavBeginForBhav(i+1);
		    String[] rashiAndDegree=myAstrologyObject.getRasiAndItsDegree(value);
		    rashiNameForBhavBegin[i]=rashiAndDegree[0];
		    bhavValueForBhavBegin[i]=rashiAndDegree[1];
		    value=myAstrologyObject.getMidBhavForBhava(i+1);
		    rashiAndDegree=myAstrologyObject.getRasiAndItsDegree(value);
		    rashiNameForMidBhav[i]=rashiAndDegree[0];
		    bhavValueForMidBhav[i]=rashiAndDegree[1];
	    }

        for(int i=0;i<=11;i++)
        {
        	%>
       
            <tr><td><%=i+1%></td>
       	    <td><%=rashiNameForBhavBegin[i].toUpperCase()%></td>
        	<td><%=bhavValueForBhavBegin[i]%></td>
        	<td><%=rashiNameForMidBhav[i].toUpperCase()%></td>
        	<td><%=bhavValueForMidBhav[i]%></td></tr>
	    <% } %>
	    
        </table>
</div>
<br />
<%	

	
//' ################ VIMSHOTTARI DASA ##################
%>
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
<%!
public double GetReminderInRasi (int degree)
{
	return (degree - (Double.valueOf(degree /  30) * 30.0));
	
}

 // Function For getPlanetInBhav
    public int GetPlanetInBhava(int AscendentPosition ,int  planetPosition) {
        int tempBhava; 
        tempBhava = planetPosition - AscendentPosition + 1 ;
        if( tempBhava <= 0)
        	{
        	tempBhava = tempBhava + 12;
        	}
       return tempBhava;
    }
  
    %>