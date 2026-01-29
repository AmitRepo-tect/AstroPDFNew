package com.ojassoft.astrosagecloud.api;

import java.util.ArrayList;

import com.cslsoftware.desktophoro.DesktopHoro;
import com.ojassoft.astrosagecloud.api.Dasa;
import com.ojassoft.astrosagecloud.api.KP;
import com.ojassoft.grouping.Aspect;
import com.ojassoft.grouping.KPNatalAspectFactory;
import com.ojassoft.pred.PredictionsEnglish;
import com.ojassoft.util.Set;
import com.ojassoft.util.Util;

public class KP {

	//DesktopHoro desktopHoro = Util.createHoro("14", "9", "2012", "9", "15", "0", "18", "55", "N", "72", "54","E", "5.5" );
	DesktopHoro desktopHoro = null;
	
	public KP(DesktopHoro desktopHoro) {
		//super();
		this.desktopHoro = desktopHoro;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//for (int i = 1; i <= 30; i++) {
		//	System.out.println();
		//	Share share = new Share(Util.createHoro(String.valueOf(i), "11", "2012", "9", "15", "0", "18", "55", "N", "72", "54","E", "5.5" ));
		//	share.daily();
		//}
		//DELHI
		//KP share = new KP(Util.createHoro("20", "5", "2013", "9", "15", "0", "28", "40", "N", "77", "13","E", "5.5" ));
		//MUMBAI
		//KP share = new KP(Util.createHoro("16", "11", "2012", "9", "0", "0", "18", "55", "N", "72", "54","E", "5.5" ));
		//KP share = new KP( Util.giveHoro("punit"));
		//kp.printSubLordReport();
		///System.out.println(kp.desktopHoro.getVimsottariDasaTwoLevel());
		///System.out.println(kp.desktopHoro.getMahaDasa(0));
		//System.out.println(kp.desktopHoro.getBhuktiDasa(0, 4));
				
		//share.daily();
		//share.daily3();
		//Share share = new Share(Util.giveHoro("punit"));
		//share.judgeHealth();
		//share.judgeAllHouses();
		//share.willIGetMarried();
		//KP share = new KP( Dasa.createHoro("punit","11" , "4" , "1979" , "18" , "23" , "0" , "27" , "9" , "N" , "78" , "0" , "E" , "5.5"));
//		KP share = new KP( Dasa.createHoro("pratik","11", "3", "1986", "9", "29", "0", "28", "0", "N", "78", "0","E", "5.5" ));
//		share.whenWillIGetMarried(Dasa.createHoro("pratik","11", "3", "1986", "9", "29", "0", "28", "0", "N", "78", "0","E", "5.5" ).getVimsottariDasaArray());
		String path = "";
		KP share = new KP( Dasa.createHoro("punit","11" , "4" , "1979" , "18" , "23" , "0" , "27" , "9" , "N" , "78" , "0" , "E" , "5.5",path));
		share.whenWillIGetMarried(Dasa.createHoro("punit","11" , "4" , "1979" , "18" , "23" , "0" , "27" , "9" , "N" , "78" , "0" , "E" , "5.5",path).getVimsottariPDasaArray());

	}
	
	public void printSubLordReport() {
		for (int i =1; i <=12 ; i++) {
			int [] signification = Set.removeZeroElements( desktopHoro.getKPPlanetSignification(getSubLordForKPCusp(i)));
			for (int j=0; j<signification.length; j++)
				System.out.println(PredictionsEnglish.cuspalSubLord[i-1][signification[j]-1]);
		}
	}

	public void printPlacementReport() {
		for (int i =1; i <=9 ; i++) {
			//PredictionsEnglish.housePlacement[][];
		}
	}

	
	/**
	 * calculates daily share market trend - 4 being extreme positive and -4 being extreme negative.
	 */
	public void daily() {
		int[] positiveHouseGroup = {2,9,10,11};
		int[] negativeHouseGroup = {5,4,6,12};
		
		int ASL = getKPAscendentSubLord();
		System.out.println("ASL: " + ASL);
		Set.printIntArray(getKPPlanetSignification(ASL));
		
		int positiveHousesCount = howManyHousesSignifiedByPlanet(ASL, positiveHouseGroup);
		int negativeHousesCount = howManyHousesSignifiedByPlanet(ASL, negativeHouseGroup);
		
		System.out.println(this.desktopHoro);
		System.out.println(positiveHousesCount - negativeHousesCount);
		
		//System.out.println(share.getKPAscendentSubLord());
		//System.out.println(share.howManyHousesSignifiedByPlanet(1, hg));

	}

