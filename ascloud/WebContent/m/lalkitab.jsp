<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.cslsoftware.printhoroscope.SouthChart"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page import="com.cslsoftware.printhoroscope.Chart"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page import="com.cslsoftware.horo.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
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

	DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
    int[] RaashiNoCorrespondingToPlanets1 =  new int[14];
    int[] planetno =  new int[12];
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

			
			SharedFunction sf = new SharedFunction();
		    LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
			UtilLalkitab lalKitabUtil = new UtilLalkitab();
			
			
			String UserName = Util.safestr(session.getAttribute("User_Id"));//earlier it was userid
			if(!UserName.equals("")) 
		        	out.println("Web Address: http://astrosage.com/ch/" + UserName + "<br>" );
			 
				int chartType= Util.safeInt(session.getAttribute("chartType"));

		%>
		
		<%
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
		
		<div class="textad">
<b>Rasi Chart:</b><br>
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

<div class="textad">
	<%

    String[] arrPlanet = {"SUN","MON","MAR","MER","JUP","VEN","SAT-Ret","RAH-Ret","KET-Ret"};
    
    String[] arrPosition = {"Dblitted","NuSign","NuSign","FrSign","NuSign","Dblitted","NuSign","NuSign","EnSign"};

    %>
    <b>Planetary Degree And Their Positions:</b><br>
    <table><tr><td><b>Planets</b></td>
    <td><b>Sign</b></td>
    <td><b>Positions</b></td>
    <td><b>Soya</b></td>
    <td><b>KismatJaganewala</b></td>
    <td><b>Benefic/Malefic</b></td></tr>

	<%
    String[] maleficBenefic=new String[2];
    int[] mRaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
    int[] arrMalificBenefic = new int[9];
    maleficBenefic[0] = "Malefic";
    maleficBenefic[1] = "Benefic";
    
    for(int iCount = 0;iCount<=8;iCount++)
    {
        arrMalificBenefic[iCount] = lalKitabUtil.getMaleficBenafic(iCount+1, mRaashiNoCorrespondingToPlanets[iCount]);
    }
    
//###############coding finished malefic banefic

    for(int i = 0;i<=8;i++)
    {
        //'PLANETS
     %>
	    <tr><td><%=arrPlanet[i]%></td>
	    
        <%//SIGN%>
        <td><%=objLalKitab.getPlanetaryRashiNameForLalkitab(i + 1)+spacebetweentwowords%>
        
        <%//POSITION%>
        <td><%=arrPosition[i]%></td>
        
        <%//'SOYA
        boolean isPlanetSoya = objLalKitab.isPlanetSoya(i + 1);
        if(isPlanetSoya)
        {%>
            <td>Yes</td> 
	    <% } else { %>
        	<td>No</td> 
	    <% }
	    
        boolean isPlanetKismatJaganewala = objLalKitab.isPlanetKismatJagganewala(i + 1);
	    if(isPlanetKismatJaganewala)
	    {%>
            <td>Yes</td>
    	<% } else { %> 
        	<td>No</td> 
    	<% }
    	
    	if(maleficBenefic[arrMalificBenefic[i]].equals("Malefic")) 
    	{ %>
            <td class=textcolor><%=maleficBenefic[arrMalificBenefic[i]]%></td></tr>
        <% } else { %>
            <td><%=maleficBenefic[arrMalificBenefic[i]]%></td></tr>
       <% } 
    }
   	%>
    </table>


</div>
<br />
<!-- ################  PLANETORY POSITION ############3333 -->
<div class="textad">
	<b>Planetary Positions:</b><br> 
    <table><tr><td><b>Planets</b></td>
    <td><b>Rashi</b></td>
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
	
	            <td><%=myAstrologyObject.getPlanetaryRasiName(i)%></td> 
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
<!-- 
'###############   HOUSE POSITION ##################
 -->
