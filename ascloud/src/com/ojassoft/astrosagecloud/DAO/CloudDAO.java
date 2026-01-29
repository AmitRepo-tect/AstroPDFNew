package com.ojassoft.astrosagecloud.DAO;
import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.DAO.DatabaseUtils;
import com.ojassoft.astrosagecloud.DO.HealthFeedback;
import com.ojassoft.astrosagecloud.localization.Hindi;
import com.ojassoft.astrosagecloud.util.Common;
import com.ojassoft.astrosagecloud.util.Util;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class CloudDAO {
	/**
	 * This method returns the ClassicalPredictions details According to languageCode ,planetName,planetPosition,planetCategories,plnetAspectedBy bookName passed.
	 * @param placeName planetName planetPosition planetCategories plnetAspectedBy bookName languageCode connObj 
     * @return - JsonString having plentName Position Categories prediction bookName.
	 */
public String ClassicalPredictionsNakshatra(String planetName,int planetPosition,String planetCategories,String plnetAspectedBy, String bookName,int languageCode, Connection connObj)
{
	String resultForClassicalPredictions="", strsql="";
	if(!(plnetAspectedBy.equals("")))
	{
		strsql = "SELECT planetmaster.PlanetName, planetpredictions.Position, planetpredictions.Categories,"+
				  " planetpredictions.Predictions, planetpredictions.BookName FROM planetpredictions left JOIN planetmaster ON"+
		          " planetpredictions.PlanetID=planetmaster.PlanetID where planetmaster.PlanetName='" + planetName + "' and planetpredictions.Position='"+
		            planetPosition + "' and planetpredictions.Categories='" + planetCategories + "' and planetpredictions.BookName='" + bookName +
	              "'  and planetpredictions.AspectedBy='" + plnetAspectedBy + "' and languageCode='"+ languageCode +"'";
	}
	else
	{
		strsql = "SELECT planetmaster.PlanetName, planetpredictions.Position, planetpredictions.Categories,"+
				 " planetpredictions.Predictions, planetpredictions.BookName FROM planetpredictions left JOIN planetmaster ON"+
				 " planetpredictions.PlanetID=planetmaster.PlanetID where planetmaster.PlanetName='"+ planetName + "' and planetpredictions.Position='"+
				   planetPosition + "' and planetpredictions.Categories='" + planetCategories + "' and planetpredictions.BookName='" + bookName + "' and languageCode='"+ languageCode +"'";
	}
	DatabaseUtils dBUtils = new DatabaseUtils();
	Statement stm = null;
	ResultSet rs = null;
	boolean closingNeeded = false;
	
	try
	{
		if(connObj == null)
		{
		 connObj = dBUtils.getConnection();
		 closingNeeded = true;
		}
		 stm = connObj.createStatement();
		 rs = stm.executeQuery(strsql);
		if(rs.next())
		{
			resultForClassicalPredictions = rs.getString("PlanetName") +"#" + rs.getString("Position") + "#" + rs.getString("Categories") + "#"
										   + rs.getString("Predictions") + "#" + rs.getString("BookName");
		}
		
	}
	catch(SQLException ex)
	{
			
	}
	finally
	{
		if(closingNeeded)
		{
			dBUtils.closeConnection(connObj, stm, rs);
		}
		else
			dBUtils.closeConnection(null, stm, rs);
	}
	return resultForClassicalPredictions;

}
/**
 * This method returns the Prediction details According to languageCode ,dasaLordNumber,bhava passed.
 * @param dasaLordNumber bhava languageCode connObj hindi 
 * @return - JsonString having Prediction according to language code.
 */
public String GetPrediction(int dasaLordNumber,int bhava,int languageCode , Connection connObj,Hindi hindi){
	 String resultForGetprediction = "";
	  String shmStrSql = "select * from MuddaPrediction where planetno = " + dasaLordNumber + " AND houseno= " + bhava;
	 
	   DatabaseUtils dBUtils = new DatabaseUtils();
	   Statement stm = null;
	   ResultSet rs = null;
		boolean closingNeeded = false;
		
		try
		{
			if(connObj == null)
			{
			 connObj = dBUtils.getConnection();
			 closingNeeded = true;
			}
			 stm = connObj.createStatement();
			 rs = stm.executeQuery(shmStrSql);
			if(rs.next())
			{
				 if(languageCode==1){
				 resultForGetprediction = hindi.unicode((rs.getString("Hindi").replace("year","period")),languageCode);
				 }
			   else if(languageCode == 2){
				   resultForGetprediction = rs.getString("Tamil").replace("year","period");
			   }
		     else if(languageCode == 4){
		    	 resultForGetprediction = rs.getString("Kannada").replace("year","period");
		     
               }else if(languageCode == 5){
            	   resultForGetprediction = rs.getString("Telugu").replace("year","period"); 
               }
              else if(languageCode == 6){
            	  resultForGetprediction =rs.getString("Bengali").replace("year","period");  
              }
             else if(languageCode == 7){
            	 resultForGetprediction = rs.getString("Gujarati").replace("year","period");
              }
              else if(languageCode == 8){
            	  resultForGetprediction = rs.getString("Malayalam").replace("year","period");
               }
             else if(languageCode == 9){
            	 resultForGetprediction = rs.getString("Marathi").replace("year","period");
              }
             else if(languageCode == 10){
            	 resultForGetprediction = rs.getString("urdu").replace("year","period");
             }
		     else{
		    	resultForGetprediction = rs.getString("English").replace("year","period");
		        
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
				dBUtils.closeConnection(connObj, stm, rs);
			}
			else
				dBUtils.closeConnection(null, stm, rs);

        }
		
		return resultForGetprediction;

}


//****************************************
/**
 * This method returns the PredictionForAspect details According to languageCode ,aspectValue passed.
 * @param aspectNo aspectValue myAstrologyObject langCode hindi connObj 
 * @return - JsonString having PredictionForAspect according to language code.
 */
public String getPredictionForAspect(int aspectNo, String aspectValue , DesktopHoro myAstrologyObject ,int langCode,Hindi hindi, Connection connObj){

String predictions ="";
String getPredictionForAspecttxt = "";
String strSql = "select * from Ref Where RWHAT = '" + aspectValue + "'";
String sql2 = "";
int[] bhava =  new int[6];
int planetNo = 0;
DatabaseUtils dBUtils= new DatabaseUtils();
Statement stm = null;
ResultSet rsPrediction = null;
Statement stm1 = null;
ResultSet rsPrediction1 = null;
boolean closeConnection = false;
try{
	
	if(connObj == null)
	{
		 
		connObj = dBUtils.getConnection();
		closeConnection = true;
	}
       // System.out.println("hello");
		     stm = connObj.createStatement();
			 rsPrediction = stm.executeQuery(strSql);
	    	while(rsPrediction.next()){
				       planetNo = rsPrediction.getInt("RPLNT");
				       //System.out.println(planetNo);
				        switch(planetNo){
				              case 1:
				                  bhava[1] = ((int)myAstrologyObject.getAscendentLongitude())/30+1;
				                  break;
				              case 2:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getSun());
				                  break;
				              case 3:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getMercury());
				                  break;
				              case 4:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getVenus());
				                  break;
				              case 5:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getMars());
				                  break;
				              case 6:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getJupitor());
				                  break;
				              case 7:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getSaturn());
				                  break;
				              case 8:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getMoon());
				                  break;
				              case 12:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getNeptune());
				                  break;
				         }
				     //   System.out.println(bhava[1]);
	         if(bhava[1] > 12){
	         bhava[1] = bhava[1]-12;
			 }
	         sql2 = "SELECT Phal.DETL, Phal.PLNT, Phal.DIV, Phal.LanguageID From Phal WHERE Phal.PLNT= " + String.valueOf(planetNo) + " AND Phal.RASI IN (" + String.valueOf(bhava[1]) + ")" + " AND Phal.LanguageID= "+langCode+" And phal.DIV < 5";     
	    
	   // rsPrediction.close();
	    	}
	      try{
				 stm1 = connObj.createStatement();
				 rsPrediction1 = stm1.executeQuery(sql2);
				while(rsPrediction1.next()){
					 predictions = predictions + rsPrediction1.getString("DETL");
				}
				
	      }
				catch(SQLException sqle){
					predictions =null;
					
				}
	     
	      
	  }
		catch(Exception sqle){
			bhava =null;
		}
	finally
		{
			dBUtils.closeConnection(null, stm1, rsPrediction1);
		    if(closeConnection)
		    {
		    	dBUtils.closeConnection(connObj, stm, rsPrediction);
		    }
		    else
		    {
		    	dBUtils.closeConnection(null, stm, rsPrediction);
		    }

	    }
	      
	     if(langCode==1){
	              getPredictionForAspecttxt = hindi.unicode(predictions,langCode);
	     } else{
	    	 getPredictionForAspecttxt = predictions;
	     }

	return(getPredictionForAspecttxt);

  }

