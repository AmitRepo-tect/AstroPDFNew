<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<%
Local local = new Local();
Hindi hindi =  new Hindi();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rbPlanetJamini = local.loadPropertiesFileNew("planetposition-jaminisystemkarakamsaswamsa",languageCode);
%>

<div class="hdg-lg card">
	<h1><%=rbConstants.getString("JAMINISYSTEMKRSW")%></h1>	
</div>


<%
DesktopHoro myAstrologyObject= (DesktopHoro) session.getAttribute("HoroscopeObj");
int[] myPlanetPositionForLagna = myAstrologyObject.getPositionForShodasvarg(0);
int[] myPlanetPositionForNavamasa = myAstrologyObject.getPositionForShodasvarg(5);
//Note: Temp takes planet index who have maximum planet degree. Such plantes called atmyakarak
int[] temp = getAatmaKarakPlanet(myAstrologyObject);
%>
<div id="chart" style="padding-top: 5px;"></div>
<div class="row mrt-30">
<div class="col s12 l6">
<div class="card vd-panel"> 

<%@include file='/cloud/js/draw-chart-match-js.jsp'%>
<%
HashMap<String, String> hmap = insideInfoinSouthIndian(languageCode, myAstrologyObject);
%>
<canvas id="Canvaslagna" width="400px" height="350px" class="responsive-canvas mrt-20"></canvas>
	<script language="JavaScript" type="text/javascript">
languageCode = <%=session.getAttribute("languageCode")%>;
if (languageCode=="")
{
	languageCode =0;
}
textcolor = COLOR_INFO;
if("<%=getSessionInt(session, "chartType")%>" =="0"){
chartpref = "north";
}
else if("<%=getSessionInt(session, "chartType")%>" =="2"){
chartpref = "east";
}
else{
chartpref = "south";
}
if(window.HTMLCanvasElement) {
    var c=document.getElementById("Canvaslagna");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
    Chart_Type = '<%=session.getAttribute("chartType") %>'; 
<%
out.println("getArrOfKarakamsa = new Array(" + getArrOfKarakamsa(myPlanetPositionForLagna,myPlanetPositionForNavamasa,temp) + ");");
%>
    x1= 10;//10+40;
    y1= 25;
    x2= 400-5;//320+75;
    y2= 315+20;//300-20;
    SetFontSize(14);    
 
      if(parseInt(languageCode) == 1){
      PrintText((x1*4)-(5*2),2,"कारकांश चक्र ");
    }
    else if(parseInt(languageCode) == 2){
      PrintText((x1*4)-(5*14),2," கரகாம்ச வரைபடம்");
    }
    else if(parseInt(languageCode) == 4){
      PrintText((x1*4)-(5*2),2, "ಕರಕಾಂಶ ಚಾರ್ಟ್");
    }
    else if(parseInt(languageCode) == 5){
     PrintText((x1*4)-(5*2),2, "కారకాంశ చక్రం"); 
    }
    else if(parseInt(languageCode) == 6){
     PrintText((x1*4)-(5*2),2, "কারকাংশ কুষ্ঠি"); 
    }
    else if(parseInt(languageCode) == 7){
     PrintText((x1*4)-(5*2),2, "કરકાંશ ચાર્ટ"); 
    }
    else if(parseInt(languageCode) == 8){
     PrintText((x1*4)-(5*2),2, "കരകാംശ ചാർട്ട്"); 
    }
    else if(parseInt(languageCode) == 9){
     PrintText((x1*4)-(5*2),2, "कारकांश चक्र"); 
    }
    else{
      PrintText((x1*4)-(5*5),2, "Karakamsa Chart");    
      }
     
    PrintChart(x1-5, y1, x2, y2, getArrOfKarakamsa, Chart_Type, languageCode,false);  
    if( Chart_Type==1){ 
   SetFontSize(12);   
    PrintText((x1*18)-(5*3),(y1*4)+(5*1), '<%=hmap.get("BirthInformation")%>');  
     PrintText((x1*15)-(5*3),(y1*4)+(5*4), '<%=hmap.get("Name")%>'); 
      PrintText((x1*18)-(5*5),(y1*4)+(5*9), '<%=hmap.get("DateOfBirth")%>'); 
       PrintText((x1*18)-(5*6),(y1*4)+(5*12), '<%=hmap.get("timeOfBirth")%>');   
        PrintText((x1*18)-(5*6),(y1*4)+(5*15), '<%=hmap.get("timeZone")%>');  
         PrintText((x1*18)-(5*7),(y1*4)+(5*18), '<%=hmap.get("latitudeinfo")%>');  
          PrintText((x1*18)-(5*7),(y1*4)+(5*21), '<%=hmap.get("longitudeinfo")%>');   
          
          }  
          myval="";
}    
else {
   $('#Canvaslagna').hide();
   myval = "<div align='center' style='padding-top:5px;'><img width='590' height='350' src='lagna-navamsa-chart.asp?Chart_type=Print-Karakamsa-Swamsa+languageCode=<%=session.getAttribute("languageCode") %>+textcolor=0+planetstyle=0+border=1+colorcode=f96d06+Typeofchart=<%=session.getAttribute("chartType")%>+arrofplanetkansas=<%=getArrOfKarakamsa(myPlanetPositionForLagna,myPlanetPositionForNavamasa,temp)%>+arrofplanetsusan=<%=getArrOfSwamsa(myPlanetPositionForLagna,temp) %>'onload=resizeimg(this,'0'); /></div>";
}
</script>
	<script language="JavaScript" type="text/javascript">
    //$("#chart").append(myval);
