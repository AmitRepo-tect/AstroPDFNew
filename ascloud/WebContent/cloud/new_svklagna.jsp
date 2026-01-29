<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.printhoroscope.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.io.*"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%
Local local = new Local();

int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBSvklagnaShodascharts = local.loadPropertiesFileNew("svklagna-shodascharts",languageCode);
MyResourceBundle rBSvklagnaVarshphalShodascharts = local.loadPropertiesFileNew("svklagna-varshphalallpages-shodascharts",languageCode);
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("SHODASHVARGA_CHARTS")%></h1>	
</div>

<%

int[] RaashiNo = new int[12];


DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
String chartTypeString = Util.safestr(session.getAttribute("chartType"));
int chartType = Util.safeInt(chartTypeString);
//PrintWriter Writer = new PrintWriter(out);
Map svkMap = Common.svkUrls;
Iterator keyIterator = svkMap.keySet().iterator();
int[][] array = new int[16][13];
int count=0;
while(keyIterator.hasNext())
{
//-----------------##Code Of Shodash Kundli##------------------
String[] headingVals = (String[])svkMap.get(keyIterator.next());
%>


<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=rBConstants.getString(headingVals[1].toUpperCase())%>   </h2>

<h3 class="ui-h3" align="center">
				<% String x = headingVals[2].toUpperCase().replaceAll(" ", "_");
                if(!x.isEmpty())
                {
	                try{
	                out.println(rBSvklagnaVarshphalShodascharts.getString(x));
	                }
	                catch(Exception e)
	                {
	                	out.println(rBSvklagnaShodascharts.getString(x));
	                }
                }%>
			</h3>
			
			
			<%array[count] = CanvasDrawShodashKundli(count+1,chartType ,myAstrologyObject,out);
String canvasId = "Canvas"+(count+1);
%>

<div id="chartText"></div>

<div align="center">
	<canvas id="<%=canvasId%>" width="600px" height="400px"
		class="responsive-canvas-m"></canvas>
	<script language="JavaScript" type="text/javascript">

             var LanguageCode = <%=languageCode%>;
             if (LanguageCode=="")
              {
             LanguageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=chartTypeString%> =="0"){
            	chartpref = "north";
            }
	        else{
	          chartpref = "south";
	        }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("<%=canvasId%>");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=chartTypeString %>'; 
<%

String mySyn = "";
      for(int i = 0;i<=11;i++)
      {
	      if (i==11){
	      mySyn = mySyn + array[count][i]; // north
	      } else{
	      mySyn = mySyn + array[count][i] + "," ;
	      }
      }

     mySyn = array[count][12]+","+mySyn;
     out.println("arrPlanets = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl
     out.println("lagna = " + array[count][12]+";");  //(lagna

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 20;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChartOthers(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets,lagna, Chart_Type, LanguageCode,true);  
      myval="";

          }  
else {
  
}
</script>
</div>


</div>
</div>
</div>

<% count++;} ; %>




<p><%@include file='calculations-footer.jsp'%></p>
<% //Writer.close(); %>
<%!

public int[] GetRaashi1(int ascendent ,JspWriter out) {
int[] RaashiNo =  new int[13];
RaashiNo[0] = ascendent;
  int i = 0;
  int k = 0 ;
  for(i = 0 ; i<=(11 - ascendent) ;  i++){
  RaashiNo[i + 1] = RaashiNo[i] + 1;
  //out.println(RaashiNo[i + 1]+","+ascendent+","+i+"<br/>");
  
  }
  
  k = i; //for fix loop iteration 
  //out.println("before loop:-"+k+"<br>");
  
for(int j = 0 ; j<= 10 - k ; j++){
RaashiNo[i + 1] = j + 1 ; 
//out.println(RaashiNo[i + 1]+",i="+i+"<br/>");
i = i + 1;
}
return RaashiNo;
}

public int[] CanvasDrawShodashKundli(int KundliNo, int chartType, DesktopHoro myAstrologyObject,JspWriter out)
{
	Chart objchart = null;
	 //int chartType = Integer.parseInt(String.valueOf(session.getAttribute("ChartType")));
	    
	    if(chartType==0) 
	    	
	    			objchart = new NorthChart();
	    else{
	    	
	    			objchart = new SouthChart();
	    }
	  	
	//DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
int[] arrPlanetsShodashvarga= new int[13];
int[] tempraashi= new int[13];
int[] myRashi= new int[13];
int[] RaashiNo= new int[13];

int mycount;
int mycount2;

int[] RaashiNoCorrespondingToPlanets1= new int[13];
	 myAstrologyObject.saptavg();
    
    arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(KundliNo - 1);

 for(int k = 0;k<=12;k++)
 {
	RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
 }
  
  RaashiNo = GetRaashi1(RaashiNoCorrespondingToPlanets1[0], out);

 int count=0;
for(int i=0;i<=12;i++)
{
    if(RaashiNo[i]>=1)
    {
     tempraashi[count]=RaashiNo[i];
     count=count+1;
    }
}
 mycount=count;
 mycount2=count;
 for(int i=0;i<=mycount-1;i++)
 {
   tempraashi[mycount2]=RaashiNo[i];
 }	    
 
  
  for(int i=0;i<=11;i++)
  {
    myRashi[i+1]=tempraashi[i]+1;
  } 

int[] planetno = new int[13];
for(int i=1;i<=12;i++)
{
   planetno[i-1]=arrPlanetsShodashvarga[i];
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

planetno[12] = myRashi[12];	
return planetno;

}
%>