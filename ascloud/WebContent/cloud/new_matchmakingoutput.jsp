<%@page import="java.text.DecimalFormat"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.MatchMakingDAO"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="com.cslsoftware.enghoro.EngHoro"%>
<%@page import="com.cslsoftware.matchmaking.MatchMaking"%>
<%@page contentType="text/html; charset=UTF-8"%>

<script language="javascript">
    function boy_details() {
        document.forms.boy.submit();
    }
    function girl_details() {
        document.forms.girl.submit();
    }
    function matchmaking_pdf() {
        _gaq.push(['_trackEvent', 'links', 'match_report_cloud']);
        document.forms.matchmaking_form.submit();
    }
</script>

 <script type="text/javascript">
 $(document).ready(function(){
 	eqHeightCol('.makingDiv');
 });
</script>

<%
try
{
EngHoro mmMaleHoro = (EngHoro) request.getAttribute("MMMaleHoro");
EngHoro mmFemaleHoro = (EngHoro) request.getAttribute("MMFemaleHoro");
if(request.getAttribute("msgVisible") != null)
{
%>
<div class="msgcls alert alert-danger">
	<div id="msgspn" class="boxhdg" align="center">Please enter the full birth details of the Boy and Girl</div>
</div>
<%
}
	//*****************Show when user not enter any string or other string i.e. not used for match making *************************
	/*Dim mangalDoshCompatibility,ashtakootDoshCompatibility,maleRashi,femaleRashi,degOfBoy,degOfGirl
            Dim tara(2),taraNo(2)
            mangalDoshCompatibility = true
            ashtakootDoshCompatibility = true*/
	int mmLanguageCode = Util.safeInt(session.getAttribute("languageCode"));
	MatchMaking matchmaking = new MatchMaking();
       
       if(mmLanguageCode == 1)
       {
    	   matchmaking.setLanguageCode ("1");       
       }            
       matchmaking.initializesArrayValues();      
    Local mmLocal = new Local();
    MyProperties baseConstants = (MyProperties) session.getAttribute("constants");
    MyResourceBundle matchMakingOutputConstants = (MyResourceBundle) mmLocal.loadPropertiesFileNew("matchmakingoutput", mmLanguageCode);
    MyResourceBundle birthDetailsMMConstants = (MyResourceBundle) mmLocal.loadPropertiesFileNew("birthdetails-matchmakingoutput", mmLanguageCode);
    
    String setLangForPDF = "";
    if(mmLanguageCode == 1)
    {
    	setLangForPDF = "1";     
    }
    else if(mmLanguageCode == 9)
    {
    	setLangForPDF = "9";     
    }  
    else{
    	
    	setLangForPDF = "0";     
    }          
%>

<!--'*****************************Birth Details of Boy/Girl Table*************************************-->
<div class="row mrt-30 planet-table">
	<div class="col s12 l12 ui-btm ui-btm-zero">
		<div class="card table-panel">
			<h4 class="vd-hdg br-amber-b amber lighten-5">
				<%=matchMakingOutputConstants.getString("BIRTH_DETAILS_BOY_GIRL") %>
			</h4>

			<table class="highlight striped bordered ui-table responsive-table ui-font">
				<thead>
					<tr>
						<th class="cellhead">
						</th>
						<th class="cellhead">
						    <%=baseConstants.getString("NAM")%>
						</th>
						<th class="cellhead">
							<%=baseConstants.getString("DAT")%>/ <%=baseConstants.getString("TIM")%>
						</th>
						<th class="cellhead">
						    <%=baseConstants.getString("PLAC")%>
						</th>
						<th class="cellhead">
						    <%=baseConstants.getString("LONGITUDE")%>
						</th>
						<th class="cellhead">
						    <%=baseConstants.getString("LATITUDE")%>
					 	</th>
					 	<th class="cellhead">
						    <%=baseConstants.getString("TIME_ZONE")%>
					 	</th>
					</tr>
				</thead>

				<tr>
					<td class="cellhead">
			        	<%="<b>" + baseConstants.getString("BOY") + "</b>"%>
					</td>
					<td class="cellhead">
					    <%=new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8")%>
					</td>
					<td class="cellcontent">
					    <%=mmMaleHoro.getDayOfBirth()+ "/" + mmMaleHoro.getMonthOfBirth() + "/" + mmMaleHoro.getYearOfBirth() + "<br />" + mmMaleHoro.getHourOfBirth() + ":" + mmMaleHoro.getMinuteOfBirth() + ":" + mmMaleHoro.getSecondOfBirth()%>
					</td>
					<td class="cellcontent">
					    <%=mmMaleHoro.getPlace()%>
					</td>
					<td class="cellcontent">
					    <%=mmMaleHoro.getDegreeOfLongitude() + mmMaleHoro.getEastWest() + mmMaleHoro.getMinuteOfLongitude()%>
					</td>
					<td class="cellcontent">
					    <%=mmMaleHoro.getDegreeOfLattitude() + mmMaleHoro.getNorthSouth() + mmMaleHoro.getMinuteOfLattitude()%>
					</td>
					<td class="cellcontent">
					    <%=mmMaleHoro.getTimeZone()%>
					</td>
				</tr>

				<tr>
					<td class="cellhead">
			        	<%="<b>" + baseConstants.getString("GIRL") + "</b>"%>
					</td>
					<td class="cellhead">
					    <%=new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8")%>
					</td>
					<td class="cellcontent">
					    <%=mmFemaleHoro.getDayOfBirth()+ "/" + mmFemaleHoro.getMonthOfBirth() + "/" + mmFemaleHoro.getYearOfBirth() + "<br />" + mmFemaleHoro.getHourOfBirth() + ":" + mmFemaleHoro.getMinuteOfBirth() + ":" + mmFemaleHoro.getSecondOfBirth()%>
					</td>
					<td class="cellcontent">
					    <%=mmFemaleHoro.getPlace()%>
					</td>
					<td class="cellcontent">
					    <%=mmFemaleHoro.getDegreeOfLongitude() + mmFemaleHoro.getEastWest() + mmFemaleHoro.getMinuteOfLongitude()%>
					</td>
					<td class="cellcontent">
					    <%=mmFemaleHoro.getDegreeOfLattitude() + mmFemaleHoro.getNorthSouth() + mmFemaleHoro.getMinuteOfLattitude()%>
					</td>
					<td class="cellcontent">
					    <%=mmFemaleHoro.getTimeZone()%>
					</td>
				</tr>
			</table>
		</div>
		
	</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>


<!--'*****************************Guna Milan Table*************************************-->
<div class="row mrt-30 planet-table">
   <div class="col s12 l12 ui-btm ui-btm-zero">
      <div class="card table-panel">
          <h4 class="vd-hdg br-amber-b amber lighten-5"><%=matchMakingOutputConstants.getString("GUNA_MILAN") %>  </h4>
             <table class="highlight striped bordered ui-table responsive-table ui-font">
               <thead>
                  <tr>
			        <th class="cellhead">
			            <%=baseConstants.getString("GUNA") %>
			        </th>
			        <th class="cellhead">
			            <%=baseConstants.getString("BOY") %>
			        </th>
			        <th class="cellhead">
			            <%=baseConstants.getString("GIRL") %>
			        </th>
			        <th class="cellhead">
			            <%=baseConstants.getString("MAXIMUM_OBTAINED")%>
			        </td>
			        <th class="cellhead">
			            <%=baseConstants.getString("OBTAINED_POINT")%>
			        </th>
			        <th class="cellhead">
			            <%=baseConstants.getString("AREA_OF_LIFE") %>
			        </th>
			       </tr>
                  </thead>
                                  
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
<%
//**********************************CODE TO GET RESULT OF MATCHMAKING****************
    /*Dim strString,myArray3(7),myArray4(7),myArray2(7),myArray1(12),arrHeading(7)
    Dim arrTara,totalGuna,k */
//**********************************calculate for Boy******************************
    //Dim nakshatraMale, maleRasiNumber   
    int nakshatraMale = mmMaleHoro.getNakshatra();
    int maleRasiNumber = mmMaleHoro.getRasi() + 1;
    double degOfBoy = mmMaleHoro.getMoon();
//******************calculate for girl******************************************
    //Dim nakshatraFemale, femaleRasiNumber
    int nakshatraFemale = mmFemaleHoro.getNakshatra();
    int femaleRasiNumber = mmFemaleHoro.getRasi() + 1;
    double degOfGirl = mmFemaleHoro.getMoon();
    String[] arrHeading = new String[8];
    arrHeading[0] = baseConstants.getString("VARNA");
    arrHeading[1] = baseConstants.getString("VASYA");
    arrHeading[2] = baseConstants.getString("TARAA");
    arrHeading[3] = baseConstants.getString("YONI");
    arrHeading[4] = baseConstants.getString("MAITRI");
    arrHeading[5] = baseConstants.getString("GANA");
    arrHeading[6] = baseConstants.getString("BHAKOOT");
    arrHeading[7] = baseConstants.getString("NADI");

    Hindi hindi =new Hindi();
    String[] myArray1 = new String[8];
    myArray1[0] = hindi.unicode(matchmaking.getVarna(maleRasiNumber), mmLanguageCode);
    myArray1[1] = hindi.unicode(matchmaking.getVashya(degOfBoy), mmLanguageCode);

    String[] arrTara = matchmaking.getTara(degOfBoy, degOfGirl);
    myArray1[2] = hindi.unicode(arrTara[0], mmLanguageCode);
    myArray1[3] = hindi.unicode(matchmaking.getYoni(degOfBoy), mmLanguageCode);
    myArray1[4] = hindi.unicode(matchmaking.getGraha(maleRasiNumber), mmLanguageCode);
    myArray1[5] = hindi.unicode(matchmaking.getGana(degOfBoy), mmLanguageCode);   
    myArray1[6] = hindi.unicode(mmMaleHoro.getRasiName(), mmLanguageCode);
    myArray1[7] = hindi.unicode(matchmaking.getNadi(degOfBoy), mmLanguageCode);      
         
    String[] myArray2 = new String[8];
    myArray2[0] = hindi.unicode(matchmaking.getVarna(femaleRasiNumber), mmLanguageCode);
    myArray2[1] = hindi.unicode(matchmaking.getVashya(degOfGirl), mmLanguageCode);
    myArray2[2] = hindi.unicode(arrTara[1], mmLanguageCode);
    myArray2[3] = hindi.unicode(matchmaking.getYoni(degOfGirl), mmLanguageCode);
    myArray2[4] = hindi.unicode(matchmaking.getGraha(femaleRasiNumber), mmLanguageCode);
    myArray2[5] = hindi.unicode(matchmaking.getGana(degOfGirl), mmLanguageCode);
    myArray2[6] = hindi.unicode(mmFemaleHoro.getRasiName(), mmLanguageCode);
    myArray2[7] = hindi.unicode(matchmaking.getNadi(degOfGirl), mmLanguageCode); 
        
    int[] myArray3 = new int[8];
    myArray3[0] = matchmaking.getMaximumVarna();
    myArray3[1] = matchmaking.getMaximumVashya();
    myArray3[2] = matchmaking.getMaximumTara();
    myArray3[3] = matchmaking.getMaximumYoni();
    myArray3[4] = matchmaking.getMaximumGrahaMaitri();
    myArray3[5] = matchmaking.getMaximumGana();
    myArray3[6] = matchmaking.getMaximumBhakoot();
    myArray3[7] = matchmaking.getMaximumNadi();    

    double[] myArray4 = new double[8];
    myArray4[0] = matchmaking.matchVarnaGuna(maleRasiNumber, femaleRasiNumber);
    myArray4[1] = matchmaking.matchVashyaGuna(degOfBoy, degOfGirl);
    myArray4[2] = matchmaking.matchTaraGuna(degOfBoy, degOfGirl);
    myArray4[3] = matchmaking.matchYoniGuna(degOfBoy, degOfGirl);
    myArray4[4] = matchmaking.matchGrahaMitraGuna(maleRasiNumber, femaleRasiNumber);
    myArray4[5] = matchmaking.matchGanaGuna(degOfBoy, degOfGirl);
    myArray4[6] = matchmaking.matchBhakutGuna(maleRasiNumber, femaleRasiNumber);
    myArray4[7] = matchmaking.matchNadiGuna(degOfBoy, degOfGirl);     
    String[] arrAreaOfLife = new String[8];
    DecimalFormat df = new DecimalFormat("#.###");
    for(int i= 0;i<= 7;i++)
    {
        arrAreaOfLife[i] = hindi.unicode(matchmaking.getAreaOfLife(i+1), mmLanguageCode); 
    }
    double totalGuna = 0;
    for(int i=0;i<=7;i++) 
    {
    %>
    <tr>
        <td class="cellcontent">
            <a href="#<%=arrHeading[i]%>"><%=arrHeading[i]%></a>
        </td>
        <td class="cellcontent">
            <%=FormatString(myArray1[i], mmLanguageCode)%>
        </td>
        <td class="cellcontent">
            <%=FormatString(myArray2[i], mmLanguageCode)%>
        </td>
        <td class="cellcontent">
            <%=myArray3[i]%>
        </td>
        <td class="cellcontent">
            <%=df.format(myArray4[i])%>
        </td>
        <td class="cellcontent">
            <%=arrAreaOfLife[i]%>
        </td>
    </tr>
    <%
    totalGuna = totalGuna + myArray4[i];
    }%>
                                  </table>
                                  </div>
                                  </div>
                                  </div>

<%

//***************Mangal Dosh Of Boy & Girl*************
        degOfBoy = mmMaleHoro.getMoon(); 
        degOfGirl = mmFemaleHoro.getMoon();
        nakshatraMale = mmMaleHoro.getNakshatra();
        maleRasiNumber = mmMaleHoro.getRasi() + 1;
        nakshatraFemale = mmFemaleHoro.getNakshatra();
        femaleRasiNumber = mmFemaleHoro.getRasi() + 1;
        int CalcMangalDoshM=mmMaleHoro.CalcMangalDosh();
        int CalcMangalDoshF=mmFemaleHoro.CalcMangalDosh();
        int intForBoy = matchmaking.calculateVarna(maleRasiNumber);
        int intForGirl = matchmaking.calculateVarna(femaleRasiNumber);
        int intForBoyRasi = mmMaleHoro.getRasi();
        int intForGirlRasi = mmFemaleHoro.getRasi();
        
        boolean mangaldoshinlagnachartboy = mmMaleHoro.isMangalDosh();
        boolean mangaldoshinmoonchartboy = mmMaleHoro.isMangalDoshForMoonChart();
        boolean mangaldoshinlagnachartgirl = mmFemaleHoro.isMangalDosh();
        boolean mangaldoshinmoonchartgirl = mmFemaleHoro.isMangalDoshForMoonChart();
        
String boymangaldoshlevel = getmangaldoshlevel(baseConstants, mangaldoshinlagnachartboy, mangaldoshinmoonchartboy);
String girlmangaldoshlevel = getmangaldoshlevel(baseConstants, mangaldoshinlagnachartgirl, mangaldoshinmoonchartgirl);

String strString = "";

if(mmLanguageCode == 1)
{
    if(boymangaldoshlevel.equals(girlmangaldoshlevel))
    {
        if(boymangaldoshlevel.equals("नहीं"))
        {
            strString = new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में और "+ new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'मंगल दोष "+ boymangaldoshlevel +"'</b> है। ";
        } else
        {
            strString = new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में और "+ new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'"+ boymangaldoshlevel +" मंगल दोष'</b> है। ";
        }
    }
    else
    {
        if(boymangaldoshlevel.equals("नहीं"))
        {
            strString = new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'मंगल दोष " + boymangaldoshlevel +"'</b> है और " + new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'" + girlmangaldoshlevel + " मंगल दोष'</b> है। ";
        } else if(boymangaldoshlevel.equals("नहीं"))
        {
            strString = new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'" + boymangaldoshlevel +" मंगल दोष'</b>  और " + new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'मंगल दोष " + girlmangaldoshlevel + "'</b> है। ";
        } else
        {
            strString = new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'" + boymangaldoshlevel +" मंगल दोष'</b>  और " + new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") + " की कुण्डली में <b>'" + girlmangaldoshlevel + " मंगल दोष'</b> है। ";
        }  
    }
}
else
{
    if(boymangaldoshlevel.equals(girlmangaldoshlevel))
    {
    	String[] Changestrwithdata = {SharedFunction.ProperCase(new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8")) ,new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8"),boymangaldoshlevel};
        strString = mmLocal.getDesiredString(matchMakingOutputConstants.getString("BOYANDGIRLMANGALDOSH"),Changestrwithdata);
    } else
    {
    	String[] Changestrwithdata = {SharedFunction.ProperCase(new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8")),boymangaldoshlevel,new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8"),girlmangaldoshlevel};
        strString = mmLocal.getDesiredString(matchMakingOutputConstants.getString("BOYMANGALDOSHANDGIRLMANGALDOSH"),Changestrwithdata);
    }
}
//********************Code For Mangal Dosh & Marriage Preferability***************************    
    //Dim blnComp,blnGunaMilan, strConclusion
       
    boolean blnComp,blnGunaMilan;
	String strConclusion = "";
    if(Util.calculateCompatibilityForMangalDosh(boymangaldoshlevel,girlmangaldoshlevel))
    {
        blnComp = true;
    } 
    else 
    {
        blnComp = false;
    }

    if(matchmaking.getTotal() >= 18)
    {
        blnGunaMilan = true;
    }
    else
    {
        blnGunaMilan = false;
    }
        
    if(blnComp && blnGunaMilan)
    {
        strConclusion = baseConstants.getString("THIS_MARRIAGE_IS_PREFERABLE");
    }
    else
    {
        if(blnComp && !blnGunaMilan)
        {
            strConclusion = baseConstants.getString("THIS_MARRIAGE_IS_NOT_PREFERABLE_DUE_TO_LOW_MATCH_POINTS_OBTAINED");
        }
        else if(!blnComp && !blnGunaMilan)
        {
        	strConclusion = baseConstants.getString("THIS_MARRIAGE_IS_NOT_PREFERABLE_DUE_TO_MANGAL_DOSHA_AND_LOW_MATCH_POINTS_OBTAINED");
        }
        else if(!blnComp && blnGunaMilan)
        {
            strConclusion = baseConstants.getString("THERE_IS_SUBSTANTIAL_DIFFERENCE_IN_THE_LEVEL_OF_MANGAL_DOSHA_COMPATIBILITY_OF_BOTH_THE_HOROSCOPES")+" "+baseConstants.getString("IT_IS_ADVISABLE_TO_CONSULT_A_LEARNED_ASTROLOGER_BEFORE_PROCEEDING_TO_MARRIAGE");
        }
    }
