package com.ojassoft.astrosagecloud.model;

import com.ojassoft.astrosagecloud.DAO.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.Calendar;;

public class SignUpUser {
	/**
	 * This method is called from signup page by cliking on Create My Account button to save to user details in database.
	 * @param userid pass fname email mobileno category regcode regsource 
     * @return String val 1 if successfully sign up otherwise 0 
	 */
	public String signUpData(String userid,String pass,String fname,String email,String mobileno,String category,String regcode,String regsource)
	{
		Calendar jCal = Calendar.getInstance();
		
		int day = jCal.get(Calendar.DATE);
		int month = jCal.get(Calendar.MONTH);
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
			Statement stm1 = connObj.createStatement();
			int v = stm1.executeUpdate(strsql);
			
			stm1.close();
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
	
}