//****************************************
/**
* This method returns the PredictionForAspect details According to languageCode ,aspectValue passed.
* @param aspectNo aspectValue myAstrologyObject langCode hindi connObj 
* @return - JsonString having PredictionForAspect according to language code.
*/
public String getPredictionForAspectBasedOnDiv(int aspectNo, String aspectValue , DesktopHoro myAstrologyObject ,int langCode,Hindi hindi, Connection connObj,int division){

String predictions ="";
String getPredictionForAspecttxt = "";
String strSql = "select * from Ref Where RWHAT = '" + aspectValue + "'";
String sql2 = "";
int[] bhava =  new int[6];
int planetNo = 0;
DatabaseUtils dBUtils= new DatabaseUtils();
Statement stm = null;
ResultSet rsPrediction = null;
Statement stm1 = null;
ResultSet rsPrediction1 = null;
boolean closeConnection = false;
try{
	
	if(connObj == null)
	{
		 
		connObj = dBUtils.getConnection();
		closeConnection = true;
	}
   // System.out.println("hello");
		     stm = connObj.createStatement();
			 rsPrediction = stm.executeQuery(strSql);
	    	while(rsPrediction.next()){
				       planetNo = rsPrediction.getInt("RPLNT");
				       //System.out.println(planetNo);
				        switch(planetNo){
				              case 1:
				                  bhava[1] = ((int)myAstrologyObject.getAscendentLongitude())/30+1;
				                  break;
				              case 2:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getSun());
				                  break;
				              case 3:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getMercury());
				                  break;
				              case 4:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getVenus());
				                  break;
				              case 5:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getMars());
				                  break;
				              case 6:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getJupitor());
				                  break;
				              case 7:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getSaturn());
				                  break;
				              case 8:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getMoon());
				                  break;
				              case 12:
				                  bhava = myAstrologyObject.getBhavaForPrediction(myAstrologyObject.getNeptune());
				                  break;
				         }
				     //   System.out.println(bhava[1]);
	         if(bhava[1] > 12){
	         bhava[1] = bhava[1]-12;
			 }
	         sql2 = "SELECT Phal.DETL, Phal.PLNT, Phal.DIV, Phal.LanguageID From Phal WHERE Phal.PLNT= " + String.valueOf(planetNo) + " AND Phal.RASI IN (" + String.valueOf(bhava[1]) + ")" + " AND Phal.LanguageID= "+langCode+" and phal.DIV ="+division;   
	    
	   // rsPrediction.close();
	         
	    	}
	      try{
				 stm1 = connObj.createStatement();
				 rsPrediction1 = stm1.executeQuery(sql2);
				while(rsPrediction1.next()){
					 predictions = predictions + rsPrediction1.getString("DETL");
					 
					 //System.out.println(rsPrediction1.getString("DIV"));
				}
				
	      }
				catch(SQLException sqle){
					predictions =null;
					
				}
	     
	      
	  }
		catch(Exception sqle){
			bhava =null;
		}
	finally
		{
			dBUtils.closeConnection(null, stm1, rsPrediction1);
		    if(closeConnection)
		    {
		    	dBUtils.closeConnection(connObj, stm, rsPrediction);
		    }
		    else
		    {
		    	dBUtils.closeConnection(null, stm, rsPrediction);
		    }

	    }
	      
	     if(langCode==1){
	              getPredictionForAspecttxt = hindi.unicode(predictions,langCode);
	     } else{
	    	 getPredictionForAspecttxt = predictions;
	     }

	return(getPredictionForAspecttxt);

}
/**
 * This method returns the ClassicalPredictionsExceptEnglish details According to  PlanetName PlanetPosition PlanetCategories PlnetAspectedBy passed.
 * @param PlanetName PlanetPosition PlanetCategories PlnetAspectedBy BookName LanguageCode connObj 
 * @return - JsonString having PlanetName position Categories predictionval.
 */
