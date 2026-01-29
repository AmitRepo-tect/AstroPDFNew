<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.ojassoft.astrosagecloud.DO.BeanKpKhullarCIL"%>
<%@page import="com.ojassoft.astrosagecloud.util.KCILUtil"%>
<%@page import="com.ojassoft.astrosagecloud.DO.InPlanetKpCusp"%>
<%@page import="com.cslsoftware.printhoroscope.Chart"%>
<%@page import="com.cslsoftware.printhoroscope.SouthChart"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%@include file='kp_south.jsp'%>

<%
int languageCode = Util.safeInt(session.getAttribute("languageCode"));

Local local = new Local();
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");

%>

<div class="hdg-lg card">
	<h1><%=rbConstants.getString("KHULLAR_CUSPAL_INTERLINK_SUB") %></h1>	
</div>

<%
	
	InPlanetKpCusp inPlanetCusp = (InPlanetKpCusp) session.getAttribute("KPObj");
	BeanKpKhullarCIL[] beanKCIL = KCILUtil.getKCILBeansArray(inPlanetCusp);
     String[] arr = new String[]{"PLANET","STAR","SUB1","SUB_SUB","POS_STATUS"};
                       
     String[] headarray = new String[] {"T1","T2","T3","T4"};
     String[] contentarray = new String[] {"STARSUB_LORD","SAME_PLANET_APPEAR","SAME_PLANET_STAR","OCCUPANT"};
    
    
    int chartType = Integer.parseInt(String.valueOf(session.getAttribute("chartType")));
    Chart objchart= null;
    if(chartType==0 ){
    	objchart= new NorthChart() ;
} else { 
	   objchart= new SouthChart();
}

    //int ayanamsa1 = 0; again assign
    int[] rashiPosition = new int[13];
    double[] bhavaPositions = new double[13];
    double longitudeDifference;
    for(int j = 0 ; j<=11;j++){
       longitudeDifference = myAstrologyObject.getKPCuspLongitude(j + 1) ;
       if(longitudeDifference >= 360.0){  longitudeDifference = longitudeDifference - 360.0 ;}
       bhavaPositions[j] = longitudeDifference;
       rashiPosition[j] = (int)(longitudeDifference / 30) + 1;
     
    }
    int[] rashiPositionnew =  new int[13];
    int[] bhavPositionnew =  new int[13];
    int[] bhavPosition =  new int[13];
    
    SharedFunction sf = new SharedFunction();
     for(int k = 0; k<=11; k++){
         longitudeDifference = myAstrologyObject.getKPPlanetLongitude(k + 1) ;
         rashiPositionnew[k] = (int)(longitudeDifference / 30) + 1	;
        
         if(longitudeDifference >= 360.0 ){
 	        longitudeDifference = longitudeDifference - 360.0;
         }
         //Add new condition so that it will not crash when negative value will come.
         if(longitudeDifference<0){ 
     	    longitudeDifference = longitudeDifference+360.0;
         }
         bhavPosition[k] = sf.getPlanetBhavaPosition(longitudeDifference, bhavaPositions); // same functinality getKPPlanetBhavaPosition
        
         
     }
    

     for(int k = 0 ;k<= 11;k++){
         bhavPositionnew[k+1] = bhavPosition[k];
      }
     bhavPositionnew[0] = rashiPosition[0];

     //getRaashiPosition(rashiPosition);
     int[] RaashiNo =  new int[13];
        for(int l=0 ;l<=12;l++){
     	   RaashiNo[l]=   rashiPosition[l];
        }
    int count=0;
    int[] tempraashi =  new int[13];
     for(int m=0 ;m<=12;m++){
         if(RaashiNo[m] >=1 ){
             tempraashi[count]=RaashiNo[m];
             count=count+1;
         }
     }
     int mycount=count;
     int mycount2=count;
     for(int n=0 ;n<=mycount-1;n++){
         tempraashi[mycount2]=RaashiNo[n];
     }
     int[] myRashi =  new int[13];
     for(int a=0 ;a<=11;a++){
         myRashi[a+1]=tempraashi[a]+1;
     }       
%>

