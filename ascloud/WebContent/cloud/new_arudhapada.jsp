<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.util.PdashaUtil"%>
<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%
DesktopHoro planetHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
int planetLangCode = (Integer)session.getAttribute("languageCode");
String isNotException = Util.safestr(request.getParameter("isNOTEXE"));

if(isNotException!=null && !isNotException.equals("") && isNotException.equals("1")){
	isNotException = "1";
}
else{
	isNotException = "0";
}
Local local = new Local();
MyResourceBundle rBArudha = local.loadPropertiesFileNew("arudha",planetLangCode);
MyProperties planetConstants = (MyProperties) session.getAttribute("constants");
//************************************'Decalare The Variables **************************************
int planetChart = 0;
Object ctObj = session.getAttribute("chartType");
if(ctObj != null && !ctObj.equals(""))
{
planetChart = Integer.parseInt(ctObj.toString());
}
String chartpref = "north";
if(planetChart == 1)
{
	chartpref = "south";
}
else if(planetChart == 2)
{
	chartpref = "east";
}
int[] arrPlanetsShodashvarga = planetHoro.getPositionForShodasvarg(0);
int rashiLn = arrPlanetsShodashvarga[0];
int[] arrPlanet = new int[9];

for(int i=0;i<9;i++){
	arrPlanet[i] = Astrology.rasiToBhava(arrPlanetsShodashvarga[0],arrPlanetsShodashvarga[i+1]);//-rashiLn+1; //getting bhav position of the planets
}
int[] rst = getAurdhaPada(arrPlanet,rashiLn,isNotException);//{1,2,3,4,5,6,7,8,9,10,11,12};//getAurdhaPada(arrPlanet,rashiLn);
%>
<div class="hdg-lg card">
	<h1> <%=rBArudha.getString("ARUDHA_CHART")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card">
<div class="col s12 center-align">
		<div class="padding-top-24">
			<canvas id="CanvasArudhalagna" width="400px" height="350px" class="responsive-canvas-m"></canvas>
			</div>
</div>
<div id ="chart">
</div>
<div class="col s12 m12 center-align">
<%=rBArudha.getString("NOTE_ARUDHA")%>
</div>
<div align="center">
	
<script language="JavaScript" type="text/javascript">
//var myval;
var LanguageCode = <%=planetLangCode%>;

var textcolor = COLOR_INFO;
var chartpref = '<%=chartpref%>';

if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvasArudhalagna");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=planetChart %>'; 
<%
String bhavPosition = "";
String valueInArr = "";
String[] value = new String[] {"AL","A2","A3","A4","A5","A6","A7","A8","A9","A10","A11","UL"};
String[] planet = new String[] {planetConstants.getString("SU"),planetConstants.getString("MO"),planetConstants.getString("MA"),planetConstants.getString("ME"),planetConstants.getString("JU"),planetConstants.getString("VE"),planetConstants.getString("SA"),planetConstants.getString("RA"),planetConstants.getString("KE")};
//Adding first planet number rashi numer and then Arudha rashu number 9+12=21
for(int i = 1;i<=9;i++) {
	bhavPosition = bhavPosition + arrPlanetsShodashvarga[i] + "," ;
}

for(int i = 0;i<=10;i++) {
	bhavPosition = bhavPosition + rst[i] + "," ;
	//bhavPosition = bhavPosition + "12" + "," ;
}
//Adding first planet from sun to ketu name and then Arudha langa total 9+12=21
for(int i = 0;i<=8;i++) {
	if(planetLangCode==0){planet[i] = SharedFunction.ProperCase(planet[i].trim()); }
	valueInArr = valueInArr+ "'"+planet[i].trim()+"'" + "," ;
}

for(int i = 0;i<=10;i++) {
	valueInArr = valueInArr+ "'"+value[i]+"'" + "," ;
}

bhavPosition = bhavPosition + rst[11]; 
valueInArr = valueInArr+  "'"+value[11]+"'" ;

out.println("arrPosition= new Array("+ bhavPosition + ");");
out.println("arrValue = new Array(" + valueInArr + ");");
out.println("lagnaRashi= " + rashiLn + ";");

%>

if(arrPosition.length==arrValue.length){
   // alert(arrPosition.length);
  //  alert(arrValue.length);
    x1_canvas= 10;//10+40;    
    y1_canvas= 30;
    x2_canvas= 400-5;//320+75;
    y2_canvas= 300+20;//300-20;
    SetFontSize(14);   

   
    if(parseInt(LanguageCode) == 1){
        PrintText((x1_canvas*2)-(5*2),6,"आरूढ़ कुंडली");     
      }
      else if(parseInt(LanguageCode) == 2){
        PrintText((x1_canvas*2)-(5*14),6,"ஆருட கட்டம் ");
       
      }
      else if(parseInt(LanguageCode) == 4){
        PrintText((x1_canvas*2)-(5*2),6, "ಅರುಧಾ ಚಾರ್ಟ್");
      }
      else if(parseInt(LanguageCode) == 5){
       PrintText((x1_canvas*2)-(5*2),6, "అరుధ చార్టు"); 
      
      }
      else if(parseInt(LanguageCode) == 6){
      PrintText((x1_canvas*2)-(5*2),6, "অরুধা চার্ট");     
      }
      else if(parseInt(LanguageCode) == 7){
       PrintText((x1_canvas*2)-(5*2),6, "અરુધ ચાર્ટ"); 
      }
      else if(parseInt(LanguageCode) == 8){
       PrintText((x1_canvas*2)-(5*2),6, "ആരൂഢ"); 
      }
      else if(parseInt(LanguageCode) == 9){
       PrintText((x1_canvas*2)-(5*2),6, "अरुद्ध चार्ट"); 
      }
      else{
        PrintText((x1_canvas*3)-(5*5),6, "Arudha Chart");
       
        }
     PrintChartPada(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPosition,arrValue, Chart_Type, LanguageCode,false,lagnaRashi);  
     myval="";

          } 
