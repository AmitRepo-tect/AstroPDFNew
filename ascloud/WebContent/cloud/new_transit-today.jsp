<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*, java.util.*" %>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.MessageFormat"%>

<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
 <script type="text/javascript" src="/cloud/js/constents.js"></script>
 <script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
 <script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%!
// diff out put coming from common class that's why this seprate method is created.
public static String getRashiNameForTransitToday(String engRashiName, int languageCode)
{
	String langRashiName = engRashiName;
	int i=0;
	final String[] engRashiNames1 = {"Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpion","Sagittarius","Capricorn","Aquarius","Pisces"};
	for(String langRashi : engRashiNames1)
	{
		if(engRashiName.equals(langRashi))
		{
			langRashiName = Common.langRashiNames[languageCode][i];
			break;
		}
		i++;
	}
	return langRashiName;
}
%>
<%
	String transittype = request.getParameter("transittype");
    Boolean selectChart=false;
	if(transittype==null)
	{
		selectChart=false;
	}
	else if(transittype.equals("0") || transittype.equals(""))
	{
		selectChart=false;
	}
	else if(transittype.equals("1"))
	{
		selectChart=true;
	}
    //Dim ObjHoro,ObjConst, ConstPath,planetrasi, RasiForPrediction,arrPlanetsShodashvarga,planetno,detect;
	//Dim myPlanetNames(12) ,RaashiNoCorrespondingToPlanets1(12),tempraashi(12),myrashi(12),RaashiNo(13);
	Hindi hindi = new Hindi();
	String  ConstPath="";
	int RasiForPrediction=0,detect=0;
	String[] myPlanetNames = new String[12];
	int[] RaashiNoCorrespondingToPlanets1 = new int[12];
	int[] tempraashi = new int[13];
	int[] myrashi = new int[12];
	int[] RaashiNo = new int[13];
	int[] planetno = new int[12];
	int[] T_arrPlanetsShodashvarga=new int[12];
	int[] arrPlanetsShodashvarga=new int[12];
	int[] T_planetno = new int[12];
	int[] planetrasi = new int[13];
	
	//Set ObjHoro = session.getAttribute("HoroscopeObj");
    //Set ObjCurrHoro = server.CreateObject("HoroDesktop.DesktopHoro");
	//Set ObjConst = server.CreateObject("HoroDesktop.Constants");
	DesktopHoro ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
    DesktopHoro ObjCurrHoro=new DesktopHoro();
	Constants ObjConst=new Constants();
	Local local = new Local();
	int languageCode = (Integer)session.getAttribute("languageCode");
    MyResourceBundle rBTransittype = local.loadPropertiesFileNew("transittoday", languageCode); 
    MyProperties rBConstants = (MyProperties) session.getAttribute("constants");

    
    final DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); 
    
    Date date = new Date();
    String FullDate[]=sdf.format(date).split(" ");
    String year[]=FullDate[0].split("/");
    String time[]=FullDate[1].split(":");

    
    ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
	ObjCurrHoro.setName(ObjHoro.getName());
    ObjCurrHoro.setPlace(ObjHoro.getPlace());
    ObjCurrHoro.setCompanyAddLine1 ("Delhi");
    ObjCurrHoro.setCompanyName ("CSL Software Ltd");
    ObjCurrHoro.setTimeZone("5.5");
    ObjCurrHoro.setMaleFemale(ObjHoro.getMaleFemale());
    ObjCurrHoro.setSecondOfBirth(time[2]);
    ObjCurrHoro.setMinuteOfBirth(time[1]);
    ObjCurrHoro.setHourOfBirth(time[0]);
    ObjCurrHoro.setDayOfBirth(year[2]);
    ObjCurrHoro.setMonthOfBirth(year[1]);
    ObjCurrHoro.setYearOfBirth(year[0]);
    ObjCurrHoro.setDegreeOfLattitude("27");
    ObjCurrHoro.setDegreeOfLongitude("78");
    ObjCurrHoro.setSecondOfLattitude("00");
    ObjCurrHoro.setSecondOfLongitude("00");
    ObjCurrHoro.setMinuteOfLongitude("00");
    ObjCurrHoro.setMinuteOfLattitude("09");
    ObjCurrHoro.setEastWest("E");
    ObjCurrHoro.setNorthSouth("N");
    ObjCurrHoro.setDST("0");
   if (languageCode==1)
	  {
		ObjCurrHoro.setLanguageCode("1");
	  }
	else
    {
	   ObjCurrHoro.setLanguageCode("0");
	    	
	}
	       	
	//ObjCurrHoro.setAyanamsaType(0);
    //ObjCurrHoro.setAyanamsaType(ObjHoro.getAyanamsaType());
    ObjCurrHoro.setAyan(Integer.parseInt(SharedFunction.getAyan(ObjHoro)));
	ObjCurrHoro.initialize();
    
   int  chartType = Integer.parseInt(session.getAttribute("chartType").toString());
    
     if(chartType==0)
    	{
    	//Set objchart1=Server.Createobject("Horodesktop.NorthChart");
    	//NorthChart objchart1=new NorthChart();
    	}
        
    else
    {
	    //Set objchart1=Server.Createobject("Horodesktop.SouthChart");
	    //SouthChart objchart1=new SouthChart();
	    
    }       
     /*'-----------------Code Of Lagna and transit Chart---------
    '-----------Code For Draw raashi---------
    'Use array RaashiNo For Raashi & RaashiNoCorrespondingToPlanets1
    'For Planet number.
    */
     arrPlanetsShodashvarga = ObjHoro.getPositionForShodasvarg(0);
     /*'FOR TRANSIT CHART WE TAKE TODAY'S PLANETS AND BIRTH'S RASHI*/
     T_arrPlanetsShodashvarga = ObjCurrHoro.getPositionForShodasvarg(0);
    //For k = 0 To 12
    for(int k=0; k<12; k++)
    {
    	RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
    	/*'response.Write("T_arrPlanetsShodashvarga: "&T_arrPlanetsShodashvarga(k)&"<br>")*/
    }
    
    if(transittype == null)
    {
    	RaashiNo =  SharedFunction.getRaashi(RaashiNoCorrespondingToPlanets1[0]);
        RasiForPrediction = ObjHoro.getAscendentSign();
    }
    else if(transittype.equals("0"))
    {
    	RaashiNo =  SharedFunction.getRaashi(RaashiNoCorrespondingToPlanets1[0]);
        RasiForPrediction = ObjHoro.getAscendentSign();
    }
    else if(transittype.equals("1"))
    {
    	RaashiNo= SharedFunction.getRaashi(RaashiNoCorrespondingToPlanets1[2]);
        RasiForPrediction = RaashiNoCorrespondingToPlanets1[2];
    }
    
   
    int count=0;
