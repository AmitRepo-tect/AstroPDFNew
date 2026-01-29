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
int lengthOfString = 0;
if(pageNum != null)
{
 lengthOfString = pageNum.length();
 String[] pageNumArray = new String[23];
pageNumArray = pageNum.split(",");
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
	UserDetails="ChartType="+chartType1+"&DashaBhog="+temp.trim()+"&UserName="+objhoro.getName()+"&UserPlace="+objhoro.getPlace().trim()+"&UserTimeZone="+objhoro.getTimeZone()+"&UserSex="+objhoro.getMaleFemale()+"&UserSecondOfBirth="+objhoro.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoro.getMinuteOfBirth()+"&UserHourOfBirth="+objhoro.getHourOfBirth()+"&UserDayOfBirth="+objhoro.getDayOfBirth()+"&UserMonthOfBirth="+objhoro.getMonthOfBirth()+"&UserYearOfBirth="+objhoro.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoro.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoro.getDegreeOfLongitude()+"&UserSecondOfLattitude="+objhoro.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoro.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoro.getMinuteOfLongitude()+"&UserMinuteOfLattitude="+objhoro.getMinuteOfLattitude()+"&UserEastWest="+objhoro.getEastWest()+"&UserNorthSouth="+objhoro.getNorthSouth()+"&UserDST="+objhoro.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan(objhoro)+"&UserKPHorarySeed="+objhoro.getKPHorarySeed()+"&LanguageCode="+pdfLangCode+"&RefVal="+RefVal+"&us="+SharedFunction.encryptString(userId)+"&pd="+planId;;

}
	String Type1 = "";
	if(pageNumArray[0].equals("1"))
	{
		Type1 = "16,";
	}
	else
	{
		Type1 = "0,";
	}
	if(pageNumArray[1].equals("2"))
	{
		Type1 += "19,";
	}
	else
	{
		Type1 += "0,";
	}
    
	if(pageNumArray[2].equals("3"))
	{
		Type1 += "3,";
	}
	else
	{
		Type1 += "0,";
	}
    
	if(pageNumArray[3].equals("4"))
	{
		Type1 += "4,";
	}
	else
	{
		Type1 += "0,";
	}
     
	if(pageNumArray[4].equals("5"))
	{
		Type1 += "5,";
	}
	else
	{
		Type1 += "0,";
	}
       
	if(pageNumArray[5].equals("6"))
	{
		Type1 += "6,";
	}
	else
	{
		Type1 += "0,";
	}            
                
	if(pageNumArray[6].equals("7"))
	{
		Type1 += "7,";
	}
	else
	{
		Type1 += "0,";
	}       
    
	if(pageNumArray[7].equals("8"))
	{
		Type1 += "21,";
	}
	else
	{
		Type1 += "0,";
	} 
        
	if(pageNumArray[8].equals("9"))
	{
		Type1 += "18,";
	}
	else
	{
		Type1 += "0,";
	}     
        
	if(pageNumArray[9].equals("10"))
	{
		Type1 += "10,";
	}
	else
	{
		Type1 += "0,";
	}     
        
	if(pageNumArray[10].equals("11"))
	{
		Type1 += "20,";
	}
	else
	{
		Type1 += "0,";
	}     
        
	if(pageNumArray[11].equals("12"))
	{
		Type1 += "14,";
	}
	else
	{
		Type1 += "0,";
	}     
        
	if(pageNumArray[12].equals("13"))
	{
		Type1 += "2,";
	}
	else
	{
		Type1 += "0,";
	}     

	if(pageNumArray[13].equals("14"))
	{
		Type1 += "1,";
	}
	else
	{
		Type1 += "0,";
	}     

	if(pageNumArray[14].equals("15"))
	{
		Type1 += "11,";
	}
	else
	{
		Type1 += "0,";
	}     
             
	if(pageNumArray[15].equals("16"))
	{
		Type1 += "13,";
	}
	else
	{
		Type1 += "0,";
	}                  
        
	if(pageNumArray[16].equals("17"))
	{
		Type1 += "12,";
	}
	else
	{
		Type1 += "0,";
	}     
      
	if(pageNumArray[17].equals("18"))
	{
		Type1 += "15,";
	}
	else
	{
		Type1 += "0,";
	}     
        
	if(pageNumArray[18].equals("19"))
	{
		Type1 += "8,";
	}
	else
	{
		Type1 += "0,";
	}     
        
	if(pageNumArray[19].equals("20"))
	{
		Type1 += "22,";
	}
	else
	{
		Type1 += "0,";
	}     
        
	if(pageNumArray[20].equals("21"))
	{
		Type1 += "17,";
	}
	else
	{
		Type1 += "0,";
	}      
        
	 
	if(pageNumArray[21] != null && pageNumArray[21].equals("22"))
	{
		Type1 += "9,";
	}
	else
	{
		Type1 += "0,";
	}     
       
	if(pageNumArray[22] != null && pageNumArray[22].equals("23"))
	{
		Type1 += "23,";
	}
	else
	{
		Type1 += "0,";
	} 
       //out.println(Type1);   
       
	
    String path="http://pdf.astrosage.com/HindiPdfNew.aspx?TypePdf="+Type1+"&"+UserDetails;
   // out.print(path);
     
    response.sendRedirect(path);
        
}
%>

