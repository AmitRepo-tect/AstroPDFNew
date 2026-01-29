<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%
Local olocal = new Local();

int olang = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle rBReport = olocal.loadPropertiesFileNew("report",olang);
MyResourceBundle rBReportFreechartIcon1 = olocal.loadPropertiesFileNew("report-freechart_icon1",olang);

Object objreport = session.getAttribute("constants");
MyProperties oconstants = null;
if(objreport != null)
{
	oconstants = (MyProperties) objreport;
}
else
{
	oconstants = new MyProperties(olocal.loadPropertiesFile("constants", olang));
	session.setAttribute("constants", oconstants);
}

%>
<style>
.eqh a{border-radius:2px;}
.eqh {margin-bottom: 30px;}
.eqh img{max-height: 189px;}
.user-define img {width: 98px;}
.flex {display: flex;flex-wrap: wrap;}
.mrt20{margin-top:20px;}
@media (max-width:1366px){.eqh .card {min-height: 182px;padding-top: 26px;}}
@media(max-width:768px){
.eqh .card {min-height: auto;padding-top: 14px;}
.eqh .card {box-shadow:none;}
.user-define img {width: 56px;}
.eqh .full-width {margin-bottom: 0px; max-height:124px;}
.eqh img{box-shadow:none;}
.eqh {margin-bottom: 0px;}
.user-define .full-width {border-right:0; border-bottom:0;max-height:124px;}
.user-define .card .card-content {padding: 5px!important;}
.mrt20{margin-top:50px;}
.flex .col{background:#fff;}
.flex .col.brtb {border-top: 1px solid #ddd;border-bottom: 1px solid #ddd;}
.flex .col.brlr {border-right: 1px solid #ddd;border-left: 1px solid #ddd;}
.flex .col.brt {border-top: 1px solid #ddd;}
.flex .col.brb {border-bottom: 1px solid #ddd;}
.flex .col.brl {border-left: 1px solid #ddd;}
.flex .col.brr {border-right: 1px solid #ddd;}
}




</style>

<div class="row flex">
	<div class="col brtb s4 m4 user-define">
		<a href="planetposition.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content center">
					<h6	class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReport.getString("BIRTH_CHART_KUNDLI") %></h6>
					<img src="images/icons/ic_kundali.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReport.getString("BIRTH_CHART_KUNDLI") %></h6>
					<p class="truncate"><%=rBReport.getString("PLANETARY_POSITIONS_AND_YOUR_CHART") %>.</p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brtb brl user-define">
		<a href="matchmaking.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6	class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=oconstants.getString("MATCH_YOUR_HOROSCOPE") %></h6>
					<img src="images/icons/ic_matching.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=oconstants.getString("MATCH_YOUR_HOROSCOPE") %></h6>
					<p class="truncate"><%=oconstants.getString("MATCH_YOUR_HOROSCOPE") %> (<%=rBReport.getString("GUN_MILAN_WITH_YOUR_PARTNER") %>)</p>
				</div>
			</div>
		</a>
	</div>
	
	<div class="col s4 m4  brtb brl eqh">
		<a href="/" onclick="getEvents('homelink', 'GoToAstroSage');" class="full-width black-text">
		<div class="card height-define center-align">
		<%if (olang == 1){ %>
			<img src="/cloud/images/das2-hi.jpg" class="responsive-img hide-on-small-only">	
			<img src="/cloud/images/das3-hi.jpg" class="responsive-img hide-on-large-only">	
				
		<%}else{%>
			<img src="/cloud/images/das2.jpg" class="responsive-img hide-on-small-only">	
			<img src="/cloud/images/das3.jpg" class="responsive-img hide-on-large-only">	
			
		<%} %>	
		</div>			
		</a>
	</div>	
		
		
	<div class="col s4 m4 brb brl user-define right-R">
		<a href="character-horoscope.asp" class="full-width topB black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6
						class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=oconstants.getString("YOUR") %>
						<%=oconstants.getString("LIFE_PREDICTIONS") %></h6>
					<img src="images/icons/ic_predection.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=oconstants.getString("YOUR") %>&nbsp;
						<%=oconstants.getString("LIFE_PREDICTIONS") %></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_ABOUT_YOUR") %>&nbsp;<%=rBReport.getString("NATURE") %>&nbsp;<%=oconstants.getString("LOVE") %>&nbsp;<%=rBReport.getString("ANDI") %>&nbsp;<%=rBReport.getString("CAREER_NEW")%>&nbsp;<%=rBReport.getString("KE_BAARE_ME")%></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define right-R ">
		<a href="transit-today.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6	class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReportFreechartIcon1.getString("GOCHAR_PHAL_TRANSIT_REPORT") %></h6>
					<img src="images/icons/ic_transit_today.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReportFreechartIcon1.getString("GOCHAR_PHAL_TRANSIT_REPORT") %></h6>
					<p class="truncate"><%=rBReport.getString("HOW_DOES_POSITION_OF_CURRENT_PLANETS_IMPACT_YOU") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define ">
		<a href="lalkitab-prediction.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6	class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReportFreechartIcon1.getString("LAL_KITAB_HOROSCOPE") %></h6>
					<img src="images/icons/ic_lalkitab.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReportFreechartIcon1.getString("LAL_KITAB_HOROSCOPE") %></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_LAL_KITAB_RED_BOOK_PREDICTIONS_REMEDIES_UPAY_FOR_YOUR_PROBLEMS") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define right-R">
		<a href="manglikdetails.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6	class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReportFreechartIcon1.getString("MANGAL")%>
						&nbsp;<%=rBReportFreechartIcon1.getString("DOSHA")%></h6>
					<img src="images/icons/ic_mangal_dosh.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReportFreechartIcon1.getString("MANGAL")%>
						&nbsp;<%=rBReportFreechartIcon1.getString("DOSHA")%></h6>
					<p class="truncate"><%=rBReport.getString("DO_YOU_HAVE_MANGAL_DOSHA_WHAT_ARE_THE_REMEDIES_WHAT_ARE_THE_IMPACT_ON_YOUR_MARRIED_LIFE") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define right-R ">
		<a href="ascendant-prediction.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6	class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=oconstants.getString("ASCENDANT") %>
					</h6>
					<img src="images/icons/ascendant.png">
					
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=oconstants.getString("ASCENDANT") %></h6>
					<p class="truncate"><%=rBReport.getString("WHAT_DOES_YOUR") %>&nbsp;<%=oconstants.getString("ASCENDANT") %>&nbsp;<%=oconstants.getString("NAKSHATRA") %>&nbsp;<%=rBReport.getString("ANDI") %>&nbsp;<%=oconstants.getString("MOON_SIGN")%>&nbsp;<%=rBReport.getString("TELLS_ABOUT_YOU") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define ">
		<a href="gemstones-report.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6	class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=oconstants.getString("GEMSTONES_REPORT")%></h6>
					<img src="images/icons/ic_gemstone.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=oconstants.getString("GEMSTONES_REPORT")%></h6>
					<p class="truncate"><%=rBReport.getString("WHICH_GEMSTONE_WILL_SUIT_YOU_WHICH_GEM_SHOULD_YOU_WEAR_HOW_TO_WEAR_GEMSTONE") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define">
		<a href="varshphalprediction.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content center">
					<h6 class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"> <%=Calendar.getInstance().get(Calendar.YEAR)%>
						<%=rBReport.getString("PERSONALIZED_HOROSCOPE_YEARLY") %>
				</h6>
					<img src="images/icons/personalized-horoscope-report.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"> <%=Calendar.getInstance().get(Calendar.YEAR)%>
						<%=rBReport.getString("PERSONALIZED_HOROSCOPE_YEARLY") %>
				</h6>
					<p class="truncate"><%=rBReport.getString("GET_YOUR_ANNUAL_PERSONALIZED_HOROSCOPE").replaceAll("2013",String.valueOf(Calendar.getInstance().get(Calendar.YEAR))) %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define">
		<a href="personalized-horoscope.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6
						class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"> <%=oconstants.getString("PERSONALIZED_HOROSCOPE") %></h6>
					<img src="images/icons/personalized-horoscope-report.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"> <%=oconstants.getString("PERSONALIZED_HOROSCOPE") %></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_PREDICTIONS_FOR_TODAY_BASED_ON_YOUR_BIRTH_CHART") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define">
		<a href="varshphalallpages.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6
						class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReportFreechartIcon1.getString("YEAR_ANALYSIS_VARSHPHAL") %></h6>
					<img src="images/icons/year-analysis.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReportFreechartIcon1.getString("YEAR_ANALYSIS_VARSHPHAL") %></h6>
					<p class="truncate"><%=rBReport.getString("HOW_WILL_BE_2012_FOR_YOU_WHAT_GOOD_AND_BAD_YOU_CAN_EXPECT_IN_YEAR_2012").replaceAll("2012", String.valueOf(Calendar.getInstance().get(Calendar.YEAR))) %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define">
		<a href="sadesatireport.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6
						class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReportFreechartIcon1.getString("SADE_SATI_LIFE_REPORT")%></h6>
					<img src="images/icons/shani-sade-sati-report.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReportFreechartIcon1.getString("SADE_SATI_LIFE_REPORT")%></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_ABOUT_IMPACT_OF_SHANI_SADE_SATI_FOR_WHOLE_LIFE") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define">
		<a href="kalsarpa-yoga.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content center">
					<h6
						class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=oconstants.getString("KALSHARP_DOSH")%></h6>
					<img src="images/icons/kalsarp-dosh.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=oconstants.getString("KALSHARP_DOSH")%></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_ABOUT_IMPACT_OF_KALSHARP_DOSH_FOR_WHOLE_LIFE") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define ">
		<a href="dasha_phala.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6 class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReportFreechartIcon1.getString("DASHA_PHAL_ANALYSIS")%></h6>
					<img src="images/icons/dashaphal.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReportFreechartIcon1.getString("DASHA_PHAL_ANALYSIS")%></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_ABOUT_RISE_AND_FALL_IN_LIFE_GOOD_AND_BAD_EVENTS_CHANGE_OF_TIME_IN_ADVANCE") %></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define right-R">
		<a href="love-horoscope.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content center">
					<h6 class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=oconstants.getString("LOVE") %></h6>
					<img src="images/icons/love.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=oconstants.getString("LOVE") %></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_ABOUT_YOUR") %>&nbsp;<%=oconstants.getString("LOVE") %>&nbsp;<%=rBReport.getString("KE_BAARE_ME")%></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define"> 
		<a href="career-horoscope.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6 class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=rBReport.getString("CAREER_NEW").replace(".", "") %></h6>
					
					<img src="images/icons/career-and-business-horoscope-report.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=rBReport.getString("CAREER_NEW").replace(".", "") %></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_ABOUT_YOUR") %>&nbsp;<%=rBReport.getString("CAREER_NEW").replace(".", "") %>&nbsp;<%=rBReport.getString("KE_BAARE_ME")%></p>
				</div>
			</div>
		</a>
	</div>
	<div class="col s4 m4 brb brl user-define ">
		<a href="nakshatra-report.asp" class="full-width black-text">
			<div class="card height-define">
				<div class="card-content  center">
					<h6 class="card-title font-weight-400 mb-4 truncate hide-on-med-and-down"><%=oconstants.getString("NAKSHATRA") %></h6>
					<img src="images/icons/nakshatra.png">
					<h6 class="card-title font-weight-400 mb-4 DBN"><%=oconstants.getString("NAKSHATRA") %></h6>
					<p class="truncate"><%=rBReport.getString("KNOW_ABOUT_YOUR") %>&nbsp;<%=oconstants.getString("NAKSHATRA") %>&nbsp;<%=rBReport.getString("KE_BAARE_ME")%></p>
				</div>
			</div>
		</a>
	</div>
</div>
