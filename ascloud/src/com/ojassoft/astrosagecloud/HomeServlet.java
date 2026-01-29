package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ojassoft.astrosagecloud.DAO.DatabaseUtils;
import com.ojassoft.astrosagecloud.util.Util;

public class HomeServlet extends AstrosageServlet 
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	{
		findPlacesForMM(request, response);
	}
	
	public void findPlacesForMM(HttpServletRequest request, HttpServletResponse response)
	{
		DatabaseUtils dBUtils = null;
		Connection connObj = null;
		Util utilObj = new Util();
		Statement stm = null;
		ResultSet rs = null;
		String input = utilObj.safestr(request.getParameter("q"));
		int length = input.length();
		String limit = request.getParameter("limit");
		String StrSqlCity="SELECT CM.*, Country_Master.ZoneStart, Country_Master.country, CM.city_ID "
				+ "FROM City_Master_New CM JOIN Country_Master ON CM.countryCode=Country_Master.countrycode "
				+ "WHERE LOWER(CM.Place) LIKE '"+ input +"%' ";
	try
	{
		dBUtils = new DatabaseUtils();
		connObj = dBUtils.getConnection();
		 stm = connObj.createStatement();
		 rs = stm.executeQuery(StrSqlCity);
		String returnString="";
		int i=0;
		double longitude=0.0,longMin1=0.0,longitude1=0.0,latitude=0,latitude1=0.0,latMin1=0.0;
		int longDeg=0,longMin=0,latDeg=0,latMin=0;
		String longEW="W",latNS="S",timeZoneId ="",city_id="",timeZone="",country="",place="",district="";	
		while(rs.next())
		{
			city_id = rs.getString("city_id");
			country = rs.getString("country");
			place = rs.getString("Place");
			district = rs.getString("district");
			longDeg = rs.getInt("LongDeg");
			longMin = rs.getInt("LongMin");
			int ew = rs.getInt("LongEW");
			if(ew == 1)
			{
				longEW = "E";
			}
			latDeg = rs.getInt("LatDeg");
			latMin = rs.getInt("LatMin");
			int ns = rs.getInt("LatNS");
			if(ns == 1)
			{
				latNS = "N";
			}
			timeZone = rs.getString("ZoneStart");
			timeZone = convertTimeZone(timeZone);
			timeZoneId = rs.getString("timeCorrectionCode");
			
			 returnString = returnString + place + "|" + city_id   + "|" + district   + "|" +country +  "|"
			 + latDeg +  "|" + latMin + "|" + latNS + "|" + longDeg + "|" + longMin + "|" + longEW + "|" + timeZone + "|" + "\n\r";
			 /*returnString = returnString + place + "|" + city_id + "|" + district + "|" + country + "|" + 
				    LatDeg + "|" + LatMin + "|" + LatNS + "|" + LongDeg + "|" + LongMin + "|" + LongEW + "|" + timeZone + chr(13) + chr(10)*/
			i =i+1;
		}
		response.getWriter().write(returnString);

		
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();
	}
	catch(IOException ex)
	{
		ex.printStackTrace();
	}
	finally
	{
		dBUtils.closeConnection(connObj, stm, rs);
	}
	}
	
	private String convertTimeZone (String startZone)
	{
	   int intPosition=startZone.indexOf("E");
	   DecimalFormat f = new DecimalFormat("##.0");
	   String charToBeReplaced = "W";
	   if(intPosition > 0)
	   {
		   charToBeReplaced = "E";
	   }
	   String tz = startZone.replace(charToBeReplaced, "");
	   if(tz.indexOf(":") > 0)
	   {
		   String[] atz = tz.split(":");
		   if(atz[1].length() == 1)
		   {
			   atz[1] = atz[1]+"0";
		   }
		   atz[1] = String.valueOf(f.format(Double.parseDouble(atz[1])/60));
		   startZone = atz[0] + atz[1];
	   }
	   else
	   {
		   startZone = tz;
	   }
	   startZone = String.valueOf(f.format(Double.parseDouble(startZone)/15));
	   if(charToBeReplaced.equals("W"))
	   {
		   if(Double.parseDouble(startZone) > 0)
		   {
			   startZone = "-"+startZone;
		   }
	   }
	   return startZone;
	}
}
