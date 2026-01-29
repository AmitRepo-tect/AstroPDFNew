<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.AtlasDAO"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Free Kundli Software Online, Janam Kundli, Prashna Kundli, KP Horary Astrology
        Software</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="pragma" content="no-cache" />
    <link rel='stylesheet' type='text/css' href='css/stylesheet.css'>
</head>
<body>
<b><div class='error'><%=Util.safestr(request.getParameter("error"))%> </div></b>
    <% 
    
    //dim name, sex, day, month, year, hrs, min, sec, place, dst, Ayanamsa, Charting, kphn

    String name = Util.safestr(request.getParameter("name"));
    String sex = Util.safestr(request.getParameter("sex"));
    String day = Util.safestr(request.getParameter("day"));
    String month = Util.safestr(request.getParameter("month"));
    String year = Util.safestr(request.getParameter("year"));
    String hrs = Util.safestr(request.getParameter("hrs"));
    String min = Util.safestr(request.getParameter("min"));
    String sec = Util.safestr(request.getParameter("sec"));
    String place = Util.safestr(request.getParameter("place"));

    String dst = Util.safestr(request.getParameter("dst"));
    String Ayanamsa = Util.safestr(request.getParameter("ayanamsa"));
    String Charting = Util.safestr(request.getParameter("charting"));
    String kphn = Util.safestr(request.getParameter("kphn"));    
    String type = Util.safestr(request.getParameter("type"));
    if(!type.equals("kp"))
    {
    	if(name.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please enter name.", "UTF-8"));
    	}
    	else if(day.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the day.", "UTF-8"));
    	}
    	else if(!isNumeric(day) || Integer.valueOf(day) < 1 || (Integer.valueOf(day) > 31))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the day.", "UTF-8"));
    	}
    	else if(month.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the month.", "UTF-8"));
    	}
    	else if(!isNumeric(month) || Integer.valueOf(month) < 1 || (Integer.valueOf(month) > 12))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the month.", "UTF-8"));
    	}
    	else if(year.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the year.", "UTF-8"));
    	}
    	else if(!isNumeric(year) || Integer.valueOf(year) < 1 || (Integer.valueOf(year) > 9999))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the year.", "UTF-8"));
    	}
    	else if(hrs.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the hrs.", "UTF-8"));
    	}
    	else if(!isNumeric(hrs) || Integer.valueOf(hrs) < 0 || (Integer.valueOf(hrs) >= 24))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the hrs.", "UTF-8"));
    	}
    	else if(min.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the min.", "UTF-8"));
    	}
    	else if(!isNumeric(min) || Integer.valueOf(min) < 0 || (Integer.valueOf(min) > 60))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the min.", "UTF-8"));
    	}
    	else if(sec.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify a value for the sec.", "UTF-8"));
    	}
    	else if(!isNumeric(sec) || Integer.valueOf(month) < 0 || (Integer.valueOf(sec) > 60))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the sec.", "UTF-8"));
    	}
    	else if(place.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify Place of birth.", "UTF-8"));
    	}
    	else if(kphn.equals(""))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Please specify the value of kphn.", "UTF-8"));
    	}
    	else if(!isNumeric(kphn) || Integer.valueOf(kphn) < 0 || (Integer.valueOf(kphn) > 249))
    	{
    		response.sendRedirect("http://www.astrosage.com/m/default.asp?error="+URLEncoder.encode("ERROR: Incorrect value for the kphn.", "UTF-8"));
    	}
    }
    %>
    
    <%
    //Dim LatDeg, LatMin, LongDeg, LongMin, LatNS, LongEW, cityID

   //'Initialize The Variables
    //mangalDoshCompatibility = true
    //ashtakootDoshCompatibility = true
    %>
    <!--#include file="Dbconnection.inc"-->
    <!--<form method="post" action="http://www.astrosage.com/freekphorary/KPhoroscope1.asp">-->
    <form method="post" action="http://cloud.astrosage.com/cloud/createsession.asp">
    <fieldset>
        <%
        String cityId = "0";
    //'************************** To get city id of new selected city
    if(!type.equals("kp"))
    {
    	UserDAO userDAO = new UserDAO();
    	cityId = userDAO.getCityId(place.toLowerCase());
        
    }
    else
        cityId = Util.safestr(session.getAttribute("CityId"));       
    
    //'**************************
	HashMap<String, String> hm = new HashMap<String, String>();
	int cityIdInt = 0;
    if (cityId.equals("") || cityId.equals("0")) 
    { //City wasn't found in the database
        //'Response.Redirect "default.asp?error=" & Server.URLEncode("ERROR: Unable to find the city.")
        %>
        <legend>Enter Your Birth Details</legend>
        <label for="place">
            Place
        </label>
        <input type="text" name="place" value="<%=place %>" size="28" class="inputtext" />
        <br />
        <label for="LongDeg">
            Longitude</label>
        <input name="longdeg" size="3" maxlength="3" />
        <input name="longmin" size="2" maxlength="2" />
        <select size="1" name="longew">
            <option value="E" selected="selected">E</option>
            <option value="W">W</option>
        </select>
        <br />
        <label for="LatDeg">
            Latitude</label>
        <input name="latdeg" size="3" maxlength="3" />
        <input name="latmin" size="2" maxlength="2" />
        <select size="1" name="latns">
            <option value="N" selected="selected">N</option>
            <option value="S">S</option>
        </select>
        <br />
        <label for="timeZone">
            Time Zone</label>
        <input type="text" name="timezone" style="width: 40px" maxlength="6" />
        <br />
        Note: Time Zone range is from -12.00 to 13.00, please put only digits, single dot(.) is allowed, e.g. if Time Zone is 05:30 then put 5.5
    </fieldset>
    
    <input type="hidden" name="name" value="<%=name %>" />
    <input type="hidden" name="sex" value="<%=sex %>" />
    <input type="hidden" name="day" value="<%=day %>" />
    <input type="hidden" name="month" value="<%=month %>" />
    <input type="hidden" name='year' value="<%=year %>" />
    <input type="hidden" name="hrs" value="<%=hrs %>" />
    <input type="hidden" name="min" value="<%=min %>" />
    <input type="hidden" name="sec" value="<%=sec %>" />
    <input type="hidden" name="dst" value="<%=dst %>" />
    <input type="hidden" name="ayanamsa" value="<%=Ayanamsa%>" />
    <input type="hidden" name="charting" value="<%=Charting %>" />
    <input type="hidden" name="kphn" value="<%=kphn %>" />
    
    <%
    }
    else
    	{ 
    	cityIdInt = Integer.valueOf(cityId);
    	CloudDAO cloudDAO = new CloudDAO();
    	hm = cloudDAO.getCityDetailsByCityId(cityId);
    	        
    %>
    <legend>Confirm Your Birth Details</legend>
    
    <label for="place">
        Place
    </label>
    <input type="text" name="place" value="<%=place %>" size="28" class="inputtext" />
    <br />
    <label for="LongDeg">
        Longitude</label>
    <input name="longdeg" size="3" maxlength="3" value="<%=hm.get("LongDeg") %>" />
    <input name="longmin" size="2" maxlength="2" value="<%=hm.get("LongMin") %>" />
    <select size="1" name="longew">
        <%if(hm.get("LongEW").equals("E")) { %>
        <option value="E" selected="selected">E</option>
        <option value="W">W</option>
        <% } else { %>
        <option value="E">E</option>
        <option value="W" selected="selected">W</option>
        <% } %>
    </select>
    <br />
    <label for="LatDeg">
        Latitude</label>
    <input name="latdeg" size="3" maxlength="3" value="<%=hm.get("LatDeg") %>" />
    <input name="latmin" size="2" maxlength="2" value="<%=hm.get("LatMin") %>" />
    <select size="1" name="latns">
        <%if(hm.get("LatNS").equals("N")) { %>
        <option value="N" selected="selected">N</option>
        <option value="S">S</option>
        <% } else { %>
        <option value="N">N</option>
        <option value="S" selected="selected">S</option>
        <% } %>
    </select>
    <br />
    <label for="timeZone">
        Time Zone</label>
    <input type="text" name="timezone" value="<%=hm.get("TimeZone") %>" style="width: 40px" maxlength="6" />
    <br />
    Note: Time Zone range is from -12.00 to 13.00, please put only digits, single dot(.) is allowed, e.g. if Time Zone is 05:30 then put 5.5
    </fieldset>
    
        
    <input type="hidden" name="name" value="<%=name %>" />
    <input type="hidden" name="sex" value="<%=sex %>" />
    <input type="hidden" name="day" value="<%=day %>" />
    <input type="hidden" name="month" value="<%=month %>" />
    <input type="hidden" name='year' value="<%=year %>" />
    <input type="hidden" name="hrs" value="<%=hrs %>" />
    <input type="hidden" name="min" value="<%=min %>" />
    <input type="hidden" name="sec" value="<%=sec %>" />
    <input type="hidden" name="dst" value="<%=dst %>" />
    <input type="hidden" name="ayanamsa" value="<%=Ayanamsa %>" />
    <input type="hidden" name="charting" value="<%=Charting %>" />
    <input type="hidden" name="kphn" value="<%=kphn %>" />
    
    <%
        }
    %>
    </div>
    <input type="hidden" name="CityId" value="<%=cityId %>" />
    <%if( Ayanamsa.equals("1")) { %>
        <input type="hidden" name="referrer" value="/m/j_kppage.asp" />
    <% } else { %>
        <input type="hidden" name="referrer" value="/m/j_lagnapage.asp" />
    <% } %>
    <div align="left">
        <% if( cityIdInt == 0) { %>
            <input type="submit" value="SUBMIT" />
        <%} else { %>
            <input type="submit" value="CONFIRM" />
        <% } %>
    </div>
    </form>
    <br />
    <%@include file='/m/include/i_footer.jsp'%>
</body>
</html>
<%!
public static boolean isNumeric(String val)
{
	boolean numeric = true;
	try
	{
		int x = Integer.valueOf(val);
	}
	catch(Exception e)
	{
		numeric = false;
	}
	return numeric;
}
%>