<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.PropertyResourceBundle"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div align="center" class="ui-global-table RScroll" style="max-height:262px; overflow-y:scroll;">
<%	
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro myAstrologyObject= (DesktopHoro) session. getAttribute("HoroscopeObj");
int languageCode = (Integer)session.getAttribute("languageCode");
Local local = new Local();
MyResourceBundle rBLalplanet = local.loadPropertiesFileNew("lalplanethouse-lalkitabvarshaphal", languageCode); 

SharedFunction sf = new SharedFunction();
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
UtilLalkitab lalKitabUtil = new UtilLalkitab();



String[] maleficBenefic=new String[2];
String[] arrMalificBenefic=new String[9];
int[] mRaashiNoCorrespondingToPlanets=new int[6];
int RaashiNo[]=new int[12];
String[] arrHeading=new String[5];
String[] arrPlanet=new String[12];
String[] arrSign=new String[9];
String[] arrPakkaGhar=new String[12];
String[] arrDegree=new String[9];
String[] arrPosition=new String[9];
String[] arrSoya=new String[8];
String[] arrKismatJagaanewala=new String[9];
String[] arrHeading2=new String[7];
String[] PlanetName=new String[9];
int[] planetinBhav=new int[12];
int[] tempraashi=new int[12];
String[] myrashi=new String[12];
String[] arrKismat=new String[12];
String[] arrSoya2=new String[12];
String[] arrExalt=new String[12];
String[] arrDeblt=new String[12];
int[] arrKhana=new int[12];
int[] RaashiNoCorrespondingToPlanets=new int[12];
int[] RaashiNoCorrespondingToPlanets1=new int[12];
//int[] planetinBhavForVarshaphal=new int[9];


    objLalKitab.setName (myAstrologyObject.getName());
    objLalKitab.setPlace (myAstrologyObject.getPlace());
    objLalKitab.setTimeZone (myAstrologyObject.getTimeZone());
    objLalKitab.setMaleFemale (myAstrologyObject.getMaleFemale());
    objLalKitab.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
    objLalKitab.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
    objLalKitab.setHourOfBirth (myAstrologyObject.getHourOfBirth());
    objLalKitab.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
    objLalKitab.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
    objLalKitab.setYearOfBirth (String.valueOf(myAstrologyObject.getYearOfBirth()));
    objLalKitab.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
    objLalKitab.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
    objLalKitab.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
    objLalKitab.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
    objLalKitab.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
    objLalKitab.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
    objLalKitab.setEastWest (myAstrologyObject.getEastWest());
    objLalKitab.setNorthSouth (myAstrologyObject.getNorthSouth());
    objLalKitab.setDST (myAstrologyObject.getDST());
    objLalKitab.setLanguageCode ("0");
    objLalKitab.initialize();
    mRaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);

    for(int iCount = 0; iCount<= 8; iCount++)
    {
    	arrSign[iCount] = rBConstants.getString(objLalKitab.getPlanetaryRashiNameForLalkitab(iCount + 1));    
    }
    
    
     //'************* code for current year ***********
     final DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd"); 
     Calendar cal = Calendar.getInstance();
    Date date = new Date();
    String fullYear[]=sdf.format(date).split("/");
    int year= Integer.parseInt(fullYear[0]);
    
    int myvalue=year ;
    int period=0,currentMonth=0,currYear;
    int myValue=cal.get(Calendar.YEAR);
   // out.println(myValue+","+myAstrologyObject.getYearOfBirth());
    myValue = (int)myValue - (int)myAstrologyObject.getYearOfBirth();  
   
    if (myValue==0)
    	{
    	period=1;
    	}
    	
        
    else
    {
        period=myValue;
    }
    int day1=myAstrologyObject.getDayOfBirth();
    int year1=myAstrologyObject.getYearOfBirth();
    int month1=myAstrologyObject.getMonthOfBirth();
    int month2=cal.get(Calendar.MONTH);
    if(month2<=month1)
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
    
    //'Use the currYear to print the heading
    currYear=myValue + myAstrologyObject.getYearOfBirth();
      
    objLalKitab.initializesArrayValuesOfLalKitab();
    
    RaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);

    
    for (int iCount = 0; iCount<11; iCount++)
    {
        RaashiNoCorrespondingToPlanets1[iCount + 1] = RaashiNoCorrespondingToPlanets[iCount];
    }

    RaashiNoCorrespondingToPlanets1[0] = 1;
    RaashiNo =SharedFunction.getRaashi(RaashiNoCorrespondingToPlanets1[0]);
    int count=0;
    for(int i=0; i< 12; i++)
    {
        if( RaashiNo[i]>=1)
        {
            tempraashi[count]=RaashiNo[i];
            count=count+1;
        }
    }
    int mycount=count;
    int mycount2=count;
    for (int i=0; i<= mycount-1; i++)
    {
        tempraashi[mycount2-1]=RaashiNo[i];  
    }	    

   // '--------Code To Draw the Planets----------
    int[] planetno=new int[12];
    for( int i=1;  i< 12; i++)
    {
        planetno[i-1]=RaashiNoCorrespondingToPlanets1[i];
    }	
      
    int detect=tempraashi[0]-1;
    for(int i=0; i<=11; i++)
    {
        planetno[i]=planetno[i]-detect;
        if( planetno[i]<=0)
        { 
            planetno[i]=planetno[i]+12;
        }
        planetinBhav[i]=planetno[i];   
    }	  
     //out.println(planetinBhav);
    RLalKitab WebSmslalkitab = new RLalKitab();
    WebSmslalkitab.set(planetinBhav);
    
  //int[] planetinBhavForVarshaphal=new int[9];
    //out.println(period+"neha");
    int[] planetinBhavForVarshaphal =  WebSmslalkitab.getAlteredKundli(period,1);
    int[] planetinBhav2 =  new int[13];
   // WebSmslalkitab.getAlteredKundli(period,1);
    WebSmslalkitab.setSun(planetinBhavForVarshaphal[0]);
    WebSmslalkitab.setMoon(planetinBhavForVarshaphal[1]);
    WebSmslalkitab.setMars(planetinBhavForVarshaphal[2]);
    WebSmslalkitab.setMercury(planetinBhavForVarshaphal[3]);
    WebSmslalkitab.setJupiter(planetinBhavForVarshaphal[4]);
    WebSmslalkitab.setVenus(planetinBhavForVarshaphal[5]);
    WebSmslalkitab.setSaturn(planetinBhavForVarshaphal[6]);
    WebSmslalkitab.setRahu(planetinBhavForVarshaphal[7]);
    WebSmslalkitab.setKetu(planetinBhavForVarshaphal[8]);


