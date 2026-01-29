<%@page import="java.util.HashMap"%>
<%@page import="com.cslsoftware.matchmaking.MatchMaking"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.util.PoruthamMatchingFunctions"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.MatchMakingDAO"%>
<%@page contentType="text/html; charset=UTF-8"%>

    <title>Kundli Free Software Online | Janam Kundali</title>
    <meta name="description" content="Free detailed Hindi Kundli and Hindi Predictions by AstroSage.com. Free instant Hindi Kundli, janam kundli predictions in Hindi, free Hindi kundli software, free Hindi kundli matching, varshphal, prashna kundli, KP kundli, Lal Kitab kundli and more." />
    <meta name="keywords" content="hindi kundli, hindi kundlai, free hindi kundali software Online, hindi kundali matching, janam Kundali in hindi, prashna kundali in hindi, hindi kundali horoscope match, hindi janampatrika, hindi kundli, hindi janampatri, hindi janamkundli, kp astrology, lal kitab remedies,  kundli, vedic astrology, indian astrology, hindu astrology, rashi, vedic moon Sign, nakshatra, birth star, lagna, ascendant, horoscope, vedic horoscope, horoscope matching, mangal dosh, nadi dosh, bhakoot dosh, sani sadesati remedies, free horoscopes, jyotish, panchang" />
    <link rel='stylesheet' type='text/css' href='/styles.css' />
    <link rel="Stylesheet" type="text/css" href='css/style.css' />
    <script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
    <script type="text/javascript" src="/cloud/js/canvas.js"></script>
    <script type="text/javascript" src="/cloud/js/constents.js"></script>
    <script type="text/javascript">
        function submitform() {
            //alert('MOHIT');
            document.forms['frm'].submit();
        }
    </script>

<%
   int langCodePorMM = Util.safeInt(request.getParameter("languagecode"));
Local mmLocal = new Local();
MyProperties baseConstants = new MyProperties(mmLocal.loadPropertiesFile("constants", 0));
MyResourceBundle matchMakingOutputConstants = (MyResourceBundle) mmLocal.loadPropertiesFileNew("matchmakingoutput", langCodePorMM);
MyResourceBundle birthDetailsMMConstants = (MyResourceBundle) mmLocal.loadPropertiesFileNew("birthdetails-matchmakingoutput", langCodePorMM);
MyResourceBundle extraPagesConstants = (MyResourceBundle) mmLocal.loadPropertiesFileNew("extrapages", langCodePorMM);
    
%>


    
    <div class="ui-container ui-margin-tb">
        <div id="roundtopheadid">
            <div class="roundtophead">
                <div>
                    <div class="AscTopHead" style="text-align: left;">
                        <a href="/" title="Home" class="BreadCrumb">Home</a> &#187; <a href="/free/" title="Free reports of astrology"
                            class="BreadCrumb">Free Reports</a> &#187; <a href="#" class="BreadCrumb">10 poruthams(kootas)</a>
                    </div>
                </div>
            </div>
        </div>
        <%
        String name1 = Util.safestr(request.getParameter("name1"));
        String name2 = Util.safestr(request.getParameter("name2"));
        String sex1 = Util.safestr(request.getParameter("sex1"));
        String sex2 = Util.safestr(request.getParameter("sex2"));
        String day1 = Util.safeStringInt(request.getParameter("day1"));
        String day2 = Util.safeStringInt(request.getParameter("day2"));
        String month1 = Util.safeStringInt(request.getParameter("month1"));
        String month2 = Util.safeStringInt(request.getParameter("month2"));
        String year1 = Util.safeStringInt(request.getParameter("year1"));
        String year2 = Util.safeStringInt(request.getParameter("year2"));
        int hrs1 = Util.safeInt(request.getParameter("hrs1"));
        int hrs2 = Util.safeInt(request.getParameter("hrs2"));
        int min1 = Util.safeInt(request.getParameter("min1"));
        int min2 = Util.safeInt(request.getParameter("min2"));
        int sec1 = Util.safeInt(request.getParameter("sec1"));
        int sec2 = Util.safeInt(request.getParameter("sec2"));
        String place1 = Util.safestr(request.getParameter("place1"));
        String place2 = Util.safestr(request.getParameter("place2"));
		int longdeg1 = Util.safeInt(request.getParameter("longdeg1"));
		int longdeg2 = Util.safeInt(request.getParameter("longdeg2"));
		int longmin1 = Util.safeInt(request.getParameter("longmin1"));
		int longmin2 = Util.safeInt(request.getParameter("longmin2"));
		String longew1 = Util.safestr(request.getParameter("longew1"));
		String longew2 = Util.safestr(request.getParameter("longew2"));
		int latdeg1 = Util.safeInt(request.getParameter("latdeg1"));
		int latdeg2 = Util.safeInt(request.getParameter("latdeg2"));
		int latmin1 = Util.safeInt(request.getParameter("latmin1"));
		int latmin2 = Util.safeInt(request.getParameter("latmin2"));
		String latns1 = Util.safestr(request.getParameter("latns1"));
		String latns2 = Util.safestr(request.getParameter("latns2"));
		String dst1 = Util.safeStringInt(request.getParameter("dst1"));
		String dst2 = Util.safeStringInt(request.getParameter("dst2"));
		float timezone1 = Util.safeFloat(request.getParameter("timezone1"));
		float timezone2 = Util.safeFloat(request.getParameter("timezone2"));
		
		if(latns1.equals("1") || latns2.toLowerCase().equals("n"))
			latns1 = "N";
		else
			latns1 = "S";
		if(longew1.equals("1") || longew1.toLowerCase().equals("e"))
			longew1 = "E";
		else
			longew1 = "W";
		if(latns2.equals("1") || latns2.toLowerCase().equals("n"))
			latns2 = "N";
		else
			latns2 = "S";
		if(longew2.equals("1") || longew2.toLowerCase().equals("e"))
			longew2 = "E";
		else
			longew2 = "W";

	/*Dim degOfBoy, degOfGirl
    Dim RasiDescriptionArray,RasiAdhipathiDescriptionArray,VasiyaDescriptionArray,MahendraDescriptionArray,GanaDescriptionArray,YoniDescriptionArray
    Dim DhinaDescriptionArray,SthreeDheerkamDescriptionArray,RajjuDescriptionArray,VedhaiDescriptionArray*/
       
//'************************************'Validation for the Boy**************************************
    
    //Validatebirthdetails "boy", safestr(request("name1")), day1, month1, year1, hrs1, min1, sec1, place1, longdeg1, longmin1, longEW1, latdeg1, latmin1, latNS1, timezone1, dst1


