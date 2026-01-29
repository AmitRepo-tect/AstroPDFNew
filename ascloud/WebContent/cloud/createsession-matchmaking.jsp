<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
    
	String sex1 = Util.safestr(request.getParameter("sex1"));
	String day1 = Util.safeStringInt(request.getParameter("day1"));
	String month1 = Util.safeStringInt(request.getParameter("month1"));
	String year1 = Util.safeStringInt(request.getParameter("year1"));
	String hrs1 = Util.safeStringInt(request.getParameter("hrs1"));
	String Min1 = Util.safeStringInt(request.getParameter("min1"));
	String sec1 = Util.safeStringInt(request.getParameter("sec1"));
	String latns1 = Util.safestr(request.getParameter("latns1"));
	String longew1 = Util.safestr(request.getParameter("longew1"));
	String dst1 = Util.safeStringInt(request.getParameter("dst1"));
	String Ayanamsa = Util.safeStringInt(request.getParameter("ayanamsa"));
	String Charting = Util.safestr(request.getParameter("charting"));
	String kphn = Util.safeStringInt(request.getParameter("kphn"));
	String referrer = Util.safestr(request.getParameter("referrer"));
	
	String sex2 = Util.safestr(request.getParameter("sex2"));
	String day2 = Util.safeStringInt(request.getParameter("day2"));
	String month2 = Util.safeStringInt(request.getParameter("month2"));
	String year2 = Util.safeStringInt(request.getParameter("year2"));
	String hrs2 = Util.safeStringInt(request.getParameter("hrs2"));
	String Min2 = Util.safeStringInt(request.getParameter("min2"));
	String sec2 = Util.safeStringInt(request.getParameter("sec2"));
	String place2 = Util.safestr(request.getParameter("place2"));
	String latdeg2 = Util.safeStringInt(request.getParameter("latdeg2"));
	String latmin2 = Util.safeStringInt(request.getParameter("latmin2"));
	String latns2 = Util.safestr(request.getParameter("latns2"));
	String longdeg2 = Util.safeStringInt(request.getParameter("longdeg2"));
    String longmin2 = Util.safeStringInt(request.getParameter("longmin2"));
	String longew2 = Util.safestr(request.getParameter("longew2"));
	String timezone2 = Util.safestr(request.getParameter("timezone2"));
	String dst2 = Util.safeStringInt(request.getParameter("dst2"));
    
	boolean errorFound = false;
    if(kphn.equals("")) 
        kphn = "0";
    
    if(dst1.equals(""))
        dst1 = "0";
    
    
    if(Charting.equals(""))
        Charting = "0";
    
    if(Ayanamsa.equals(""))
    	Ayanamsa = "0";
    
    session.setAttribute("chartType", Charting);
    session.setAttribute("ChartId", "");
    
    String DateoB = day1 + "/" + month1 + "/" + year1;
    String TimeoB = hrs1 + ":" + Min1 + ":" + sec1;
    
    String name1 = "";
    String name2 = "";
    String place1 = "";
    int longdeg1 = 0;
    int longmin1 = 0;
    int latdeg1 = 0;
    int latmin1 = 0;
    float timeZone1 = 0.0f;
    int LanguageCode = 0;
    String temp = Util.safestr(request.getParameter("name1"));
    if(temp.contains("@"))
    {
    	errorFound = true;
        //response.sendRedirect("/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify valid name of boy.","UTF-8"));
    	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify valid name of boy.","UTF-8"));
    	//return;
    }
    else
    {
       	name1 = temp;
    
	     temp = Util.safestr(request.getParameter("name2"));
	     if(temp.contains("@"))
	     {
	    	errorFound = true;
	        response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify valid name of girl.","UTF-8"));
	     }
	     else
	     {
	    	 name2 = temp;
     
	     temp = Util.safestr(request.getParameter("place1"));
	     if(temp.equals(""))
	     {
	    	errorFound = true;
	        response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify place of birth.","UTF-8"));
	     }
	     else
	     {
	    	 place1 = temp;
	     
			     temp = Util.safestr(request.getParameter("longdeg1"));
			     if(temp.equals(""))
			     {
			    	errorFound = true;
			        response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Longitude Degree.","UTF-8"));
			     }
			     else
			     {
			    	 if(!IsNumeric(temp))
			    	 {
			    		 errorFound = true;
			    		 response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Degree.","UTF-8"));
			    	 }
			    	 else
			    	 {
			    		 longdeg1 = Util.safeInt(temp);	
			    	 }
			     }
			     if(!errorFound)
			     {
			     if((longdeg1 < 0 || longdeg1 >= 180))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Degree.","UTF-8"));
			     }
			     	else
			     	{
				     temp = Util.safestr(request.getParameter("longmin1"));
				     if(temp.equals(""))
				     {
				    	errorFound = true;
				     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Longitude Minute.","UTF-8"));
				     }
				     else
				     {
				     	
				     	if(!IsNumeric(temp))
				     	{
				     		errorFound = true;
				     		response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Minute.","UTF-8"));
				     	}
				     	else
				     	{
				     		longmin1 = Util.safeInt(temp);
				     	}
				     }
			     
			     if(!errorFound && (longmin1 < 0 || longmin1 >= 60))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Minute.","UTF-8"));
			     }
			     else
			     {
			     temp = Util.safestr(request.getParameter("latdeg1"));
			     if(temp.equals(""))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Latitude Degree.","UTF-8"));
			     }
			     else
			     {
			     	if(!IsNumeric(temp))
			     	{
			     		errorFound = true;
			     		response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Degree.","UTF-8"));
			     	}
			     	else
			     	{
			     		latdeg1 = Util.safeInt(temp);
			     	}
			     }
			     
			     if(!errorFound && (latdeg1 < 0 || latdeg1 >= 90))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Degree.","UTF-8"));
			     }
			     else
			     {
			     temp = Util.safestr(request.getParameter("latmin1"));
			     if(temp.equals(""))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Latitude Minute.","UTF-8"));
			     }
			     else
			     {
			     	if(!IsNumeric(temp))
			     	{
			     		errorFound = true;
			     		response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Minute.","UTF-8"));
			     	}
			     	else
			     	{
			     		latmin1 = Util.safeInt(temp);
			     	}
			     }
			     
			     if(!errorFound && (latmin1 < 0 || latmin1 >= 60))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Minute.","UTF-8"));
			     }
			     else
			     {
			     temp = Util.safestr(request.getParameter("timezone1"));
			     if(temp.equals(""))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Time Zone.","UTF-8"));
			     }
			     else
			     {
			     	if(!IsFloatNumeric(temp))
			     	{
			     		errorFound = true;
			     		response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Time Zone.","UTF-8"));
			     	}
			     	else
			     	{
			     		timeZone1 = Util.safeFloat(temp);
			     	}
			     }
			     
			     if (!errorFound && (timeZone1 < -12.0 || timeZone1 >= 17.0))
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Time Zone.","UTF-8"));
			     }
			     else
			     {			
			     temp = Util.safestr(request.getParameter("languagecode"));
			     if(temp==null || temp.equals(""))
			        LanguageCode = 0;
			     else
			     {
			     	if(!IsNumeric(temp))
			     	{
			     		errorFound = true;
			     		response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Language Code.","UTF-8"));
			     	}
			     	else
			     	{
			     		LanguageCode = Util.safeInt(temp);
			     	}
			     }
			     if(LanguageCode < 0 || LanguageCode > 10)
			     {
			    	errorFound = true;
			     	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Language Code.","UTF-8"));
			     }
			     else 
			     {
			    	session.setAttribute("languageCode", LanguageCode);
			     }
			     }
			     }
			     }
			     }
			     	}
			     }
	     }
	     }
    }
        
    if(!errorFound)
    {
		DesktopHoro ObjHoro = new DesktopHoro();
		Constants ObjConst = new Constants();
	
		ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		ObjHoro.setName(name1);
	    ObjHoro.setPlace(place1);
		ObjHoro.setCompanyAddLine1 ("Delhi");
		ObjHoro.setCompanyName ("OJAS Softech");
		ObjHoro.setTimeZone(String.valueOf(timeZone1));
		ObjHoro.setMaleFemale(sex1);
		ObjHoro.setSecondOfBirth(sec1);
		ObjHoro.setMinuteOfBirth(Min1);
		ObjHoro.setHourOfBirth(hrs1);
		ObjHoro.setDayOfBirth(day1);
		ObjHoro.setMonthOfBirth(month1);
		ObjHoro.setYearOfBirth(year1);
		ObjHoro.setDegreeOfLattitude(String.valueOf(latdeg1));
		ObjHoro.setDegreeOfLongitude(String.valueOf(longdeg1));
		ObjHoro.setSecondOfLattitude("00");
		ObjHoro.setSecondOfLongitude("00");
		ObjHoro.setMinuteOfLongitude(String.valueOf(longmin1));
		ObjHoro.setMinuteOfLattitude(String.valueOf(latmin1));
		if(longew1.equals("1"))
		{
			longew1 = "E";
		}
		else if(longew1.equals("0"))
		{
			longew1 = "W";
		}
		if(latns1.equals("1"))
		{
			latns1 = "N";
		}
		else if(latns1.equals("0"))
		{
			latns1 = "S";
		}
		//--------
		if(longew2.equals("1"))
		{
			longew2 = "E";
		}
		else if(longew2.equals("0"))
		{
			longew2 = "W";
		}
		if(latns2.equals("1"))
		{
			latns2 = "N";
		}
		else if(latns2.equals("0"))
		{
			latns2 = "S";
		}
		ObjHoro.setEastWest(longew1);
		ObjHoro.setNorthSouth(latns1);		
		ObjHoro.setDST(dst1);
		if(LanguageCode == 1)
			ObjHoro.setLanguageCode("1");
		    
		ObjHoro.setAyan(Util.safeInt(Ayanamsa));
		ObjHoro.setKPHorarySeed(Util.safeInt(kphn));
		ObjHoro.initialize();
	
		session.setAttribute("HoroscopeObj", ObjHoro);
		
	   /* name2 = Trim(safestr(Request("name2")))
	    sex2 = Trim(safestr(Request("sex2")))
	    day2 = Trim(safestr(Request("Day2")))
	    month2 = Trim(safestr(Request("month2")))
	    year2 = Trim(safestr(Request("Year2")))
	    hrs2 = Trim(safestr(Request("hrs2")))
	    Min2 = Trim(safestr(Request("min2")))
	    sec2 = Trim(safestr(Request("sec2")))
	    place2 = Trim(safestr(Request("place2")))
	    latdeg2 = Trim(safestr(Request("LatDeg2")))
	    latmin2 = Trim(safestr(Request("LatMin2")))
	    latns2 = Trim(safestr(Request("LatNS2")))
	    longdeg2 = Trim(safestr(Request("LongDeg2")))
	    longmin2 = Trim(safestr(Request("LongMin2")))
	    longew2 = Trim(safestr(Request("LongEW2")))
	    timezone2 = Trim(safestr(Request("timeZone2")))
	    dst2 = Trim(safestr(Request("dst2")))  */
    
    
%>


<form id='frmpost' action="/cloud/matchmakingoutput.asp" method="post">
<input type="hidden" value='<%=name2%>'  name="name2"/>
<input type="hidden" value='<%=sex2%>'  name="sex2"/>
<input type="hidden" value='<%=day2%>'  name="day2"/>
<input type="hidden" value='<%=month2%>'  name="month2"/>
<input type="hidden" value='<%=year2%>'  name="year2"/>
<input type="hidden" value='<%=hrs2%>'  name="hrs2"/>
<input type="hidden" value='<%=Min2%>'  name="min2"/>
<input type="hidden" value='<%=sec2%>'  name="sec2"/>
<input type="hidden" value='<%=place2%>'  name="place2"/>
<input type="hidden" value='<%=latdeg2%>'  name="latdeg2"/>
<input type="hidden" value='<%=latmin2%>'  name="latmin2"/>
<input type="hidden" value='<%=latns2%>'  name="latns2"/>
<input type="hidden" value='<%=longdeg2%>'  name="longdeg2"/>
<input type="hidden" value='<%=longmin2%>'  name="longmin2"/>
<input type="hidden" value='<%=longew2%>'  name="longew2"/>
<input type="hidden" value='<%=timezone2%>'  name="timezone2"/>
<input type="hidden" value='<%=dst2%>'  name="dst2"/>
<input type="hidden" value='<%=name1%>'  name="name1"/>
<input type="hidden" value='<%=sex1%>'  name="sex1"/>
<input type="hidden" value='<%=day1%>'  name="day1"/>
<input type="hidden" value='<%=month1%>'  name="month1"/>
<input type="hidden" value='<%=year1%>'  name="year1"/>
<input type="hidden" value='<%=hrs1%>'  name="hrs1"/>
<input type="hidden" value='<%=Min1%>'  name="min1"/>
<input type="hidden" value='<%=sec1%>'  name="sec1"/>
<input type="hidden" value='<%=place1%>'  name="place1"/>
<input type="hidden" value='<%=latdeg1%>'  name="latdeg1"/>
<input type="hidden" value='<%=latmin1%>'  name="latmin1"/>
<input type="hidden" value='<%=latns1%>'  name="latns1"/>
<input type="hidden" value='<%=longdeg1%>'  name="longdeg1"/>
<input type="hidden" value='<%=longmin1%>'  name="longmin1"/>
<input type="hidden" value='<%=longew1%>'  name="longew1"/>
<input type="hidden" value='<%=timeZone1%>'  name="timezone1"/>
<input type="hidden" value='<%=dst1%>'  name="dst1"/>

</form>
<% } %>
<script type="text/javascript">
    window.onload = function() {
        document.getElementById('frmpost').submit();
    }
</script>
<%!
boolean IsNumeric(String str)
{
	boolean isNumeric = false;
	try
	{
	 int x = Integer.parseInt(str);
	 isNumeric = true;
	}
	catch(NumberFormatException ne)
	{
		isNumeric = false;
	}
return isNumeric;
}

boolean IsFloatNumeric(String str)
{
	boolean isNumeric = false;
	try
	{
	 float x = Float.parseFloat(str);
	 isNumeric = true;
	}
	catch(NumberFormatException ne)
	{
		isNumeric = false;
	}
return isNumeric;
}
%>
