<%@page import="com.cslsoftware.matchmaking.MatchMaking"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.enghoro.EngHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.MatchMakingDAO"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Match Making Results</title>
<link rel='stylesheet' type='text/css' href='/styles.css'>
</head>
<body >
<!--#include virtual = "/header_no.inc"-->
<!--#INCLUDE virtual = "/DbConnection.inc"-->

<%
//Dim negate ,negate2,negate3
//Dim mangalDoshCompatibility 
//Dim ashtakootDoshCompatibility 
//Dim maleRashi ,femaleRashi,degOfBoy,degOfGirl
//Dim tara(2)
//Dim place1, LatDeg1,LatMin1,LongDeg1,LongMin1 
//Dim LatNS1,LongEW1,place2,LatDeg2,LatMin2,LongDeg2
//Dim LongMin2,LatNS2,LongEW2,cityID1,cityIDForGirl
//Dim maleVarna,femaleVarna,maleYoni,femaleYoni
//Dim maleVaishya,femaleVaishya,maleTara,femaleTara
//Dim maleNadi,femaleNadi,maleBhakoot,femaleBhakoot
//Dim maleRash,femaleRash,maleGana,femaleGana
//Dim taraNo(2)
//Dim maleMangalDosh,maleMangalDoshStr,femaleMangalDosh
//Dim femaleMangalDoshStr 
//Dim  maleName,femaleName

  //Initialize The Variables
  boolean mangalDoshCompatibility = true;
  boolean ashtakootDoshCompatibility = true;

  String name1 = Util.safestr(request.getParameter("name1"));
  String day1 = Util.safestr(request.getParameter("day1"));
  String month1 = Util.safestr(request.getParameter("month1"));
  String year1 = Util.safestr(request.getParameter("year1"));
  String hrs1 = Util.safestr(request.getParameter("hrs1"));
  String min1 = Util.safestr(request.getParameter("min1"));
  String sec1 = Util.safestr(request.getParameter("sec1"));
  String place1 = Util.safestr(request.getParameter("place1"));
  String LatDeg1 = Util.safestr(request.getParameter("LatDeg1"));
  String LatMin1 =Util.safestr(request.getParameter("LatMin1"));
  String LatNS1 = Util.safestr(request.getParameter("LatNS1"));
  String LongDeg1 = Util.safestr(request.getParameter("LongDeg1"));
  String LongMin1 = Util.safestr(request.getParameter("LongMin1"));
  String LongEW1 = Util.safestr(request.getParameter("LongEW1"));
  String timeZone1 = Util.safestr(request.getParameter("timeZone1"));
  String dst1 = Util.safestr(request.getParameter("dst1"));
  
        String LatNSval1 ="",LongEWval1="";
		if(LatNS1.equals("N")) {
		  LatNSval1="1";
		}else{
		  LatNSval1="0";
		}
	   
       if(LongEW1.equals("E")) {
	   LongEWval1="1";
       } else{
	   LongEWval1="0";
       }
		

       String name2 = Util.safestr(request.getParameter("name2"));
       String day2 = Util.safestr(request.getParameter("day2"));
       String month2 =Util.safestr(request.getParameter("month2"));
       String year2 = Util.safestr(request.getParameter("year2"));
       String hrs2 = Util.safestr(request.getParameter("hrs2"));
       String min2 = Util.safestr(request.getParameter("min2"));
       String sec2 = Util.safestr(request.getParameter("sec2"));
       String place2 = Util.safestr(request.getParameter("place2"));
       String LatDeg2 = Util.safestr(request.getParameter("LatDeg2"));
       String LatMin2 =Util.safestr(request.getParameter("LatMin2"));
       String LatNS2 = Util.safestr(request.getParameter("LatNS2"));
       String LongDeg2 = Util.safestr(request.getParameter("LongDeg2"));
       String LongMin2 = Util.safestr(request.getParameter("LongMin2"));
       String LongEW2 = Util.safestr(request.getParameter("LongEW2"));
       String timeZone2 = Util.safestr(request.getParameter("timeZone2"));
       String dst2 = Util.safestr(request.getParameter("dst2"));

       String LatNSval2 ="",LongEWval2="";
		if(LatNS2.equals("N")){
		  LatNSval2="1";
		}else{
		  LatNSval2="0";
		}
	   
       if(LongEW2.equals("E")) {
	    LongEWval2="1";
       }else{
	   LongEWval2="0";
       } 
		
      

 %>
