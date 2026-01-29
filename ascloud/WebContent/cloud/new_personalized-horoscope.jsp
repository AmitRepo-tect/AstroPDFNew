<%@page import="java.io.OutputStream"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");

%>

<div class="hdg-lg card">
	<h1><%=rbConstants.getString("PERSONALIZED_HOROSCOPE") %></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">

<%
    //Dim ObjHoro
    DesktopHoro objHoro= (DesktopHoro) session.getAttribute("HoroscopeObj");
    
    String name=objHoro.getName();
    String place=objHoro.getPlace();
    String timez=objHoro.getTimeZone();
    String gender=objHoro.getMaleFemale();
    String SOB=objHoro.getSecondOfBirth();
    String minOB=objHoro.getMinuteOfBirth();
    String HOB=objHoro.getHourOfBirth();
    int DOB=objHoro.getDayOfBirth();
    int MOB=objHoro.getMonthOfBirth();
    int YOB=objHoro.getYearOfBirth();
    String latD=objHoro.getDegreeOfLattitude();
    String longD=objHoro.getDegreeOfLongitude();
    String longM=objHoro.getMinuteOfLongitude();
    String latM=objHoro.getMinuteOfLattitude();
    String longEW=objHoro.getEastWest();
    String latNS=objHoro.getNorthSouth();
    String DST=objHoro.getDST();
	
    name = name.replace(" ", "%20");
    //String url = "http://daily-971.appspot.com/daily-today-tomorrow.jsp?Name="+name+"&place="+place+"&Timez="+timez+"&Gender="+gender+"&DOB="+DOB+"&MOB="+MOB+"&YOB="+YOB+"&HOB="+HOB+"&MinOB="+minOB+"&SOB="+SOB+"&LongD="+longD+"&LongM="+longM+"&LatD="+latD+"&LatM="+latM+"&LongEW="+longEW+"&LatNS="+latNS+"&DST="+DST+"&languageCode="+session.getAttribute("languageCode");
    String url = "http://daily-971.appspot.com/daily-today-tomorrow.jsp";
    String time = getTime(HOB, minOB);
 	String urlParams = "daytoadd=0&name="+name+"&placeauto="+place+"&timeZone="+timez+"&sex="+gender+"&date="+DOB+"/"+MOB+"/"+YOB+"&time="+time+"&LongDeg="+longD+"&LongMin="+longM+"&LatDeg="+latD+"&LatMin="+latM+"&LongEW="+longEW+"&LatNS="+latNS+"&dst="+DST+"&LanguageCode="+session.getAttribute("languageCode");
    URL obj = new URL(url);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();
    String responseString = "";
   con.setRequestMethod("POST");
   con.setDoOutput(true);
   OutputStream os = con.getOutputStream();
   os.write(urlParams.getBytes());
   os.flush();
	os.close();
   int responseCode = con.getResponseCode();
   if(responseCode==200){
   BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF8"));
   String inputLine;
   StringBuffer responseTxt = new StringBuffer();
   
   while ((inputLine = in.readLine()) != null) {
   responseTxt.append(inputLine);
   }
   in.close();
   responseString = responseTxt.toString();
   }
   //Get and Print date
   int startIndex = responseString.indexOf("Date");
   int endIndex = responseString.indexOf("Description");
   String substr = responseString.substring(startIndex+8, endIndex-7);
   out.println("<b>"+substr+"</b>");
   //Get and print horoscope
   startIndex = responseString.indexOf("Description");
   endIndex = responseString.indexOf("Details");
   substr = responseString.substring(startIndex+15, endIndex-7);
   out.println("<br><br>"+substr);
   //Get and print lucky number
   startIndex = responseString.indexOf("Luckyno");
   endIndex = responseString.indexOf("},");
   substr = responseString.substring(startIndex+12, endIndex-4);
   out.println("<br><br><b>"+substr+"</b>");
   
    
%>
<%!
private String getTime(String hour, String minute)
{
	String returnTime = "";
	int hr = Integer.parseInt(hour);
	int min = Integer.parseInt(minute);
	if(hr < 12)
	{
		returnTime = hour+":"+minute+" AM";
	}
	else if (hr > 12)
	{
		returnTime = (hr-12)+":"+minute+" PM";
	}
	else if(hr == 12)
	{
		returnTime = hour+":"+minute+" PM";
	}
	return returnTime;
}
%>
</div>
</div>
</div>