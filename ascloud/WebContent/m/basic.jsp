<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%
	DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
	int[] RaashiNoCorrespondingToPlanets1 =  new int[14];
%>

<!--#include file = "Functions.asp"-->
<!--#include file = "get-ayanamsa.asp"-->

<%
	//dim x,y,x1,y1,x2,y2,q1,r1,q2,r2,W1,W2,H1,H2,z,ns,ew,CurrentX,CurrentY,m,avi 
	//Dim myPlanetNames(12)
	String spacebetweentwowords = " ";




					  /*  myPlanetNames(1)="SU"
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
					   myPl anetNames(12)="PL"*/
      /* Dim myArrayNo(12)
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
			myA rrayNo(11) = "XII"*/

	String UserName = Util.safestr(session.getAttribute("User_Id"));
	if(!UserName.equals("")) {
    	out.println("Web Address: http://astrosage.com/ch/" + UserName + "<br>" );
	}
	
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
/* '#####################  BASIC DETAILS ###################
' basicdetails functions draw the table .table has some detail o 
'x1,y1,is the starting coordinate of basic details table which position we want to print the table 
'x2,y2 is the ending coordinate of basic details table 
'z is that varriable which gives the spaces after column to print the values  that 
' how much space you want to give away from the line
 */
 
	//call basicdetails()

//'################  PLANETORY POSITION ############3333
	//call planetoryposition()
	
//'########### ASHTAKVARGA TABLE ############
	//call ashtakvargatable()

//'############## CHALIT TABLE ###############3
	//call chalittable()
	
//' ################ VIMSUTRI DASA ##################
  	//call vimsutridasa()

	//sub basicdetails()

//'******** coding for basic details*********************

    out.print("Basic Details :" + "<br>"); 
    out.print("Sun Rise:" + spacebetweentwowords); 
	out.print(myAstrologyObject.getSunRiseTimeHms() + "<br>"); 

    out.print("Sun Set:" + spacebetweentwowords );
    out.print(myAstrologyObject.getSunSetTimeHms() + "<br>"); 
    out.print("Tithi:" + spacebetweentwowords);
    out.print(SharedFunction.ProperCase(myAstrologyObject.getTithiName()) + "<br>"); 
    out.print("Yoga:" + spacebetweentwowords);
    out.print(SharedFunction.ProperCase(myAstrologyObject.getYoganame()) + "<br>"); 

    out.print("Karan:" + spacebetweentwowords); 
    out.print(SharedFunction.ProperCase(myAstrologyObject.getKaranName()) + "<br>"); 	
    out.print("Lagna:" + spacebetweentwowords);
    out.print(myAstrologyObject.getAscendentSignName() + "<br>"); 
    out.print("Lagna Lord:" + spacebetweentwowords);
    out.print(myAstrologyObject.getLagnaLordName() + "<br>"); 
    out.print("Rasi:" + spacebetweentwowords);
    out.print(myAstrologyObject.getRasiName()	 + "<br>"); 
    out.print("Rasi Lord:" + spacebetweentwowords);
    out.print(myAstrologyObject.getRasiLordName() + "<br>"); 	
  	out.print("Nskshatra:" + spacebetweentwowords);
    out.print(SharedFunction.ProperCase(myAstrologyObject.getNakshatraName()) + "-" + myAstrologyObject.getPadaOfPlanet(2) + "<br>"); 	
    out.print("Nskshatra Lord:" + spacebetweentwowords); 
   	out.print(myAstrologyObject.getNakshatraLordName() + "<br>"); 

    out.print("Name:" + spacebetweentwowords);
    out.print(myAstrologyObject.getName() + "<br>"); 
    out.print("Gender:" + spacebetweentwowords); 
    out.print(myAstrologyObject.getMaleFemale() + "<br>"); 
    out.print("Date:" + spacebetweentwowords);
    out.print(myAstrologyObject.getDayOfBirth() + " : " + myAstrologyObject.getMonthOfBirth() +" : "+	myAstrologyObject.getYearOfBirth() + "<br>"); 
    out.print("Day:" + spacebetweentwowords); 
    out.print(myAstrologyObject.getWeekdayName() + "<br>"); 	
    out.print("Time:" + spacebetweentwowords);
    out.print(myAstrologyObject.getHourOfBirth() + " : " +	myAstrologyObject.getMinuteOfBirth() +" : "+  myAstrologyObject.getSecondOfBirth() + "<br>"); 
    out.print("SID:" + spacebetweentwowords); 
    out.print(myAstrologyObject.getSiderealTimeHms() + "<br>"); 

