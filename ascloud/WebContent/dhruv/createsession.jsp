<%@page import="java.util.logging.Logger"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@ page import="com.cslsoftware.util.Constants"%>
<%@page import="java.io.Serializable"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.IOException"%>


<%

//System.out.println(session.getAttribute("ChartId")+"neha8");
String referrer = Util.safestr(request.getParameter("referrer"));
//System.out.println("reffere"+referrer);
String status = "";
boolean proceed = true;
if(session.getAttribute("HoroscopeObj") == null)
{
String getname=request.getParameter("name");
String uname = new String(getname.getBytes("ISO-8859-1"), "UTF-8");	
String name  = Util.safestr(uname);
String sex   = Util.safestr(request.getParameter("sex"));
String doB   = Util.safeStringInt(request.getParameter("day"));
String moB   = Util.safeStringInt(request.getParameter("month"));
String yoB   = Util.safeStringInt(request.getParameter("year"));
String hoB   = Util.safeStringInt(request.getParameter("hrs"));
String minOB = Util.safeStringInt(request.getParameter("min"));
String soB   = Util.safeStringInt(request.getParameter("sec"));
String place = Util.safestr(request.getParameter("place"));
int latDegree = 0;
try
{
 latDegree = Util.safeInt(request.getParameter("latdeg"));
}
catch(Exception e)
{
	System.out.println("Got Exception in createsession : "+e.getMessage());
	System.out.println("The request is : "+request);
}
int latMinute = Util.safeInt(request.getParameter("latmin"));
String latNS  = Util.safestr(request.getParameter("latns"));
int longDegree = Util.safeInt(request.getParameter("longdeg"));
int longMinute = Util.safeInt(request.getParameter("longmin"));
String longEW  = Util.safestr(request.getParameter("longew"));
float timeZone = Util.safeFloat(request.getParameter("timezone"));
//The reason for taking dst string this way is that the dst default string should be 0.
String dST     = Util.safeStringInt(request.getParameter("dst"));
int ayanamsa = Util.safeInt(request.getParameter("ayanamsa"));
String charting = Util.safestr(request.getParameter("charting"));
int kphn = Util.safeInt(request.getParameter("kphn"));

status = Util.safestr(request.getParameter("status"));


name = name.replaceAll("'","");
session.setAttribute("isDst","0");

//Add new condition for jathagam report
if (latNS.equals("1") || latNS.toLowerCase().equals("n")) 
    latNS = "N";
else
    latNS = "S";
		

if (longEW.equals("1") || longEW.toLowerCase().equals("e")) 
	longEW = "E";
else
	longEW = "W";

		
if (dST.equals(""))
	dST = "0";
else { 
	if (Integer.parseInt(dST) > 0) {
		timeZone = timeZone + Integer.parseInt(dST);
		dST = "0";
		session.setAttribute("isDst","1");
	}
}
%>
<%


/*if (request.getParameter("requestChartId").equals("1") || request.getParameter("isSignupOrlogin").equals("1")) 
	session.setAttribute("IsSaved",0);         
else {
	//TODO: check
	if (!(request.getParameter("newchartdoneandsave").equals("1") || request.getParameter("editchartdoneordoneandsave") != "")) 
		session.setAttribute("ChartId","");
}
*/
//System.out.println(request.getParameter("done"));
if (request.getParameter("done") != ""){
	session.setAttribute("IsSaved",1);
}



int languageCode = 0;
String lc = request.getParameter("languagecode");
if(lc != null && !lc.equals(""))
{
	languageCode = Integer.parseInt(Util.safestr(lc));
	Local local = new Local();
	MyProperties constantBundle = new MyProperties(local.loadPropertiesFile("constants", languageCode));
	session.setAttribute("constants", constantBundle);
}

//if(safestr(request.getParameter("publicchart").equals("yes")))
/*	if(request.getParameter("publicchart").equals("yes"))
		{
	//Extra parameter if user opens shared chart from k.astrosage.com
	
String userid = String.valueOf(session.getAttribute("userid"));
int chartid = Integer.parseInt(safestr(request.getParameter("chartid")));            

if(!userid.equals("")) //{
	
 //   if(!(matchinguseridandchartid(userid,chartid).equals("0")))
        session.setAttribute("chartid", "");
 //   else
   //     session.setAttribute("chartid",chartid) ;    
//}
else
//{
session.setAttribute("chartid",chartid);
//}
		} */
		
		

session.setAttribute("chartType",Util.safeInt(charting));		
session.setAttribute("languageCode",languageCode);    
String dateoB = doB + "/" + moB + "/" + yoB;
String timeoB = hoB + ":" + minOB + ":" + soB;
%>
<%

if(place.equals(""))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify place of birth.","UTF-8"));
}