String[] planetName=new String[10];


String[] arrMaalik=new String[12];




for(int i=0; i<=11;i++)
{
    arrKhana[i]=i+1;
}
	      
  				
arrMaalik[0]="MARS";
arrMaalik[1]="VENUS";
arrMaalik[2]="MERCURY";
arrMaalik[3]="MOON";
arrMaalik[4]="SUN";
arrMaalik[5]="MERCURY";
arrMaalik[6]="VENUS";
arrMaalik[7]="MARS";
arrMaalik[8]="JUPITER";
arrMaalik[9]="SATURN";
arrMaalik[10]="SATURN";
arrMaalik[11]="JUPITER";

planetName[1]="SUN";
planetName[2]="MOON";
planetName[3]="MARS" ;									   
planetName[4]="MERCURY";					  
planetName[5]="JUPITER"	;				   
planetName[6]="VENUS";
planetName[7]="SATURN";
planetName[8]="RAHU";
planetName[9]="KET";

arrHeading2[0] = "KHANANO";
arrHeading2[1] = "MAALIK";
arrHeading2[2] = "PAKKAGHAR";
arrHeading2[3] = "KISMAT";
arrHeading2[4] = "SOYA";
arrHeading2[5] = "EXALLT";
arrHeading2[6] = "DEBLT";
 
