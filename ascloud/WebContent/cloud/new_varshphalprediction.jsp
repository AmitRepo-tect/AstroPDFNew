<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.varshphala.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.Calendar"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Local local = new Local();
Hindi hindi = new Hindi();

int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle varshphalprediction = local.loadPropertiesFileNew("varshphalprediction",languageCode);
%>

<script language="JavaScript">

    function forwordMove() {
        var yy;
        yy = parseInt(document.Varshphal.ChangeYear.value);
        yy = yy + 1;
        document.Varshphal.ChangeYear.value = yy;
    }
    function backMove() {
        var yy;
        yy = document.Varshphal.ChangeYear.value;
        yy = yy - 1;
        if (yy > 0) {
            document.Varshphal.ChangeYear.value = yy;
        }
        else {
            alert("Invalid Value of Year !....")
        }
    }

</script>

<script language="JavaScript">

    function Validation(theform) {
        if (theform.ChangeYear.value == "") {
            alert("Please enter the correct year");
            theform.ChangeYear.focus();
            return (false);
        }
        var checkOK = "0123456789-!";
        var checkStr = theform.ChangeYear.value;
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
            theform.ChangeYear.focus();
            return (false);
        }
        return (true);
    }

</script>

<%   int myvalue= 0,currYear=0;
    String predictionyear = request.getParameter("ChangeYear");
    if(predictionyear == null || predictionyear.equals("")) {
        //predictionyear = Year(now())
        predictionyear = String.valueOf(Calendar.getInstance().get(Calendar.YEAR));
        myvalue = Calendar.getInstance().get(Calendar.YEAR);
    }else{
    	predictionyear = Util.safestr(request.getParameter("ChangeYear"));
    	myvalue = Integer.parseInt(predictionyear);
    	request.getSession().setAttribute("tt",predictionyear);
    	//session("tt") = predictionyear;
    }  
%>
<div class="hdg-lg card">
	<h1><%=rBConstants.getString("YOUR_PERSONALIZED_HOROSCOPE")%>&nbsp;<%=predictionyear %></h1>	
</div>

<%
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
Constants ObjConst = new Constants();
ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
Varshphala objVarshPhal = new Varshphala();

myvalue = myvalue - Integer.parseInt(String.valueOf(myAstrologyObject.getYearOfBirth()));          
currYear=myvalue + myAstrologyObject.getYearOfBirth();

