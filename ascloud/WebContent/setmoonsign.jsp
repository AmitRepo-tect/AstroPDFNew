<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@ page import="com.cslsoftware.util.Constants"%>
<%@ page import="java.util.Calendar" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
int languageCode = 0;
if(request.getParameter("languagecode")!=null && request.getParameter("languagecode").equals("1")){
	languageCode = 1;
}
     Local local = new Local();
     Hindi hindi = new Hindi();
     request.setCharacterEncoding("UTF-8");
     response.setCharacterEncoding("UTF-8");
    MyResourceBundle moonSignConstants = (MyResourceBundle) local.loadPropertiesFileNew("moonsign", languageCode);
// ******** READ DATE FROM FORM *******
	if (Util.safestr(request.getParameter("Day")) == "" ||  Util.safestr(request.getParameter("month")) == "" || Util.safestr(request.getParameter("year")) == "" || Util.safestr(request.getParameter("hrs")) == "" || Util.safestr(request.getParameter("min")) == "" || Util.safestr(request.getParameter("sec")) == "" || Util.safestr(request.getParameter("place")) == "") {
		response.sendRedirect("/moonsign.asp");
	}

	String cityId = Util.safestr(request.getParameter("cityid"));
	String name = Util.safestr(request.getParameter("name"));
	String doB = Util.safestr(request.getParameter("day"));
	String moB = Util.safestr(request.getParameter("month"));
	String yoB = Util.safestr(request.getParameter("year"));
	String hoB = Util.safestr(request.getParameter("hrs"));
	String minOB = Util.safestr(request.getParameter("min"));
	String soB = Util.safestr(request.getParameter("sec"));
	String place = Util.safestr(request.getParameter("place"));
	String latDegree = Util.safestr(request.getParameter("latdeg"));
	String latMinute = Util.safestr(request.getParameter("latmin"));
	String latNS = Util.safestr(request.getParameter("latns"));
	String longDegree = Util.safestr(request.getParameter("longdeg"));
	String longMinute = Util.safestr(request.getParameter("longmin"));
	String longEW = Util.safestr(request.getParameter("longew"));
	String timeZone = Util.safestr(request.getParameter("timezone"));
	String dST = Util.safestr(request.getParameter("dst"));
	
	String DateoB = doB + "/" + moB + "/" + yoB;
	String TimeoB = hoB + ":" + minOB + ":" + soB;
		
 //  ********* Make Object Of Horodesktop.dll **********
 
// ***** INITIALIZE HORODESKTOP OBJECT WITH EITHER FORM OR DATABASE VALUES ****
	DesktopHoro ObjHoro = new  DesktopHoro();
	Constants ObjConst = new Constants();
	
	ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		
	ObjHoro.setPlace(place);
	ObjHoro.setCompanyAddLine1 ("Delhi");
	ObjHoro.setCompanyName ("OJAS Softech");
	ObjHoro.setTimeZone(String.valueOf(timeZone));
	ObjHoro.setSecondOfBirth(soB);
	ObjHoro.setMinuteOfBirth(minOB);
	ObjHoro.setHourOfBirth(hoB);
	ObjHoro.setDayOfBirth(doB);
	ObjHoro.setMonthOfBirth(moB);
	ObjHoro.setYearOfBirth(yoB);
	ObjHoro.setDegreeOfLattitude(String.valueOf(latDegree));
	ObjHoro.setDegreeOfLongitude(String.valueOf(longDegree));
	ObjHoro.setSecondOfLattitude("00");
	ObjHoro.setSecondOfLongitude("00");
	ObjHoro.setMinuteOfLongitude(String.valueOf(longMinute));
	ObjHoro.setMinuteOfLattitude(String.valueOf(latMinute));
	ObjHoro.setEastWest(longEW);
	ObjHoro.setNorthSouth(latNS);
	ObjHoro.setDST(dST);
	ObjHoro.setLanguageCode("0");
	
	ObjHoro.initialize();
	
// ***** set session("HoroscopeObj") = objHoro *****
   //String n = ObjHoro.getRasiName
	String m = ObjHoro.getRasiName().toLowerCase();
    String nameofrashi = m;

    if(m.toLowerCase().equals("scorpion")) {
    	m = "scorpio";
    }
	Calendar cal = Calendar.getInstance();
	int currentYear = cal.get(Calendar.YEAR);
	//int mm = hindi.unicode(ObjHoro.getRasi(),languageCode);
	String[] engRashi = new String[] {"aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"};
	String[] hindiRashi = new String[] {"mesh", "vrishabha", "mithun", "karka", "simha", "kanya", "tula", "vrishchika", "dhanu", "makara", "kumbha", "meena"};
	String[] hindiRashiNames = {"मेष","वृषभ","मिथुन","कर्क","सिंह","कन्या","तुला","वृश्चिक","धनु","मकर","कुंभ","मीन"};
	String[] hindiRashiAnother = new String[] {"mesh", "vrishabh", "mithun", "kark", "singh", "kanya", "tula", "vrishchik", "dhanu", "makar", "kumbh", "meen"};
	String unicodeRashiName = "";
	String unicodeHindiRashiName = "";
	String getRasiName = "";
	String unicodeRashiNameAnother = "";
	for(int i=0;i<engRashi.length;i++)
	{
		if(m.toLowerCase().equals(engRashi[i]))
		{
			unicodeRashiName = hindiRashi[i];
			unicodeHindiRashiName = hindiRashiNames[i];
			unicodeRashiNameAnother = hindiRashiAnother[i];
			break;
		}
	}
	
	if(languageCode == 1)
	{
		getRasiName =unicodeHindiRashiName;
	}
	else
	{
		getRasiName =unicodeRashiName;
	}
	//String unicodeRashiName = hindi.unicode(ObjHoro.getRasiName(), languageCode);
	Calendar cal1 = Calendar.getInstance();
	//System.out.println("Here : "+unicodeRashiName);
	String characName = unicodeRashiNameAnother;
	String yearName = unicodeRashiNameAnother;
	if(unicodeRashiNameAnother.equals("vrishabh"))
	{
		characName = "vrishabha";
	}