/*     'if myAstrologyObject.getNorthSouth=1 then
    '         ns="N"
    'else 
    '         ns="S"         
    'End if
    
    'if myAstrologyObject.getEastWest=0 then
    '       ew="W"
    'else 
    '       ew="E"         
    'End if */
    int ns = 0;
	int ew = 0;

     out.print("Latitude:" + spacebetweentwowords);
     out.print(myAstrologyObject.getDegreeOfLattitude() + " : " + myAstrologyObject.getMinuteOfLattitude() + " : " + ns + "<br>");  
     out.print("Longitude:" + spacebetweentwowords );
     out.print(myAstrologyObject.getDegreeOfLongitude() + " : " + myAstrologyObject.getMinuteOfLongitude() + " : " + ew + "<br>"); 
     out.print("Place:" + spacebetweentwowords);
     out.print(myAstrologyObject.getPlace() + "<br>"); //'":" + Space(1) + frmAstrologyNew.txtCity.Text);


	//'AynamsaType = myAstrologyObject.getAyanamsaType
	String ayanamsaName = SharedFunction.getAyanName(myAstrologyObject);
	
    out.print("Ayanamsa Type:" + spacebetweentwowords) ;
    out.print(ayanamsaName + "<br>");
    out.print("Ayanamsa Val:" + spacebetweentwowords) ;
    out.print(myAstrologyObject.getAyanamsaDms() + "<br>");
    out.print("Bal. Dasa:" + spacebetweentwowords);
    out.print(myAstrologyObject.getBalanceOfDasa() + "<br>");

	//sub planetoryposition()

//'****************** planatory position***************************************
	//dim x,y

    out.print("Planetary Positions" + "<br>");
    out.print("Planets" + spacebetweentwowords); 
	out.print("Sign" + spacebetweentwowords);
	out.print("Longitude" + spacebetweentwowords);
	out.print("Nakshatra" + spacebetweentwowords);
	out.print("Pada" + "<br>");

	 for(int i= 0; i <= 12; i++){
		if(i==0){
	        out.print( myAstrologyObject.getPlanetName(0).substring(0, 3) + spacebetweentwowords);
	        out.print(myAstrologyObject.getAscendentSignName().toUpperCase() + spacebetweentwowords); 
	       	out.print( myAstrologyObject.getAscendentRasiDms() + spacebetweentwowords);
	        out.print( myAstrologyObject.getAscendentNakshatraName() + spacebetweentwowords); 
	       	out.print( myAstrologyObject.getAscendentPada() + "<br>");
		} else {    
	        out.print(myAstrologyObject.getPlanetName(i).substring(0, 3) + spacebetweentwowords); 
			if(myAstrologyObject.isPlanetDirect(i)){

 			}	else { 
        		out.print( "[R]" + spacebetweentwowords); 
 			}    
	
	        out.print(myAstrologyObject.getPlanetaryRasiName(i).toUpperCase() + spacebetweentwowords);
        	out.print( myAstrologyObject.getPlanetaryRasiDms(i) + spacebetweentwowords);
	        out.print( myAstrologyObject.getNakshatraNameForPlanet(i) + spacebetweentwowords); 
        	out.print( myAstrologyObject.getPadaOfPlanet(i)  + "<br>");
 	} 
 }
//'$$$$$$$$$$$$$$$$$$$$$$$    ASHTAKVARGA  TABLE    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$
		//sub ashtakvargatable()
        out.print("Ashtakvarga Table" + "<br>"); 
        out.print("Sign No" + spacebetweentwowords); 
        for(int i= 2; i <= 13; i++){
        	out.print(i-1 + spacebetweentwowords);
        }

        out.print("<br>");

	//set ObjHoroAshtak = session("HoroscopeObj")
	int[] totalAshtakVargaValue = new int[12];
	int[][] ashtakVargaBindu = new int[7][12];

	for(int i = 0;i<=6;i++) 
	{
        for(int k = 0;k<=11;k++)
        {
            ashtakVargaBindu[i][k] = myAstrologyObject.getAshtakvargaBinduForSignAndPlanet(i, k);
        }
	}
	
	for(int i= 0; i <= 11; i++){
		totalAshtakVargaValue=myAstrologyObject.getTotalAshtakVargaValue();
		//'out.print( (totalAshtakvargavalue(j))
	}

	for(int i= 0; i <= 6; i++){
		out.print(myAstrologyObject.getPlanetName(i+1).substring(0, 3) + spacebetweentwowords); 
		for(int j= 0; j <= 11; j++){
      		out.print(ashtakVargaBindu[i][j] + spacebetweentwowords); 
		}
      		out.print("<br>");
	}
    out.print("Total" + spacebetweentwowords); 

    for(int j= 0; j <= 11; j++){
		out.print(totalAshtakVargaValue[j] + spacebetweentwowords); 
    }
	out.print("<br>");

