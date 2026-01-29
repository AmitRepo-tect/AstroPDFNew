<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Local lc = new Local();
	int lcode = Util.safeInt(session.getAttribute("languageCode"));
	MyResourceBundle rBLeftMenu = lc.loadPropertiesFileNew("leftmenu", lcode);
	
	DesktopHoro leftMenuHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
	Object obj = session.getAttribute("constants");
	MyProperties leftMenuConstants = null;
	if(obj != null)
	{
		leftMenuConstants = (MyProperties) obj;
	}
	else
	{
		leftMenuConstants = new MyProperties(lc.loadPropertiesFile("constants", lcode));
		session.setAttribute("constants", leftMenuConstants);
	}

String menuUserDetails = "";
Object userObj = session.getAttribute("userDetails");
if(userObj != null)
{
	menuUserDetails = userObj.toString();
}
%>

<div class="leftcontainer">
	<div class="boxhdg boxtopbg">
		||&nbsp;&nbsp;<%=rBLeftMenu.getString("MAIN_MENU")%>&nbsp;&nbsp;||
	</div>

	<script language="JavaScript">
function rpManageLink(mylink) {
    var d = new Date()
newlink = mylink.href +"?DateTime="+d.getDate()+":"+d.getMonth()+":"+d.getYear()+":"+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()+":"+d.getTimezoneOffset()
mylink.href=newlink
}
</script>
	<script>
    function PopupCenter(pageURL, title, w, h) {
        var left = (screen.width / 2) - (w / 2);
        var top = (screen.height / 2) - (h / 2);
        var targetWin = window.open(pageURL, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
    } 
</script>

	<div class="chart-name">
		<%
if(request.getParameter("charttype")!=null && request.getParameter("charttype").equals("south")){
	session.setAttribute("chartType",1);
}

if(request.getParameter("charttype")!=null &&request.getParameter("charttype").equals("north")){
	session.setAttribute("chartType",0);
}

if(session.getAttribute("HoroscopeObj")!=null){    
    out.print("<font style='cursor:pointer;' id='flipflop' size='3'><b>" + leftMenuHoro.getName()+"</b></font>");	
  
}
%>
	</div>
	<script type="text/javascript">
    $(document).ready(function() {
        $("#flipflop").hover(function() {
        $("#datetimeplace").slideToggle("slow");
        });
    });
</script>

	<div id="datetimeplace">
		<%  
  if(session.getAttribute("HoroscopeObj")!=null){
      out.print("<b>"+ leftMenuConstants.getString("BIRTH") +" "+ leftMenuConstants.getString("DATAM") +" : </b>"+ getFullMonthName(leftMenuHoro.getMonthOfBirth(), lcode) +" "+ leftMenuHoro.getDayOfBirth() + ", " + leftMenuHoro.getYearOfBirth() +"<br/>");
      out.print("<b>"+ leftMenuConstants.getString("BIRTH")+" "+ leftMenuConstants.getString("TIMAR") +" : </b>"+ leftMenuHoro.getHourOfBirth() +" : "+ leftMenuHoro.getMinuteOfBirth() +" : "+ leftMenuHoro.getSecondOfBirth() +"<br/>");
      out.print("<b>"+ leftMenuConstants.getString("PLACE_OF_BIRTH")+" : "+ leftMenuHoro.getPlace() +"<br/>");
  	
  } 
  
  %>
	</div>

	<div align="left">
		<form method="POST" action="SetHoroscopeMenu.asp" id=form1 name=form1>
			<div class="outer">
				<div class="menu">
					<ul>
						<ul>
							||&nbsp;&nbsp;<%=rBLeftMenu.getString("PRINT_LIFE_REPORT")%>&nbsp;&nbsp;||
						</ul>
						<li><a href="download-kundli.asp"><%=leftMenuConstants.getString("PRINT_KUNDLI")%></a></li>
						<li><a href="lagna-navamsa-jpeg-chart.asp"
							onClick="_gaq.push(['_trackEvent', 'print_page', 'Save_Chart_as_image']);"
							title="Print, Embed or Share Chart on Facebook / Twitter"><%=leftMenuConstants.getString("SAVE_CHART")%></a></li>

						<ul>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;<%=leftMenuConstants.getString("CALCULATIONS")%>&nbsp;&nbsp;||
						</ul>

						<li><a href="home.asp"><%=leftMenuConstants.getString("WELCOME_PAGE")%></a></li>
						<li><a href="birth-details.asp"><%=leftMenuConstants.getString("BASIC_DETAILS")%></a></li>
						<li><a href="planetposition.asp"><%=leftMenuConstants.getString("PLANETARY_POSITION")%></a></li>
						<li><a href="chart.asp"><%=leftMenuConstants.getString("LAGNA_CHANDRA_CHARTS")%></a></li>
						<li><a href="chalittable.asp"><%=leftMenuConstants.getString("CHALIT_TABLE_CHART")%>
						</a></li>
						<li><a href="prastharashtakvarga.asp"><%=leftMenuConstants.getString("PRASTHARASHTAKVARGA_TABLE")%></a></li>
						<li><a href="ashtaktable.asp"><%=leftMenuConstants.getString("ASHTAK_VARGA_TABLE")%></a></li>
						<li><a href="getplanettoplanetaspectwestern.asp"><%=leftMenuConstants.getString("PLANET_TO_PLANET_ASPECT")%></a></li>
						<li><a href="bhavmadhya.asp"><%=leftMenuConstants.getString("ASPECT_ON_BHAV_MADHYA")%></a></li>
						<li><a href="kpcusp.asp"><%=leftMenuConstants.getString("ASPECT_ON_KP_CUSP")%></a></li>
						<li><a href="svklagna.asp"><%=leftMenuConstants.getString("SHODASHVARGA_CHARTS")%></li>
						<li><a href="shodashvargatable.asp"><%=leftMenuConstants.getString("SHODASHVARGA_TABLE")%></a></li>
						<li><a href="friendship.asp"><%=leftMenuConstants.getString("FRIENDSHIP_TABLE")%></a></li>
						<li><a href="vimshottaridasha.asp"><%=leftMenuConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
						<li><a href="shadandbhav.asp"><%=leftMenuConstants.getString("SHADBALA_BHAVBALA")%></a></li>
						<li><a href="charantardasha1.asp"><%=leftMenuConstants.getString("CHAR_DASHA")%></a></li>
						<li><a href="yoginidasha1.asp"><%=leftMenuConstants.getString("YOGINI_DASHA")%></a></li>
						<li><a href="westernsystem.asp"><%=leftMenuConstants.getString("WESTERN_SYSTEM")%></a></li>
						<li><%=leftMenuConstants.getString("PRINT_FORMAT_1")%> - <a
							target="_blank"
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_1_pdf']);"
							href="vedic-chart-pdf.asp?page=3" title="PDF Format"><%=leftMenuConstants.getString("PDF") %></a>
							<!-- | <a target="_blank"
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_1_low']);"
							href="j_lagnapage.asp" title="Low Print Quality/ Fast Download"><%//=leftMenuConstants.getString("JPEG") %></a> -->
						</li>
						<li><%=leftMenuConstants.getString("PRINT_FORMAT_2")%> - <a
							target="_blank"
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_2_low']);"
							href="j_lagnadivision.jsp"
							title="Low Print Quality/ Fast Download">Low</a></li>
						<li><%=leftMenuConstants.getString("PRINT_SHODASHVARGA")%> -
							<a target="_blank"
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_pdf']);"
							href="vedic-chart-pdf.asp?page=16"
							title="PDF Format"><%=leftMenuConstants.getString("PDF") %></a><!--  |
							<a target="_blank"
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_shodashvarga_low']);"
							href="j_shodashvarga.asp"
							title="Low Print Quality/ Fast Download"><%//=leftMenuConstants.getString("JPEG") %></a>
							--> 
						</li>
						<li><a
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_sarvatobhadra_low']);"
							target="_blank" href="j_sarvatobhadradegree.asp"><%=leftMenuConstants.getString("PRINT_SARVATOBHADRA_CHAKRA")%></a>
						</li>
						<li><a href="transittodaychart.asp"><%=leftMenuConstants.getString("TRANSIT_TODAY")%></a>
						</li>
						<li><a href="astro-sketch.asp"><%=leftMenuConstants.getString("ASTRO_SKETCH")%></a>
						</li>
						<li><a href="jaminisystemkarakamsaswamsa.asp"><%=leftMenuConstants.getString("KRSWKUNDLI")%></a>
						</li>
						<li><a href="/cloud/worksheet/"><%=leftMenuConstants.getString("WORK_SHEET_AS") %></a>
						</li>
						<li><a onclick=popupvisibility(); style="cursor: pointer"><%=leftMenuConstants.getString("UPGRADE_TO_PAID_PLAN") %></a></li>


						<ul>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;<%=leftMenuConstants.getString("PREDICTIONS_REPORTS")%>
							&nbsp;&nbsp;||
						</ul>
						<li><a href="prediction1.asp"><%=leftMenuConstants.getString("LIFE_PREDICTIONS")%></a>
						</li>
						<li><a href="love-horoscope.asp"><%=leftMenuConstants.getString("LOVE_HOROSCOPE")%></a></li>
						<li><a href="career-horoscope.asp"><%=leftMenuConstants.getString("CAREER_HOROSCOPE")%></a></li>
						<li><a href="character-horoscope.asp"><%=leftMenuConstants.getString("NATURE_HOROSCOPE")%></a></li>
						<li><a href="healthindex.asp">Health Index</a></li>
						<li><a href="personalized-horoscope.asp"><%=leftMenuConstants.getString("PERSONALIZED_HOROSCOPE")%></a></li>
						<li><a href="varshphalallpages.asp"><%=leftMenuConstants.getString("VARSHAPHAL")%></a></li>
						<li><a href="lalkitab-varshaphal-prediction.asp"><%=leftMenuConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a>
						</li>
						<li><a href="lalkitab-prediction.asp"><%=leftMenuConstants.getString("LAL_KITAB_PREDICTIONS")%></a>
						</li>
						<li><a href="gemstones-report.asp"><%=leftMenuConstants.getString("GEMSTONES_REPORT")%></a></li>
						<li><a href="manglikdetails.asp"><%=leftMenuConstants.getString("MANGLIK_CONSIDERATIONS")%></a>
						</li>
						<li><a href="sadesatireport.asp"><%=leftMenuConstants.getString("SHANI_SADE_SATI")%></a></li>
						<li><a href="kalsarpa-yoga.asp"><%=leftMenuConstants.getString("KALSHARP_DOSH")%></a>
							- <a
							onClick="_gaq.push(['_trackEvent', 'print_page', 'kalsarpayoga_PDF']);"
							target="_blank" style="text-decoration: underline;"
							href="vedic-chart-pdf.asp?page=10"><%=leftMenuConstants.getString("PDF") %></a>
						</li>
						<li><a href="dasha_phala.asp"><%=leftMenuConstants.getString("DASHA_PREDICTIONS")%></a>
						</li>
						<li><a href="babyname.asp"><%=leftMenuConstants.getString("BABY_NAMES_SUGGESTION")%></a></li>
						<li><a href="planets-in-vedic-astrology.asp"><%=leftMenuConstants.getString("PLANETS_CONSIDERATION")%></a>
							- <a
							onClick="_gaq.push(['_trackEvent', 'print_page', 'PlanetConsidration_PDF']);"
							target="_blank" style="text-decoration: underline;"
							href="vedic-chart-pdf.asp?page=11"><%=leftMenuConstants.getString("PDF") %></a>
						</li>
						<li><a href="transit-today.asp"><%=leftMenuConstants.getString("CURRENT_TRANSIT_PREDICTIONS")%></a>
						</li>
						<li><a href="nakshatra-report.asp"><%=leftMenuConstants.getString("YOUR_NAKSHATRA")%></a></li>
						<li><a href="ascendant-prediction.asp"><%=leftMenuConstants.getString("YOUR_ASCENDANT")%></a>
							- <a
							onClick="_gaq.push(['_trackEvent', 'print_page', 'AscPredictions_PDF']);"
							target="_blank" style="text-decoration: underline;"
							href="vedic-chart-pdf.asp?page=12"><%=leftMenuConstants.getString("PDF") %></a>
						</li>
						<li><a href="moon-sign.asp"><%=leftMenuConstants.getString("YOUR_MOON_SIGN")%></a></li>
						<li><a href="rasi-calculator.asp"><%=leftMenuConstants.getString("YOUR_MOON_SIGN")%>  
						(<%=leftMenuConstants.getString("CLASSICAL")%>)</a></li>
						<li><a href="services.asp" style="color: Red;"><%=leftMenuConstants.getString("ORDER_REPORT")%></a></li>
						
						<ul>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;<%=leftMenuConstants.getString("DASHA")%>&nbsp;&nbsp;||
						</ul>
						<li><a href="vimshottaridasha.asp"><%=leftMenuConstants.getString("VIMSHOTTARI_DASHA")%></a></li>
						<li><%=leftMenuConstants.getString("PRINT_VIMSHOTTARI_DASA")%>
							- <a target="_blank"
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_dasa_low']);"
							href="j_dasa.asp" title="Low Print Quality/ Fast Download">Low</a>
						</li>
						<li><a href="charantardasha1.asp"><%=leftMenuConstants.getString("CHAR_DASHA")%></a></li>
						<li><a href="yoginidasha1.asp"><%=leftMenuConstants.getString("YOGINI_DASHA")%></a></li>
						<li><a href="lalkitabdasha.asp"><%=leftMenuConstants.getString("LAL_KITAB_DASHA")%></a></li>
						<ul>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;<%=leftMenuConstants.getString("LAL_KITAB")%>&nbsp;&nbsp;||
						</ul>
						<li><a href="lalplanethouse.asp"><%=leftMenuConstants.getString("LAL_KITAB_CHART_PLANETS_HOUSES")%></a></li>
						<li><a href="lalkitab-debts-teva.asp"><%=leftMenuConstants.getString("LK_DEBTS_AND_TEVA")%></a></li>
						<li><a href="lalkitab-teva.asp"><%=leftMenuConstants.getString("LK_TEVA")%></a></li>
						<li><a href="lalkitabdasha.asp"><%=leftMenuConstants.getString("LAL_KITAB_DASHA")%></a></li>
						<li><a href="lkitabworksheet2.asp?KundliType=1&isFirst=1"><%=leftMenuConstants.getString("LAL_KITAB_WORKSHEET")%></a></li>
						<li><a href="lalkitabvarshaphal.asp"><%=leftMenuConstants.getString("LAL_KITAB_VARSHAPHAL")%></a></li>
						<li><a href="lalkitabmonthchart.asp"><%=leftMenuConstants.getString("LAL_KITAB_MONTH_CHARTS")%></a></li>
						<li><a href="lalkitabvarshaphalcharts.asp"><%=leftMenuConstants.getString("LAL_KITAB_VARSHAPHAL_CHARTS")%></a></li>
						<li><a href="lalkitab-prediction.asp"><%=leftMenuConstants.getString("LAL_KITAB_PREDICTIONS")%></a>
						</li>
						<li><a href="lalkitab-varshaphal-prediction.asp"><%=leftMenuConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></a>
						</li>
						<li><%=leftMenuConstants.getString("LAL_KITAB_PRINT_PAGE")%>-
							<a
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_pdf']);"
							href="vedic-chart-pdf.jsp?page=13" target="_blank"> <%=leftMenuConstants.getString("PDF") %></a>
							<!--  | <a
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_lalkitab_low']);"
							href="j_lalkitab.asp" target="_blank"> <%//=leftMenuConstants.getString("JPEG") %></a>
							-->
						</li>
						<ul>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;<%=leftMenuConstants.getString("KP_SYSTEM")%>&nbsp;&nbsp;||
						</ul>
						<li><a href="KPPlanetCusp.asp"><%=leftMenuConstants.getString("KP_SYSTEM_PLANETS_CUSPS")%></a></li>
						<li><a href="getplanettoplanetaspectwestern.asp"><%=leftMenuConstants.getString("PLANET_TO_PLANET_ASPECT")%></a></li>
						<li><a href="kpcusp.asp"><%=leftMenuConstants.getString("ASPECT_ON_KPCUSP")%></a></li>
						<li><a href="kpsignirp.asp" onClick="rpManageLink(this)"><%=leftMenuConstants.getString("KP_SYSTEM_SIGNIFICATORS_RPS")%></a></li>
						<li><a href="kptoday.asp"><%=leftMenuConstants.getString("MY_KP_TODAY")%></a></li>
						<!--<li><a href="vimshottaridasha.asp"><%=leftMenuConstants.getString("VIMSHOTTARI_DASHA")%></a></li> -->
						<li><a
							onClick="_gaq.push(['_trackEvent', 'print_page', 'format_kpfull_pdf']);"
							href="vedic-chart-pdf.asp?page=14"
							target="_blank"><%=leftMenuConstants.getString("PRINT_KP_REPORT")%></a></li>
						<li><a href="4-step.asp"><%=leftMenuConstants.getString("STEP4")%></a></li>
						<li><a href="cil.asp"><%=leftMenuConstants.getString("CUSPAL_INTERLINK_SUB")%></a></li>
						<li><a href="kcil.asp"><%=leftMenuConstants.getString("KHULLAR_CUSPAL_INTERLINK_SUB")%></a></li>
						<li><a href="nakshatra-nadi.asp"><%=leftMenuConstants.getString("NAKSHATRA_NADI")%></a></li>
						<li><a href="planet-sign.asp"><%=leftMenuConstants.getString("PLANET_SIGNVIEW2")%></a></li>
						
						<ul>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;&nbsp;<%=leftMenuConstants.getString("PAID_CONSULTATION")%>&nbsp;&nbsp;||
						</ul>
						<li><a href="http://www.astrocamp.com?prtnr_id=1"
							target="_blank"><%=leftMenuConstants.getString("PAID_CONSULTATION")%></a></li>
					</ul>
				</div>
			</div>
		</form>
	</div>
</div>

<%!     
public String getFullMonthName(int monthNum,int languageCode){      
String monthName;
if(languageCode == 1){
  switch(monthNum){
	case 1:
        monthName = "जनवरी";
        break;
	case 2:
   		monthName = "फरवरी";
   		break;
	case 3:
    	monthName = "मार्च";
    	break;
	case 4:
    	monthName = "अप्रैल";
    	break;
	case 5:
    	monthName = "मई";
    	break;
	case 6:
    	monthName = "जून";
    	break;
	case 7:
    	monthName = "जुलाई";
    	break;
	case 8:
    	monthName = "अगस्त";
    	break;
	case 9:
    	monthName = "सितम्बर";
    	break;
	case 10:
		monthName = "अक्टूबर";
		break;
	case 11:
		monthName = "नवम्बर";
		break;
	case 12:
		monthName = "दिसम्बर"; 
		break;
	default:
	   monthName="";
}
    return(monthName); 
  }
else if(languageCode == 2){
 switch(monthNum){
	case 1:
   		monthName = "ஜனவரி";
   		break;
	case 2:
   		monthName = "பிப்ரவரி";
   		break;
	case 3:
    	monthName = "மார்ச்";
    	break;
	case 4:
    	monthName = "ஏப்ரல்";
    	break;
	case 5:
    	monthName = "மே";
    	break;
	case 6:
    	monthName = "ஜூன்";
    	break;
	case 7:
    	monthName = "ஜூலை";
    	break;
	case 8:
    	monthName = "ஆகஸ்ட்";
    	break;
	case 9:
    	monthName = "செப்டம்பர்";
    	break;
	case 10:
		monthName = "அக்டோபர்";
		break;
	case 11:
		monthName = "நவம்பர்";
		break;
	case 12:
		monthName = "டிசம்பர்" ; 
		break;
	default:
	   monthName="";
}
    return(monthName);
}
else{
switch(monthNum){
   case 1:
   		monthName = "January";
   		break;
   case 2:
   		monthName = "February";
   		break;
   case 3:
    	monthName = "March";
    	break;
   case 4:
    	monthName = "April";
    	break;
   case 5:
    	monthName = "May";
    	break;
   case 6:
    	monthName = "June";
    	break;
   case 7:
    	monthName = "July";
    	break;
   case 8:
    	monthName = "August";
    	break;
   case 9:
    	monthName = "September";
    	break;
   case 10:
		monthName = "October";
		break;
   case 11:
		monthName = "November";
		break;
   case 12:
		monthName = "December";   
		break;
   default:
	   monthName="";
}
    return(monthName);   
}    
    }
      %>
