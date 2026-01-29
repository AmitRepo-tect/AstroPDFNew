package com.ojassoft.astrosagecloud;

import java.io.IOException;

import javax.servlet.http.*;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.printhoroscope.NorthChart;
import com.cslsoftware.util.Constants;

import java.util.logging.Level;
import java.util.logging.Logger;

import com.ojassoft.astrosagecloud.util.Common;

@SuppressWarnings("serial")
public class SVKServlet extends AstrosageServlet 
{
	public final static Logger LOGGER = Logger
  			.getLogger(SVKServlet.class.getName());
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		try
		{
			initialize(request, response);
			
			String uri = request.getRequestURI();
			String str = uri.substring(7, uri.indexOf(".jsp"));
			String[] svk = Common.svkUrls.get(str);
			request.setAttribute("svkHeading",svk);
			request.setAttribute("objChart", drawShodashKundli(request, Integer.valueOf(svk[0])));
			
			request.getRequestDispatcher("/cloud/new_svkGeneric.jsp").forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	} //end method
	
	private int[] getRaashi(int ascendant)
	{
		int[] raashi = new int[12];
		raashi[0] = ascendant;
		int i=0;
		for(i=0;i<=11-ascendant;i++)
		{
			raashi[i+1] = raashi[i] + 1;
		}
		int fixedVal = 10-i;
		for(int j=0;j<=fixedVal;j++,i++)
		{
			raashi[i+1] = j+1;
		}
		return raashi;
	}
	
	private NorthChart drawShodashKundli(HttpServletRequest request, int kundliNo)
	{
		DesktopHoro myAstrologyObject = null;
		Object horoObj = request.getSession().getAttribute("HoroscopeObj");
		if(horoObj != null)
		{
			myAstrologyObject = (DesktopHoro) horoObj;
		}
		myAstrologyObject.saptavg();
		int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(kundliNo - 1);
		int[] RaashiNoCorrespondingToPlanets1 = new int[arrPlanetsShodashvarga.length];
		for(int k=0;k<=12;k++)
		{
			RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
		}
		int[] raashi = getRaashi(RaashiNoCorrespondingToPlanets1[0]);
		int count = 0;
		int[] tempraashi = new int[13];
		for(int i = 0;i<12;i++)
		{
			if(raashi[i] >= 1)
			{
				tempraashi[count] = raashi[i];
				count++;
			}
		}
		int mycount = count;
		int mycount2 = count;
		for(int i=0;i<=mycount-1;i++)
		{
			tempraashi[mycount2]=raashi[i];
		}
		int[] myRashi = new int[13];
		for(int i=0;i<=11;i++)
		{
			myRashi[i+1]=tempraashi[i]+1;
		}
		int[] planetno = new int[12];
		for(int i=1;i<=12;i++)
		{
		   planetno[i-1]=arrPlanetsShodashvarga[i];
		}  
		  
		int detect=tempraashi[0]-1;
		for(int i=0;i<=11;i++)
		{
		   planetno[i]=planetno[i]-detect;
		   if(planetno[i]<=0)
		   {
		      planetno[i]=planetno[i]+12;
		   }
		}	
		NorthChart objChart = new NorthChart();
		objChart.setBhavPositionForPlanets (planetno);
		objChart.setBhavPositionForRashi (myRashi[12]);
		return objChart;
	}
	
	private void createHoroscopeObject(HttpServletRequest request) throws Exception
	{
		DesktopHoro ObjHoro = new DesktopHoro();
		Constants ObjConst = new Constants();
		//out.println(System.getProperty("user.dir")+"/cloud/");

		ObjConst.setConstPath(System.getProperty("user.dir")+"/cloud/");
		ObjHoro.setName("Smriti Dua");
		ObjHoro.setPlace("Noida");
		ObjHoro.setCompanyAddLine1 ("Delhi");
		ObjHoro.setCompanyName ("OJAS Softech");
		ObjHoro.setTimeZone(String.valueOf("+5.5"));
		ObjHoro.setMaleFemale("Female");
		ObjHoro.setSecondOfBirth("0");
		ObjHoro.setMinuteOfBirth("05");
		ObjHoro.setHourOfBirth("10");
		ObjHoro.setDayOfBirth("14");
		ObjHoro.setMonthOfBirth("12");
		ObjHoro.setYearOfBirth("84");
		ObjHoro.setDegreeOfLattitude(String.valueOf(76));
		ObjHoro.setDegreeOfLongitude(String.valueOf(45));
		ObjHoro.setSecondOfLattitude("00");
		ObjHoro.setSecondOfLongitude("00");
		ObjHoro.setMinuteOfLongitude(String.valueOf("15"));
		ObjHoro.setMinuteOfLattitude(String.valueOf("25"));
		ObjHoro.setEastWest("E");
		ObjHoro.setNorthSouth("N");
		ObjHoro.setDST("0");

		ObjHoro.setLanguageCode("0");
		request.getSession().setAttribute("languageCode",0);


		ObjHoro.setAyanamsaType(0);
		ObjHoro.setKPHorarySeed(1);
		ObjHoro.initialize();

		request.getSession().setAttribute("HoroscopeObj",ObjHoro);
	}
}
