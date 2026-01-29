<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@ page import="com.cslsoftware.util.Constants"%>


<%
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

    if(m == "Scorpion") {
    	m = "Scorpio";
    }
	
	int mm = ObjHoro.getRasi();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Language" content="en-us">
	<title>Find Your Moon Sign (Rashi)</title>
	<!--BASE TARGET="main"-->
	<link rel='stylesheet' type='text/css' href='styles.css'>
</head>
<body class="RScroll">
    <!--#include virtual="/header_no.inc"-->
    <div id="roundborder">
        <div id="roundtopheadid">
            <div class="roundtophead">
                <div>
                    <div class="AscTopHead" style="text-align: left;">
                        <a href="/" title="Home" class="BreadCrumb">Home</a> &#187; <a class="BreadCrumb">Moon Sign Calculator</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="RPage">
            <div class="container">
                <div class="RPage-wide">
					<h1 align="center">Moon Sign</h1>
					<div align="left">
						<div style="padding-left:10px;float:left;">
							<a href="/horoscope/<%=m.toLowerCase() %>.asp"><img src="/images/sign/<%=m %>.png" width="100" height="100" /></a>
						</div>
						<div style="float:left;position:relative;">
					     	<font size="+4"><%=nameofrashi + "</font><font size='+3'> (" + Util.getRashiNameinHindi(m) + ")</font>"%><br /><font size="+1" color="#990000">Based on the provided birth details.</font>
						</div>
					</div>
					<div style="clear:both;"></div>
					<!--include virtual="/horoscope/include/i_horoscope-footer.asp"-->
				</div>
            </div>
        </div>
    </div>
    <!--include virtual="/footer_no.inc"-->
</body>
</html>