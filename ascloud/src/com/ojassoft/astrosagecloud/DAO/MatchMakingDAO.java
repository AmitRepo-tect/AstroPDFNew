package com.ojassoft.astrosagecloud.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MatchMakingDAO 
{
	public String getMatchMakingVal(String category,int intForBoy,int intForGirl,int languageCode)
	{
		String langPred = " Val ";
		if(languageCode == 1)
		{
			langPred = " ValH ";
		}
		else if(languageCode == 2)
		{
			langPred = " ValTamil ";
		}
		String matchMakingPred = "";
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		String strsql = "Select "+langPred+" as predVal From MatchMaking Where Category ='" + category + "'" + 
		" And BoyVal=" + intForBoy  + " And GirlVal=" + intForGirl;
		Statement stmt = null;
		ResultSet rs = null;
		try
		{
			connObj = dBUtils.getConnection();
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(strsql);
			if(rs.next())
			{
				matchMakingPred = rs.getString("predVal");
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
		return matchMakingPred;
	}
}