public String ClassicalPredictionsExceptEnglish(String PlanetName,int PlanetPosition,String PlanetCategories,String PlnetAspectedBy,String BookName,int LanguageCode, Connection connObj){
String  ResultForClassicalPredictionsExceptEnglish = "",StrSql = "";
    if(LanguageCode == 1){
        if(!PlnetAspectedBy.equals("")) {
            StrSql = "SELECT planetmaster.PlanetName, planetpredictions.Position, planetpredictions.Categories, planetpredictions.HindiPredictions As predictionval FROM planetpredictions left JOIN planetmaster ON planetpredictions.PlanetID=planetmaster.PlanetID where planetmaster.PlanetName='" + PlanetName + "' and planetpredictions.Position='" + PlanetPosition + "' and planetpredictions.Categories='" + PlanetCategories + "' and planetpredictions.AspectedBy='" + PlnetAspectedBy + "' and planetpredictions.LanguageCode='"+ LanguageCode +"'";
        }else{
            StrSql = "SELECT planetmaster.PlanetName, planetpredictions.Position, planetpredictions.Categories, planetpredictions.HindiPredictions As predictionval FROM planetpredictions left JOIN planetmaster ON planetpredictions.PlanetID=planetmaster.PlanetID where planetmaster.PlanetName='" + PlanetName + "' and planetpredictions.Position='" + PlanetPosition + "' and planetpredictions.Categories='" + PlanetCategories + "' and planetpredictions.LanguageCode='"+ LanguageCode +"'";
        }
    }else{
    	 if(!PlnetAspectedBy.equals("")) {
            StrSql = "SELECT planetmaster.PlanetName, planetpredictions.Position, planetpredictions.Categories, planetpredictions.Predictions As predictionval FROM planetpredictions left JOIN planetmaster ON planetpredictions.PlanetID=planetmaster.PlanetID where planetmaster.PlanetName='" + PlanetName + "' and planetpredictions.Position='" + PlanetPosition + "' and planetpredictions.Categories='" + PlanetCategories + "' and planetpredictions.AspectedBy='" + PlnetAspectedBy + "' and planetpredictions.LanguageCode='"+ LanguageCode +"'";
    	 }else{
            StrSql = "SELECT planetmaster.PlanetName, planetpredictions.Position, planetpredictions.Categories, planetpredictions.Predictions As predictionval FROM planetpredictions left JOIN planetmaster ON planetpredictions.PlanetID=planetmaster.PlanetID where planetmaster.PlanetName='" + PlanetName + "' and planetpredictions.Position='" + PlanetPosition + "' and planetpredictions.Categories='" + PlanetCategories + "' and planetpredictions.LanguageCode='"+ LanguageCode +"'";
    	 }
    }
   // System.out.println(StrSql+"->Query");
    DatabaseUtils dBUtils = new DatabaseUtils();
    Statement stm = null;
    ResultSet RsPrediction = null;
	boolean closingNeeded = false;
	
	try
	{
		if(connObj == null)
		{
		 connObj = dBUtils.getConnection();
		 closingNeeded = true;
		}
		 stm = connObj.createStatement();
		 RsPrediction = stm.executeQuery(StrSql);
		if(RsPrediction.next())
		{
			ResultForClassicalPredictionsExceptEnglish = RsPrediction.getString("PlanetName")+ "#" + RsPrediction.getString("Position") + "#" + RsPrediction.getString("Categories") + "#" + RsPrediction.getString("predictionval");
	}
	
	}
	catch(SQLException ex)
	{
			
	}
	finally
	{
		if(closingNeeded)
		{
			dBUtils.closeConnection(connObj, stm, RsPrediction);

		}
		else
			dBUtils.closeConnection(null, stm, RsPrediction);
		
	}
//System.out.println(ResultForClassicalPredictionsExceptEnglish+"result");
return ResultForClassicalPredictionsExceptEnglish;
}
/**
 * This method returns the getMunthaPredictionRegional details According to placeName Munthano LanguageCode passed.
 * @param Munthano LanguageCode connObj 
 * @return - JsonString having getMunthaPredictionRegional according to language code.
 */