%>
<div class="row"> 
<div class="col s12 l8">
<div class="card hdg-lg1 ui-paragraph-head">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=baseConstants.getString("HOROSCOPE_MATCHING_RESULTS") %>   </h2> 

<ul class="mrt-10 mrb-10">
<li><%=baseConstants.getString("ASHTAKOOT_MATCHING_BETWEEN_MALE_AND_FEMALE_IS") %> <b><%=df.format(totalGuna)%>/36</b> <%=baseConstants.getString("HAI") %></li>
<li><%=strString%></li>
<li> <b><%=baseConstants.getString("CONCLUSION") %>:</b><%=strConclusion%></li>
</ul>
<%
String printLang = "", printBtnTxt = "", printParaTxt = "", printSourceTxt = "";
if(mmLanguageCode == 1){ //hindi
	printLang = "hi";
	printBtnTxt = "एस्ट्रोसेज कुंडली ऍप";   ;
	printParaTxt = "तेज़ और सटीक गुण मिलान अपने फ़ोन पर पाने के लिए अभी डाउनलोड करें -"  ;;;
	printSourceTxt = "ascloudmatchhi";
}
else if(mmLanguageCode == 2){ //tamil	
	printLang = "ta";
	printBtnTxt = "அஸ்ட்ரோசாஜ் குண்டலி ஆப்";
	printParaTxt = "விரைவான மற்றும் உறுதியான குண பொருத்தம் உங்கள் கைபேசியில் பெற இப்போதே பதிவிறக்கம் செய்யவும் -";
	printSourceTxt = "ascloudmatchta";
}
else if(mmLanguageCode == 4){ //kannada	
	printLang = "kn";
	printBtnTxt = "ಆಸ್ಟ್ರೋಸೇಜ್ ಕುಂಡಲಿ ಆಪ್";
	printParaTxt = "ವೇಗವಾದ ಮತ್ತು ನಿಖರವಾದ ಗುಣಲಕ್ಷಣ ಹೊಂದಾಣಿಕೆಯನ್ನು ನಿಮ್ಮ ಫೋನ್ ನಲ್ಲಿ ಪಡೆಯಲು ಈಗಲೇ ಡೌನ್ಲೋಡ್ ಮಾಡಿ -";
	printSourceTxt = "ascloudmatchka";
}
else if(mmLanguageCode == 5){ //telugu	
	printLang = "te";
	printBtnTxt = "ఆస్ట్రోసెజ్ కుండలి ఆప్";
	printParaTxt = "ఖచ్చితమైన మరియు సమగ్రమైన వివాహ పొంతన మీయొక్క ఫోనులో పొందుటకు ఇప్పుడే డౌన్లోడ్ చేయండి:";
	printSourceTxt = "ascloudmatchte";
}
else if(mmLanguageCode == 6){ //bengali	
	printLang = "bn";
	printBtnTxt = "এস্ট্রসেজ কুন্ডলী অ্যাপ";
	printParaTxt = "দ্রুত এবং সঠিক গুন মিলান নিজের ফোনে পাওয়ার জন্য এখনই ডাউনলোড করুন -";
	printSourceTxt = "ascloudmatchbn";
}
else if(mmLanguageCode == 7){ //gujarati	
	printLang = "gu";
	printBtnTxt = "એસ્ટ્રોસેજ કુંડળી એપ";
	printParaTxt = "ઝડપી અને સચોટ ગુણ મિલાન પોતાના ફોન પર મેળવવા માટે અત્યારે ડાઉનલોડ કરો -";
	printSourceTxt = "ascloudmatchgu";
}
else if(mmLanguageCode == 8){ //malayalama	
	printLang = "ml";
	printBtnTxt = "ആസ്ട്രോസേജ് കുണ്ഡലി ആപ്പ്";
	printParaTxt = "നിങ്ങളുടെ സ്മാർട്ട് ഫോണിൽ കൃത്യവും പെട്ടെന്നും ഉള്ള ജാതക പൊരുത്തം ലഭിക്കുന്നതിനായി, ഇപ്പോൾ ഡൌൺലോഡ് ചെയ്യൂ -";
	printSourceTxt = "ascloudmatchml";
}
else if(mmLanguageCode == 9){ //marathi	
	printLang = "mr";
	printBtnTxt = "अ‍ॅस्ट्रोसेज कुंडली अ‍ॅप";
	printParaTxt = "त्वरित आणि सटीक गुण मिलन आपल्या फोनवर मिळवण्यासाठी आत्ताच डाउनलोड करा -";;;
	printSourceTxt = "ascloudmatchmr";
}
else{	
	printLang = "en";
	printBtnTxt = "AstroSage Kundli app";
	printParaTxt = "To get quick and accurate Guna Milan on your smartphone, download now:";
	printSourceTxt = "ascloudmatchen";
}
%>
<ul> 
<li><%=printParaTxt%> <a href="https://play.google.com/store/apps/details?id=com.ojassoft.astrosage&amp;referrer=utm_source%3D<%=printSourceTxt%>%26utm_medium%3Dpopup%26utm_campaign%3Dmobileapp&amp;hl=<%=printLang%>_IN"><%=printBtnTxt%> </a> </li>
</ul>

