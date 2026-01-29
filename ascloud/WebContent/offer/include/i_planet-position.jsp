
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>

<%@include file='/cloud/planets-detailed-informations.jsp'%>
<%
int planetLangCode = (Integer)session.getAttribute("languageCode");
Local planetLocal = new Local();
DesktopHoro planetHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");
planetHoro.setLanguageCode("0");
planetHoro.initialize();
MyProperties planetConstants = (MyProperties) session.getAttribute("constants");

MyResourceBundle planetPositionConstants = planetLocal.loadPropertiesFileNew("planetposition",planetLangCode);

%>

<div align="center" class="heading-sec">
    <h2>
        <%=planetConstants.getString("PLANETARY_POSITION")%>
    </h2>
</div>
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
HashMap<String, String> hm = insideInfoinSouthIndian(planetLangCode, planetHoro);
%>



<div class="col-sm-6">
<td>
	<%@include file='/cloud/js/draw-chart-match-js.jsp'%>
	</td>
<!--#include virtual = "/offer/draw-chart-match-js.asp"-->

<div id="chart" style="padding-top:5px;"></div>

<canvas id="Canvaslagna" width="450px" height="400px" class="ui-canvas"></canvas>
<script language="JavaScript" type="text/javascript">

//var myval;
LanguageCode = <%=planetLangCode%>;
if (LanguageCode=="")
{
LanguageCode =0;
}
var textcolor = COLOR_INFO;
var chartpref = '<%=chartpref%>';

if(window.HTMLCanvasElement) {
    var c=document.getElementById("Canvaslagna");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#FF6F00";
    cxt.fillStyle = '#FF6F00';    
   Chart_Type = '<%=planetChart %>'; 
<%
String mySyn = "";
for(int i = 0;i<=11;i++) {
    mySyn = mySyn + arrPlanetsShodashvarga[i] + "," ;
}
mySyn = mySyn + arrPlanetsShodashvarga[12]; 
out.println("arrPlanetsShodashvarga = new Array(" + mySyn + ");");


%>
    x1_canvas= 50;//10+40;
    y1_canvas= 25;
    x2_canvas= 400-5;//320+75;
    y2_canvas= 300+20;//300-20;
    SetFontSize(14);    
 
   if(parseInt(LanguageCode) == 1){
      PrintText((x1_canvas*4)-(5*2),2,"लग्न कुण्डली");
    }
    else if(parseInt(LanguageCode) == 2){
      PrintText((x1_canvas*4)-(5*14),2,"லக்ன ஜாதக வரைபடம்");
    }
    else if(parseInt(LanguageCode) == 4){
      PrintText((x1_canvas*4)-(5*2),2, "ಲಗ್ನ ಜಾತಕ");
    }
    else if(parseInt(LanguageCode) == 5){
     PrintText((x1_canvas*4)-(5*2),2, "లగ్న ఛార్టు"); 
    }
    else if(parseInt(LanguageCode) == 6){
    PrintText((x1_canvas*4)-(5*2),2, "লগ্ন কুষ্ঠি"); 
    }
    else if(parseInt(LanguageCode) == 7){
     PrintText((x1_canvas*4)-(5*2), "લગ્ન કુંડળી"); 
    }
    else if(parseInt(LanguageCode) == 8){
     PrintText((x1_canvas*4)-(5*2),2, "ലഗ്ന ചാർട്ട്"); 
    }
    else if(parseInt(LanguageCode) == 9){
     PrintText((x1_canvas*4)-(5*2),2, "लग्न आलेख"); 
    }
    else{
      PrintText((x1_canvas*4)-(5*5),2, "Lagna Chart");
     
      }
     
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanetsShodashvarga, Chart_Type, LanguageCode,false);  
    if(Chart_Type==1){ 
     SetFontSize(12);   
        PrintText((x1_canvas*4)-(5*3),(y1_canvas*4)+(5*1), '<%=hm.get("BirthInformation")%>');  
        PrintText((x1_canvas*4)-(5*3),(y1_canvas*4)+(5*4), '<%=hm.get("Name")%>'); 
        PrintText((x1_canvas*4)-(5*5),(y1_canvas*4)+(5*9), '<%=hm.get("DateOfBirth")%>'); 
         PrintText((x1_canvas*4)-(5*6),(y1_canvas*4)+(5*12), '<%=hm.get("timeOfBirth")%>');   
         PrintText((x1_canvas*4)-(5*6),(y1_canvas*4)+(5*15), '<%=hm.get("timeZone")%>');  
          PrintText((x1_canvas*4)-(5*7),(y1_canvas*4)+(5*18), '<%=hm.get("latitudeinfo")%>');  
            PrintText((x1_canvas*4)-(5*7),(y1_canvas*4)+(5*21), '<%=hm.get("longitudeinfo")%>');     
    } 
      myval="";

          }  
else {

   $('#Canvaslagna').hide();
    myval = '<div align=center style=padding-top:5px;><img width="590" height="350" src="lagna-navamsa-chart.asp?Chart_type=LagnaNavmasa&LanguageCode=<%=planetLangCode%>&textcolor=0&planetstyle=0&border=1&colorcode=f96d06&chartpref=<%=chartpref %>" onload=resizeimg(this,"0"); /></div>';
}
</script>

