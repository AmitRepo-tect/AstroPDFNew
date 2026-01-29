<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Free Kundli Software Online, Janam Kundli, Prashna Kundli, KP Horary Astrology Software</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="pragma" content="no-cache" />
    <style type="text/css">
        div.textad { background:#ffc; border:1px solid #cc6;}
    </style>
</head>
<body>
<!--#include file = "get-ayanamsa.asp"-->
<%
String name = Util.safestr(request.getParameter("name"));
String sex = Util.safestr(request.getParameter("sex"));
String day = Util.safestr(request.getParameter("day"));
String month = Util.safestr(request.getParameter("month"));
String year = Util.safestr(request.getParameter("year"));
String hrs = Util.safestr(request.getParameter("hrs"));
String min = Util.safestr(request.getParameter("min"));
String sec = Util.safestr(request.getParameter("sec"));
String place = Util.safestr(request.getParameter("place"));

String dst = Util.safestr(request.getParameter("dst"));
String Ayanamsa = Util.safestr(request.getParameter("ayanamsa"));
String Charting = Util.safestr(request.getParameter("charting"));
String kphn = Util.safestr(request.getParameter("kphn"));    
String type = Util.safestr(request.getParameter("type"));

	if(name.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please enter name.", "UTF-8"));
	}
	else if(day.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the day.", "UTF-8"));
	}
	else if(!isNumeric(day) || Integer.valueOf(day) < 1 || (Integer.valueOf(day) > 31))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the day.", "UTF-8"));
	}
	else if(month.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the month.", "UTF-8"));
	}
	else if(!isNumeric(month) || Integer.valueOf(month) < 1 || (Integer.valueOf(month) > 12))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the month.", "UTF-8"));
	}
	else if(year.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the year.", "UTF-8"));
	}
	else if(!isNumeric(year) || Integer.valueOf(year) < 1 || (Integer.valueOf(year) > 9999))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the year.", "UTF-8"));
	}
	else if(hrs.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the hrs.", "UTF-8"));
	}
	else if(!isNumeric(hrs) || Integer.valueOf(hrs) < 0 || (Integer.valueOf(hrs) >= 24))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the hrs.", "UTF-8"));
	}
	else if(min.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the min.", "UTF-8"));
	}
	else if(!isNumeric(min) || Integer.valueOf(min) < 0 || (Integer.valueOf(min) > 60))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the min.", "UTF-8"));
	}
	else if(sec.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the sec.", "UTF-8"));
	}
	else if(!isNumeric(sec) || Integer.valueOf(month) < 0 || (Integer.valueOf(sec) > 60))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the sec.", "UTF-8"));
	}
	else if(place.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify Place of birth.", "UTF-8"));
	}
	else if(kphn.equals(""))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify the value of kphn.", "UTF-8"));
	}
	else if(!isNumeric(kphn) || Integer.valueOf(kphn) < 0 || (Integer.valueOf(kphn) > 249))
	{
		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the kphn.", "UTF-8"));
	}


        String cityId = "0";
    //'************************** To get city id of new selected city
    UserDAO userDAO = new UserDAO();
    cityId = userDAO.getCityId(place.toLowerCase());
    
	HashMap<String, String> hm = new HashMap<String, String>();
	int cityIdInt = 0;
    if (cityId.equals("") || cityId.equals("0")) 
    { 
   		response.sendRedirect("http://www.astrosage.com?default.asp?error=" + URLEncoder.encode("ERROR: Unable to find the city.", "UTF-8"));
    }
    else
    	{

    	cityIdInt = Integer.valueOf(cityId);
    	CloudDAO cloudDAO = new CloudDAO();
    	hm = cloudDAO.getCityDetailsByCityId(cityId);
    	}
	
	DesktopHoro myAstrologyObject = new DesktopHoro();
	Constants ObjConst = new Constants();
	ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
	
    myAstrologyObject.setName(name);
	myAstrologyObject.setPlace(place);
	myAstrologyObject.setTimeZone(hm.get("TimeZone"));

	myAstrologyObject.setMaleFemale("M");
	myAstrologyObject.setSecondOfBirth(sec);
	myAstrologyObject.setMinuteOfBirth(min);
	myAstrologyObject.setHourOfBirth(hrs);
	myAstrologyObject.setDayOfBirth(day);
	myAstrologyObject.setMonthOfBirth(month);
	myAstrologyObject.setYearOfBirth(year);
	myAstrologyObject.setDegreeOfLattitude(hm.get("LatDeg"));
	myAstrologyObject.setDegreeOfLongitude(hm.get("LongDeg"));
	myAstrologyObject.setSecondOfLattitude("00");
	myAstrologyObject.setSecondOfLongitude("00");
	myAstrologyObject.setMinuteOfLongitude(hm.get("LongMin"));
	myAstrologyObject.setMinuteOfLattitude(hm.get("LatMin"));
	myAstrologyObject.setEastWest(hm.get("LongEW"));
	myAstrologyObject.setNorthSouth(hm.get("LatNS"));
	myAstrologyObject.setDST(dst);

	myAstrologyObject.setLanguageCode("0");
	myAstrologyObject.setAyan(Integer.valueOf(Ayanamsa));
	myAstrologyObject.setKPHorarySeed(Integer.valueOf(kphn));

	myAstrologyObject.initialize();


  // '----------- Calculating Bhava Positions to pass to North Indian chan -----------	

 	String AyanamsaInSession = SharedFunction.getAyan(myAstrologyObject);
	// myAstrologyObject.setAyanamsaType(1);
	 myAstrologyObject.setAyan(1);
	 myAstrologyObject.initialize();
	 UtilDesktop objUtil = new UtilDesktop();
	 
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
		
