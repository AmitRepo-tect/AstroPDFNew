<%@page import="java.sql.SQLException"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int languageCodeInt = (Integer)session.getAttribute("languageCode");
Local localObj = new Local();
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
LalKitab objLalKitab = new LalKitab();	

objLalKitab.setName (myAstrologyObject.getName());
objLalKitab.setPlace (myAstrologyObject.getPlace());
objLalKitab.setTimeZone (myAstrologyObject.getTimeZone());
objLalKitab.setMaleFemale (myAstrologyObject.getMaleFemale());
objLalKitab.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
objLalKitab.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
objLalKitab.setHourOfBirth (myAstrologyObject.getHourOfBirth());
objLalKitab.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
objLalKitab.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
objLalKitab.setYearOfBirth (String.valueOf(myAstrologyObject.getYearOfBirth()));
objLalKitab.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
objLalKitab.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
objLalKitab.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
objLalKitab.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
objLalKitab.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
objLalKitab.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
objLalKitab.setEastWest (myAstrologyObject.getEastWest());
objLalKitab.setNorthSouth (myAstrologyObject.getNorthSouth());
objLalKitab.setDST (myAstrologyObject.getDST());
	

if(languageCodeInt == 1)
{			
	objLalKitab.setLanguageCode(String.valueOf(languageCodeInt));
}
objLalKitab.initialize();

 
String myPlanetNames[] = {"","SUN","MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KETU"};
//This is used to return the langauge code name on the basis of language code which is store in session and use the language name to make a dynamic query below
//String langCodeName[] = {"English","Hindi","Tamil","English","Kannada","Telugu","Bengali","Gujarati","Malayalam","Marathi"};
String langCodeName[] = {"English","Hindi","Tamil","English","Kannada","Telugu","Bengali","Gujarati","Malayalam","Marathi"};
//This is language code name return form array and use it to make a dynamic query and get the optimized data for language specified
String getNameOfLangCode = langCodeName[languageCodeInt];

int[] RaashiNoCorrespondingToPlanets1 = new int[13];
int[] a = new int[13];
int[] arrPlanetsShodashvarga = objLalKitab.getPositionForShodasvarg(0);

for(int k = 0; k<=12; k++)
{
	RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
}

for(int i=0; i<=11; i++)
{
		a[i]=RaashiNoCorrespondingToPlanets1[i] - RaashiNoCorrespondingToPlanets1[0];
		if (a[i]<0)
			a[i]=a[i]+12;

		a[i]=a[i]+1;
}

DatabaseUtils dBUtils = new DatabaseUtils();
Connection connObj = null;
try
{
 connObj = dBUtils.getConnection();
Statement stm = null;
ResultSet shmRsCity=null;
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LAL_KITAB_PREDICTIONS")%></h1>	
</div>

<div class="row mrt-20">
<div class="col s12 l12">

<% 
        String resultprediction = "";
		String dynamicLKRemedyHeading = rBConstants.getString("DYNAMIC_LK_REMEDY_HEADING");
		//String lkPredictionRemedies = rBConstants.getString("LK_PREDICTION_REMEDIES");

            for(int i = 1;i<=9;i++)
            {
            	try
            	{
		            String shmStrSql = "Select "+getNameOfLangCode+" From lalkitabprediction Where planetno = " + i + " And houseno = " + a[i];
		            stm = connObj.createStatement();
	    			shmRsCity = stm.executeQuery(shmStrSql);
	    			while(shmRsCity.next())
	    			{
			            resultprediction = shmRsCity.getString(getNameOfLangCode);
			            
        String textReplacementArray[]={rBConstants.getString(myPlanetNames[i]),String.valueOf(a[i])+SharedFunction.NoSuffix(a[i])};
  		String dynamicheadinghealth=localObj.getDesiredString(dynamicLKRemedyHeading,textReplacementArray);  				
	            
        %>
        <div class="mrt-10 hdg-content justify">
      
        <div class="card padding-all">
        <h2>
        <%=dynamicheadinghealth%>
        </h2>
        
        <p>
					<%=resultprediction%>
					 
            </p>
            
				</div>
				</div>
				
				
            
            <%
					}
	    			
            		}
	    			catch(SQLException ex)
	            	{
	            		//out.println(ex);
	            	}
            	finally
            	{
            		if(shmRsCity != null)
            		{
            			shmRsCity.close();
            		}
            		if(stm != null)
            		{
         				stm.close();
            		}
            		
            	}
            }
          
}
catch(Exception e)
{
e.printStackTrace();
}
finally
{
            //connObj.close();//commented by ambuj(07 may 2018)
            dBUtils.closeConnection(connObj, null, null);
}
                %>

		

</div>
</div>



<%@include file="lalkitab-footer.jsp"%>