if(String.valueOf(longDegree).equals(""))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" +URLEncoder.encode("ERROR: Please specify a value for the Longitude Degree.","UTF-8"));
}
		
if(!(IsNumeric(String.valueOf(longDegree))))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Degree.","UTF-8"));
}
		
if(longDegree < 0 || longDegree >= 180)
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Degree.","UTF-8"));
}

if(String.valueOf(longMinute).equals(""))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Longitude Minute.","UTF-8"));
}
		
if(!(IsNumeric(String.valueOf(longMinute))))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Longitude Minute.","UTF-8"));
}
		
if(longMinute < 0 || longMinute >= 60)
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Longitude Minute.","UTF-8"));
}


if(String.valueOf(latDegree).equals(""))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Latitude Degree.","UTF-8"));
}


if(!(IsNumeric(String.valueOf(latDegree))))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Degree.","UTF-8"));
}


if(latDegree < 0 || latDegree >= 90)
{
	proceed = false; 
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Degree.","UTF-8"));
}

if(String.valueOf(latMinute).equals(""))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Latitude Minute.","UTF-8"));
}


if(!(IsNumeric(String.valueOf(latMinute))))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Minute.","UTF-8"));
}
		
if(latMinute < 0 || latMinute >= 60)
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Latitude Minute.","UTF-8"));
}

if(String.valueOf(timeZone).equals(""))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Please specify a value for the Time Zone.","UTF-8"));
}

if(!(IsNumeric(String.valueOf(timeZone))))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Time Zone.","UTF-8"));
}

if (timeZone < -12.0 || timeZone >= 17.0)
{
	proceed = false; 
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Time Zone.","UTF-8"));
}

if(String.valueOf(languageCode).equals(""))
	languageCode = 0 ;

if(!(IsNumeric(String.valueOf(languageCode))))
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Language Code.","UTF-8"));
}

if(languageCode < 0 || languageCode > 10)
{
	proceed = false;
	response.sendRedirect("http://www.astrosage.com/m/postpage.asp?type=kp&error=" + URLEncoder.encode("ERROR: Incorrect value for the Language Code.","UTF-8"));
}

%>
<% 
if(proceed)
{
//Make Object Of Horodesktop.dll

//INITIALIZE HORODESKTOP OBJECT WITH EITHER FORM OR DATABASE VALUES


DesktopHoro ObjHoro = new  DesktopHoro();
Constants ObjConst = new Constants();
//out.println(System.getProperty("user.dir")+"/cloud/");
//String realPath = getServletContext().getRealPath("/cloud/");
//String contextPath = getServletContext().getContextPath();
//URL resourceUrl = getServletContext().getResource("/cloud/");
ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));

ObjHoro.setName(name);
ObjHoro.setPlace(place);
ObjHoro.setCompanyAddLine1 ("Delhi");
ObjHoro.setCompanyName ("OJAS Softech");
ObjHoro.setTimeZone(String.valueOf(timeZone));
ObjHoro.setMaleFemale(sex);
ObjHoro.setSecondOfBirth(soB);
ObjHoro.setMinuteOfBirth(minOB);
ObjHoro.setHourOfBirth(hoB);
ObjHoro.setDayOfBirth(doB);
ObjHoro.setMonthOfBirth(moB);
ObjHoro.setYearOfBirth(yoB);
ObjHoro.setDegreeOfLattitude(String.valueOf(latDegree));
ObjHoro.setDegreeOfLongitude(String.valueOf(longDegree));
ObjHoro.setSecondOfLattitude("00");
ObjHoro.setSecondOfLongitude("00");
ObjHoro.setMinuteOfLongitude(String.valueOf(longMinute));
ObjHoro.setMinuteOfLattitude(String.valueOf(latMinute));
ObjHoro.setEastWest(longEW);
ObjHoro.setNorthSouth(latNS);
ObjHoro.setDST(dST);

