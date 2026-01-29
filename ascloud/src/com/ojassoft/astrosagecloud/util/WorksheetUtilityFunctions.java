package com.ojassoft.astrosagecloud.util;

import com.cslsoftware.desktophoro.DesktopHoro;

public class WorksheetUtilityFunctions {
	/**
	 * This method called from worksheet to get the planet position.
	 * @param kundlino myAstrologyObject
	 * @return int[] arrPlanetsShodashvarga.
	 */
	 public static int[] Getplanetpositionarr(int kundlino ,DesktopHoro myAstrologyObject){
    // Dim sDashaOutput,balanceDasha    
		 int[]  arrPlanetsShodashvarga =  new int[13];
     if(myAstrologyObject!=null && !myAstrologyObject.equals("")){
    // DashaOutput = myAstrologyObject.getVimsottariDasaTwoLevel()
    // balanceDasha = myAstrologyObject.getBalanceOfDasa
     
    // Dim RaashiNoCorrespondingToPlanets1(12)
    myAstrologyObject.saptavg();
    arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(kundlino-1);
    //for(int k = 0 ;k<= 12 ;k++){
       // RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga(k)
    //}      
     }
     return arrPlanetsShodashvarga;
	 }
	 
	 public static int[] GetLalkitabplanetposition(DesktopHoro myAstrologyObject){
		 int[] arrPlanetsBhava = new int[13];       
	        if(myAstrologyObject!=null && !myAstrologyObject.equals("")) {
	        int[] arrPlanetsShodashvarga = myAstrologyObject.getPositionForShodasvarg(0);
	        
	        for(int planetCount = 0; planetCount<= 11;planetCount++){
	            arrPlanetsBhava[planetCount+1] = Astrology.rasiToBhava (arrPlanetsShodashvarga[0], arrPlanetsShodashvarga[planetCount+1]);
	        }
	       }
	        arrPlanetsBhava[0] = 1;   
	        return arrPlanetsBhava;
	 }

}
