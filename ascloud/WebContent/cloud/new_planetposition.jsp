
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="java.util.Set"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>
<!-- <script type="text/javascript" src="js/jq-tool-tip.js"></script> -->
<%@include file='planets-detailed-informations.jsp'%>

<script>
$(document).ready(function(){
    $(".table-include td").addClass("tooltip-view");
});
</script>
<%
	Local planetLocal = new Local();
int planetLangCode = (Integer)session.getAttribute("languageCode");

	DesktopHoro planetHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
	String balanceDasha = planetHoro.getBalanceOfDasa().toString();
	planetHoro.setLanguageCode("0");
	planetHoro.initialize();
	MyProperties planetConstants = (MyProperties) session.getAttribute("constants");

	MyResourceBundle planetPositionConstants = planetLocal.loadPropertiesFileNew("planetposition",
			planetLangCode);
%>


<%
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
	
//'*****************Array for store planet elements values of LAGNA_CHART and NAVAMSA_CHART for print Kundli.
int[] arrPlanetsShodashvarga = planetHoro.getPositionForShodasvarg(0);
int[] ShodashvargaPlanetsForNavamsa  = planetHoro.getPositionForShodasvarg(5);
		

%>
alert(arrPlanetsShodashvarga);
<script type="text/javascript"
	src="js/o/drill-dasha.jsp?moon=<%=planetHoro.getMoon()%>&DoB=<%=planetHoro.getDayOfBirth() %>&MoB=<%=planetHoro.getMonthOfBirth() %>&YoB=<%=planetHoro.getYearOfBirth() %>&Hour=<%=planetHoro.getHourOfBirth() %>&Min=<%=planetHoro.getMinuteOfBirth() %>&Sec=<%=planetHoro.getSecondOfBirth() %>&LanguageCode=<%=planetLangCode%>"></script>

<div class="row">
	<div class="col s12">

		<div class="hdg-lg card">
			<h1>
				<%=planetPositionConstants.getString("KUNDLI_AND_PLANETARY_POSITION") %>
			</h1>
			<span id="headad"></span>
		</div>
	</div>
</div>

<%@include file='/cloud/js/draw-chart-match-js.jsp'%>

<div class="card">
	<div class="col s12 m6 center-align">
		<div class="padding-top-24">
			<canvas id="Canvaslagna" width="400px" height="350px"
				class="responsive-canvas"></canvas>
		</div>
	</div>
	<div class="col s12 m6 center-align">
		<div class="padding-top-24">
			<canvas id="Canvasnavamsa" width="400px" height="350px"
				class="responsive-canvas"></canvas>
		</div>
	</div>
</div>

