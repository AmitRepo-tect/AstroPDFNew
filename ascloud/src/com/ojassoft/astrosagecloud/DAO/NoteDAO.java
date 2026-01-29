package com.ojassoft.astrosagecloud.DAO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * This class is used to save and update and display user note .
 */
public class NoteDAO {
	/**
	 * This method is used to update the user note .
	 * @param notes chartid
	 * @return - int value 0 or 1.
	 */
public int updatenotes(String notes , int chartid)
{
	
	int x=0;
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	Statement stmt = null;
	String strsql = "Update tbl_Chart Set UserComments = N'"+notes.trim()+"'  Where ChartId ="+chartid+"";
	//System.out.print("sql string+++++++++++++++++"+strsql);
	try{
		connObj = dBUtils.getConnection();
	stmt = connObj.createStatement();
	x = stmt.executeUpdate(strsql);
	}
	catch(Exception e)
	{
		e.printStackTrace();
		//System.out.print("sql string+++++++++++++++++"+strsql);
	}
	finally
	{
		dBUtils.closeConnection(connObj, stmt, null);
	}
	return x;
}
/**
 * This method is used to get the user note .
 * @param  chartid
 * @return - String having user notes.
 */
public String getnotes(int chartid)
{
	String comment = "";
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	String sqlQuery = "Select UserComments From tbl_Chart Where ChartId ="+chartid+"";
	Statement stmt = null;
	ResultSet rs = null;
	try
	{
		connObj = dBUtils.getConnection();
		stmt = connObj.createStatement();
		rs = stmt.executeQuery(sqlQuery);
		if(rs.next())
		{
				comment += rs.getString(1);
			
		
		}
		
	}
	catch(SQLException ex)
	{
			ex.printStackTrace();
	}
	finally
	{
		dBUtils.closeConnection(connObj, stmt, rs);
	}
	return comment;
}

}