</div>
</div>
<div class="col s12 l4">
<div class="card hdg-lg1 ui-paragraph-head">
<h2 class="br-amber-b amber lighten-5 head-R">  <%=baseConstants.getString("OBTAINED_POINT")%>   </h2> 

<div class="center formate-p"> 
<p> <%=df.format(totalGuna)%><span style="font-size:14px;">/36</span> </p>
</div>

<div align="center" class="ui-asm-link">
<a href="https://marriage.astrosage.com/?utm_source=onlinead&utm_medium=cloudmatching&utm_campaign=asmarriage" target="_blank"><%=baseConstants.getString("JOIN_ASTROSAGE_MATRIMONY")%></a>
</div>

</div>
</div>
</div>


<div class="row"> 
<div class="col s12 l12">
<div class="card hdg-lg1 ui-paragraph-head">
<% 
//****************CODE TO SET THE INTERPRETATION OF THE MATCHMAKING*******************
	/*Dim intForBoy,intForGirl,strCategory
	Dim arrHeadings(7),arrInterpretation(7) */

	/*
	------- REDUNDANT CODE ALREADY DONE ABOVE. SO COMMENTED IT HERE.
	int nakshatraMale = objHoroMale.getNakshatra();
	int maleRasiNumber = objHoroMale.getRasi() + 1;
	int degOfBoy = objHoroMale.getMoon();
   
	nakshatraFemale = objHoroFemale.getNakshatra
	femaleRasiNumber = objHoroFemale.getRasi + 1
	degOfGirl = objHoroFemale.getMoon()
	  
	
	*/
  	
	String[] arrInterpretation = new String[8];
	intForBoy = matchmaking.calculateVarna(maleRasiNumber);
	intForGirl = matchmaking.calculateVarna(femaleRasiNumber);
	arrInterpretation[0] = subGetMatchMakingInterpretation("VA", intForBoy, intForGirl, mmLanguageCode);
  
	intForBoy = matchmaking.calculateVashya(degOfBoy);
	intForGirl = matchmaking.calculateVashya(degOfGirl);
	arrInterpretation[1] = subGetMatchMakingInterpretation("VAS", intForBoy, intForGirl, mmLanguageCode);
  
	int[] arrTaraInt = new int[2];
	arrTaraInt = matchmaking.CalculateTara(degOfBoy, degOfGirl);
	intForBoy = arrTaraInt[0];
	intForGirl = arrTaraInt[1];
	arrInterpretation[2] = subGetMatchMakingInterpretation("TA", intForBoy, intForGirl, mmLanguageCode);
  
	intForBoy = matchmaking.calculateYoni(degOfBoy);
	intForGirl = matchmaking.calculateYoni(degOfGirl);
	arrInterpretation[3] = subGetMatchMakingInterpretation("YON", intForBoy, intForGirl, mmLanguageCode);

   intForBoy = matchmaking.calculateGraha(maleRasiNumber);
   intForGirl = matchmaking.calculateGraha(femaleRasiNumber);
   arrInterpretation[4] = subGetMatchMakingInterpretation("RAS", intForBoy, intForGirl, mmLanguageCode);
    
   intForBoy = matchmaking.calculateGana(degOfBoy);
   intForGirl = matchmaking.calculateGana(degOfGirl);
   arrInterpretation[5] = subGetMatchMakingInterpretation("GAN", intForBoy, intForGirl, mmLanguageCode);

   intForBoy = mmMaleHoro.getRasi();
   intForGirl = mmFemaleHoro.getRasi();
   arrInterpretation[6] = subGetMatchMakingInterpretation("BH", intForBoy, intForGirl, mmLanguageCode); 
  
   intForBoy = matchmaking.calculateNadi(degOfBoy);
   intForGirl = matchmaking.calculateNadi(degOfGirl);
   arrInterpretation[7] = subGetMatchMakingInterpretation("NA", intForBoy, intForGirl, mmLanguageCode);
     
