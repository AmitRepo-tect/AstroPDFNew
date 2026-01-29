<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%
    //testing id rs, Mr punit Id- punit, Mr Pratik Id- pandeypratik, Miss satya Id- satya@ojassoft.com, Mr Raj Id- stjhumroo, Mr Nitin Id- nitingupta1, Mr Rishab Id- rishab2796
    if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")&& (session.getAttribute("User_Id").equals("rs") || session.getAttribute("User_Id").equals("punit") || session.getAttribute("User_Id").equals

("pandeypratik") || session.getAttribute("User_Id").equals("swatee88") || session.getAttribute("User_Id").equals("shubham13shukla") || session.getAttribute("User_Id").equals("vishdutta953") || session.getAttribute("User_Id").equals("singhsakshi10"))) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Find Report</title>
    <meta name="description" content="Quick link Report" />
    <meta name="keywords" content="Quick link Report" />
    <link rel='stylesheet' type='text/css' href='/styles.css' />
</head>
<body>
<%
String DashaBhog = "",tempdasha="",UserDetailsNew="",downloadLoveRomanceReport="";
String downloadFreePDFReport="", downloadlinkPHoro="", downloadBrihatHoroReport="",downloadBrihatHoroReportPrint="",downloadStreamReportPrint = "", downloadCCReportPrint = "", downloadStreamReport = "", downloadCCReport = "", 

