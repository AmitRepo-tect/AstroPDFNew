package com.ojassoft.astrosagecloud;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * 
 * @author Ankit Varshney
 *
 */
public class EphemerisServlet extends HttpServlet {

	EphemerisMethods mEphemerisMethods = null;
	List<DesktopHoro> mDesktopHorosList;

	private static final long serialVersionUID = 1L;

	public EphemerisServlet() {
		super();
		mEphemerisMethods = new EphemerisMethods();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//String requestFrom = Util.safestrWithNull(request.getParameter("request_from"));

		DesktopHoro desktopHoro = null;
		mDesktopHorosList = new ArrayList<DesktopHoro>();

		int year = Integer.parseInt(Util.safestrWithNull(request.getParameter("year")) == "" ? "0"
				: Util.safestrWithNull(request.getParameter("year")));
		int month = Integer.parseInt(Util.safestrWithNull(request.getParameter("month")) == "" ? "0"
				: Util.safestrWithNull(request.getParameter("month")));

		Calendar mCalendar = Calendar.getInstance();
		if (year != 0 && month != 0) {
			mCalendar.set(Calendar.YEAR, year);
			mCalendar.set(Calendar.MONTH, month - 1);
		}
		mCalendar.set(Calendar.DAY_OF_MONTH, 1);
		int maxMonthDays = mCalendar.getActualMaximum(Calendar.DATE);

		ArrayList<String> placeDetails = mEphemerisMethods.getPlaceFields(request);

		for (int i = 0; i < maxMonthDays; i++) {
			desktopHoro = mEphemerisMethods.initDesktopHoro(getServletContext(), mCalendar, placeDetails, request,
					response);
			mDesktopHorosList.add(desktopHoro);
			if (i < maxMonthDays - 1) {
				mCalendar.add(Calendar.DATE, 1);
			}
		}
		request.setAttribute("desktophoro", mDesktopHorosList);
		request.setAttribute("date", mCalendar);
		if (placeDetails != null && !placeDetails.isEmpty()) {
			request.setAttribute("place", placeDetails.get(0)); // 0 for place
			request.setAttribute("hour", placeDetails.get(8));
			request.setAttribute("minute", placeDetails.get(9));
		}

		/*
		 * if(requestFrom.equalsIgnoreCase("android")) { try {
		 * response.getWriter().print(mDesktopHorosList); } catch (Exception e) {
		 * e.printStackTrace(); response.getWriter().print(e.getMessage()); } }else {
		 * request.getRequestDispatcher("dhruv/ephemeris.jsp").forward(request,
		 * response); }
		 */
		request.getRequestDispatcher("/dhruv/ephemeris.jsp").forward(request, response);

	}

}
