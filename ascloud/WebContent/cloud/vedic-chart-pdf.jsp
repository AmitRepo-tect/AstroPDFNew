<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int langCodeSession = Util.safeInt(session.getAttribute("languageCode")+"");

//Set chart type based on langiuage
//String[] pdfChartTypeBasedOnLang =  {"1","1","2","1","2","2","3","1","2","1"};
//String[] pdfChartTypeBasedOnLangJava = {"0","0","1","0","1","1","2","0","1","0"};

Object objPdfChartType = session.getAttribute("PdfChartType");
String chartType1 = "";
Object objChartType = session.getAttribute("chartType");

 if(objPdfChartType != null)
{
	chartType1 = objPdfChartType.toString();
} 
DesktopHoro objhoro = (DesktopHoro) session.getAttribute("HoroscopeObj");


if(objhoro == null || objhoro.equals("")) {
    response.sendRedirect("login.asp");           
}
else{
String DashaBhog = "";
String UserDetails="";
if(objhoro != null)
{	
	if(request.getParameter("language_Code") != null)
	{
		String languageCode1 = request.getParameter("language_Code");
		
		if(languageCode1.equals("1"))
		{		
			objhoro.setLanguageCode("1");
			objhoro.initialize();
			DashaBhog = objhoro.getBalanceOfDasaString();
		}
		
		else
		{
			objhoro.setLanguageCode(languageCode1);
			objhoro.initialize();
			DashaBhog = objhoro.getBalanceOfDasaString();
		}
	}
	else
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
	}
	
	String[] arrOfBalOFDasha = DashaBhog.split(" ");
	arrOfBalOFDasha[0] = arrOfBalOFDasha[0].substring(0,3);
	String temp = "";
	for(int iCount = 1; iCount<= arrOfBalOFDasha.length-1; iCount++)
	{
		temp +=  " "+ arrOfBalOFDasha[iCount];
	}
	temp =  arrOfBalOFDasha[0]+" "+ temp;
	//dim PageNum, PageNumArray, ValueofPageNum, LenghtofPageNumArray
	
	Object RefValObj = session.getAttribute("Http_Referer"); 
	String RefVal = "";
	if(RefValObj != null)
	{
		RefVal = RefValObj.toString();
	}
	//System.out.print(RefVal.indexOf("charttype"));
	
	// Neha 13-12-2019
	//*************** this condition is for the validation fail in pdf.astrosage.com 
	// In original ur added charttype (1 to ...3) but this also added charttype (north,south...)
	if(RefVal.indexOf("charttype") > 0){RefVal =  RefVal.replace("charttype", "ChartTp");}
	
	String openkundli = "" ;
	if(request.getParameter("isopenkundli")!=null){
		openkundli = request.getParameter("isopenkundli");
	}
	
	//UserDetails="ChartType="+chartType1+"&DashaBhog="+temp.trim()+"&UserName="+objhoro.getName()+"&UserPlace="+objhoro.getPlace().trim()+"&UserTimeZone="+objhoro.getTimeZone()+"&UserSex="+objhoro.getMaleFemale()+"&UserSecondOfBirth="+objhoro.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoro.getMinuteOfBirth()+"&UserHourOfBirth="+objhoro.getHourOfBirth()+"&UserDayOfBirth="+objhoro.getDayOfBirth()+"&UserMonthOfBirth="+objhoro.getMonthOfBirth()+"&UserYearOfBirth="+objhoro.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoro.getDegreeOfLongitude()+"&UserSecondOfLattitude="+objhoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoro.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+objhoro.getMinuteOfLattitude()+"&UserEastWest="+objhoro.getEastWest()+"&UserNorthSouth="+objhoro.getNorthSouth()+"&UserDST="+objhoro.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan(objhoro)+"&UserKPHorarySeed="+objhoro.getKPHorarySeed()+"&LanguageCode="+objhoro.getLanguageCode()+"&RefVal="+RefVal+"&isopenchart="+openkundli;
	
	String pdfLangCode = String.valueOf(langCodeSession);// objhoro.getLanguageCode();
	if("1".equals(request.getParameter("language_Code")))
	{
		pdfLangCode = "1";
	}
	else if(langCodeSession == 9)
	{
		pdfLangCode = "9";
	}
	/**
	Code change - Smriti - 15th October, 2019.
	Requirement, we need to send userId and planId in the URL. userId is encrypted.
	*/
	String planId = Util.safestr(session.getAttribute("planid"));
	String userId = Util.safestr(session.getAttribute("User_Id"));
	
	UserDetails="ChartType="+chartType1+"&DashaBhog="+temp.trim()+"&UserName="+objhoro.getName()+"&UserPlace="+objhoro.getPlace().trim()+"&UserTimeZone="+objhoro.getTimeZone()+"&UserSex="+objhoro.getMaleFemale()+"&UserSecondOfBirth="+objhoro.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoro.getMinuteOfBirth()+"&UserHourOfBirth="+objhoro.getHourOfBirth()+"&UserDayOfBirth="+objhoro.getDayOfBirth()+"&UserMonthOfBirth="+objhoro.getMonthOfBirth()+"&UserYearOfBirth="+objhoro.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoro.getDegreeOfLongitude()+"&UserSecondOfLattitude="+objhoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoro.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+objhoro.getMinuteOfLattitude()+"&UserEastWest="+objhoro.getEastWest()+"&UserNorthSouth="+objhoro.getNorthSouth()+"&UserDST="+objhoro.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan(objhoro)+"&UserKPHorarySeed="+objhoro.getKPHorarySeed()+"&LanguageCode="+pdfLangCode+"&RefVal="+RefVal+"&isopenchart="+openkundli+"&us="+SharedFunction.encryptString(userId)+"&pd="+planId;
    //System.out.println(UserDetails);
 
	
	/*
	http://pdf.astrosage.com/HindiPdf.aspx?TypePdf=16,19,3,4,5,6,7,21,18,10,20,14,0,0,0,0,12,0,8,22,0,9
	Code changed by Smriti - 4th Jan, 2019. 
	//For the requirement that we need to send the marathi lang code in case of marathi pdf generation.
	if(request.getParameter("language_Code") == "1")
	{
		UserDetails="ChartType="+chartType1+"&DashaBhog="+temp.trim()+"&UserName="+objhoro.getName()+"&UserPlace="+objhoro.getPlace().trim()+"&UserTimeZone="+objhoro.getTimeZone()+"&UserSex="+objhoro.getMaleFemale()+"&UserSecondOfBirth="+objhoro.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoro.getMinuteOfBirth()+"&UserHourOfBirth="+objhoro.getHourOfBirth()+"&UserDayOfBirth="+objhoro.getDayOfBirth()+"&UserMonthOfBirth="+objhoro.getMonthOfBirth()+"&UserYearOfBirth="+objhoro.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoro.getDegreeOfLongitude()+"&UserSecondOfLattitude="+objhoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoro.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+objhoro.getMinuteOfLattitude()+"&UserEastWest="+objhoro.getEastWest()+"&UserNorthSouth="+objhoro.getNorthSouth()+"&UserDST="+objhoro.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan(objhoro)+"&UserKPHorarySeed="+objhoro.getKPHorarySeed()+"&LanguageCode="+1+"&RefVal="+RefVal+"&isopenchart="+openkundli;
	}
	else
	{
		UserDetails="ChartType="+chartType1+"&DashaBhog="+temp.trim()+"&UserName="+objhoro.getName()+"&UserPlace="+objhoro.getPlace().trim()+"&UserTimeZone="+objhoro.getTimeZone()+"&UserSex="+objhoro.getMaleFemale()+"&UserSecondOfBirth="+objhoro.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoro.getMinuteOfBirth()+"&UserHourOfBirth="+objhoro.getHourOfBirth()+"&UserDayOfBirth="+objhoro.getDayOfBirth()+"&UserMonthOfBirth="+objhoro.getMonthOfBirth()+"&UserYearOfBirth="+objhoro.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoro.getDegreeOfLongitude()+"&UserSecondOfLattitude="+objhoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoro.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+objhoro.getMinuteOfLattitude()+"&UserEastWest="+objhoro.getEastWest()+"&UserNorthSouth="+objhoro.getNorthSouth()+"&UserDST="+objhoro.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan(objhoro)+"&UserKPHorarySeed="+objhoro.getKPHorarySeed()+"&LanguageCode="+objhoro.getLanguageCode()+"&RefVal="+RefVal+"&isopenchart="+openkundli;
	}
	*/
	//System.out.println(objhoro.getAyanamsaType()+","+SharedFunction.getAyan(objhoro));
}
if(request.getParameter("page") !=null &&  request.getParameter("page").equals("1")) {
//call mainpage
//call FormatString(strText)
}else if(request.getParameter("page") !=null && request.getParameter("page").equals("2")) {
//Call prediction_details
}else if(request.getParameter("page") !=null && request.getParameter("page").equals("3")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,19,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0&"+UserDetails); 
// Call lagnaPage
}else if(request.getParameter("page") !=null &&  request.getParameter("page").equals("4")) {
//Call manglikdetails
}else if(request.getParameter("page") !=null &&  request.getParameter("page").equals("5")) {
//Call transittoday
}else if(request.getParameter("page") !=null &&  request.getParameter("page").equals("6")) {
//Call dashafhala        
}else if(request.getParameter("page") !=null &&  request.getParameter("page").equals("7")) {
//Call sadeshati 
}else if(request.getParameter("page") !=null &&  request.getParameter("page").equals("8")) {
//Call LalKitabPrediction 
}else if(request.getParameter("page") !=null && request.getParameter("page").equals("9")) {
//Call varshfhalPage
}else if(request.getParameter("page") !=null &&  request.getParameter("page").equals("10")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0&"+UserDetails); 
//Call KalSarpyaYogaReport
}else if(request.getParameter("page") !=null && request.getParameter("page").equals("11")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,22,0,0&"+UserDetails);  
// Call PlanetConsiderationReportPDF      
}else if(request.getParameter("page") !=null && request.getParameter("page").equals("12")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9&"+UserDetails); 
//Call AscendantPrediction                              
//}else if(request.getParameter("page") !=null && request.getParameter("page").equals("0")) {
}
else if(request.getParameter("page") !=null && request.getParameter("page").equals("13")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0&"+UserDetails);
	//out.println("http://pdf.astrosage.com/HindiPdf.aspx?TypePdf=0,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0&"+UserDetails);
//Call lalkitab                            
//}else if(request.getParameter("page") !=null && request.getParameter("page").equals("0")) {
}
else if(request.getParameter("page") !=null && request.getParameter("page").equals("14")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,0,0,0,0&"+UserDetails);
	//out.println("http://pdf.astrosage.com/HindiPdf.aspx?TypePdf=0,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0&"+UserDetails);
//Call kp                          
//}else if(request.getParameter("page") !=null && request.getParameter("page").equals("0")) {
}
else if(request.getParameter("page") !=null && request.getParameter("page").equals("15")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,0,0,0,0,23&"+UserDetails);
	//out.println("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0&"+UserDetails);
//Call lalkitab                            
//}else if(request.getParameter("page") !=null && request.getParameter("page").equals("0")) {
}
else if(request.getParameter("page") !=null && request.getParameter("page").equals("16")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0&"+UserDetails);
	//out.println("http://pdf.astrosage.com/HindiPdf.aspx?TypePdf=0,0,0,0,0,0,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,0&"+UserDetails);
//Call lalkitab                            
//}else if(request.getParameter("page") !=null && request.getParameter("page").equals("0")) {
}
else if(request.getParameter("page") !=null && request.getParameter("page").equals("17")) {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=16,19,0,0,0,0,0,0,0,10,0,14,2,1,11,13,12,15,0,0,0,0,23&"+UserDetails);
	//out.println("http://pdf.astrosage.com/HindiPdf.aspx?TypePdf=16,19,0,0,0,0,0,0,0,10,0,14,2,1,11,13,12,15,0,0,0,0,23&"+UserDetails);
//Call lalkitab                            
//}else if(request.getParameter("page") !=null && request.getParameter("page").equals("0")) {
}else {
	response.sendRedirect("http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,17,0&"+UserDetails);
       }
}
%>