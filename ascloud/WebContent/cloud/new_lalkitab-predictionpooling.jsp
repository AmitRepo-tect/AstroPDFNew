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
Connection connObj = dBUtils.getConnectionPool();
Statement stm = null;
ResultSet shmRsCity=null;
%>
<table cellspacing="0" cellpadding="0" width="100%" border="0"
	style="border-collapse: collapse">
	<tbody>
		<tr>
			<td width="100%" class="boxtopbg">
				<div class="boxhdg">
					||&nbsp;&nbsp;<%=rBConstants.getString("LAL_KITAB_PREDICTIONS")%>&nbsp;&nbsp;||
				</div>
				<div id="headad" align="center" style="padding-top: 10px;"></div>
			</td>
		</tr>
	</tbody>
</table>
<div align="center" style="padding-bottom: 20px;">
	<table cellspacing="0" cellpadding="0" width="90%" border="1"
		bordercolor="#f96d06" style="border-collapse: collapse">
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
		<tr>
			<td class="cellhead" style="text-align: left; padding-left: 5px;">
				<%=rBConstants.getString(myPlanetNames[i]) +" "+ rBConstants.getString("LK_IN_YOUR") +" "+ a[i] +" "+ SharedFunction.NoSuffix(a[i]) +" "+ rBConstants.getString("IS_HOUSE")  %>
			</td>
		</tr>
		<tr>
			<td class="cellcontent">
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
            //connObj.close();//commented by ambuj(07 may 2018)
            dBUtils.closeConnection(connObj, null, null);
            
                %>

				</p>
			</td>
		</tr>
	</table>
	<div align="left"
		style="padding-left: 5%; padding-bottom: 10px; padding-top: 10px; font-size: small;">
		* <a href="/cloud/lalkitab-remedies-rules.asp"
			style="text-decoration: underline; font-size: small;"><b><%=rBConstants.getString("LALKITAB_REMEDIES_RULES") %></b></a>
	</div>
</div>
<%@include file="lalkitab-footer.jsp"%>