//'************************************'Validation for the Girl**************************************

    //Validatebirthdetails "girl", safestr(request("name2")), day2, month2, year2, hrs2, min2, sec2, place2, longdeg2, longmin2, longEW2, latdeg2, latmin2, latNS2, timezone2, dst2

    //'SETTER FOR MALE DETAILS
    //Dim objHoroMale, ObjConst, arrPlanetsShodashvargaMale
    //'Set objHoroMale = Server.Createobject("HoroDesktop.EngHoro")
    DesktopHoro objHoroMale = new DesktopHoro();
    Constants ObjConst = new Constants();
    ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
    objHoroMale.setName(name1);
    
    objHoroMale.setPlace(place1);
    objHoroMale.setMaleFemale("M");
	objHoroMale.setSecondOfBirth(Util.safeStringInt(sec1));
	objHoroMale.setMinuteOfBirth(Util.safeStringInt(min1));
	objHoroMale.setHourOfBirth(Util.safeStringInt(hrs1));
	objHoroMale.setDayOfBirth(Util.safeStringInt(day1));
	objHoroMale.setMonthOfBirth(Util.safeStringInt(month1));
	objHoroMale.setYearOfBirth(Util.safeStringInt(year1));
	objHoroMale.setDegreeOfLattitude(Util.safeStringInt(latdeg1));
	objHoroMale.setDegreeOfLongitude(Util.safeStringInt(longdeg1));
	objHoroMale.setSecondOfLattitude("00");
	objHoroMale.setSecondOfLongitude("00");
	objHoroMale.setMinuteOfLongitude(Util.safeStringInt(longmin1));
	objHoroMale.setMinuteOfLattitude(Util.safeStringInt(latmin1));
	objHoroMale.setEastWest(longew1);
	objHoroMale.setNorthSouth(latns1);
	objHoroMale.setDST(Util.safeStringInt(dst1));
	/*if(mmoutLang == 1)
	{
		objHoroMale.setLanguageCode(mmoutLang+"");  
	}
	else
	{
		objHoroMale.setLanguageCode("0");
	}*/
	
	objHoroMale.initialize();
    String MaleDashaOutput = objHoroMale.getVimsottariDasaTwoLevel().toString();
	int[] arrPlanetsShodashvargaMale = objHoroMale.getPositionForShodasvarg(0);

	DesktopHoro objHoroFemale = new DesktopHoro();
    
	objHoroFemale.setName(name2);
	objHoroFemale.setPlace(place2);
	objHoroFemale.setMaleFemale("F");
	objHoroFemale.setSecondOfBirth(Util.safeStringInt(sec2));
	objHoroFemale.setMinuteOfBirth(Util.safeStringInt(min2));
	objHoroFemale.setHourOfBirth(Util.safeStringInt(hrs2));
	objHoroFemale.setDayOfBirth(Util.safeStringInt(day2));
	objHoroFemale.setMonthOfBirth(Util.safeStringInt(month2));
	objHoroFemale.setYearOfBirth(Util.safeStringInt(year2));
	objHoroFemale.setDegreeOfLattitude(Util.safeStringInt(latdeg2));
	objHoroFemale.setDegreeOfLongitude(Util.safeStringInt(longdeg2));
	objHoroFemale.setSecondOfLattitude("00");
	objHoroFemale.setSecondOfLongitude("00");
	objHoroFemale.setMinuteOfLongitude(Util.safeStringInt(longmin2));
	objHoroFemale.setMinuteOfLattitude(Util.safeStringInt(latmin2));
	objHoroFemale.setEastWest(longew2);
	objHoroFemale.setNorthSouth(latns2);
	objHoroFemale.setDST(Util.safeStringInt(dst2));
	/*if(mmoutLang == 1)
	{
		objHoroFeMale.setLanguageCode(mmoutLang+"");  
	}
	else
	{
		objHoroFeMale.setLanguageCode("0");
	}*/
	objHoroFemale.initialize();
    int[] arrPlanetsShodashvargaFeMale = objHoroFemale.getPositionForShodasvarg(0);
	String FeMaleDashaOutput = objHoroFemale.getVimsottariDasaTwoLevel().toString();
    