else{
	$('#CanvasArudhalagna').hide();
	 myval = '<div align=center style=padding-top:5px;><span>SomeThing went Wrong </span></div>';
}
}
else {

   $('#CanvasArudhalagna').hide();
    myval = '<div align=center style=padding-top:5px;><img width="590" height="350" src="lagna-navamsa-chart.asp?Chart_type=LagnaNavmasa&LanguageCode=<%=planetLangCode %>&textcolor=0&planetstyle=0&border=1&colorcode=f96d06&chartpref=<%=chartpref %>" onload=resizeimg(this,"0"); /></div>';
}

</script>

<script language="JavaScript" type="text/javascript">
$("#chart").append(myval);
</script>
</div>

 <form class="col s12 mrt-20" id="aform" action="arudhapada.asp" method="get" name="hh">
     <div class="row" >
                        <div class="col s6 right-align">
                          <input class="filled-in" type="checkbox" value="1" <% if("1".equals(isNotException)) %> checked 
                          name="isNOTEXE" id="isNOTEXE"  onclick="this.form.submit();"/>
                          <label for="isNOTEXE"><%=rBArudha.getString("DO_NOT_USE")%></label>
                      </div>

                      <div class="col s12 mrt-20">
<p class="green-text text-darken-4"> <%=rBArudha.getString("NOTE_JHORA_ASTRO")%> </p>
</div>   
       </div>
   </form> 
   </div> 
  </div>  
   </div> 

<%!
//************Here we are taking position 0 to 11
public int[] getAurdhaPada(int[] arrOfBhavPlanet,int lnRasi,String isNotException){
	
	int[] bhavRashi = new int[12];
	int lgnrashi = lnRasi;
	//*****************rashi array satrting from the lgna rashi 
	for(int i= 0; i<12;i++){
		bhavRashi[i]= lgnrashi;
		lgnrashi++;
		if(lgnrashi>12){lgnrashi= lgnrashi-12;}
		//System.out.println(bhavRashi[i]);
	}


int getLordPosFromTheGivenBhava =0;
int finalBhav =0;
int[] auradhaPada = new int[12];
	//************find out the lords of every house rashi *****************************
for(int bhavNum=0 ;bhavNum<12;bhavNum++){
int lord = PdashaUtil.getRasiLordFromRasiNumber(bhavRashi[bhavNum]);
getLordPosFromTheGivenBhava = arrOfBhavPlanet[lord-1]-bhavNum;

//*******************again counting from the getLordPosFromTheGivenBhava 
finalBhav = getLordPosFromTheGivenBhava+ getLordPosFromTheGivenBhava+(bhavNum-1);
//System.out.println(getLordPosFromTheGivenBhava);
if(finalBhav>12){finalBhav= finalBhav-12;}
if(finalBhav<1){
	finalBhav = 12+(finalBhav);
	}
//System.out.println(bhavNum+1+"->"+lgnrashi+","+lord+","+finalBhav+","+bhavRashi[finalBhav-1]+","+getLordPosFromTheGivenBhava);
//*****************Exception handling 
if(!"1".equals(isNotException)){ // here we have to false if do not use exception
	
if(finalBhav==bhavNum+1 ){
	finalBhav = (bhavNum)+10;
}


else if(bhavRashi[bhavNum]-bhavRashi[finalBhav-1]==6 || bhavRashi[bhavNum]-bhavRashi[finalBhav-1]==-6){
	int rashiFn = (bhavRashi[finalBhav-1])+9;
	if(rashiFn>12){rashiFn= rashiFn-12;}
	if(rashiFn<1){rashiFn= rashiFn+12;}
	for(int j=0;j<bhavRashi.length;j++){
		if(rashiFn==bhavRashi[j] ){
			finalBhav = j+1;
		}
	}
}
}
if(finalBhav<0){finalBhav= finalBhav+12;}
if(finalBhav>12){finalBhav= finalBhav-12;}
//********************set value of AurdhaPada in the final position

auradhaPada[bhavNum] =bhavRashi[finalBhav-1];
if(lgnrashi>12) {lgnrashi=lgnrashi-12;}
}
	return auradhaPada; //************* Final Printing

}

%>