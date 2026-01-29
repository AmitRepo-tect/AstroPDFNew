package com.ojassoft.astrosagecloud.Panchang;

import java.util.Calendar;

import com.astrocamp.util.Util;
import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.util.Common;
import com.ojassoft.panchang.Masa;
import com.ojassoft.panchang.Muhurta;
import com.ojassoft.panchang.Place;

public class AajKaPanchangData {
	
	
	 int jd ;
	 int jd1 ;
	 int jd2 ;
	 int jd3 ;
	 Place place;
	 Masa masa =  new Masa();
	 Muhurta muhurat = new Muhurta();
	 	
	public AajKaPanchangData(double latitude,double longitude,double timezone){
		  Calendar cal = Calendar.getInstance(); 
		  int year =  cal.get(Calendar.YEAR);
		  int month = cal.get(Calendar.MONTH)+1;
		//********For end date**************
 
		 int day =cal.get(Calendar.DAY_OF_MONTH);
		 jd = (int) Masa.toJulian(year, month,  day);
		 
		//********For start date**************
		// int day1 =cal.get(Calendar.DAY_OF_MONTH)-1;
		 jd1 = jd-1;//(int) Masa.toJulian(year, month,  day1);
		 
		//********For next date**************
		// int day2 =cal.get(Calendar.DAY_OF_MONTH)+1;
		 jd2 = jd+1;//(int) Masa.toJulian(year, month,  day2);
		 
		 jd3 = jd-2;//(int) Masa.toJulian(year, month,  day2);
		 
		 place = new Place(latitude,longitude,timezone);
		
	}
	
	public double[] getTodayNakshtra(){
		//masa =  new Masa();
		return masa.nakshatra(jd, place);
		
	}
	
	public double[] getPreviousNakshtra(){
		//masa =  new Masa();
		return masa.nakshatra(jd1, place);
	}
	
	public double[] getNextNakshtra(){
		//masa =  new Masa();
		return masa.nakshatra(jd2, place);
	}
	
	public double[] getPreviousToPreviousNakshtra(){
		masa =  new Masa();
		return masa.nakshatra(jd3, place);
	}

	
	public int[] getChandrabala (){
		double[] moonSign = masa.moonsign(jd, place);
		
		int[] arrChandrabala = muhurat.getChandraBaliRasi((int)moonSign[0]);
		return arrChandrabala;
	}
	
	public int[] getTarabala (int todaysNak){
		Muhurta muhurat = new Muhurta();
		int[] arrTarabala = muhurat.getTaraBaliNakshatra(todaysNak);
		return arrTarabala;
	}
	
	public String[]  getRahuKaal()
	{
		String[] rahuStartEnd = new String[2];
		double[] eightDivisions = Muhurta.getDayDivisons(jd, place, Muhurta.getSunRise(jd, place), 8);
		int[] rahuetc = Muhurta.getRahuYamaGulikaKaal(jd, place);

		rahuStartEnd[0]= Util.dms(eightDivisions[rahuetc[0] - 1]);
		rahuStartEnd[1] = Util.dms(eightDivisions[rahuetc[0]]);
		return rahuStartEnd;
	}
	
	public String[] getAbhijitMuhurat(){
		String[] abhijitStartEnd = new String[2];// {Common.NoAbhiJit,Common.NoAbhiJit}; //On Wednesday no abhijit muhurat 
		double[] fifteenMuhurtas = Muhurta.getFifteenMuhurtaForDay(jd, place);
		if (Masa.vaara(jd) != 3) // For Wednesday
		{
			abhijitStartEnd[0] = Util.dms(fifteenMuhurtas[8 - 1]);

			abhijitStartEnd[1] = Util.dms(fifteenMuhurtas[8]);
		}
    	return abhijitStartEnd;
	}
	
	
}