//-------------------------------------------------------------------------------------
    String[] RasiDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("RasiDescription"));
    String[] RasiAdhipathiDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("RasiAdhipathiDescription"));
    String[] VasiyaDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("VasiyaDescription"));
    String[] MahendraDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("MahendraDescription"));
    String[] GanaDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("GanaDescription"));
    String[] YoniDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("YoniDescription"));
    String[] DhinaDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("DhinaDescription"));
    String[] SthreeDheerkamDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("SthreeDheerkamDescription"));
    String[] RajjuDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("RajjuDescription"));
    String[] VedhaiDescriptionArray = mmLocal.getStringArray(extraPagesConstants.getString("VedhaiDescription"));
    
    
    //CODE OF FUNCTION TO GET MATCHMAKING INTERPRETATION
    
    //CODE TO SET THE INTERPRETATION OF THE MATCHMAKING
    //**************************************************
    /*Dim matchmaking
    Dim intForBoy, intForGirl
    Dim maleRasiNumber, femaleRasiNumber
    Dim arrNodeValue(10), arrNodeName(10), arrInterpretation(7), arrGuna(10)
    Dim arrTara, totalGuna, tamilgunCount*/

    double totalGuna = 0;
    int tamilgunCount = 0;

    
    MatchMaking matchmaking = new MatchMaking();
    matchmaking.setLanguageCode ("0");
    matchmaking.initializesArrayValues();

    int maleRasiNumber = objHoroMale.getRasi();
    double degOfBoy = objHoroMale.getMoon();

    int femaleRasiNumber = objHoroFemale.getRasi();
    double degOfGirl = objHoroFemale.getMoon();
    
    int boyNakshtraNumber = objHoroMale.getNakshatra();
    int girlNakshtraNumber = objHoroFemale.getNakshatra();
        
    String[] arrNodeName = new String[10];
    arrNodeName[0]  = extraPagesConstants.getString("RASI_PORUTHAM");
    arrNodeName[1]  = extraPagesConstants.getString("RASYADHIPATHI_PORUTHAM");
    arrNodeName[2]  = extraPagesConstants.getString("VASYA_PORUTHAM");
    arrNodeName[3]  = extraPagesConstants.getString("MAHENDRA_PORUTHAM");
    arrNodeName[4]  = extraPagesConstants.getString("GANA_PORUTHAM");
    arrNodeName[5]  = extraPagesConstants.getString("YONI_PORUTHAM");
    arrNodeName[6]  = extraPagesConstants.getString("DINA_PORUTHAM");
    arrNodeName[7]  = extraPagesConstants.getString("STREE_DEERGHA_PORUTHAM");
    arrNodeName[8]  = extraPagesConstants.getString("RAJJU_DOSHA");
    arrNodeName[9]  = extraPagesConstants.getString("VEDHA_DOSHA");
    
    PoruthamMatchingFunctions porMatFn = new PoruthamMatchingFunctions();
    String[] arrNodeValue = new String[10];
    double[] arrGuna = new double[10];
    double rasiMatchVal = porMatFn.getRasiMatchResultValue(maleRasiNumber, femaleRasiNumber);
    if(rasiMatchVal == 1)
    {
        arrNodeValue[0] = "GOOD";
        arrGuna[0] = 1;
    } 
    else if (rasiMatchVal == 0.5)
    {
        arrNodeValue[0] = "BAD";
        arrGuna[0] = 0;
    }
    else
    {
        arrNodeValue[0] = "MEDIUM";
        arrGuna[0] = 0.5;
    }
    double rasiAdhipathiMatchVal = porMatFn.getRasiAdhipathiMatchResultValue(maleRasiNumber, femaleRasiNumber);
    if(rasiAdhipathiMatchVal == 1)
    {
        arrNodeValue[1] = "GOOD";
        arrGuna[1] = 1;
    } 
    else if (rasiAdhipathiMatchVal == 0.5)
    {
        arrNodeValue[1] = "BAD";
        arrGuna[1] = 0;
    }
    else
    {
        arrNodeValue[1] = "MEDIUM";
        arrGuna[1] = 0.5;
    }
    double vasiyaMatchVal = porMatFn.getVasiyaMatchResultValue(maleRasiNumber, femaleRasiNumber);
    if(vasiyaMatchVal == 1)
    {
        arrNodeValue[2] = "GOOD";
        arrGuna[2] = 1;
    } 
    else if (vasiyaMatchVal == 0.5)
    {
        arrNodeValue[2] = "BAD";
        arrGuna[2] = 0;
    }
    else
    {
        arrNodeValue[2] = "MEDIUM";
        arrGuna[2] = 0.5;
    }
    double mahendraMatchVal = porMatFn.getMahendraMatchResultValue(boyNakshtraNumber, girlNakshtraNumber);
    if(mahendraMatchVal == 1)
    {
        arrNodeValue[3] = "GOOD";
        arrGuna[3] = 1;
    } 
    else if (mahendraMatchVal == 0.5)
    {
        arrNodeValue[3] = "BAD";
        arrGuna[3] = 0;
    }
    else
    {
        arrNodeValue[3] = "MEDIUM";
        arrGuna[3] = 0.5;
    }
    double ganaMatchVal = porMatFn.getGanaMatchResultValue(boyNakshtraNumber, girlNakshtraNumber);
    if(ganaMatchVal == 1)
    {
        arrNodeValue[4] = "GOOD";
        arrGuna[4] = 1;
    } 
    else if (ganaMatchVal == 0.5)
    {
        arrNodeValue[4] = "BAD";
        arrGuna[4] = 0;
    }
    else
    {
        arrNodeValue[4] = "MEDIUM";
        arrGuna[4] = 0.5;
    }
    double yoniMatchVal = porMatFn.getYoniMatchResultValue(boyNakshtraNumber, girlNakshtraNumber);
    if(yoniMatchVal == 1)
    {
        arrNodeValue[5] = "GOOD";
        arrGuna[5] = 1;
    } 
    else if (yoniMatchVal == 0.5)
    {
        arrNodeValue[5] = "BAD";
        arrGuna[5] = 0;
    }
    else
    {
        arrNodeValue[5] = "MEDIUM";
        arrGuna[5] = 0.5;
    }
    double dhinaMatchVal = porMatFn.getDhinaMatchResultValue(maleRasiNumber, femaleRasiNumber,boyNakshtraNumber, girlNakshtraNumber, objHoroMale.getPadaOfPlanet(2), objHoroFemale.getPadaOfPlanet(2));
    if(dhinaMatchVal == 1)
    {
        arrNodeValue[6] = "GOOD";
        arrGuna[6] = 1;
    } 
    else if (dhinaMatchVal == 0.5)
    {
        arrNodeValue[6] = "BAD";
        arrGuna[6] = 0;
    }
    else
    {
        arrNodeValue[6] = "MEDIUM";
        arrGuna[6] = 0.5;
    }
    double sthreeMatchVal = porMatFn.getSthreeDheerkamMatchResultValue(boyNakshtraNumber, girlNakshtraNumber);
    if(sthreeMatchVal == 1)
    {
        arrNodeValue[7] = "GOOD";
        arrGuna[7] = 1;
    } 
    else if (sthreeMatchVal == 0.5)
    {
        arrNodeValue[7] = "BAD";
        arrGuna[7] = 0;
    }
    else
    {
        arrNodeValue[7] = "MEDIUM";
        arrGuna[7] = 0.5;
    }
    double rajjuMatchVal = porMatFn.getRajjuMatchResultValue(boyNakshtraNumber, girlNakshtraNumber);
    if(rajjuMatchVal == 1)
    {
        arrNodeValue[8] = "GOOD";
        arrGuna[8] = 1;
    } 
    else if (rajjuMatchVal == 0.5)
    {
        arrNodeValue[8] = "BAD";
        arrGuna[8] = 0;
    }
    else
    {
        arrNodeValue[8] = "MEDIUM";
        arrGuna[8] = 0.5;
    }
    double vedhaiMatchVal = porMatFn.getVedhaiMatchResultValue(boyNakshtraNumber, girlNakshtraNumber);
    if(vedhaiMatchVal == 1)
    {
        arrNodeValue[9] = "GOOD";
        arrGuna[9] = 1;
    } 
    else if (vedhaiMatchVal == 0.5)
    {
        arrNodeValue[9] = "BAD";
        arrGuna[9] = 0;
    }
    else
    {
        arrNodeValue[9] = "MEDIUM";
        arrGuna[9] = 0.5;
    }
       
    String[] arrTara = matchmaking.getTara(degOfBoy, degOfGirl);
    
    String[] myArray1 = new String[10];
    String[] myArray2 = new String[10];
    int[] descriptioncodearray = new int[10];
    String[] descriptionarray = new String[10];
    
    myArray1[0] = Util.getValuesFromDictionary(porMatFn.getRasiName(maleRasiNumber),langCodePorMM);
    
    myArray1[1] = Util.getValuesFromDictionary(porMatFn.getRasiAdhipathiName(maleRasiNumber),langCodePorMM);
    myArray1[2] = Util.getValuesFromDictionary(porMatFn.getVasiyaName(maleRasiNumber),langCodePorMM);
    myArray1[3] = Util.getValuesFromDictionary(porMatFn.getMahendraName(boyNakshtraNumber),langCodePorMM);
    myArray1[4] = Util.getValuesFromDictionary(porMatFn.getGanaName(boyNakshtraNumber),langCodePorMM);
    myArray1[5] = Util.getValuesFromDictionary(porMatFn.getYoniName(boyNakshtraNumber),langCodePorMM);
    myArray1[6] = Util.getValuesFromDictionary(porMatFn.getDhinaName(boyNakshtraNumber),langCodePorMM);
    myArray1[7] = Util.getValuesFromDictionary(porMatFn.getSthreeDheerkamName(boyNakshtraNumber),langCodePorMM);
    myArray1[8] = extraPagesConstants.getString(porMatFn.getRajjuName(boyNakshtraNumber));
    myArray1[9] = Util.getValuesFromDictionary(porMatFn.getVedhaiName(boyNakshtraNumber),langCodePorMM);
    
    myArray2[0] = Util.getValuesFromDictionary(porMatFn.getRasiName(femaleRasiNumber),langCodePorMM);
    myArray2[1] = Util.getValuesFromDictionary(porMatFn.getRasiAdhipathiName(femaleRasiNumber),langCodePorMM);
    myArray2[2] = Util.getValuesFromDictionary(porMatFn.getVasiyaName(femaleRasiNumber),langCodePorMM);
    myArray2[3] = Util.getValuesFromDictionary(porMatFn.getMahendraName(girlNakshtraNumber),langCodePorMM);
    myArray2[4] = Util.getValuesFromDictionary(porMatFn.getGanaName(girlNakshtraNumber),langCodePorMM);
    myArray2[5] = Util.getValuesFromDictionary(porMatFn.getYoniName(girlNakshtraNumber),langCodePorMM);
    myArray2[6] = Util.getValuesFromDictionary(porMatFn.getDhinaName(girlNakshtraNumber),langCodePorMM);
    myArray2[7] = Util.getValuesFromDictionary(porMatFn.getSthreeDheerkamName(girlNakshtraNumber),langCodePorMM);
    myArray2[8] = extraPagesConstants.getString(porMatFn.getRajjuName(girlNakshtraNumber));
    myArray2[9] = Util.getValuesFromDictionary(porMatFn.getVedhaiName(girlNakshtraNumber),langCodePorMM);
    
    descriptioncodearray[0] = porMatFn.getRasiPoruthamDescription(maleRasiNumber,femaleRasiNumber);
    descriptioncodearray[1] = porMatFn.getRasiAdhipathiPoruthamDescription(maleRasiNumber,femaleRasiNumber);
    descriptioncodearray[2] = porMatFn.getVasiyaPoruthamDescription(maleRasiNumber,femaleRasiNumber);
    descriptioncodearray[3] = porMatFn.getMahendraDescription(boyNakshtraNumber,girlNakshtraNumber);
    descriptioncodearray[4] = porMatFn.getGanaPoruthamDescription(boyNakshtraNumber,girlNakshtraNumber);
    descriptioncodearray[5] = porMatFn.getYoniPoruthamDescription(boyNakshtraNumber,girlNakshtraNumber);
    descriptioncodearray[6] = porMatFn.getDhinaPoruthamDescription(maleRasiNumber, femaleRasiNumber, boyNakshtraNumber, girlNakshtraNumber, objHoroMale.getPadaOfPlanet(2), objHoroFemale.getPadaOfPlanet(2));
    descriptioncodearray[7] = porMatFn.getSthreeDheerkamDescription(boyNakshtraNumber,girlNakshtraNumber);
    descriptioncodearray[8] = porMatFn.getRajjuDescription(boyNakshtraNumber,girlNakshtraNumber);
    descriptioncodearray[9] = porMatFn.getVedhaiDescription(boyNakshtraNumber,girlNakshtraNumber);
        
    
    descriptionarray[0] = RasiDescriptionArray[descriptioncodearray[0]];
    descriptionarray[1] = RasiAdhipathiDescriptionArray[descriptioncodearray[1]];
    descriptionarray[2] = VasiyaDescriptionArray[descriptioncodearray[2]];
    descriptionarray[3] = MahendraDescriptionArray[descriptioncodearray[3]];
    descriptionarray[4] = GanaDescriptionArray[descriptioncodearray[4]];
    descriptionarray[5] = YoniDescriptionArray[descriptioncodearray[5]];
    descriptionarray[6] = DhinaDescriptionArray[descriptioncodearray[6]];
    descriptionarray[7] = SthreeDheerkamDescriptionArray[descriptioncodearray[7]];
    descriptionarray[8] = RajjuDescriptionArray[descriptioncodearray[8]];
    descriptionarray[9] = VedhaiDescriptionArray[descriptioncodearray[9]];
    