for (int i=0; i<12; i++)
   {
	
	if (RaashiNo[i]>=1)
	{
		tempraashi[count]=RaashiNo[i];
		count++;
	}
		     
		    
	
   }
    

 int mycount=count;
 int mycount2=count;
 
 for (int i=0; i<=mycount-1; i++)
 {
	 tempraashi[mycount2]= RaashiNo[i]; 
	 //out.println(RaashiNo[0]);
 }
   
	    
 for (int i=0; i<=11; i++)
 {
	 myrashi[i]=tempraashi[i]+1; 
	 //out.println(myrashi[i]);
 }
   
 
/*'--------Code To Draw the Planets----------*/

for (int i=1; i<=12; i++)
{
   planetno[i-1]=arrPlanetsShodashvarga[i];
   T_planetno[i-1]=T_arrPlanetsShodashvarga[i];
}
detect=tempraashi[0]-1;
for (int i=0; i<=11; i++)
{
   planetno[i]=planetno[i]-detect;
   T_planetno[i]=T_planetno[i]-detect;
   if (planetno[i]<=0)
   {
	   planetno[i]=planetno[i]+12;   
   } 
   if (T_planetno[i]<=0)
   {
	   T_planetno[i]=T_planetno[i]+12;  
   } 
   /*'response.Write T_planetno(i)&","*/
}
/*'response.Write "<br/>"&myrashi(12)*/

%>

<div class="hdg-lg card">
	<h1><%=rBTransittype.getString("TRANSIT_TODAY_PREDICTION")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card-panel padding-all">

<h5> <%=rBTransittype.getString("TRANSIT_BASED_ON") %> </h5>

