<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
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

Statement stm = null;
ResultSet shmRsCity=null;
try
{
connObj = dBUtils.getConnection();
%>
<div align="center" class="heading-sec">
    <h2>
        <%=rBConstants.getString("LAL_KITAB_PREDICTIONS")%>
    </h2>
</div>
<div class="inner-sec">
    <% 
        String resultprediction = "";
            for(int i = 1;i<=9;i++)
            {
            	try
            	{
		            String shmStrSql = "Select * From lalkitabprediction Where planetno = " + i + " And houseno = " + a[i];
		            stm = connObj.createStatement();
	    			shmRsCity = stm.executeQuery(shmStrSql);
	    			while(shmRsCity.next())
	    			{
			            if(languageCodeInt == 1)
			            	resultprediction = shmRsCity.getString("Hindi");
			            else if(languageCodeInt == 2)
			            	resultprediction = shmRsCity.getString("Tamil");
			            else
			            	resultprediction = shmRsCity.getString("English");
	    			
	            
        %>
    <h3>
        <%=rBConstants.getString(myPlanetNames[i]) +" "+ rBConstants.getString("LK_IN_YOUR") +" "+ a[i] +" "+ SharedFunction.NoSuffix(a[i]) +" "+ rBConstants.getString("IS_HOUSE")  %>
    </h3>
    <p>
        <%=resultprediction%>
					<%}
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
//connObj.close(); //commented by ambuj(07 may 2018)
dBUtils.closeConnection(connObj, null, null);
}
                %>
    </p>
    <p>
        * <a href="/cloud/lalKitab-remedies-rules.asp" style="text-decoration: underline;"><b>
                <%=rBConstants.getString("LALKITAB_REMEDIES_RULES") %></b></a></p>
</div>