	/**
	 * calculates daily share market trend - 4 being extreme positive and -4 being extreme negative.
	 */
	public void daily2() {
		int[] positiveHouseGroup = {1,2,6,10,11};
		int[] negativeHouseGroup = {4,5,8,9,12};
		
//		int ASL = getKPAscendentSubLord();
//		System.out.println("ASL: " + ASL);
//		Util.printIntArray(getKPPlanetSignification(ASL));
//		
//		int positiveHousesCount = howManyHousesSignifiedByPlanet(ASL, positiveHouseGroup);
//		int negativeHousesCount = howManyHousesSignifiedByPlanet(ASL, negativeHouseGroup);

		System.out.println(this.desktopHoro);
		System.out.println(judgeHouse(1, positiveHouseGroup, negativeHouseGroup));
		System.out.println();

		System.out.println(this.desktopHoro);
		System.out.println(judgeHouse(2, positiveHouseGroup, negativeHouseGroup));
		System.out.println();

		System.out.println(this.desktopHoro);
		System.out.println(judgeHouse(11, positiveHouseGroup, negativeHouseGroup));
		
		
		
		//System.out.println(share.getKPAscendentSubLord());
		//System.out.println(share.howManyHousesSignifiedByPlanet(1, hg));

	}
	

	/**
	 * calculates daily share market trend - 4 being extreme positive and -4 being extreme negative.
	 */
	public void daily3() {
		int[] positiveHouseGroup = {1,2,6,10,11};
		int[] negativeHouseGroup = {4,5,8,9,12};
		
//		int ASL = getKPAscendentSubLord();
//		System.out.println("ASL: " + ASL);
//		Util.printIntArray(getKPPlanetSignification(ASL));
//		
//		int positiveHousesCount = howManyHousesSignifiedByPlanet(ASL, positiveHouseGroup);
//		int negativeHousesCount = howManyHousesSignifiedByPlanet(ASL, negativeHouseGroup);

		System.out.println(this.desktopHoro);
		System.out.println(judgeHouse(1, positiveHouseGroup, negativeHouseGroup));
		System.out.println();

//		System.out.println(this.desktopHoro);
//		System.out.println(judgeHouse(2, positiveHouseGroup, negativeHouseGroup));
//		System.out.println();
//
//		System.out.println(this.desktopHoro);
//		System.out.println(judgeHouse(11, positiveHouseGroup, negativeHouseGroup));
		
		for (int planet=1; planet<=9; planet++){
			System.out.println(judgePlanet(planet, positiveHouseGroup, negativeHouseGroup));
		}
		
		//System.out.println(share.getKPAscendentSubLord());
		//System.out.println(share.howManyHousesSignifiedByPlanet(1, hg));

	}
	
	
	
	public int judgeHouse (int houseNo, int [] positiveHouseGroup, int [] negativeHouseGroup) {
		int cuspalSubLord = getSubLordForKPCusp(houseNo);
		int positiveHousesCount = howManyHousesSignifiedByPlanet(cuspalSubLord, positiveHouseGroup);
		int negativeHousesCount = howManyHousesSignifiedByPlanet(cuspalSubLord, negativeHouseGroup);
		System.out.println("House: " + houseNo + ", CSL: " + cuspalSubLord + ", Sig: " + Set.returnIntArrayInString(getKPPlanetSignification(cuspalSubLord))+  ", Pos: " + Set.returnIntArrayInString(positiveHouseGroup) + ", Neg: " + Set.returnIntArrayInString(negativeHouseGroup));
		return (positiveHousesCount - negativeHousesCount);
	}

	public int judgePlanet (int planetNo, int [] positiveHouseGroup, int [] negativeHouseGroup) {
		int [] signification = getKPPlanetSignification(planetNo);
		int positiveHousesCount = Set.retainAll(signification, positiveHouseGroup).length;
		int negativeHousesCount = Set.retainAll(signification, negativeHouseGroup).length;
		System.out.println("Planet: " + Util.planets[planetNo-1] + ", Sig: " + Set.returnIntArrayInString(signification)+  ", Pos: " + Set.returnIntArrayInString(positiveHouseGroup) + ", Neg: " + Set.returnIntArrayInString(negativeHouseGroup));
		return (positiveHousesCount - negativeHousesCount);
	}
	
	
	public int judgeHouse (Aspect aspect) {
		return this.judgeHouse(aspect.getHouseNo(), aspect.getPositiveHouseGroup(), aspect.getNegativeHouseGroup());
	}