//-------------------------------------------------------------------------------------
for(int i=0;i<= 9;i++)
    totalGuna = totalGuna + arrGuna[i];


String[] GunmilanTableHeading = new String[4];

GunmilanTableHeading[0] = extraPagesConstants.getString("PORUTHAM");
GunmilanTableHeading[1] = extraPagesConstants.getString("BOY");
GunmilanTableHeading[2] = extraPagesConstants.getString("GIRL");
GunmilanTableHeading[3] = extraPagesConstants.getString("RESULT");

        %>
        <div class="pull-left">
            <h1 align="center">
                <%=extraPagesConstants.getString("HOROSCOPE_COMPATIBILITY") %><%=extraPagesConstants.getString("BETA")%></h1>
        </div>
       
        <div class="ui-clear">
        </div>
        <div id="RoundCornerBorder">
            <div class="ui-sub-heading ui-no-border-b">
                <h2>
                    <%=extraPagesConstants.getString("TEN_PORUTHAM") %></h2>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <% for(int HeadingRow1 = 0;HeadingRow1<=3;HeadingRow1++) { %>
                            <th>
                                <%=GunmilanTableHeading[HeadingRow1] %>
                            </th>
                            <% } %>
                        </tr>
                    </thead>
                    <% for(int ContentRow = 0;ContentRow<=9;ContentRow++) { %>
                    <tr>
                        <td>
                            <%=arrNodeName[ContentRow] %>
                        </td>
                        <td>
                            <%=FormatString(myArray1[ContentRow], langCodePorMM) %>
                        </td>
                        <td>
                            <%=FormatString(myArray2[ContentRow], langCodePorMM) %>
                        </td>
                        <td class="tdtext hoverme">
                            <a class="tooltip<%=ContentRow %>"><u>
                                <%=extraPagesConstants.getString(arrNodeValue[ContentRow])%></u><span class="ui-tooltip">
                                   <%=descriptionarray[ContentRow] %></span> </a>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <%
            boolean DasakootCheck = false;
            boolean DasaSandhiCheck = false;
            
            int kujapapsamyadosh = 0;
            int Finalresult = 0;
            String TamilStr = "";
            String poruthamresult = "";
            if(totalGuna > 6.5)
            {
                TamilStr = extraPagesConstants.getString("VERY_GOOD");
                poruthamresult = "SATISFACTORY";
                Finalresult = Finalresult + 1;
                DasakootCheck = true;
            } 
            else if(totalGuna > 5.5 && totalGuna <= 6.5)
            {
            
                TamilStr = extraPagesConstants.getString("Good");
                poruthamresult = "SATISFACTORY";
                Finalresult = Finalresult + 1;
                DasakootCheck = true;
            }
            else if(totalGuna > 5.5 && totalGuna <= 6.5)
            {
                TamilStr = extraPagesConstants.getString("MEDIUM");
                poruthamresult = "SATISFACTORY";
                Finalresult = Finalresult + 1;
                DasakootCheck = true;
            } 
            else 
            {
                TamilStr = extraPagesConstants.getString("BAD");
                poruthamresult = "NOT_SATISFACTORY";
            } 
              
                    %>
                    <tr>
                        <td>
                            <b>
                                <%=baseConstants.getString("RESULT") %>:</b>
                            <%=totalGuna + " / 10 "+extraPagesConstants.getString("PORUTHAM") %><br />
                            <b>
                                <%=extraPagesConstants.getString("THIS_IS")%>
                                <%=TamilStr %>&nbsp;<%=extraPagesConstants.getString("TEN_PORUTHAM_MATCH") %><%=extraPagesConstants.getString("HAI") %></b>
                            <br />
                            <br />
                            <b>
                                <%=extraPagesConstants.getString("NOTE") %>:</b><br />
                            <%=extraPagesConstants.getString("VERY_GOOD") %>
                            -
                            <%=extraPagesConstants.getString("VERY_GOOD_RESULT") %><br />
                            <%=extraPagesConstants.getString("GOOD") %>
                            -
                            <%=extraPagesConstants.getString("GOOD_RESULT") %><br />
                            <%=extraPagesConstants.getString("MEDIUM") %>
                            -
                            <%=extraPagesConstants.getString("MEDIUM_RESULT") %><br />
                            <%=extraPagesConstants.getString("BAD") %>
                            -
                            <%=extraPagesConstants.getString("BAD_RESULT") %><br />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <tr>
                        <td>
                            <center>
                                <b>
                                    <%=extraPagesConstants.getString("BOY_STAR") %></b>:
                                <%=Util.getValuesFromDictionary(String.valueOf(arrTara[0]), langCodePorMM) %></center>
                        </td>
                        <td>
                            <center>
                                <b>
                                    <%=extraPagesConstants.getString("GIRL_STAR") %></b>:
                                <%=Util.getValuesFromDictionary(String.valueOf(arrTara[1]), langCodePorMM) %></center>
                        </td>
                    </tr>
                </table>
                   <%@include file='/cloud/js/draw-chart-match-js.jsp'%>
                  
                <%
                /* Call GirlInformation
                 Call BoyInformation */
                HashMap<String, String> boyInfo = insideInfoinSouthIndian(langCodePorMM, objHoroMale);
                HashMap<String, String> girlInfo = insideInfoinSouthIndian(langCodePorMM, objHoroFemale);
                 %>
                <center>
                 
 
<div id="chart" style="padding-top:5px;"></div>

 <div align="center">
<canvas id=CanvaslagnaGirl width="380px" height="380px" class="ui-canvas"></canvas>
<script language="JavaScript" type="text/javascript">

var LanguageCode = <%=langCodePorMM%>;
var textcolor = "#800000";//COLOR_INFO;

<%
String mySyn1 = "";
for(int i = 0;i<=11;i++)
{
    mySyn1 = mySyn1 + arrPlanetsShodashvargaFeMale[i] + "," ;
}
mySyn1 = mySyn1 + arrPlanetsShodashvargaFeMale[12] ;
out.println("  arrPlanetsShodashvargaFeMale = new Array(" + mySyn1 + ");");

%>
if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvaslagnaGirl");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#800000";
   Chart_Type = 1; 

     x1 = 10;//10+20;
     y1=  25;
     x2=  370-30;//320+40;
     y2=  300+20;//300-20;
   
    PrintChart(x1, y1, x2, y2, arrPlanetsShodashvargaFeMale, Chart_Type, LanguageCode,false); 
    
    if( Chart_Type==1){ 
    SetFontSize(12);   

    PrintText((x1*16)-(5*5),(y1*4)+(5*1), '<%=girlInfo.get("Name")%>');  
     PrintText((x1*16)-(5*5),(y1*4)+(5*4), '<%=place2%>'); 
      PrintText((x1*16)-(5*7),(y1*4)+(5*9), '<%=girlInfo.get("DateOfBirth")%>'); 
       PrintText((x1*16)-(5*8),(y1*4)+(5*12), '<%=girlInfo.get("timeOfBirth")%>');   
       PrintText((x1*16)-(5*8),(y1*4)+(5*15), '<%=girlInfo.get("timeZone")%>');  
        PrintText((x1*16)-(5*9),(y1*4)+(5*18), '<%=girlInfo.get("latitudeinfo")%>');  
          PrintText((x1*16)-(5*9),(y1*4)+(5*21), '<%=girlInfo.get("longitudeinfo")%>');     
         
          }
}
else
{
   $('#CanvaslagnaGirl').hide();   
  
   }
