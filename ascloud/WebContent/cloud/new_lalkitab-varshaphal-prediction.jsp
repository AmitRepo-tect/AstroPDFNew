<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script language="JavaScript">  

    function Validation(theform, period) {
        var yy, Fvalue;

        Fvalue = document.LKVarshphal.ChangeYear.value;
        if (Fvalue == "") {
            alert("Please enter the correct year");
            document.LKVarshphal.ChangeYear.focus();
            return (false);
        }

        var checkOK = "0123456789-!";
        var checkStr = Fvalue;
        var allValid = true;
        var decPoints = 0;
        var allNum = "";
        for (i = 0; i < checkStr.length; i++) {
            ch = checkStr.charAt(i);
            for (j = 0; j < checkOK.length; j++)
                if (ch == checkOK.charAt(j))
                break;
            if (j == checkOK.length) {
                allValid = false;
                break;
            }
            if (ch != ",")
                allNum += ch;
        }
        if (!allValid) {
            alert("Please enter only digit characters in the Year field.");
            document.LKVarshphal.ChangeYear.focus();
            return (false);
        }
        if ((birthYear > Fvalue) || ((birthYear + 120) < Fvalue)) {
            alert("Your age must be in between 1 and 120");
            return false;
        }

        LKVarshphal.submit();
        return true;
    }

</script>
<script language="JavaScript">


    function forwordMove(birthYear) {
        var yy, Fvalue;
      
        Fvalue = document.LKVarshphal.ChangeYear.value;
        if (Fvalue == "") {
            alert("Please enter the correct year");
            document.LKVarshphal.ChangeYear.focus();
            return (false);
        }

        var checkOK = "0123456789-!";
        var checkStr = Fvalue;
        var allValid = true;
        var decPoints = 0;
        var allNum = "";
        for (i = 0; i < checkStr.length; i++) {
            ch = checkStr.charAt(i);
            for (j = 0; j < checkOK.length; j++)
                if (ch == checkOK.charAt(j))
                break;
            if (j == checkOK.length) {
                allValid = false;
                break;
            }
            if (ch != ",")
                allNum += ch;
        }
        if (!allValid) {
            alert("Please enter only digit characters in the Year field.");
            document.LKVarshphal.ChangeYear.focus();
            return (false);
        }
        if ((birthYear > Fvalue) || ((birthYear + 120) < Fvalue)) {
            alert("Your age must be in between 1 and 120");
            return false;
        }

        yy = Fvalue;
        yy = parseInt(yy) + 1;
        document.LKVarshphal.ChangeYear.value = yy //CInt(document.LKVarshphal.ChangeYear.value)+1;
        LKVarshphal.submit();
        return true;
    }
    function backMove(birthYear) {
        var yy, Fvalue;
        Fvalue = document.LKVarshphal.ChangeYear.value;
        if (Fvalue == "") {
            alert("Please enter the correct year");
            document.LKVarshphal.ChangeYear.focus();
            return (false);
        }

        var checkOK = "0123456789-!";
        var checkStr = Fvalue;
        var allValid = true;
        var decPoints = 0;
        var allNum = "";
        for (i = 0; i < checkStr.length; i++) {
            ch = checkStr.charAt(i);
            for (j = 0; j < checkOK.length; j++)
                if (ch == checkOK.charAt(j))
                break;
            if (j == checkOK.length) {
                allValid = false;
                break;
            }
            if (ch != ",")
                allNum += ch;
        }
        if (!allValid) {
            alert("Please enter only digit characters in the Year field.");
            document.LKVarshphal.ChangeYear.focus();
            return (false);
        }
        if ((birthYear > Fvalue) || ((birthYear + 120) < Fvalue)) {
            alert("Your age must be in between 1 and 120");
            return false;
        }
        yy = Fvalue;
        yy = yy - 1;
        document.LKVarshphal.ChangeYear.value = yy;
        LKVarshphal.submit();
        return true;
    }
  
</script>
<%
		int languageCodeInt = (Integer)session.getAttribute("languageCode");
		Local localObj = new Local();
		MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
		MyResourceBundle lalKitabVarshPredConstants = localObj.loadPropertiesFileNew("lalkitabvarshaphalprediction",languageCodeInt);
		MyResourceBundle allLalKitabPredConstants = localObj.loadPropertiesFileNew("lalkitabvarshaphalprediction-lalkitabvarshaphal-lalkitabvarshaphalcharts",languageCodeInt);
		Calendar cal = Calendar.getInstance();
		String myValue =  request.getParameter("ChangeYear");
    	session.setAttribute("tt",myValue);
	     if (myValue == null  || myValue.equals("") || myValue.equals("0")) 
	    	 myValue=cal.get(Calendar.YEAR)+"";
	     
	     DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj");
	     myValue = (Integer.parseInt(myValue) - myAstrologyObject.getYearOfBirth())+"";  
	     int period = Integer.parseInt(myValue);
	     int currentMonth;
	      
	      if (myValue.equals("0")) //if date of birth is current year
	         period=1;
	      	      
	      int day1=myAstrologyObject.getDayOfBirth();
	      int year1=myAstrologyObject.getYearOfBirth();
          
	      int month1=myAstrologyObject.getMonthOfBirth();
          int month2=cal.get(Calendar.MONTH);
          if (month2<=month1)
          {
             period=period+0;
             currentMonth=0;
          }
         else
         {
            currentMonth=1;
  			period=period+1;
  			year1=year1+1;
         } 
                 
	     int currYear=Integer.parseInt(myValue) + myAstrologyObject.getYearOfBirth();
	     int startYear,endYear;
	     if(currentMonth==0)
	     {
	    	 startYear = currYear - 1;
	    	 endYear = currYear;
	     }
	     else
	     {
	    	 startYear = currYear;
	    	 endYear = currYear + 1;
	     }
