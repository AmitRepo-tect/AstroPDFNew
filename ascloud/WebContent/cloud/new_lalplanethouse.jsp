<%@page import="com.cslsoftware.printhoroscope.SouthChart"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page import="com.cslsoftware.printhoroscope.Chart"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%
Local local = new Local();
int languageCode = (Integer) session.getAttribute("languageCode");
SharedFunction sf = new SharedFunction();
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBLalPlanetHouse = local.loadPropertiesFileNew("lalplanethouse",languageCode);
MyResourceBundle rBLalPlanetVarshPhal = local.loadPropertiesFileNew("lalplanethouse-lalkitabvarshaphal",languageCode);
%>

<div class="hdg-lg card">
	<h1><%=rBLalPlanetHouse.getString("LALKITAB_CHART_PLANETS_HOUSES")%></h1>	
</div>

<%

DesktopHoro myAstrologyObject=(DesktopHoro) session.getAttribute("HoroscopeObj");
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
UtilLalkitab lalKitabUtil = new UtilLalkitab();
int[] mRaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);	
int[] mRaashiNoCorrespondingToPlanetsNew = Arrays.copyOf(mRaashiNoCorrespondingToPlanets, mRaashiNoCorrespondingToPlanets.length);
String[] arrHeading = {"PLANETS","RASHI","POSITION","SOYA","KISMAT_JAGANEWALA","BENEFIC_MALEFIC"};
String[] arrPlanet = {"SUN","MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KETU"};
String[] arrPosition = {"DASH","EXALTED","DBLITTED","OWN","FRSIGN","ENSIGN","NUSIGN"};
String[] arrSign = new String[10];
String[] arrSoya = new String[10];
String[] arrSoya2 = new String[12];
arrSoya2[0] = "---";
String[] arrKismatJagaanewala = new String[10];
int[] arrMalificBenefic = new int[10];
//'declare variable Planetory degree

//*************Code For Palnetory Degrees & Positions ******

	String yes = rBConstants.getString("YES");
	String no = rBConstants.getString("NO");
  for(int iCount = 0;iCount<=8;iCount++)
  {
    arrSign[iCount] = objLalKitab.getPlanetaryRashiNameForLalkitab(iCount + 1).toUpperCase();
    if(objLalKitab.isPlanetSoya(iCount + 1)) {
        arrSoya[iCount] = yes;
        arrSoya2[iCount+1] = yes;
    } else {
        arrSoya[iCount] =no;
        arrSoya2[iCount+1] = no;
    }
    if(objLalKitab.isPlanetKismatJagganewala(iCount + 1)) {
    	arrKismatJagaanewala[iCount] =yes;
    } else {
    	arrKismatJagaanewala[iCount] =no;
    }
    arrMalificBenefic[iCount] = lalKitabUtil.getMaleficBenafic (iCount+1 , mRaashiNoCorrespondingToPlanetsNew[iCount]);
  }

arrSoya2[10] = "---";
arrSoya2[11] = "---";

String[] maleficBenefic = new String[2];
maleficBenefic[0] = "<font color=red>"+ rBConstants.getString("MALEFIC") +"</font>" ;
maleficBenefic[1] = rBConstants.getString("BENEFIC");

        %>
        
        <div class="row mrt-30 planet-table">
                           <div class="col s12 l12 ui-btm ui-btm-zero">
                              <div class="card table-panel">
                              
                            
                                       <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBLalPlanetHouse.getString("PLANETORY_DEGREE_POSITIONS")%> </h4>
                                        
                             
                                 <table class="highlight striped bordered ui-table responsive-table ui-font">
                                 <thead>
                                  <tr>
		<% for(int ij=0;ij<=5;ij++){ %>
		<th class="cellhead"><b> <%=rBLalPlanetVarshPhal.getString(arrHeading[ij])%></b>&nbsp;
		</th>
		<% } %>
	</tr>
	</thead>
	<% for(int i=0;i<=8;i++) { %>
	<tr>
		<td class="cellcontent"><%=rBConstants.getString(arrPlanet[i])%>&nbsp;
		</td>
		<td class="cellcontent"><%=rBConstants.getString(arrSign[i]+"_FULL")%>&nbsp;
		</td>
		<td class="cellcontent"><%=rBLalPlanetVarshPhal.getString(arrPosition[objLalKitab.getRelationship(i+1)])%>&nbsp;
		</td>
		<td class="cellcontent"><%=arrSoya[i]%>&nbsp;</td>
		<td class="cellcontent"><%=arrKismatJagaanewala[i]%>&nbsp;</td>
		<td class="cellcontent"><%=maleficBenefic[arrMalificBenefic[i]]%>&nbsp;
		</td>
	</tr>
	<% } %>
                                 </table>
                                 </div>
                                 </div>