</script>
<script language="JavaScript" type="text/javascript">
    $("#chart").append(myval);
</script>

<canvas id="CanvaslagnaBoy" width="380px" height="380px" class="ui-canvas"></canvas>
<script language="JavaScript" type="text/javascript">

var LanguageCode = <%=langCodePorMM%>;
var textcolor = "#800000";//COLOR_INFO;

<%
 mySyn1 = "";
for(int i = 0;i<=11;i++)
{
    mySyn1 = mySyn1 + arrPlanetsShodashvargaMale[i] + "," ;
}
mySyn1 = mySyn1 + arrPlanetsShodashvargaMale[12] ;
out.println("  arrPlanetsShodashvargaMale = new Array(" + mySyn1 + ");");

%>
if(window.HTMLCanvasElement) {
    var c=document.getElementById("CanvaslagnaBoy");
    var cxt = c.getContext("2d");
    cxt.strokeStyle = "#800000";
   Chart_Type = 1; 

     x1 = 10;//10+20;
     y1=  25;
     x2=  370-30;//320+40;
     y2=  300+20;//300-20;
   
    PrintChart(x1, y1, x2, y2, arrPlanetsShodashvargaMale, Chart_Type, LanguageCode,false); 
    
    if( Chart_Type==1){ 
    SetFontSize(12);   

    PrintText((x1*16)-(5*5),(y1*4)+(5*1), '<%=boyInfo.get("Name")%>');  
     PrintText((x1*16)-(5*5),(y1*4)+(5*4), '<%=place1%>'); 
      PrintText((x1*16)-(5*7),(y1*4)+(5*9), '<%=boyInfo.get("DateOfBirth")%>'); 
       PrintText((x1*16)-(5*8),(y1*4)+(5*12), '<%=boyInfo.get("timeOfBirth")%>');   
       PrintText((x1*16)-(5*8),(y1*4)+(5*15), '<%=boyInfo.get("timeZone")%>');  
        PrintText((x1*16)-(5*9),(y1*4)+(5*18), '<%=boyInfo.get("latitudeinfo")%>');  
          PrintText((x1*16)-(5*9),(y1*4)+(5*21), '<%=boyInfo.get("longitudeinfo")%>');     
         
          }
}
else
{
   $('#CanvaslagnaBoy').hide();   
  
   }
</script>
<script language="JavaScript" type="text/javascript">
    $("#chart").append(myval);