%>
<h2 class="br-amber-b amber lighten-5 head-R">  <%=matchMakingOutputConstants.getString("HOROSCOPE_DO_NOT_MATCH")+"  "+matchMakingOutputConstants.getString("MARRIAGE_AND_LOVE_ANALYSIS")%>   </h2> 
<%
request.setAttribute("MARRIAGE_WIDGET_TEXT", matchMakingOutputConstants.getString("MARRIAGE_WIDGET_TEXT"));
request.setAttribute("ORDER_NOW", baseConstants.getString("ORDER_NOW"));
%>
<%@include file="/include/i_widget-love-marriage.jsp"%>
</div>
</div>
</div>


<div class="row matchMakingDiv"> 
<div class="col s12 l12">
<div class="card hdg-lg1">
<%  

String nameMale = new String(mmMaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8")+" ";
if(nameMale!= null && !nameMale.trim().equals(""))
{
String[] NameofBoy = nameMale.split(" ");
%>
<%
String[] a_place=mmMaleHoro.getPlace().split(",");
String nameBoyTrim = nameMale.trim();
String secBoyTrim = mmMaleHoro.getSecondOfBirth().trim();
String nameBoyProperCase = SharedFunction.ProperCase(NameofBoy[0]);
String constREADD = matchMakingOutputConstants.getString("READD");
String constKIHINDI = matchMakingOutputConstants.getString("KI_HINDI");
String constREADHINDI = matchMakingOutputConstants.getString("READ_HINDI");
String timezoneMale = mmMaleHoro.getTimeZone();
String sexMale = mmMaleHoro.getMaleFemale();
String minMale = mmMaleHoro.getMinuteOfBirth();
String hrsMale = mmMaleHoro.getHourOfBirth();
int dayMale = mmMaleHoro.getDayOfBirth();
int monthMale = mmMaleHoro.getMonthOfBirth();
int yearMale = mmMaleHoro.getYearOfBirth();
String latDegMale = mmMaleHoro.getDegreeOfLattitude();
String latMinMale = mmMaleHoro.getMinuteOfLattitude();
String latNSMale = mmMaleHoro.getNorthSouth();
String longDegMale = mmMaleHoro.getDegreeOfLongitude();
String longMinMale = mmMaleHoro.getMinuteOfLongitude();
String longEWMale = mmMaleHoro.getEastWest();
String dstMale = mmMaleHoro.getDST();

%>
<h2 class="br-amber-b amber lighten-5 head-R">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="home.asp" %>" onclick="" class="matching_text">
<%=nameBoyProperCase %> <%=matchMakingOutputConstants.getString("KUNDLI_AND_FREE_REPORTS") %></a>  </h2>
<form name="boy" method="post" action="createsession-jsp.asp">
<ul class="default-ui-icon"> 
<li class="makingDiv"> <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="home.asp" %>" onclick="">
<img id="tooltip15" src="images/icons/ic_male.png" title="">
                </a> 
                <p> <%=nameBoyProperCase %> <%=constKIHINDI %> <%=baseConstants.getString("KUNDLI") %> </p>
                </li>
                
                <li class="makingDiv">
                   <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="manglikdetails.asp" %>">
                    <img class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Home" src="images/icons/ic_mangal_dosh.png" alt="<%=NameofBoy[0] %>'s Manglik Considerations" title="" /></a> 
                    <p>  <%=constREADD %> <%=NameofBoy[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("MANGLIK_REPORT") %> <%=constREADHINDI %> </p>
                    </li>
                
                 <li class="makingDiv">  
                    <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="sadesatireport.asp" %>">
                    <img id="tooltip1" src="images/icons/shani-sade-sati-report.png" title=""></a> 
                    <p> <%=constREADD %> <%=NameofBoy[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("SANI_REPORT") %><%=constREADHINDI %> </p>
                    </li>
                
                 <li class="makingDiv"> <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="love-horoscope.asp" %>">
                     <img id="tooltip2" src="images/icons/ic_weekly_love.png" title=""></a>
                     <p> <%=constREADD %> <%=NameofBoy[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("LOVE_REPORT") %> <%=constREADHINDI %> </p>
                     </li>
                   
                     <li class="makingDiv">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="gemstones-report.asp" %>">
                           <img id="tooltip3" src="images/icons/ic_gemstone.png" title=""></a> 
                           <p> <%=constREADD %> <%=NameofBoy[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("GEMSTONE_REPORT") %> <%=constREADHINDI %> </p>
                    </li>
                    
                    <li class="makingDiv">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="dasha_phala.asp" %>">
                          <img id="tooltip4" src="images/icons/dashaphal.png" title=""></a> 
                    <p> <%=constREADD %> <%=NameofBoy[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("DASHA_PREDICTION_REPORT") %> <%=constREADHINDI %> </p>
                    </li>
                    
                    <li class="makingDiv">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="lalkitab-prediction.asp" %>">
                          <img id="tooltip5" src="images/icons/ic_lalkitab.png" title=""></a>
                          <p> <%=constREADD %> <%=NameofBoy[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("LAl_KITAB_PREDICTION") %> <%=constREADHINDI %> </p>
                    
                    </li>
                    
                    <li class="makingDiv"> <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameBoyTrim %>&place=<%=a_place[0] %>&timezone=<%=timezoneMale %>&sex=<%=sexMale %>&sec=<%=secBoyTrim %>&min=<%=minMale %>&hrs=<%=hrsMale %>&day=<%=dayMale %>&month=<%=monthMale %>&year=<%=yearMale %>&latdeg=<%=latDegMale %>&longdeg=<%=longDegMale %>&latmin=<%=latMinMale %>&longmin=<%=longMinMale %>&longew=<%=longEWMale %>&latns=<%=latNSMale %>&dst=<%=dstMale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="varshphalallpages.asp" %>">
                         <img id="tooltip6" src="images/icons/year-analysis.png" title=""></a> 
                         <p> <%=constREADD %> <%=NameofBoy[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("YEARLY_REPORT") %> <%=constREADHINDI %> </p>
                    
                    </li>
</ul>

<input type='hidden' name='name' value='<%=nameMale %>' />
    <input type='hidden' name='place' value='<%=a_place[0] %>' />
    <input type='hidden' name='timezone' value='<%=timezoneMale %>' />
    <input type='hidden' name='sex' value='<%=sexMale %>' />
    <input type='hidden' name='sec' value='<%=secBoyTrim %>' />
    <input type='hidden' name='min' value='<%=minMale %>' />
    <input type='hidden' name='hrs' value='<%=hrsMale %>' />
    <input type='hidden' name='day' value='<%=dayMale %>' />
    <input type='hidden' name='month' value='<%=monthMale %>' />
    <input type='hidden' name='Year' value='<%=yearMale %>' />
    <input type='hidden' name='latdeg' value='<%=latDegMale %>' />
    <input type='hidden' name='longdeg' value='<%=longDegMale %>' />
    <input type='hidden' name='latmin' value='<%=latMinMale %>' />
    <input type='hidden' name='longmin' value='<%=longMinMale %>' />
    <input type='hidden' name='longew' value='<%=longEWMale %>' />
    <input type='hidden' name='latns' value='<%=latNSMale %>' />
    <input type='hidden' name='dst' value='<%=dstMale %>' />
    <input type='hidden' name='languagecode' value='<%=mmLanguageCode %>' />
    <input type='hidden' name='ayanamsa' value='0' />
    <input type='hidden' name='kphn' value='0' />
    <input type='hidden' name='charting' value='0' />
    </form>
</div>
</div>
</div>

<div class="row matchMakingDiv"> 
<div class="col s12 l12">
<div class="card hdg-lg1">
<%
    String nameFemale = new String(mmFemaleHoro.getName().getBytes("ISO-8859-1"), "UTF-8") +" ";
    String[] NameofFemale = nameFemale.split(" "); 

    String[] a_place1=mmFemaleHoro.getPlace().split(",");
    
    String nameFemaleTrim = nameFemale.trim();
    String secFemaleTrim = mmFemaleHoro.getSecondOfBirth().trim();
    String nameFemaleProperCase = SharedFunction.ProperCase(NameofFemale[0]);
    String timezoneFemale = mmFemaleHoro.getTimeZone();
    String sexFemale = mmFemaleHoro.getMaleFemale();
    String minFemale = mmFemaleHoro.getMinuteOfBirth();
    String hrsFemale = mmFemaleHoro.getHourOfBirth();
    int dayFemale = mmFemaleHoro.getDayOfBirth();
    int monthFemale = mmFemaleHoro.getMonthOfBirth();
    int yearFemale = mmFemaleHoro.getYearOfBirth();
    String latDegFemale = mmFemaleHoro.getDegreeOfLattitude();
    String latMinFemale = mmFemaleHoro.getMinuteOfLattitude();
    String latNSFemale = mmFemaleHoro.getNorthSouth();
    String longDegFemale = mmFemaleHoro.getDegreeOfLongitude();
    String longMinFemale = mmFemaleHoro.getMinuteOfLongitude();
    String longEWFemale = mmFemaleHoro.getEastWest();
    String dstFemale = mmFemaleHoro.getDST();
    
%>

<h2 class="br-amber-b amber lighten-5 head-R">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="home.asp" %>" onclick="" class="matching_text">
  <%=nameFemaleProperCase %> <%=matchMakingOutputConstants.getString("KUNDLI_AND_FREE_REPORTS") %></a>  </h2>
  <form name="Female" method="post" action="createsession.asp">
  <ul class="default-ui-icon"> 
  <li class="makingDiv"> 
     <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="home.asp" %>" onclick="">
     <img id="tooltip16" src="images/icons/ic_female.png" title=""/></a> 
      <p> <%=nameFemaleProperCase %> <%=constKIHINDI %> <%=baseConstants.getString("KUNDLI") %> </p>
   </li>
                
   <li class="makingDiv"> <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="manglikdetails.asp" %>">
        <img id="tooltip7" src="images/icons/ic_mangal_dosh.png" alt="<%=NameofFemale[0] %>'s Manglik Considerations" title="" /></a> 
        <p> <%=constREADD %> <%=NameofFemale[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("MANGLIK_REPORT") %><%=constREADHINDI %> </p>
   </li>
   
 <li class="makingDiv"> <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="sadesatireport.asp" %>">
      <img id="tooltip8" src="images/icons/shani-sade-sati-report.png" title=""></a> 
      <p> <%=constREADD %> <%=NameofFemale[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("SANI_REPORT") %><%=constREADHINDI %> </p>
 </li>
                    
 <li class="makingDiv">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="love-horoscope.asp" %>">
       <img id="tooltip10" src="images/icons/ic_weekly_love.png" title=""></a> 
       <p> <%=constREADD %> <%=NameofFemale[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("LOVE_REPORT") %><%=constREADHINDI %> </p>
 </li>
  
  <li class="makingDiv">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="gemstones-report.asp" %>">
        <img id="tooltip11" src="images/icons/ic_gemstone.png" title=""></a>
        <p> <%=constREADD %> <%=NameofFemale[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("GEMSTONE_REPORT") %><%=constREADHINDI %> </p>
  </li>
 
 <li class="makingDiv">  
 <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="dasha_phala.asp" %>">
 <img id="tooltip12" src="images/icons/dashaphal.png" title=""></a> 
 <p> <%=constREADD %> <%=NameofFemale[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("DASHA_PREDICTION_REPORT") %><%=constREADHINDI %> </p>
 
 </li>
 
 <li class="makingDiv">  <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="lalkitab-prediction.asp" %>">
 <img id="tooltip13" src="images/icons/ic_lalkitab.png" title=""></a>
 <p> <%=constREADD %> <%=NameofFemale[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("LAl_KITAB_PREDICTION") %><%=constREADHINDI %> </p>
 </li>
  
  <li class="makingDiv"> <a href="/cloud/ChartServlet?methodName=createsessionOfMatchmaking&name=<%=nameFemaleTrim %>&place=<%=a_place1[0] %>&timezone=<%=timezoneFemale %>&sex=<%=sexFemale %>&sec=<%=secFemaleTrim %>&min=<%=minFemale %>&hrs=<%=hrsFemale %>&day=<%=dayFemale %>&month=<%=monthFemale %>&year=<%=yearFemale %>&latdeg=<%=latDegFemale %>&longdeg=<%=longDegFemale %>&latmin=<%=latMinFemale %>&longmin=<%=longMinFemale %>&longew=<%=longEWFemale %>&latns=<%=latNSFemale %>&dst=<%=dstFemale %>&languagecode=<%=mmLanguageCode %>&ayanamsa=<%="0" %>&kphn=<%="0" %>&charting=<%="0" %>&referrer=<%="varshphalallpages.asp" %>">
  <img id="tooltip14" src="images/icons/year-analysis.png" title=""></a> 
  <p> <%=constREADD %> <%=NameofFemale[0] %> <%=constKIHINDI %> <%=matchMakingOutputConstants.getString("YEARLY_REPORT") %><%=constREADHINDI %> </p>
  
  </li>
  </ul>
  
  <input type='hidden' name='name' value='<%=nameFemale %>' />
    <input type='hidden' name='place' value='<%=a_place1[0] %>' />
    <input type='hidden' name='timezone' value='<%=timezoneFemale %>' />
    <input type='hidden' name='sex' value='<%=sexFemale %>' />
    <input type='hidden' name='sec' value='<%=secFemaleTrim %>' />
    <input type='hidden' name='min' value='<%=minFemale %>' />
    <input type='hidden' name='hrs' value='<%=hrsFemale %>' />
    <input type='hidden' name='day' value='<%=dayFemale %>' />
    <input type='hidden' name='month' value='<%=monthFemale %>' />
    <input type='hidden' name='Year' value='<%=yearFemale %>' />
    <input type='hidden' name='latdeg' value='<%=latDegFemale %>' />
    <input type='hidden' name='longdeg' value='<%=longDegFemale %>' />
    <input type='hidden' name='latmin' value='<%=latMinFemale %>' />
    <input type='hidden' name='longmin' value='<%=longMinFemale %>' />
    <input type='hidden' name='longew' value='<%=longEWFemale %>' />
    <input type='hidden' name='latns' value='<%=latNSFemale %>' />
    <input type='hidden' name='dst' value='<%=dstFemale %>' />
    <input type='hidden' name='languagecode' value='<%=mmLanguageCode %>' />
    <input type='hidden' name='ayanamsa' value='0' />
    <input type='hidden' name='kphn' value='0' />
    <input type='hidden' name='charting' value='0' />
    </form>
</div>
</div>
</div>

<div class="row matchMakingDiv"> 
<div class="col s12 l12">
<div class="card hdg-lg1">
<h2 class="br-amber-b amber lighten-5 head-R"> <%=baseConstants.getString("ACTION")%> </h2>
<ul class="code-ui"> 
<li class="makingDiv"> <img src="images/icons/action-icon.png" class="pull-left" />
                <a href="matchmaking.asp" class="goback-text" title="Match another kundli"></a><a
                    href="matchmaking.asp" style="vertical-align: middle;">
                    <div class="goback-text">
                        <b>
                            <%=matchMakingOutputConstants.getString("MATCH_ANOTHER_KUNDALI")%>
                        </b>
                    </div>
                    <div style="clear: both">
                    </div>
                </a> </li>
                
                <li class="makingDiv"><img src="images/icons/pdf-icon.png" class="pull-left" />
                <form name="matchmaking_form" method="get" action="">
                <a  target="_blank" name="GunaMilan" title="Download Guna Milan (Horoscope Matching) Report in PDF"
                           onclick="_gaq.push(['_trackEvent', 'links','match_report_freekundali']);" href="http://pdf.astrosage.com/MatchMakingPdf.aspx?BoyName=<%=nameBoyTrim%>&BoyDay=<%=dayMale%>&BoyMonth=<%=monthMale%>&BoyYear=<%=yearMale%>&BoyHrs=<%=hrsMale%>&BoyMin=<%=minMale%>&BoySec=<%=mmMaleHoro.getSecondOfBirth()%>&BoyPlace=<%=mmMaleHoro.getPlace()%>&BoyTimeZone=<%=timezoneMale%>&BoyLongDeg=<%=longDegMale%>&BoyLongMin=<%=longMinMale%>&BoyLongEW=<%=longEWMale%>&BoyLatDeg=<%=latDegMale%>&BoyLatMin=<%=latMinMale%>&BoyLatNS=<%=latNSMale%>&BoyDst=<%=dstMale%>&BoyRasiNumber=<%=maleRasiNumber%>&DegOfBoy=<%=degOfBoy%>&GirlName=<%=nameFemale%>&GirlDay=<%=dayFemale%>&GirlMonth=<%=monthFemale%>&GirlYear=<%=yearFemale%>&GirlHrs=<%=hrsFemale%>&GirlMin=<%=minFemale%>&GirlSec=<%=mmFemaleHoro.getSecondOfBirth()%>&GirlPlace=<%=mmFemaleHoro.getPlace()%>&GirlTimeZone=<%=timezoneFemale%>&GirlLongDeg=<%=longDegFemale%>&GirlLongMin=<%=longMinFemale%>&GirlLongEW=<%=longEWFemale%>&GirlLatDeg=<%=latDegFemale%>&GirlLatMin=<%=latMinFemale%>&GirlLatNS=<%=latNSFemale%>&GirlDst=0&GirlRasiNumber=<%=femaleRasiNumber%>&DegOfGirl=<%=degOfGirl%>&LanguageCode=<%=setLangForPDF %>&ChartType=0&IsOpenChart=yes">
                    <div class="goback-text">
                        <b>
                            <%=matchMakingOutputConstants.getString("DOWNLOAD_MATCH_MAKING_PDF")%>
                        </b>
                    </div>
                    <div style="clear: both">
                    </div>
                     	<input type='hidden' name='BoyName' value='<%=nameMale%>' />
		                <input type='hidden' name='BoyDay' value='<%=dayMale%>' />
		                <input type='hidden' name='BoyMonth' value='<%=monthMale%>' />
		                <input type='hidden' name='BoyYear' value='<%=yearMale%>' />
		                <input type='hidden' name='BoyHrs' value='<%=hrsMale%>' />
		                <input type='hidden' name='BoyMin' value='<%=minMale%>' />
		                <input type='hidden' name='BoySec' value='<%=mmMaleHoro.getSecondOfBirth()%>' />
		                <input type='hidden' name='BoyPlace' value='<%=mmMaleHoro.getPlace()%>' />
		                <input type='hidden' name='BoyTimeZone' value='<%=timezoneMale%>' />
		                <input type='hidden' name='BoyLongDeg' value='<%=longDegMale%>' />
		                <input type='hidden' name='BoyLongMin' value='<%=longMinMale%>' />
		                <input type='hidden' name='BoyLongEW' value='<%=longEWMale%>' />
		                <input type='hidden' name='BoyLatDeg' value='<%=latDegMale%>' />
		                <input type='hidden' name='BoyLatMin' value='<%=latMinMale%>' />
		                <input type='hidden' name='BoyLatNS' value='<%=latNSMale%>' />
		                <input type='hidden' name='BoyDst' value='<%=dstMale%>' />
		                <input type='hidden' name='BoyRasiNumber' value='<%=maleRasiNumber%>' />
		                <input type='hidden' name='DegOfBoy' value='<%=degOfBoy%>' />
		                <input type='hidden' name='GirlName' value='<%=nameFemale%>' />
		                <input type='hidden' name='GirlDay' value='<%=dayFemale%>' />
		                <input type='hidden' name='GirlMonth' value='<%=monthFemale%>' />
		                <input type='hidden' name='GirlYear' value='<%=yearFemale%>' />
		                <input type='hidden' name='GirlHrs' value='<%=hrsFemale%>' />
		                <input type='hidden' name='GirlMin' value='<%=minFemale%>' />
		                <input type='hidden' name='GirlSec' value='<%=mmFemaleHoro.getSecondOfBirth()%>' />
		                <input type='hidden' name='Place_Girl' value='<%=mmFemaleHoro.getPlace()%>' />
		                <input type='hidden' name='GirlTimeZone' value='<%=timezoneFemale%>' />
		                <input type='hidden' name='GirlLongDeg' value='<%=longDegFemale%>' />
		                <input type='hidden' name='GirlLongMin' value='<%=longMinFemale%>' />
		                <input type='hidden' name='GirlLongEW' value='<%=longEWFemale%>' />
		                <input type='hidden' name='GirlLatDeg' value='<%=latDegFemale%>' />
		                <input type='hidden' name='GirlLatMin' value='<%=latMinFemale%>' />
		                <input type='hidden' name='GirlLatNS' value='<%=latNSFemale%>' />
		                <input type='hidden' name='GirlDst' value='<%=dstFemale%>' />
		                <input type='hidden' name='GirlRasiNumber' value='<%=femaleRasiNumber%>' />
		                <input type='hidden' name='DegOfGirl' value='<%=degOfGirl%>' />
                </a>
                </form> 
                </li>
                
                <li class="makingDiv"> 
                <a href="https://marriage.astrosage.com/?utm_source=onlinead&utm_medium=cloudmatching&utm_campaign=asmarriage" title="Join AstroSage Matrimony FREE" target="_blank">
	                <img src="images/report_icon/astrosage-marriage.png" class="pull-left" style="vertical-align: middle;" />
	                <div class="goback-text mrt-10">
	                 <b> <%=baseConstants.getString("JOIN_ASTROSAGE_MATRIMONY_FREE")%> </b>
	                </div>
	                <div style="clear: both"></div>
                </a> 
                </li>
</ul>
</div>
</div>
</div>

<div class="row"> 
<div class="col s12 l12">
<div class="card hdg-lg1 ui-paragraph-head">
<h2 class="br-amber-b amber lighten-5 head-R"> <%=matchMakingOutputConstants.getString("INTERPRETATION") %> </h2>

<div class="padding-all"> 

<h5>  <%arrHeading[4] = baseConstants.getString("RASI_LORD"); %></h5>
 <% for(int i=0;i<= 7;i++)
	{
 %>
 
 <h5>  <a name="<%=arrHeading[i]%>"></a> 
<%=arrHeading[i]%>
</h5>

<p> <%=arrInterpretation[i].replaceAll("`","'")%> </p>
 <% }}
}
catch(Exception e)
{
Util.getRequestObjectValue(request);
e.printStackTrace();
}
%>
</div>
</div>
</div>
</div>




<%!
public String getmangaldoshlevel(MyProperties baseConstants, boolean mangaldoshinlagnachart, boolean mangaldoshinmoonchart)
{
	String mangaldoshlevel = "";
    if(mangaldoshinlagnachart && mangaldoshinmoonchart )
    {
        mangaldoshlevel = baseConstants.getString("HIGH_FOR_MATCHMAKINGOUTPUT");
    }
    else if(mangaldoshinlagnachart && !mangaldoshinmoonchart)
    {
    	mangaldoshlevel = baseConstants.getString("LOW_FOR_MATCHMAKINGOUTPUT");
    }
    else if(!mangaldoshinlagnachart && mangaldoshinmoonchart)
    {
    	mangaldoshlevel = baseConstants.getString("LOW_FOR_MATCHMAKINGOUTPUT");
    }
    else
    {
    	mangaldoshlevel = baseConstants.getString("NO");
    }
   return mangaldoshlevel; 	
}
%>