%>
<div class="ui-container ui-margin-tb">
	<div id="roundtopheadid">
		<div class="roundtophead">
			
				<div class="AscTopHead" style="text-align: left;">
					<a href="/" title="Home" class="BreadCrumb"><%=moonSignConstants.getString("HOME")%></a> &#187; <a
						class="BreadCrumb"><%=moonSignConstants.getString("MOON_SIGN_CALCULATOR")%></a>
				</div>
			
		</div>
	</div>
	<div class="ui-content bg-light-gray">
		<h1 align="center"><%=moonSignConstants.getString("MOON_SIGN")%></h1>
		
		<div class="card-view-content">
			
			<div align="right" class="col-xs-4">
				<a href="http://hindi.astrosage.com/rashi/<%=characName%>.asp">
					<img src="/images/sign/<%=m %>.png" width="100" height="100" />
				</a>
			</div>
			<div class="col-xs-8">
			<h2><%=nameofrashi.substring(0, 1).toUpperCase() + nameofrashi.substring(1) + "(" + getRasiName + ")</h2>"%>
				<h4><%=moonSignConstants.getString("BASED_BIRTH_DETAILS")%></h4>
			</div>
			<div class="clear"></div>
			<%if(languageCode == 0) {%>
			<div class="ui-container">
<div class="ui-box-wrapp">
        <div class="ui-box">
            <a href="http://www.astrosage.com/horoscope/daily-<%=m.toLowerCase()%>-horoscope.asp">
            <span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("DAILY_HOROSCOPE")%></font></a>
        </div>
    </div>
<div class="ui-box-wrapp">
        <div class="ui-box">
            <a href="http://www.astrosage.com/horoscope/weekly-<%=m.toLowerCase()%>-horoscope.asp">
            <span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("WEEKLY_HOROSCOPE")%></font></a>
        </div>
    </div>
    
<div class="ui-box-wrapp">
        <div class="ui-box">
            <a href="http://www.astrosage.com/horoscope/monthly-<%=m.toLowerCase()%>-horoscope.asp">
            <span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("MONTHLY_HOROSCOPE")%></font></a>
        </div>
    </div>
</div>

<div class="ui-container">

<div class="ui-box-wrapp">
        <div class="ui-box">
            <a href="http://www.astrosage.com/horoscope/<%=m.toLowerCase()%>-characteristics.asp">
            <span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("CHARACTERISTICS")%></font></a>
        </div>
    </div>
    
<div class="ui-box-wrapp">
        <div class="ui-box">
            <a href="http://www.astrosage.com/horoscope/weekly-<%=m.toLowerCase()%>-love-horoscope.asp">
            <span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("LOVE_HOROSCOPE")%></font></a>
        </div>
    </div>
    
<div class="ui-box-wrapp">
        <div class="ui-box">
            <a href="http://www.astrosage.com/horoscope/yearly-<%=m.toLowerCase()%>-horoscope.asp">
            <span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("YEARLY_HOROSCOPE")%></font></a>
        </div>
    </div>
</div>
<%} 
	else if(languageCode == 1)
	{
%>
		<div class="ui-container">
			<div class="ui-box-wrapp">
				<div class="ui-box">
					<a href="http://www.astrosage.com/rashifal/<%=unicodeRashiName%>-rashifal.asp">
					<span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("DAILY_HOROSCOPE")%></font></a>
				</div>
			</div>
			
			<div class="ui-box-wrapp">
				<div class="ui-box">
					<a href="http://www.astrosage.com/rashifal/saptahik/<%=unicodeRashiName%>-rashifal.asp">
					<span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("WEEKLY_HOROSCOPE")%></font></a>
				</div>
			</div>

			<div class="ui-box-wrapp">
				<div class="ui-box">
					<a href="http://www.astrosage.com/rashifal/masik/<%=unicodeRashiName%>-rashifal.asp">
					<span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("MONTHLY_HOROSCOPE")%></font></a>
				</div>
			</div>
		</div>

		<div class="ui-container">
			<div class="ui-box-wrapp">
				<div class="ui-box">
					<a href="http://hindi.astrosage.com/rashi/<%=characName%>.asp">
					<span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("CHARACTERISTICS")%></font></a>
				</div>
			</div>

			<div class="ui-box-wrapp">
				<div class="ui-box">
					<a href="http://www.astrosage.com/rashifal/saptahik-prem/<%=unicodeRashiName%>-rashifal.asp">
					<span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("LOVE_HOROSCOPE")%></font></a>
				</div>
			</div>

			<div class="ui-box-wrapp">
				<div class="ui-box">
					<a href="http://www.astrosage.com/<%=currentYear%>/<%=yearName%>-rashifal-<%=currentYear%>.asp">
					<span class="ui-inner-img"><img src="/images/sign/<%=m %>.png" width="40" alt="<%=m %> Zodiac sign" /></span><font size="+1"><%=moonSignConstants.getString("YEARLY_HOROSCOPE")%></font></a>
				</div>
			</div>
		</div>
<%
	}
%>

<div class="ui-clear">
</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