</script>
</div>
                </center>
            </div>
            <div class="ui-sub-heading">
                <h2>
                    <%=extraPagesConstants.getString("KUJA_DOSHAM_CHECK") %></h2>
            </div>
            <div class="ui-content">
                <p>
                    <%=extraPagesConstants.getString("KUNJ_DOSH_INTRO") %>
                    <br />
                    <br />
                    <% 
                        boolean Boymangaldosh = objHoroMale.isMangalDosh();              
                    	boolean Girlmangaldosh = objHoroFemale.isMangalDosh();
                        String Ismangaldosh = "";
                        String Mangaldoshlevel = "";
                        String KunjDoshResult = "";
                        if(Boymangaldosh && Girlmangaldosh)
                        {
                            Ismangaldosh = "NO";
                            Mangaldoshlevel = extraPagesConstants.getString("GOOD");
                            KunjDoshResult  = "SATISFACTORY";
                            Finalresult = Finalresult + 1;
                            kujapapsamyadosh = kujapapsamyadosh + 1;
                        } 
                        else
                        {
                            Ismangaldosh = "";
                            Mangaldoshlevel = extraPagesConstants.getString("BAD");
                            KunjDoshResult  = "NOT_SATISFACTORY";
                        }
                    %>
                    <b>
                        <%=baseConstants.getString("RESULT")%>:</b>
                    <% if(langCodePorMM == 1 ) { %>
                    <% if(!Ismangaldosh.equals("")) {  %>
                    <%=extraPagesConstants.getString("KUJA_DOSHAM_IS_PRESENT") %>
                    <%=extraPagesConstants.getString(Ismangaldosh) %><%=baseConstants.getString("HAI") %><br />
                    <% } else { %>
                    <%=extraPagesConstants.getString("KUJA_DOSHAM_IS_PRESENT") %>
                    <%=extraPagesConstants.getString("HAI") %><br />
                    <% } %>
                    <% } else { %>
                    <% if(!Ismangaldosh.equals("")) {  %>
                    <%=baseConstants.getString(Ismangaldosh) %>&nbsp;<%=extraPagesConstants.getString("KUJA_DOSHAM_IS_PRESENT") %><br />
                    <% } else { %>
                    &nbsp;<%=extraPagesConstants.getString("KUJA_DOSHAM_IS_PRESENT") %><br />
                    <% } %>
                    <% } %>
                    <b>
                        <%=extraPagesConstants.getString("THIS_IS")%>
                        <%=Mangaldoshlevel %>&nbsp;<%=extraPagesConstants.getString("KUJA_DOSHAM_MATCH")%><%=baseConstants.getString("HAI") %></b>&nbsp;
                </p>
            </div>
            <div class="ui-sub-heading">
                <h2>
                    <%=extraPagesConstants.getString("PAPA_SAMYA_CHECK")%></h2>
            </div>
            <div class="ui-content">
                <p>
                    <%=extraPagesConstants.getString("PAPASAMYAM_INTRO") %><br />
                    <br />
                    <%
                    String PapasamyamResult = "";
                    int PapasamyamValueforBoy = porMatFn.getPapasamyamValue(arrPlanetsShodashvargaMale);
                    int PapasamyamValueforGirl = porMatFn.getPapasamyamValue(arrPlanetsShodashvargaFeMale);
                                                           
                    if(PapasamyamValueforGirl > PapasamyamValueforBoy)
                    {
                        out.println("<b>" + extraPagesConstants.getString("PAPASAMYAM_SATISFACTORY_YES") + "</b>");
                        PapasamyamResult = "SATISFACTORY";
                        Finalresult = Finalresult + 1;
                        kujapapsamyadosh = kujapapsamyadosh + 1;
                    }
                    else
                    {
                        out.println("<b>" + extraPagesConstants.getString("PAPASAMYAM_SATISFACTORY_NO") + "</b>");
                        PapasamyamResult = "NOT_SATISFACTORY";
                    }
                    
                    %>
                </p>
            </div>
            <div class="ui-sub-heading">
                <h2>
                    <%=extraPagesConstants.getString("DASA_SANDHI_CHECK") %></h2>
            </div>
            <div class="ui-content">
                <p>
                    <%
                    Util util = new Util();
                    String mahaDasaMale = porMatFn.GetCurrentMahaDasa(objHoroMale, langCodePorMM, baseConstants);
                    String mahaDasaFemale = porMatFn.GetCurrentMahaDasa(objHoroFemale, langCodePorMM, baseConstants);
                    
                    out.println("<b>"+extraPagesConstants.getString("DATE_OF_BIRTH_OF_BOY") + "</b>: " + util.fullMonthName(objHoroMale.getMonthOfBirth(),langCodePorMM, baseConstants) +" "+ objHoroMale.getDayOfBirth() +", "+ objHoroMale.getYearOfBirth() +"<br/>");
                    out.println("<b>"+extraPagesConstants.getString("DASA_BALANCE_AT_BIRTH")+ "</b>: " + porMatFn.Getbalanceofdasa(objHoroMale.getBalanceOfDasaString(), extraPagesConstants) +"<br/>");
                    out.println("<b>"+extraPagesConstants.getString("DASA_ENDS")+ "</b>: " + "</b>" + mahaDasaMale);
                    out.println("<br/><br/>");
                  
                    out.println("<b>"+extraPagesConstants.getString("DATE_OF_BIRTH_OF_GIRL") + "</b>: " + util.fullMonthName(objHoroFemale.getMonthOfBirth(),langCodePorMM, baseConstants) +" "+ objHoroFemale.getDayOfBirth() +", "+ objHoroFemale.getYearOfBirth() +"<br/>");
                    out.println("<b>"+extraPagesConstants.getString("DASA_BALANCE_AT_BIRTH") + "</b>: " + porMatFn.Getbalanceofdasa(objHoroFemale.getBalanceOfDasaString(), extraPagesConstants) +"<br/>");
                    out.println("<b>"+extraPagesConstants.getString("DASA_ENDS")+ "</b>: " + "</b>" + mahaDasaFemale); 
                    out.println("<br/><br/>");
            
                    int currentYear = Calendar.getInstance().get(Calendar.YEAR);
                    int dasaMaleYear = Integer.valueOf(mahaDasaMale.substring(mahaDasaMale.length()-4));
                    int DashaSandhiResultforMale = 0;
                if(currentYear > dasaMaleYear)
                	DashaSandhiResultforMale = currentYear - dasaMaleYear;
                else
                    DashaSandhiResultforMale = dasaMaleYear - currentYear;
                  
                int dasaFemaleYear = Integer.valueOf(mahaDasaFemale.substring(mahaDasaFemale.length()-4));
                int DashaSandhiResultforFemale = 0;
	            if(currentYear > dasaFemaleYear)
	            	DashaSandhiResultforFemale = currentYear - dasaFemaleYear;
	            else
	            	DashaSandhiResultforFemale = dasaFemaleYear - currentYear;
            
	            String DasaSandhiResult = "";
	            int FinalResult = 0;
	            boolean DashaSandhiCheck = false;
	            String pdfDasaSandhiCheck = "";
                if(DashaSandhiResultforMale > 1 && DashaSandhiResultforFemale > 1)
                {
                    out.println("<b>" + extraPagesConstants.getString("DASA_SHANDI_YES") + "</b>");
                    DasaSandhiResult = "SATISFACTORY";
                    Finalresult = Finalresult + 1;
                    DasaSandhiCheck = true;
                    
                    pdfDasaSandhiCheck = extraPagesConstants.getString("DASA_SHANDI_YES");
                }
                else
                {
                    out.println("<b>" + extraPagesConstants.getString("DASA_SHANDI_NO") + "</b>");
                    DasaSandhiResult = "NOT_SATISFACTORY";
                    
                    pdfDasaSandhiCheck = extraPagesConstants.getString("DASA_SHANDI_NO");
                }
                
                
               String FinalResultString = "";
                
                if(DasakootCheck && DasaSandhiCheck && kujapapsamyadosh > 0) { %>
                <% FinalResultString = extraPagesConstants.getString("DASAKOOT_DASA_SANDHI_KUJA_DOSHAM_ARE_SATISFACTORY_MARRIAGE_IS_PREFERABLE"); %>
                <% } else if (DasakootCheck && DasaSandhiCheck && kujapapsamyadosh <= 0) { %>
                <% FinalResultString = extraPagesConstants.getString("KUJA_DOSHAM_IS_NOT_SATISFACTORY_MARRIAGE_NOT_PREFERABLE"); %>
                <% } else if ( DasakootCheck && !DasaSandhiCheck && kujapapsamyadosh <= 0) { %>
                <% FinalResultString = extraPagesConstants.getString("KUJA_DOSHAM_AND_DASA_SANDHI_ARE_NOT_SATISFACTORY_MARRIAGE_NOT_PREFERABLE"); %>
                <% } else if ( DasakootCheck && !DasaSandhiCheck && kujapapsamyadosh > 0) { %>
                <% FinalResultString = extraPagesConstants.getString("DASA_SANDHI_IS_NOT_SATISFACTORY_MARRIAGE_NOT_PREFERABLE"); %>
                <% } else if ( !DasakootCheck && DasaSandhiCheck && kujapapsamyadosh > 0) { %>
                <% FinalResultString = extraPagesConstants.getString("DASAKOOT_IS_NOT_SATISFACTORY_MARRIAGE_NOT_PREFERABLE"); %>
                <% } else if ( !DasakootCheck && !DasaSandhiCheck && kujapapsamyadosh > 0) { %>
                <% FinalResultString = extraPagesConstants.getString("DASAKOOT_AND_DASA_SANDHI_ARE_NOT_SATISFACTORY_MARRIAGE_NOT_PREFERABLE"); %>
                <% } else if ( !DasakootCheck && !DasaSandhiCheck && kujapapsamyadosh <= 0) { %>
                <% FinalResultString = extraPagesConstants.getString("DASAKOOT_DASA_SANDHI_AND_KUJA_DOSHAM_ARE_NOT_SATISFACTORY_MARRIAGE_NOT_PREFERABLE"); %>
                <% } else if ( !DasakootCheck && DasaSandhiCheck && kujapapsamyadosh <= 0) { %>
                <% FinalResultString = extraPagesConstants.getString("DASAKOOT_AND_KUJA_DOSHAM_ARE_NOT_SATISFACTORY_MARRIAGE_NOT_PREFERABLE"); %>
                <% } %>
                </p>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>
                                <%=extraPagesConstants.getString("TEST")%>
                            </th>
                            <th>
                                <%=extraPagesConstants.getString("RESULT")%>
                            </th>
                        </tr>
                    </thead>
                    <tr>
                        <td>
                            <%=extraPagesConstants.getString("TEN_PORUTHAM_STAR_COMPATIBILITY_CHECK") %>
                        </td>
                        <td>
                            <%=extraPagesConstants.getString(poruthamresult.toUpperCase())%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=extraPagesConstants.getString("KUJA_DOSHAM_CHECK")%>
                        </td>
                        <td>
                            <%=extraPagesConstants.getString(KunjDoshResult.toUpperCase()) %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=extraPagesConstants.getString("PAPA_SAMYA_CHECK")%>
                        </td>
                        <td>
                            <%=extraPagesConstants.getString(PapasamyamResult.toUpperCase()) %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%=extraPagesConstants.getString("DASA_SANDHI_CHECK")%>
                        </td>
                        <td>
                            <%=extraPagesConstants.getString(DasaSandhiResult.toUpperCase()) %>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="ui-sub-heading">
                <h2>
                    <%=extraPagesConstants.getString("CONCLUSION") %></h2>
            </div>
            <div class="ui-content">
                <p>
                    <% 
                out.println(FinalResultString);
                %>
                </p>
            </div>
            <div>
             <%
             
             String arrBoyinfo = "";
             String arrGirlinfo = "";
             String TableResult = "";
             String TotalGunaResult = "";
             String KunjaDoshaResult1 = "";
             String BoyDateOfBirthDetails = "";
             String GirlDateOfBirthDetails = "";
             String BoyBalOfBirth = "";
             String GirlBalOfBirth = "";
             String BoyDasaEndResult = "";
             String GirlDasaEndResult = "";
             int totalResult = 0;
				if (langCodePorMM == 0) 
				{
					arrBoyinfo = FormatString(myArray1[0], langCodePorMM) +"|"+ FormatString(myArray1[1], langCodePorMM) +"|"+ FormatString(myArray1[2], langCodePorMM) +"|"+ FormatString(myArray1[3], langCodePorMM)+"|"+ FormatString(myArray1[4], langCodePorMM)  +"|"+ FormatString(myArray1[5], langCodePorMM) +"|"+ FormatString(myArray1[6], langCodePorMM) +"|"+ FormatString(myArray1[7], langCodePorMM) +"|"+ FormatString(myArray1[8], langCodePorMM)+"|"+ FormatString(myArray1[9], langCodePorMM);
					arrGirlinfo = FormatString(myArray2[0], langCodePorMM) +"|"+ FormatString(myArray2[1], langCodePorMM) +"|"+ FormatString(myArray2[2], langCodePorMM)+"|"+ FormatString(myArray2[3], langCodePorMM)+"|"+ FormatString(myArray2[4], langCodePorMM)+"|"+ FormatString(myArray2[5], langCodePorMM)+"|"+ FormatString(myArray2[6], langCodePorMM)+"|"+ FormatString(myArray2[7], langCodePorMM)+"|"+ FormatString(myArray2[8], langCodePorMM)+"|"+ FormatString(myArray2[9], langCodePorMM);
					TableResult = FormatString(arrNodeValue[0], langCodePorMM)  +"|"+ FormatString(arrNodeValue[1], langCodePorMM) +"|"+ FormatString(arrNodeValue[2], langCodePorMM)+"|"+ FormatString(arrNodeValue[3], langCodePorMM)+"|"+ FormatString(arrNodeValue[4], langCodePorMM)+"|"+ FormatString(arrNodeValue[5], langCodePorMM)+"|"+ FormatString(arrNodeValue[6], langCodePorMM)+"|"+ FormatString(arrNodeValue[7], langCodePorMM)+"|"+ FormatString(arrNodeValue[8], langCodePorMM)+"|"+ FormatString(arrNodeValue[9], langCodePorMM);
					TotalGunaResult = totalGuna +"|"+ TamilStr;
					KunjaDoshaResult1 = Ismangaldosh +"|"+ Mangaldoshlevel;
					BoyDateOfBirthDetails = util.fullMonthName(objHoroMale.getMonthOfBirth(),langCodePorMM, baseConstants) +" "+ objHoroMale.getDayOfBirth() +","+ objHoroMale.getYearOfBirth();
					GirlDateOfBirthDetails = util.fullMonthName(objHoroFemale.getMonthOfBirth(),langCodePorMM, baseConstants) +" "+ objHoroFemale.getDayOfBirth() +","+ objHoroFemale.getYearOfBirth();
					BoyBalOfBirth = porMatFn.Getbalanceofdasa(objHoroMale.getBalanceOfDasa().toString(), extraPagesConstants);
					GirlBalOfBirth = porMatFn.Getbalanceofdasa(objHoroFemale.getBalanceOfDasa().toString(), extraPagesConstants) ;
					BoyDasaEndResult = mahaDasaMale;
					//out.println(totalResult);
					GirlDasaEndResult=mahaDasaFemale;
                %>
                <% } %>
            </div>
        </div>
        <div class="ui-sub-heading ui-no-border-b">
            <h2>
                <%=SharedFunction.ProperCase(objHoroMale.getName())%><%=extraPagesConstants.getString("KUNDLI_AND_FREE_REPORTS")%></h2>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <tr>
                    <td class="boy-box">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="http://www.astrosage.com/cloud/home.asp" %>">
                            <img id="tooltip15" src="/images/boy-icon.png" />
                            <span class="ui-tooltip">
                                <%=objHoroMale.getName() %><%=extraPagesConstants.getString("JATHAGAM")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/ManglikDetails.asp" %>">
                            <img id="tooltip" src="/images/report_icon/ico_mangal.jpg" alt="<%=objHoroMale.getName() %><%=extraPagesConstants.getString("KUjA_DOSHAM_CONSIDERATIONS")%>" />
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroMale.getName() %><%=extraPagesConstants.getString("KUjA_DOSHAM_CONSIDERATIONS")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/SadeSatiReport.asp" %>">
                            <img id="tooltip1" src="/images/report_icon/ico_sadesati.jpg">
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroMale.getName() %><%=extraPagesConstants.getString("SANI_REPORT")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/love-horoscope.asp" %>">
                            <img id="tooltip2" src="/images/report_icon/love.jpg">
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroMale.getName() %><%=extraPagesConstants.getString("LOVE_REPORT")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/gemstones-report.asp" %>">
                            <img id="tooltip3" src="/images/report_icon/gemstone.jpg">
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroMale.getName() %><%=extraPagesConstants.getString("GEMSTONE_REPORT")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/dasha_phala.asp" %>">
                            <img id="tooltip4" src="/images/report_icon/ico_dasha.jpg">
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroMale.getName() %><%=extraPagesConstants.getString("DASHA_PREDICTION")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/lalkitab-prediction.asp" %>">
                            <img id="tooltip5" src="/images/report_icon/ico_lalkitab.jpg">
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroMale.getName() %><%=extraPagesConstants.getString("LAL_KITAB_PREDICTION")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroMale.getName()%>&place=<%=place1 %>&TimeZone=<%=timezone1 %>&sex=<%=sex1 %>&sec=<%=sec1 %>&min=<%=min1 %>&hrs=<%=hrs1 %>&Day=<%=day1 %>&month=<%=month1 %>&Year=<%=year1 %>&LatDeg=<%=latdeg1 %>&LongDeg=<%=longdeg1 %>&LatMin=<%=latmin1 %>&LongMin=<%=longmin1 %>&LongEW=<%=longew1 %>&LatNS=<%=latns1 %>&DST=<%=dst1 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/VarshphalAllPages.asp" %>">
                            <img id="tooltip6" src="/images/report_icon/ico_2011_report.jpg">
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroMale.getName() %><%=extraPagesConstants.getString("YEARLY_REPORTS")%>
                            </span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="ui-sub-heading ui-no-border-b">
            <h2>
                <%=SharedFunction.ProperCase(objHoroFemale.getName())%><%=extraPagesConstants.getString("KUNDLI_AND_FREE_REPORTS")%></h2>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <tr>
                    <td class="girl-box">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip16" src="/images/girl-icon.png" />
                            <span class="ui-tooltip">
                                <%=objHoroFemale.getName() %><%=extraPagesConstants.getString("JATHAGAM")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip7" src="/images/report_icon/ico_mangal.jpg" alt="<%=objHoroFemale.getName() %><%=extraPagesConstants.getString("KUjA_DOSHAM_CONSIDERATIONS")%>" />
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroFemale.getName() %><%=extraPagesConstants.getString("KUjA_DOSHAM_CONSIDERATIONS")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip8" src="/images/report_icon/ico_sadesati.jpg">
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroFemale.getName()%><%=baseConstants.getString("SANI_REPORT")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip10" src="/images/report_icon/love.png" />
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroFemale.getName() %><%=baseConstants.getString("LOVE_REPORT")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip11" src="/images/report_icon/gemstone.png" />
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroFemale.getName() %><%=baseConstants.getString("GEMSTONE_REPORT")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip12" src="/images/report_icon/ico_dasha.jpg" />
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroFemale.getName()%><%=baseConstants.getString("DASHA_PREDICTION")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip13" src="/images/report_icon/ico_lalkitab.jpg" />
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroFemale.getName()%><%=baseConstants.getString("LAL_KITAB_PREDICTION")%>
                            </span></a>
                    </td>
                    <td align="center" class="hoverme">
                        <a href="http://www.astrosage.com/freeKundali/matchmakingSession.asp?name=<%=objHoroFemale.getName()%>&place=<%=place2 %>&TimeZone=<%=timezone2 %>&sex=<%=sex2 %>&sec=<%=sec2%>&min=<%=min2 %>&hrs=<%=hrs2 %>&Day=<%=day2 %>&month=<%=month2 %>&Year=<%=year2 %>&LatDeg=<%=latdeg2 %>&LongDeg=<%=longdeg2 %>&LatMin=<%=latmin2 %>&LongMin=<%=longmin2 %>&LongEW=<%=longew2 %>&LatNS=<%=latns2 %>&DST=<%=dst2 %>&languageCode=0&Ayanamsa=<%="0" %>&kphn=<%="0" %>&Charting=<%="0" %>&referrer=<%="/cloud/home.asp" %>">
                            <img id="tooltip14" src="/images/report_icon/ico_2011_report.jpg" />
                            <span class="ui-tooltip">
                                <%=extraPagesConstants.getString("READ")%>&nbsp;<%=objHoroFemale.getName().trim() %><%=baseConstants.getString("YEARLY_REPORTS")%>
                            </span></a>
                    </td>
                </tr>
            </table>
        </div>
        <div class="ui-sub-heading">
            <h2>
                <%=extraPagesConstants.getString("ACTION") %></h2>
        </div>
        <div class="pull-left ui-margin-tl">
          
                        <a href="http://www.astrosage.com/porutham.asp" class="btn btn-secondary btn-mid"><span class="glyphicon glyphicon-circle-arrow-left">
                        </span>
                            <%=extraPagesConstants.getString("MATCH_ANOTHER_KUNDALI")%>
                        </a>
                   </div>
                    <% if(langCodePorMM == 0) { %>
                   <div class="pull-right ui-margin-tr">
                        <a class="btn btn-secondary btn-mid" href="http://www.astrosage.com/match-making-xml/porutham-pdf.asp?headerinfo=iframe&arrBoyinfo=<%=arrBoyinfo %>&arrGirlinfo=<%=arrGirlinfo %>&TableResult=<%=TableResult %>&TotalGuna=<%=TotalGunaResult %>&KunjaDoshaResult1=<%=KunjaDoshaResult1 %>&poruthamresult=<%=poruthamresult %>&PapasamyamResult=<%=PapasamyamResult%>&KunjDoshResult=<%=KunjDoshResult%>&DasaSandhiResult=<%=DasaSandhiResult %>&BoyDOB=<%=BoyDateOfBirthDetails %>&GirlDOB=<%=GirlDateOfBirthDetails %>&BoyBalOfBirth=<%=BoyBalOfBirth %>&GirlBalOfBirth=<%=GirlBalOfBirth %>&BoyDasaEndResult=<%=BoyDasaEndResult  %>&GirlDasaEndResult=<%=GirlDasaEndResult %>&FinalResultString=<%=FinalResultString%>&pdfDasaSandhiCheck=<%=pdfDasaSandhiCheck %>&arrofplanetLagna=<%=arrPlanetsShodashvargaMale[0] +","+ arrPlanetsShodashvargaMale[1] +","+ arrPlanetsShodashvargaMale[2]+","+ arrPlanetsShodashvargaMale[3] +","+ arrPlanetsShodashvargaMale[4] +","+ arrPlanetsShodashvargaMale[5] +","+ arrPlanetsShodashvargaMale[6] +","+ arrPlanetsShodashvargaMale[7] +","+ arrPlanetsShodashvargaMale[8] +","+ arrPlanetsShodashvargaMale[9] +","+ arrPlanetsShodashvargaMale[10] +","+ arrPlanetsShodashvargaMale[11] +","+ arrPlanetsShodashvargaMale[12] %>&arrofplanetLagnaFe=<%=arrPlanetsShodashvargaFeMale[0] +","+ arrPlanetsShodashvargaFeMale[1] +","+ arrPlanetsShodashvargaFeMale[2] +","+ arrPlanetsShodashvargaFeMale[3] +","+ arrPlanetsShodashvargaFeMale[4] +","+ arrPlanetsShodashvargaFeMale[5] +","+ arrPlanetsShodashvargaFeMale[6] +","+ arrPlanetsShodashvargaFeMale[7] +","+ arrPlanetsShodashvargaFeMale[8] +","+ arrPlanetsShodashvargaFeMale[9] +","+ arrPlanetsShodashvargaFeMale[10] +","+ arrPlanetsShodashvargaFeMale[11] +","+ arrPlanetsShodashvargaFeMale[12]%>&boyname=<%=objHoroMale.getName() %>&boydob1=<%=objHoroMale.getDayOfBirth() %>&boymob=<%=objHoroMale.getMonthOfBirth() %>&boyyob=<%=objHoroMale.getYearOfBirth() %>&boyhrs=<%=objHoroMale.getHourOfBirth() %>&boymin=<%=objHoroMale.getMinuteOfBirth() %>&boysec=<%=objHoroMale.getSecondOfBirth() %>&boyplace=<%=objHoroMale.getPlace() %>&boylongdeg=<%=objHoroMale.getDegreeOfLongitude() %>&boylongmin=<%=objHoroMale.getMinuteOfLongitude() %>&boylongew=<%=objHoroMale.getEastWest() %>&boylatdeg=<%=objHoroMale.getDegreeOfLattitude() %>&boylatmin=<%=objHoroMale.getMinuteOfLattitude() %>&boylatns=<%=objHoroMale.getNorthSouth() %>&boytimezone=<%=objHoroMale.getTimeZone() %>&girlname=<%=objHoroFemale.getName() %>&girldob1=<%=objHoroFemale.getDayOfBirth() %>&girlmob=<%=objHoroFemale.getMonthOfBirth() %>&girlyob=<%=objHoroFemale.getYearOfBirth() %>&girlhrs=<%=objHoroFemale.getHourOfBirth() %>&girlmin=<%=objHoroFemale.getMinuteOfBirth() %>&girlsec=<%=objHoroFemale.getSecondOfBirth() %>&girlplace=<%=objHoroFemale.getPlace() %>&girllongdeg=<%=objHoroFemale.getDegreeOfLongitude() %>&girllongmin=<%=objHoroFemale.getMinuteOfLongitude() %>&girllongew=<%=objHoroFemale.getEastWest() %>&girllatdeg=<%=objHoroFemale.getDegreeOfLattitude() %>&girllatmin=<%=objHoroFemale.getMinuteOfLattitude() %>&girllatns=<%=objHoroFemale.getNorthSouth() %>&girltimezone=<%=objHoroFemale.getTimeZone() %>"
                            target="_blank"><span class="glyphicon glyphicon-download-alt"></span>
                            <%=extraPagesConstants.getString("DOWNLOAD_MATCH_MAKING_PDF")%>
                        </a>
                    </div>
                    <% } %>
               
            
            <div style="padding-bottom: 25px;" class="ui-clear">
            </div>
        </div>

