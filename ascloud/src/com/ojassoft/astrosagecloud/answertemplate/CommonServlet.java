package com.ojassoft.astrosagecloud.answertemplate;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.Constants;
import com.ojassoft.astrosagecloud.api.Dasa;
import com.ojassoft.astrosagecloud.localization.Hindi;
import com.ojassoft.astrosagecloud.localization.Local;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;
import com.ojassoft.astrosagecloud.util.Util;

public class CommonServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException
	{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException
	{
         //boolean when = false;
		 //boolean loveOrArranged = false;
		 //boolean samePerson = false;
		 //boolean how = false;
		 //boolean characterisitics = false;
		 //boolean survive = false;
		 //boolean past = false;
		 //boolean remedies = false;
		 boolean[] marriageques = {false,false,false,false,false,false,false,false};
        int langCode = Integer.parseInt(request.getParameter("languageCode"));
		//Local local = new Local();
		//Hindi hindi = new Hindi();
		//MyResourceBundle rBHouseKeys = local.loadPropertiesFileNew("housekeys",langCode);
		//MyResourceBundle rBAnsTemaplate = local.loadPropertiesFileNew("anstemplate",langCode);
		//MyResourceBundle rBSignCharacteristics = local.loadPropertiesFileNew("signcharacteristics",langCode);
		
		String DOB = request.getParameter("dob");
		String name = request.getParameter("name");
		String TOB = request.getParameter("tob");
		String place = request.getParameter("place");
		String gender = request.getParameter("gender");
		String QRT = request.getParameter("QFA");
        String latDegree = request.getParameter("latdeg");
		String latMinute = request.getParameter("latmin");
		String latNS  = Util.safestr(request.getParameter("latns"));
		
		String longDegree = request.getParameter("longdeg");
		String longMinute = request.getParameter("longmin");
		String longEW  = Util.safestr(request.getParameter("longew"));
		String astrologerAns  = Util.safestr(request.getParameter("astroans"));
		String ordernum  = Util.safestr(request.getParameter("orderid"));
		
	
		String timeZone = request.getParameter("timezone");
       //The reason for taking dst string this way is that the dst default string should be 0.
		String DST     = Util.safeStringInt(request.getParameter("dst"));
		int ayanamsa = Util.safeInt(request.getParameter("ayanamsa"));
		String charting = Util.safestr(request.getParameter("charting"));
		int kphn = Util.safeInt(request.getParameter("kphn"));
		String[] marriageOpt = request.getParameterValues("ques");
		   if (marriageOpt != null) 
		   {
		      for (int i = 0; i < marriageOpt.length; i++) 
		      {
		         //System.out.println ("<b>"+(Integer.parseInt(marriageOpt[i])-1)+","+(i+1)+"<b></br>");
		         //System.out.println ("<b>"+(i+1)==Integer.parseInt(marriageOpt[i])+"<b></br>");
		         //if((i+1)==Integer.parseInt(marriageOpt[i])){
		         marriageques[Integer.parseInt(marriageOpt[i])-1] = true;
		        // }
		      }
		   }
		String[] DOBSplit = DOB.split("/");
		String day = DOBSplit[0].trim();
		String month = DOBSplit[1].trim();
		String year = DOBSplit[2].trim();
		
		if(day.length()< 2) { day = "0"+day ;}
		if(month.length()< 2) { month = "0"+month ;}
		//if(day.length()< 2) { day = "0"+day ;}

		String[] TOBSplit = TOB.split(":");
		String hour = TOBSplit[0].trim();
		String min = TOBSplit[1].trim();
		

		if(hour.length()< 2) { hour = "0"+hour ;}
		if(min.length()< 2) { min = "0"+min ;}
		
		DesktopHoro ObjHoro = createHoro(day, month, year, hour, min, "00", latDegree, latMinute, latNS, longDegree, longMinute,longEW, timeZone ,place,DST,ayanamsa,charting,kphn,langCode,gender,null);
		
		
		//Constants const1 = new Constants();
		String path = getServletContext().getRealPath("/cloud/");
		Dasa dasa = Dasa.createHoro("neha",day, month, year, hour, min, "00", latDegree, latMinute, latNS, longDegree, longMinute,longEW, timeZone,path);
		
		if(!QRT.equals("7"))
		{
			request.setAttribute("HoroObject", ObjHoro);
		    request.setAttribute("Gender", gender);
		    request.setAttribute("DOB", DOB);
		    request.setAttribute("TOB", TOB);
		    request.setAttribute("Place", place);
		    request.setAttribute("AstrologerAns", astrologerAns);
		    request.setAttribute("QRT", QRT);
		    request.setAttribute("languageCode", langCode);
			//response("/answer/findyouranswer.jsp");
			String forwardUrl = "/answer/findyouranswer.jsp";
			request.getRequestDispatcher(forwardUrl).forward(request, response);
		}
		else
		{
	    request.setAttribute("dasa", dasa);
	    request.setAttribute("name", name);
	    request.setAttribute("odId", ordernum);
	  //  request.setAttribute("HoroObject", ObjHoro);
	  //  request.setAttribute("Gender", Gender);
	  //  request.setAttribute("DOB", DOB);
	  //  request.setAttribute("TOB", TOB);
	  //  request.setAttribute("Place", Place);
	  //  request.setAttribute("AstrologerAns", astrologerAns);
	  //  request.setAttribute("QRT", QRT);
	    request.setAttribute("marriagearr", marriageques);
	    String forwardUrl = "/answer/marriage.jsp";
		request.getRequestDispatcher(forwardUrl).forward(request, response);
		}

}
	
	 public DesktopHoro createHoro(String day, String month, String year, String hrs, String min, String sec, String latDeg, String latMin, String latNS, String longDeg, String longMin, String longEW, String timeZone,String place,String dST,int ayanamsa,String charting,int kphn,int language,String gender, ServletContext ctx) {
		   DesktopHoro phoro = new DesktopHoro();
			Constants const1 = new Constants();
			//const1.setConstPath("C:\\Data\\workspace\\horo");
			
			if(ctx == null)
			{
				const1.setConstPath(getServletContext().getRealPath("/cloud/"));
			}
			else
			{
				const1.setConstPath(ctx.getRealPath("/cloud/"));
			}

			
			
			try {

				phoro.setCompanyName("CSL SOFTWARE LTD., G-4A, Green park Extn., New Delhi-110 016");
				phoro.setCompanyAddLine1("Phone:011-6867329, 9811356741, E-Mail: info@astrocamp.com http://www.astrocamp.com");
				phoro.setName("punit");
				phoro.setPlace(place);
				phoro.setTimeZone(timeZone);
				phoro.setMaleFemale(gender);
				phoro.setSecondOfBirth(sec);
				phoro.setMinuteOfBirth(min);
				phoro.setHourOfBirth(hrs);
				phoro.setDayOfBirth(day);
				phoro.setMonthOfBirth(month);
				phoro.setYearOfBirth(year);
				phoro.setDegreeOfLattitude(latDeg);
				phoro.setDegreeOfLongitude(longDeg);
				phoro.setSecondOfLattitude("00");
				phoro.setSecondOfLongitude("00");
				phoro.setMinuteOfLongitude(longMin);
				phoro.setMinuteOfLattitude(latMin);
				phoro.setEastWest(longEW);
				phoro.setNorthSouth(latNS);
				phoro.setLanguageCode(String.valueOf(language));
				phoro.setDST(dST);
				phoro.setAyan(ayanamsa);
				phoro.setKPHorarySeed(kphn);
				// phoro.setAyanamsaType(3);
				//phoro.setLanguageCode("0");
				// phoro.setCustomizedAyanamsa("23.000");
				phoro.initialize();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			return phoro;
			
		}
}
