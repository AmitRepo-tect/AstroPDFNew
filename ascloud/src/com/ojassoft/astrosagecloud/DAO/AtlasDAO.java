package com.ojassoft.astrosagecloud.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ojassoft.astrosagecloud.util.Util;

public class AtlasDAO 
{

	/**
	 * This method returns the city details corresponding to the place name passed.
	 * @param placeName
	 * @return - JsonString having country, place, longitude, latitude and timezone.
	 */
	public String getCityDetails(String placeName)
	{
		String returnString="";
		
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		Util utilObj = new Util();
		Statement stm = null;
		ResultSet rs = null;
		int length = placeName.length();
		String StrSqlCity="Select allc.asciiname as place, allc.latitude as latitude, allc.longitude as longitude"+
		        ",adc.asciiname as [state],cc.name as country,tm.RAWoffset as timezone,tm.Timezoneid as timezonestring "+
		        "From Ge_Preferred_City allc Inner Join Ge_admin1Codes adc "+
		        "On allc.[country code]+'.'+[admin1 code] = adc.code Inner Join countrycode cc "+
		        "On cc.code = allc.[country code] Inner Join Ge_timezone tm "+
		        "On tm.countrycode = allc.[country code] And tm.timezoneid=allc.timezone "+
		        "Where allc.asciiname like  '"+ placeName +"%'";
	try
	{
		connObj = dBUtils.getAtlasConnection();
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
			 + latDeg +  "|" + latMin + "|" + latNS + "|" + longDeg + "|" + longMin + "|" + longEW + "|" + timeZone + "|" + "\n\r"+"#";
			 /*returnString = returnString + place + "|" + city_id + "|" + district + "|" + country + "|" + 
				    LatDeg + "|" + LatMin + "|" + LatNS + "|" + LongDeg + "|" + LongMin + "|" + LongEW + "|" + timeZone + chr(13) + chr(10)*/
			i =i+1;
		}
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
	finally
	{
		dBUtils.closeConnection(connObj, stm, rs);
	}
	return returnString;
	}
}
