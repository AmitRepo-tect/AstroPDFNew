<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="com.ojassoft.astrosagecloud.util.Astrology"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
Local localGR = new Local();
int languageCodeGR = (Integer) session.getAttribute("languageCode");
DesktopHoro myAstrologyObjectGR = (DesktopHoro) session.getAttribute("HoroscopeObj");

MyProperties constantsGR = (MyProperties) session.getAttribute("constants");
MyResourceBundle gemStoneConstants = localGR.loadPropertiesFileNew("gemstonesreport", languageCodeGR); 
%>

<div align="center" class="heading-sec">
    <h2>
        <%=gemStoneConstants.getString("GEMSTONE_PREDICTION")%>
    </h2>
</div>
<div class="inner-sec">
    <h3>
        <%=gemStoneConstants.getString("WHAT_IS_GEMESTONES")%>
    </h3>
    <p>
        <%=gemStoneConstants.getString("GEMINTRO") %></p>
    <%
    String[] stoneHeading = new String[]{"YOUR_LIFE_STONE","YOUR_LUCKY_STONE","YOUR_BHAGYA_STONE"};
    
    String[] stonedesc = localGR.getStringArray(gemStoneConstants.getString("STONE_DESCRIPTION"));
    for(int i=0;i<=2;i++)
    {
    int[] houses = new int[]{1,5,9};
    String LifeStone="";
    String Qualities="";
    String Instructions="";
    String Mantra="";
    String house="";
    switch( Astrology.getHouseLord(houses[i], myAstrologyObjectGR))
    {
    	case Common.GEM_SUN:
            LifeStone = constantsGR.getString("RUBY");
            Qualities = gemStoneConstants.getString("QUALITIES2");
            Instructions = gemStoneConstants.getString("GOLD_IN_RING_FINGER");
            Mantra = gemStoneConstants.getString("SUN_MANTRA");
            break;
    	case Common.GEM_MOON:
            LifeStone = constantsGR.getString("PEARl");
            Qualities = gemStoneConstants.getString("QUALITIES2");
            Instructions = gemStoneConstants.getString("SILVER_IN_RING_FINGER");
            Mantra = gemStoneConstants.getString("MOON_MANTRA");
            break;
    	case Common.GEM_MARS:
            LifeStone = constantsGR.getString("CORAL");
            Qualities = gemStoneConstants.getString("QUALITIES3P");
            Instructions = gemStoneConstants.getString("GOLD_OR_SILVER_IN_RING_FINGER");
            Mantra = gemStoneConstants.getString("MAR_MANTRA");
            break;
    	case Common.GEM_MERCURY:
            LifeStone = constantsGR.getString("EMERALD");
            Qualities = gemStoneConstants.getString("QUALITIES1_5");
            Instructions = gemStoneConstants.getString("GOLD_IN_RING_OR_FINGER");
            Mantra = gemStoneConstants.getString("MER_MANTRA");
            break;
    	case Common.GEM_JUPITER:
            LifeStone = constantsGR.getString("TOPAZ");
            Qualities = gemStoneConstants.getString("QUALITIES2");
            Instructions = gemStoneConstants.getString("GOLD_IN_INDEX_FINGER");
            Mantra = gemStoneConstants.getString("JUP_MANTRA");
            break;
    	case Common.GEM_VENUS:
            LifeStone = constantsGR.getString("DIAMOND");
            Qualities = gemStoneConstants.getString("QUALITIES1");
            Instructions = gemStoneConstants.getString("GOLD_OR_SILVER_IN_MIDDLE_FINGER");
            Mantra = gemStoneConstants.getString("VEN_MANTRA");
            break;
    	case Common.GEM_SATURN:
            LifeStone = constantsGR.getString("SAPPHIRE");
            Qualities = gemStoneConstants.getString("QUALITIES2");
            Instructions = gemStoneConstants.getString("GOLD_IN_MIDDLE_FINGER");
            Mantra = gemStoneConstants.getString("SAT_MANTRA");
            break;
    	case Common.GEM_RAHU:
            LifeStone = constantsGR.getString("HESSONITE");
            Qualities = gemStoneConstants.getString("QUALITIES3");
            Instructions = gemStoneConstants.getString("GOLD_OR_SILVER_IN_MIDDLE_FINGER");
            Mantra = gemStoneConstants.getString("RAH_MANTRA");
            break;
    	case Common.GEM_KETU:
            LifeStone = constantsGR.getString("CATS_EYE");
            Qualities = gemStoneConstants.getString("QUALITIES3");
            Instructions = gemStoneConstants.getString("GOLD_IN_MIDDLE_FINGER");
            Mantra = gemStoneConstants.getString("KET_MANTRA");
            break;
    }
    %>
    <h3>
        <%=gemStoneConstants.getString(stoneHeading[i])%></h3>
    <p>
        <%=stonedesc[i] %>
    </p>
    <h3>
        <%=gemStoneConstants.getString("RECOMMENDATION")%></h3>
    <table class="table table-bordered table-striped">
        <tr>
            <td>
                <%=gemStoneConstants.getString("RECOMMEND_GEMESTONES")%>
            </td>
            <td>
                <%=LifeStone%>
            </td>
        </tr>
        <tr>
            <td>
                <%=gemStoneConstants.getString("QUALITIES_OF_THE_GEMSTONE")%>
            </td>
            <td>
                <%=Qualities%>
            </td>
        </tr>
        <tr>
            <td>
                <%=gemStoneConstants.getString("WEARING_INSTRUCTIONS")%>
            </td>
            <td>
                <%=Instructions%>
            </td>
        </tr>
        <tr>
            <td>
                <%=gemStoneConstants.getString("RECOMMEND_MANTRA")%>
            </td>
            <td>
                <%=Mantra%>
            </td>
        </tr>
    </table>
    <% } %>
    <h3>
        <%=gemStoneConstants.getString("IMPORTANT_INFORMATION")%></h3>
    <p>
        <%=gemStoneConstants.getString("IMPORTANT_INFO") %>
    </p>
</div>