<script language="JavaScript" type="text/javascript">
$("#chart").append(myval);
</script>
</div>
<div class="col-sm-6">
<canvas id="Canvasnavamsa" width="450px" height="400px" class="ui-canvas"></canvas>
<script language="JavaScript" type="text/javascript">

LanguageCode = <%=planetLangCode%>;
var textcolor1 = COLOR_INFO;
if(window.HTMLCanvasElement) {
    var c=document.getElementById("Canvasnavamsa");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#FF6F00"; 
    cxt.fillStyle = '#FF6F00';    
    Chart_Type = '<%=planetChart %>'; 
<%
String mySyn1 = "";
for(int i = 0;i<=11;i++) {
    mySyn1 = mySyn1 +""+ ShodashvargaPlanetsForNavamsa[i] + "," ;
}
mySyn1 = mySyn1 + ShodashvargaPlanetsForNavamsa[12]; 
out.println("  ShodashvargaPlanetsForNavamsa = new Array(" + mySyn1 + ");");
%>
     x1_canvas = 50;//10+20;
     y1_canvas=  25;
     x2_canvas=  400-5;//320+40;
     y2_canvas=  300+20;//300-20;
     SetFontSize(14);    
  
if(parseInt(LanguageCode) == 1){
    PrintText((x1_canvas*4)-(5*2),2,"नवमांश कुण्डली");
}
else if(parseInt(LanguageCode) == 2){
    PrintText((x1_canvas*4)-(5*14),2,"நவாம்சம் ஜாதக வரைபடம்");
}
else if(parseInt(LanguageCode) == 4){
    PrintText((x1_canvas*4)-(5*2),2,"ನವಾಂಶ ಜಾತಕ");
}
else if(parseInt(LanguageCode) == 5){
    PrintText((x1_canvas*4)-(5*2),2,"నవాంశ ఛార్టు");
}
else if(parseInt(LanguageCode) == 6){
    PrintText((x1_canvas*4)-(5*2),2,"নবমাংশ তালিকা");
}
else if(parseInt(LanguageCode) == 7){
    PrintText((x1_canvas*4)-(5*2),2,"નવમાંશ કુંડળી");
}
else if(parseInt(LanguageCode) == 8){
    PrintText((x1_canvas*4)-(5*2),2,"നവാംശ ചാർട്ട്");
}
else if(parseInt(LanguageCode) == 9){
    PrintText((x1_canvas*4)-(5*2),2,"नवम्श आलेख");
}
else{
    PrintText((x1_canvas*4)-(5*5),2,"Navamsa Chart");
} 
    PrintChart(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, ShodashvargaPlanetsForNavamsa, Chart_Type, LanguageCode,false); 
    
if( Chart_Type==1){ 
    SetFontSize(12);
    PrintText((x1_canvas*4)-(5*3),(y1_canvas*4)+(5*1), '<%=hm.get("BirthInformation")%>');  
    PrintText((x1_canvas*4)-(5*3),(y1_canvas*4)+(5*4), '<%=hm.get("Name")%>'); 
     PrintText((x1_canvas*4)-(5*5),(y1_canvas*4)+(5*9), '<%=hm.get("DateOfBirth")%>'); 
      PrintText((x1_canvas*4)-(5*6),(y1_canvas*4)+(5*12), '<%=hm.get("timeOfBirth")%>');   
      PrintText((x1_canvas*4)-(5*6),(y1_canvas*4)+(5*15), '<%=hm.get("timeZone")%>');  
       PrintText((x1_canvas*4)-(5*7),(y1_canvas*4)+(5*18), '<%=hm.get("latitudeinfo")%>');  
         PrintText((x1_canvas*4)-(5*7),(y1_canvas*4)+(5*21), '<%=hm.get("longitudeinfo")%>');    
    }
}
else
{
   $('#Canvasnavamsa').hide();   
   }

</script>
</div>
<div class="clearfix"></div>

