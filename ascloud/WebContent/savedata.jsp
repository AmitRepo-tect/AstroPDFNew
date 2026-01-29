<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Vedic Astrology Portal - Free Chart, Horoscope, Match Making, KP System, Lalkitab Remedies</title>
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
</head>
<%	 
//*************************************

String referrer=request.getParameter("referrer");
String DateTime=request.getParameter("DateTime");

   if(DateTime!=null && !DateTime.equals("")) {
     referrer=referrer+"&DateTime="+DateTime;
   }

   String open=request.getParameter("open");
    if(open!=null && !open.equals("")) {
       referrer=referrer+"&open="+open;
    }



      String uid = String.valueOf(session.getAttribute("User_Id"));//Request.QueryString ("uid")
      String Msg = request.getParameter("Msg");
       
      //String CityId =request.getParameter("CityId");
       
      String ifUserExists = String.valueOf(session.getAttribute("UserExists"));
	 
       if(Msg!=null && Msg.equals("Create")){
	   //READ DATE FROM FORM
	   
	  int CityId =0;
	  if(request.getParameter("CityId")!=null && !request.getParameter("CityId").equals("")){
		  CityId = Integer.parseInt(request.getParameter("CityId"));
	  }
		
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String DoB =request.getParameter("Day");
		String MoB = request.getParameter("month");
		String YoB = request.getParameter("Year");
		String HoB = request.getParameter("hrs");
		String MinOB = request.getParameter("min");
		String SoB = request.getParameter("sec");
		String place = request.getParameter("place");
		String LatDegree = request.getParameter("LatDeg");
		String LatMinute = request.getParameter("LatMin");
		String LatNS = request.getParameter("LatNS");
		String LongDegree = request.getParameter("LongDeg");
		String LongMinute =request.getParameter("LongMin");
		String LongEW = request.getParameter("LongEW");
		String TimeZone = request.getParameter("timeZone");
		String DST = request.getParameter("dst");
	
		String Ayanamsa=request.getParameter("Ayanamsa");
		String Charting=request.getParameter("Charting");
        request.getSession().setAttribute("chartType",Charting);
        //session.getAttribute("ChartType")=Charting
		String AccessPermission=request.getParameter("AccessPermission");
		
		String DateoB = DoB + "/" + MoB + "/" + YoB;
		String TimeoB = HoB + ":" + MinOB + ":" + SoB;
	%>

	<%
	
	
		 UserDAO UD =  new UserDAO();
	     SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
	     String dateInString = MoB+"/"+DoB+"/"+YoB;//"Jan 1, 2015"; 
	     Date date = null;
	     try{
	      
	     date = formatter.parse(dateInString);
	    
	     }catch(ParseException e){
	     e.printStackTrace();
	     }
	    // System.out.println(formatter.format(date)+"neha");
	    // Date date1 = formatter.parse(date.toString());
	     
	    // System.out.println(date1+"neha");
	    
		 int recordSave = UD.recordSaveIntoPersonDetails(name,date,TimeoB,sex,CityId,DST,Charting,Ayanamsa,uid,TimeZone,AccessPermission);
		 //System.out.println("recordSave="+recordSave);
		
	   place ="";// UD.getDataFromCityMaster(CityId);
	//------- 
	//IF USER IS MODIFING HOROSCOPE CHOOSING MODIFY HOROSCOPE OPTION 
       }else{	//MODIFY
	

	
		/*ConnObj.Open Application("DSN")
		StrSql = "select * from PersonDetail where UserId = '" & uid & "'"
		RsPerson.Open strsql,ConnObj,3,3
       */
		//##########
		//READ FORM DATA
		//MEANS USER IS MODIFYING HOROSCOPE USING MODIFY HOROSCOPE LINK
		
		

			String CityId = request.getParameter("CityId");
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String DoB = request.getParameter("Day");
			String MoB = request.getParameter("month");
			String YoB = request.getParameter("Year");
			String HoB = request.getParameter("hrs");
			String MinoB = request.getParameter("min");
			String SoB = request.getParameter("sec");
			String place = request.getParameter("place");
			String LatDegree = request.getParameter("LatDeg");
			String LatMinute = request.getParameter("LatMin");
			String LatNS = request.getParameter("LatNS");
			String LongDegree = request.getParameter("LongDeg");
			String LongMinute = request.getParameter("LongMin");
			String LongEW = request.getParameter("LongEW");
			String TimeZone = request.getParameter("timeZone");
			String DST = request.getParameter("dst");
			
			String Ayanamsa=request.getParameter("Ayanamsa");
			String Charting=request.getParameter("Charting");
   	        request.getSession().setAttribute("chartType",Charting);
			 //session("ChartType")=Charting
			String  AccessPermission=request.getParameter("AccessPermission");


			String DateoB = DoB + "/" + MoB + "/" + YoB;
			String TimeoB = HoB + ":" + MinoB + ":" + SoB;
		
			//WRITE DATA IN DATABASE
		    /*RsPerson.Fields(2) = name
			RsPerson.Fields(3) = DateSerial (YoB, MoB, DoB)
			RsPerson.Fields(4) = TimeoB
			RsPerson.Fields(5) = sex
			RsPerson.Fields(6) = CityId
			RsPerson.Fields(7) = "0"
			RsPerson.Fields(8) = DST
			RsPerson.Fields(9) = "0"
			RsPerson.Fields(10) = "0"
			RsPerson.Fields(11) = "0"
			RsPerson.Fields(12) = "0"
			RsPerson.Fields(13) = Charting
		    RsPerson.Fields(14) = Ayanamsa
			RsPerson.Fields(15) = Uid
			RsPerson.Fields(16) = TimeZone
			RsPerson.Fields(17) = AccessPermission
			RsPerson.Update
			
			*/
			
			//int recoreUpdate = UD.
			       }
            

		    if(referrer!=null && !referrer.equals("")){
		    	// out.println(referrer+"neha");
           		    response.sendRedirect(referrer);
		    }else{
		   
		    	response.sendRedirect("/cloud/defaultchartlogin.asp?methodName=fromJSP");
		    }
		
		 	

%>