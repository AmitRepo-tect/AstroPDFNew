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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Free Kundli Software Online, Janam Kundli, Prashna Kundli, KP Horary Astrology
        Software</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="pragma" content="no-cache" />
    <link rel='stylesheet' type='text/css' href='css/stylesheet.css'>
</head>
<body>
<!--#INCLUDE FILE=DbConnection.inc-->
<%
      String year11 = "" ;
      boolean flag=false;
    if (request.getParameter("SubmitYear")!=null)
    	{
        
        year11 = request.getParameter("ChangeYear");

        if (year11.equals(""))
        {
           out.print("<b>ERROR: Please enter year.</b><br />");
            flag = true;
        }
        else if (!isNumeric(year11))
        {
                out.print("<b>ERROR: Please enter correct year.</b><br />");
                flag = true;
        }
        else if ((Integer.parseInt(year11)< 1) || (Integer.parseInt(year11) > 9999))
        { 
        	 out.print("<b>ERROR: Please enter correct year.</b><br />");
                flag = true;
        }
    	}

       if(!flag)
    	{
        session.setAttribute("year",request.getParameter("ChangeYear"));
        }
       //out.println(session.getAttribute("year"));
    %>
     <%!
     public static boolean isNumeric(String str)
    {
     return str.matches("-?\\d+(\\.\\d+)?");  //match a number with optional '-' and decimal.
    }
     %>
     <% 
     String maleficBenefic[] = new String[3];
     maleficBenefic[0] = "<font color=red>Malefic</font>";
     maleficBenefic[1] = "Benefic";
    int currentMonth;
   
    int[] arrMalificBenefic =  new int[9];

    

    String[] arrHeading = new String[6];
    String[] arrSign = new String[10];
    String[] arrPlanet = new String[13];
    String[] arrPosition = new String[10];   
    int arrKhana[]=new int[12];
    String arrHeading2[]=new String[7];
    String planetName[]=new String[10];
    String arrPakkaGhar[]=new String[12];
    String arrKismat[]=new String[12];
    String arrSoya2[]=new String[12];
    String arrExalt[]=new String[12]; 
    String arrDeblt[]=new String[12]; 
    SharedFunction sf = new SharedFunction();
    DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
    LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
    //LalKitab objLalKitab =new LalKitab();
    UtilLalkitab lalKitabUtil = new UtilLalkitab();
 
    
	      
    arrHeading[0] = "Planets";
    arrHeading[1] = "Sign";
    arrHeading[2] = "Position";
    arrHeading[3] = "Soya";
    arrHeading[4] = "Kismat Jaganewala";
    arrHeading[5] =  "Benefic/Malefic";

    
    int[] mRaashiNoCorrespondingToPlanets = new int[13];
    mRaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);

    
    for(int iCount = 0 ; iCount<=8; iCount++){
        arrSign[iCount] = (objLalKitab.getPlanetaryRashiNameForLalkitab(iCount + 1));
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

    int currYear=0;
    session.setAttribute("tt",session.getAttribute("year"));
	int myvalue=0;
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd G','HH:mm:ss z", Locale.UK);
    dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata")); //London?
    String[] timestamp = dateFormat.format(new Date()).split(",");
    String datearr[]=timestamp[0].split("\\.");
    //out.println(session.getAttribute("tt"));
	if (session.getAttribute("tt")!= null)
    {
        myvalue=Util.safeInt(session.getAttribute("tt"));
        
    }
    else
    {
        myvalue=Integer.parseInt(datearr[0]);
        
    }

    

	myvalue = myvalue - myAstrologyObject.getYearOfBirth();  
	int period=0;      
    if (myvalue==0)
    	{
        period=1;
    	}
    else
    {
        period=myvalue;
    }

   int day1=myAstrologyObject.getDayOfBirth();
   int year1=myAstrologyObject.getYearOfBirth();
   int month1=myAstrologyObject.getMonthOfBirth();
   int month2=Integer.parseInt(datearr[1]);

    if (month2<=month1)
    	{
        period=period+0;
        currentMonth=0;
    	}
    else
    {
        currentMonth=1;
        period=period+1;
        year1=year1+1;
    }

    
    currYear=myvalue + myAstrologyObject.getYearOfBirth();
%>

<%!

int RaashiNo[]=new int[12];
public void GetRaashi1(int ascendent)
{
RaashiNo[0] = ascendent;
    int i;
    for(i = 0; i<=11-ascendent; i++)
    {
    RaashiNo[i + 1] = RaashiNo[i] + 1;
    
  for(int j = 0; j<=10-i; j++)
  {
RaashiNo[i + 1] = j + 1;
i = i + 1;
  }
    }
}
 %>
 <%  
  
   int chartType=Integer.parseInt(session.getAttribute("chartType").toString());
    
 Chart objchart = null;
 Chart pChart2 = null;
 if(chartType==0){
 	
 	objchart= new NorthChart() ;
     pChart2 = new NorthChart();
 	
 }else{
 	objchart= new SouthChart();
 	pChart2 = new SouthChart();
 }
%>
 <% 
 int planetinBhav[]=new int[12];

  int  RaashiNoCorrespondingToPlanets[]=new int[12];
  int RaashiNoCorrespondingToPlanets1[]=new int[13];
  int tempraashi[]=new int[12];
  int myRashi[]=new int[13];
  int detect;
  
  objLalKitab.initializesArrayValuesOfLalKitab();
  RaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
 

 
  
  for(int iCount = 0; iCount<= 11; iCount++)
  {
   RaashiNoCorrespondingToPlanets1[iCount + 1] = RaashiNoCorrespondingToPlanets[iCount];
  }
  
  RaashiNoCorrespondingToPlanets1[0] = 1;
  GetRaashi1(RaashiNoCorrespondingToPlanets1[0]);

  
  int count=0;
  
  for(int i=0; i<12; i++)
  {
   
    if(RaashiNo[i]>=1)
    	{
     tempraashi[count]=RaashiNo[i];
     count=count+1;
    	}
  }
 int mycount=count;
 int mycount2=count;
 for(int i=0; i<=mycount-1; i++)
 {
   tempraashi[mycount2]=RaashiNo[i];
   
 }	    
 
  
  for (int i=0; i<=11; i++)
  {
    myRashi[i+1]=tempraashi[i]+1;
  }
  
int planetno[]=new int[12];
for (int i=1; i<=12; i++)
  {
   planetno[i-1]=RaashiNoCorrespondingToPlanets1[i];
   
  }	
  
detect=tempraashi[0]-1;
for (int i=0; i<=11; i++)
{
   planetno[i]=planetno[i]-detect;
   if (planetno[i]<=0)
	   {
      planetno[i]=planetno[i]+12;
	   }
   planetinBhav[i]=planetno[i];
  
}	  
%>
 
      <%  
    
      int[] planetinBhav2 =  new int[12];
RLalKitab WebSmslalkitab = new RLalKitab();
WebSmslalkitab.set(planetinBhav);

int[] planetinBhavForVarshaphal =  WebSmslalkitab.getAlteredKundli(period,1);

WebSmslalkitab.setSun(planetinBhavForVarshaphal[0]);
WebSmslalkitab.setMoon(planetinBhavForVarshaphal[1]);
WebSmslalkitab.setMars(planetinBhavForVarshaphal[2]);
WebSmslalkitab.setMercury(planetinBhavForVarshaphal[3]);
WebSmslalkitab.setJupiter(planetinBhavForVarshaphal[4]);
WebSmslalkitab.setVenus(planetinBhavForVarshaphal[5]);
WebSmslalkitab.setSaturn(planetinBhavForVarshaphal[6]);
WebSmslalkitab.setRahu(planetinBhavForVarshaphal[7]);
WebSmslalkitab.setKetu(planetinBhavForVarshaphal[8]);
for(int i = 0 ;i<= 11; i++){
   planetinBhav2[i] = planetinBhavForVarshaphal[i];
}

planetinBhav2[9] = 6;
planetinBhav2[10] = 6;
planetinBhav2[11] = 6;
String[] arrSoya =  new String[9];
pChart2.setBhavPositionForPlanets(planetinBhav2);
pChart2.setBhavPositionForRashi(1);


%>
   <%

   for(int iCount = 0; iCount<=8; iCount++){
	    if(WebSmslalkitab.isPlanetSoya(iCount + 1)) {
	        arrSoya[iCount] ="Yes";
	    } else {
	        arrSoya[iCount] ="No";
	    }
	}

   String[] arrKismatJagaanewala = new String[9];
   for(int iCount = 0 ;iCount<= 8;iCount++){

     if(WebSmslalkitab.isPlanetKismatJagganewala(iCount)) {
       arrKismatJagaanewala[iCount] = "Yes"; 
     }else {
       arrKismatJagaanewala[iCount] = "No"; 
     }
   }

   

for(int iCount = 0 ; iCount<=8 ; iCount++){
  arrMalificBenefic[iCount] =lalKitabUtil.getMaleficBenafic(iCount+1 , planetinBhavForVarshaphal[iCount]);
}
   
   %>  
   <script>
<!--
 var birthYear;
 birthYear=<%=year1%>  
-->
    </script>
	  <%
	  out.print("<b>LalKitab Varshaphal</b>" + "<br>");
	   %>
	 <Form Name="LKVarshphal" Method="Post" action="new_LalkitabVarshaphal.asp" id="form1">
     
<Input Name="ChangeYear" size="20" value="<%=currYear%>"><Input Type ="submit" Name="SubmitYear" Value="Change Year">
</form>

<% if (currentMonth==0){ %>
  Varshphal From <b><%=day1+"/"+month1+"/"+(currYear-1)%></b> to <b><%=day1+"/"+month1+"/"+(currYear)%></b>
<%} else {%>	
  Varshphal From <b><%=day1+"/"+month1+"/"+(currYear)%></b> to <b><%=day1+"/"+month1+"/"+(currYear+1)%></b>
<% } %>
<br /><br />
   <div class="textad"><b>Planetory Degree And Their Positions</b><br /> 
 <table>
<tr> 
   <% for (int ij=0; ij<=5; ij++){ %>
   <td><b><%=arrHeading[ij]%></b>&nbsp;</td>
    <% }%>
</tr>	 
   <% for (int i=0; i<=8; i++) {%>
    <tr>
   <td><%=arrPlanet[i]%>&nbsp;</td>
   <td><%= arrSign[i]%>&nbsp;</td>
   <td><%=	arrPosition[i]%>&nbsp;</td>
   <td><%=arrSoya[i]%>&nbsp;</td>
   <td><%= arrKismatJagaanewala[i]%>&nbsp;</td>
   <td><%=maleficBenefic[arrMalificBenefic[i]]%>&nbsp;</td>

 </tr> 
 <%}%>
</table>  
</div><br />

<% 

					arrHeading2[0] = "KhanaNo";
					arrHeading2[1] = "Maalik";
					arrHeading2[2] = "PakkaGhar";
					arrHeading2[3] = "Kismat";
					arrHeading2[4] = "Soya";
					arrHeading2[5] = "Exallt";
					arrHeading2[6] = "Deblt";

					for(int i = 0 ;i<= 11; i++){
					arrKhana[i]=i+1;
					}
	      
	      String arrMaalik[]=new String[12];   
				 
				arrMaalik[0]="Mar";
				arrMaalik[1]="Ven";
				arrMaalik[2]="Mer";
				arrMaalik[3]="Mon";
				arrMaalik[4]="Sun";
				arrMaalik[5]="Mer";
				arrMaalik[6]="Ven";
				arrMaalik[7]="Mar";
				arrMaalik[8]="Jup";
				arrMaalik[9]="Sat";
				arrMaalik[10]="Sat";
				arrMaalik[11]="Jup";
				
				
					  
				planetName[1]="Sun";
				planetName[2]="Moon";
				planetName[3]="Mars";									   
				planetName[4]="Mer";				  
				planetName[5]="Jup";					   
				planetName[6]="Ven";
				planetName[7]="Sat";
				planetName[8]="Rahu";
				planetName[9]="Ketu";

 
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


for(int icount = 1; icount<=9; icount++)
{
  
  if(WebSmslalkitab.isPlanetSoya(icount))
	  {
    arrSoya2[icount]= "Yes";
	  }
  else if(!WebSmslalkitab.isPlanetSoya(icount))
	  {
    arrSoya2[icount] = "No";
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
%>

      <div class="textad"><b>House Positions</b><br />
<%
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
%>
<table>
<tr> 
   <% for (int ij=0; ij<=6; ij++){ %>
   <td><b><%=arrHeading2[ij]%></b>&nbsp;</td>
    <% } %>
</tr>	 
   <% for(int i = 0; i<=11; i++){ %>
    <tr>
   <td><%=arrKhana[i]%>&nbsp;</td>
   <td><%= arrMaalik[i]%>&nbsp;</td>
   <td><%=	arrPakkaGhar[i]%>&nbsp;</td>
   <td><%=arrKismat[i]%>&nbsp;</td>
   <td><%= arrSoya2[i]%>&nbsp;</td>
    <td><%= arrExalt[i]%>&nbsp;</td>
    <td><%= arrDeblt[i]%>&nbsp;</td>

 </tr> 
 <%}%>  
 </table>
</div>
<br />
<%@include file='/m/include/i_footer.jsp'%>
</body>
</html>