<div class="inner-sec">
<div class="table-responsive">
        <table class="table table-bordered">
            <%
                String[] PlanetaryHeading = new String[]{"PLANETS", "COMBUST" , "RET_DIR","RASHI", "LONGITUDE", "NAKSHATRA", "PADA", "RELATIONSHIP"};
                String[] ShortPlanetName = new String[]{"Su","Mo","Ma","Me","Ju","Ve","Sa","Ra","Ke","Ur","Ne","Pl"};
            %>
            <thead>
            <tr>
                <% for(int planetheading = 0;planetheading<= 7;planetheading++)
                	{
                %>
                <th>
                    <%=SharedFunction.ProperCaseL(planetConstants.getString(PlanetaryHeading[planetheading]),planetLangCode) %>
                </th>
                <% } %>
            </tr>
            </thead>
            <tbody>
            <%
            
            	for(int planetvalues = 0;planetvalues<= 12;planetvalues++)
            	{
                    if( planetvalues == 0) 
                    {
                    	
                    	String replacedString = planetHoro.getAscendentRasiDms().replace("&", ":").substring(1);
            %>
                        <tr>
                            <td><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetName(0),planetLangCode),planetLangCode)%></td>
                            <td> </td>
                            <td></td>                         
                            <td><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getAscendentSignName(),planetLangCode),planetLangCode)%></td>
                            <td id="PlanetaryTableTD"><%=replacedString %></td>
							<td id="PlanetaryTableTD"><%=SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getAscendentNakshatraName(),planetLangCode),planetLangCode)%></td>
							<td id="PlanetaryTableTD"><%=planetHoro.getAscendentPada()%></td>
                            <td></td>
                        </tr>
            <% } else { %>
                    <tr> 
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
                                AllAboutPlanetinfo = Util.getValuesFromDictionary(ObjPlanetJSON.getString("PlanetName"),planetLangCode) +" in Lagna Kundli" +"<br/>"+ ObjPlanetJSON.getString("Sign") +"<br/>"+ ObjPlanetJSON.getString("Relationship") +"<br/>"+ "lord of " + String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace(",0","") + " and in " + ObjPlanetJSON.getString("House") + " House " +"<br/>"+ "Aspects on- " + String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")) +"<br/>"+ "Aspects From- " + PlanetAspect1 +"<br/><div style='Text-align:right;text-decoration:underline'><b><a href='planets-in-vedic-astrology.asp'>"+ "Read "+ ObjPlanetJSON.getString("PlanetName") +" Predictions" +"</a></b></div>";
                            }else 
                                AllAboutPlanetinfo = Util.getValuesFromDictionary(ObjPlanetJSON.getString("PlanetName"),planetLangCode) +" in Lagna Kundli" +"<br/>"+ ObjPlanetJSON.getString("Sign") +"<br/>"+ ObjPlanetJSON.getString("Relationship") +"<br/>"+ "lord of " + String.valueOf(ObjPlanetJSON.getJSONArray("LordOf")).replace(",0","") + " and in " + ObjPlanetJSON.getString("House") + " House " +"<br/>"+ "Aspects on- " + String.valueOf(ObjPlanetJSON.getJSONArray("Aspects")) +"<br/>"+ "Aspects From- " + PlanetAspect1;
                            
                        }    
                        AspectsPlanetLord = "";
                        AspectsPlanetName = ""  ;
                        
                         %>
                        <td><%=changeplanetname(SharedFunction.ProperCaseL(Util.getValuesFromDictionary(planetHoro.getPlanetName(planetvalues),planetLangCode),planetLangCode))%></td>
                        <td >
                            <%  
                            	boolean isPlanetCombust = planetHoro.isCombust(planetvalues-1);
                            	if(isPlanetCombust  && planetvalues!=8 && planetvalues!=9) 
                                    out.println(planetPositionConstants.getString("COMBUST"));
                            	else if (isPlanetCombust && (planetvalues == 8 || planetvalues == 9))  
                            		out.println (planetPositionConstants.getString("ECLIPSE"));
                             String relationship = getRelationshipInString(planetHoro.getRelationshipForShodashvargaDivision(planetvalues, 0));  
                             
                            %>
                        </td>
                        <td>
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
                <% }
            } %>
               </tbody>
        </table>
        </div>
        <p class="text-sm"><%=planetConstants.getString("NOTE") %>: <b>[<%=planetPositionConstants.getString("COMBUST") %>] </b>- <%=planetPositionConstants.getString("COMBUSTFULL") %> <b>&nbsp;[<%=planetConstants.getString("DIR") %>] </b>- <%=planetPositionConstants.getString("DIRECT") %> <b>&nbsp;[<%=planetConstants.getString("RET") %>] </b> -<%=planetPositionConstants.getString("RETROGRADE") %><b>&nbsp;[<%=planetPositionConstants.getString("ECLIPSE") %>] </b> -<%=planetPositionConstants.getString("ECLIPSE_NAME") %></p>

        </div>
<%!
    public String changeplanetname(String planetname)
    {
		String returnPlName = planetname;
		if(planetname != null)
		{
			if(planetname.equals("अरूण"))
			{
				returnPlName = "यूरे";
			}
			else if(planetname.equals("वरूण"))
			{
				returnPlName = "नेप";
			}
			else if(planetname.equals("यम"))
			{
				returnPlName = "प्लू";
			}
		}
        return returnPlName;
    }
    
	public String ProperCasePlanet(String planetname)
	{
		String returnPlName = planetname;
		if(planetname.equals("SUN"))
		{
			returnPlName = "Sun";
		}
		else if(planetname.equals("MOON"))
		{
			returnPlName = "Moon";
		}
		else if(planetname.equals("MARS"))
		{
			returnPlName = "Mars";
		}
		else if(planetname.equals("MERC"))
		{
			returnPlName = "Mer";
		}
		else if(planetname.equals("JUPT"))
		{
			returnPlName = "Jup";
		}
		else if(planetname.equals("VENU"))
		{
			returnPlName = "Ven";
		}
		else if(planetname.equals("SATN"))
		{
			returnPlName = "Sat";
		}
        return returnPlName;
	}
%>