<br />

<div class="textad">
	<b>Basic Details:</b><br> 
        <b>Sun Rise:</b>
	<%=myAstrologyObject.getSunRiseTimeHms() + spacebetweentwowords %>

        <b>Sun Set:</b>
       <%=myAstrologyObject.getSunSetTimeHms()%>
       <b>Tithi:</b>
        <%=SharedFunction.ProperCase(myAstrologyObject.getTithiName()) %>
      <b>Yoga:</b>
      <%=SharedFunction.ProperCase(myAstrologyObject.getYoganame())%>


        <b>Karan:</b>
        <%=SharedFunction.ProperCase(myAstrologyObject.getKaranName())%>
       <b>Lagna:</b>
       <%=myAstrologyObject.getAscendentSignName()%>
       <b>Lagna Lord:</b>
        <%=myAstrologyObject.getLagnaLordName()%>
        <b>Rasi:</b>
        <%=myAstrologyObject.getRasiName()%>
       <b>Rasi Lord:</b>
       <%=myAstrologyObject.getRasiLordName()%>
     <b>Nakshatra:</b>
        <%=SharedFunction.ProperCase(myAstrologyObject.getNakshatraName()) + "-" + myAstrologyObject.getPadaOfPlanet(2)%></td></tr>
        <b>Nskshatra Lord:</b>
        <%=myAstrologyObject.getNakshatraLordName()%>


      <b>Name:</b>
        <%=myAstrologyObject.getName()%>
        <b>Gender:</b>
        <%=myAstrologyObject.getMaleFemale()%>
        <b>Date:</b>
        <%=myAstrologyObject.getDayOfBirth() + " : " +	myAstrologyObject.getMonthOfBirth() +" : "+	myAstrologyObject.getYearOfBirth() %>
        <b>Day:</b>
        <%=myAstrologyObject.getWeekdayName()%>
        <b>Time:</b>
        <%=myAstrologyObject.getHourOfBirth() + " : " +	myAstrologyObject.getMinuteOfBirth() + " : " +  myAstrologyObject.getSecondOfBirth() %>
        <b>SID:</b>
        <%=myAstrologyObject.getSiderealTimeHms()%>


