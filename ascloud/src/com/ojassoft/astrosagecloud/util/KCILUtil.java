package com.ojassoft.astrosagecloud.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ojassoft.astrosagecloud.DO.BeanKpCIL;
import com.ojassoft.astrosagecloud.DO.BeanKpKhullarCIL;
import com.ojassoft.astrosagecloud.DO.BeanKpPlanetSigWithStrength;
import com.ojassoft.astrosagecloud.DO.BeanNakshtraNadi;
import com.ojassoft.astrosagecloud.DO.InPlanetKpCusp;
import com.ojassoft.astrosagecloud.DO.NadiValues;
import com.ojassoft.astrosagecloud.localization.MyProperties;
import com.ojassoft.kpextension.BeanKP4Step;
import com.ojassoft.kpextension.BeanKp4StepPlanet;
import com.ojassoft.kpextension.CKp4StepCalculation;
import com.ojassoft.kpextension.CKpRefactorExtension;
import com.ojassoft.kpextension.GlobalVariablesKPExtension;
import com.ojassoft.kpextension.KeyValue4Step;

public class KCILUtil 
{
	public final static Logger LOGGER = Logger
  			.getLogger(KCILUtil.class.getName());
	public static InPlanetKpCusp initValuesForMyKundli(String strData) {
		
		InPlanetKpCusp inPlanet = new InPlanetKpCusp();
        
        //PUT THESE VALU IN PREFERENCE

        //new CGlobalObjectMiscOperation(t).saveCGlobalObjectValuesInPreference(strData);//ADDED BY BIJENDRA ON 20-JULY-13

		double lagna = Double.valueOf(strData.substring(strData.indexOf("<lagna>") + "<lagna>".length(), strData.indexOf("</lagna>")));
        if (lagna >= 360.00)
            lagna -= 360.00;

        inPlanet.setLagna(Double.valueOf(lagna));
           
        inPlanet.setSun(Double.valueOf(strData.substring(strData.indexOf("<sun>") + "<sun>".length(), strData.indexOf("</sun>"))));
        
        inPlanet.setMoon(Double.valueOf(strData.substring(strData.indexOf("<moon>") + "<moon>".length(), strData.indexOf("</moon>"))));
        
        inPlanet.setMars(Double.valueOf(strData.substring(strData.indexOf("<mars>") + "<mars>".length(), strData.indexOf("</mars>"))));
            
        inPlanet.setMercury(Double.valueOf(strData.substring(strData.indexOf("<mercury>") + "<mercury>".length(), strData.indexOf("</mercury>"))));
            
        inPlanet.setJupiter(Double.valueOf(strData.substring(strData.indexOf("<jupiter>") + "<jupiter>".length(), strData.indexOf("</jupiter>"))));
            
        inPlanet.setVenus(Double.valueOf(strData.substring(strData.indexOf("<venus>") + "<venus>".length(), strData.indexOf("</venus>"))));
            
        inPlanet.setSaturn(Double.valueOf(strData.substring(strData.indexOf("<saturn>") + "<saturn>".length(), strData.indexOf("</saturn>"))));
            
        inPlanet.setRahu(Double.valueOf(strData.substring(strData.indexOf("<rahu>") + "<rahu>".length(), strData.indexOf("</rahu>"))));
       
        inPlanet.setKetu(Double.valueOf(strData.substring(strData.indexOf("<ketu>") + "<ketu>".length(), strData.indexOf("</ketu>"))));

        inPlanet.setUranus(Double.valueOf(strData.substring(strData.indexOf("<uranus>") + "<uranus>".length(), strData.indexOf("</uranus>"))));

        inPlanet.setNeptune(Double.valueOf(strData.substring(strData.indexOf("<neptune>") + "<neptune>".length(), strData.indexOf("</neptune>"))));

        inPlanet.setPluto(Double.valueOf(strData.substring(strData.indexOf("<pluto>") + "<pluto>".length(), strData.indexOf("</pluto>"))));

        inPlanet.setKpCusp1(Double.valueOf(strData.substring(strData.indexOf("<kpcusp1>") + "<kpcusp1>".length(), strData.indexOf("</kpcusp1>"))));
        inPlanet.setKpCusp2(Double.valueOf(strData.substring(strData.indexOf("<kpcusp2>") + "<kpcusp2>".length(), strData.indexOf("</kpcusp2>"))));
        inPlanet.setKpCusp3(Double.valueOf(strData.substring(strData.indexOf("<kpcusp3>") + "<kpcusp3>".length(), strData.indexOf("</kpcusp3>"))));
        inPlanet.setKpCusp4(Double.valueOf(strData.substring(strData.indexOf("<kpcusp4>") + "<kpcusp4>".length(), strData.indexOf("</kpcusp4>"))));
        inPlanet.setKpCusp5(Double.valueOf(strData.substring(strData.indexOf("<kpcusp5>") + "<kpcusp5>".length(), strData.indexOf("</kpcusp5>"))));
        inPlanet.setKpCusp6(Double.valueOf(strData.substring(strData.indexOf("<kpcusp6>") + "<kpcusp6>".length(), strData.indexOf("</kpcusp6>"))));
        inPlanet.setKpCusp7(Double.valueOf(strData.substring(strData.indexOf("<kpcusp7>") + "<kpcusp7>".length(), strData.indexOf("</kpcusp7>"))));
        inPlanet.setKpCusp8(Double.valueOf(strData.substring(strData.indexOf("<kpcusp8>") + "<kpcusp8>".length(), strData.indexOf("</kpcusp8>"))));
        inPlanet.setKpCusp9(Double.valueOf(strData.substring(strData.indexOf("<kpcusp9>") + "<kpcusp9>".length(), strData.indexOf("</kpcusp9>"))));
        inPlanet.setKpCusp10(Double.valueOf(strData.substring(strData.indexOf("<kpcusp10>") + "<kpcusp10>".length(), strData.indexOf("</kpcusp10>"))));
        inPlanet.setKpCusp11(Double.valueOf(strData.substring(strData.indexOf("<kpcusp11>") + "<kpcusp11>".length(), strData.indexOf("</kpcusp11>"))));
        inPlanet.setKpCusp12(Double.valueOf(strData.substring(strData.indexOf("<kpcusp12>") + "<kpcusp12>".length(), strData.indexOf("</kpcusp12>"))));
	
   
        return inPlanet;
	}
	