<div class="row planet-table mrt-30">
	<div class="col s12 l8">

		<div class="card-panel no-padding no-margin table-panel rt-custom">


			<table class="highlight striped bordered ui-table responsive-table"
				id="ui-table">


				<%
                String[] PlanetaryHeading = new String[]{"PLANETS", "COMBUST" , "RET_DIR","RASHI", "LONGITUDE", "NAKSHATRA", "PADA", "RELATIONSHIP"};
                String[] ShortPlanetName = new String[]{"Su","Mo","Ma","Me","Ju","Ve","Sa","Ra","Ke","Ur","Ne","Pl"};
            %>




				<thead>
					<tr class="amber lighten-5">
						<% for(int planetheading = 0;planetheading<= 7;planetheading++)
                	{
                %>
						<th><%=SharedFunction.ProperCaseL(planetConstants.getString(PlanetaryHeading[planetheading]),planetLangCode) %>
						</th>
						<% } %>
					</tr>
				</thead>
				<%
				
            
            	for(int planetvalues = 0;planetvalues<= 12;planetvalues++)
            	{
                    if( planetvalues == 0) 
                    {
                    	
                    	String replacedString = planetHoro.getAscendentRasiDms().replace("&", ":").substring(1);
            %>
				<tr class="table-include">
					<td><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetName(0),planetLangCode),planetLangCode)%></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getAscendentSignName(),planetLangCode),planetLangCode)%></td>
					<td><%=replacedString %></td>
					<td><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getAscendentNakshatraName(),planetLangCode),planetLangCode)%></td>
					<td><%=planetHoro.getAscendentPada()%></td>
					<td>&nbsp;</td>
				</tr>
				<% } else { %>
				<tr class="table-include">
					<%
                         String AspectsPlanetLord = "";
                         String PlanetName = ShortPlanetName[planetvalues-1];
                         String PlanetInfo = subPrintPlanetNameDetails(PlanetName, "Rasi", planetHoro, planetLangCode);
                         JSONObject ObjPlanetJSON = new JSONObject(PlanetJson);
                                                  
                        // '*****************Get Planet Lordof in hindi
                        //out.print("ObjPlanetJSON"+ObjPlanetJSON);
                        JSONArray arrPlanetLord = ObjPlanetJSON.getJSONArray("LordOf");
                        for (int k=0;k<=arrPlanetLord.length()-1;k++)
                        {
                          if (arrPlanetLord.getInt(k) != 0)
                          {
                             AspectsPlanetLord = AspectsPlanetLord+" "+Common.hindiNumbers[arrPlanetLord.getInt(k)-1]+",";
                          }   
                        }
                        
                        if( AspectsPlanetLord != "") 
                        {
                          AspectsPlanetLord = AspectsPlanetLord.replaceAll(",$","");
                        }
                        
                        //'*****************Create Array for PlanetAspects_HI
                        String AspectsPlanetName = "";
                        		String PlanetAspect="";
                        		try
                        		{
                        			 PlanetAspect = String.valueOf(ObjPlanetJSON.getJSONArray("AspectsFrom"));
                        		}catch(Exception e)
                        		{
                        			 PlanetAspect=ObjPlanetJSON.getString("AspectsFrom");
                        			//e.printStackTrace();
                        		}
                        //String PlanetAspect = String.valueOf(ObjPlanetJSON.getJSONArray("AspectsFrom"));
                        String[] arrPlanetAspects = PlanetAspect.split(",");
                        for(int l=0;l<=arrPlanetAspects.length-1;l++)
                        {
                        	AspectsPlanetName = AspectsPlanetName+" "+Util.ConvertPlanetNameinHI(arrPlanetAspects[l])+",";
                        }
                        AspectsPlanetName = AspectsPlanetName.replaceAll(",$","");
                        String AllAboutPlanetinfo = "";
                        
                        if(planetLangCode == 1)
                        {
                            if(planetvalues < 6)
                                AspectsPlanetLord  = AspectsPlanetLord + " घर का स्वामी, ";
                            else 
                                AspectsPlanetLord  = " ";
                           // System.out.println(ObjPlanetJSON);
                           String rl = ObjPlanetJSON.getString("Relationship");
                           /*if(!rl.equals("")){
                        	   
                           }
                           */
                           
                            if(planetvalues < 10)
                                
                                AllAboutPlanetinfo = "आपकी लग्न कुण्डली में " + Util.ConvertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " ग्रह की स्थिति " + "<br/>"+ Util.ConvertSignNameinHI(ObjPlanetJSON.getString("Sign")) +"<br/>"+ planetConstants.getString(ObjPlanetJSON.getString("Relationship").toUpperCase()+"_RELATION").replace("-","...") +"<br/>"+  AspectsPlanetLord + Common.hindiNumbers[Integer.valueOf(ObjPlanetJSON.getString("House"))-1] + " भाव में " +"<br/>"+ "ग्रह  की दृष्टि : " + String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")) +"<br/>"+ "ग्रह  पर दृष्टि : " + AspectsPlanetName +"<br/><div style='Text-align:right;text-decoration:underline'><b><a href='planets-in-vedic-astrology.asp'>"+ Util.ConvertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) +" के बारे में और भी..." +"</a></b></div>";
                            else 
                                AllAboutPlanetinfo =  "आपकी लग्न कुण्डली में " + Util.ConvertPlanetNameinHI(ObjPlanetJSON.getString("PlanetName")) + " ग्रह की स्थिति " + "<br/>"+ Util.ConvertSignNameinHI(ObjPlanetJSON.getString("Sign")) +"<br/>"+ planetConstants.getString(ObjPlanetJSON.getString("Relationship").toUpperCase()+"_RELATION").replace("-","...") +"<br/>"+  AspectsPlanetLord + Common.hindiNumbers[Integer.valueOf(ObjPlanetJSON.getString("House"))-1] + " भाव में " +"<br/>"+ "ग्रह  की दृष्टि : " + String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")) +"<br/>"+ "ग्रह  पर दृष्टि : " + AspectsPlanetName;
                            
                        } 
                        else 
                        {
                        	String PlanetAspect1="";
                            if( planetvalues < 10) 
                            {try
                        		{PlanetAspect1 = String.valueOf(ObjPlanetJSON.getJSONArray("AspectsFrom"));}catch(Exception e)
                        		{PlanetAspect1=ObjPlanetJSON.getString("AspectsFrom");}
                                AllAboutPlanetinfo = Util.getValuesFromDictionary(ObjPlanetJSON.getString("PlanetName"),planetLangCode) +" in Lagna Kundli" +"<br/>"+ ObjPlanetJSON.getString("Sign") +"<br/>"+ ObjPlanetJSON.getString("Relationship") +"<br/>"+ "lord of " + String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace(",0","") + " and in " + ObjPlanetJSON.getString("House") + " House " +"<br/>"+ "Aspects on- " + String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")) +"<br/>"+ "Aspects From- " + PlanetAspect1 +"<br/><a class='btn btn-flat waves-effect amber-text right' href='planets-in-vedic-astrology.asp'>"+ "Read "+ ObjPlanetJSON.getString("PlanetName") +" Predictions" +"</a>";
                            }else 
                                AllAboutPlanetinfo = Util.getValuesFromDictionary(ObjPlanetJSON.getString("PlanetName"),planetLangCode) +" in Lagna Kundli" +"<br/>"+ ObjPlanetJSON.getString("Sign") +"<br/>"+ ObjPlanetJSON.getString("Relationship") +"<br/>"+ "lord of " + String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace(",0","") + " and in " + ObjPlanetJSON.getString("House") + " House " +"<br/>"+ "Aspects on- " + String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")) +"<br/>"+ "Aspects From- " + PlanetAspect1;
                            
                        }    
                        AspectsPlanetLord = "";
                        AspectsPlanetName = ""  ;
                        
                         %>
					<td><div class="ui-tooltip"><%=AllAboutPlanetinfo.replace("lord of 0 and in"," ").replace("Null","-") %></div><%=changeplanetname(SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetName(planetvalues),planetLangCode),planetLangCode))%></td>
					<td>
						<%  
                            	boolean isPlanetCombust = planetHoro.isCombust(planetvalues-1);
                            	if(isPlanetCombust  && planetvalues!=8 && planetvalues!=9) 
                                    out.println(planetPositionConstants.getString("COMBUST"));
                            	else if (isPlanetCombust && (planetvalues == 8 || planetvalues == 9))  
                            		out.println (planetPositionConstants.getString("ECLIPSE"));
                             String relationship = getRelationshipInString(planetHoro.getRelationshipForShodashvargaDivision(planetvalues, 0));  
                             
                            %>
					</td>
					<td class="table-include">
						<%  if(planetHoro.isPlanetDirect(planetvalues)) 
                            		out.println(planetConstants.getString("DIR"));
                            	else 
                                	out.println(planetConstants.getString("RET"));
                            String replacedPlanetString = planetHoro.getPlanetaryRasiDms(planetvalues).replace("&", ":").substring(1);
                            %>
					</td>
					<td><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetaryRasiName(planetvalues),planetLangCode),planetLangCode)%></td>
					<td><%=replacedPlanetString%></td>
					<td><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getNakshatraNameForPlanet(planetvalues),planetLangCode),planetLangCode)%></td>
					<td><%=planetHoro.getPadaOfPlanet(planetvalues)%></td>
					<td>
						<%if(!relationship.equals("-")){%> <%=planetConstants.getString(relationship.toUpperCase()+"_RELATION") %>
						<% } %>
					</td>
				</tr>
				<%} 
            	} %>

			</table>
		</div>
		<div class="mrt-10"><%=planetConstants.getString("NOTE") %>: <b>[<%=planetPositionConstants.getString("COMBUST") %>]
			</b>-
			<%=planetPositionConstants.getString("COMBUSTFULL") %>
			<b>[<%=planetConstants.getString("DIR") %>]
			</b>-
			<%=planetPositionConstants.getString("DIRECT") %>
			<b>[<%=planetConstants.getString("RET") %>]
			</b> -<%=planetPositionConstants.getString("RETROGRADE") %><b>&nbsp;[<%=planetPositionConstants.getString("ECLIPSE") %>]
			</b> -<%=planetPositionConstants.getString("ECLIPSE_NAME") %></div>

		<%@include file='ui-control/ad-content-area.jsp'%>
	</div>



	<div class="col s12 l4 mrg-top-mb">

		<div class="card vd-panel">
			<h4 class="vd-hdg amber lighten-5 br-amber-b"><%=planetConstants.getString("VIMSHOTTARI_DASHA") %></h4>

			<div class="center-align vd-sub-hdg br-b">
				<%
                           // String balanceDasha = planetHoro.getBalanceOfDasa().toString();
                        %>
				<%=planetConstants.getString("BAL_OF_DASA")+ "<br/>" + Util.localizeBalOfDasha(balanceDasha, planetLangCode, planetConstants)%>
			</div>
			<div class="dasa"></div>
			<div class="card-action1 border-non center mt-8">
				<a href="javascript:back()"
					class="waves-effect waves-light btn amber darken-4 box-shadow"><%=planetPositionConstants.getString("LEVEL_UP") %></a>
			</div>
			<div class="card-action1 border-non center mt-6 mrb-30">
				<a href="vimshottaridasha.asp" class="orange-text text-decoration">
					<%=planetPositionConstants.getString("GET_FULL_VIM_DASHA")%>
				</a>
			</div>
		</div>
	</div>


