/*
 * Copyright (c) 2018, 2023, Ojas softech pvt ltd All rights reserved.
 * OJAS PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.ojassoft.astrosagecloud.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.ResourceBundle;

import com.ojassoft.astrosagecloud.api.Dasa;
import com.ojassoft.astrosagecloud.api.DasafalMarriage;
import com.ojassoft.astrosagecloud.api.KP;
import com.ojassoft.astrosagecloud.api.MarriageBean;
import com.ojassoft.astrosagecloud.api.Dasa.Pdasa;
import com.ojassoft.astrosagecloud.localization.MyResourceBundle;

/**
 * The {@code PdashaUtil} class is used for different utilities method
 * 
 * 
 * 
 * 
 * @author Mahtab Hussain
 * 
 */

public class PdashaUtil {
	static String strongPlanetsendDate;
	/**
	 * method is used to get random template of marriage
	 * 
	 *
	 *
	 * @param array
	 *            string array will be passed
	 * @return single string of template
	 */

	public static int getRandom(int size) {

		int rnd = new Random().nextInt(size);
		return rnd;
   }
	
	/**
	 * method is used to get random template of marriage
	 * 
	 *
	 *
	 * @param array
	 *            string array will be passed with seed
	 * @return single string of template
	 */
	
	  public static int getRandomSeed(int size , int seed) {
		  int rndn = 0;
		   if(seed != 0){
             Random rnd = new Random();
             rnd.setSeed(seed);
			 rndn = rnd.nextInt(size);
		  }
		  else
		  {
         	 rndn = new Random().nextInt(size);
		  }
			 return rndn;
		}


	protected static String languageCode = "0";
	static ArrayList<String> planetsLastDates = new ArrayList<String>();

	public static String doubleToDate(double m2) {
		int p = (int) m2;
		int r = (int) (12 * fract(m2));
		int t = (int) (30 * fract(12 * fract(m2)) + 1);
		if (r == 0) {
			p--;
			r = 12;
		} else if (r == 2 && t > 28) {
			t -= 28;
			r = 3;
		}
		String date = ymd(p, r, t);
		return date;
	}

	public static double fract(double x) {
		long l = (long) x;
		double d;
		return d = x - l;
	}

	public static String ymd(int year, int month, int day) {
		return makespace(String.valueOf(day), 2) + getSlashString() + makespace(String.valueOf(month), 2)
				+ getSlashString() + makespace(String.valueOf(year), 4);
	}

	public static String makespace(String x, int y) {
		x = x;
		y -= x.length();
		for (int i = 0; i < y; i++)
			x = " " + x;
		return x;
	}

	public static String getSlashString() {
		String str = "";
		if (getLanguageCode().equalsIgnoreCase("0")) {
			str = "/";
		} else if (getLanguageCode().equalsIgnoreCase("1")) {
			str = "@";
		}
		return str;
	}

	public static String getLanguageCode() {
		return languageCode;
	}

	/**
	 * method is used to display result for caller
	 * 
	 *
	 *
	 * @param string
	 *            string template will be passed
	 * @param ArrayList
	 *            start and end dates of arrylist
	 * @return single string of template with included dates
	 */

	public static String displayResult(String template, ArrayList<String> dates, String fromwhere,MyResourceBundle msg) {
		String fullString = template;

		if (fromwhere.equals("when")) {

			for (int i = 0; i < dates.size(); i++) {
				switch (i) {
				case 0:
					fullString = fullString.replace("startfdate", dates.get(i));
					break;
				case 1:
					fullString = fullString.replace("startedate", dates.get(i));
					break;
				case 2:
					fullString = fullString.replace("startsfdate", dates.get(i));
					break;
				case 3:
					fullString = fullString.replace("endsedate", dates.get(i));
					break;
				default:
					break;
				}
			}
			// fromwhere = false;
		} else if (fromwhere.equals("characterisitics")) {
			for (int i = 0; i < dates.size(); i++) {
				switch (i) {
				case 0:
					fullString = fullString.replace("@firstdirection", msg.getString(dates.get(i).toUpperCase()));
					break;
				case 1:
					fullString = fullString.replace("@seconddirection", msg.getString(dates.get(i).toUpperCase()));
					break;

				default:
					break;
				}
			}
		} else if (fromwhere.equals("past")) {
			for (int i = 0; i < dates.size(); i++) {
				switch (i) {
				case 0:
					fullString = fullString.replace("@planet",  msg.getString(dates.get(i).trim().toUpperCase()));
					break;
				case 1:
					fullString = fullString.replace("@noofyears", dates.get(i));
					break;

				default:
					break;
				}
			}
		}

		else {
			// fromwhere = false;
		}
		return fullString;

	}