<form action="transit-today.asp" method="post" id="form-id" name="transitfrm">

<select name="transittype" onchange="document.getElementById('form-id').submit()">
                    <option value="0" <%if (!selectChart) { %>Selected<%} %>><%=rBTransittype.getString("ASCENDANT_SIGN") %></option>
                    <option value="1" <%if (selectChart){ %>Selected<%} %>><%=rBTransittype.getString("MOON_SIGN_CHANDRA") %></option>
                </select>
                
                </form>


</div>
</div>
</div>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R">   <%=rBConstants.getString("TRANSIT_CHART") %>   </h2>
<%/*'******************Canvas Chart'**************************************/ %>
             <div id="chartText"></div>
             <div align="center" class="mrt-20">
              <canvas id="chart1" width="600px" height="400px" class="responsive-canvas-m"></canvas>
             <script language="JavaScript" type="text/javascript">

           var  LanguageCode = <%=session.getAttribute("languageCode")%>;
             if (LanguageCode=="")
              {
               LanguageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=session.getAttribute("chartType")%> =="0"){
            chartpref = "north";
            }
          else
          {
          chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chart1");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%

     String mySyn="";
      for (int i = 1; i <= 12; i++)
      {  
      if (i==12)
      {
    	  
    	  mySyn = mySyn + T_planetno[i-1];
      }
      
      else
      {
    	  mySyn = mySyn + T_planetno[i-1] + "," ;
      }
     
      }

     mySyn = myrashi[11]+","+mySyn;
     //out.print("arrPlanets = new Array(" + mySyn+")"); //(Asc, sun,moon,....pl)
     out.print("arrPlanets = new Array(" + mySyn + ");");
     out.print("lagna = " + myrashi[11]);  //(lagna

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 5;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChartOthers(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets,lagna, Chart_Type, LanguageCode,true);  
    var  myval="";

          }  
else {
   $('#chart1').hide();
   $('#td1').hide();
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>
<script language="JavaScript" type="text/javascript">
    $("#chartText").append(myval);
</script>
</div>
</div>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>




    <%
myPlanetNames[1]="SUN";
myPlanetNames[2]="MOON";
myPlanetNames[3]="MARS";									   
myPlanetNames[4]="MERCURY";					  
myPlanetNames[5]="JUPITER";					   
myPlanetNames[6]="VENUS";
myPlanetNames[7]="SATURN";
myPlanetNames[8]="RAHU";
myPlanetNames[9]="KETU";

planetrasi = ObjCurrHoro.getPositionForShodasvarg(0);

 
CloudDAO CDao = new CloudDAO();



//Set shmRsCity = server.CreateObject ("ADODB.Recordset")
//Set ConnObjCity = server.CreateObject ("ADODB.Connection")
//ConnObjCity.Open Application("DSN")
%>
<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<%
//for i = 1 to 9
//bhava = planetrasi(i) - RasiForPrediction + 1
//if bhava < 1 then'
   // bhava = bhava + 12
//end if
DatabaseUtils dBUtils = new DatabaseUtils();
	Connection	connObj = null;
	
try
{
	connObj = dBUtils.getConnection();
	
for(int i=1; i<=9; i++)
{
	int  bhava = planetrasi[i] - RasiForPrediction + 1;
	if(bhava < 1)
	{
		bhava = bhava + 12;
	}

%>

 <h2>  <%
 				String rashiName = ObjCurrHoro.getPlanetaryRasiName(i);
                if(rashiName.equals("Scorpion"))
                {
                	rashiName = "Scorpio";
                }
                
                out.println(MessageFormat.format(rBTransittype.getString("PLANET_RASHI_BHAV_SENTENCE"), rBConstants.getString(myPlanetNames[i]), hindi.unicode(Util.getRashiName(rashiName, languageCode) , languageCode), bhava));
                                   
                %> </h2>
                
                <p>
                    <%=hindi.unicode(CDao.GetLanguageSpecificPrediction(i,languageCode,bhava, connObj),languageCode)%>
                </p>
                
                 <%
        }
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		finally
		{
			dBUtils.closeConnection(connObj, null, null);
		}
        %> 
</div>
</div>
</div>