</script>
</div>
</div>
<div class="col s12 l6">
<div class="card vd-panel"> 
<canvas id="Canvasnavamsa" width="400px" height="350px" class="responsive-canvas mrt-20"></canvas>
	<script language="JavaScript" type="text/javascript">
languageCode = <%=session.getAttribute("languageCode")%>;
textcolor = COLOR_INFO;
if(window.HTMLCanvasElement) {
    var c=document.getElementById("Canvasnavamsa");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=session.getAttribute("chartType") %>'; 
   <%
out.println("GetArrOfSwamsa = new Array(" + getArrOfSwamsa(myPlanetPositionForNavamasa,temp) + ");");
%>
     x1 = 10;//10+20;
     y1=  25;
     x2=  400-5;//320+40;
     y2=  315+20;//300-20;
     SetFontSize(14);    
      if(parseInt(languageCode) == 1){
      PrintText((x1*4)-(5*2),2,"स्वांश चक्र");
    }
    else if(parseInt(languageCode) == 2){
      PrintText((x1*4)-(5*14),2,"ஸ்வாம்ஸ வரைபடம்");
    }
    else if(parseInt(languageCode) == 4){
      PrintText((x1*4)-(5*2),2,"ಸ್ವಂಶ ಚಾರ್ಟ್");
    }
    else if(parseInt(languageCode) == 5){
     PrintText((x1*4)-(5*2),2,"స్వాంశ ఛార్టు");
    }
    else if(parseInt(languageCode) == 6){
     PrintText((x1*4)-(5*2),2,"স্বাংশ চক্র");
    }
    else if(parseInt(languageCode) == 7){
     PrintText((x1*4)-(5*2),2,"સ્વાંશ ચાર્ટ");
    }
    else if(parseInt(languageCode) == 8){
     PrintText((x1*4)-(5*2),2,"സ്വംസ ചാർട്ട്");
    }
    else if(parseInt(languageCode) == 9){
     PrintText((x1*4)-(5*2),2,"स्वांश चक्र");
    }
    else{
      PrintText((x1*4)-(5*5),2,"Swamsa Chart");
      } 
    PrintChart(x1-5, y1, x2, y2, GetArrOfSwamsa, Chart_Type, languageCode,false); 
    if( Chart_Type==1){ 
    SetFontSize(12);  
    PrintText((x1*18)-(5*3),(y1*4)+(5*1), '<%=hmap.get("BirthInformation")%>');  
     PrintText((x1*15)-(5*3),(y1*4)+(5*4), '<%=hmap.get("Name")%>'); 
      PrintText((x1*18)-(5*5),(y1*4)+(5*9), '<%=hmap.get("DateOfBirth")%>'); 
       PrintText((x1*18)-(5*6),(y1*4)+(5*12), '<%=hmap.get("timeOfBirth")%>');  
       PrintText((x1*18)-(5*6),(y1*4)+(5*15), '<%=hmap.get("timeZone")%>');  
        PrintText((x1*18)-(5*7),(y1*4)+(5*18), '<%=hmap.get("latitudeinfo")%>');  
          PrintText((x1*18)-(5*7),(y1*4)+(5*21),  '<%=hmap.get("longitudeinfo")%>');   
          }
}
else
{
   $('#Canvasnavamsa').hide(); 
 }