//'$$$$$$$$$$$$$$$$$$$chalit table $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
   //sub chalittable()
   
     out.print("Chalit Table" + "<br>");
     out.print("Bhav" + spacebetweentwowords); 
     out.print( "Sign" + spacebetweentwowords);
     out.print( "Bhav Begin" + spacebetweentwowords); 
     out.print( "Sign" + spacebetweentwowords);
     out.print( "Mid Bhav" + "<br>");

	String[] rashiNameForBhavBegin  = new String[12];
	String[] bhavValueForBhavBegin  = new String[12];
	String[] rashiNameForMidBhav  = new String[12];
	String[] bhavValueForMidBhav  = new String[12];
	
	//set ObjHoroChalit = session("HoroscopeObj")
	for(int i = 0; i <= 11; i++) {
		double value = myAstrologyObject.getBhavBeginForBhav(i+1);
		String[] rashiAndDegree = myAstrologyObject.getRasiAndItsDegree(value);
		rashiNameForBhavBegin[i] = rashiAndDegree[0];
		bhavValueForBhavBegin[i] = rashiAndDegree[1];
		value = myAstrologyObject.getMidBhavForBhava(i+1);
		rashiAndDegree = myAstrologyObject.getRasiAndItsDegree(value);
		rashiNameForMidBhav[i] = rashiAndDegree[0];
		bhavValueForMidBhav[i] = rashiAndDegree[1];
	}
	
	for(int i = 0; i <= 11; i++) {
		out.print((i+1) + spacebetweentwowords );
       	out.print(rashiNameForBhavBegin[i].toUpperCase() + spacebetweentwowords); 
        out.print( bhavValueForBhavBegin[i] + spacebetweentwowords);
        out.print( rashiNameForMidBhav[i].toUpperCase() + spacebetweentwowords); 
        out.print( bhavValueForMidBhav[i] + "<br>");
        
	}
//'************************coding for vimsutri dassa**********************
	//sub vimsutridasa()
    //'declare variable
	
     //'Set myAstrologyObject=session("HoroscopeObj")
     String dashaOutput = myAstrologyObject.getVimsottariDasaTwoLevel().toString();
     String balanceDasha = myAstrologyObject.getBalanceOfDasa().toString();

	//'initiliasize the varriable a,b,c,d,to make easy the calculation
      out.print( "VimsottariDasha" + "<br>");

	for(int k= 1; k <= 9; k++){
		//'Divide Dasha in Slots
         String[] splittedCells = dashaOutput.split("\\+");
 		//'response.write (splittedCells(3))
         //'Print The Values of MahaDasha & AntarDasha  
         String[] splittedLines = splittedCells[k].split("\n");
            
		out.print( splittedLines[1]   + "<br>");
		//'MyPrint splittedLines(1), x, y, FontPath
		out.print( "From" + splittedLines[3] + spacebetweentwowords); 
		out.print( "To  " + splittedLines[4]  + "<br>");

		for(int i= 6; i <= 14; i++) {                               
            out.print(splittedLines[i].substring(0, 3) + spacebetweentwowords); 
            out.print( splittedLines[i].substring(3) + "<br>"); 
		}
	}
//*****************programe finished ************
%>

<%!
	public double GetReminderInRasi (int degree) {
		return (degree - (Double.valueOf(degree /  30) * 30.0));
	}

 // Function For getPlanetInBhav
    public int GetPlanetInBhava(int AscendentPosition ,int  planetPosition) {
        int tempBhava; 
        tempBhava = planetPosition - AscendentPosition + 1 ;
        if( tempBhava <= 0) {
        	tempBhava = tempBhava + 12;
        }
       return tempBhava;
    }  
 %>