downloadlink = "", downloadlinkRajYoga="",UserDetails="",downloadlinkVarshPatrika="",downloadlinkYearBook="",downloadlinkShaniReport="",downloadlinkAnnualPDFReport="", download12ReportPrint="", download12Report="";
if(session.getAttribute("HoroscopeObj")!=null && !session.getAttribute("HoroscopeObj").equals("")) {
	
	 DesktopHoro objhoropdf = (DesktopHoro)session.getAttribute("HoroscopeObj");
if(objhoropdf.getLanguageCode().equals("1")){

    objhoropdf.setLanguageCode("0");
    objhoropdf.initialize();
    DashaBhog = objhoropdf.getBalanceOfDasa().toString();
	objhoropdf.setLanguageCode("1");
    objhoropdf.initialize();
}else{
    DashaBhog = objhoropdf.getBalanceOfDasa().toString();
}

String[] arrOfBalOFDasha = DashaBhog.split(" ");//split(DashaBhog," ")
for(int iCount = 0 ; iCount<= arrOfBalOFDasha.length-1 ; iCount++){ 
   if(iCount == 0) {
     arrOfBalOFDasha[iCount] = arrOfBalOFDasha[iCount].substring(0,3);//Left(arrOfBalOFDasha(iCount),3)
   }
   tempdasha = tempdasha +" "+ arrOfBalOFDasha[iCount];
}
int chartType1= Integer.parseInt(session.getAttribute("PdfChartType").toString());
int chartType2= Integer.parseInt(session.getAttribute("chartType").toString());
UserDetails="ChartType="+chartType1+"&DashaBhog="+tempdasha.trim()+"&UserName="+objhoropdf.getName()+"&UserPlace="+objhoropdf.getPlace().trim()+"&UserTimeZone="+objhoropdf.getTimeZone()+"&UserSex="+objhoropdf.getMaleFemale

()+"&UserSecondOfBirth="+objhoropdf.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoropdf.getMinuteOfBirth()+"&UserHourOfBirth="+objhoropdf.getHourOfBirth()+"&UserDayOfBirth="+objhoropdf.getDayOfBirth

()+"&UserMonthOfBirth="+objhoropdf.getMonthOfBirth()+"&UserYearOfBirth="+objhoropdf.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoropdf.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoropdf.getDegreeOfLongitude

()+"&"+"UserSecondOfLattitude="+objhoropdf.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoropdf.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoropdf.getMinuteOfLongitude

()+"&UserMinuteOfLattitude="+objhoropdf.getMinuteOfLattitude()+"&UserEastWest="+objhoropdf.getEastWest()+"&UserNorthSouth="+objhoropdf.getNorthSouth()+"&UserDST="+objhoropdf.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan

(objhoropdf)+"&UserKPHorarySeed="+objhoropdf.getKPHorarySeed()+"&VarshphalYear="+"&LanguageCode="+objhoropdf.getLanguageCode()+"&User=ojasreports&Password=ojas$321";
UserDetailsNew="ChartType="+chartType2+"&DashaBhog="+tempdasha.trim()+"&UserName="+objhoropdf.getName()+"&UserPlace="+objhoropdf.getPlace().trim()+"&UserTimeZone="+objhoropdf.getTimeZone()+"&UserSex="+objhoropdf.getMaleFemale

()+"&UserSecondOfBirth="+objhoropdf.getSecondOfBirth()+"&UserMinuteOfBirth="+objhoropdf.getMinuteOfBirth()+"&UserHourOfBirth="+objhoropdf.getHourOfBirth()+"&UserDayOfBirth="+objhoropdf.getDayOfBirth

()+"&UserMonthOfBirth="+objhoropdf.getMonthOfBirth()+"&UserYearOfBirth="+objhoropdf.getYearOfBirth()+"&UserDegreeOfLattitude="+objhoropdf.getDegreeOfLattitude()+"&UserDegreeOfLongitude="+objhoropdf.getDegreeOfLongitude

()+"&"+"UserSecondOfLattitude="+objhoropdf.getSecondOfLattitude()+"&UserSecondOfLongitude="+objhoropdf.getSecondOfLongitude()+"&UserMinuteOfLongitude="+objhoropdf.getMinuteOfLongitude

()+"&UserMinuteOfLattitude="+objhoropdf.getMinuteOfLattitude()+"&UserEastWest="+objhoropdf.getEastWest()+"&UserNorthSouth="+objhoropdf.getNorthSouth()+"&UserDST="+objhoropdf.getDST()+"&UserAyanamsaType="+SharedFunction.getAyan

(objhoropdf)+"&UserKPHorarySeed="+objhoropdf.getKPHorarySeed()+"&VarshphalYear="+"&LanguageCode="+objhoropdf.getLanguageCode()+"&User=ojasreports&Password=ojas$321";
downloadlink = "http://pdf.astrosage.com/HindiPdfLG.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,17,0&"+UserDetails; 
downloadlinkRajYoga = "http://aspdf.astrosage.com/pdfreport?pdftype=6&ispdf=1&margin=&"+UserDetailsNew; 
downloadlinkVarshPatrika = "http://pdf.astrosage.com/AnnualPdf.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,102,0&"+UserDetails;
downloadlinkYearBook = "http://pdf.astrosage.com/AnnualPdfNew.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,102,0&"+UserDetails;
downloadlinkShaniReport = "http://pdf.astrosage.com/SadesatiReport.aspx?TypePdf=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,102,0&"+UserDetails ;
downloadlinkAnnualPDFReport = "http://aspdf.astrosage.com/createannualpdf?"+UserDetailsNew;
downloadCCReport = "http://aspdf.astrosage.com/pdfreport?pdftype=3&ispdf=1&margin=&"+UserDetailsNew;
downloadStreamReport = "http://aspdf.astrosage.com/pdfreport?pdftype=1&ispdf=1&margin=&"+UserDetailsNew;
download12Report = "http://aspdf.astrosage.com/pdfreport?pdftype=9&ispdf=1&margin=&"+UserDetailsNew;
downloadCCReportPrint = "http://aspdf.astrosage.com/pdfreport?pdftype=3&ispdf=1&margin=10&"+UserDetailsNew;
downloadStreamReportPrint = "http://aspdf.astrosage.com/pdfreport?pdftype=1&ispdf=1&margin=10&"+UserDetailsNew;
download12ReportPrint = "http://aspdf.astrosage.com/pdfreport?pdftype=9&ispdf=1&margin=10&"+UserDetailsNew;
downloadBrihatHoroReport = "http://aspdf.astrosage.com/pdfreport?pdftype=7&ispdf=1&margin=&"+UserDetailsNew;
downloadBrihatHoroReportPrint = "http://aspdf.astrosage.com/pdfreport?pdftype=7&ispdf=1&&margin=8&marginr=8&"+UserDetailsNew;
downloadFreePDFReport = "https://aspdf.astrosage.com/pdfreport?pdftype=8&ispdf=1&margin=&us=qvoju&pd=3&"+UserDetailsNew;
downloadlinkPHoro = "https://aspdf.astrosage.com/personalizedhoroscopepdf?"+UserDetails+"&iscampaign=true";
downloadLoveRomanceReport = "http://aspdf.astrosage.com/pdfreport?pdftype=11&ispdf=1&margin=&"+UserDetailsNew;
    }