arrPakkaGhar[0] = rBConstants.getString(planetName[1]);
arrPakkaGhar[1] = rBConstants.getString(planetName[5]);
arrPakkaGhar[2] = rBConstants.getString(planetName[3]);
arrPakkaGhar[3] = rBConstants.getString(planetName[2]);
arrPakkaGhar[4] = rBConstants.getString(planetName[5]);
arrPakkaGhar[5] = rBConstants.getString(planetName[4]) + " " + rBConstants.getString(planetName[9]);
arrPakkaGhar[6] = rBConstants.getString(planetName[6]) + " " + rBConstants.getString(planetName[4]);
arrPakkaGhar[7] = rBConstants.getString(planetName[3]) + " " + rBConstants.getString(planetName[7]);
arrPakkaGhar[8] = rBConstants.getString(planetName[5]);
arrPakkaGhar[9] = rBConstants.getString(planetName[7]);
arrPakkaGhar[10] = rBConstants.getString(planetName[7]);
arrPakkaGhar[11] = rBConstants.getString(planetName[5]) + " " + rBConstants.getString(planetName[8]);

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
for(int icount=1; icount<=9;icount++)
{
    if(WebSmslalkitab.isPlanetSoya(icount))
    	{
    	arrSoya2[icount] = rBConstants.getString("YES");
    	}
    else{
        arrSoya2[icount] = rBConstants.getString("NO");
    }
}

arrExalt[0] = rBConstants.getString(planetName[1]);
arrExalt[1] = rBConstants.getString(planetName[2]);
arrExalt[2]=  rBConstants.getString(planetName[8]);
arrExalt[3] = rBConstants.getString(planetName[5]);
arrExalt[4] = " ";
arrExalt[5] = rBConstants.getString(planetName[4]) + " " + rBConstants.getString(planetName[8]);
arrExalt[6] = rBConstants.getString(planetName[7]);
arrExalt[7] = " ";
arrExalt[8] = rBConstants.getString(planetName[9]);
arrExalt[9] = rBConstants.getString(planetName[3]);
arrExalt[10] = " ";
arrExalt[11] = rBConstants.getString(planetName[6]) + " " + rBConstants.getString(planetName[9]);
arrDeblt[0] = rBConstants.getString(planetName[7]);
arrDeblt[1] = " ";
arrDeblt[2] = rBConstants.getString(planetName[9]);
arrDeblt[3] = rBConstants.getString(planetName[3]);
arrDeblt[4] = " ";
arrDeblt[5] = rBConstants.getString(planetName[6]) + " " + rBConstants.getString(planetName[9]);
arrDeblt[6] = rBConstants.getString(planetName[1]);
arrDeblt[7] = rBConstants.getString(planetName[2]);
arrDeblt[8] = rBConstants.getString(planetName[8]);
arrDeblt[9] = rBConstants.getString(planetName[5]);
arrDeblt[10] = " ";
arrDeblt[11] = rBConstants.getString(planetName[4]) + " " + rBConstants.getString(planetName[8]);
       
for(int i =0; i<=11; i++)
{
  if(arrExalt[i]==null && arrExalt[i]==" ")
  {
        arrExalt[i]="---";
  } 
    if(i==0 || i==10 || i==11)
    	{
        arrSoya2[i]="---";
    	}
    if(arrDeblt[i]==" " && arrDeblt[i]==null)
    	{
        arrDeblt[i]="---";
    	}  
}    
%>
<table>
<tr>
<% for (int ij=0; ij<= 6; ij++){ %>
<td>
    <b><%=rBLalplanet.getString(arrHeading2[ij])%></b>
</td>
<% }%>
</tr>
<% for (int i=0; i<= 11; i++){%>
<tr>
<td class="cellcontent">
    <%=arrKhana[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%=rBConstants.getString(arrMaalik[i])%>&nbsp;
</td>
<td class="cellcontent">
    <%=arrPakkaGhar[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%=rBConstants.getString(arrKismat[i])%>&nbsp;
</td>
<td class="cellcontent">
    <%= arrSoya2[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%= arrExalt[i]%>&nbsp;
</td>
<td class="cellcontent">
    <%= arrDeblt[i]%>&nbsp;
</td>
</tr>
<%}%>
</table>
</div>