initializeVarshPhal(myvalue, myAstrologyObject.getYearOfBirth(),myAstrologyObject,objVarshPhal,languageCode);
objVarshPhal.initialize();
int intJD = Integer.parseInt(String.valueOf(objVarshPhal.calculateJdForVarshphal()));
int intVarshYear = objVarshPhal.getVarshphalYear();
int[] arrVarshPhal = objVarshPhal.getVarshphal(intVarshYear, intJD);

	// Error in java class file arrVarshPhal(2)
	//objVarshPhal.initializeForBirthTime();
	//objVarshPhal.initializeForVarshphala();
	
	try{
objVarshPhal.initializeForBirthTime();
objVarshPhal.initializeForVarshphala();

	objVarshPhal.calculateMuntha();
	objVarshPhal.calculateOpeningDasa();
	//*************calling methods before state of objects get changed to Varshparvesh time 28/03/03**********
	int munthaInBhav = objVarshPhal.getMunthaInBhav();
    int intMunthaNo = objVarshPhal.getMuntha();
	//out.println(munthaInBhav+","+intMunthaNo);
	String strMuntheshName = objVarshPhal.getMunthesh();
	
	//*************calling methods before state of objects get changed to Varshparvesh time 28/03/03**********
			//double[] arrSahamValue = objVarshPhal.getSahamvalue();
			
			//if(langCode == 1) {
			  objVarshPhal.setLanguageCode(String.valueOf(languageCode));
			//}
			int[] arrPlanetsShodashvarga = objVarshPhal.getPositionForShodasvarg(0);
%>



		
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content justify">
<h2> <%=varshphalprediction.getString("VARSHPHAL_DETAILS") %> </h2>

<form name="Varshphal" method="get" action="varshphalprediction.asp" onsubmit="return Validation(this)" id="form1">
<div class="row mrt-30">
<div class="col s4 l2">
<input type="button" value="&lt;&lt;" name="butYearNavigation1" onclick="backMove()" class="btn amber darken-4 waves-effect waves-light">

</div>
<div class="col s4 l8">
<input name="ChangeYear" size="20" value="<%=currYear%>"> 
</div>
<div class="col s4 l2">
<input type="button" value="&gt;&gt;" name="butYearNavigation2" onclick="forwordMove()" class="btn amber darken-4 waves-effect waves-light right">
</div>
</div>
<div align="center">  <button class="btn amber darken-4 waves-effect waves-light" type="Submit" name="Submit" value=""> <%=rBConstants.getString("CHANGE_YEAR")%></button></div>
</form>
</div>
</div>
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content justify">




	
	<%  CloudDAO CD = new CloudDAO();
       intMunthaNo = objVarshPhal.getMunthaInBhav();
		//Dim RsMuntha,strSqlMuntha,getMunthaPrediction		
		//out.println(intMunthaNo);
       String getMunthaPrediction =CD.getMunthaPredictionRegional(intMunthaNo, languageCode,null);
        %>
<h2><%=rBConstants.getString("YEA") %>
				&nbsp;<%=predictionyear%>
				<% if(languageCode == 1){%>&nbsp;
				<%}%>
				<%=rBConstants.getString("KA") %>&nbsp;<%=varshphalprediction.getString("SUMMARY") %>&nbsp;<%=varshphalprediction.getString("HOROSCOPE") %></h2>

<p><%=hindi.unicode(getMunthaPrediction,languageCode)%></p>


	<%
            
          //'********Code For Prediction Page 1*********
            String[] strDashaSpan = objVarshPhal.calculateIstLevelMuddaVimshottari();
            int[] arrDashSeries = objVarshPhal.calculateDasaSeries();
            
            int intAsc = arrPlanetsShodashvarga[0];
            String[] arrYearRange = objVarshPhal.calculateIstLevelMuddaVimshottari();
            int intYearDashaStart = arrVarshPhal[0];
            int intMonthDashaStart = arrVarshPhal[1];
            int intDayDashaStart = arrVarshPhal[2];
            
            
            //***Set Values According To the Language  
           	 String  strLimiter = "/";
           	 String  strLimiter2 = "-";
           	  
           //****Set limits for Prediction page 1.****
           	 int  intLowerLimit = 1;
           	 int  intUpperLimit = 5;
        		   
           	String  strDashaSpan1 = rBConstants.getString(SharedFunction.monthName(intMonthDashaStart).toUpperCase())+" "+intDayDashaStart + ", " + intYearDashaStart;
           	
           	int[] arrPlanetInBhav =  new int[13];
           	String[] arrDashaSpan2 =  new String[13];
           	String strDashaSpan2 = "",strYearRange="",rsPredictionsdata="",strHeading1="",strText="";
            for(int iCount = intLowerLimit ; iCount<= intUpperLimit;iCount++){
            	int intPlanetPosition = arrDashSeries[iCount - 1];
        		int intDashaSeries = fnGetDashSeries(intPlanetPosition);
        		intPlanetPosition = arrPlanetsShodashvarga[intDashaSeries];
        		arrPlanetInBhav[iCount] = getPlanetInBhava(intAsc, intPlanetPosition);
        		strDashaSpan2 = arrYearRange[iCount - 1];
        		arrDashaSpan2=strDashaSpan2.split("/");
        		
        		strYearRange = strDashaSpan1 +" "+ strLimiter2 +" "+ rBConstants.getString(SharedFunction.monthName(Integer.parseInt(arrDashaSpan2[1])).toUpperCase())+" "+arrDashaSpan2[0]+", "+arrDashaSpan2[2];
        	    strDashaSpan1 = rBConstants.getString(SharedFunction.monthName(Integer.parseInt(arrDashaSpan2[1])).toUpperCase())+" "+arrDashaSpan2[0]+", "+arrDashaSpan2[2];
        	    rsPredictionsdata = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount], languageCode,null,hindi);
        	    if(!rsPredictionsdata.equals("")) {	
 		        strHeading1 = strYearRange + "  ";                
 		        strText = rsPredictionsdata;
 		        		%>

			<h2><%=strHeading1%></h2>


			<p>
				<%=strText%>&nbsp;
			</p>
	
	<%
            }
            }
          //****Set limits for Prediction page 2.****
          String rsPredictionsdata1=""; 
     	   intLowerLimit = 6;
     	   intUpperLimit = 9;
     	   strDashaSpan1 = arrYearRange[4];  
     	   String[] arrDashaSpan1 = strDashaSpan1.split("/");
     	   //strDashaSpan1 = intDayDashaStart + strLimiter + intMonthDashaStart + strLimiter + intYearDashaStart;
     	   strDashaSpan1 = rBConstants.getString(SharedFunction.monthName(Integer.parseInt(arrDashaSpan1[1])))+" "+arrDashaSpan1[0]+ ", "+arrDashaSpan1[2];

     	//*****make Connection To Database
     	   for(int iCount = intLowerLimit ; iCount<= intUpperLimit;iCount++){
     		int intPlanetPosition = arrDashSeries[iCount - 1];
     		int intDashaSeries = fnGetDashSeries(intPlanetPosition);
     		intPlanetPosition = arrPlanetsShodashvarga[intDashaSeries];
     		arrPlanetInBhav[iCount] = getPlanetInBhava(intAsc, intPlanetPosition);
     		strDashaSpan2 = arrYearRange[iCount - 1];
     		arrDashaSpan2 = strDashaSpan2.split("/");
     				
     		strYearRange = strDashaSpan1 +" "+ strLimiter2+" " + rBConstants.getString(SharedFunction.monthName(Integer.parseInt(arrDashaSpan2[1])))+" "+arrDashaSpan2[0]+", "+arrDashaSpan2[2];
     		strDashaSpan1 = rBConstants.getString(SharedFunction.monthName(Integer.parseInt(arrDashaSpan2[1])))+" "+arrDashaSpan2[0]+", "+arrDashaSpan2[2];

     		rsPredictionsdata1 = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount], languageCode,null,hindi);
     		if(!rsPredictionsdata1.equals("")){
            strHeading1 = strYearRange ;		    
		    strText = rsPredictionsdata1;
            %>
	
			<h2> 
				<%=strHeading1%> </h2>
	
	
		<p>
			<%=strText%>&nbsp;
		</p> <% if(iCount == intUpperLimit){%>
		<div align="left" class="mrt-20">
		* <a href="varshphalallpages.asp" class="text-orange" style="text-decoration:underline;">
		<b><%=varshphalprediction.getString("VARSHA_PRAVESH_MUDDA_DASHA_SAHAM_PANCHADHIKARI_ETC") %></b></a>
		</div> <% }%>
	
	<%}             
     	   }%>