public String getMunthaPredictionRegional(int Munthano,int LanguageCode, Connection connObj){

String result="";
String[] languagearr ={"English","Hindi","Tamil","","Kannada","Telugu","Bengali","Gujarati","Malayalam","Marathi","Urdu"};
//Set RsMuntha = server.CreateObject ("ADODB.Recordset")
String strSqlMuntha = "Select * From MunthaPrediction where houseno = " + Munthano; 

DatabaseUtils dBUtils = new DatabaseUtils();
boolean closingNeeded = false;
Statement stm = null;
ResultSet RsPrediction = null;

try
{
	if(connObj == null)
	{
	 connObj = dBUtils.getConnection();
	 closingNeeded = true;

	}
	 stm = connObj.createStatement();
	 RsPrediction = stm.executeQuery(strSqlMuntha);
	if(RsPrediction.next())
	{
		result = RsPrediction.getString(languagearr[LanguageCode]);
}
	
}
catch(SQLException ex)
{
		
}
finally
{
	if(closingNeeded)
	{
		dBUtils.closeConnection(connObj, stm, RsPrediction);
	}
	else
		dBUtils.closeConnection(null, stm, RsPrediction);
}
return result;
}

/**
 * This method returns the GetLanguageSpecificPrediction details According to planetNo bhava LanguageCode passed.
 * @param planetNo languageCode bhava 
 * @return - JsonString having specific prediction according to language code.
 */
