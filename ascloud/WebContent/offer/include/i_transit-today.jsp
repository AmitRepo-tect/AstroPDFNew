

<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>

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
    ObjCurrHoro.setTimeZone(ObjHoro.getTimeZone());
    ObjCurrHoro.setMaleFemale(ObjHoro.getMaleFemale());
    ObjCurrHoro.setSecondOfBirth(time[2]);
    ObjCurrHoro.setMinuteOfBirth(time[1]);
    ObjCurrHoro.setHourOfBirth(time[0]);
    ObjCurrHoro.setDayOfBirth(year[2]);
    ObjCurrHoro.setMonthOfBirth(year[1]);
    ObjCurrHoro.setYearOfBirth(year[0]);
    ObjCurrHoro.setDegreeOfLattitude(ObjHoro.getDegreeOfLattitude());
    ObjCurrHoro.setDegreeOfLongitude(ObjHoro.getDegreeOfLongitude());
    ObjCurrHoro.setSecondOfLattitude("00");
    ObjCurrHoro.setSecondOfLongitude("00");
    ObjCurrHoro.setMinuteOfLongitude(ObjHoro.getMinuteOfLongitude());
    ObjCurrHoro.setMinuteOfLattitude(ObjHoro.getMinuteOfLattitude());
    ObjCurrHoro.setEastWest(ObjHoro.getEastWest());
    ObjCurrHoro.setNorthSouth(ObjHoro.getNorthSouth());
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
<div align="center" class="heading-sec">
    <h2>
        <%=rBTransittype.getString("TRANSIT_TODAY_PREDICTION")%>
    </h2>
</div>

<div class="inner-sec">
 
                <h3 class="text-center" id="td1">
                    <%=rBConstants.getString("TRANSIT_CHART") %></h3>
           
       
             <%/*'******************Canvas Chart'**************************************/ %>
             <div id="chartText"></div>
             <div align="center">
              <canvas id="chart1" width="600px" height="400px" class="ui-canvas"></canvas>
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
      myval="";

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
         </td>
         <tr>
         <td>&nbsp;</td>
         </tr>
        </tr>
    </table>
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
//Set shmRsCity = server.CreateObject ("ADODB.Recordset")
//Set ConnObjCity = server.CreateObject ("ADODB.Connection")
//ConnObjCity.Open Application("DSN")
%>
        <h3>
                <%
                if(ObjCurrHoro.getPlanetaryRasiName(i).equals("Scorpion"))
                {out.println(hindi.unicode(rBConstants.getString(myPlanetNames[i])+" "+rBConstants.getString("IS_IN") + getRashiNameForTransitToday(ObjCurrHoro.getPlanetaryRasiName(i), languageCode) +" "+ rBConstants.getString("IN_YOUR")+" "+ bhava +" "+SharedFunction.NoSuffix(bhava)+ " "+rBConstants.getString("IS_HOUSE"),languageCode));}
                else
                {
                	out.println(hindi.unicode(rBConstants.getString(myPlanetNames[i])+" "+rBConstants.getString("IS_IN") + Util.getRashiName(ObjCurrHoro.getPlanetaryRasiName(i), languageCode) +" "+ rBConstants.getString("IN_YOUR")+" "+ bhava +" "+SharedFunction.NoSuffix(bhava)+ " "+rBConstants.getString("IS_HOUSE"),languageCode));
                }
                    
                %>
            </h3>
       
                <p>
                    <%=hindi.unicode(CDao.GetLanguageSpecificPrediction(i,languageCode,bhava, connObj),languageCode)%>
                </p>
           <% }}
catch(Exception e)
{
	e.printStackTrace();	
}
finally
{
	dBUtils.closeConnection(connObj, null, null);
} %> 
   

</div>