ObjHoro.setLanguageCode(String.valueOf(languageCode));
ObjHoro.setAyan(ayanamsa);

ObjHoro.setKPHorarySeed(kphn);
ObjHoro.initialize();

session.setAttribute("HoroscopeObj",ObjHoro);

//System.out.println(request.getParameter("doneandsave"));
if (!Util.safestr(request.getParameter("doneandsave")).equals("") && session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals(""))  
	{
		session.setAttribute("IsSaved", 0);    
		// Save Chart functionality 
		UserDAO dao = new UserDAO();
		HashMap<String, Integer> hm = dao.saveChart(ObjHoro, session.getAttribute("User_Id").toString(), request.getParameter("charting"), "", "Web", "", 0, null, false);
		request.getSession().setAttribute("ChartId", hm.get("ChartId"));
	}
}//if proceed
}//end if HoroscopeObj is null
else
{
	//System.out.println(session.getAttribute("ChartId"));
//	DesktopHoro ObjHoro = new  DesktopHoro();
	//Constants ObjConst = new Constants();
//	ObjConst.setConstPath(System.getProperty("user.dir")+"/cloud/");
//	ObjHoro.initialize();
        DesktopHoro horoObj = (DesktopHoro)session.getAttribute("HoroscopeObj");
        //System.out.println("222s : "+getServletContext().getRealPath("/WebContent/cloud/"));
        
		Constants ObjConst = new Constants();
		ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		horoObj.initialize();
	    status = "1";
	    
	    Cookie horo= new Cookie("HoroDesk",horoObj.toString());
	    response.addCookie(horo);
	    //horo.setMaxAge(1*24*60*60);    //setting cookies expiry for one year
	    horo.setPath("/");
	    		//proceed = true;
	    //horo.setDomain(".myserver.com");
}

if(proceed)
{
session.setAttribute("dhruvNewKundli", "0");
String refVal = request.getHeader("referer");

if(refVal!=null && !refVal.equals("")){
session.setAttribute("Http_Referer",refVal);
}

if(Util.safestr(session.getAttribute("IsSaved")).equals(""))
        session.setAttribute("IsSaved",1);            
//***************** Get Plan Id **************************

Object getPlanSession = session.getAttribute("planid");
boolean isPremiumPlanUser = false;



if(referrer != null && !referrer.equals(""))
    response.sendRedirect(referrer);
    //Add new condition
else if(status.equals("False"))
    response.sendRedirect("activation-page.asp");        
    //End here
else      
{
     //if session("IsSaved")="" then
        //session("IsSaved")=1            
     //end if       
    // request.getSession().setAttribute("includeFile", "home.jsp");
     Object homeObj = session.getAttribute("DONT_GOTO_HOME");
     
     if(homeObj != null && homeObj.equals("1"))
     {
    	 Object fileObj = session.getAttribute("GOTO_THISPAGE");
    	 if(fileObj != null && !fileObj.equals(""))
    	 {
    		 String str = fileObj.toString();
    		 //str = str.replaceAll(".asp$", ".jsp");
    		 //session.setAttribute("includeFile","new_"+str);
    		 session.removeAttribute("GOTO_THISPAGE");
    		 session.removeAttribute("DONT_GOTO_HOME");
    		 response.sendRedirect("/cloud/"+fileObj.toString());
    	 }
    	 else
    	 {
    		 response.sendRedirect("/");
    	 }
     }
     else
     {
     	response.sendRedirect("/");
     }
	 //request.getRequestDispatcher("/cloud/home.jsp").forward(request, response);
}
}
%>

<%!
//create functions
String safestr(String str, HttpServletResponse response){	
	try{
	if((str.indexOf("cast(") >= 0) || (str.indexOf("case(") >= 0)){
		//return "hello";
     response.sendRedirect("demo.jsp");
 
	}
	return (str.replace("'", "''"));}
	catch(IOException io){
		io.getStackTrace();
		return "";
		
	}
}

boolean IsNumeric(String str){
return true;
}

int matchinguseridandchartid (String str11 ,  int str2){
return 0;
}

%>