<!-- <p>&nbsp;<img src="Images\kushal\bhoot1.jpg"></p> -->
<p>&nbsp;</p>
<h2 align="center">Guna Milan</h2>
  
  <center>
  <table border="1" style="border-collapse: collapse" bordercolor="#990000" cellpadding="0" cellspacing="0" width="90%">
    <tr> 
      <th> 
	 GUNA
      </th>
      <th> 
	BOY
      </th>
      <th> 
	GIRL
      </th>
      <th> 
	MAXIMUM OBTAINED
      </th>
      <th > 
	OBTAINED POINTS
      </th>
      <th > 
	AREA OF LIFE
      </th>
    </tr>
    <%
    //SETTER FOR MALE DETAILS
    
    EngHoro objHoroMale = new EngHoro();
    Constants ObjConst = new Constants();
  // Set objHoroMale = Server.Createobject("HoroDesktop.EngHoro")
  // set ObjConst = server.CreateObject("HoroDesktop.Constants")
	 ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
    objHoroMale.setName(name1);
	objHoroMale.setPlace(place1);
	objHoroMale.setTimeZone(timeZone1);
	 
	objHoroMale.setMaleFemale("M");
	objHoroMale.setSecondOfBirth(sec1);
	objHoroMale.setMinuteOfBirth(min1);
	objHoroMale.setHourOfBirth(hrs1);
	objHoroMale.setDayOfBirth(day1);
	objHoroMale.setMonthOfBirth(month1);
	objHoroMale.setYearOfBirth(year1);
	objHoroMale.setDegreeOfLattitude(LatDeg1);
	objHoroMale.setDegreeOfLongitude(LongDeg1);
	objHoroMale.setSecondOfLattitude("00");
	objHoroMale.setSecondOfLongitude("00");
	objHoroMale.setMinuteOfLongitude(LongMin1);
	objHoroMale.setMinuteOfLattitude(LatMin1);
	objHoroMale.setEastWest(LongEW1);
	objHoroMale.setNorthSouth(LatNS1);
	objHoroMale.setDST(dst1);
	objHoroMale.initialize();
%>
<%  //SETTER FOR FEMALE VALUES

    EngHoro objHoroFeMale = new EngHoro();
    //Constants ObjConst = new Constants();
   //Set objHoroFeMale = Server.Createobject("HoroDesktop.EngHoro")
	objHoroFeMale.setName(name2);
	objHoroFeMale.setPlace(place2);
	objHoroFeMale.setTimeZone(timeZone2);
	//objHoroFeMale.setTimeZone("5.5")
	objHoroFeMale.setMaleFemale("F");
	objHoroFeMale.setSecondOfBirth(sec2);
	objHoroFeMale.setMinuteOfBirth(min2);
	objHoroFeMale.setHourOfBirth(hrs2);
	objHoroFeMale.setDayOfBirth(day2);
    objHoroFeMale.setMonthOfBirth(month2);
	objHoroFeMale.setYearOfBirth(year2);
	objHoroFeMale.setDegreeOfLattitude(LatDeg2);
	objHoroFeMale.setDegreeOfLongitude(LongDeg2);
	objHoroFeMale.setSecondOfLattitude("00");
	objHoroFeMale.setSecondOfLongitude("00");
	objHoroFeMale.setMinuteOfLongitude(LongMin2);
	objHoroFeMale.setMinuteOfLattitude(LatMin2);
	objHoroFeMale.setEastWest(LongEW2);
	objHoroFeMale.setNorthSouth(LatNS2);
	objHoroFeMale.setDST(dst2);
	objHoroFeMale.initialize();
