package com.ojassoft.astrosagecloud;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.cslsoftware.util.Constants;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * 
 * @author Ankit Varshney
 *
 */
public class EphemerisMethods {

	final int CONST_PLACE = 0;
	final int CONST_LATDEG = 1;
	final int CONST_LATMIN = 2;
	final int CONST_LATNS = 3;
	final int CONST_LONGDEG = 4;
	final int CONST_LONGMIN = 5;
	final int CONST_LONGEW = 6;
	final int CONST_TIMEZONE = 7;
	final int CONST_HOURS = 8;
	final int CONST_MINUTE = 9;

	/**
	 * get Place Fields
	 * @param request
	 * @return
	 */
	ArrayList<String> getPlaceFields(HttpServletRequest request) {

		ArrayList<String> placeDetails = new ArrayList<String>();

		String place = request.getParameter("place");
		String LatDeg = request.getParameter("LatDeg");
		String LatMin = request.getParameter("LatMin");
		String LatNS = request.getParameter("LatNS");
		String LongDeg = request.getParameter("LongDeg");
		String LongMin = request.getParameter("LongMin");
		String LongEW = request.getParameter("LongEW");
		String timeZone = request.getParameter("timeZone");
		String hour = request.getParameter("hour");
		String minute = request.getParameter("minute");

		if (Util.safestrWithNull(request.getParameter("timezoneid")).equalsIgnoreCase("")) {
			place = "New Delhi";
			LatDeg = "28";
			LatMin = "38";
			LatNS = "N";
			LongDeg = "77";
			LongMin = "13";
			LongEW = "E";
			timeZone = "5.5";
		}
		hour = Util.safestrWithNull(hour) == "" ? "5" : Util.safestrWithNull(hour);
		minute = Util.safestrWithNull(minute) == "" ? "30" : Util.safestrWithNull(minute);
		placeDetails.add(place);
		placeDetails.add(LatDeg);
		placeDetails.add(LatMin);
		placeDetails.add(LatNS);
		placeDetails.add(LongDeg);
		placeDetails.add(LongMin);
		placeDetails.add(LongEW);
		placeDetails.add(timeZone);
		placeDetails.add(hour);
		placeDetails.add(minute);

		return placeDetails;
	}

	/**
	 * initDesktopHoro
	 * 
	 * @param context
	 * @param request
	 * @param response
	 * @return
	 */
	DesktopHoro initDesktopHoro(ServletContext context, Calendar mCalendar, ArrayList<String> placeDetails,
			HttpServletRequest request, HttpServletResponse response) {
		DesktopHoro objDesktopHoro = new DesktopHoro();
		Constants objConst = new Constants();

		try {

			objDesktopHoro.setName("");
			objDesktopHoro.setMaleFemale("");
			objDesktopHoro.setYearOfBirth(String.valueOf(mCalendar.get(Calendar.YEAR)));
			objDesktopHoro.setMonthOfBirth(String.valueOf(mCalendar.get(Calendar.MONTH) + 1));
			objDesktopHoro.setDayOfBirth(String.valueOf(mCalendar.get(Calendar.DAY_OF_MONTH)));
			objDesktopHoro.setTimeZone(placeDetails.get(CONST_TIMEZONE));
			objDesktopHoro.setDST("0");
			objDesktopHoro.setPlace(placeDetails.get(CONST_PLACE));
			objDesktopHoro.setDegreeOfLattitude(placeDetails.get(CONST_LATDEG));
			objDesktopHoro.setMinuteOfLattitude(placeDetails.get(CONST_LATMIN));
			objDesktopHoro.setSecondOfLattitude("0");
			objDesktopHoro.setNorthSouth(placeDetails.get(CONST_LATNS));

			objDesktopHoro.setDegreeOfLongitude(placeDetails.get(CONST_LONGDEG));
			objDesktopHoro.setMinuteOfLongitude(placeDetails.get(CONST_LONGMIN));
			objDesktopHoro.setSecondOfLongitude("0");
			objDesktopHoro.setEastWest(placeDetails.get(CONST_LONGEW));

			objDesktopHoro.setHourOfBirth(placeDetails.get(CONST_HOURS));
			objDesktopHoro.setMinuteOfBirth(placeDetails.get(CONST_MINUTE));
			objDesktopHoro.setSecondOfBirth("0");

			objDesktopHoro.setAyan(0);
			objDesktopHoro.setLanguageCode("0");// set english
			objDesktopHoro.setKPHorarySeed(0);

			objConst.setConstPath(context.getRealPath("/cloud/"));

			objDesktopHoro.initialize();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return objDesktopHoro;
	}

}