	public static String displayResult(String template, String name) {

		return template.replace("@name", name);

	}

	public static String displayResult(String template) {

		return template;

	}

	public static String[] getStringArrayFromResource(String key, MyResourceBundle messages) {
		return messages.getString(key).split("#");
	}

	public static ArrayList<String> getMarriageDates(ArrayList<MarriageBean> arrayList) {
		ArrayList<String> marriageDates = new ArrayList<String>();
		for (int i = 0; i < 2; i++) {
			String start = arrayList.get(i).getStartDate();
			String end = arrayList.get(i).getEndDate();
			marriageDates.add(start);
			marriageDates.add(end);
		}
		return marriageDates;
	}

	public static boolean getMarriageDetails(Dasa dasa) {
		boolean isLove = false;
		int subLord = dasa.getSubLordForKPCusp(5), positiveHousesCount = 0;

		KP kp = new KP(dasa);
		int[] positiveHouseGroup = { 2, 7, 11 };
		for (int i = 1; i <= 9; i++) {
			positiveHousesCount = kp.howManyHousesSignifiedByPlanet(subLord, positiveHouseGroup);

		}
		if (positiveHousesCount > 0) {
			isLove = true;
		} else {
			isLove = false;
		}
		return isLove;

	}

	public static boolean getSameOrDifferentPerson() {
		return true;

	}

	public static ArrayList<String> getDirection(Dasa dasa) {
		ArrayList<String> arrayList = new ArrayList<String>();
		int houseRasiNumber = dasa.getAscendentSign() + 6;
		if (houseRasiNumber > 12) {
			houseRasiNumber = houseRasiNumber - 12;
		}
		int lord = getRasiLordFromRasiNumber(houseRasiNumber);
		int arr[] = dasa.getPlanetInBhav();
		int secondDir = arr[lord];

		String direction = getDirectionFromHouse(houseRasiNumber);
		String direction1 = getDirectionFromHouse(secondDir);
		arrayList.add(direction);
		arrayList.add(direction1);
		return arrayList;
	}

	public static boolean isMarriageSurvive() {
		// TODO Auto-generated method stub
		return true;
	}

	public static ArrayList<String> getPastString(Dasa dasa) {
		strongPlanetsendDate=null;
		ArrayList<String> arrayList = new ArrayList<String>();
		int siginfiedPlanet[] = new int[9];
		KP kp = new KP(dasa);

		int[] positiveHouseGroup = { 6, 8, 12 };

		for (int i = 1; i <= 9; i++) {
			int planet = i;
			int positiveHousesCount = kp.howManyHousesSignifiedByPlanet(planet, positiveHouseGroup);
			siginfiedPlanet[i - 1] = positiveHousesCount;

		}

		int[] aarSubLord = new int[siginfiedPlanet.length];
		for (int i = 0; i < siginfiedPlanet.length; i++) {
			for (int j = 0; j < siginfiedPlanet.length; j++) {
				aarSubLord[i] = 0;
				if (siginfiedPlanet[i] == siginfiedPlanet[j] && i != j) {
					aarSubLord[i] = i;
					break;
				} else {
					aarSubLord[i] = -1;
				}
			}
		}

		for (int i = 0; i < aarSubLord.length; i++) {
			if (aarSubLord[i] != -1) {
				int sublord = siginfiedPlanet[aarSubLord[i]] + dasa.getSubLordForKPPlanet(aarSubLord[i] + 1);
				siginfiedPlanet[i] = sublord;
			}

		}

		String planetName[] = { "Sun   ", "Moon  ", "Mars    ", "Mercury   ", "Jupiter   ", "Venus   ", "Saturn",
				"Rahu ", "Ketu" };
		int indexOfPlnet = sortPlanetAndArray(planetName, siginfiedPlanet);

		String plName = planetName[indexOfPlnet];
		arrayList.add(plName);

		String x9[] = { "Ketu   ", "Venus  ", "Sun    ", "Moon   ", "Mars   ", "Rahu   ", "Jupiter", "Saturn ",
				"Mercury" };
		ArrayList<Pdasa> m2Array = dasa.getVimsottariADasaArray();
		// ArrayList<Pdasa> pdasha = dasa.getVimsottariPDasaArray();
		String arrPlanetAdasha[] = new String[9];
		String pDashaStartDate[] = new String[9];
		String pDashaEndDate[] = new String[9];
		String arrMaha[] = new String[9];

		int count = 0; // antardasa
		int counterTocheck=0;
		for (int i = 0; i < m2Array.size(); i++) {
			counterTocheck++;

			while (count < 9) {

				arrMaha[count] = x9[m2Array.get(i).getMdasa()];

				arrPlanetAdasha[count] = x9[m2Array.get(i).getAdasa()];
				pDashaStartDate[count] = PdashaUtil.doubleToDate(m2Array.get(i).getPdasaStartDate());
				pDashaEndDate[count] = PdashaUtil.doubleToDate(m2Array.get(i).getPdasaEndDate());
				count++;
				i++;

			}

			int noOfYear = noOfYearFromCurrentDate(arrPlanetAdasha, pDashaStartDate, pDashaEndDate, plName,counterTocheck);
			if (noOfYear > 0) {
				arrayList.add(String.valueOf(noOfYear));
				break;

			}

			count = 0;
			pDashaStartDate = new String[9];
			pDashaEndDate = new String[9];
			arrPlanetAdasha = new String[9];

			i--;

		}

		return arrayList;
	}