</div>






<%
HashMap<String, String> hm = insideInfoinSouthIndian(planetLangCode, planetHoro);
%>

<div align="center">

	<script language="JavaScript" type="text/javascript">
//var myval;
var LanguageCode = <%=planetLangCode%>;

var textcolor = COLOR_INFO;
var chartpref = '<%=chartpref%>';

if(window.HTMLCanvasElement) {
    var c=document.getElementById("Canvaslagna");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=planetChart %>'; 
<%
String mySyn = "";
for(int i = 0;i<=11;i++) {
    mySyn = mySyn + arrPlanetsShodashvarga[i] + "," ;
}
mySyn = mySyn + arrPlanetsShodashvarga[12]; 
out.println("arrPlanetsShodashvarga = new Array(" + mySyn + ");");

%>
    x1_canvas= 10;//10+40;    
    y1_canvas= 30;
    x2_canvas= 400-5;//320+75;
    y2_canvas= 300+20;//300-20;
    SetFontSize(14);   
    
    //var Chart_Type1 = 0;
   
   if(parseInt(LanguageCode) == 1){
      PrintText((x1_canvas*2)-(5*2),6,"लग्न कुण्डली");     
    }
    else if(parseInt(LanguageCode) == 2){
      PrintText((x1_canvas*2)-(5*14),6,"லக்ன ஜாதக வரைபடம்");
     
    }
    else if(parseInt(LanguageCode) == 4){
      PrintText((x1_canvas*2)-(5*2),6, "ಲಗ್ನ ಜಾತಕ");
    }
    else if(parseInt(LanguageCode) == 5){
     PrintText((x1_canvas*2)-(5*2),6, "లగ్న ఛార్టు"); 
    
    }
    else if(parseInt(LanguageCode) == 6){
    PrintText((x1_canvas*2)-(5*2),6, "লগ্ন কুষ্ঠি");     
    }
    else if(parseInt(LanguageCode) == 7){
     PrintText((x1_canvas*2)-(5*2),6, "લગ્ન કુંડળી"); 
    }
    else if(parseInt(LanguageCode) == 8){
     PrintText((x1_canvas*2)-(5*2),6, "ലഗ്ന ചാർട്ട്"); 
    }
    else if(parseInt(LanguageCode) == 9){
     PrintText((x1_canvas*2)-(5*2),6, "लग्न आलेख"); 
    }
    else{
      PrintText((x1_canvas*3)-(5*5),6, "Lagna Chart");
     
      }
   
     
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, LanguageCode,false);  
    
    if(Chart_Type==1){ 
     SetFontSize(12);   
     PrintText((x1_canvas*18)-(5*3),(y1_canvas*4)+(5*1), '<%=hm.get("BirthInformation")%>');  
     PrintText((x1_canvas*14)-(5*3),(y1_canvas*4)+(5*4), '<%=hm.get("Name")%>'); 
     PrintText((x1_canvas*18)-(5*5),(y1_canvas*4)+(5*9), '<%=hm.get("DateOfBirth")%>'); 
     PrintText((x1_canvas*18)-(5*6),(y1_canvas*4)+(5*12), '<%=hm.get("timeOfBirth")%>');   
     PrintText((x1_canvas*18)-(5*6),(y1_canvas*4)+(5*15), '<%=hm.get("timeZone")%>');  
     PrintText((x1_canvas*18)-(5*7),(y1_canvas*4)+(5*18), '<%=hm.get("latitudeinfo")%>');  
     PrintText((x1_canvas*18)-(5*7),(y1_canvas*4)+(5*21), '<%=hm.get("longitudeinfo")%>');     
    } 
      myval="";

          }  