public String GetLanguageSpecificPrediction(int planetNo ,int languageCode, int bhava, Connection connObj)
{
	String fetchPrediction = Common.languageType[languageCode];
	
	String SpecificPrediction="",
			
    strsql="select "+fetchPrediction+" as specPred from MuddaPrediction where planetno = " +planetNo+ " AND houseno= " + bhava;
	
	DatabaseUtils dBUtils = new DatabaseUtils();
	Statement stm = null;
	ResultSet rs = null;
	boolean closingNeeded = false;
	try
	{
		if(connObj == null)
		{
		 connObj = dBUtils.getConnection();
		 closingNeeded = true;
		}
		 stm = connObj.createStatement();
		 rs = stm.executeQuery(strsql);
		if(rs.next())
		{
			SpecificPrediction=rs.getString("specPred");
			
		}
		
	}
	catch(SQLException ex)
	{
		ex.printStackTrace();	
	}
	finally
	{
		if(closingNeeded)
		{
			dBUtils.closeConnection(connObj, stm, rs);
		}
		else
			dBUtils.closeConnection(null, stm, rs);
		
	}
	return SpecificPrediction;

}

/**
 * This method returns the city details corresponding to the cityId passed
 * @param placeName
 * @return - JsonString having country, place, longitude, latitude and timezone.
 */