</div>
</div>
</div>
<% 	}
catch(Exception e)
{
	Util.getRequestObjectValue(request);
	out.close();
	e.printStackTrace();	
	
}
%>
<%!
public void initializeVarshPhal(int intInput ,int strYear,DesktopHoro myAstrologyObject,Varshphala objVarshPhal , int languageCode){
	objVarshPhal.setName (myAstrologyObject.getName());
	objVarshPhal.setPlace (myAstrologyObject.getPlace());
	objVarshPhal.setTimeZone (myAstrologyObject.getTimeZone());
	objVarshPhal.setMaleFemale (myAstrologyObject.getMaleFemale());
	objVarshPhal.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
	objVarshPhal.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
	objVarshPhal.setHourOfBirth (myAstrologyObject.getHourOfBirth());
	objVarshPhal.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
	objVarshPhal.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
	objVarshPhal.setYearOfBirth (String.valueOf(strYear)); 
	objVarshPhal.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
	objVarshPhal.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
	objVarshPhal.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
	objVarshPhal.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
	objVarshPhal.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
	objVarshPhal.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
	objVarshPhal.setEastWest (myAstrologyObject.getEastWest());
	objVarshPhal.setNorthSouth (myAstrologyObject.getNorthSouth());
	objVarshPhal.setDST (myAstrologyObject.getDST());
	 
	//objVarshPhal.setLanguageCode ("0")
	//if(languageCode==1) {
	   //objVarshPhal.setLanguageCode(String.valueOf(languageCode));
	//}
	
	
	objVarshPhal.setVarshphalYear(intInput);
	objVarshPhal.calculateMuntha();
	objVarshPhal.calculateOpeningDasa();
	
	}





//*********Function For Dasha Series********	  
public int  fnGetDashSeries(int intNo) {
int getDashSeries = 0;
switch(intNo){
case 1:
	  getDashSeries = 1;
  break;
case 2:
	  getDashSeries = 2;
  break;
case 3:
	  getDashSeries = 3;
  break;
case 4:
	  getDashSeries = 8;
  break;
case 5:
	  getDashSeries = 5;
  break;
case 6:
	  getDashSeries = 7;
  break;
case 7:
	  getDashSeries = 4;
  break;
case 8:
	  getDashSeries = 9;
  break;
case 0:
	  getDashSeries = 6;
  break;
}
return(getDashSeries);
}

//************Function For getPlanetInBhav*********
public int getPlanetInBhava(int AscendentPosition ,int  planetPosition ) {
  int tempBhava=0; 
  tempBhava = planetPosition - AscendentPosition + 1;
  if(tempBhava <= 0){  tempBhava = tempBhava + 12;}
  return(tempBhava);
}

//****************Code
public String  fngetVarshaphalPlanetName(int intNo){
String planetName="";
String[] arrPlanetName = new String[10];
arrPlanetName[1] ="Sun";
arrPlanetName[2] ="Moon";
arrPlanetName[3] ="Mars";
arrPlanetName[4] ="Mercury";
arrPlanetName[5] ="Jupiter";
arrPlanetName[6] ="Venus";
arrPlanetName[7] ="Saturn";
arrPlanetName[8] ="Rahu";
arrPlanetName[9] ="Ketu";

switch(intNo){
case 1:
	  planetName = arrPlanetName[1];
	  break;
case 2:
	  planetName = arrPlanetName[2];
	  break;
case 3:
	  planetName = arrPlanetName[3];
	  break;
case 4:
	  planetName = arrPlanetName[4];
	  break;
case 5:
	  planetName = arrPlanetName[5];
	  break;
case 6:
	  planetName = arrPlanetName[6];
	  break;
case 7:
	  planetName = arrPlanetName[7];
	  break;
case 8:
	  planetName = arrPlanetName[8];
	  break;
case 9:
	  planetName = arrPlanetName[9];
	  break;
}
return(planetName);
}
%>