<div class="row mrt-30 planet-table"> 
<div class="col s12 l12">
<div class="card table-panel">
<table class="highlight striped bordered responsive-table ui-table">
<thead>
<tr class="amber lighten-5">
       
        <% for(int icount=0;icount<=4;icount++) { %>
       <th>
               <%=rbConstants.getString(arr[icount])%>
            </th>
            <% } %>
       </tr>
       </thead>
         <!--sun-->
         <% for(int tcount=0;tcount<9;tcount++) { %>
       <tr>
        <td>
              <b>  <%=rbConstants.getString(Common.arrLongPlanetName[beanKCIL[tcount].getPlanet()].toUpperCase())%> </b> 
         </td>     
        <td>
          <%=KCILUtil.getFormattedLevelValues(beanKCIL[tcount].getKCILType1(), false)%>
        </td>
        <td>
          <%=KCILUtil.getFormattedLevelValues(beanKCIL[tcount].getKCILType2(), false)%>
        </td>
        <td>
          <%=KCILUtil.getFormattedLevelValues(beanKCIL[tcount].getKCILType3(), false)%>
        </td>
        <td>
          <%=KCILUtil.getFormattedLevelValues(beanKCIL[tcount].getKCILType4(), false)%>
        </td>
           </tr>
        <!--moon-->
       <% } %>

</table>
</div>
</div>
</div>



<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=rbConstants.getString("CUSP") %>&nbsp; <%=rbConstants.getString("CHART") %> </h2>
<center> 
<canvas id="CanvasKpPCusp" width="600px" height="400px" class="responsive-canvas-m mrt-20"></canvas></center>
            <script language="JavaScript" type="text/javascript">
var myval;

LanguageCode = <%=session.getAttribute("languageCode")%>;
if (LanguageCode=="")
{
LanguageCode =0;
}
var textcolor = COLOR_INFO;
if('<%=session.getAttribute("chartType")%>' =="0"){
chartpref = "north";
}

else{
chartpref = "south";
}

if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasKpPCusp");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType")%>'; 
   
<%
String mySyn = "";
String mySyn1 = "";
String mySyn2 = "";
String mySyn3 = "";


for(int i = 0; i<= 11;i++){
    mySyn = mySyn + bhavPositionnew[i]+ ","; 
    mySyn1 = mySyn1 +rashiPosition[i] + ","; 
    mySyn2 = mySyn2 + rashiPositionnew[i] +"," ;
}

mySyn = mySyn + bhavPositionnew[12] ;
mySyn1 = mySyn1 + rashiPosition[11] ;
mySyn2 = mySyn2 + rashiPositionnew[11]; 
mySyn3 = mySyn3+"{"+array1+"}"+","+"{"+array2+"}"+","+"{"+array3+"}"+","+"{"+array4+"}"+","+"{"+array5+"}"+","+"{"+array6+"}"+","+"{"+array7+"}"+","+"{"+array8+"}"+","+"{"+array9+"}"+","+"{"+array10+"}"+","+"{"+array11+"}"+","+"{"+array12+"}";

out.println("bhavPositionnew = new Array(" + mySyn + ");");
out.println("rashiPosition = new Array(" + mySyn1 + ");");
out.println("rashiPositionnew = new Array(" + mySyn2 + ");");
out.println("RaashiNoCorrespondingToPlanets = new Array(" + mySyn3 + ");");

%>
    x1_canvas= 50+40;
    y1_canvas= 5;
    x2_canvas= 400-5+120+20;
    y2_canvas= 300+20+60;
  
    PrintChartofKP(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, bhavPositionnew,rashiPositionnew,rashiPosition,RaashiNoCorrespondingToPlanets, Chart_Type, LanguageCode,true);  
      myval="";
          }  
else {
   $('#CanvasKpPCusp').hide();   $('#h31').hide();
     myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>

				<script language="JavaScript" type="text/javascript">
    $("#chart").append(myval);
</script>
</div>
</div>
</div>


<%!
   


//Dim RaashiNo(12)   
   
public int getKPPlanetBhavaPosition(double planetLongitude , double[] cuspsLongitudes)
{
    double startd , endd=0; 
    double d3=0; 
    int bhava=0; 
    double pl = planetLongitude;
    for(int j = 0;j<=11;j++)
    {
      startd = cuspsLongitudes[j];
     endd = cuspsLongitudes[j >= 11?  j - 11 : j + 1];
      if(startd > endd) 
      {
		d3 = endd;
		endd = endd +360;
      }
      if(d3 != 0) 
      {
		if(pl < d3) 
		{
		  pl = pl + 360;
		  d3 = 0;
		}
      }
      if(pl >= startd && pl < endd) 
      {
		bhava = j + 1;
      }
    }
    return bhava;
}
     
/*public void getRaashiPosition(rashiPosition())
For i = 0 To 11
RaashiNo(i) = rashiPosition(i)
Next
End Sub     */
	
%>