	public void judgeHealth(){
		Aspect aspect = (new KPNatalAspectFactory()).getAspect(KPNatalAspectFactory.HEALTH);
		int status = judgeHouse(aspect) + 3;
		System.out.println((status+1) +"/7"  + " " + aspect.getAspectName());		
	}

	public void judgeAllHouses(){
		Aspect [] aspects = (new KPNatalAspectFactory()).getAllAspects();
		
		for (Aspect asp: aspects) {
			int status = judgeHouse(asp.getHouseNo(), asp.getPositiveHouseGroup(), asp.getNegativeHouseGroup()) + 3;
			String [] statusMessage = {"Extremely Poor", "Poor", "Slightly Poor", "Average", "Decent", "Good", "Excellent"}; 
			System.out.println("Possibility: " + (status+1) +"/7"  + " (" + statusMessage[status] + ") " + asp.getAspectName());
			System.out.println();
		}
	}
	
	/**
	 * Marriage
	 */
	public void willIGetMarried() {
		int[] positiveHouseGroup = {2,7,11};
		int[] negativeHouseGroup = {6,10,12};
		
		int ASL = getSubLordForKPCusp(7);
		System.out.println("7CSL: " + ASL);
		Set.printIntArray(getKPPlanetSignification(ASL));
		
		int positiveHousesCount = howManyHousesSignifiedByPlanet(ASL, positiveHouseGroup);
		int negativeHousesCount = howManyHousesSignifiedByPlanet(ASL, negativeHouseGroup);
		
		System.out.println(this.desktopHoro);
		
		System.out.print("Your cuspal sub lord of 7th house is " + Util.getPlanetName(ASL));
		System.out.print(". " + Util.getPlanetName(ASL) + " signifieses "  + 		Set.returnIntArrayInString(getKPPlanetSignification(ASL)) +
		 "houses. ");
		
		if (positiveHousesCount > 0) {
			System.out.print("As conductive houses viz. " + Set.returnIntArrayInString(positiveHouseGroup) + "are signified, this shows that marriage is promised for you. Cheers. ");

			if (positiveHousesCount - negativeHousesCount < 1)
				System.out.print(" Though it shows some problems as negative houses are also signified. ");

			if (	
					(isPlanetSignifiesHouse(getSubLordForKPCusp(5),7)) 
							|| (isPlanetSignifiesHouse(getSubLordForKPCusp(5),7))
							)
					System.out.println("Love marriage is promised. ");
			else
				System.out.println("Arranged marriage is promised. ");
		
		
		}
		else
			System.out.print("As conductive houses viz. " + Set.returnIntArrayInString(positiveHouseGroup) + "are NOT signified, this shows problems in getting married.");


			
		
		
		//System.out.println(share.getKPAscendentSubLord());
		//System.out.println(share.howManyHousesSignifiedByPlanet(1, hg));

	}
	
	public void whenWillIGetMarried(ArrayList<com.ojassoft.astrosagecloud.api.Dasa.Pdasa> m2Array) {
		//ArrayList<com.ojassoft.api.Dasa.Pdasa> m2Array = this.getVimsottariDasaArray();

		int mdasa = 0;
		int adasa = 0;
		int pdasa = 0;
		
		int[] positiveHouseGroup = {2,7,11};
		int[] negativeHouseGroup = {6,10,12};
		
		for (com.ojassoft.astrosagecloud.api.Dasa.Pdasa prdasa : m2Array) {
			
			if ((prdasa.getPdasaEndDate() > (desktopHoro.getYearOfBirth()+21)) && (prdasa.getPdasaEndDate() < (desktopHoro.getYearOfBirth()+35))) {
				System.out.print(prdasa);
				
				mdasa = prdasa.getMdasa();
				adasa = prdasa.getAdasa();
				pdasa = prdasa.getPdasa();
			
				int positiveHouseCount = 0, negativeHouseCount = 0;
				
				//Set.printIntArray(getKPPlanetSignification(nakToNormalSeq(mdasa)));
				
				//Set.printIntArray(Set.count(positiveHouseGroup, getKPPlanetSignification(nakToNormalSeq(mdasa))));
				//Set.printIntArray(Set.count(negativeHouseGroup, getKPPlanetSignification(nakToNormalSeq(mdasa))));
				
				positiveHouseCount += Set.addAllElementsOfSet(Set.count(positiveHouseGroup, getKPPlanetSignification(nakToNormalSeq(mdasa))));
				positiveHouseCount += Set.addAllElementsOfSet(Set.count(positiveHouseGroup, getKPPlanetSignification(nakToNormalSeq(adasa))));
				positiveHouseCount += Set.addAllElementsOfSet(Set.count(positiveHouseGroup, getKPPlanetSignification(nakToNormalSeq(pdasa))));
				
				//Util.Print("positiveHouseCount" + positiveHouseCount);
		
				negativeHouseCount += Set.addAllElementsOfSet(Set.count(negativeHouseGroup, getKPPlanetSignification(nakToNormalSeq(mdasa))));
				negativeHouseCount += Set.addAllElementsOfSet(Set.count(negativeHouseGroup, getKPPlanetSignification(nakToNormalSeq(adasa))));
				negativeHouseCount += Set.addAllElementsOfSet(Set.count(negativeHouseGroup, getKPPlanetSignification(nakToNormalSeq(pdasa))));
				
				//Util.Print("negativeHouseCount" + negativeHouseCount);
				
				System.out.format("  %.2f%s  %n" , ((double)positiveHouseCount / ((double)positiveHouseCount + (double)negativeHouseCount) * 100.0), "%");
				//System.out.println(((double)positiveHouseCount / ((double)positiveHouseCount + (double)negativeHouseCount) * 100.0)  + "%");
			}
		}
		

	}
	