<div class="textad">
	<%
	String[] arrMaalik = {"Mar","Ven","Mer","Mon","Sun","Mer","Ven","Mar","Jup","Sat","Sat","Jup"};
	
	String[] planetName = {"","Sun","Moon","Mars","Mer","Jup","Ven","Sat","Rahu","Ketu"};
	
	String[] arrPakkaGhar = new String[12];
	
	arrPakkaGhar[0] = planetName[1];
    arrPakkaGhar[1] = planetName[5];
    arrPakkaGhar[2] = planetName[3];
    arrPakkaGhar[3] = planetName[2];
    arrPakkaGhar[4] = planetName[5];
    arrPakkaGhar[5] = planetName[4] + " " + planetName[9];
    arrPakkaGhar[6] = planetName[6] + " " + planetName[4];
    arrPakkaGhar[7] = planetName[3] + " " + planetName[7];
    arrPakkaGhar[8] = planetName[5];
    arrPakkaGhar[9] = planetName[7];
    arrPakkaGhar[10] = planetName[7];
    arrPakkaGhar[11] = planetName[5] + " " + planetName[8];

	String[] arrKismat = new String[12];
    arrKismat[0] = planetName[3];
    arrKismat[1] = planetName[2];
    arrKismat[2] = planetName[4];
    arrKismat[3] = planetName[2];
    arrKismat[4] = planetName[1];
    arrKismat[5] = planetName[9];
    arrKismat[6] = planetName[6];
    arrKismat[7] = planetName[2];
    arrKismat[8] = planetName[7];
    arrKismat[9] = planetName[7];
    arrKismat[10] = planetName[5];
    arrKismat[11] = planetName[8];
	%>
    <b>House Positions:</b><br>
    <table><tr><td><b>KhanaNo</b></td>
    <td><b>Mallik</b></td>
    <td><b>PakkaGhar</b></td>
    <td><b>Kismat</b></td>
    <td><b>Soya</b></td>
    <td><b>Exallt</b></td>
    <td><b>Deblt</b></td></tr>

<% 
    String[] arrSoya2 = new String[12];
    String[] arrExalt=new String[12];
    String[] arrDeblt=new String[12];
    int icount=0;

    for(int iCount = 1; iCount<=9; iCount++){
	    if(objLalKitab.isPlanetSoya(iCount + 1)) {
	        arrSoya2[iCount] ="Yes";
	    } else {
	        arrSoya2[iCount] ="No";
	    }
	}


    arrExalt[0] = planetName[1];
    arrExalt[1] = planetName[2];
    arrExalt[2] = planetName[8];
    arrExalt[3] = planetName[5];
    arrExalt[4] = " ";
    arrExalt[5] = planetName[4] + " " + planetName[8];
    arrExalt[6] = planetName[7];
    arrExalt[7] = " ";
    arrExalt[8] = planetName[9];
    arrExalt[9] = planetName[3];
    arrExalt[10] = " ";
    arrExalt[11] = planetName[6] + " " + planetName[9];

    arrDeblt[0] = planetName[7];
    arrDeblt[1] = " ";
    arrDeblt[2] = planetName[9];
    arrDeblt[3] = planetName[3];
    arrDeblt[4] = " ";
    arrDeblt[5] = planetName[6] + " " + planetName[9];
    arrDeblt[6] = planetName[1];
    arrDeblt[7] = planetName[2];
    arrDeblt[8] = planetName[8];
    arrDeblt[9] = planetName[5];
    arrDeblt[10] = " ";
    arrDeblt[11] = planetName[4] + " " + planetName[8];

    for(int i = 0; i<=11; i++)
    {
        if(arrExalt[i].equals(" "))
        		{
         arrExalt[i]="---";
        		} 
         if (i==0 || i==10 || i==11)
        	 {
          arrSoya2[i]="---";
        	 }
         if( arrDeblt[i].equals(" "))
         {
          arrDeblt[i]="---";
         }  
    }
    
    for(int i = 0; i<=11; i++){
    		%>
        <tr><td> <%= i + 1%></td>
        <td> <%= arrMaalik[i]%> </td>
        <td> <%= arrPakkaGhar[i]%> </td>
        <td> <%= arrKismat[i] %></td>
        <td> <%= arrSoya2[i] %></td>
        <td> <%=arrExalt[i] %></td>
        <td> <%= arrDeblt[i] %></td></tr>
    <%} %>
    </table>
</div>
<br />
<%
//'############## CHALIT TABLE ###############3


%>
<div class="textad">
	<b>Chalit Table:</b>
        <table><tr><td><b>Bhav</b></td>
        <td><b>Rashi</b></td>
        <td><b>BhavBegin</b></td>
        <td><b>Rashi</b></td>
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
       	    <td><%=rashiNameForBhavBegin[i]%></td>
        	<td><%=bhavValueForBhavBegin[i]%></td>
        	<td><%=rashiNameForMidBhav[i]%></td>
        	<td><%=bhavValueForMidBhav[i]%></td></tr>
	    <% } %>
	    
        </table>
</div>
<br />
<%
//################ VIMSUTRI DASA ##################

