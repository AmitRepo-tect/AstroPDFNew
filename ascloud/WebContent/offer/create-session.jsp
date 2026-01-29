<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
//System.out.println(session.getAttribute("ChartId")+"neha8");
String referrer = Util.safestr(request.getParameter("referrer"));
String status = "";

if(session.getAttribute("HoroscopeObj") == null)
{
String name  = Util.safestr(request.getParameter("name"));
String sex   = Util.safestr(request.getParameter("sex"));
String doB   = Util.safeStringInt(request.getParameter("day"));
String moB   = Util.safeStringInt(request.getParameter("month"));
String yoB   = Util.safeStringInt(request.getParameter("year"));
String hoB   = Util.safeStringInt(request.getParameter("hrs"));
String minOB = Util.safeStringInt(request.getParameter("min"));
String soB   = Util.safeStringInt(request.getParameter("sec"));
String place = Util.safestr(request.getParameter("place"));
int latDegree = Util.safeInt(request.getParameter("latdeg"));
int latMinute = Util.safeInt(request.getParameter("latmin"));
String latNS  = Util.safestr(request.getParameter("latns"));
int longDegree = Util.safeInt(request.getParameter("longdeg"));
int longMinute = Util.safeInt(request.getParameter("longmin"));
String longEW  = Util.safestr(request.getParameter("longew"));
float timeZone = Util.safeFloat(request.getParameter("timezone"));
String dST     = Util.safestr(request.getParameter("dst"));
int ayanamsa = Util.safeInt(request.getParameter("ayanamsa"));
String charting = Util.safestr(request.getParameter("charting"));
int kphn = Util.safeInt(request.getParameter("kphn"));

status = Util.safestr(request.getParameter("status"));
name = name.replaceAll("'","");
session.setAttribute("isDst","0");

//Add new condition for jathagam report
if (latNS.equals("1") || latNS.toLowerCase().equals("n")) 
    latNS = "N";
else
    latNS = "S";
		

if (longEW.equals("1") || longEW.toLowerCase().equals("e")) 
	longEW = "E";
else
	longEW = "W";

		
if (dST.equals(""))
	dST = "0";
else { 
	if (Integer.parseInt(dST) > 0) {
		timeZone = timeZone + Integer.parseInt(dST);
		dST = "0";
		session.setAttribute("isDst","1");
	}
}
if (request.getParameter("done") != ""){
	session.setAttribute("IsSaved",1);
}



session.setAttribute("chartType",Util.safeInt(charting));		

String dateoB = doB + "/" + moB + "/" + yoB;
String timeoB = hoB + ":" + minOB + ":" + soB;
if(place.equals(""))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify place of birth.","UTF-8"));

if(String.valueOf(longDegree).equals(""))
response.sendRedirect("/m/postpage.asp?type=kp&error=" +URLEncoder.encode("ERROR: Please specify a value for the Longitude Degree.","UTF-8"));

		
if(!(IsNumeric(String.valueOf(longDegree))))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Degree.","UTF-8"));

		
if(longDegree < 0 || longDegree >= 180) 
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Degree.","UTF-8"));


if(String.valueOf(longMinute).equals(""))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Longitude Minute.","UTF-8"));

		
if(!(IsNumeric(String.valueOf(longMinute))))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Longitude Minute.","UTF-8"));

		
if(longMinute < 0 || longMinute >= 60)
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Minute.","UTF-8"));



if(String.valueOf(latDegree).equals(""))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Latitude Degree.","UTF-8"));



if(!(IsNumeric(String.valueOf(latDegree))))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Degree.","UTF-8"));
 


if(latDegree < 0 || latDegree >= 90) 
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Degree.","UTF-8"));


if(String.valueOf(latMinute).equals(""))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Latitude Minute.","UTF-8"));



if(!(IsNumeric(String.valueOf(latMinute))))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Minute.","UTF-8"));

		
if(latMinute < 0 || latMinute >= 60)
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Minute.","UTF-8"));


if(String.valueOf(timeZone).equals(""))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Time Zone.","UTF-8"));


if(!(IsNumeric(String.valueOf(timeZone))))
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Time Zone.","UTF-8"));
 

if (timeZone < -12.0 || timeZone >= 17.0) 
response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Time Zone.","UTF-8"));


DesktopHoro ObjHoro = new  DesktopHoro();
Constants ObjConst = new Constants();

ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));

ObjHoro.setName(name);
ObjHoro.setPlace(place);
ObjHoro.setCompanyAddLine1 ("Delhi");
ObjHoro.setCompanyName ("OJAS Softech");
ObjHoro.setTimeZone(String.valueOf(timeZone));
ObjHoro.setMaleFemale(sex);
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

ObjHoro.setLanguageCode(Util.safestr(session.getAttribute("languageCode")));
ObjHoro.setAyan(ayanamsa);
ObjHoro.setKPHorarySeed(kphn);
ObjHoro.initialize();

session.setAttribute("HoroscopeObj",ObjHoro);
}
%>
<%!
boolean IsNumeric(String str){
return true;
}
%>