else {

   $('#Canvaslagna').hide();
    myval = '<div align=center style=padding-top:5px;><img width="590" height="350" src="lagna-navamsa-chart.asp?Chart_type=LagnaNavmasa&LanguageCode=<%=planetLangCode %>&textcolor=0&planetstyle=0&border=1&colorcode=f96d06&chartpref=<%=chartpref %>" onload=resizeimg(this,"0"); /></div>';
}
</script>

	<script language="JavaScript" type="text/javascript">
$("#chart").append(myval);
</script>


	<script language="JavaScript" type="text/javascript">

LanguageCode = <%=planetLangCode%>;

var textcolor1 = COLOR_INFO;
if(window.HTMLCanvasElement) {
    var c=document.getElementById("Canvasnavamsa");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#f96d06";
   Chart_Type = '<%=planetChart%>'; 
<%String mySyn1 = "";
			for (int i = 0; i <= 11; i++) {
				mySyn1 = mySyn1 + "" + ShodashvargaPlanetsForNavamsa[i] + ",";
			}
			mySyn1 = mySyn1 + ShodashvargaPlanetsForNavamsa[12];
			out.println("  ShodashvargaPlanetsForNavamsa = new Array(" + mySyn1 + ");");%>


     x1_canvas = 10;//10+20;
     y1_canvas=  30;
     x2_canvas=  400-5;//320+40;
     y2_canvas=  300+20;//300-20;
    SetFontSize(14);   
  
    if(parseInt(LanguageCode) == 1){
      PrintText((x1_canvas*2)-(5*2),6,"नवमांश कुण्डली");
    }
    else if(parseInt(LanguageCode) == 2){
      PrintText((x1_canvas*4)-(5*14),6,"நவாம்சம் ஜாதக வரைபடம்");
    }
    else if(parseInt(LanguageCode) == 4){
      PrintText((x1_canvas*2)-(5*2),6,"ನವಾಂಶ ಜಾತಕ");
    }
    else if(parseInt(LanguageCode) == 5){
     PrintText((x1_canvas*2)-(5*2),6,"నవాంశ ఛార్టు");
    }
    else if(parseInt(LanguageCode) == 6){
     PrintText((x1_canvas*2)-(5*2),6,"নবমাংশ তালিকা");
    }
    else if(parseInt(LanguageCode) == 7){
     PrintText((x1_canvas*2)-(5*2),6,"નવમાંશ કુંડળી");
    }
    else if(parseInt(LanguageCode) == 8){
     PrintText((x1_canvas*2)-(5*2),6,"നവാംശ ചാർട്ട്");
    }
    else if(parseInt(LanguageCode) == 9){
     PrintText((x1_canvas*2)-(5*2),6,"नवम्श आलेख");
    }
    else{
      PrintText((x1_canvas*3)-(5*5),6,"Navamsa Chart");
      } 
      
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, ShodashvargaPlanetsForNavamsa, Chart_Type, LanguageCode,false);    
    
    if( Chart_Type==1){ 
    SetFontSize(12);   

    PrintText((x1_canvas*18)-(5*3),(y1_canvas*4)+(5*1), '<%=hm.get("BirthInformation")%>');  
     PrintText((x1_canvas*14)-(5*3),(y1_canvas*4)+(5*4), '<%=hm.get("Name")%>'); 
      PrintText((x1_canvas*18)-(5*5),(y1_canvas*4)+(5*9), '<%=hm.get("DateOfBirth")%>'); 
       PrintText((x1_canvas*18)-(5*6),(y1_canvas*4)+(5*12), '<%=hm.get("timeOfBirth")%>');   
       PrintText((x1_canvas*18)-(5*6),(y1_canvas*4)+(5*15), '<%=hm.get("timeZone")%>');  
        PrintText((x1_canvas*18)-(5*7),(y1_canvas*4)+(5*18), '<%=hm.get("latitudeinfo")%>');  
          PrintText((x1_canvas*18)-(5*7),(y1_canvas*4)+(5*21), '<%=hm.get("longitudeinfo")%>
		');

			}
		} else {
			$('#Canvasnavamsa').hide();
		}

		$(document).ready(function() {
			$(".ui-responsive-tbl").click(function() {
				$(".ui-open").slideToggle();
			});
		});
	</script>