<% int ns = 0;
int ew = 0;
%>
        <b>Latitude:</b>
        <%=myAstrologyObject.getDegreeOfLattitude() + " : " + myAstrologyObject.getMinuteOfLattitude() + " : " +ns %>
        <b>Longitude:</b>
        <%=myAstrologyObject.getDegreeOfLongitude() + " : " + myAstrologyObject.getMinuteOfLongitude() + " : " +ew%>
        <b>Place:</b>
        <%=myAstrologyObject.getPlace()%><br> 

        <b>Ayanamsa Type:</b>
        KP
        <b>Ayanamsa Val:</b>
        <%=objUtil.dms1(myAstrologyObject.getKPAyanamsaLongitude())%>
        <b>Bal. Dasa:</b>
        <%=myAstrologyObject.getBalanceOfDasa()%>

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
        <b>Planets</b>
        <b>Houses</b>
<%
   for(int icount = 0;icount<9;icount++)
   {
	   %>
        <%=myPlanetNames[icount+1]%>
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
            

    <% } %>
   
</div>
<br />

<div class="textad">
<%
          
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
    <b>House</b>
    <b>Planets</b>

<%

	 for(int icount =0;icount<=11;icount++)
	 {
		 %>
	 
    <%=myArrayNo[icount]%>
    <%
   for(int iJ = 0;iJ<=11;iJ++)
   {
	   
   String tempPlanet = "";
      if(BhavArray[icount][iJ] != 0 && !myPlanetNames[(int)(BhavArray[icount][iJ])].equals(""))
    	  tempPlanet=myPlanetNames[(int)(BhavArray[icount][iJ])];
     
   %>
   
    <%=tempPlanet+spacebetweentwowords%>
 
   

  <% } %>

   
<% } %>

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
		
		<b>Planet</b>
		<b>Rasi Lord</b>
		<b>Nak Lord</b>
		<b>Sub Lord</b>
		
		<b>Lagna</b>
		<%=myArrayValue[1]%>
		<%=myArrayValue[0]%>
		<%=myArrayValue[5]%>
		
		<b>Moon</b>
		<%=myArrayValue[3]%>
		<%=myArrayValue[2]%>
		<%=myArrayValue[6]%>
		
		<b>Day Lord</b>
		<%=myArrayValue[4]%>
		
		
	
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
<b>Planets</b>
<b>Degree</b>
<b>RAS-NAK-SUB-SS</b>

<%

for(int i= 0;i<12;i++)
{
%>
<%=myPlanetNames[i+1]%>
<%
if (!myAstrologyObject.isPlanetDirect(i))
{
%>
&nbsp;[R]&nbsp;
<% } %>


<%=myPlanetDMS[i]%>
<%=myPlanetRNSS[i]%>

<% } %>     

	
</div>
<br />

<div class="textad">
	<%
					   
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
		
		
		    <b>Cusp</b>
		    <b>Degree</b>
		    <b>RAS-NAK-SUB-SS</b>
		<%
			for(int i= 0;i<=11;i++)
			{
				
			%>
		    <%=i+1%>
		    <%=planetDegreeArr[i]%>
		    <%=RNSSOfPlanet[i]%>
		<% } %>     
			
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
            <b><%=splittedLines[1]%></b>
            
            <b>From: <%=splittedLines[3]%></b>
            <b>To: <%=splittedLines[4]%></b>
	<%
		    for(int i=6;i<=14;i++)
		    {
		    	
	%>
                <b><%=splittedLines[i].substring(0,3) %></b>
                <%=splittedLines[i].substring(3) %></td>
		    <% } %>
		    <br/>
        <% } %>
        
</div>
<br />
<%@include file='/m/include/i_footer.jsp'%>
</body>
</html>
<%!
public static boolean isNumeric(String val)
{
	boolean numeric = true;
	try
	{
		int x = Integer.valueOf(val);
	}
	catch(Exception e)
	{
		numeric = false;
	}
	return numeric;
}
%>