public HashMap<String, String> getCityDetailsByCityId(String cityId)
{
	HashMap<String, String> hm = new HashMap<String, String>();
	
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	Statement stm = null;
	ResultSet rs = null;
	
	String StrSqlCity="SELECT City_Master.*, State_Master.statename, Country_Master.country,Country_Master.ZoneStart "
			+ "FROM (City_Master LEFT JOIN State_Master ON City_Master.[stateCountryCode] = State_Master.statecode) INNER JOIN "
			+ "Country_Master ON City_Master.[countryCode] = Country_Master.countrycode where  City_Master.city_id ='"+ cityId +"'";
		try
		{
			connObj = dBUtils.getConnection();
			 stm = connObj.createStatement();
			 rs = stm.executeQuery(StrSqlCity);
			
			String longEW="",latNS="";
			if(rs.next())
			{
				hm.put("LatDeg", rs.getString("LatDeg"));
				hm.put("LatMin", rs.getString("LatMin"));
				latNS = rs.getString("LatNS");
				hm.put("LongDeg", rs.getString("LongDeg"));
				hm.put("LongMin", rs.getString("LongMin"));
				longEW = rs.getString("LongEW");

                if(latNS.equals("1")) 
                    latNS = "N";
                else
                    latNS = "S";
                
                if(longEW.equals("1")) 
                    longEW = "E";
                else
                    longEW = "W";
                
                hm.put("LongEW", longEW);
                hm.put("LatNS", latNS);
                String TimeZone = Util.ParsingTimeZone(rs.getString("ZoneStart"));
                hm.put("TimeZone", TimeZone);
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
			return hm;
		}

	public boolean saveFeedback(DesktopHoro objHoro, String userId, String feedback, int agree, String calcImmunity, String actualImmunity)
	{
		boolean isSaved = false;
		DatabaseUtils dbUtils = new DatabaseUtils();
		Statement stmt = null;
		Connection connObj = null;
		boolean includeUserId = false;
		if(userId != null && !userId.equals(""))
		{
			includeUserId = true;
		}
		try
		{
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		     String dateInString = objHoro.getMonthOfBirth()+"/"+objHoro.getDayOfBirth()+"/"+objHoro.getYearOfBirth()+" "+objHoro.getHourOfBirth()+":"+objHoro.getMinuteOfBirth()+":"+objHoro.getSecondOfBirth();//"Jan 1, 2015"; 
		     Date date = null;
		     date = formatter.parse(dateInString);
		     //String TimeoB = objHoro.getHourOfBirth() + ":" + objHoro.getMinuteOfBirth() + ":" + objHoro.getSecondOfBirth();
			String sql = "insert into health_feedback (dob,name,place, longdeg,longmin,longew,latdeg,latmin,latns,timezone,agree,calcimmunity,actualimmunity,feedback";
			if(includeUserId)
			{
				sql += ",userid ";
			}
			sql += ") values ('"+new java.sql.Timestamp(date.getTime())+ "','" +objHoro.getName()+"','"+objHoro.getPlace()+"',"+objHoro.getDegreeOfLongitude()
					+ "," + objHoro.getMinuteOfLongitude()+",'"+objHoro.getEastWest()+"',"+objHoro.getDegreeOfLattitude()+","+objHoro.getMinuteOfLattitude()
					+ ",'"+objHoro.getNorthSouth()+"','"+ objHoro.getTimeZone()+"'," + agree+",'"+calcImmunity+"','"+actualImmunity+"','"+feedback+"'";
			if(includeUserId)
			{
				sql += ",'" + userId+"'";
			}
			sql += ")";
			connObj = dbUtils.getConnection();
			stmt = connObj.createStatement();
			int x = stmt.executeUpdate(sql);
			if(x == 1)
			{
				isSaved = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			dbUtils.closeConnection(connObj, stmt, null);
		}
		return isSaved;
	}
	
	public List<HealthFeedback> getFeedbacks()
	{
		List<HealthFeedback> list = new ArrayList<HealthFeedback>();
		DatabaseUtils dbUtils = new DatabaseUtils();
		Statement stmt = null;
		ResultSet rs = null;
		Connection connObj = null;
		try
		{
			String sql = "select * from health_feedback";
			connObj = dbUtils.getConnection();
			stmt = connObj.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				HealthFeedback feedback = new HealthFeedback();
				feedback.setName(rs.getString("name"));
				feedback.setUserId(rs.getString("userid"));
				feedback.setDateOfBirth(rs.getTimestamp("dob"));
				feedback.setPlace(rs.getString("place") + 
						" ("+rs.getString("longdeg")+rs.getString("longew")+rs.getString("longmin")+
						", "+rs.getString("latdeg")+rs.getString("latns")+rs.getString("latmin")+
						", "+rs.getString("timezone")+")");
				feedback.setLongdeg(rs.getInt("longdeg"));
				feedback.setLongmin(rs.getInt("longmin"));
				feedback.setLongew(rs.getString("longew"));
				feedback.setLatdeg(rs.getInt("latdeg"));
				feedback.setLatmin(rs.getInt("latmin"));
				feedback.setLatns(rs.getString("latns"));
				feedback.setTimezone(rs.getString("timezone"));
				feedback.setCalcImmunity(rs.getString("calcimmunity"));
				feedback.setActualImmunity(rs.getString("actualimmunity"));
				feedback.setAgree(rs.getBoolean("agree"));
				feedback.setFeedback(rs.getString("feedback"));
				list.add(feedback);
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
		return list;
	}
	
}