</div>


<%
	String[] KarakElement = { "ATMA", "AMATYA", "BHRATRU", "MATRUA", "PUTRA", "GHANTHI", "DARA" };
	String PrintKaraka = planetHoro.printKaraka().toString();
	String[] CharaKarak = planetHoro.calcChara();
	String[] SthirKarak = planetHoro.getSthirGrahaForkaraka();

	String[] grahaavsrta = planetHoro.getGrahaForAvastha();
	String[] arrBaladi = planetHoro.calcBaladi();
	String[] arrJagrat = planetHoro.calcJaagrat();
	String[] arrdeeptadi = planetHoro.calcDeepta();
%>

<div class="row mrt-30">
	<div class="col s12 l5 ui-btm ui-btm-zero mrg-btm-mb">
		<div class="card table-panel">


			<h4 class="vd-hdg br-amber-b amber lighten-5"><%=planetConstants.getString("KARAK")%></h4>


			<table class="highlight striped bordered ui-table ui-font">
				<thead>

					<tr id="PlanetaryTableTD">
						<th id="PlanetaryTableTD"><b><%=planetConstants.getString("KARAK")%></b></th>
						<th id="PlanetaryTableTD"><b><%=planetConstants.getString("STHITR")%></b></th>
						<th id="PlanetaryTableTD"><b><%=planetConstants.getString("CHARA")%></b></th>
					</tr>

				</thead>

				<tbody>
					<%
						for (int i = 0; i <= KarakElement.length - 1; i++) {
					%>
					<tr>
						<td id="PlanetaryTableTD"><%=planetConstants.getString(KarakElement[i])%></td>
						<%
							if (planetLangCode != 0) {
						%>
						<td id="PlanetaryTableTD"><%=Util.getValuesFromDictionary(SthirKarak[i], planetLangCode)%></td>
						<td id="PlanetaryTableTD"><%=Util.getValuesFromDictionary(CharaKarak[i], planetLangCode)%></td>
						<%
							} else {
						%>
						<td id="PlanetaryTableTD"><%=ProperCasePlanet(SthirKarak[i])%></td>
						<td id="PlanetaryTableTD"><%=ProperCasePlanet(CharaKarak[i])%></td>
						<%
							}
						%>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="col s12 l7">
		<div class="card table-panel">
			<h4 class="vd-hdg br-amber-b amber lighten-5"><%=planetPositionConstants.getString("AVASTHA")%></h4>
			<table class="highlight striped bordered ui-table ui-font">
				<thead>

					<tr id="PlanetaryTableTD">
						<th id="PlanetaryTableTD"><%=planetConstants.getString("PLANETS")%></th>
						<th id="PlanetaryTableTD"><%=planetPositionConstants.getString("JAGRAT")%></th>
						<th id="PlanetaryTableTD"><%=planetPositionConstants.getString("BALADI")%></th>
						<th id="PlanetaryTableTD"><%=planetPositionConstants.getString("DEEPTADI")%></th>
					</tr>

				</thead>


				<tbody>
					<%
						for (int i = 0; i <= 6; i++) {
					%>

					<tr>
						<%
							if (planetLangCode != 0) {
						%>
						<td id="PlanetaryTableTD"><%=Util.getValuesFromDictionary(grahaavsrta[i], planetLangCode)%></td>
						<%
							} else {
						%>
						<td id="PlanetaryTableTD"><%=ProperCasePlanet(grahaavsrta[i])%></td>
						<%
							}
						%>
						<td id="PlanetaryTableTD"><%=Util.getValuesFromDictionary(arrJagrat[i], planetLangCode)%></td>
						<td id="PlanetaryTableTD"><%=Util.getValuesFromDictionary(arrBaladi[i], planetLangCode)%></td>
						<td id="PlanetaryTableTD"><%=Util.getValuesFromDictionary(arrdeeptadi[i], planetLangCode)%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>


</div>



<%!public String changeplanetname(String planetname) {
		String returnPlName = planetname;
		if (planetname != null) {
			if (planetname.equals("अरूण")) {
				returnPlName = "यूरे";
			} else if (planetname.equals("वरूण")) {
				returnPlName = "नेप";
			} else if (planetname.equals("यम")) {
				returnPlName = "प्लू";
			}
		}
		return returnPlName;
	}

	public String ProperCasePlanet(String planetname) {
		String returnPlName = planetname;
		if (planetname.equals("SUN")) {
			returnPlName = "Sun";
		} else if (planetname.equals("MOON")) {
			returnPlName = "Moon";
		} else if (planetname.equals("MARS")) {
			returnPlName = "Mars";
		} else if (planetname.equals("MERC")) {
			returnPlName = "Mer";
		} else if (planetname.equals("JUPT")) {
			returnPlName = "Jup";
		} else if (planetname.equals("VENU")) {
			returnPlName = "Ven";
		} else if (planetname.equals("SATN")) {
			returnPlName = "Sat";
		}
		return returnPlName;
	}%>

<%@ include file='calculations-footer.jsp'%>