%>
<div class="textad">
	<% 
    String arrPlanetName[]=new String[27];
	String arrHeading[]=new String[27];
	String arrDasaSpan[];
    String arrDasaPeriod[];
    int iCount, intYCor , jCount;
    int intLowerLimit , intUpperLimit , jYCor; 
    int iXCor, jXCor, jLowerCount=0 , intNo; 
    String arrMiddlePlanetName[];
 
    arrPlanetName = getHeadingPlanet();       
    arrHeading[0] = arrPlanetName[0] +" "+ 6 +" "+ "Year";
    
    arrHeading[1] = arrPlanetName[1] +" "+ 6 +" "+ "Year";
    arrHeading[2] = arrPlanetName[2] +" "+ 3 +" "+ "Year";
    arrHeading[3] = arrPlanetName[3] +" "+ 6 +" "+ "Year";
    arrHeading[4] = arrPlanetName[4] +" "+ 2 +" "+ "Year";
    arrHeading[5] = arrPlanetName[5] +" "+ 1 +" "+ "Year";
    arrHeading[6] = arrPlanetName[6] +" "+ 3 +" "+ "Year";
    arrHeading[7] = arrPlanetName[7] +" "+ 6 +" "+ "Year";
    arrHeading[8] = arrPlanetName[8] +" "+ 2 +" "+ "Year";
    arrHeading[9] = arrPlanetName[9] +" "+ 6 +" "+ "Year";
    arrHeading[10] = arrPlanetName[10] +" "+ 6 +" "+ "Year";
    arrHeading[11] = arrPlanetName[11] +" "+ 3 +" "+ "Year";
    arrHeading[12] = arrPlanetName[12] +" "+ 6 +" "+ "Year";
    arrHeading[13] = arrPlanetName[13] +" "+ 2 +" "+ "Year";
    arrHeading[14] = arrPlanetName[14] +" "+ 1 +" "+ "Year";
    arrHeading[15] = arrPlanetName[15] +" "+ 3 +" "+ "Year";
    arrHeading[16] = arrPlanetName[16] +" "+ 6 +" "+ "Year";
    arrHeading[17] = arrPlanetName[17] +" "+ 2 +" "+ "Year";
    arrHeading[18] = arrPlanetName[18] +" "+ 6 +" "+ "Year";
    arrHeading[19] = arrPlanetName[19] +" "+ 6 +" "+ "Year";
    arrHeading[20] = arrPlanetName[20] +" "+ 3 +" "+ "Year";
    arrHeading[21] = arrPlanetName[21] +" "+ 6 +" "+ "Year";
    arrHeading[22] = arrPlanetName[22] +" "+ 2 +" "+ "Year";
    arrHeading[23] = arrPlanetName[23] +" "+ 1 +" "+ "Year";
    arrHeading[24] = arrPlanetName[24] +" "+ 3 +" "+ "Year";
    arrHeading[25] = arrPlanetName[25] +" "+ 6 +" "+ "Year";
    arrHeading[26] = arrPlanetName[26] +" "+ 2 +" "+ "Year";
    arrDasaPeriod = objLalKitab.getIstLevelLalKitabDasa();
    arrDasaSpan = objLalKitab.getSecondLevelLalKitabDasa();

    intLowerLimit = 0;
    intUpperLimit = 1;

    %>
    <b>Lal Kitab Dassa:</b><br>
	<% 
    for (iCount = 0; iCount<=26; iCount++)
    {
    %>
        <table><tr><td colspan=2><b><%=  arrHeading[iCount]%></b></td></tr>
        <tr><td colspan=2><b>From: </b>
        <%= arrDasaPeriod[intLowerLimit] %></td></tr>
        <tr><td colspan=2><b>To:</b>
        <%=arrDasaPeriod[intUpperLimit]%></td></tr>
        <% 
	    arrMiddlePlanetName =getPlanetName(arrPlanetName[iCount]);
  	    intNo = 0; 
	    int i = 3;
	    
	    for( jCount = jLowerCount; jCount<jLowerCount + 2; jCount++)
	    {%>
            <tr><td><b> <%=arrMiddlePlanetName[intNo] %> </b></td>
            <td><%=arrDasaSpan[jCount]%></td></tr>
            <% 
            i=i+1;
            intNo = intNo + 1 ;
            
	    }
        intLowerLimit = intUpperLimit;
        intUpperLimit = iCount + 2;
        %>
        <br/>
        <% 
      }
	%>
    </table>
    
</div>
<br />