</script>
</div>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>


<%
//dim KarakElement
String[] karakElement = {"ATMA","AMATYA","BHRATRU","MATRUA","PUTRA","GHANTHI","DARA"};
String printKaraka = myAstrologyObject.printKaraka().toString();
String[] charaKarak = myAstrologyObject.calcChara();
String[] sthirKarak = myAstrologyObject.getSthirGrahaForkaraka();

String[] grahaavsrta = myAstrologyObject.getGrahaForAvastha();
String[] arrBaladi = myAstrologyObject.calcBaladi();
String[] arrJagrat = myAstrologyObject.calcJaagrat();
String[] arrdeeptadi = myAstrologyObject.calcDeepta();
%>

<div class="row mrt-30"> 
<div class="col s12 l12">
<div class="card table-panel">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rbPlanetJamini.getString("KARAK") %> </h4>

<table class="highlight striped bordered ui-table-reflow ui-table">

				<thead>
				<tr id="PlanetaryTableTD" class="cellhead">
					<th id="PlanetaryTableTD"><b><%=rbPlanetJamini.getString("KARAK") %></b></th>
					<th id="PlanetaryTableTD"><b><%=rbPlanetJamini.getString("STHITR") %></b></th>
					<th id="PlanetaryTableTD"><b><%=rbPlanetJamini.getString("CHARA") %></b></th>
				</tr>
				</thead>
				<%
      for(int i=0 ;i<= karakElement.length-1;i++){
    %>
				<tr class="tdbackground">
					<td id="PlanetaryTableTD"><%=rbConstants.getString(karakElement[i]) %></td>
					<%if(Integer.parseInt(String.valueOf(session.getAttribute("languageCode")))==1){ %>
					<td id="PlanetaryTableTD"><%=hindi.unicode(sthirKarak[i],languageCode) %></td>
					<td id="PlanetaryTableTD"><%=hindi.unicode(charaKarak[i],languageCode) %></td>
					<%}else{%>
					<td id="PlanetaryTableTD"><%=rbConstants.getString(sthirKarak[i])%></td>
					<td id="PlanetaryTableTD"><%=rbConstants.getString(charaKarak[i])%></td>
					<%}%>
				</tr>
				<%}%>
			
</table>
</div>
</div>
</div>


<%!
//Get array position for Karakamsa plantes
public String getArrOfKarakamsa(int[] myPlanetPositionForLagna,int[] myPlanetPositionForNavamasa,int[] temp) {
  String arrofLagna = "" ;
  String arrofLagnaNew ="";
    for(int i = 0 ;i<= 12;i++){
      arrofLagna = arrofLagna + myPlanetPositionForLagna[i]+",";
    }
     String strofplanetLagna = arrofLagna.substring(0, arrofLagna.length()-1);
     String[] arrOfplanetLagna = strofplanetLagna.split(",");
     int karakamsaLagna = myPlanetPositionForNavamasa[temp[1]+1];
     arrOfplanetLagna[0] = String.valueOf(karakamsaLagna);
      for(int i = 0 ;i<= 12;i++){
      arrofLagnaNew = arrofLagnaNew + arrOfplanetLagna[i]+",";
      }
     String strofplanetLagnaNew = arrofLagnaNew.substring(0,arrofLagnaNew.length()-1);
     return strofplanetLagnaNew;
}