//-------------------------	


  //CODE TO CREATE OBJECT OF MATCHMAKING
  //*************************************
//  Set matchmaking=Server.CreateObject("Horodesktop.Matchmaking")
   // matchMaking.setLanguageCode ("0")
   // matchMaking.initializesArrayValues	
   
   	MatchMaking matchmaking = new MatchMaking();
   	matchmaking.setLanguageCode ("0");  
   	matchmaking.initializesArrayValues();  
  
  //CODE TO GET RESULT OF MATCHMAKING	
 //'**********************************
//Dim strString , StrHeading 
//Dim  strMarriage,myArray3(7),myArray4(7) 
//Dim myArray1(12) , arrTara,myArray2(7)
//Dim arrHeading(7),totalGuna, k 

//calculate for Boy
//Dim nakshatraMale, maleRasiNumber   
int nakshatraMale = objHoroMale.getNakshatra();
int maleRasiNumber = objHoroMale.getRasi() + 1;
double degOfBoy = objHoroMale.getMoon();
   
 //calculate for girl
//Dim nakshatraFemale, femaleRasiNumber
int nakshatraFemale = objHoroFeMale.getNakshatra();
int femaleRasiNumber = objHoroFeMale.getRasi() + 1;
double degOfGirl = objHoroFeMale.getMoon();
//Array For Guna Headings

 String[] arrHeading = new String[8];
arrHeading[0] = "Varna";
arrHeading[1] = "Vasya";
arrHeading[2] = "Tara";
arrHeading[3] = "Yoni";
arrHeading[4] = "Maitri";
arrHeading[5] = "Gana";
arrHeading[6] = "Bhakoot";
arrHeading[7] = "Nadi";

String[] myArray1 = new String[8];
myArray1[0] = FormatString(matchmaking.getVarna(maleRasiNumber));
myArray1[1] = FormatString(matchmaking.getVashya(degOfBoy));
//Redim arrTara(2)
  String[] arrTara = matchmaking.getTara(degOfBoy, degOfGirl);
myArray1[2] = FormatString(arrTara[0]);
myArray1[3] = FormatString(matchmaking.getYoni(degOfBoy));
myArray1[4] = FormatString(matchmaking.getGraha(maleRasiNumber));  //for graha maitri
myArray1[5] = FormatString(matchmaking.getGana(degOfBoy));
myArray1[6] = FormatString(objHoroMale.getRasiName());
myArray1[7] = FormatString(matchmaking.getNadi(degOfBoy));
  
String[] myArray2 = new String[8];
myArray2[0] = FormatString(matchmaking.getVarna(femaleRasiNumber));
myArray2[1] = FormatString(matchmaking.getVashya(degOfGirl));
myArray2[2] = FormatString(arrTara[1]);
myArray2[3] = FormatString(matchmaking.getYoni(degOfGirl));
myArray2[4] = FormatString(matchmaking.getGraha(femaleRasiNumber));  //for graha maitri
myArray2[5] = FormatString(matchmaking.getGana(degOfGirl));
myArray2[6] = FormatString(objHoroFeMale.getRasiName());
myArray2[7] = FormatString(matchmaking.getNadi(degOfGirl));
 
int[] myArray3 = new int[8];
myArray3[0] = matchmaking.getMaximumVarna();
myArray3[1] = matchmaking.getMaximumVashya();
myArray3[2] = matchmaking.getMaximumTara();
myArray3[3] = matchmaking.getMaximumYoni();
myArray3[4] = matchmaking.getMaximumGrahaMaitri();
myArray3[5] = matchmaking.getMaximumGana();
myArray3[6] = matchmaking.getMaximumBhakoot();
myArray3[7] = matchmaking.getMaximumNadi();
 