//out.println(UserDetails+"<br/>");
//out.println(downloadlink+"<br/>");
//out.println(downloadlinkRajYoga+"<br/>");
//out.println(downloadlinkVarshPatrika);

 %>
     <h1 align="center">
    <div class="notice1"><b>Report</b>
    </div>
    </h1>
    <h2 align="center">
        <div class="content">
            <ul style="list-style-type:decimal;">
            <% 
    if(session.getAttribute("User_Id").equals("nitingupta1")) { 
   %> 
   <li><a href="<%=downloadlink %>" target="_blank"><b>Download Big Horoscope</b></a></li>
   <li><a href="<%=downloadlinkRajYoga %>" target="_blank"><b>Download Raj Yoga Report</b></a></li> 
   <li><a href="<%=downloadlinkVarshPatrika %>" target="_blank"><b>Download 2018 Year Book</b></a></li>  
              <%
    }else{
 %>
                <li><a href="/cloud/report/inputform.asp" target="_blank"><b>Horoscope Life Prediction</b></a></li>
                <li><a href="/cloud/report/yearlyinputform.asp" target="_blank"><b>Horoscope Yearly Prediction</b></a></li>
                <li><a href="/cloud/report/planets-combination-report.asp" target="_blank"><b>Conjuction Of Planets Prediction</b></a></li>
                <li><a href="/cloud/report/default1.asp" target="_blank"><b>Trikal Shamita</b></a></li>
                
<li><a href="/cloud/nara-chakra.asp" target="_blank"><b>Nara Chakra</b></a></li>
<li><a href="/cloud/export-trikal.asp" target="_blank"><b>Export Trikal</b></a></li>
<li><a href="/cloud/import-jhora.asp" target="_blank"><b>Import Jhora</b></a></li>
<li><a href="/cloud/worksheet/" target="_blank"><b>Worksheet</b></a></li>
<li><a href="/numerology/multimatchprediction.asp" target="_blank"><b>Multimatch Prediction</b></a></li>
<li><a href="/numerology/matchprediction.asp" target="_blank"><b>Match Prediction</b></a></li>
<li><a href="/cloud/util/dailypointhoroscope.asp" target="_blank"><b>Daily Points Horoscope</b></a></li>
<li><a href="/cloud/report/rashi-wise-yearly-prediction.asp?rasiforprediction=1&predictionyear=2015" target="_blank"><b>rashi-wise-yearly-prediction for planet</b></a></li>
<li><a href="<%=downloadlink %>" target="_blank"><b>Download Big Horoscope</b></a></li> 
<li><a href="<%=downloadlinkRajYoga %>" target="_blank"><b>Download Raj Yoga Report</b></a></li>
<li><a href="<%=downloadlinkVarshPatrika %>" target="_blank"><b>Download 2020 Trikal Samhita</b></a></li>
<li><a href="/cloud/healthfeedbackreport.jsp" target="_blank"><b>Health Feedback Report</b></a></li>
<!--  <li><a href="<%=downloadlinkYearBook %>" target="_blank"><b>Astrosage Year Book</b></a></li> -->
<li><a href="<%=downloadlinkShaniReport%>" target="_blank"><b>Download Shani Report</b></a></li>
<li><a href="<%=downloadlinkAnnualPDFReport%>" target="_blank"><b>Download Annual PDF Report</b></a></li>
<li><a href="<%=downloadCCReport%>" target="_blank"><b>Download Career Counselling Report</b></a></li>
<li><a href="<%=downloadCCReportPrint%>" target="_blank"><b>Download Career Counselling Report [For Print]</b></a></li>
<li><a href="<%=downloadStreamReport%>" target="_blank"><b>Download CogniAstro Report (10th)</b></a></li>
<li><a href="<%=downloadStreamReportPrint%>" target="_blank"><b>Download CogniAstro Report (10th) [For Print]</b></a></li>
<li><a href="<%=download12Report%>" target="_blank"><b>Download CogniAstro Report (12th)</b></a></li>
<li><a href="<%=download12ReportPrint%>" target="_blank"><b>Download CogniAstro Report (12th) [For Print]</b></a></li>
<li><a href="<%=downloadBrihatHoroReport%>" target="_blank"><b>Download Brihat-Horoscope New Report</b></a></li>
<li><a href="<%=downloadBrihatHoroReportPrint%>" target="_blank"><b>Download Brihat-Horoscope New Report [For Print]</b></a></li>
<li><a href="<%=downloadFreePDFReport%>" target="_blank"><b>Download Free PDF Report</b></a></li>
<li><a href="/cloud/personalitytype" target="_blank"><b>Know Your Personality Type</b></a></li>
<li><a href="<%=downloadLoveRomanceReport%>" target="_blank"><b>Download Love And Romance Report</b></a></li>

<li><a href="<%=downloadlinkPHoro%>" target="_blank"><b>Download Personalized Horoscope 2020 [FB Campaign]</b></a></li>
<%
    }
 %>   
            </ul>
        </div>
        </h2>
  

</body>
</html>
<%}else{%>
<div style="color:Red;font-size:x-large">
    You are not authorized user to access this section.
</div>
<% }%>