	private static int noOfYearFromCurrentDate(String[] arrPlanets, String[] pDashaStartDate, String[] pDashaEndDate,
			String strongPlanet, int counterTocheck) {

		int yearDiffernce = 0;
		

		DateFormat dateFormat = new SimpleDateFormat("dd/M/yyy");
		Date date = new Date();

		for (int i = 0; i < arrPlanets.length; i++) {
			Date date1 = null;

			String startdate = pDashaStartDate[i];
			try {
				date1 = new SimpleDateFormat("dd/M/yyyy").parse(startdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (arrPlanets[i].trim().equalsIgnoreCase(strongPlanet.trim())) {

				strongPlanetsendDate = pDashaStartDate[i];
				planetsLastDates.add(strongPlanetsendDate);
			}

			if (date1.compareTo(date) > 0 || date1.compareTo(date) == 0) {
				try {

					if (strongPlanetsendDate != null && !strongPlanetsendDate.isEmpty()) {
						Date lastEndDateOfPlanet = new SimpleDateFormat("dd/M/yyyy").parse(strongPlanetsendDate);

						if (lastEndDateOfPlanet.compareTo(date) > 0) {
							lastEndDateOfPlanet = new SimpleDateFormat("dd/M/yyyy").parse(planetsLastDates.get(counterTocheck-2));
						}

						yearDiffernce = getDiffYears(lastEndDateOfPlanet, date);
						break;

					}

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}
		return yearDiffernce;
	}

	public static int getDiffYears(Date first, Date last) {
		Calendar a = getCalendar(first);
		Calendar b = getCalendar(last);
		int diff = b.get(Calendar.YEAR) - a.get(Calendar.YEAR);
	/*	if (a.get(Calendar.MONTH) > b.get(Calendar.MONTH) || (a.get(Calendar.MONTH) == b.get(Calendar.MONTH)
				&& a.get(Calendar.DAY_OF_MONTH) > b.get(Calendar.DAY_OF_MONTH))) {
			diff--;
		}*/
		return diff;
	}

	public static Calendar getCalendar(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal;
	}

	public static int sortPlanetAndArray(String[] arrPlanets, int[] arrBhav) {
		String[] pl = Arrays.copyOf(arrPlanets, arrPlanets.length);
		int[] a = Arrays.copyOf(arrBhav, arrBhav.length);

		for (int i = 0; i < a.length; i++) {
			for (int j = i + 1; j < a.length; j++) {
				if (a[i] > a[j]) {
					int temp = a[i];
					a[i] = a[j];
					a[j] = temp;
					String temp1 = pl[i];
					pl[i] = pl[j];
					pl[j] = temp1;
				}
			}
		}

		int in = (new ArrayList<String>(Arrays.asList(arrPlanets)).indexOf(pl[pl.length - 1]));
		return in;

	}

	public static String getDirectionFromHouse(int houseRasi) {

		String arrDirection[] = { "SOUTH", "EAST", "NORTH", "WEST", "SOUTH", "EAST", "NORTH", "WEST", "SOUTH", "EAST",
				"NORTH", "WEST" };

		return arrDirection[houseRasi - 1];
	}

	// { "Mars", "Venus", "Mercury", "Moon", "Sun", "Mercury", "Venus", "Mars",
	// "Jupiter",
	// "Saturn", "Saturn", "Jupiter" };
	public static int getRasiLordFromRasiNumber(int houseRasi) {

		int arrDirection[] = { 3, 6, 4, 2, 1, 4, 6, 3, 5, 7, 7, 5 };

		return arrDirection[houseRasi - 1];
	}

	public static int getRemedies(Dasa dasa) {
		int planetNameToReurn = 0;
		int siginfiedPlanet[] = new int[9];

		KP kp = new KP(dasa);

		int[] positiveHouseGroup = { 6, 8, 12 };

		for (int i = 1; i <= 9; i++) {
			int planet = i;
			int positiveHousesCount = kp.howManyHousesSignifiedByPlanet(planet, positiveHouseGroup);
			siginfiedPlanet[i - 1] = positiveHousesCount;

		}

		int[] aarSubLord = new int[siginfiedPlanet.length];
		for (int i = 0; i < siginfiedPlanet.length; i++) {
			for (int j = 0; j < siginfiedPlanet.length; j++) {
				aarSubLord[i] = 0;
				if (siginfiedPlanet[i] == siginfiedPlanet[j] && i != j) {
					aarSubLord[i] = i;
					break;
				} else {
					aarSubLord[i] = -1;
				}
			}
		}

		for (int i = 0; i < aarSubLord.length; i++) {
			if (aarSubLord[i] != -1) {
				int sublord = siginfiedPlanet[aarSubLord[i]] + dasa.getSubLordForKPPlanet(aarSubLord[i] + 1);
				siginfiedPlanet[i] = sublord;
			}

		}

		String planetName[] = { "Sun   ", "Moon  ", "Mars    ", "Mercury   ", "Jupiter   ", "Venus   ", "Saturn",
				"Rahu ", "Ketu" };
		int indexOfPlnet = sortPlanetAndArray(planetName, siginfiedPlanet);

		planetNameToReurn = indexOfPlnet;
		return planetNameToReurn;
	}

	public static ArrayList<String> getRemediesList(int indexNumber) {
		ArrayList<String> arrayList = new ArrayList<String>();
		final String[] enJadi = { "ANANT_MOOL", "ARAND_SARPANKHA_MOOL", "VIDHARA_MOOL", "KHIRNI_MOOL",
				"BEL_MOOL", "VIDHARA_MOOL", "ARAND_SARPANKHA_MOOL", "ANANT_MOOL", "BANANA_TURMERIC_MOOL",
				"DHATURE_BICHCHU_JADI", "DHATURE_BICHCHU_JADI", "BANANA_TURMERIC_MOOL" };

		arrayList.add(enJadi[indexNumber]);
		final String[] enRudraksha = { "3_FACED_RUD", "9_6_13_FACED_RUD", "10_FACED_RUD", "2_FACED_RUD",
				"1_12_FACED_RUD", "10_FACED_RUD", "9_6_13_FACED_RUD", "3_FACED_RUD", "5_FACED_RUD",
				"7_14_FACED_RUD", "7_14_FACED_RUD", "5_FACED_RUD" };
		arrayList.add(enRudraksha[indexNumber]);

		final String[] enGemston = { "RED_CORAL", "DIAMOND", "EMERALD", "PEARL", "RUBY", "EMERALD",
				"DIAMOND", "RED_CORAL", "YELLOW_SAPPHIRE", "BLUE_SAPPHIRE", "BLUE_SAPPHIRE", "YELLOW_SAPPHIRE" };
		arrayList.add(enGemston[indexNumber]);

		return arrayList;

	}

	public static String displayResult(String template, String name, String remedies) {

		return template.replace("@remedies", name);

	}

}