double[] myArray4 = new double[8];
myArray4[0] = matchmaking.matchVarnaGuna(maleRasiNumber, femaleRasiNumber);
myArray4[1] = matchmaking.matchVashyaGuna(degOfBoy, degOfGirl);
myArray4[2] = matchmaking.matchTaraGuna(degOfBoy, degOfGirl);
myArray4[3] = matchmaking.matchYoniGuna(degOfBoy, degOfGirl);
myArray4[4] = matchmaking.matchGrahaMitraGuna(maleRasiNumber, femaleRasiNumber);
myArray4[5] = matchmaking.matchGanaGuna(degOfBoy, degOfGirl);
myArray4[6] = matchmaking.matchBhakutGuna(maleRasiNumber, femaleRasiNumber);
myArray4[7] = matchmaking.matchNadiGuna(degOfBoy, degOfGirl);

 
String[] arrAreaOfLife = new String[8];
arrAreaOfLife[0] = matchmaking.getAreaOfLife(1);
arrAreaOfLife[1] = matchmaking.getAreaOfLife(2);
arrAreaOfLife[2] = matchmaking.getAreaOfLife(3);
arrAreaOfLife[3] = matchmaking.getAreaOfLife(4);
arrAreaOfLife[4] = matchmaking.getAreaOfLife(5);
arrAreaOfLife[5] = matchmaking.getAreaOfLife(6);
arrAreaOfLife[6] = matchmaking.getAreaOfLife(7);
arrAreaOfLife[7] = matchmaking.getAreaOfLife(8);
 //---------------------------------------------
 %>
 
 <%for(int i=0 ;i<= 7;i++){ %>
 <tr>
 <td><%=arrHeading[i]%>&nbsp;</td>
 <td><%=myArray1[i]%>&nbsp;</td>
 <td ><%=myArray2[i]%>&nbsp;</td>
 <td ><%=myArray3[i]%>&nbsp;</td>
 <td ><%=myArray4[i]%>&nbsp;</td>
 <td ><%=arrAreaOfLife[i]%>&nbsp;</td>
 </tr>
 <%}%>
</table>
  </center>
 
<%//Code For Total Guna

double totalGuna = 0;
for(int k = 0 ;k<= 7;k++){
 totalGuna = totalGuna + myArray4[k];
}
%>
<br><br>
<center>
<b>Total Guna Milan&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
36&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <%=totalGuna%></b></center>
<% //Code For Mangal Dosh & Marriage Preferability


//********************Code For Mangal Dosh & Marriage Preferability***************************    
//Dim blnComp,blnGunaMilan, strConclusion
   
boolean blnComp,blnGunaMilan;
String strConclusion = "";
if(matchmaking.calculateCompatibilityForMangalDosh(objHoroMale.CalcMangalDosh(),objHoroFeMale.CalcMangalDosh()))
{
    blnComp = true;
} 
else 
{
    blnComp = false;
}

if(matchmaking.getTotal() >= 18)
{
    blnGunaMilan = true;
}
else
{
    blnGunaMilan = false;
}
    
if(blnComp && blnGunaMilan)
{
    strConclusion = "This Marriage Is Preferable.";
}
else
{
    if(blnComp && !blnGunaMilan)
    {
        strConclusion ="This marriage is NOT preferable due to low match points obtained.";
    }
    else if(!blnComp && !blnGunaMilan)
    {
    	strConclusion = "This marriage is NOT preferable due to Mangal Dosha and low match points obtained." ;
    }
    else if(!blnComp && blnGunaMilan)
    {
        strConclusion = "There is substantial difference in the level of Mangal Dosha compatibility of both the horoscopes. It is advisable to consult a learned astrologer before proceeding to marriage.";
    }
}

//--------------Mangal Dosh Of Boy & Girl
String BoyMangalDosh=objHoroMale.CalcMangalDoshString();
String GirlMangalDosh=objHoroFeMale.CalcMangalDoshString();
String BoyName=objHoroMale.getName(); 
String GirlName=objHoroFeMale.getName();

String strString = "Mr. " + BoyName + " has '" + BoyMangalDosh + " Mangal Dosha' and Ms. " + GirlName + " has '" + GirlMangalDosh + " Mangal Dosha'. ";
%>
 <div align="center">
   <center>