</div>
<%  
       	int[] arrkhana = new int[12];
		String[] arrHeading2 = {"KHANANO","MAALIK","PAKKAGHAR","KISMAT","SOYA","EXALLT","DEBLT"};
               
		 for(int i=0;i<=11;i++)
		 {
		   arrkhana[i]=i+1;
		 }
	    String[] arrMaalik = {"MARS","VENUS","MERCURY","MOON","SUN","MERCURY","VENUS","MARS","JUPITER","SATURN","SATURN","JUPITER"};
	    String[] PlanetName = {"","SUN","MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KET"};
	    String[] constantPlanetName = new String[10];
	    constantPlanetName[0] = "";
	    for(int count=1;count<=9;count++)
	    {
	    	constantPlanetName[count] = rBConstants.getString(PlanetName[count]);
	    }
        String[] arrPakkaGhar = new String[12]; 
		arrPakkaGhar[0] = constantPlanetName[1];
		arrPakkaGhar[1] = constantPlanetName[5];
		arrPakkaGhar[2] = constantPlanetName[3];
		arrPakkaGhar[3] = constantPlanetName[2];
		arrPakkaGhar[4] = constantPlanetName[5];
		arrPakkaGhar[5] = constantPlanetName[4] + " " + constantPlanetName[9];
		arrPakkaGhar[6] = constantPlanetName[6] + " " + constantPlanetName[4];
		arrPakkaGhar[7] = constantPlanetName[3] + " " + constantPlanetName[7];
		arrPakkaGhar[8] = constantPlanetName[5];
		arrPakkaGhar[9] = constantPlanetName[7];
		arrPakkaGhar[10] = constantPlanetName[7];
		arrPakkaGhar[11] = constantPlanetName[5] + " " + constantPlanetName[8];
 	String[] arrKismat = {"MARS","MOON","MERCURY","MOON","SUN","KET","VENUS","MOON","SATURN","SATURN","JUPITER","RAHU"};
	
 	String[] arrExalt = new String[12];
 	arrExalt[0] = constantPlanetName[1];
 	arrExalt[1] = constantPlanetName[2];
 	arrExalt[2] = constantPlanetName[8];
	arrExalt[3] = constantPlanetName[5];
	arrExalt[4] = "---";
	arrExalt[5] = constantPlanetName[4] + " " + constantPlanetName[8];
	arrExalt[6] = constantPlanetName[7];
	arrExalt[7] = "---";
	arrExalt[8] = constantPlanetName[9];
	arrExalt[9] = constantPlanetName[3];
	arrExalt[10] = "---";
	arrExalt[11] = constantPlanetName[6] + " " + constantPlanetName[9];
	
	String[] arrDeblt = new String[12];
	arrDeblt[0] = constantPlanetName[7];
	arrDeblt[1] = "---";
	arrDeblt[2] = constantPlanetName[9];
	arrDeblt[3] = constantPlanetName[3];
	arrDeblt[4] = "---";
	arrDeblt[5] = constantPlanetName[6] + " " + constantPlanetName[9];
	arrDeblt[6] = constantPlanetName[1];
	arrDeblt[7] = constantPlanetName[2];
	arrDeblt[8] = constantPlanetName[8];
	arrDeblt[9] = constantPlanetName[5];
	arrDeblt[10] = "---";
	arrDeblt[11] = constantPlanetName[4] + " " + constantPlanetName[8];
        %>
        
        
        
        
                        <div class="row mrt-30 planet-table">
                           <div class="col s12 l12 ui-btm ui-btm-zero">
                              <div class="card table-panel">
                              
                            
                                       <h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBLalPlanetVarshPhal.getString("HOUSE_POSITIONS") %></h4>
                                        
                             
                                 <table class="highlight striped bordered responsive-table ui-table ui-font">
                                 <thead>
                                 <tr>
		<% for(int ij=0;ij<=6;ij++) { %>
		<th class="cellhead"><b> <%=rBLalPlanetVarshPhal.getString(arrHeading2[ij])%></b>&nbsp;
		</th>
		<% } %>
	</tr>
	</thead>
	<% for(int i=0;i<=11;i++){ %>
	<tr>
		<td class="cellcontent"><%=arrkhana[i]%>&nbsp;</td>
		<td class="cellcontent"><%=rBConstants.getString(arrMaalik[i])%>&nbsp;
		</td>
		<td class="cellcontent"><%=arrPakkaGhar[i]%>&nbsp;</td>
		<td class="cellcontent"><%=rBConstants.getString(arrKismat[i])%>&nbsp;
		</td>
		<td class="cellcontent"><%= arrSoya2[i]%>&nbsp;</td>
		<td class="cellcontent"><%= arrExalt[i]%>&nbsp;</td>
		<td class="cellcontent"><%= arrDeblt[i]%>&nbsp;</td>
	</tr>
	<%}%>
	<%
	//Logger LOGGER = 
   	Chart objChart = null;
            int chartType = 0;
            Object obj = session.getAttribute("chartType");
            if(obj != null)
            {
            	chartType = Integer.parseInt(String.valueOf(obj));
            }
                
    if(chartType==0)
    {
    	objChart = new NorthChart();
    }
    else
    {
    	objChart = new SouthChart();
    }
      
  objLalKitab.initializesArrayValuesOfLalKitab();
  int[] RaashiNoCorrespondingToPlanets = objLalKitab.getPlanetInBhav(1);
 
  int[] RaashiNoCorrespondingToPlanets1 = new int[13];
  for(int iCount = 0;iCount<=11;iCount++)
  {
    RaashiNoCorrespondingToPlanets1[iCount + 1] = RaashiNoCorrespondingToPlanets[iCount];
  }
  
  RaashiNoCorrespondingToPlanets1[0] = 1;
  int[] RaashiNo = SharedFunction.getRaashi(1);
  int[] tempraashi = new int[13];
  int[] myRashi = new int[13];

  int count=0;
  for(int i=0;i<=12;i++)
  {
    if (RaashiNo[i]>=1) 
    {
     tempraashi[count]=RaashiNo[i];
     count=count+1;
    }
  }
 int mycount=count;
 int mycount2=count;
 for(int i=0;i<=mycount-1;i++)
 {
   tempraashi[mycount2]=RaashiNo[i];
 }	    
   
  for(int i=0;i<=11;i++)
  {
    myRashi[i+1]=tempraashi[i]+1;
  } 
  