//Get array position for Swamsa plantes
public String getArrOfSwamsa(int[] myPlanetPositionForNavamasa,int[] temp){
String arrofNavamasa = "";
String arrofNavamasaNew ="";
for(int i = 0 ;i<= 12;i++){
  arrofNavamasa = arrofNavamasa + myPlanetPositionForNavamasa[i]+",";
}
String strofplanetNavamasa = arrofNavamasa.substring(0, arrofNavamasa.length()-1);
String[] arrofplanetNavamasa = strofplanetNavamasa.split(",");
int swamsaLagna = myPlanetPositionForNavamasa[temp[1]+1];
arrofplanetNavamasa[0] = String.valueOf(swamsaLagna);
for(int i = 0 ;i<= 12;i++){
  arrofNavamasaNew = arrofNavamasaNew + arrofplanetNavamasa[i]+",";
}
String strofplanetNavamasaNew = arrofNavamasaNew.substring(0,arrofNavamasaNew.length()-1);
return  strofplanetNavamasaNew;
}


//Note : index => planet number (0=> sun, 1=> moon....etc)
//Big represend maximum degree of planets
public int[] getAatmaKarakPlanet1(DesktopHoro myAstrologyObject){
int[] myPlanetDegree = new int[11];
int arrlen = 0;
int big= 0;
int index = 0;
for(int j = 1 ;j<= 7;j++){
myPlanetDegree[j-1] = SharedFunction.modOf((int)(myAstrologyObject.getPlanetaryLongitude(j)) , 30);
}
for(int icount = 0 ; icount<= myPlanetDegree.length-1; icount++){
     big = myPlanetDegree[0];
     index = 0;
     for(int jcount = 1 ; jcount<= myPlanetDegree.length-1; jcount++)
     {
     if(big < myPlanetDegree[jcount])
     { 
        big = myPlanetDegree[jcount];
        index = jcount;
     } } }
     int[] arrOfOutput = new int[2];
     arrOfOutput[0] = big;
     arrOfOutput[1] = index;
     return arrOfOutput;
}

//Note : index => planet number (0=> sun, 1=> moon....etc)
//Big represend maximum degree of planets
public int[] getAatmaKarakPlanet(DesktopHoro myAstrologyObject){
int[] myPlanetDegree = new int[11];
double[] myPlanetDegree1 = new double[11];
double[] myPlanetDegree2 = new double[11];
//double[] myPlanetDegree2 = new double[11];
int arrlen = 0;
//int big= 0;
double big1= 0;
int index = 0;
for(int j = 1 ;j<= 7;j++){
//myPlanetDegree[j-1] = SharedFunction.modOf((int)(myAstrologyObject.getPlanetaryLongitude(j)) , 30);
myPlanetDegree1[j-1] = (myAstrologyObject.getPlanetaryLongitude(j));
myPlanetDegree2[j-1] = myPlanetDegree1[j-1]- ((int)(myAstrologyObject.getPlanetaryLongitude(j)/30) * 30);
//System.out.println(myPlanetDegree1[j-1]+","+myPlanetDegree2[j-1]);
}
for(int icount = 0 ; icount<= myPlanetDegree2.length-1; icount++){
   big1 = myPlanetDegree2[0];
   index = 0;
   for(int jcount = 1 ; jcount<= myPlanetDegree2.length-1; jcount++)
   {
   if(big1 < myPlanetDegree2[jcount])
   { 
      big1 = myPlanetDegree2[jcount];
      index = jcount;
   } } }
   int[] arrOfOutput = new int[2];
   arrOfOutput[0] = (int)big1;
   //System.out.print(big1+","+arrOfOutput[0]+","+index);
   arrOfOutput[1] = index;
   return arrOfOutput;
}

public int getSessionInt(HttpSession session, String attributeName)
{
	int returnValue = 0;
	Object obj = session.getAttribute(attributeName);
	if(obj != null && !obj.equals(""))
	{
		returnValue = Integer.parseInt(obj.toString());
	}
	return returnValue;
}
		
%>