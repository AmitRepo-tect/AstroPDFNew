package com.ojassoft.astrosagecloud.DO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.HashMap;

import com.ojassoft.astrosagecloud.DAO.DatabaseUtils;
import com.ojassoft.astrosagecloud.util.ConstantValues;

public class UserData {
	public HashMap<String, String> getRecordOfUser(String userId ,String passWord, Connection connObj)
	{
	   HashMap<String, String> hm = new HashMap<String, String>();
	   String StrSql = "",status="";
	   if(!passWord.equals("")){
	   StrSql = "select * from user_data Where userid = '" + userId + "' and password = '" + passWord + "'";
	   }
	   else
	   {
		StrSql = "select * from user_data Where userid = '" + userId + "'";
	   }
	   DatabaseUtils dBUtils = new DatabaseUtils();
	    Statement stm = null;
		ResultSet Rsdata = null;
		boolean closingNeeded = false;
		
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
				hm.put("email","");
				hm.put("result","1");
				hm.put("regcode","");
				
		    }
			else{
				status = Rsdata.getString("status");
				//System.out.println(status);
				if(status.equals(false) || status.equals("0")){
					//result = "2";
					hm.put("firstname",Rsdata.getString("firstname"));
					hm.put("email",Rsdata.getString("email"));
					hm.put("regcode",Rsdata.getString("regcode"));
					hm.put("result","2");
				}
				else
				{
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
	
	public String getRecordOfUserBasedReg(String userId ,String regCode, Connection connObj)
	{
	   
	   String StrSql = "",status="",result="";
	   StrSql = "select * from user_data Where userid = '" + userId + "' and regcode = '" + regCode + "'";
	   //System.out.println(StrSql);
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Statement stm = null;
	   ResultSet Rsdata = null;
		boolean closingNeeded = false;
		
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
	
	public String updateUserData(String userId, Connection connObj)
	{
	   
	   String StrSql = "",result="";
	   StrSql = "update user_data set status = 1 where UserId ='" + userId + "'";
	  // System.out.println(StrSql);
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Statement stm = null;
	   boolean closingNeeded = false;
		
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
	public String getPlanId(String userId,Connection connObj)
	{
	   String StrSql = "",result="";
	   StrSql = "Select planid From tbl_userplandetail Where userid ='" + userId + "'";
	   
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Statement stm = null;
	   ResultSet Rsdata = null;
		boolean closingNeeded = false;
		
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
				result = Rsdata.getString(0);
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
			if(closingNeeded)
			{
				dBUtils.closeConnection(connObj, stm, Rsdata);
			}
			else
				dBUtils.closeConnection(null, stm, Rsdata);
		}
	return result;
	}
	
	public String matchinguseridandchartid(String userid,String chartid,Connection connObj){
       String sqlstr= "" ,result="";
       if(!chartid.equals("")){
	   sqlstr = "Select * from tbl_Chart where UserId = '"+ userid +"' and chartId = '"+ chartid +"' LIMIT 1, 1" ;}
       else
       {
    	sqlstr = "Select * from tbl_Chart where UserId = '"+ userid +"' LIMIT 1, 1";
       }
       DatabaseUtils dBUtils = new DatabaseUtils();
       Statement stm = null;
	   ResultSet Rsdata = null;
		boolean closingNeeded = false;
		
		try
		{
			if(connObj == null)
			{
			 connObj = dBUtils.getConnection();
			 closingNeeded = true;
			}
			 stm = connObj.createStatement();
			 Rsdata = stm.executeQuery(sqlstr);
			if(!Rsdata.next())
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
	public String isEmailIdExist(String userEmailId)
	{
		DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		Statement stm = null;
		ResultSet rs = null;
		String str = "select 1 from user_data where email = '" + userEmailId + "' limit 1";
		//System.out.println(str);
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
			
			connObj = dBUtils.getConnection();
			if(isEmailIdExist(userEmailId).equals("false"))
			{
				
				
				String str = "select 1 from user_data where email = '" + userEmailId + "' And userid = '"+ userId +"' limit 1";
				//System.out.println(str);
				 stm = connObj.createStatement();
				 rs = stm.executeQuery(str);
				if(rs.next())
				{
					result = "false";
				}
				
			}
			else
			{
				result = "false";
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
	
	   public String updateUserEmailId(String emailId, String userId,String regCode){
	   String result ="";
	   String sqlupdateemailid = "Update user_data Set email = '"+ emailId +"', regcode = '"+ regCode +"', status = 0 Where userid = '"+ userId +"'";
	   //System.out.println(sqlupdateemailid);
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Connection connObj = null;
	   Statement stm = null;
		
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
			if(!rs.next())
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
}