%>
<script>

 var birthYear;
 birthYear=<%=year1%> 

</script>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content justify">
<p class="ml-10 mrtb-10"><%=lalKitabVarshPredConstants.getString("LAL_KITAB_VARSHPHAL_PREDICTIONS_NOTES")%></p>

<form name="LKVarshphal" method="Get" action="lalkitab-varshaphal-prediction.asp" onsubmit="return Validation(this,birthYear)" id="form1"> 
<div class="row mrt-20"> 
<div class="col s2 l2">  <button class="btn amber darken-4 waves-effect waves-light" onclick="return backMove(birthYear)" type="button" value="&lt;&lt;" name="butYearNavigation1">&lt;&lt;</button>  </div>
<div class="col s8 l8">  <input name="ChangeYear" size="20" value="<%=currYear%>">  </div>
<div class="col s2 l2">  <button class="btn amber darken-4 waves-effect waves-light right" type="button" value="&gt;&gt;" name="butYearNavigation2" onclick="return forwordMove(birthYear)">&gt;&gt;</button> </div>
<div class="col s12 l12">
<div align="center"><button class="btn amber darken-4 waves-effect waves-light" type="submit" name="Submit" value="<%=rBConstants.getString("CHANGE_YEAR")%>"><%=rBConstants.getString("CHANGE_YEAR")%></button></div>
</div>
</div>

   
   
   
	
</form>
</div>
</div>
</div>



<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<h2> 

<%=rBConstants.getString("VARSHAPHAL") %> &nbsp;
			<%=allLalKitabPredConstants.getString("FROM_ENG") %> <%=day1+"/"+month1+"/"+startYear%>
			<%=allLalKitabPredConstants.getString("FROM_HINDI") %> <%=allLalKitabPredConstants.getString("TO_ENG") %>
			<%=day1+"/"+month1+"/"+endYear%> <%=allLalKitabPredConstants.getString("TO_HINDI") %></h2>
	</div>		
			<%
	SharedFunction sf = new SharedFunction();
    LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);

    String myPlanetNames[] = {"","SUN","MOON","MARS","MERCURY","JUPITER","VENUS","SATURN","RAHU","KETU"};

	int[] RaashiNoCorrespondingToPlanets1 = new int[13];
	int[] a = new int[12];
	String strsql = "";
	int bhava=0;
	
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

	RLalKitab WeblalKitab = new RLalKitab();
    WeblalKitab.set(a);

    int[] planetinBhavForVarshaphal = WeblalKitab.getAlteredKundli (period,1);
    String langCodeName[] = {"English","Hindi","Tamil","English","Kannada","Telugu","Bengali","Gujarati","Malayalam","Marathi"};
     String fetchPred = langCodeName[languageCodeInt];
   /*  if(languageCodeInt == 1)
    {
    	fetchPred = "Hindi";
    }
    else if (languageCodeInt == 2)
    {
    	fetchPred = "Tamil";
    } */ %>


<%
        DatabaseUtils dBUtils = new DatabaseUtils();
		Connection connObj = null;
		try
		{
    	 connObj = dBUtils.getConnection();
    for(int i = 1;i<=9;i++)
    {
        bhava = planetinBhavForVarshaphal[i];
        
        String Varshphalprediction = GetVarshphalPrediction(i, bhava, fetchPred, connObj);
    
        %>
         <div class="hdg-content mrt-10 justify">
        <div class="card padding-all">
        
        <h2><%=rBConstants.getString(myPlanetNames[i])+"  "+ rBConstants.getString("LK_IN_YOUR") +" "+ bhava +" "+ SharedFunction.NoSuffix(bhava) +" "+ rBConstants.getString("IS_HOUSE")
                %>  </h2>
                
                <p>
					<%=Varshphalprediction%>
					</p>
					</div>
					</div>
					<%
							
    }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			//connObj.close();  //commented by ambuj(07 may 2018)
			dBUtils.closeConnection(connObj, null, null);
		}
    %>
				
				

</div>
</div>






<%!
public String GetVarshphalPrediction(int planetnumber, int housenumber, String fetchPred, Connection connObj)
{
	String pred = "";
	Statement stmt = null;
	ResultSet shmRsCity = null;
	try
	{
		stmt = connObj.createStatement();
		shmRsCity = null;
		String shmStrSql = "Select "+fetchPred+" as langPred From lalkitabprediction Where planetno = " + planetnumber + " And houseno = " + housenumber;
	    
		shmRsCity = stmt.executeQuery(shmStrSql);
		if(shmRsCity.next())
		{
			pred = shmRsCity.getString("langPred");
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
		try
		{
			if(shmRsCity != null) //add by ambuj(07 may 2018)
		    	shmRsCity.close();
			if(stmt != null) //add by ambuj(07 may 2018)
		    	stmt.close();
		}
		catch(SQLException sqle)
		{
			sqle.printStackTrace();
		}
	}
    return pred;
}
%>
<%@include file="lalkitab-footer.jsp"%>

