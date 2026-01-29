/*
 * Copyright (c) 2018, 2023, Ojas softech pvt ltd All rights reserved.
 * OJAS PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 */

package com.ojassoft.astrosagecloud.api;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.swing.plaf.basic.BasicScrollPaneUI.HSBChangeListener;

import com.ojassoft.astrosagecloud.api.Dasa;
import com.ojassoft.astrosagecloud.api.KP;
import com.ojassoft.astrosagecloud.api.Dasa.Pdasa;
import com.ojassoft.astrosagecloud.util.PdashaUtil;
import com.ojassoft.astrosagecloud.util.Util;

/**
 * The {@code DasafalMarriage} class is used to calculate best period for
 * marriage on the basis of your current mahadasha anterdasha pretunterdasha
 * 
 * 
 * 
 * 
 * @author Mahtab Hussain
 * 
 */

public class DasafalMarriage {
	MarriageBean marriageData;

	/**
	 * method is used to calculate two most favorable dates for your marriage
	 * 
	 *
	 *
	 * @param object
	 *            dasa class object will be passed
	 * @return ArrayList initially return arraylist of marriage bean
	 */
	public static ArrayList<MarriageBean> getDasaRank(Dasa dasa) {
		ArrayList<MarriageBean> mData = new ArrayList<MarriageBean>();
		int diffCount[] = new int[9];
		int rank[] = new int[9];
		int siginfiedPlanet[] = new int[9];

		KP kp = new KP(dasa);

		int[] positiveHouseGroup = { 2, 7, 11 };
		int[] negativeHouseGroup = { 6, 10, 12 };

		for (int i = 1; i <= 9; i++) {
			int planet = i;
			int positiveHousesCount = kp.howManyHousesSignifiedByPlanet(planet, positiveHouseGroup);
			siginfiedPlanet[i - 1] = positiveHousesCount;
			int negativeHousesCount = kp.howManyHousesSignifiedByPlanet(planet, negativeHouseGroup);
			int difference = positiveHousesCount - negativeHousesCount;
			diffCount[i - 1] = difference;

		}

		// [-2, 0, 0, -1, 0, 1, 1, 2, 0]

		// [-1, 1, 2, -1, 4, 5, 6, -1, 8]
		// for sublord

		int[] aarSubLord = new int[diffCount.length];

		for (int i = 0; i < diffCount.length; i++) {
			for (int j = 0; j < diffCount.length; j++) {
				aarSubLord[i] = 0;
				if (diffCount[i] == diffCount[j] && i != j) {
					aarSubLord[i] = i;
					break;
				} else {
					aarSubLord[i] = -1;
				}
			}
		}

		for (int i = 0; i < aarSubLord.length; i++) {
			if (aarSubLord[i] != -1) {
				int sublord = diffCount[aarSubLord[i]]+dasa.getSubLordForKPPlanet(aarSubLord[i] + 1);
				diffCount[i] = sublord;
			}

		}

		// end

		String x9[] = { "Ketu   ", "Venus  ", "Sun    ", "Moon   ", "Mars   ", "Rahu   ", "Jupiter", "Saturn ",
				"Mercury" };

		int mahadasalord, antardasalord, pretutradasalord;
		// ArrayList<Pdasa> m2Array = dasa.getVimsottariADasaArray(); // for
		ArrayList<Pdasa> pdasha = dasa.getVimsottariPDasaArray();
		String arrPlanetsPdasha[] = new String[9];
		int arrBhavPdasha[] = new int[9];
		String arrMaha[] = new String[9];
		String arrPlanetAdasha[] = new String[9];
		String arrPlanetMahadasha[] = new String[9];
		String pDashaStartDate[] = new String[9];
		String pDashaEndDate[] = new String[9];

		int count = 0; // antardasa
		for (int i = 0; i < pdasha.size(); i++) {
			while (count < 9) {
				mahadasalord = Util.getNormalSeq(pdasha.get(i).getMdasa());
				antardasalord = Util.getNormalSeq(pdasha.get(i).getAdasa());
				pretutradasalord = Util.getNormalSeq(pdasha.get(i).getPdasa());
				arrMaha[count] = pdasha.get(i).toString();
				pDashaStartDate[count] = PdashaUtil.doubleToDate(pdasha.get(i).getPdasaStartDate());
				pDashaEndDate[count] = PdashaUtil.doubleToDate(pdasha.get(i).getPdasaEndDate());
				arrPlanetMahadasha[count] = x9[pdasha.get(i).getMdasa()];
				arrPlanetAdasha[count] = x9[pdasha.get(i).getAdasa()];
				arrPlanetsPdasha[count] = x9[pdasha.get(i).getPdasa()];
				arrBhavPdasha[count] = diffCount[mahadasalord - 1] + diffCount[antardasalord - 1]
						+ diffCount[pretutradasalord - 1];
				count++;
				i++;

			}

			MarriageBean data = dashaBestTime(arrPlanetsPdasha, arrBhavPdasha, arrMaha, pDashaStartDate, pDashaEndDate);
			if (data != null) {
				mData.add(data);

			}
			count = 0;
			arrPlanetsPdasha = new String[9];
			arrBhavPdasha = new int[9];
			arrMaha = new String[9];
			pDashaStartDate = new String[9];
			pDashaEndDate = new String[9];
			arrPlanetMahadasha = new String[9];
			arrPlanetAdasha = new String[9];

			i--;

		}
		return mData;

	}

	/**
	 * method is to calculate two dates start date and end date
	 * 
	 *
	 *
	 * @param arr[]
	 *            string planets
	 * @param arr[]
	 *            int bhav
	 * @param arr[]
	 *            string mahadasha
	 * @param arr[]
	 *            string prtunderdasha
	 * @param arr[]
	 *            string prtunderdasha start date
	 * @param arr[]
	 *            string prtunderdasha end date
	 * @return marriage bean object will return which will be add in arraylist
	 *         of same type
	 */
	private static MarriageBean dashaBestTime(String[] arrPlanets, int[] arrBhav, String[] arrMaha,
			String[] pDashaStartDate, String[] pDashaEndDate) {
		MarriageBean marriageData = null;
		String[] pl = Arrays.copyOf(arrPlanets, arrPlanets.length);
		int[] a = Arrays.copyOf(arrBhav, arrBhav.length);
		DateFormat dateFormat = new SimpleDateFormat("dd/M/yyy");
		Date date = new Date();
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
		int inn = (new ArrayList<String>(Arrays.asList(arrPlanets)).indexOf(pl[pl.length - 2]));

		for (int i = 0; i < arrMaha.length; i++) {
			Date date1 = null;

			String startdate = pDashaStartDate[i];
			String enddate = pDashaEndDate[i];
			try {
				date1 = new SimpleDateFormat("dd/M/yyyy").parse(startdate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (date1.compareTo(date) > 0 || date1.compareTo(date) == 0) {

				if (i == in || i == inn) {
					// System.out.print(arrMaha[i]);

					if (i == in) {
						marriageData = new MarriageBean();
						marriageData.setStartDate(startdate);
						marriageData.setEndDate(enddate);
						// System.out.println(", Nature:" + arrBhav[i] + ",
						// Excellent");
						break;

					} else {
						marriageData = new MarriageBean();
						marriageData.setStartDate(startdate);
						marriageData.setEndDate(enddate);
						// System.out.println(", Nature:" + arrBhav[i] + ",
						// Good");
						break;

					}
				}
			}
		}
		return marriageData;
	}

}
