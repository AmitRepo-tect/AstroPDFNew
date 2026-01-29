package com.ojassoft.astrosagecloud.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.DO.UserBean;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.astrosagecloud.util.ConstantValues;
import com.ojassoft.astrosagecloud.util.SharedFunction;

public class UserDAO 
{
	/**
	 * This method makes a database connection and matches the chart names with the passed in string
	 * (initial letters). It returns the a json string of all matching chart names & userName.
	 * @param chartName
	 * @return JsonString
	 */
	public String findChartName(String chartName)
	{
		String returnString = "";
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql = "Select chartname, pname,chartId from tbl_chart where chartname like '"+chartName+"%'";
		Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	      stmt = connObj.createStatement();
	      rs = stmt.executeQuery(strsql);
	      while(rs.next())
	      {
	    	returnString += rs.getString("chartname")+"|"+rs.getString("pname")+"|"+rs.getString("chartId")+"\r\n";	        
	      }
	    }
	    catch(SQLException sqle)
	    {
	    	sqle.printStackTrace();
	    }
	    finally
	    {
	    	dbUtils.closeConnection(connObj, stmt, rs);
	    }
		return returnString;
	}
	
	/**
	 * Corresponding to the passed in chartName (initial letters) corresponding to the userId.
	 * @param userId
	 * @param chartName
	 * @return JsonString
	 */
	public String openChartAutoComplete(String userId, String chartName)
	{
		String returnString = "";
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql =  "Select chartId,PName,case when Sex='M' or Sex='Male'  then 'Male' else 'Female' end as sex,"+
        "CONVERT(varchar, [Day] +'-'+  "+
        "[month] +'-'+[year],105) as [Date of Birth],"+
        "CONVERT(varchar, [Hr] +':'+ [Min] +':'+[Sec],105) as [Time of Birth],Place,"+
        "[Public/private] = (case when ChartName <> '' then 'Shared' Else 'Private' end),"+
        "LongDeg,LongMin,LongEW,LatDeg,LatMin,LatNS,TimeZone,Ayanamsa,kphn from tbl_chart"+
        " where userid = '"+ userId +"' and Pname like '%"+chartName+"%' order by Pname";
		Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	      stmt = connObj.createStatement();
	      rs = stmt.executeQuery(strsql);
	      while(rs.next())
	      {
	    	returnString += rs.getString(2)+"|"+rs.getString(1)+"|"+rs.getString(3)+"|"+rs.getString(4)+"|"+rs.getString(5)
	    			+"|"+rs.getString(6)+"|"+rs.getString(7)+"\r\n";	        
	      }
	    }
	    catch(SQLException sqle)
	    {
	    	sqle.printStackTrace();
	    }
	    finally
	    {
	    	dbUtils.closeConnection(connObj, stmt, rs);
	    }
		return returnString;
	}
	
	/**
	 * Corresponding to the passed in initial letters of chart name, matching public chart names are returned.
	 * @param chartName
	 * @return JsonString
	 */
	public String getPublicChartName(String chartName)
	{
		String json = "";
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql = "Select * from tbl_chart where chartName = '"+chartName+"'";
		Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	      stmt = connObj.createStatement();
	      rs = stmt.executeQuery(strsql);
	      if(rs.next())
	      {
	    	  json = "{";
	    		        json = json + "'name':'" + rs.getString("Pname") + "',";
	    		        json = json + "'sex':'" + rs.getString("Sex") + "',";
	    		        json = json + "'day':'" + rs.getString("Day") + "',";
	    		        json = json + "'month':'" + rs.getString("Month") + "',";
	    		        json = json + "'year':'" + rs.getString("Year") + "',";
	    		        json = json + "'hrs':'" + rs.getString("Hr") + "',";
	    		        json = json + "'min':'" + rs.getString("Min") + "',";
	    		        json = json + "'sec':'" + rs.getString("Sec") + "',";
	    		        json = json + "'dst':'" + rs.getString("DST") + "',";
	    		        json = json + "'place':'" + rs.getString("Place") + "',";
	    		        json = json + "'longdeg':'" + rs.getString("LongDeg") + "',";
	    		        json = json + "'longmin':'" + rs.getString("LongMin") + "',";
	    		        json = json + "'longew':'" + rs.getString("LongEW") + "',";
	    		        json = json + "'latdeg':'" + rs.getString("LatDeg") + "',";
	    		        json = json + "'latmin':'" + rs.getString("LatMin") + "',";
	    		        json = json + "'latns':'" + rs.getString("LatNS") + "',";
	    		        json = json + "'timezone':'" + rs.getString("Timezone") + "',";
	    		        json = json + "'ayanamsa':'" + rs.getString("Ayanamsa") + "',";
	    		        json = json + "'charttype':'" + rs.getString("ChartType") + "',";
	    		        json = json + "'kphn':'" + rs.getString("Kphn") + "',";
	    		        json = json +"}" ;
	      }
	    }
	    catch(SQLException sqle)
	    {
	    	sqle.printStackTrace();
	    }
	    finally
	    {
	    	dbUtils.closeConnection(connObj, stmt, rs);
	    }
		return json;
	}
	
	/**
	 * This method returns the chart details corresponding to the chartId.
	 * @param chartId
	 * @return JsonString
	 */
	public String getChartDetails(String chartId)
	{
		String json = "";
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql = "Select * from tbl_chart where chartId = '"+chartId+"'";
		Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	      stmt = connObj.createStatement();
	      rs = stmt.executeQuery(strsql);
	      if(rs.next())
	      {
	    	  json = "{";
	    		        json = json + "'name':'" + rs.getString("Pname") + "',";
	    		        json = json + "'sex':'" + rs.getString("Sex") + "',";
	    		        json = json + "'day':'" + rs.getString("Day") + "',";
	    		        json = json + "'month':'" + rs.getString("Month") + "',";
	    		        json = json + "'year':'" + rs.getString("Year") + "',";
	    		        json = json + "'hrs':'" + rs.getString("Hr") + "',";
	    		        json = json + "'min':'" + rs.getString("Min") + "',";
	    		        json = json + "'sec':'" + rs.getString("Sec") + "',";
	    		        json = json + "'dst':'" + rs.getString("DST") + "',";
	    		        json = json + "'place':'" + rs.getString("Place") + "',";
	    		        json = json + "'longdeg':'" + rs.getString("LongDeg") + "',";
	    		        json = json + "'longmin':'" + rs.getString("LongMin") + "',";
	    		        json = json + "'longew':'" + rs.getString("LongEW") + "',";
	    		        json = json + "'latdeg':'" + rs.getString("LatDeg") + "',";
	    		        json = json + "'latmin':'" + rs.getString("LatMin") + "',";
	    		        json = json + "'latns':'" + rs.getString("LatNS") + "',";
	    		        json = json + "'timezone':'" + rs.getString("Timezone") + "',";
	    		        json = json + "'kphn':'" + rs.getString("kphn") + "',";
	    		        json = json + "'AyanamsaType':'" + rs.getString("Ayanamsa") + "',";
	    		        json = json +"}" ;
	      }
	    }
	    catch(SQLException sqle)
	    {
	    	sqle.printStackTrace();
	    }
	    finally
	    {
	    	dbUtils.closeConnection(connObj, stmt, rs);
	    }
		return json;
	}
	
	/**
	 * This method returns the saved charts of the opposite gender of user(corresponding to the userId).
	 * @param userId
	 * @param sex
	 * @return JsonString
	 */
	public String getSavedCharts(String userId, String sex, String chart_id)
	{
		if(sex.toLowerCase().equals("male") || sex.toLowerCase().equals("m"))
		{
			sex = "female";
		}
		else
		{
			sex = "male";
		}
		
		String returnStr = "";
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql = "Select top 20 chartid, pname, day, month, year, hr, min, sec, place from tbl_chart where userid = '" + userId + "' And sex = '" + sex + "'";

		if(chart_id.trim() != null && chart_id.trim() != "null" && !(chart_id.equals("")) && !(chart_id.equals("null")))
		{
            strsql += " and tbl_chart.chartId > " + chart_id;
        }

		Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	      stmt = connObj.createStatement();
	      rs = stmt.executeQuery(strsql);

	      while(rs.next())
		  {
	    	  returnStr = returnStr + rs.getString("pname") + "|";
	    	  returnStr = returnStr + rs.getString("day") + "|";
	    	  returnStr = returnStr + rs.getString("month") + "|";
	    	  returnStr = returnStr + rs.getString("year") + "|";
	    	  returnStr = returnStr + rs.getString("hr") + "|";
	    	  returnStr = returnStr + rs.getString("min") + "|";
	    	  returnStr = returnStr + rs.getString("sec") + "|";
	    	  String place = rs.getString("Place");
	    	  
	    	  String[] placeArr = null;
	    	  if(place.contains(","))
	    	  {
	    		  placeArr = place.split(",");
	    		  place = placeArr[0];
	    	  }
	    	  else if(place.contains("("))
	    	  {
	    		  placeArr = place.split("\\(");
	    		  place = placeArr[0];
	    	  }
	    	  else if(place.contains(" "))
	    	  {
	    		  placeArr = place.split(" ");
	    		  place = placeArr[0];
	    	  }
	    	  returnStr = returnStr + place + "|";
	    	  returnStr = returnStr + rs.getString("chartid") + "#";
		  }
	      returnStr = returnStr.replaceAll("#$", "");
      if(returnStr.equals(""))
      {
    	  
    	  returnStr = "0";
      }
	      
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    	returnStr = "0";
	    }
	    finally
	    {
	    	dbUtils.closeConnection(connObj, stmt, rs);
	    }
	    return returnStr;
	}
	
	
	/**
	 * This method returns the saved charts of the opposite gender of user(corresponding to the userId).
	 * @param userId
	 * @param sex
	 * @return JsonString
	 */
	public String getSavedChartsForAutoComplete(String userId, String sex, String chartName)
	{
		if(sex.toLowerCase().equals("male") || sex.toLowerCase().equals("m"))
		{
			sex = "female";
		}
		else
		{
			sex = "male";
		}
		
		String returnStr = "";
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql = "Select top 20 chartid, pname, day, month, year, hr, min, sec, place from tbl_chart where userid = '" + userId + "' And sex = '" + sex + "' and Pname like '%"+chartName+"%'";
		Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	    	stmt = connObj.createStatement();
	    	rs = stmt.executeQuery(strsql);

	      while(rs.next())
		  { 
	    	 
	    	  returnStr =  returnStr + rs.getString(2)+"|";
	    	  returnStr =  returnStr + rs.getString(1)+"|";
	    	  returnStr =  returnStr + rs.getString(3)+"|";
	    	  returnStr =  returnStr + rs.getString(4)+"|";
	    	  returnStr =  returnStr + rs.getString(5)+"|";
	    	  returnStr =  returnStr + rs.getString(6)+"|";
	    	  returnStr =  returnStr + rs.getString(7)+"\r\n";	
		  }
	      
      if(returnStr.equals(""))
      {
    	  
    	  returnStr = "Record Not Found";
      }
	      
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    	returnStr = "Error! Try Again.";
	    }
	    finally
	    {
	    	dbUtils.closeConnection(connObj, stmt, rs);
	    }
	    return returnStr;
	}
	
	
	
	/**
	 * This method returns 
	 * a) The chart details of the a particular chartId if it is called from API.
	 * b) If chartId is passed, then corresponding to passed in userId
	 *    it returns Chart details of top 20 charts where chartId > the passed in chartId.
	 * c) Else it returns Chart details of top 20 charts corresponding to the userId. 
	 * @param userid
	 * @param chartId
	 * @param isapi
	 * @param constants
	 * @return JsonString
	 */
	public String openchartdata(String userid, String chartId, int isapi, MyProperties constants)
	{
		String jsonObj = "";
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql = "";
		
	    if( isapi == 1 && !chartId.equals(""))
	    {
	        strsql = "Select chartId, PName, case when Sex='M' or Sex = 'Male' then 'Male' else 'Female' end as sex, " +
	            "CONVERT(varchar, [Day] + '-' +  " +
	            "[month] + '-' + [year], 105) as [Date of Birth], " +
	            "CONVERT(varchar, [Hr]	 + ':' + [Min] + ':' + [Sec], 105) as [Time of Birth], Place, " +
	            "LongDeg, LongMin, LongEW, LatDeg, LatMin, LatNS, TimeZone, Ayanamsa, kphn, DST, " +
	            "user_data.phone1, user_data.phone2, user_data.mobile, user_data.state, user_data.country, user_data.email " +
	            "from tbl_chart " +
	            "inner join user_data on tbl_chart.UserId = user_data.userid " +
	            "where ChartId = '" + chartId + "'" ;   
	    }
	
	    else if(isapi == 0)
	    {
	        strsql = "Select top 20 tbl_chart.chartId, tbl_chart.PName, case when Sex = 'M' or Sex = 'Male' then 'Male' else 'Female' end as sex, " +
	            "CONVERT(varchar, tbl_chart.[Day] +'-'+  tbl_chart.[month] +'-'+tbl_chart.[year],105) as [Date of Birth],"+
	            "CONVERT(varchar, tbl_chart.[Hr] +':'+ tbl_chart.[Min] +':'+tbl_chart.[Sec],105) as [Time of Birth],tbl_chart.Place," +
	            "[Public/private] = (case when ChartName <> '' then 'Shared' Else 'Private' end)," +
	            "tbl_chart.LongDeg, tbl_chart.LongMin, tbl_chart.LongEW, tbl_chart.LatDeg, tbl_chart.LatMin, tbl_chart.LatNS, tbl_chart.TimeZone, tbl_chart.Ayanamsa, tbl_chart.kphn, " +
	            "user_data.phone1, user_data.phone2, user_data.mobile, user_data.state, user_data.country, user_data.email " +
	            "from tbl_chart " +
	            "inner join user_data on tbl_chart.UserId = user_data.userid " +
	            " where tbl_chart.userid = '" + userid + "' " ;
	        if(chartId != null && !(chartId.equals("")))
	            strsql += " and tbl_chart.chartId > "+chartId;
	        strsql += " order by chartid";
	    }

	    Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	      stmt = connObj.createStatement();
	      rs = stmt.executeQuery(strsql);
	    
	      if( isapi == 1)
	        {
	        	if(rs.next())
	        	{
	                jsonObj = jsonObj + "chartid ; " + rs.getString(0) + "|";
	                jsonObj = jsonObj + "chartname ; " + rs.getString(1) + "|";
	                jsonObj = jsonObj + "gender ; " + rs.getString(2) + "|";
	                jsonObj = jsonObj + "date_of_birth ; " + rs.getString(3) + "|";
	                jsonObj = jsonObj + "time_of_birth ; " + rs.getString(4) + "|";
	                jsonObj = jsonObj + "place_of_birth ; " + rs.getString(5) + "|";
	                jsonObj = jsonObj + "longdeg ; " + rs.getString(6) + "|";
	                jsonObj = jsonObj + "longmin ; " + rs.getString(7) + "|";
	                jsonObj = jsonObj + "longEW ; " + rs.getString(8) + "|";
	                jsonObj = jsonObj + "latdeg ; " + rs.getString(9) + "|";
	                jsonObj = jsonObj + "latmin ; " + rs.getString(10) + "|";
	                jsonObj = jsonObj + "latNS ; " + rs.getString(11) + "|";
	                jsonObj = jsonObj + "timezone ; " + rs.getString(12) + "|";
	                jsonObj = jsonObj + "ayanamsa ; " + rs.getString(13) + "|";
	                jsonObj = jsonObj + "kphn ; " + rs.getString(14) + "|";
	                jsonObj = jsonObj + "DST ; " + rs.getString(15) + "|";
	                jsonObj = jsonObj + "phone1 ; " + rs.getString(16) + "|";
	                jsonObj = jsonObj + "phone2 ; " + rs.getString(17) + "|";
	                jsonObj = jsonObj + "mobile ; " + rs.getString(18) + "|";
	                jsonObj = jsonObj + "state ; " + rs.getString(19) + "|";
	                jsonObj = jsonObj + "country ; " + rs.getString(20) + "|";
	                jsonObj = jsonObj + "email ; " + rs.getString(21) + "|";
	                	            
	        	} 
	        }
	        else 
	        {
	        	
	            jsonObj = "[";
	
	            while(rs.next())
	            {
	                jsonObj = jsonObj + "{";
	                jsonObj = jsonObj + "\"chartId\" : \"" + rs.getString(1) + "\",";
	                jsonObj = jsonObj + "\"chartName\" : \"" + rs.getString(2) + "\",";
	                jsonObj = jsonObj + "\"gender\" : \"" + rs.getString(3) + "\",";
	                jsonObj = jsonObj + "\"Date_of_Birth\" : \"" + rs.getString(4) + "\",";
	                jsonObj = jsonObj + "\"Time_of_Birth\" : \"" + rs.getString(5) + "\",";
	                jsonObj = jsonObj + "\"Place_of_Birth\" : \"" + rs.getString(6) + "\",";
	                jsonObj = jsonObj + "\"pubshared\" : \"" + constants.getString(rs.getString(7).toUpperCase()+ "_CHART") + "\",";
	                jsonObj = jsonObj + "\"phone1\" : \"" + rs.getString(17) + "\",";
	                jsonObj = jsonObj + "\"phone2\" : \"" + rs.getString(18) + "\",";
	                jsonObj = jsonObj + "\"mobile\" : \"" + rs.getString(19) + "\",";
	                jsonObj = jsonObj + "\"state\" : \"" + rs.getString(20) + "\",";
	                jsonObj = jsonObj + "\"country\" : \"" + rs.getString(21) + "\",";
	                jsonObj = jsonObj + "\"email\" : \"" + rs.getString(22);
	                
	                jsonObj = jsonObj + "\"},";
	                
	            }
	
	            jsonObj = jsonObj.substring(0,jsonObj.length()-1);
	            jsonObj = jsonObj + "]";
	            
	        }
	    }
	    catch(SQLException e)
	    {
	    	e.printStackTrace();
	    }
	    finally
	    {
	    	dbUtils.closeConnection(connObj, stmt, rs);
	    }
	    return jsonObj;
	}  
	/**
	 * This method is used to get the details of user default chart.
	 * @param userId
	 * @return Map object having chart details.
	 */
	/**
	 * This method returns the default chart corresponding to the userId.
	 * If chart is not present, then join between user_data and person_details is done and 
	 * first record is returned.
	 * @param userId
	 * @return HashMap
	 */
	public HashMap<String, Object> openUserDefaultChart(String userId)
	{
		HashMap<String, Object> hm = new HashMap<String, Object>();
		DesktopHoro horoObject = new DesktopHoro();
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		//A sql is written in ASP to get the status of the logged in user. 
		//Dont know the purpose of the same as yet. So setting the status to 1 directly.
		//If the need is identified at a later stage then we need to get the status from user_Data
		//and set the status here.
		String sql = "Select * From tbl_chart Where UserId = '"+userId+"' and Isdefault = 1";
		//System.out.println(sql);
		Statement stmt = null;
	    ResultSet rs = null;
	    try
	    {
	    	connObj = dbUtils.getConnection();
	      stmt = connObj.createStatement();
	      rs = stmt.executeQuery(sql);
	      if(rs.next())
	      {
	    	  hm.put("ChartId",  rs.getString("chartId"));
	    	  horoObject.setName(rs.getString("PName"));
	    	  horoObject.setMaleFemale(rs.getString("Sex"));
	    	  horoObject.setDayOfBirth(rs.getString("Day"));
	    	  horoObject.setMonthOfBirth(rs.getString("Month"));
	    	  horoObject.setYearOfBirth(rs.getString("Year"));
	    	  horoObject.setHourOfBirth(rs.getString("Hr"));
	    	  horoObject.setMinuteOfBirth(rs.getString("Min"));
	    	  horoObject.setSecondOfBirth(rs.getString("Sec"));
	    	  horoObject.setDST(rs.getString("DST"));
	    	  horoObject.setPlace(rs.getString("Place"));
	    	  horoObject.setDegreeOfLongitude(rs.getString("LongDeg"));
	    	  horoObject.setMinuteOfLongitude(rs.getString("LongMin"));
	    	  horoObject.setEastWest(rs.getString("LongEW"));
	    	  horoObject.setDegreeOfLattitude(rs.getString("LatDeg"));
	    	  horoObject.setMinuteOfLattitude(rs.getString("LatMin"));
	    	  horoObject.setNorthSouth(rs.getString("LatNS"));
	    	  horoObject.setTimeZone(rs.getString("TimeZone"));
	    	  horoObject.setAyan(rs.getInt("ayanamsa"));
	    	  horoObject.setKPHorarySeed(rs.getInt("kphn"));
	    	  hm.put("HoroObject", horoObject);
	    	  hm.put("Charting", rs.getString("ChartType"));
	      }
	      else
	      {
	    	  rs.close();
	    	/*  sql = "Select p.PName as name, p.Sex as gender, day(p.DOB) as dayofbirth,"+
	                  " month(p.dob) as monthofbirth, year(p.DOB) as yearofbirth,"+
	                  "HOUR(p.TOB) as hrs, MINUTE(p.TOB) as minu,"+
	                  "SECOND(p.TOB) as sec,p.TimeZone as timezone, c.LatDeg as latdeg,"+
	                  "c.LatMin as latmin, c.LatNS as latns, c.LongDeg as longdeg,"+
	                  " c.LongMin as longmin, c.LongEW as longew, c.place as place,"+
	                  " p.dst as DST, p.kpseed as kphn,p.charttype chartstyle,p.ayanamsa as ayanamsa from user_data u inner join"+
	                  " persondetail p on u.userid = p.UserId inner join City_Master"+
	                  " c on p.CityID = c.city_ID Where u.userid = '"+ userId +"'";
	                  */
	    	  
	    	  sql =   "Select p.PName as name, p.Sex as gender, day(p.DOB) as dayofbirth,"+
              " month(p.dob) as monthofbirth, year(p.DOB) as yearofbirth,"+
              "DATEPART(HOUR,p.TOB) as hrs, DATEPART(MINUTE,p.TOB) as minu,"+
              "DATEPART(SECOND,p.TOB) as sec,p.TimeZone as timezone, c.LatDeg as latdeg,"+
              "c.LatMin as latmin, c.LatNS as latns, c.LongDeg as longdeg,"+
              " c.LongMin as longmin, c.LongEW as longew, c.place as place,"+
              " p.dst as DST, p.kpseed as kphn,p.charttype chartstyle,p.ayanamsa as ayanamsa from user_data u inner join"+
              " PersonDetail p on u.userid = p.UserId inner join City_Master"+
              " c on p.CityID = c.city_ID Where u.userid = '"+ userId +"'";
	    	  rs = stmt.executeQuery(sql);
	  	      if(rs.next())
	  	      {
	  	    	  horoObject.setName(rs.getString("name"));
		    	  horoObject.setMaleFemale(rs.getString("gender"));
		    	  horoObject.setDayOfBirth(rs.getString("dayofbirth"));
		    	  horoObject.setMonthOfBirth(rs.getString("monthofbirth"));
		    	  horoObject.setYearOfBirth(rs.getString("yearofbirth"));
		    	  horoObject.setHourOfBirth(rs.getString("hrs"));
		    	  horoObject.setMinuteOfBirth(rs.getString("minu"));
		    	  horoObject.setSecondOfBirth(rs.getString("sec"));
		    	  horoObject.setDST(rs.getString("DST"));
		    	  horoObject.setPlace(rs.getString("place"));
		    	  horoObject.setDegreeOfLongitude(rs.getString("longdeg"));
		    	  horoObject.setMinuteOfLongitude(rs.getString("longmin"));
		    	  String longew = rs.getString("longew");
		    	  //
		    	  horoObject.setDegreeOfLattitude(rs.getString("latdeg"));
		    	  horoObject.setMinuteOfLattitude(rs.getString("latmin"));
		    	  String latns = rs.getString("latns");
		    	  //
		    	  String timezoneval = rs.getString("timezone");
		    	  //
		    	  horoObject.setAyan(rs.getInt("ayanamsa"));
		    	  horoObject.setKPHorarySeed(rs.getInt("kphn"));
		    	  String chartStyle = ConstantValues.DEFAULT_CHART_STYLE;
		    	                                     
		    	  if(timezoneval == null || timezoneval.equals(""))
	                timezoneval = ConstantValues.DEFAULT_TIMEZONE_VALUE;
		    	            
	              if( longew.equals(ConstantValues.LONGITUDE_DIR_EAST_INT))
    	            longew = ConstantValues.LONGITUDE_DIR_EAST;
              	  else
    	            longew = ConstantValues.LONGITUDE_DIR_WEST;
	    	            	    	            
	              if( latns.equals(ConstantValues.LATITUDE_DIR_NORTH_INT))
	                latns = ConstantValues.LATITUDE_DIR_NORTH;
	              else
	                latns = ConstantValues.LATITUDE_DIR_SOUTH;
	    	             		    	            
	              horoObject.setEastWest(longew);           
	              horoObject.setNorthSouth(latns);          
	              horoObject.setTimeZone(timezoneval);          
		    	  HashMap<String, Integer> map = saveChart(horoObject, userId, chartStyle, "",ConstantValues.KEY_VAL_WEB,"",0,connObj, true);
		    	  hm.put("ChartId", map.get("ChartId"));
		    	  hm.put("HoroObject", horoObject);
		    	  hm.put("Charting", "");
	  	      }
	      }
	    }
	    catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			dbUtils.closeConnection(connObj, stmt, rs);
		}
		return hm;
	}

	/**
	 * This method is used to get the details user default chart.
	 * @param userId horoObject chartStyle chartId 
     * @return String value that state weather chart updated or not successfully.
	 */

	public String editSaveChart(DesktopHoro horoObject, String userId, String chartStyle,String chartId,String chartName, String keyVal, String tagsVal, int isApi, Connection connObj, boolean defaultAlreadyChecked)
	{
		String returnValue = "";
		String isChartSave = "";
		if(userId != null)
		{
			if(!userId.isEmpty() && !chartId.isEmpty())
			{
				if(matchinguseridandchartid(userId, chartId, null))
				{
					isApi = 0;
					isChartSave = updateChart(chartId,horoObject,userId,chartStyle,chartName,keyVal,tagsVal,isApi);
				}
				else
				{
					isChartSave = "0";
				}
			}
			else
			{
				isApi = 0;
				isChartSave = String.valueOf(saveChart(horoObject, userId, chartStyle, chartName, keyVal, tagsVal, isApi, connObj, defaultAlreadyChecked).get("SaveChart"));
			}
		}
		if(isChartSave.equals("-3") || isChartSave.equals("1"))
		{
		   returnValue = "1";
		} //chart updated or chart inserted successfully.
		else if(isChartSave.equals("0"))
		{
			returnValue = "0";
		}//user id does not matched with chart id.
		else
		{
			returnValue = "2";
		} //Unknown error in updating chart.
		return returnValue;  
	}
	/**
	 * This method is used to update Chart details.
	 * @param chartId horoObject userId chartStyle chartName keyVal tagsVal isApi 
     * @return String value -3 or -4.
	 */
	public String updateChart(String chartId,DesktopHoro horoObject, String userId, String chartStyle,String chartName, String keyVal, String tagsVal, int isApi)
	{
		DatabaseUtils dbUtils = new DatabaseUtils();
		String returnValue = "";
		int updatedRows = 0;
		String sqlUpdate = "update tbl_chart set UserId = '"+userId+"',PName = N'"+horoObject.getName()+"', Sex='"
					+horoObject.getMaleFemale()+"',Day='"+horoObject.getDayOfBirth()+"',Month='"+horoObject.getMonthOfBirth()
					+"',Year='"+horoObject.getYearOfBirth()+"', Hr='"+horoObject.getHourOfBirth()+
					"', Min='"+horoObject.getMinuteOfBirth()+"', Sec='"+horoObject.getSecondOfBirth()+
					"', DST='"+horoObject.getDST()+"',Place='"+horoObject.getPlace()+"',LongDeg='"+
					horoObject.getDegreeOfLongitude()+"', LongMin='"+horoObject.getMinuteOfLongitude()+
					"', LongEW='"+horoObject.getEastWest()+"', LatDeg='"+horoObject.getDegreeOfLattitude()+
					"', LatMin='"+horoObject.getMinuteOfLattitude()+"', LatNS='"+horoObject.getNorthSouth()+
					"', TimeZone='"+horoObject.getTimeZone()+"', Ayanamsa='"+SharedFunction.getAyan(horoObject)+"',ChartType='"+
					chartStyle+"',ChartName='"+chartName+"',kphn='"+horoObject.getKPHorarySeed()+"',keyval='"+
					keyVal+"',tags='"+tagsVal+"' where chartId = '"+chartId+"'";
		Connection connObj = null;
		Statement stmt = null;
		try
		{
			
			connObj = dbUtils.getConnection();
			stmt = connObj.createStatement();
			updatedRows = stmt.executeUpdate(sqlUpdate);
			
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			dbUtils.closeConnection(connObj, stmt, null);
		}
		if(updatedRows > 0)
		{		
			returnValue = "-3";
		}
		else
		{
			returnValue = "-4";
		}
		return returnValue;
	}
	/**
	 * This method is called inside  editSaveChart and openUserDefaultChart method to save the chart details.
	 * @param horoObject userId chartStyle chartName keyVal tagsVal isApi connObj defaultAlreadyChecked 
	 * @return HashMap object that contains chart details
	 */
	public HashMap<String, Integer> saveChart(DesktopHoro horoObject, String userId, String chartStyle,String chartName, String keyVal, String tagsVal, int isApi, Connection connObj, boolean defaultAlreadyChecked)
	{
		int chartId = 0;
		int saveChart = 0;
		DatabaseUtils dbUtils = new DatabaseUtils();
		Statement stmt = null;
		ResultSet rs = null;
		boolean closeConnection = false;
		try
		{
			HashMap<String, Integer> tempMap = getPermissionToSaveChart(userId, connObj);
		if(tempMap.get("isUserPermitted") == 0)
		{
			//The current chart is made default if the previously entered ones do not already have a default one.
			//First we check if the default has already been checked in the calling method, if yes then we
			//just make the current chart default. If it has not been checked, then we search for defaultchart 
			//corresponding to the userId in isUserHasDefaultChart. If it returns a default chart, then the current
			//chart is not a default, otherwise it is.
			
			boolean makeCurrentDefault = true;
			if(!defaultAlreadyChecked)
			{
				makeCurrentDefault = !isUserHasDefaultChart(userId, connObj);
			}
			String sql = "Insert into tbl_chart(UserId, PName, Sex, Day, Month, Year, Hr, Min, Sec, DST," +
						"Place, LongDeg, LongMin, LongEW, LatDeg, LatMin, LatNS, TimeZone, Ayanamsa,"+
						"ChartType, Isdefault, ChartName,kphn,keyval,tags) values('"+userId+"',N'"+horoObject.getName()
						+"','"+horoObject.getMaleFemale()+"','"+horoObject.getDayOfBirth()+"','"+horoObject.getMonthOfBirth()
						+"','"+horoObject.getYearOfBirth()+"','"+horoObject.getHourOfBirth()+"','"+horoObject.getMinuteOfBirth()
						+"','"+horoObject.getSecondOfBirth()+"','"+horoObject.getDST()+"','"+horoObject.getPlace()
						+"','"+horoObject.getDegreeOfLongitude()+"','"+horoObject.getMinuteOfLongitude()+"','"+horoObject.getEastWest()
						+"','"+horoObject.getDegreeOfLattitude()+"','"+horoObject.getMinuteOfLattitude()+
						"','"+horoObject.getNorthSouth()+"','"+horoObject.getTimeZone()+"','"+SharedFunction.getAyan(horoObject)
						+"','"+chartStyle+"',"+(makeCurrentDefault?1:0)+",'"+chartName+"','"+horoObject.getKPHorarySeed()+"','"+keyVal+"','"+tagsVal+"');";
			
				if(connObj == null)
				{
					connObj = dbUtils.getConnection();
					closeConnection = true;
				}
				stmt = connObj.createStatement();
				stmt.execute(sql);
				sql = "SELECT @@Identity";
				rs = stmt.executeQuery(sql);
				if(rs.next())
				{
					if(isApi == 0)
					{
						chartId = rs.getInt(1);
					}
					if(isApi == 1)
					{
						saveChart = rs.getInt(1);
					}
					else 
					{
						saveChart = 1;
					}
				}
				else
				{
					saveChart = 0;
				}
			}//if no permission to save chart
			else
			{
				if(!userId.equals(""))
				{
					if(tempMap.get("chartMessage") == 1)
					{
						saveChart = -2;
					}
					else if(tempMap.get("chartMessage") == 2)
					{
						saveChart = -3;
					}
				}
				else
				{
					saveChart = 10;
				}
			}
			}
			catch(SQLException sqle)
			{
				sqle.printStackTrace();
			}
			finally
			{
				if(closeConnection)
					dbUtils.closeConnection(connObj, stmt, rs);
				else
					dbUtils.closeConnection(null, stmt, rs);
			}
		
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("ChartId", chartId);
		hm.put("SaveChart", saveChart);
		return hm;
	}
	
	public HashMap<String, Integer> getPermissionToSaveChart(String userId, Connection connObj)
	{
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		boolean isUserPermitted = false;
		DatabaseUtils dbUtils = new DatabaseUtils();
		boolean closeConnection = false;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "Select planid from tbl_userplandetail where userid='"+userId+"'";
		try
		{
			if(connObj == null)
			{
				connObj = dbUtils.getConnection();
				closeConnection = true;
			}
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(sql);
			int planId = 1;
			if(rs.next())
			{
				planId = rs.getInt("planid");
			}
			
			sql = "Select count(userid) from tbl_chart where userid='"+userId+"'";
			rs.close();
			rs = stmt.executeQuery(sql);
			if(planId == 1)
			{
				if(rs.next())
				{
					int noCharts = rs.getInt(1);
					if(noCharts < 10)
					{
						isUserPermitted = true;
					}
				}
				hm.put("chartMessage", 1);
			}
			else if(planId == 2 || planId == 4 || planId == 5)
			{
				if(rs.next())
				{
					int noCharts = rs.getInt(1);
					if(noCharts < 500)
					{
						isUserPermitted = true;
					}
				}
				hm.put("chartMessage", 2);
			}
			else
			{
				isUserPermitted = true;
			}
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			if(closeConnection)
				dbUtils.closeConnection(connObj, stmt, rs);
			else
				dbUtils.closeConnection(null, stmt, rs);
		}

		hm.put("isUserPermitted", isUserPermitted?0:1);
		return hm;
	}
	/**
	 * This method is called inside saveChart to check user permission to save chart.
	 * @param userId connObj 
     * @return boolean
	 */
	public boolean isPermissionToSaveChart(String userId, Connection connObj)
	{
		boolean isUserPermitted = false;
		DatabaseUtils dbUtils = new DatabaseUtils();
		boolean closeConnection = false;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "Select planid from tbl_userplandetail where userid='"+userId+"'";
		try
		{
			if(connObj == null)
			{
				connObj = dbUtils.getConnection();
				closeConnection = true;
			}
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(sql);
			int planId = 1;
			if(rs.next())
			{
				planId = rs.getInt("planid");
			}
			
			sql = "Select count(userid) from tbl_chart where userid='"+userId+"'";
			rs.close();
			rs = stmt.executeQuery(sql);
			if(planId == 1)
			{
				if(rs.next())
				{
					int noCharts = rs.getInt(1);
					if(noCharts < 10)
					{
						isUserPermitted = true;
					}
				}
			}
			else if(planId == 2 || planId == 4 || planId == 5)
			{
				if(rs.next())
				{
					int noCharts = rs.getInt(1);
					if(noCharts < 500)
					{
						isUserPermitted = true;
					}
				}
			}
			else
			{
				isUserPermitted = true;
			}
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			if(closeConnection)
				dbUtils.closeConnection(connObj, stmt, rs);
			else
				dbUtils.closeConnection(null, stmt, rs);
		}

		return isUserPermitted;
	}
	
	/**
	 * This method is used to find weather user has default chart or not.
	 * @param userId
	 * @return boolean
	 */
	public boolean isUserHasDefaultChart(String userId, Connection connObj)

	{
		boolean defaultChartExists = false;
		Statement stmt = null;
		ResultSet rs = null;
		DatabaseUtils dbUtils = new DatabaseUtils();
		boolean isClosingNeeded = false;
		
		try
		{
			if(connObj == null)
			{
				connObj = dbUtils.getConnection();
				isClosingNeeded = true;
			}
			String sql = "select top 1 * from tbl_chart where userId = '"+userId+"' and Isdefault = 1 ";
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				defaultChartExists = true;
			}
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			if(isClosingNeeded)
				dbUtils.closeConnection(connObj, stmt, rs);
			else
				dbUtils.closeConnection(null, stmt, rs);
		}
		return defaultChartExists;
	}
	/**
	 * This method is used to find user birth details exist or not.
	 * @param uid
	 * @return HashMap
	 */
	public HashMap<String, String> isBirthDetailExist(String uid){
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("isExist","false");
	    //String isExist = "false";
		Statement stmt = null;
		ResultSet rs = null;
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		try
		{
			connObj = dbUtils.getConnection();
			String sql = "select * from persondetail where UserId = '" + uid + "'";
			//System.out.println(sql);
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				//isExist = "true";
				hm.put("isExist","true");
				hm.put("PName",rs.getString("PName"));
				hm.put("DOB",rs.getString("DOB"));
				hm.put("TOB",rs.getString("TOB"));
				hm.put("Sex",rs.getString("Sex"));
				hm.put("CityID",rs.getString("CityID"));
				hm.put("DST",rs.getString("DST"));
				hm.put("chartType",rs.getString("chartType"));
				hm.put("Ayanamsa",rs.getString("Ayanamsa"));
				hm.put("AccessPermission",rs.getString("AccessPermission"));
			}
			/*else
			{
				stmt.close();
				rs.close();
				String sql1 = "select top 1 1 from tbl_chart where UserId= '" + uid + "'";
				stmt = connObj.createStatement();
				rs = stmt.executeQuery(sql1);
				if(rs.next())
				{
					isExist = "true";
				}
			}*/
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			dbUtils.closeConnection(connObj, stmt, rs);
		}
		return hm;
	}
	
	/**
	 * This method is used to find the city information.
	 * @param city
	 * @return String having place information
	 */
	
	public String getDataFromCityMaster(String City){
		//boolean defaultChartExists = false;
		String place="";
		Statement stmt = null;
		ResultSet rs = null;
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		try
		{
			connObj = dbUtils.getConnection();
			String sql = "Select City_Master.Place from City_Master where City_Master.city_ID =" + City;
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				place = rs.getString("place");
				//defaultChartExists = true;
			}
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			dbUtils.closeConnection(connObj, stmt, rs);
		}
		return place;
		
	}
	
	/**
	 * This method is used to find cityID from data base according to city name.
	 * @param place
	 * @return String cityId
	 */
	public String getCityId(String place){
		
		String cityId="";
		Statement stmt = null;
		ResultSet rs = null;
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		try
		{
			connObj = dbUtils.getConnection();
			String sql = "SELECT CM.City_Id, CM.place, State_Master.statename, Country_Master.country, Country_Master.ZoneStart FROM (City_Master CM LEFT JOIN State_Master ON CM.stateCountryCode = State_Master.statecode) INNER JOIN Country_Master ON CM.countryCode = Country_Master.countrycode where  CM.place like'" + place + "%' ORDER BY CM.place";
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				cityId = rs.getString("City_Id");
				//defaultChartExists = true;
			}
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			dbUtils.closeConnection(connObj, stmt, rs);
		}
		return cityId;
		
	}
	/**
	 * This method is used to save user information and returns status 1 or 0.
	 * @param name DOB TimeoB Sex CityID DST Charting Ayanamsa uid TimeZone AccessPermission 
     * @return int result1
	 */
	public int recordSaveIntoPersonDetails(String name,java.util.Date DOB,String TimeoB,String Sex,int CityID,String DST,String Charting,String Ayanamsa,String uid,String TimeZone,String AccessPermission){
		int result1= 0;
		Statement stmt = null;
		//ResultSet rs = null;
		DatabaseUtils dbUtils = new DatabaseUtils();
		Connection connObj = null;
		
		
		try
		{
			connObj = dbUtils.getConnection();
			String sql = "INSERT INTO persondetail ( PName, DOB, TOB, Sex, CityID, `Default`, DST, KPSeed, Synchonized, MoonDeg, palmRecordId, chartType, Ayanamsa, UserId, TimeZone, AccessPermission ) VALUES (" +
					 "'" + name + "','" +  
					 new java.sql.Timestamp(DOB.getTime())  + "','" +  
					 TimeoB + "','" +  
					 Sex + "'," +  
					 CityID + "," +  
					 0 + ",'" + 
					 DST + "','" +  
					 "0" + "'," +  
					  0 + ",'" +  
					 "0"  + "','" +  
					 "0"  + "','" + 
					 Charting  + "','" +  
					 Ayanamsa  + "','" +  
					 uid  + "','" + 
					 TimeZone  + "','" +  
					 AccessPermission  + "')";
			//System.out.println(sql);
			stmt = connObj.createStatement();
			int res = stmt.executeUpdate(sql);
			
			if(res==1)
			{
				result1 = 1;
				//defaultChartExists = true;
			}
			//stmt.close();
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
		finally
		{
			dbUtils.closeConnection(connObj, stmt, null);
		}
		return result1;
	}
	
	/**
	 * This method is used to get user personal details by user id.
	 * @param userId connObj 
     * @return HashMap hm
	 */
	public HashMap<String, String> getRecordOfUser(String userId , Connection connObj)
	{
	   HashMap<String, String> hm = new HashMap<String, String>();
	   String StrSql = "",status="";
	  // if(!passWord.equals("")){
	  // StrSql = "select * from user_data Where userid = '" + userId + "' and password = '" + passWord + "'";
	  // }
	  // else
	  // {
		StrSql = "select * from user_data Where userid = '" + userId + "'";
	  // }
	   DatabaseUtils dBUtils = new DatabaseUtils();
		boolean closingNeeded = false;
		
		Statement stm = null;
		ResultSet Rsdata = null;
		try
		{
			if(connObj == null)
			{
			 connObj = dBUtils.getConnection();
			 closingNeeded = true;
			}
			stm = connObj.createStatement();
			Rsdata = stm.executeQuery(StrSql);
			if(!Rsdata.next())
			{
				//result = "1";
				hm.put("firstname","");
				hm.put("username","");
				hm.put("email","");
				hm.put("result","1");
				hm.put("regcode","");
				hm.put("password","");
				hm.put("mobile","");
				hm.put("category","");
				hm.put("maritalstatus","");
				hm.put("occupation","");
				
		    }
			else{
				status = Rsdata.getString("status");
				//System.out.println(status);
				if(status!=null && (status.equals("false") || status.equals("0"))){
					//result = "2";
					hm.put("firstname",Rsdata.getString("firstname"));
					if(Rsdata.getString("lastname")=="" || Rsdata.getString("lastname")==null)
					{
						hm.put("username",Rsdata.getString("firstname"));
							
					}
					else
					{
						hm.put("username",Rsdata.getString("firstname")+" "+Rsdata.getString("lastname"));
					}
					
					if (Rsdata.getString("mobile")==null || Rsdata.getString("mobile")==""){
						hm.put("mobile","");
					}
					else
					{
						hm.put("mobile",Rsdata.getString("mobile"));
					}
					
					if (Rsdata.getString("maritalstatus")==null || Rsdata.getString("maritalstatus")==""){
						hm.put("maritalstatus","");
					}
					else
					{
						hm.put("maritalstatus",Rsdata.getString("maritalstatus"));
					}
					
					if (Rsdata.getString("occupation")==null || Rsdata.getString("occupation")==""){
						hm.put("occupation","");
					}
					else
					{
						hm.put("occupation",Rsdata.getString("occupation"));
					}
					
					hm.put("email",Rsdata.getString("email"));
					hm.put("regcode",Rsdata.getString("regcode"));
					hm.put("result","2");
					hm.put("password",Rsdata.getString("password"));
					hm.put("category",Rsdata.getString("category"));
					
				}
				else
				{
					//result = "3";
					hm.put("firstname",Rsdata.getString("firstname"));
					if(Rsdata.getString("lastname")=="" || Rsdata.getString("lastname")==null)
					{
						hm.put("username",Rsdata.getString("firstname"));
							
					}
					else
					{
						hm.put("username",Rsdata.getString("firstname")+" "+Rsdata.getString("lastname"));
					}
					
					if (Rsdata.getString("mobile")==null || Rsdata.getString("mobile")==""){
						hm.put("mobile","");
					}
					else
					{
						hm.put("mobile",Rsdata.getString("mobile"));
					}
					
					if (Rsdata.getString("maritalstatus")==null || Rsdata.getString("maritalstatus")==""){
						hm.put("maritalstatus","");
					}
					else
					{
						hm.put("maritalstatus",Rsdata.getString("maritalstatus"));
					}
					
					if (Rsdata.getString("occupation")==null || Rsdata.getString("occupation")==""){
						hm.put("occupation","");
					}
					else
					{
						hm.put("occupation",Rsdata.getString("occupation"));
					}
					
					hm.put("email",Rsdata.getString("email"));
					hm.put("regcode",Rsdata.getString("regcode"));
					hm.put("result","3");
					hm.put("password",Rsdata.getString("password"));
					hm.put("category",Rsdata.getString("category"));
					
					
					
				}
			}
			
		}
		catch(SQLException ex)
		{
				
		}
		finally
		{
			if(closingNeeded)
			{
				dBUtils.closeConnection(connObj, stm, Rsdata);
			}
			else
				dBUtils.closeConnection(null, stm, Rsdata);
		}
		
	return hm;
	}
	public HashMap<String,String> getCloudPlanDetails(String userId , Connection connObj){
		HashMap<String ,String> hmCloud =new HashMap<String,String>();
		String StrSql = "";
		StrSql = "select * from tbl_CloudPlanPartnersDetails Where UserId = '" + userId + "'";
		
		  // }
		   DatabaseUtils dBUtils = new DatabaseUtils();
			boolean closingNeeded = false;
			
			Statement stm = null;
			ResultSet Rsdata = null;
			try
			{
				if(connObj == null)
				{
				 connObj = dBUtils.getConnection();
				 closingNeeded = true;
				}
				stm = connObj.createStatement();
				Rsdata = stm.executeQuery(StrSql);
				if(!Rsdata.next())
				{
					//result = "1";
					hmCloud.put("companyName","");
					hmCloud.put("addressLine1","");
					hmCloud.put("addressLine2","");
										
			    }
				else
				{
					if (Rsdata.getString("CompanyName")==null || Rsdata.getString("CompanyName")==""){
						hmCloud.put("companyName","");
					}
					else
					{
						hmCloud.put("companyName",Rsdata.getString("CompanyName"));
					}
					
					if (Rsdata.getString("AddressLine1")==null || Rsdata.getString("AddressLine1")==""){
						hmCloud.put("addressLine1","");
					}
					else
					{
						hmCloud.put("addressLine1",Rsdata.getString("AddressLine1"));
					}
					
					if (Rsdata.getString("AddressLine2")==null || Rsdata.getString("AddressLine2")==""){
						hmCloud.put("addressLine2","");
					}
					else
					{
						hmCloud.put("addressLine2",Rsdata.getString("AddressLine2"));
					}
					
				}
				
			}
			catch(SQLException ex)
			{
					
			}
			finally
			{
				if(closingNeeded)
				{
					dBUtils.closeConnection(connObj, stm, Rsdata);
				}
				else
					dBUtils.closeConnection(null, stm, Rsdata);
			}
			
		return hmCloud;
		
	}
	/**
	 * This method is used to get user personal details along with password.
	 * @param userId passWord connObj 
     * @return HashMap hm
	 */
	public HashMap<String, String> getRecordOfUserWithPassword(String userId ,String passWord, Connection connObj)
	{
	   HashMap<String, String> hm = new HashMap<String, String>();
	   String StrSql = "",status="";
	  // if(!passWord.equals("")){
	   StrSql = "select * from user_data Where userid = '" + userId + "' and password = '" + passWord + "'";
	  // }
	 //  else
	  // {
	//	StrSql = "select * from user_data Where userid = '" + userId + "'";
	  // }
	   DatabaseUtils dBUtils = new DatabaseUtils();
		boolean closingNeeded = false;
		
		Statement stm = null;
		ResultSet Rsdata = null;
		try
		{
			if(connObj == null)
			{
			 connObj = dBUtils.getConnection();
			 closingNeeded = true;
			}
			stm = connObj.createStatement();
			Rsdata = stm.executeQuery(StrSql);
			
			// no record found
			if(!Rsdata.next())
			{
				//result = "1";
				hm.put("firstname","");
				hm.put("email","");
				hm.put("result","1");
				hm.put("regcode","");
				
		    }
			else{
				// user found, but email id is not activated
				status = Rsdata.getString("status");
				//System.out.println(status);
				if(status != null && (status.equals(false) || status.equals("0"))){
					//result = "2";
					hm.put("firstname",Rsdata.getString("firstname"));
					hm.put("email",Rsdata.getString("email"));
					hm.put("regcode",Rsdata.getString("regcode"));
					hm.put("result","2");
				}
				else
				{
					// user found having email id activated
					//result = "3";
					hm.put("firstname",Rsdata.getString("firstname"));
					hm.put("email",Rsdata.getString("email"));
					hm.put("regcode",Rsdata.getString("regcode"));
					hm.put("result","3");
				}
			}
			
		}
		catch(SQLException ex)
		{
				
		}
		finally
		{
			if(closingNeeded)
			{
				dBUtils.closeConnection(connObj, stm, Rsdata);
			}
			else
				dBUtils.closeConnection(null, stm, Rsdata);
		}
		
	return hm;
	}
	
	/**
	 * This method is used to get user personal details based in regCode.
	 * @param userId regCode connObj 
     * @return String result
	 */
	public String getRecordOfUserBasedReg(String userId ,String regCode, Connection connObj)
	{
	   
	   String StrSql = "",status="",result="";
	   StrSql = "select * from user_data Where userid = '" + userId + "' and regcode = '" + regCode + "'";
	   //System.out.println(StrSql);
	   DatabaseUtils dBUtils = new DatabaseUtils();
		boolean closingNeeded = false;
		
		Statement stm = null;
		ResultSet Rsdata = null;
		try
		{
			if(connObj == null)
			{
			 connObj = dBUtils.getConnection();
			 closingNeeded = true;
			}
			stm = connObj.createStatement();
			Rsdata = stm.executeQuery(StrSql);
			if(!Rsdata.next())
			{
				result = "1";
				
				
		    }
			else{
				status = Rsdata.getString("status");
				//System.out.println(status);
				if(status.equals(false) || status.equals("0")){
					result = "2";
					
				}
				else
				{
					result = "3";
					
				}
			}
			
		}
		catch(SQLException ex)
		{
				
		}
		finally
		{
			if(closingNeeded)
			{
				dBUtils.closeConnection(connObj, stm, Rsdata);
			}
			else
				dBUtils.closeConnection(null, stm, Rsdata);
		}
		return result;

	}
	
	
	/**
	 * This method is used to update user status according to userId.
	 * @param userId connObj 
     * @return String result  0 or 1
	 */
	public String updateUserData(String userId, Connection connObj)
	{
	   
	   String StrSql = "",result="";
	   StrSql = "update user_data set status = 1 where UserId ='" + userId + "'";
	  // System.out.println(StrSql);
	   DatabaseUtils dBUtils = new DatabaseUtils();
		boolean closingNeeded = false;
		
		Statement stm = null;
		try
		{
			if(connObj == null)
			{
			 connObj = dBUtils.getConnection();
			 closingNeeded = true;
			}
			stm = connObj.createStatement();
			int res = stm.executeUpdate(StrSql);
			if(res ==1)
			{
				result = "1";
				
				
		    }
			else{
				result = "0";
			}
			
			//Rsdata.close();
		}
		catch(SQLException ex)
		{
				
		}
		finally
		{
			if(closingNeeded)
			{
				dBUtils.closeConnection(connObj, stm, null);
			}
			else
				dBUtils.closeConnection(null, stm, null);
		}
		return result;

	}
	
	/**
	 * This method is used to get user plan according to userId.
	 * @param userId connObj 
     * @return String result  0 or 1
	 */
	public String getPlanId(String userId)
	{
	   String StrSql = "",result="";
	   StrSql = "Select planid From tbl_userplandetail Where userid ='" + userId + "'";
	   
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Connection connObj = null;
	   
		Statement stm = null;
		ResultSet Rsdata = null;
		try
		{
			connObj = dBUtils.getConnection();
			stm = connObj.createStatement();
			Rsdata = stm.executeQuery(StrSql);
			if(Rsdata.next())
			{
				result = Rsdata.getString(1);
		    }
			else
			{
				result = "1";
			}
			
			
		}
		catch(SQLException ex)
		{
			result = "0" ;
			//System.exit(0);
		}
		finally
		{
			dBUtils.closeConnection(connObj, stm, Rsdata);
		}
	return result;
	}
	
	/**
	 * Punit: probably this description is incorrect -
	 * This method is used to find user chart limit weather it has reached up to 11 or not for a single chartID .
	 * @param userId chartid connObj 
     * @return boolean result
	 */
	public boolean matchinguseridandchartid(String userid,String chartid,Connection connObj){
       String sqlstr= "";
       boolean result=false;
       if(!chartid.equals("")){
	   //sqlstr = "Select * from tbl_chart where UserId = '"+ userid +"' and chartId = '"+ chartid +"' LIMIT 1" ;}
       sqlstr = "Select top 1 1 from tbl_chart where userid = '"+ userid +"' and chartid = '"+ chartid +"'";
              
       //System.out.println(sqlstr);
	   DatabaseUtils dBUtils = new DatabaseUtils();
		boolean closingNeeded = false;
		
		Statement stm = null;
		ResultSet Rsdata = null;
		try
		{
			if(connObj == null)
			{
			 connObj = dBUtils.getConnection();
			 closingNeeded = true;
			}
			stm = connObj.createStatement();
			Rsdata = stm.executeQuery(sqlstr);
			if(Rsdata.next())
			{
				result = true;
		    }
						
			
		}
		catch(SQLException ex)
		{
		}
		finally
		{
			if(closingNeeded)
			{
				dBUtils.closeConnection(connObj, stm, Rsdata);
			}
			else
				dBUtils.closeConnection(null, stm, Rsdata);
		}
       }
	return result;
	}
	/**
	 * This method is used to find user chart limit weather it has reached up to 11 .
	 * @param userId connObj 
     * @return String result 0 or 1
	 */
	public String matchinguserid(String userid,Connection connObj){
	       String sqlstr= "" ,result="";
           //sqlstr = "Select * from tbl_chart where UserId = '"+ userid +"' LIMIT 1, 1";
	       sqlstr = "select top 1 1 from tbl_chart where UserId= '" + userid + "'";
            // System.out.println(sqlstr);
		   DatabaseUtils dBUtils = new DatabaseUtils();
			boolean closingNeeded = false;
			
			Statement stm = null;
			ResultSet Rsdata = null;
			try
			{
				if(connObj == null)
				{
				 connObj = dBUtils.getConnection();
				 closingNeeded = true;
				}
				stm = connObj.createStatement();
				Rsdata = stm.executeQuery(sqlstr);
				if(Rsdata.next())
				{
					result = "1";
			    }
				else
				{
					result = "0";
				}
				
				
			}
			catch(SQLException ex)
			{
			}
			finally
			{
				if(closingNeeded)
				{
					dBUtils.closeConnection(connObj, stm, Rsdata);
				}
				else
					dBUtils.closeConnection(null, stm, Rsdata);
			}
		return result;
		}
	/**
	 * This method is used to find existence for userID.
	 * @param userId  
     * @return String val true 0 or false 1
	 */
	public String checkUserIdAvail(String userId)
	{
			DatabaseUtils dBUtils = new DatabaseUtils();
			Connection connObj = null;
		            
		    String sql = "select userid from user_data where userid = '" + userId + "'";
		    String val="";
		    Statement stm = null;
			ResultSet rsCheckId = null;
		    try
		    {
		    	connObj = dBUtils.getConnection();
		    	stm = connObj.createStatement();
		    	rsCheckId = stm.executeQuery(sql);
		    	if(rsCheckId.next())
		    	{
		    		val="0";
		    	}
		    	else
		    	{
		    		val="1";
		    	}
		    	
		    }
		    catch(SQLException ex)
		    {
		    	val = "false";
		    }
		    finally
		    {
		    	dBUtils.closeConnection(connObj, stm, rsCheckId);
		    }
			return val;
		} 
	
	/**
	 * This method is used to check for mailId existence or not.
	 * @param userEmailId  
     * @return String result return false if already exits or true if not exist.
	 */
	public String isEmailIdExist(String userEmailId)
	{
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		String str = "select top 1 1 from user_data where email = '" + userEmailId + "'";
		//System.out.println(str);
		String result= "true";
		Statement stm = null;
		ResultSet rs = null;
		try
		{
			connObj = dBUtils.getConnection();
			stm = connObj.createStatement();
			rs = stm.executeQuery(str);
			if(rs.next())
			{
				result="false";
			}
			rs.close();
			stm.close();
		}
		catch(SQLException ex)
		{
			result="";
		}
		finally
		{
			dBUtils.closeConnection(connObj, stm, rs);
		}
		return result;
	}

	/**
	 * This method is used to check for mailId existence or not for update.
	 * @param userId userEmailId  
     * @return String result return true if already exits or false if not exist.
	 */
	public String isEmailIdExistForUpdate(String userId, String userEmailId)
	{
		String result="true";
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		Statement stm = null;
		ResultSet rs = null;
		//System.out.println(userId+","+userEmailId+","+isEmailIdExist(userEmailId));
		try
		{
				if(isEmailIdExist(userEmailId).equals("false"))
				{
						connObj = dBUtils.getConnection();
						String str = "select top 1 1 from user_data where email = '" + userEmailId + "' And userid = '"+ userId +"'";
						//System.out.println(str);
						stm = connObj.createStatement();
						rs = stm.executeQuery(str);
						if(rs.next())
						{
							result = "true";
						}
						else{
							result = "false";
						}
						rs.close();
						stm.close();
					}
			}
			catch(SQLException ex)
			{
				result="";
			}
			finally
			{
				dBUtils.closeConnection(connObj, stm, rs);
			}
		
		return result;
	}
	
	/**
	 * This method is invoked when user signs up for first time. Default planId (1) is set up.
	 * @param userid pass fname email mobileno category regcode regsource 
       @return String val 1 if planId is set 1 otherwise 0.
	 */
	public String signUpData(String userid,String pass,String fname,String email,String mobileno,String category,String regcode,String regsource)
	{
		Calendar jCal = Calendar.getInstance();
		
		int day = jCal.get(Calendar.DATE);
		int month = jCal.get(Calendar.MONTH)+1;
		int year = jCal.get(Calendar.YEAR);
	    int currHour =  jCal.get(Calendar.HOUR_OF_DAY);
	    int currMin =   jCal.get(Calendar.MINUTE);
	    int currSec = 	jCal.get(Calendar.SECOND);
		String val="0";
	    String strsql = "INSERT INTO user_data (userid,password, firstname, day, month, year, hrs,"+ 
	            "min, sec, email, mobile,category, regcode,regsource, status)"+
	                     " values('" + userid + "','" + pass + "',"+
	                     "'" + fname + "','"+ day +"','"+ month +"','"+ year +"','" + currHour + "','" + currMin + "','" + currSec + "'," +
	                     "'" + email + "','" + mobileno + "','" + category + "','" + regcode + "','" + regsource + "',0)";
	   // System.out.println(strsql);
	    
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		Statement stm = null;
		try
		{
			connObj = dBUtils.getConnection();
			stm = connObj.createStatement();
			stm.executeUpdate(strsql);
			strsql = "";
			strsql = "Insert into tbl_userplandetail(planId,UserId)"+
				                " Values('1','"+ userid +"')";
			//System.out.println(strsql);
			stm.close();
			stm = connObj.createStatement();
			int v = stm.executeUpdate(strsql);
			
			
			if(v>0)
			{
				val ="1";
			}
			else
			{
				val = "0";
			}
		}
		catch(SQLException ex)
		{
			val="";
		}
		finally
		{
			
			dBUtils.closeConnection(connObj, stm, null);
		}
	    return val;
	}
	
	/**
	 * This method is used to update user emailId. .
	 * @param emailId userId regCode 
       @return String result
	 */
	   public String updateUserEmailId(String emailId, String userId,String regCode){
	   String result ="";
	   String sqlupdateemailid = "Update user_data Set email = '"+ emailId +"', regcode = '"+ regCode +"', status = 0 Where userid = '"+ userId +"'";
	   //System.out.println(sqlupdateemailid);
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Connection connObj = null;
	   Statement stm = null;
		ResultSet rs = null;
		try
		{
			connObj = dBUtils.getConnection();
			stm = connObj.createStatement();
			int rsupdateemailid = stm.executeUpdate(sqlupdateemailid);
			if(rsupdateemailid==1)
			{
				result = ConstantValues.EMAILIDUPDATEDSUCCESSFULLY;
		    }
			else
			{
				result = ConstantValues.EMAILIDUPDATIONFAILED;
			}
			
			
		}
		catch(SQLException ex)
		{
		}
		finally
		{
			dBUtils.closeConnection(connObj, stm, null);
		}
	return result;
	   }
	   
	   /**
		 * This method is used to update user personal details. .
		 * @param  userId regCode 
	       @return String result
		 */
	   public String updateregcode (String userId,String regCode){
		   String result ="";
		   String sqlupdateregcode = "Update user_data Set regcode = '"+ regCode +"' Where userid = '" + userId + "'";
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   Statement stm = null;
			try
			{
				connObj = dBUtils.getConnection();
				stm = connObj.createStatement();
				int rsupdateemailid = stm.executeUpdate(sqlupdateregcode);
				if(rsupdateemailid==1)
				{
					result = ConstantValues.EMAILIDUPDATEDSUCCESSFULLY;
			    }
				else
				{
					result = ConstantValues.EMAILIDUPDATIONFAILED;
				}
				
				
			}
			catch(SQLException ex)
			{
			}
			finally
			{
				dBUtils.closeConnection(connObj, stm, null);
			}
		return result;
		   }
	   
	   /**
		 * This method is used to update updateStatusNull .
		 * @param  userId  
	       @return String result
		 */
	   public String updateStatusNull(String userId){
	   String result ="";
	   String upStatusStr = "Select Top 1 1 From updatestatusnull Where userid = '"+ userId +"' And iscurrentlyverified <> 1";
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Connection connObj = null;
	  		
		Statement stm = null;
		ResultSet rs = null;
		try
		{
			connObj = dBUtils.getConnection();
			stm = connObj.createStatement();
			rs = stm.executeQuery(upStatusStr);
			if(rs.next())
			{
				result = "1";
		    }
			else
			{
				result = "0";
			}
			
			
		}
		catch(SQLException ex)
		{
		}
		finally
		{
			dBUtils.closeConnection(connObj, stm, rs);
		}
	return result;
	   }
	   
	   /**
		 * This method is used to update oldUserStatus .
		 * @param  userId  
	       @return String result
		 */
	   public String updateUserOldUsersStatus(String userId){
       String result ="";
	   String sqlupdate = "Update updatestatusnull Set iscurrentlyverified = 1 Where userid = '"+ userId +"'";
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Connection connObj = null;
	   
		Statement stm = null;
		try
		{
			connObj = dBUtils.getConnection();
			stm = connObj.createStatement();
			int rsupdateemailid = stm.executeUpdate(sqlupdate);
			if(rsupdateemailid==1)
			{
				result = ConstantValues.EMAILIDUPDATEDSUCCESSFULLY;
		    }
			else
			{
				result = ConstantValues.EMAILIDUPDATIONFAILED;
			}
			
			
		}
		catch(SQLException ex)
		{
		}
		finally
		{
			dBUtils.closeConnection(connObj, stm, null);
		}
	return result;
	   }
	   /**
		 * This method is used to load the chart according to Chart ID .
		 * @param  userId  
	       @return HashMap hm
		 */
	   public HashMap<String, Object> getChart(String chartId)
	   {
		   HashMap<String, Object> hm = new HashMap<String, Object>();
	   
		   DesktopHoro horoObject = new DesktopHoro();
	   
		   String sql = "Select * From tbl_chart Where chartid = '"+chartId+"'";
			//System.out.println(sql);
			Statement stmt = null;
		    ResultSet rs = null;
		    DatabaseUtils dbUtils = new DatabaseUtils();
		    Connection connObj = null;
		    try
		    {
		    	connObj = dbUtils.getConnection();
		      stmt = connObj.createStatement();
		      rs = stmt.executeQuery(sql);
		      if(rs.next())
		      {
		    	  horoObject.setName(rs.getString("PName"));
		    	  horoObject.setMaleFemale(rs.getString("Sex"));
		    	  horoObject.setDayOfBirth(rs.getString("Day"));
		    	  horoObject.setMonthOfBirth(rs.getString("Month"));
		    	  horoObject.setYearOfBirth(rs.getString("Year"));
		    	  horoObject.setHourOfBirth(rs.getString("Hr"));
		    	  horoObject.setMinuteOfBirth(rs.getString("Min"));
		    	  horoObject.setSecondOfBirth(rs.getString("Sec"));
		    	  horoObject.setDST(rs.getString("DST"));
		    	  horoObject.setPlace(rs.getString("Place"));
		    	  horoObject.setDegreeOfLongitude(rs.getString("LongDeg"));
		    	  horoObject.setMinuteOfLongitude(rs.getString("LongMin"));
		    	  horoObject.setEastWest(rs.getString("LongEW"));
		    	  horoObject.setDegreeOfLattitude(rs.getString("LatDeg"));
		    	  horoObject.setMinuteOfLattitude(rs.getString("LatMin"));
		    	  horoObject.setNorthSouth(rs.getString("LatNS"));
		    	  horoObject.setTimeZone(rs.getString("TimeZone"));
		    	  horoObject.setAyan(rs.getInt("ayanamsa"));
		    	  horoObject.setKPHorarySeed(rs.getInt("kphn"));
		    	  hm.put("HoroObject", horoObject);
		    	  hm.put("Charting", rs.getString("ChartType"));
		      }
		    }
		    catch(SQLException sqle)
		    {
		    	sqle.printStackTrace();
		    	
		    }
		    finally
		    {
		    	dbUtils.closeConnection(connObj, stmt, rs);
		    }
		   return hm;
	   }
	   
	   /**
		 * This method is used to load the chart according to user and Chart ID .
		 * @param  userId chartId
	       @return HashMap hm
		 */
	   public HashMap<String, Object> getUserChart(String userId, String chartId)
	   {
		   HashMap<String, Object> hm = new HashMap<String, Object>();
	   
		   DesktopHoro horoObject = new DesktopHoro();
	   
		   String sql = "Select * From tbl_chart Where userid = '"+userId+"' and chartid = '"+chartId+"'";
			//System.out.println(sql);
			Statement stmt = null;
		    ResultSet rs = null;
		    DatabaseUtils dbUtils = new DatabaseUtils();
		    Connection connObj = null;
		    try
		    {
		    	connObj = dbUtils.getConnection();
		      stmt = connObj.createStatement();
		      rs = stmt.executeQuery(sql);
		      if(rs.next())
		      {
		    	  horoObject.setName(rs.getString("PName"));
		    	  horoObject.setMaleFemale(rs.getString("Sex"));
		    	  horoObject.setDayOfBirth(rs.getString("Day"));
		    	  horoObject.setMonthOfBirth(rs.getString("Month"));
		    	  horoObject.setYearOfBirth(rs.getString("Year"));
		    	  horoObject.setHourOfBirth(rs.getString("Hr"));
		    	  horoObject.setMinuteOfBirth(rs.getString("Min"));
		    	  horoObject.setSecondOfBirth(rs.getString("Sec"));
		    	  horoObject.setDST(rs.getString("DST"));
		    	  horoObject.setPlace(rs.getString("Place"));
		    	  horoObject.setDegreeOfLongitude(rs.getString("LongDeg"));
		    	  horoObject.setMinuteOfLongitude(rs.getString("LongMin"));
		    	  horoObject.setEastWest(rs.getString("LongEW"));
		    	  horoObject.setDegreeOfLattitude(rs.getString("LatDeg"));
		    	  horoObject.setMinuteOfLattitude(rs.getString("LatMin"));
		    	  horoObject.setNorthSouth(rs.getString("LatNS"));
		    	  horoObject.setTimeZone(rs.getString("TimeZone"));
		    	  horoObject.setAyan(rs.getInt("Ayanamsa"));
		    	  horoObject.setKPHorarySeed(rs.getInt("kphn"));
		    	  hm.put("HoroObject", horoObject);
		    	  hm.put("Charting", rs.getString("ChartType"));
		      }
		    }
		    catch(SQLException sqle)
		    {
		    	sqle.printStackTrace();
		    	
		    }
		    finally
		    {
		    	dbUtils.closeConnection(connObj, stmt, rs);
		    }
		   return hm;
	   }

	   /**
		 * This method is used to update user personal details.
		 * @param  userid pass fname email mobno category regcode 
		   @return String result true if successfully updated otherwise false
		 */
public String updateprofile(String userid,String pass,String fname,String email,String mobno,String category,String regcode,String maritalStatus,String occupation){
		    Calendar jCal = Calendar.getInstance();
			
			int day = jCal.get(Calendar.DATE);
			int month = jCal.get(Calendar.MONTH)+1;
			int year = jCal.get(Calendar.YEAR);
			int currHour =  jCal.get(Calendar.HOUR_OF_DAY);
		    int currMin =   jCal.get(Calendar.MINUTE);
		    int currSec = 	jCal.get(Calendar.SECOND);
		    int rsupdate = 0;
		    //If recieve password is match with encryptedPassword password then set this isPasswordNeddToUpdated variable false
		    //and there is no need to update the user password 
		    String encryptedPassword="encryptedPassword";
		    boolean isPasswordNeddToUpdated=true;
		    if(pass.equals(encryptedPassword)){
		    	isPasswordNeddToUpdated=false;
		    }
		    //******************End*******************************
		   String existingemail ="",result="";
		   boolean Sendverificationemail = false;
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   String sqlQuery = "Select email From user_data Where userid = '"+ userid +"'";
		   
			Statement stm = null;
			ResultSet rsCheck = null;
			try
			{
				connObj = dBUtils.getConnection();
				stm = connObj.createStatement();
				rsCheck = stm.executeQuery(sqlQuery);
				if(rsCheck.next())
				{
					existingemail = rsCheck.getString("email");
			    }
				rsCheck.close();
				if(!existingemail.equals(email)){
		        Sendverificationemail = true;
				}
				String sqlSend ="Update user_data set";
				if(isPasswordNeddToUpdated){
					sqlSend=sqlSend+" password='"+ pass +"',";
				}
				sqlSend=sqlSend+" firstname=N'"+ fname +"', day='"+day+"',month='"+month+"',year='"+
					            year+"',hrs='"+ currHour +"',min='"+ currMin +"',"+
					            " sec='"+ currSec +"', email='"+ email +"', mobile='"+ mobno +"',"+
					            "maritalstatus='"+maritalStatus+"',occupation='"+occupation+"',"+
					            " category='"+ category +"'";
				if(Sendverificationemail){
					sqlSend = sqlSend+",regcode='"+ regcode +"', status = 0 Where userid = '"+ userid + "'";
				}
				else
				{
					sqlSend = sqlSend+" Where userid = '"+ userid + "'";
				}
				
				try
				{
					rsupdate = stm.executeUpdate(sqlSend);
				}
				catch(SQLException ex)
				{
				}
				
				 if(Sendverificationemail){
					        result = ConstantValues.UPDATION_SUCCESSFULL_SEND_EMAIL;
				 }else{
					        result = String.valueOf(rsupdate);
				 }
				
			}
		
		catch(SQLException ex)
		{
		}
			
		finally
		{
			dBUtils.closeConnection(connObj, stm, rsCheck);
		}
			return result;
	   }
/**
 * This method is used to update or insert the platinum plan user address details
 * @param  userid pass company name address1 address2 companylogourl 
   @return String result true if successfully updated otherwise false
 */
public String insertOrUpdateCloudPlanDetails(String userid,String companyName,String address1,String address2,String companyLogoUsr){
    
   int rsupdate = 0;
   String existingemail ="",result="";
   String sqlSend="";
   
   DatabaseUtils dBUtils = new DatabaseUtils();
   Connection connObj = null;
   String sqlQuery = "Select * From tbl_CloudPlanPartnersDetails Where UserId = '"+ userid +"'";
   
	Statement stm = null;
	ResultSet rsCheck = null;
	try
	{
		connObj = dBUtils.getConnection();
		stm = connObj.createStatement();
		rsCheck = stm.executeQuery(sqlQuery);
		if(rsCheck.next())
		{
			 sqlSend ="update tbl_CloudPlanPartnersDetails set CompanyName=N'"+companyName+"',AddressLine1=N'"+address1+"',AddressLine2=N'"+address2+"' where UserId='"+userid+"'";
	    }
		else{
			 sqlSend ="Insert Into tbl_CloudPlanPartnersDetails(UserId, CompanyName, AddressLine1, AddressLine2, CompanyLogoImageURL) "+
		               "Values('"+userid+"',N'"+companyName+"',"+
		               "N'"+address1+"',N'"+address2+"',"+
		               "'"+companyLogoUsr+"')" ;
		}
		rsCheck.close();
		
		rsupdate = stm.executeUpdate(sqlSend);
		
		 if(rsupdate>0){
			        result = ConstantValues.UPDATED_SUCCESSFULLY;
		 }else{
			        result = ConstantValues.UPDATION_UNSUCCESSFULL;
		 }
		
	}

		catch(SQLException ex)
		{
			ex.printStackTrace();
		}
	
finally
{
	
	dBUtils.closeConnection(connObj, stm, rsCheck);
}
	return result;
}

/**
 * This method is used to save user feedback details.
 * @param   name email phno msg 
   @return String val 1 if successfully saved otherwise 0
 */
	   public String getfeedbackdata(String name ,String email,String phno,String msg)
	   {
		   String StrSql = "",val="";
           StrSql = "insert into feedback (name,email, phone, message) values('" + name + "','" + email + "',"+
	                     "'" + phno + "','"+ msg+"')";
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   
		   	Statement stm = null;
			try
			{
				connObj = dBUtils.getConnection();
				stm = connObj.createStatement();
                int v = stm.executeUpdate(StrSql);
				stm.close();

				if(v>0)
				{
					val ="1";
				}
				else
				{
					val = "0";
				}
			}
			
			
			catch(SQLException ex)
			{
				val = "";	
			}
			finally
			{
				dBUtils.closeConnection(connObj, stm, null);
			}
			
		return val;
	   }
	   
	   /**
	    * This method is used to delete user Chart according to chartId.
	    * @param  deleteChartId loggedInUserId 
          @return String return Val 1 if successfully deleted otherwise 0
	    */
	   public String deleteChart(String deleteChartId, String loggedInUserId)
	   {
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   Statement stmt = null;
		   ResultSet rs = null;
		   
		   String sql = "select userid from tbl_chart where chartid = '"+deleteChartId+"'";
		   
		   String returnVal = "";
		  // String StrSql = "select count(*) from tbl_chart a inner join tbl_chart b where a.userid = b.userid and b.chartid = '"+ deleteChartId +"'";
		   
		   String StrSql = "Select count(*) as totalrecords from tbl_chart where userid = '"+loggedInUserId+
           "'";
		   ResultSet rsrowcount = null;
		   
			try
			{
				connObj = dBUtils.getConnection();
				String returnedUserId = "";
				stmt = connObj.createStatement();
                rs = stmt.executeQuery(sql);
				if(rs.next())
				{
					returnedUserId = rs.getString("userid");
					
				}
				stmt.close();
				rs.close();
				if(returnedUserId.equals(loggedInUserId))
				{
					int noOfRecords = 0;
					stmt = connObj.createStatement();
	                rs = stmt.executeQuery(StrSql);
					if(rs.next())
					{
						noOfRecords = rs.getInt(1);
					}
					if(noOfRecords == 1)
					{
						returnVal = "4";//CONDITION_FAILED
					}
					else
					{
						String userId = "";
						StrSql = "Select userid from tbl_chart where isdefault = 1 and chartid = "+deleteChartId;
						rs = stmt.executeQuery(StrSql);
						if(rs.next())
						{
							userId = rs.getString(1);
						}
						String nextChartId = "";
						StrSql = "Select top 1 chartid from tbl_chart where userid = '"+userId+
	                            "' And chartid Not in ('"+ deleteChartId +"')";
						rs = stmt.executeQuery(StrSql);
						if(rs.next())
						{
							nextChartId = rs.getString(1);
						}
						rs.close();
						StrSql = "Update tbl_chart set isdefault = 1 Where chartid = '"+nextChartId+"'";
						stmt.executeUpdate(StrSql);
		                StrSql = "delete from tbl_chart where chartid = '"+deleteChartId+"'";
		                stmt.execute(StrSql);
		                        
		                rsrowcount = stmt.executeQuery("Select @@rowcount");
		                if(rsrowcount.next())
		                {
		                	if(rsrowcount.getInt(1) == 1)
		                	{
		                		returnVal = "1";//DELETION_SUCCESSFUL
		                	}
		                }
		                else
		                {
		                	returnVal = "0";//DELETION_FAILED
		                }
					}
				}
				else
                {
                	returnVal = "2";//Not Authorized
                }
			}
			
			catch(SQLException ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				dBUtils.closeConnection(connObj, stmt, rs);
				dBUtils.closeConnection(null, null, rsrowcount);
			}
			
			
		return returnVal;
	   }
	   /**
	    * This method is used to find getTagValue according to chartID.
	    * @param  chartid
          @return Result String returnValue
	    */
	   public String getTagValue(String chartId)
	   {
		   String returnValue = "0";
		   
		   String sql = "Select tags From tbl_chart Where chartid = '"+chartId+"'";
			//System.out.println(sql);
			Statement stmt = null;
		    ResultSet rs = null;
		    DatabaseUtils dbUtils = new DatabaseUtils();
		    Connection connObj = null;
		    try
		    {
		    	connObj = dbUtils.getConnection();
		      stmt = connObj.createStatement();
		      rs = stmt.executeQuery(sql);
		      if(rs.next())
		      {
		    	  returnValue = rs.getString(1);
		      }
		      else
		      {
		    	  returnValue = "1";
		      }
		    }
		    catch(SQLException sqle)
		    {
		    	sqle.printStackTrace();
		    	
		    }
		    finally
		    {
		    	dbUtils.closeConnection(connObj, stmt, rs);
		    }
		   return returnValue;
	   }
	   /**
	    * This method is used to find chart name availability according to chartName and chartID.
	    * @param  chartname chartid
          @return String result 1 if available otherwise 0
	    */
	   public String checkchartnameavailability(String chartname,String chartid){
		   String StrSql = "";
		   String result = "0";
		   
		   StrSql = "Select chartname from tbl_chart where ChartName = N'" + chartname + "' and +chartid != '"+ chartid +"'";
		             
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   
		    Statement stm = null;
			ResultSet rs = null;
		   try
			{
			   connObj = dBUtils.getConnection();
				stm = connObj.createStatement();
				rs = stm.executeQuery(StrSql);
				if(!rs.next())
				{
					result = "1";
					//System.out.print("available");
			    }
				else
				{
					result = "0";
				}
				
				
			}
			catch(SQLException ex)
			{
			}
			finally
			{
				dBUtils.closeConnection(connObj, stm, rs);
			}
		   return result;
	   }
	   /**
	    * This method is used to update chart shate setting name according to chartName and chartID.
	    * @param  chartname chartid
          @return String result
	    */
	   public String updateChartShareSettings(String chartname,String chartid){
		   
		   String StrSql = "";
		   String result = "0";
		   
		   StrSql = "Update tbl_chart Set ChartName = N'"+ chartname +"' where chartid = '"+ chartid+"'";
		   
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   
		   Statement stm = null;
			
		   try
			{
			   connObj = dBUtils.getConnection();
				stm = connObj.createStatement();
				 int v = stm.executeUpdate(StrSql);
				 

					if(v>0)
					{
						result ="1";
					}
					else
					{
						result = "2";
					}
				}
		      catch(SQLException ex)
			{
		    	  result = "0";	
		    	  ex.printStackTrace();
			}
			finally
			{
				dBUtils.closeConnection(connObj, stm, null);
			}
		   
		   return result;
		   
	   }
	   /**
	    * This method is used to get a public Chart name according to chartID.
	    * @param  chartid
          @return String result
	    */
	   public String publicChartName(String chartid){
		   String StrSql = "";
		   String result = "";
		   
		   StrSql = "Select ChartName from tbl_chart where chartId = '"+ chartid +"'";
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   
		   Statement stm = null;
			ResultSet rs = null;
		   try
			{
			   connObj = dBUtils.getConnection();
				stm = connObj.createStatement();
				rs = stm.executeQuery(StrSql);
				if(rs.next())
				{
					result =rs.getString("ChartName");
			    }
				else
				{
					result = "";
				}
				
				
			}
			catch(SQLException ex)
			{
			}
			finally
			{
				dBUtils.closeConnection(connObj, stm, rs);
			}
		   return result;
		   
	   }
	   /**
	    * This method is used to get a random Chart according to username and year of birth.
	    * @param  username yob 
          @return String result
	    */
	   public String getrandomchartname(String username,String yob){
		   String result = "",isnamesplited="",suggestedchartname="";
		   String[] username1 = new String[5];
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   		   
		   if(username.equals("") || yob.equals(""))
		   {
			   result = "0" ;
		   }
		   else
		   {        
	        if(username.contains(" "))
	        {
	        	isnamesplited = "1";
	        	username1 = username.split(" ");
	        	suggestedchartname = username1[0];
	        }
	        else
	        {
	        	isnamesplited = "0"; 
	        	username1[0] = username;
	        	suggestedchartname = username;
	        }
			String StrSql = "Select * from tbl_chart where ChartName = '"+ suggestedchartname +"'  LIMIT 1,1" ;
			Statement stm = null;
			ResultSet rs = null;
			ResultSet rs1 = null;
			ResultSet rs2 = null;
			try
			{
				connObj = dBUtils.getConnection();
				stm = connObj.createStatement();
				rs = stm.executeQuery(StrSql);
				if(rs.next())
				{
					//result =rs.getString("ChartName");
					if(isnamesplited.equals("0")) {
				    suggestedchartname = username+yob;
					}else{
				     suggestedchartname = username1[0]+username1[1];
					}
					rs.close();
					String StrSql1 = "Select * from tbl_chart where ChartName = '"+ suggestedchartname +"'LIMIT 1,1";
					try
					{
						
						rs1 = stm.executeQuery(StrSql1);
						if(rs1.next())
						{
							suggestedchartname = username1[0]+yob;
							rs1.close();
					        String StrSql2 = "Select * from tbl_chart where ChartName = '"+ suggestedchartname +"'LIMIT 1,1";
					        try
					        {
								rs2 = stm.executeQuery(StrSql2);
								if(rs2.next())
								{
									result ="";
							    }
								else
								{
									result = suggestedchartname;
								}
								
								stm.close();
							}
							catch(SQLException ex)
							{
							}
					    }
						else
						{
							result = suggestedchartname;
						}
					
						stm.close();
					}
					catch(SQLException ex)
					{
					}
			    }
			
				else
				{
					result = username1[0];
				}
			
				
				stm.close();
			}
			catch(SQLException ex)
			{
			}
			   
			   finally
				{
				   dBUtils.closeConnection(connObj, stm, rs);
				   dBUtils.closeConnection(null, null, rs1);
				   dBUtils.closeConnection(null, null, rs2);
				   
				}
	   }
		
		    
		   return result;
		   
	   }
	   /**
	    * This method is used to mark a chart userDefaultChart according to chartId and userId.
	    * @param  userId chartId 
          @return String returnValue Val 1 if chart set sd default otherwise 0
	    */
	   public String markDefaultChart(String userId, String chartId)
	   {
		   String returnValue = "";
		   String query = "select * from tbl_chart where userId = '"+userId+"' and chartId = '"+chartId+"'";
		   DatabaseUtils dBUtils = new DatabaseUtils();
		   Connection connObj = null;
		   Statement stmt = null;
		   ResultSet rs = null;
		   try
			{
			   connObj = dBUtils.getConnection();
				stmt = connObj.createStatement();
				rs = stmt.executeQuery(query);
				if(rs.next())
				{
					query = "update tbl_chart set IsDefault = 0 where userId = '"+userId + "'";
					int isUpdated = stmt.executeUpdate(query);
					if(isUpdated > 0)
					{
						query = "update tbl_chart set IsDefault = 1 where userId = '"+userId + "' and chartId = '"+chartId+"'";
						isUpdated = stmt.executeUpdate(query);
						returnValue = "1";
					}
					else
					{
						returnValue = "2";
					}
				}
				else
				{
					returnValue = "0";
				}
			}
		   catch(SQLException sqle)
		   {
			   sqle.printStackTrace();
		   }
		   finally
		   {
			   dBUtils.closeConnection(connObj, stmt, rs);
		   }
		   return returnValue;
	   }
	   
	   }