int[] planetno = new int[12];
for(int i=1;i<=12;i++)
{
   planetno[i-1]=RaashiNoCorrespondingToPlanets1[i];
}	
  
int detect=tempraashi[0]-1;
for(int i=0;i<=11;i++)
{
   planetno[i]=planetno[i]-detect;
   if(planetno[i]<=0)
	{
      planetno[i]=planetno[i]+12;
    
	}
  
}	  
int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);

for(int k = 0;k<=12;k++)
{
   RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
}

/*for(int i=0;i<=11;i++)
{
	planetno[i] = Astrology.GetPlanetInBhava(RaashiNoCorrespondingToPlanets1[0], RaashiNoCorrespondingToPlanets1[i+1]);
}  */
 %>
                                 </table>
                                 </div>
                                 </div>
                                 </div>
                                 
                                       
        
        
        
        
        
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=rBLalPlanetVarshPhal.getString("LAL_KITAB_CHART") %> </h2>



<div id="chartText"></div>
<div align="center">
	<canvas id="chartLalPHouse" width="600px" height="400px"
		class="responsive-canvas-m"></canvas>
	<script language="JavaScript" type="text/javascript">

             var LanguageCode = <%=languageCode%>;
             
             var textcolor = COLOR_INFO;

            if(<%=chartType%> =="0"){
            chartpref = "north";
            }
          else{
          chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("chartLalPHouse");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartType %>'; 
<%

	  String mySyn = "";
	  String mySyn1 = "";
      for(int i = 1;i<=12;i++)
      {
    	  mySyn = mySyn + planetno[i-1] + ","; 
      }
      mySyn = mySyn.replaceAll(",$","");
      // In Case of south print lagna chart
     for(int i = 0;i<=11;i++)
     {
    	mySyn1 = mySyn1 + RaashiNoCorrespondingToPlanets1[i] + ",";
     }

    mySyn1 = mySyn1 + RaashiNoCorrespondingToPlanets1[12];
    out.println("arrPlanetsShodashvarga = new Array(" + mySyn1 + ");"); //(Asc, sun,moon,....pl)

    mySyn = "1,"+mySyn;
    out.println("arrPlanets = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl)

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 20;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
     //if (Chart_Type==0)
    // {
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets, Chart_Type, LanguageCode,true);  
   // }else
   // {
   // PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, LanguageCode,false); 
   // }
      myval="";

          }  
else {
   $('#chartLalPHouse').hide();
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






<%@include file='lalkitab-footer.jsp'%>