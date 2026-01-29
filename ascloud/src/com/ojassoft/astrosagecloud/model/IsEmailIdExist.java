package com.ojassoft.astrosagecloud.model;

import com.ojassoft.astrosagecloud.DAO.*;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IsEmailIdExist {
	/**
	 * This method is used to check weather EmailId is exits or not.
	 * @param userEmailId
	 * @return String result true if exist in data otherwise false 
	 */
	public String isEmailIdExist(String userEmailId)
	{
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		Statement stm = null;
		ResultSet rs = null;
		String str = "select 1 from user_data where email = '" + userEmailId + "' limit 1";
		String result= "true";
		try
		{
			connObj = dBUtils.getConnection();
			 stm = connObj.createStatement();
			 rs = stm.executeQuery(str);
			if(!rs.next())
			{
				result="false";
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
	 * This method is used to check weather EmailId is available or not for update With Passed MailId.
	 * @param userId userEmailId
	 * @return String result true if available for update otherwise false 
	 */
	public String isEmailIdExistForUpdate(String userId, String userEmailId)
	{
		String result="true";
		if(isEmailIdExist(userEmailId).equals("true"))
		{
			DatabaseUtils dBUtils = new DatabaseUtils();
			Connection connObj = null;
			try
			{
				connObj = dBUtils.getConnection();
				String str = "select 1 from user_data where email = '" + userEmailId + "' And userid = '"+ userId +"' limit 1";
				Statement stm = connObj.createStatement();
				ResultSet rs = stm.executeQuery(str);
				if(rs.next())
				{
					result = "false";
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
				dBUtils.closeConnection(connObj, null, null);
			}
		}
		else
		{
			result = "false";
		}
		return result;
	}

}
