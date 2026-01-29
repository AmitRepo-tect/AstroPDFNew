<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<% Local local = new Local();
int languageCode = (Integer) session.getAttribute("languageCode");
DesktopHoro myAstrologyObject = (DesktopHoro) session.getAttribute("HoroscopeObj");
//MyResourceBundle constants = (MyResourceBundle)request.getAttribute("constants");
MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle gemStoneConstants = local.loadPropertiesFileNew("gemstonesreport", languageCode); %>
<div class="hdg-lg card">
	<h1><%=gemStoneConstants.getString("GEMSTONE_PREDICTION") %></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content anchor-clr">
<h2> <%=gemStoneConstants.getString("WHAT_IS_GEMESTONES")%></h2>
<p><%=gemStoneConstants.getString("GEMINTRO") %></p>
</div>
</div>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content anchor-clr">

		<%
        String[] stoneHeading = new String[]{"YOUR_LIFE_STONE","YOUR_LUCKY_STONE","YOUR_BHAGYA_STONE"};
        
        String[] stonedesc = local.getStringArray(gemStoneConstants.getString("STONE_DESCRIPTION"));
        for(int i=0;i<=2;i++)
        {
        int[] houses = new int[]{1,5,9};
        String LifeStone="";
        String Qualities="";
        String Instructions="";
        String Mantra="";
        String house="";
            switch( Astrology.getHouseLord(houses[i], myAstrologyObject))
            {
            	case Common.GEM_SUN:
	                LifeStone = constants.getString("RUBY");
	                Qualities = gemStoneConstants.getString("QUALITIES2");
	                Instructions = gemStoneConstants.getString("GOLD_IN_RING_FINGER");
	                Mantra = gemStoneConstants.getString("SUN_MANTRA");
	                break;
            	case Common.GEM_MOON:
	                LifeStone = constants.getString("PEARL");
	                Qualities = gemStoneConstants.getString("QUALITIES2");
	                Instructions = gemStoneConstants.getString("SILVER_IN_RING_FINGER");
	                Mantra = gemStoneConstants.getString("MOON_MANTRA");
	                break;
            	case Common.GEM_MARS:
	                LifeStone = constants.getString("CORAL");
	                Qualities = gemStoneConstants.getString("QUALITIES3P");
	                Instructions = gemStoneConstants.getString("GOLD_OR_SILVER_IN_RING_FINGER");
	                Mantra = gemStoneConstants.getString("MAR_MANTRA");
	                break;
            	case Common.GEM_MERCURY:
	                LifeStone = constants.getString("EMERALD");
	                Qualities = gemStoneConstants.getString("QUALITIES1_5");
	                Instructions = gemStoneConstants.getString("GOLD_IN_RING_OR_FINGER");
	                Mantra = gemStoneConstants.getString("MER_MANTRA");
	                break;
            	case Common.GEM_JUPITER:
	                LifeStone = constants.getString("TOPAZ");
	                Qualities = gemStoneConstants.getString("QUALITIES2");
	                Instructions = gemStoneConstants.getString("GOLD_IN_INDEX_FINGER");
	                Mantra = gemStoneConstants.getString("JUP_MANTRA");
	                break;
            	case Common.GEM_VENUS:
	                LifeStone = constants.getString("DIAMOND");
	                Qualities = gemStoneConstants.getString("QUALITIES1");
	                Instructions = gemStoneConstants.getString("GOLD_OR_SILVER_IN_MIDDLE_FINGER");
	                Mantra = gemStoneConstants.getString("VEN_MANTRA");
	                break;
            	case Common.GEM_SATURN:
	                LifeStone = constants.getString("SAPPHIRE");
	                Qualities = gemStoneConstants.getString("QUALITIES2");
	                Instructions = gemStoneConstants.getString("GOLD_IN_MIDDLE_FINGER");
	                Mantra = gemStoneConstants.getString("SAT_MANTRA");
	                break;
            	case Common.GEM_RAHU:
	                LifeStone = constants.getString("HESSONITE");
	                Qualities = gemStoneConstants.getString("QUALITIES3");
	                Instructions = gemStoneConstants.getString("GOLD_OR_SILVER_IN_MIDDLE_FINGER");
	                Mantra = gemStoneConstants.getString("RAH_MANTRA");
	                break;
            	case Common.GEM_KETU:
	                LifeStone = constants.getString("CATS_EYE");
	                Qualities = gemStoneConstants.getString("QUALITIES3");
	                Instructions = gemStoneConstants.getString("GOLD_IN_MIDDLE_FINGER");
	                Mantra = gemStoneConstants.getString("KET_MANTRA");
	                break;
            }
        %>
        
       <div class="cellhead"> 
       <div id="divhead">
		<h2> <%=gemStoneConstants.getString(stoneHeading[i])%> </h2>
		
		</div>
		</div>
		<div>
			<p>
				<%=stonedesc[i] %>
			</p>
		</div>
		<div>
			<div class="cellhead">
				<div id="divhead">
					<h2> <%=gemStoneConstants.getString("RECOMMENDATION")%> </h2></div>
			</div>
			<div class="RecommendationBorder1">
				<div class="RecommendationHeading1">
					<%=gemStoneConstants.getString("RECOMMEND_GEMESTONES")%></div>
				<div class="RecommendationContent1">
					<%=LifeStone%></div>
				<div class="RecommendationHeading1">
					<%=gemStoneConstants.getString("QUALITIES_OF_THE_GEMSTONE")%></div>
				<div class="RecommendationContent1">
					<%=Qualities%></div>
				<div class="RecommendationHeading1">
					<%=gemStoneConstants.getString("WEARING_INSTRUCTIONS")%></div>
				<div class="RecommendationContent1">
					<%=Instructions%></div>
				<div class="RecommendationHeading1">
					<%=gemStoneConstants.getString("RECOMMEND_MANTRA")%></div>
				<div class="RecommendationContent1">
					<%=Mantra%></div>
			</div>
		</div>
		<% } %>
		
		<div class="cellhead">
			<div id="divhead">
				<h2> <%=gemStoneConstants.getString("IMPORTANT_INFORMATION")%> </h2></div>
		</div>
		<div>
			<%=gemStoneConstants.getString("IMPORTANT_INFO") %>
		</div>
</div>
</div>
</div>


	
		

		