	int nakToNormalSeq(int nakshatraSequence) {
		int[] nakToNormalSeq = {9,  6,  1,  2,  3,  8,  5,  7,  4};
		return nakToNormalSeq[nakshatraSequence];
	}
	
	public int getKPAscendentSubLord() {
		                      //ke  ve  su  mo  ma  ra  ju  sa  me
		int[] nakToNormalSeq = {9,  6,  1,  2,  3,  8,  5,  7,  4};
		//Util.printIntArray(getKPPlanetSignification(1));
		//desktopHoro.getSubLordForKPCusp(cuspNo)
		return (nakToNormalSeq[desktopHoro.getKPAscendentSubLord()]);
	}

	
	public int getSubLordForKPCusp(int cuspNo) {
		// ke ve su mo ma ra ju sa me
		int[] nakToNormalSeq = { 9, 6, 1, 2, 3, 8, 5, 7, 4 };
		return (nakToNormalSeq[desktopHoro.getSubLordForKPCusp(cuspNo)]);
	}
	
	/**
	 * Returns houses signified by the planet
	 * @param planet
	 * @return houses signified by the planet
	 */
	int[] getKPPlanetSignification (int planet) {
		return desktopHoro.getKPPlanetSignification(planet);	
	}
	
	/**
	 * Tell whether given planet signifies given house or not
	 * @param planet
	 * @param house
	 * @return
	 */
	boolean isPlanetSignifiesHouse (int planet, int house ){
		int [] housesSignified = getKPPlanetSignification(planet);
		for (int i: housesSignified) {
			if (i== house)
				return true;
		}
		return false;
	}

	/**
	 * Tell whether given planet signifies given house-group or not
	 * @param planet
	 * @param house
	 * @return
	 */
	boolean isPlanetSignifiesHouseGroup (int planet, int[] houses ){
		int [] housesSignified = getKPPlanetSignification(planet);
		for (int i: housesSignified) {
			for (int j: houses) {
				if (i== houses[j])
					return true;
				}
		}
		return false;
	}

	/**
	 * Tell whether given planet signifies given house-group or not. 
	 * Also tells how many houses are signified from house-group.
	 * @param planet
	 * @param house
	 * @return 
	 */
	int[] isPlanetSignifiesHouseGroupWithStrengh (int planet, int[] houseGroup ){
		int count = 0, resultInt;
		boolean result = false;
		int [] housesSignified = getKPPlanetSignification(planet);
		for (int i: housesSignified) {
			for (int j: houseGroup) {
				if (i== j) {
					count++;
					result = true;
				}
				}
		}
		resultInt = result? 1 : 0;
		int[] response = {resultInt, count};
		return response;
	}


	
	/**
	 * Tell how many houses are signified from house-group by the planet.
	 * @param planet
	 * @param house
	 * @return 
	 */
	public int howManyHousesSignifiedByPlanet (int planet, int[] houseGroup ){
		int count = 0;
		int [] housesSignified = getKPPlanetSignification(planet);
		for (int i: housesSignified) {
			for (int j: houseGroup) {
				if (i== j) {
					count++;
				}
				}
		}
		return count;
	}
	
	
}
