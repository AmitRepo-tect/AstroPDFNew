package com.ojassoft.astrosagecloud.model;

import com.ojassoft.astrosagecloud.DAO.DatabaseUtils;
import com.ojassoft.astrosagecloud.DAO.*;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class CheckUserIdAvail {
	
	/**
	 * This method is used to check weather userID is available or not.
	 * @param userId
	 * @return String val 0 if exist in data otherwise 1 
	 */	
public String checkUserIdAvail(String userId)
{
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		Statement stm = null;
		ResultSet rsCheckId = null;        
	    String sql = "select userid from user_data where userid = '" + userId + "'";
	    String val="";
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
}