<table width="90%" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0"><tr><td style="text-align: left">
 
    &nbsp;</td>  </tr>
  <tr><td style="text-align: left">
 
    &nbsp;</td>  </tr>
  <tr><td style="text-align: left">
 
    <p style="text-align: justify">
 
    <b>Ashtakoot Matching between male and female is <%=totalGuna%>.</b>
 </td>  </tr>
  <tr><td style="text-align: left">
 
    <p style="text-align: justify">&nbsp;</td>  </tr>
  <tr><td style="text-align: left">
    <b><%=strString%></b>
   </td>  </tr>
  <tr><td style="text-align: left">
 
    <p style="text-align: justify">&nbsp;</td>  </tr>

  <tr><td style="text-align: left">
    <b>Conclusion: <%=strConclusion%></b>
    </td>  </tr></table>



<% 
 //CODE TO SET THE INTERPRETATION OF THE MATCHMAKING
  //**************************************************
	//Dim intForBoy , intForGirl 
	//Dim nakshatraMale, maleRasiNumber 
	//'Dim  arrTara
	//'Dim nakshatraFemale, femaleRasiNumber 
	//Dim  strCategory , arrHeadings(7) 
	//Dim arrInterpretation(7) 

	nakshatraMale = objHoroMale.getNakshatra();
	maleRasiNumber = objHoroMale.getRasi() + 1;
	degOfBoy = objHoroMale.getMoon();
   
	nakshatraFemale = objHoroFeMale.getNakshatra();
	femaleRasiNumber = objHoroFeMale.getRasi() + 1;
	degOfGirl = objHoroFeMale.getMoon();
	  
	String[] arrHeadings = new String[8];
	arrHeadings[0] = "Varna";
	arrHeadings[1] = "Vasya";
	arrHeadings[2] = "Tara";
	arrHeadings[3] = "Yoni";
	arrHeadings[4] = "Gana";
	arrHeadings[5] = "Nadi";
	arrHeadings[6] = "Rasi Lord";
	arrHeadings[7] = "Bhakoot";
  
	String[] arrInterpretation = new String[8];
	int intForBoy = matchmaking.calculateVarna(maleRasiNumber);
	int intForGirl = matchmaking.calculateVarna(femaleRasiNumber);
	arrInterpretation[0] = subGetMatchMakingInterpretation("VA", intForBoy, intForGirl, 0);
  
	intForBoy = matchmaking.calculateVashya(degOfBoy);
	intForGirl = matchmaking.calculateVashya(degOfGirl);
	arrInterpretation[1] = subGetMatchMakingInterpretation("VAS", intForBoy, intForGirl, 0);
  
	int[] arrTaraInt = new int[2];
	arrTaraInt = matchmaking.CalculateTara(degOfBoy, degOfGirl);
	intForBoy = arrTaraInt[0];
	intForGirl = arrTaraInt[1];
	arrInterpretation[2] = subGetMatchMakingInterpretation("TA", intForBoy, intForGirl, 0);
  
	intForBoy = matchmaking.calculateYoni(degOfBoy);
	intForGirl = matchmaking.calculateYoni(degOfGirl);
	arrInterpretation[3] = subGetMatchMakingInterpretation("YON", intForBoy, intForGirl, 0);

   intForBoy = matchmaking.calculateGraha(maleRasiNumber);
   intForGirl = matchmaking.calculateGraha(femaleRasiNumber);
   arrInterpretation[4] = subGetMatchMakingInterpretation("RAS", intForBoy, intForGirl, 0);
    
   intForBoy = matchmaking.calculateGana(degOfBoy);
   intForGirl = matchmaking.calculateGana(degOfGirl);
   arrInterpretation[5] = subGetMatchMakingInterpretation("GAN", intForBoy, intForGirl, 0);

   intForBoy = objHoroMale.getRasi();
   intForGirl = objHoroFeMale.getRasi();
   arrInterpretation[6] = subGetMatchMakingInterpretation("BH", intForBoy, intForGirl, 0); 
  
   intForBoy = matchmaking.calculateNadi(degOfBoy);
   intForGirl = matchmaking.calculateNadi(degOfGirl);
   arrInterpretation[7] = subGetMatchMakingInterpretation("NA", intForBoy, intForGirl, 0);
	%>
	 <br>
	 <p>&nbsp;</p>