<%! 
public String[] getHeadingPlanet()
{
    String[] arrHead=new String[27];
    String[] arrPlanet=new String[10];
    
    arrPlanet[1]="Sun";
    arrPlanet[2]="Moon";
    arrPlanet[3]="Mars";
    arrPlanet[4]="Mer";
    arrPlanet[5]="Jup";
    arrPlanet[6]="Ven";
    arrPlanet[7]="Sat";
    arrPlanet[8]="Rahu";
    arrPlanet[9]="Ketu";

    arrHead[0] = arrPlanet[7];
    arrHead[1] = arrPlanet[8];
    arrHead[2] = arrPlanet[9];
    arrHead[3] = arrPlanet[5];
    arrHead[4] = arrPlanet[1];
    arrHead[5] = arrPlanet[2];
    arrHead[6] = arrPlanet[6];
    arrHead[7] = arrPlanet[3];
    arrHead[8] = arrPlanet[4];
    arrHead[9] = arrPlanet[7];

    arrHead[10] = arrPlanet[8];
    arrHead[11] = arrPlanet[9];
    arrHead[12] = arrPlanet[5];
    arrHead[13] = arrPlanet[1];
    arrHead[14] = arrPlanet[2];

    arrHead[15] = arrPlanet[6];
    arrHead[16] = arrPlanet[3];
    arrHead[17] = arrPlanet[4];
    arrHead[18] = arrPlanet[7];
    arrHead[19] = arrPlanet[8];

    arrHead[20] = arrPlanet[9];
    arrHead[21] = arrPlanet[5];
    arrHead[22] = arrPlanet[1];
    arrHead[23] = arrPlanet[2];
    arrHead[24] = arrPlanet[6];

    arrHead[25] = arrPlanet[3];
    arrHead[26] = arrPlanet[4];
    return arrHead;
    }
%> 
<%! 
public String[] getPlanetName(String strPlanet)
{
	String[] arrPlanetName=new String[3]; 
	String[] arrMiddlePlanetName=new String[10];
    
	arrMiddlePlanetName[1]="Sun";
    arrMiddlePlanetName[2]="Moon";
    arrMiddlePlanetName[3]="Mars";
    arrMiddlePlanetName[4]="Mer";
    arrMiddlePlanetName[5]="Jup"; 
    arrMiddlePlanetName[6]="Ven"; 
    arrMiddlePlanetName[7]="Sat"; 
    arrMiddlePlanetName[8]="Rahu";
    arrMiddlePlanetName[9]="Ketu";

    		 switch(strPlanet)
             {
             
             case "Sun" :
             {
        arrPlanetName[0] = arrMiddlePlanetName[1] + " ";
        arrPlanetName[1] = arrMiddlePlanetName[2];
        arrPlanetName[2] = arrMiddlePlanetName[3];
        break;
             }
             case "Moon" :
             {
        arrPlanetName[0] = arrMiddlePlanetName[5] + " ";
        arrPlanetName[1] = arrMiddlePlanetName[1] + " ";
        arrPlanetName[2] = arrMiddlePlanetName[2];
        break;
             }
             case "Mars" :
             {
        arrPlanetName[0] = arrMiddlePlanetName[3];
        arrPlanetName[1] = arrMiddlePlanetName[7]+ " ";
        arrPlanetName[2] = arrMiddlePlanetName[6] + " ";
        break;
             }
             case "Mer":
            		 {
        arrPlanetName[0] = arrMiddlePlanetName[2];
        arrPlanetName[1] = arrMiddlePlanetName[3];
        arrPlanetName[2] = arrMiddlePlanetName[5] + " ";
        break;
             }
             case "Jup":
             {
        arrPlanetName[0] = arrMiddlePlanetName[9] + " ";
        arrPlanetName[1] = arrMiddlePlanetName[5] + " " ;
        arrPlanetName[2] = arrMiddlePlanetName[1]+ " ";
        break;
             }
             case "Ven":
             {
        arrPlanetName[0] = arrMiddlePlanetName[3];
        arrPlanetName[1] = arrMiddlePlanetName[1]+ " ";
        arrPlanetName[2] = arrMiddlePlanetName[2];
        break;
             }
             case "Sat":
             {
        arrPlanetName[0] = arrMiddlePlanetName[8]+ " ";
        arrPlanetName[1] = arrMiddlePlanetName[4]+ " ";
        arrPlanetName[2] = arrMiddlePlanetName[7]+ " ";
        break;
             }
             case "Rahu":
             {
        arrPlanetName[0] = arrMiddlePlanetName[3];
        arrPlanetName[1] = arrMiddlePlanetName[9]+ " ";
        arrPlanetName[2] = arrMiddlePlanetName[8]+ " ";
        break;
             }
             case "Ketu":
             {
        arrPlanetName[0] = arrMiddlePlanetName[7]+ " ";
        arrPlanetName[1] = arrMiddlePlanetName[8]+ " ";
        arrPlanetName[2] = arrMiddlePlanetName[9]+ " ";
        break;
         }
             default :
             {
            	 
             }
         }
    return arrPlanetName;
    }

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
 <%@include file='/m/include/i_footer.jsp'%>
</body>
</html>