<!-- **************************CODE TO SET THE INTERPRETATION OF THE MATCHMAKING*********************** -->
<%	
		
	/*maleRasiNumber = objHoroMale.getRasi + 1
	degOfBoy = objHoroMale.getMoon()
   	
	femaleRasiNumber = objHoroFemale.getRasi + 1
	degOfGirl = objHoroFemale.getMoon()
	  
	Dim dashkutheading, arrHeadings(7)
    dashkutheading = Array ("Rasi Porutham","Rasyadhipathi Porutham", "Vasya Porutham", "Mahendra Porutham", "Gana Porutham", "Yoni Porutham", "Dina Porutham", "Stree Deergha Porutham", "Rajju Dosha", "Vedha Dosha")  
	*/

%>
<%!
public String subGetMatchMakingInterpretation(String strCategory, int intForBoy, int intForGirl, int languageCode) 
{
       return GetMatchMakingPrediction(strCategory,intForBoy,intForGirl,languageCode);       
}

public String GetMatchMakingPrediction(String Category,int IntForBoy,int IntForGirl,int languageCode)
{
	MatchMakingDAO matchDAO = new MatchMakingDAO();
	return matchDAO.getMatchMakingVal(Category, IntForBoy, IntForGirl, languageCode);
	
    
}
public String FormatString(String strText, int languageCode)
{
   return SharedFunction.ProperCaseL(strText, languageCode);
}

%>
