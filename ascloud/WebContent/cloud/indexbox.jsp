<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--#include file="utl.asp"-->
<!--#include file="fpdf.asp"-->
<!--#include file="planet-consideration-pdf.asp"-->
<!--#include file="kalsarpa-yoga-pdf.asp"-->
<!--#include file="prediction-details.asp"-->
<!--#include file="d-lagnapagenew.asp"-->
<!--#include file="manglik-details.asp"-->
<!--#include file="transit-today-PDF.asp"-->
<!--#include file="sade-shati-pdf.asp"-->
<!--#include file="dasha-fhala-pdf.asp"-->
<!--#include file="varsh-fhal-pdf.asp"-->
<!--#include file="Lalkitab_Prediction_PDF.asp"-->
<!--#include file="p_shodashvargaNew.asp"-->
<!--#include file="p_kppageNew.asp"-->
<!--#include file="CharDasha-pdfnew.asp"-->
<!--#include file="YoginiDasha-pdfnew.asp"-->
<!--#include file="friendship-pdfnew.asp"-->
<!--#include file="ShadAndBhav-pdfnew.asp"-->
<!--#include file="AshtakTable-pdfnew.asp"-->
<!--#include file="Prastharashtakvarga-pdfNew.asp"-->
<!--#include file="p_lalkitabNew.asp"-->
<!--#include file="Functions.asp"-->
<!--#include virtual = "/util/get-ayanamsa.asp"-->  
<%
int langCodeSession = Util.safeInt(session.getAttribute("languageCode")+"");
//Set chart type based on langiuage
//String[] pdfChartTypeBasedOnLang =  {"1","1","2","1","2","2","3","1","2","1"};
//String[] pdfChartTypeBasedOnLangJava = {"0","0","1","0","1","1","2","0","1","0"};

String pageNum = request.getParameter("pagecounter");
String noOfYears = request.getParameter("yearOfAP");
String startingYear = request.getParameter("startingYear");
String usChartId = request.getParameter("userChartId");
String Type1 ="";
if (noOfYears == null){
	noOfYears="5";
}
if (startingYear == null){
	startingYear="2020";
}
if (usChartId == null){
	usChartId="";
}
int lengthOfString = 0;
if(pageNum != null)
{
Object objPdfChartType = session.getAttribute("PdfChartType");
String chartType1 = "";

 if(objPdfChartType != null)
{
	chartType1 = objPdfChartType.toString();
} 

DesktopHoro objhoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
String DashaBhog = "";
String UserDetails="";
if(objhoro != null)
{
	if(objhoro.getLanguageCode().equals("1"))
	{
		objhoro.setLanguageCode("0");
		objhoro.initialize();
		DashaBhog = objhoro.getBalanceOfDasaString();
		objhoro.setLanguageCode("1");
		objhoro.initialize();
	}
	else
	{
		DashaBhog = objhoro.getBalanceOfDasaString();
	}
	
	String[] arrOfBalOFDasha = DashaBhog.split(" ");
	arrOfBalOFDasha[0] = arrOfBalOFDasha[0].substring(0,3);
	String temp = "";
	for(int iCount = 1; iCount<= arrOfBalOFDasha.length-1; iCount++)
	{
		temp +=  " "+ arrOfBalOFDasha[iCount];
	}
	//dim PageNum, PageNumArray, ValueofPageNum, LenghtofPageNumArray
	
	Object RefValObj = session.getAttribute("Http_Referer"); 
	String RefVal = "";
	if(RefValObj != null)
	{
		RefVal = RefValObj.toString();
	}
	
	// Neha 13-12-2019
		//*************** this condition is for the validation fail in pdf.astrosage.com 
		// In original ur added charttype (1 to ...3) but this also added charttype (north,south...)
		if(RefVal.indexOf("charttype") > 0){RefVal =  RefVal.replace("charttype", "ChartTp");}
	
	String planId = Util.safestr(session.getAttribute("planid"));
	String userId = Util.safestr(session.getAttribute("User_Id"));
	
	String pdfLangCode = String.valueOf(langCodeSession);// objhoro.getLanguageCode();
	UserDetails="ChartType="+chartType1+"&DashaBhog="+temp.trim()+"&UserName="+objhoro.getName()+"&UserPlace="+objhoro.getPlace().trim()+"&UserTimeZone="+objhoro.getTimeZone()+"&UserSex="+objhoro.getMaleFemale()+"&UserSecondOfBirth="+objhoro.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoro.getMinuteOfBirth()+"&UserHourOfBirth="+objhoro.getHourOfBirth()+"&UserDayOfBirth="+objhoro.getDayOfBirth()+"&UserMonthOfBirth="+objhoro.getMonthOfBirth()+"&UserYearOfBirth="+objhoro.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoro.getDegreeOfLongitude()+"&UserSecondOfLattitude="+objhoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoro.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+objhoro.getMinuteOfLattitude()+"&UserEastWest="+objhoro.getEastWest()+"&UserNorthSouth="+objhoro.getNorthSouth()+"&UserDST="+objhoro.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan(objhoro)+"&UserKPHorarySeed="+objhoro.getKPHorarySeed()+"&LanguageCode="+pdfLangCode+"&RefVal="+RefVal+"&us="+SharedFunction.encryptString(userId)+"&pd="+planId+"&yearOfAP="+noOfYears+"&startingAPYear="+startingYear+"&userChartId="+usChartId;

}
	Type1 = pageNum;
	String path="http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf="+Type1+"&"+UserDetails;
	response.sendRedirect(path);
        
}
%>