	public static BeanKP4Step[] getBeanKp4StepBeansArrayNew(InPlanetKpCusp inKPPlanetsAndCuspObject) {
        double[] kpcups = inKPPlanetsAndCuspObject.getKpCuspArray();
        double[] kpplnts = inKPPlanetsAndCuspObject.getKpPlanetArray();


        BeanKP4Step[] bean = new BeanKP4Step[9];
        for (int i = 0; i < bean.length; i++)
            bean[i] = new BeanKP4Step();

        CKp4StepCalculation kp4Step = new CKp4StepCalculation(kpplnts, kpcups);
        kp4Step.calculate();

        bean[0] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.SUN);
        bean[1] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.MOON);
        bean[2] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.MARS);
        bean[3] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.MERCURY);
        bean[4] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.JUPITER);
        bean[5] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.VENUS);
        bean[6] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.SAT);
        bean[7] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.RAHU);
        bean[8] = kp4Step.getKp4StepForPlanet(GlobalVariablesKPExtension.KETU);

			/*for(int i=0;i<bean.length;i++)
				Log.e("printStep1",String.valueOf(bean[i].getKp4Step1().getPlanet()));
			*/


        return bean;
    }
	
	public static String printSteps(BeanKp4StepPlanet beanKP4planet, boolean isStep1, MyProperties rbConstants)
	{
		StringBuilder sb = new StringBuilder();
		sb.append(" "+rbConstants.getString(Common.arrLongPlanetName[beanKP4planet.getPlanet()].toUpperCase()) + " : ");
		if (beanKP4planet.getPlanetStepValues() != null) {
            int lSuSt1 = beanKP4planet.getPlanetStepValues().length;
            for (int i = 0; i < lSuSt1; i++) {
                sb.append(" " + beanKP4planet.getPlanetStepValues()[i]);

            }

            int plnt = beanKP4planet.getPlanet();

            if ((beanKP4planet.getPlanet() == GlobalVariablesKPExtension.RAHU) || (beanKP4planet.getPlanet() == GlobalVariablesKPExtension.KETU)) {
                KeyValue4Step obj = beanKP4planet.getRahuKetPlacedInPlanetRashi();
                if (obj.getValues() != null) {
                    sb.append(" ( " + rbConstants.getString(Common.arrLongPlanetName[obj.getKey()].toUpperCase()));

                    for (int i = 0; i < obj.getValues().length; i++)
                        sb.append(" " + obj.getValues()[i]);

                    sb.append(")");

                }
            }
        }

        //CUSPAL CONJUNCTION
        if (beanKP4planet.getPlanetCuspConjunction() > 0)
            sb.append(" " + beanKP4planet.getPlanetCuspConjunction() + "(" + rbConstants.getString("CUSPAL") + ")");

        //PLANET CONJUNCTION

        if (beanKP4planet.getPlanetConjunction().size() > 0) {
            for (KeyValue4Step obj : beanKP4planet.getPlanetConjunction()) {
                if (obj.getValues() != null) {
                    sb.append(" (" +rbConstants.getString("CONJDASH")+"-" + rbConstants.getString(Common.arrLongPlanetName[obj.getKey()].toUpperCase()));

                    for (int i = 0; i < obj.getValues().length; i++)
                        sb.append(" " + obj.getValues()[i]);

                    if ((obj.getKey() == GlobalVariablesKPExtension.RAHU) || (obj.getKey() == GlobalVariablesKPExtension.KETU)) {
                        if (obj.gePlanetValuesInWhichRahuKetuPlaced() != null) {

                            sb.append(" (" + rbConstants.getString(Common.arrLongPlanetName[obj.getPlanetInWhichRahuKetuPlaced()].toUpperCase()));
                            for (int i = 0; i < obj.gePlanetValuesInWhichRahuKetuPlaced().length; i++)
                                sb.append(" " + obj.gePlanetValuesInWhichRahuKetuPlaced()[i]);
                            sb.append(")");
                        }
                    }

                    sb.append(")");

                }
            }
        }

        //CUSP ASPECT

        if ((isStep1 && beanKP4planet.isPlanetStrong()) || !isStep1) {
            if (beanKP4planet.getCuspAspect() != null) {

                sb.append(" ("+rbConstants.getString("ASPDASH")+"-");
                for (int i = 0; i < beanKP4planet.getCuspAspect().length; i++)
                    sb.append(" " + beanKP4planet.getCuspAspect()[i]);

                sb.append(")");

            }

        }

        //PLANET ASPECT

        if (beanKP4planet.getPlanetAspect().size() > 0) {
            for (KeyValue4Step obj : beanKP4planet.getPlanetAspect()) {
                if (obj.getValues() != null) {

                	int key = obj.getKey();
                    sb.append(" ("+rbConstants.getString("ASPDASH")+"-" + rbConstants.getString(Common.arrLongPlanetName[obj.getKey()].toUpperCase()));
                    for (int i = 0; i < obj.getValues().length; i++)
                        sb.append(" " + obj.getValues()[i]);


                    if ((obj.getKey() == GlobalVariablesKPExtension.RAHU) || (obj.getKey() == GlobalVariablesKPExtension.KETU)) {
                        if (obj.gePlanetValuesInWhichRahuKetuPlaced() != null) {

                            sb.append(" " + rbConstants.getString(Common.arrLongPlanetName[obj.getPlanetInWhichRahuKetuPlaced()].toUpperCase()));
                            for (int i = 0; i < obj.gePlanetValuesInWhichRahuKetuPlaced().length; i++)
                                sb.append(" " + obj.gePlanetValuesInWhichRahuKetuPlaced()[i]);

                        }
                    }
                    sb.append(")");

                }
            }
        }
        if(sb.length() == 0)
        	sb.append("     ");
        return sb.toString();
	}
	
	/**
     * This function return the array of KP cuspal interlink based on cusp
     *
     * @param inKPPlanetsAndCuspObject
     * @return array of BeanKpCIL
     */
    public static BeanKpCIL[] getKPCILBeansArray(InPlanetKpCusp inKPPlanetsAndCuspObject) {
        double[] kpcups = inKPPlanetsAndCuspObject.getKpCuspArray();
        double[] kpplnts = inKPPlanetsAndCuspObject.getKpPlanetArray();
        BeanKpCIL[] bean = new BeanKpCIL[12];
        for (int i = 0; i < 12; i++) {
            bean[i] = new BeanKpCIL();
            //bean[i].setCusp(i);
        }

        CKpRefactorExtension kpr = new CKpRefactorExtension(kpplnts, kpcups);

        //CUSP 1
        bean[0].setCusp(GlobalVariablesKPExtension.CUSP1);
        bean[0].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP1));
        bean[0].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP1));
        bean[0].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP1));
        bean[0].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP1));

        //CUSP 2
        bean[1].setCusp(GlobalVariablesKPExtension.CUSP2);
        bean[1].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP2));
        bean[1].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP2));
        bean[1].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP2));
        bean[1].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP2));

        //CUSP 3
        bean[2].setCusp(GlobalVariablesKPExtension.CUSP3);
        bean[2].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP3));
        bean[2].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP3));
        bean[2].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP3));
        bean[2].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP3));

        //CUSP 4
        bean[3].setCusp(GlobalVariablesKPExtension.CUSP4);
        bean[3].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP4));
        bean[3].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP4));
        bean[3].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP4));
        bean[3].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP4));

        //CUSP 5
        bean[4].setCusp(GlobalVariablesKPExtension.CUSP5);
        bean[4].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP5));
        bean[4].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP5));
        bean[4].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP5));
        bean[4].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP5));

        //CUSP 6
        bean[5].setCusp(GlobalVariablesKPExtension.CUSP6);
        bean[5].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP6));
        bean[5].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP6));
        bean[5].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP6));
        bean[5].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP6));

        //CUSP 7
        bean[6].setCusp(GlobalVariablesKPExtension.CUSP7);
        bean[6].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP7));
        bean[6].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP7));
        bean[6].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP7));
        bean[6].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP7));

        //CUSP 8
        bean[7].setCusp(GlobalVariablesKPExtension.CUSP8);
        bean[7].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP8));
        bean[7].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP8));
        bean[7].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP8));
        bean[7].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP8));

        //CUSP 9
        bean[8].setCusp(GlobalVariablesKPExtension.CUSP9);
        bean[8].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP9));
        bean[8].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP9));
        bean[8].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP9));
        bean[8].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP9));

        //CUSP 10
        bean[9].setCusp(GlobalVariablesKPExtension.CUSP10);
        bean[9].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP10));
        bean[9].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP10));
        bean[9].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP10));
        bean[9].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP10));

        //CUSP 11
        bean[10].setCusp(GlobalVariablesKPExtension.CUSP11);
        bean[10].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP11));
        bean[10].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP11));
        bean[10].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP11));
        bean[10].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP11));

        //CUSP 12

        bean[11].setCusp(GlobalVariablesKPExtension.CUSP12);
        bean[11].setKpCILType1(kpr.getKP_CIL_Type1(GlobalVariablesKPExtension.CUSP12));
        bean[11].setKpCILType2(kpr.getKP_CIL_Type2(GlobalVariablesKPExtension.CUSP12));
        bean[11].setKpCILType3(kpr.getKP_CIL_Type3(GlobalVariablesKPExtension.CUSP12));
        bean[11].setKpCILType4(kpr.getKP_CIL_Type4(GlobalVariablesKPExtension.CUSP12));


        return bean;

    }
    
    /**
     * This function is used to return KCIL bean after array calculation
     *
     * @param inKPPlanetsAndCuspObject
     * @return array of BeanKpKCIL
     */
    public static BeanKpKhullarCIL[] getKCILBeansArray(InPlanetKpCusp inKPPlanetsAndCuspObject) {
        double[] kpcups = inKPPlanetsAndCuspObject.getKpCuspArray();
        double[] kpplnts = inKPPlanetsAndCuspObject.getKpPlanetArray();
        BeanKpKhullarCIL[] bean = new BeanKpKhullarCIL[9];
        for (int i = 0; i < 9; i++) {
            bean[i] = new BeanKpKhullarCIL();
            bean[i].setPlanet(i);
        }

        CKpRefactorExtension kpr = new CKpRefactorExtension(kpplnts, kpcups);
        //SUN
        bean[0].setPlanet(GlobalVariablesKPExtension.SUN);
        bean[0].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.SUN));
        bean[0].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.SUN));
        bean[0].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.SUN));
        bean[0].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.SUN));

        //MOON
        bean[1].setPlanet(GlobalVariablesKPExtension.MOON);
        bean[1].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.MOON));
        bean[1].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.MOON));
        bean[1].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.MOON));
        bean[1].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.MOON));

        //MARS
        bean[2].setPlanet(GlobalVariablesKPExtension.MARS);
        bean[2].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.MARS));
        bean[2].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.MARS));
        bean[2].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.MARS));
        bean[2].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.MARS));

        //MERCURY
        bean[3].setPlanet(GlobalVariablesKPExtension.MERCURY);
        bean[3].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.MERCURY));
        bean[3].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.MERCURY));
        bean[3].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.MERCURY));
        bean[3].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.MERCURY));

        //JUPITER
        bean[4].setPlanet(GlobalVariablesKPExtension.JUPITER);
        bean[4].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.JUPITER));
        bean[4].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.JUPITER));
        bean[4].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.JUPITER));
        bean[4].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.JUPITER));

        //VENUS
        bean[5].setPlanet(GlobalVariablesKPExtension.VENUS);
        bean[5].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.VENUS));
        bean[5].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.VENUS));
        bean[5].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.VENUS));
        bean[5].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.VENUS));

        //SAT
        bean[6].setPlanet(GlobalVariablesKPExtension.SAT);
        bean[6].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.SAT));
        bean[6].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.SAT));
        bean[6].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.SAT));
        bean[6].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.SAT));

        //RAHU
        bean[7].setPlanet(GlobalVariablesKPExtension.RAHU);
        bean[7].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.RAHU));
        bean[7].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.RAHU));
        bean[7].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.RAHU));
        bean[7].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.RAHU));

        //KETU
        bean[8].setPlanet(GlobalVariablesKPExtension.KETU);
        bean[8].setKCILType1(kpr.getKCILType1(GlobalVariablesKPExtension.KETU));
        bean[8].setKCILType2(kpr.getKCILType2(GlobalVariablesKPExtension.KETU));
        bean[8].setKCILType3(kpr.getKCILType3(GlobalVariablesKPExtension.KETU));
        bean[8].setKCILType4(kpr.getKCILType4(GlobalVariablesKPExtension.KETU));
        return bean;
    }
    
    public static BeanNakshtraNadi[] getNakshtraNadi(InPlanetKpCusp plntAndCusp) {
        BeanNakshtraNadi[] nadis = new BeanNakshtraNadi[9];
        for (int i = 0; i < 9; i++) {
            nadis[i] = new BeanNakshtraNadi();
        }
        double[] kpcups = plntAndCusp.getKpCuspArray();
        double[] kpplnts = plntAndCusp.getKpPlanetArray();


        CKpRefactorExtension kpr = new CKpRefactorExtension(kpplnts, kpcups);
        nadis[0].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.SUN, kpr.getPlanetNadi(GlobalVariablesKPExtension.SUN)));
        nadis[0].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.SUN]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.SUN)));
        nadis[0].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.SUN]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.SUN)));


        nadis[1].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.MOON, kpr.getPlanetNadi(GlobalVariablesKPExtension.MOON)));
        nadis[1].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.MOON]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.MOON)));
        nadis[1].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.MOON]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.MOON)));

        nadis[2].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.MARS, kpr.getPlanetNadi(GlobalVariablesKPExtension.MARS)));
        nadis[2].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.MARS]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.MARS)));
        nadis[2].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.MARS]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.MARS)));

        nadis[3].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.MERCURY, kpr.getPlanetNadi(GlobalVariablesKPExtension.MERCURY)));
        nadis[3].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.MERCURY]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.MERCURY)));
        nadis[3].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.MERCURY]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.MERCURY)));

        nadis[4].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.JUPITER, kpr.getPlanetNadi(GlobalVariablesKPExtension.JUPITER)));
        nadis[4].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.JUPITER]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.JUPITER)));
        nadis[4].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.JUPITER]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.JUPITER)));

        nadis[5].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.VENUS, kpr.getPlanetNadi(GlobalVariablesKPExtension.VENUS)));
        nadis[5].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.VENUS]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.VENUS)));
        nadis[5].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.VENUS]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.VENUS)));

        nadis[6].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.SAT, kpr.getPlanetNadi(GlobalVariablesKPExtension.SAT)));
        nadis[6].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.SAT]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.SAT)));
        nadis[6].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.SAT]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.SAT)));

        nadis[7].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.RAHU, kpr.getPlanetNadi(GlobalVariablesKPExtension.RAHU)));
        nadis[7].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.RAHU]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.RAHU)));
        nadis[7].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.RAHU]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.RAHU)));

        nadis[8].setPlanetNakstraNadi(new NadiValues(GlobalVariablesKPExtension.KETU, kpr.getPlanetNadi(GlobalVariablesKPExtension.KETU)));
        nadis[8].setPlanetStarLordNadi(new NadiValues(kpr.getStarLord(kpplnts[GlobalVariablesKPExtension.KETU]), kpr.getPlanetStarLordNadi(GlobalVariablesKPExtension.KETU)));
        nadis[8].setPlanetSubLordNadi(new NadiValues(kpr.getSubLord(kpplnts[GlobalVariablesKPExtension.KETU]), kpr.getPlanetSubLordNadi(GlobalVariablesKPExtension.KETU)));


        return nadis;
    }
    
    public static BeanKpPlanetSigWithStrength[] getPlanetSignWithStrengthBeansArray(
            InPlanetKpCusp plntAndCusp) {

        double[] kpcups = plntAndCusp.getKpCuspArray();
        double[] kpplnts = plntAndCusp.getKpPlanetArray();
        int[] plntStrength = null;
        BeanKpPlanetSigWithStrength bean[] = new BeanKpPlanetSigWithStrength[9];

        for (int i = 0; i < bean.length; i++)

            bean[i] = new BeanKpPlanetSigWithStrength();

        CKpRefactorExtension kpr = new CKpRefactorExtension(kpplnts, kpcups);
        plntStrength = kpr.getPlanetStrength();

        bean[0].setPlanet(GlobalVariablesKPExtension.SUN);
        bean[0].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.SUN));
        bean[0].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.SUN]));
        bean[0].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.SUN]));
        bean[0].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.SUN));
        bean[0].setPlanetStrength(plntStrength[0]);

        bean[1].setPlanet(GlobalVariablesKPExtension.MOON);
        bean[1].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.MOON));
        bean[1].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.MOON]));
        bean[1].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.MOON]));
        bean[1].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.MOON));
        bean[1].setPlanetStrength(plntStrength[1]);

        bean[2].setPlanet(GlobalVariablesKPExtension.MARS);
        bean[2].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.MARS));
        bean[2].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.MARS]));
        bean[2].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.MARS]));
        bean[2].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.MARS));
        bean[2].setPlanetStrength(plntStrength[2]);

        bean[3].setPlanet(GlobalVariablesKPExtension.MERCURY);
        bean[3].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.MERCURY));
        bean[3].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.MERCURY]));
        bean[3].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.MERCURY]));
        bean[3].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.MERCURY));
        bean[3].setPlanetStrength(plntStrength[3]);

        bean[4].setPlanet(GlobalVariablesKPExtension.JUPITER);
        bean[4].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.JUPITER));
        bean[4].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.JUPITER]));
        bean[4].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.JUPITER]));
        bean[4].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.JUPITER));
        bean[4].setPlanetStrength(plntStrength[4]);

        bean[5].setPlanet(GlobalVariablesKPExtension.VENUS);
        bean[5].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.VENUS));
        bean[5].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.VENUS]));
        bean[5].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.VENUS]));
        bean[5].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.VENUS));
        bean[5].setPlanetStrength(plntStrength[5]);

        bean[6].setPlanet(GlobalVariablesKPExtension.SAT);
        bean[6].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.SAT));
        bean[6].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.SAT]));
        bean[6].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.SAT]));
        bean[6].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.SAT));
        bean[6].setPlanetStrength(plntStrength[6]);

        bean[7].setPlanet(GlobalVariablesKPExtension.RAHU);
        bean[7].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.RAHU));
        bean[7].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.RAHU]));
        bean[7].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.RAHU]));
        bean[7].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.RAHU));
        bean[7].setPlanetStrength(plntStrength[7]);

        bean[8].setPlanet(GlobalVariablesKPExtension.KETU);
        bean[8].setLevel1(kpr
                .getPlanetSignificationLevel1(GlobalVariablesKPExtension.KETU));
        bean[8].setLevel2(kpr
                .getPlanetSignificationLevel2(kpplnts[GlobalVariablesKPExtension.KETU]));
        bean[8].setLevel3(kpr
                .getPlanetSignificationLevel3(kpplnts[GlobalVariablesKPExtension.KETU]));
        bean[8].setLevel4(kpr
                .getPlanetSignificationLevel4(GlobalVariablesKPExtension.KETU));
        bean[8].setPlanetStrength(plntStrength[8]);

        return bean;
    }
    
    public static String getFormattedLevelValues(int[] levelValues, boolean removeDups) {
        String value = "";

        if (levelValues != null) {
        	if(removeDups)
        		levelValues = removeUpdatedDuplicates(levelValues);
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < levelValues.length; i++)
                if (levelValues[i] > 0) {
                    if (i > 0)
                        sb.append("," + String.valueOf(levelValues[i]));
                    else
                        sb.append(String.valueOf(levelValues[i]));
                }
            value = sb.toString();


        }
        return value;

    }

    public static int[] removeUpdatedDuplicates(int[] array) {

        if (array == null)
            return null;
        Arrays.sort(array);
        boolean hasDuplicate = false;
        ArrayList<Integer> list = new ArrayList<Integer>();

        for (int i = 0; i < array.length; i++) {
            hasDuplicate = false;
            for (int j = i + 1; j < array.length; j++)
                if (array[i] == array[j])
                    hasDuplicate = true;

            if (!hasDuplicate)
                list.add(array[i]);

        }

        int[] p = new int[list.size()];
        for (int k = 0; k < list.size(); k++)
            p[k] = list.get(k);

        return p;
    }
}