<center><a href="http://www.shaadi.com/ptnr.php?ptnr=qy9tm"><font face="Ms Sans Serif" size="1" color="blue">Shaadi.com Indian Matrimonials</font></a><br><iframe src="http://origin-img.shaadi.com/shaadi-rewards/get-html-banner.php?ptnr=qy9tm&banner_type=searchbanners&banner_size=336x280" width="336" height="280" scrolling="no" frameborder="0" marginwidth="0" marginheight="0"></iframe></center>


	<h3 align="center">Interpretation<br>
	
	</h3>
	
 <center>
	
	<p></p>
	
	</center>
 </div>


	<table width="90%" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
	<tr><td  align="center" width="466" ><b><%=arrHeadings[0]%>
      </b></td></tr>
	<tr><td width="466" style="text-align: justify"><%=arrInterpretation[0]%>&nbsp;</td></tr>

	<tr><td  align="center" width="466"><b><%=arrHeadings[1]%> </b>&nbsp;</td></tr>
	<tr><td width="466" style="text-align: justify"><%=arrInterpretation[1]%>&nbsp;</td></tr>
	
	<tr><td align="center" width="466"><b><%=arrHeadings[2]%> </b>&nbsp;</td></tr>
	<tr><td width="466" style="text-align: justify"><%=arrInterpretation[2]%>&nbsp;</td></tr>

	<tr><td  align="center" width="466"><b><%=arrHeadings[3]%> </b>&nbsp;</td></tr>
	<tr><td width="466" style="text-align: justify"><%=arrInterpretation[3]%>&nbsp;</td></tr>
	
	<tr><td  align="center" width="466"><b><%=arrHeadings[4]%></b> &nbsp;</td></tr>
	<tr><td width="466" style="text-align: justify"><%=arrInterpretation[4]%>&nbsp;</td></tr>
	
	<tr><td align="center" width="466"><b><%=arrHeadings[5]%> </b>&nbsp;</td></tr>
	<tr><td width="466" style="text-align: justify"><%=arrInterpretation[5]%>&nbsp;</td></tr>
	
	<tr><td  align="center" width="466"><b><%=arrHeadings[6]%></b> &nbsp;</td></tr>
	<tr><td width="466" style="text-align: justify"><%=arrInterpretation[6]%>&nbsp;</td></tr>    
	
	<tr><td  align="center" width="466"><b><%=arrHeadings[7]%></b> &nbsp;</td></tr>
	<!-- <tr><td width="466" style="text-align: justify"><%=arrInterpretation[7]%>&nbsp;</td></tr> -->
	</table>

      </center>
 

<div align="center">
<script type="text/javascript"><!--
google_ad_client = "pub-7494543079410386";
/* 250x250, created 9/23/08, AstroSage home page square */
google_ad_slot = "5107997906";
google_ad_width = 250;
google_ad_height = 250;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>
<!-- #include virtual='/footer_no.inc'-->

</body>
</html>

<%!
public String subGetMatchMakingInterpretation(String strCategory, int intForBoy, int intForGirl, int languageCode) 
{
       return GetMatchMakingPrediction(strCategory,intForBoy,intForGirl,languageCode);       
}

public String GetMatchMakingPrediction(String Category,int IntForBoy,int IntForGirl,int languageCode)
{
	MatchMakingDAO matchDAO = new MatchMakingDAO();
	return matchDAO.getMatchMakingVal(Category, IntForBoy, IntForGirl, languageCode);
	
}
	public String FormatString(String strText)
	{
	   return SharedFunction.ProperCaseL(strText, 0);
	}

  %>
