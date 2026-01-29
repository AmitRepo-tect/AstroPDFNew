<%@page import="com.ojassoft.astrosagecloud.util.OjasCache"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>



<%--@include file="is_domain_allow.jsp"--%>

<%
		Logger LOGGER = Logger.getLogger(this.getClass().getName());
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		String returnString="";
		
		String input = Util.safestr(request.getParameter("q"));
		boolean getDataFromDB = true;
		boolean putInCache = false;
		OjasCache ojasCache = new OjasCache();
		if(ConstantValues.cityCache.contains(input.toLowerCase()))
		{
			putInCache = true;
			Object obj = ojasCache.retrieveFromCache(input.toUpperCase()+"_CACHE");
			if(obj != null)
			{
				returnString = obj.toString();
				getDataFromDB = false;
			}
		}
		if(getDataFromDB)
		{
			int length = input.length();
			String limit = request.getParameter("limit");
			String StrSqlCity="Select allc.asciiname as place, allc.latitude as latitude, allc.longitude as longitude"+
			        ",adc.asciiname as state,cc.name as country,tm.RAWoffset as timezone,tm.Timezoneid as timezonestring "+
			        "From ge_preferred_city allc Inner Join ge_admin1codes adc "+
			        "On allc.[country code]+'.'+[admin1 code] = adc.code Inner Join countrycode cc "+
			        "On cc.code = allc.[country code] Inner Join ge_timezone tm "+
			        "On tm.countrycode = allc.[country code] And tm.timezoneid=allc.timezone "+
			        "Where allc.asciiname like '"+ input +"%' order by allc.asciiname ";
			Statement stm = null;
			ResultSet rs = null;
			try
			{
				connObj = dBUtils.getAtlasConnection();
				//LOGGER.log(Level.INFO, connObj.toString());
				stm = connObj.createStatement();
				rs = stm.executeQuery(StrSqlCity);
				
				int i=0;
				double longitude=0.0,longMin1=0.0,longitude1=0.0,latitude=0,latitude1=0.0,latMin1=0.0;
				int longDeg=0,longMin=0,latDeg=0,latMin=0;
				String longEW="",latNS="",timeZoneId ="",state="",timeZone="",country="",place="";	
				while(rs.next())
				{
					country = rs.getString("country");
					place = rs.getString("place");
					longitude1 = Double.parseDouble(rs.getString("longitude"));
					longitude = Math.abs(longitude1);
					longDeg = (int)longitude;
					longMin1 = longitude-((int)longitude);
					longMin1 = longMin1*(60);
					longMin = (int)longMin1;
					longEW = "E";
					if(longitude1<0)
					{
						longEW = "W";
					}
					latitude1 = Double.parseDouble(rs.getString("latitude"));
					latitude = Math.abs(latitude1);
					latDeg = (int) latitude;
					latMin1 = latitude - (int) latitude;
					latMin1 = latMin1*60;
					latMin = (int) latMin1;
					latNS ="N";
					if(latitude1<0)
					{
						latNS = "S";
					}
					timeZone = rs.getString("timezone");
					timeZoneId = rs.getString("timezonestring");
					state = rs.getString("state");
					
					 returnString = returnString + place + "|" + state   + "|" + country +  "|"
					 + latDeg +  "|" + latMin + "|" + latNS + "|" + longDeg + "|" + longMin + "|" + longEW + "|" + timeZone + "|" + timeZoneId + "\n\r";
					 /*returnString = returnString + place + "|" + city_id + "|" + district + "|" + country + "|" + 
						    LatDeg + "|" + LatMin + "|" + LatNS + "|" + LongDeg + "|" + LongMin + "|" + LongEW + "|" + timeZone + chr(13) + chr(10)*/
					i =i+1;
				
				}
				if(putInCache)
				{
					ojasCache.putInCache(input.toUpperCase()+"_CACHE", returnString);
				}
			}
			catch(SQLException ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				dBUtils.closeConnection(connObj,stm,rs);
			}
		}
	out.println(returnString);
%>
