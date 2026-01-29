
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Local local = new Local();
Hindi hindi = new Hindi();
int langCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBBabyname = local.loadPropertiesFileNew("babyname",langCode);
%>

<%! 
public String formatString(String strText )
{
	String formatString = "";
	formatString =  (strText.substring(0, 1)).toUpperCase() + strText.substring(1,strText.length()).toLowerCase();
	return formatString;
}

public String  numberToWord (int charanNumber)
{
	String numberToWord = "";
	
	switch(charanNumber) {
    case 1:
    	numberToWord = "first";
        break;
    case 2:
    	numberToWord = "second";
        break;
    case 3:
    	numberToWord = "third";
        break;
    case 4:
    	numberToWord = "fourth";
        break;
	}  
	return  numberToWord;
}
%>

<% 

DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");

if (langCode == 1)
{
    myAstrologyObject.setLanguageCode("1");
    myAstrologyObject.initialize();
}
 String rasiName, nakshatraName, sex;
 int nakshatraNumber, padaNumber;
 rasiName = myAstrologyObject.getRasiName();
 nakshatraName = myAstrologyObject.getNakshatraName();
 nakshatraNumber = myAstrologyObject.getNakshatra();
 padaNumber      = myAstrologyObject.getPadaOfPlanet(2)-1;
 sex             = (myAstrologyObject.getMaleFemale().substring(0,1)).toUpperCase();

 String[][] arrayNakshatra = new String[27][4];
 String[][] arrayNakshatraHindi = new String[27][4];
 String[][] alternativArrayNakshatra = new String[27][4];
 String[][] dontSearchNameArray = new String[27][4];

//*****************English words	
arrayNakshatra[0][0] = "Chu";
arrayNakshatra[0][1] = "Che";
arrayNakshatra[0][2] = "Cho";
arrayNakshatra[0][3] = "La";
arrayNakshatra[1][0] = "Li";
arrayNakshatra[1][1] = "Lu";
arrayNakshatra[1][2] = "Le";
arrayNakshatra[1][3] = "Lo";
arrayNakshatra[2][0] = "A";
arrayNakshatra[2][1] = "I";
arrayNakshatra[2][2] = "U";
arrayNakshatra[2][3] = "E";
arrayNakshatra[3][0] = "O";
arrayNakshatra[3][1] = "Va";
arrayNakshatra[3][2] = "Vi";
arrayNakshatra[3][3] = "Vu";
arrayNakshatra[4][0] = "Ve";
arrayNakshatra[4][1] = "Vo";
arrayNakshatra[4][2] = "Ka";
arrayNakshatra[4][3] = "Ki";
arrayNakshatra[5][0] = "Ku";
arrayNakshatra[5][1] = "Gha";
arrayNakshatra[5][2] = "Nga";
arrayNakshatra[5][3] = "Chha";
arrayNakshatra[6][0] = "Ke";
arrayNakshatra[6][1] = "Ko";
arrayNakshatra[6][2] = "Ha";
arrayNakshatra[6][3] = "Hi";
arrayNakshatra[7][0] = "Hu";
arrayNakshatra[7][1] = "He";
arrayNakshatra[7][2] = "Ho";
arrayNakshatra[7][3] = "Da";
arrayNakshatra[8][0] = "Di";
arrayNakshatra[8][1] = "Du";
arrayNakshatra[8][2] = "De";
arrayNakshatra[8][3] = "Do";
arrayNakshatra[9][0] = "Ma";
arrayNakshatra[9][1] = "Mi";
arrayNakshatra[9][2] = "Mu";
arrayNakshatra[9][3] = "Me";
arrayNakshatra[10][0] = "Mo";
arrayNakshatra[10][1] = "Ta";
arrayNakshatra[10][2] = "Ti";
arrayNakshatra[10][3] = "Tu";
arrayNakshatra[11][0] = "Te";
arrayNakshatra[11][1] = "To";
arrayNakshatra[11][2] = "Pa";
arrayNakshatra[11][3] = "Pi";
arrayNakshatra[12][0] = "Pu";
arrayNakshatra[12][1] = "Sha";
arrayNakshatra[12][2] = "Na";
arrayNakshatra[12][3] = "Tha";
arrayNakshatra[13][0] = "Pe";
arrayNakshatra[13][1] = "Po";
arrayNakshatra[13][2] = "Ra";
arrayNakshatra[13][3] = "Ri";
arrayNakshatra[14][0] = "Ru";
arrayNakshatra[14][1] = "Re";
arrayNakshatra[14][2] = "Ro";
arrayNakshatra[14][3] = "Ta";
arrayNakshatra[15][0] = "Tee";
arrayNakshatra[15][1] = "Tu";
arrayNakshatra[15][2] = "Te";
arrayNakshatra[15][3] = "To";
arrayNakshatra[16][0] = "Na";
arrayNakshatra[16][1] = "Ni";
arrayNakshatra[16][2] = "Nu";
arrayNakshatra[16][3] = "Ne";
arrayNakshatra[17][0] = "No";
arrayNakshatra[17][1] = "Ya";
arrayNakshatra[17][2] = "Yi";
arrayNakshatra[17][3] = "Yu";
arrayNakshatra[18][0] = "Ye";
arrayNakshatra[18][1] = "Yo";
arrayNakshatra[18][2] = "Bha";
arrayNakshatra[18][3] = "Bhi";
arrayNakshatra[19][0] = "Bhu";
arrayNakshatra[19][1] = "Dha";
arrayNakshatra[19][2] = "Pha";
arrayNakshatra[19][3] = "Rha";
arrayNakshatra[20][0] = "Bhe";
arrayNakshatra[20][1] = "Bho";
arrayNakshatra[20][2] = "Ja";
arrayNakshatra[20][3] = "Ji";
arrayNakshatra[21][0] = "Khee";
arrayNakshatra[21][1] = "Khu";
arrayNakshatra[21][2] = "Khe";
arrayNakshatra[21][3] = "Kho";
arrayNakshatra[22][0] = "Ga";
arrayNakshatra[22][1] = "Gi";
arrayNakshatra[22][2] = "Gu";
arrayNakshatra[22][3] = "Ge";
arrayNakshatra[23][0] = "Go";
arrayNakshatra[23][1] = "Sa";
arrayNakshatra[23][2] = "Si";
arrayNakshatra[23][3] = "Su";
arrayNakshatra[24][0] = "Se";
arrayNakshatra[24][1] = "So";
arrayNakshatra[24][2] = "Daa";
arrayNakshatra[24][3] = "Dai";
arrayNakshatra[25][0] = "Du";
arrayNakshatra[25][1] = "Tha";
arrayNakshatra[25][2] = "Jh";
arrayNakshatra[25][3] = "Nja";
arrayNakshatra[26][0] = "Dae";
arrayNakshatra[26][1] = "Dao";
arrayNakshatra[26][2] = "Cha";
arrayNakshatra[26][3] = "Chi";

//*****************Optional English words
alternativArrayNakshatra[0][0] = "Choo";
alternativArrayNakshatra[0][1] = "Chai";
alternativArrayNakshatra[0][2] = "Chau";
alternativArrayNakshatra[0][3] = "Laa";
alternativArrayNakshatra[1][0] = "Lee";
alternativArrayNakshatra[1][1] = "loo";
alternativArrayNakshatra[1][2] = "Lai";
alternativArrayNakshatra[1][3] = "Lau"; 
alternativArrayNakshatra[2][0] = "AA";
alternativArrayNakshatra[2][1] = "EE";
alternativArrayNakshatra[2][2] = "OO";
alternativArrayNakshatra[2][3] = "AI";
alternativArrayNakshatra[3][0] = "O";
alternativArrayNakshatra[3][1] = "Vaa";
alternativArrayNakshatra[3][2] = "Vee";
alternativArrayNakshatra[3][3] = "Voo";
alternativArrayNakshatra[4][0] = "Vai";
alternativArrayNakshatra[4][1] = "Vao";
alternativArrayNakshatra[4][2] = "Ka";
alternativArrayNakshatra[4][3] = "Kee";
alternativArrayNakshatra[5][0] = "Koo";
alternativArrayNakshatra[5][1] = "Ghaa";
alternativArrayNakshatra[5][2] = "Chh";
alternativArrayNakshatra[5][3] = "Chh";
alternativArrayNakshatra[6][0] = "Kae";
alternativArrayNakshatra[6][1] = "Kao";
alternativArrayNakshatra[6][2] = "Haa";
alternativArrayNakshatra[6][3] = "Hee";
alternativArrayNakshatra[7][0] = "Hoo";
alternativArrayNakshatra[7][1] = "He";
alternativArrayNakshatra[7][2] = "Hao";
alternativArrayNakshatra[7][3] = "Daa";
alternativArrayNakshatra[8][0] = "Dai";
alternativArrayNakshatra[8][1] = "Doo";
alternativArrayNakshatra[8][2] = "Dee";
alternativArrayNakshatra[8][3] = "Dau";
alternativArrayNakshatra[9][0] = "Ma"; 
alternativArrayNakshatra[9][1] = "Mee";
alternativArrayNakshatra[9][2] = "Moo"; 
alternativArrayNakshatra[9][3] = "Me";
alternativArrayNakshatra[10][0] = "Mao";
alternativArrayNakshatra[10][1] = "Taa";
alternativArrayNakshatra[10][2] = "Tee";
alternativArrayNakshatra[10][3] = "Too";
alternativArrayNakshatra[11][0] = "Te";
alternativArrayNakshatra[11][1] = "Teo";
alternativArrayNakshatra[11][2] = "Paa";
alternativArrayNakshatra[11][3] = "Pee";
alternativArrayNakshatra[12][0] = "Poo";
alternativArrayNakshatra[12][1] = "Sha";
alternativArrayNakshatra[12][2] = "Na";
alternativArrayNakshatra[12][3] = "Tha";
alternativArrayNakshatra[13][0] = "Pae";
alternativArrayNakshatra[13][1] = "Pao";
alternativArrayNakshatra[13][2] = "Ra";
alternativArrayNakshatra[13][3] = "Ree";
alternativArrayNakshatra[14][0] = "Roo";
alternativArrayNakshatra[14][1] = "Rae";
alternativArrayNakshatra[14][2] = "Rao";
alternativArrayNakshatra[14][3] = "Taa";
alternativArrayNakshatra[15][0] = "Ti";
alternativArrayNakshatra[15][1] = "Too";
alternativArrayNakshatra[15][2] = "Tae";
alternativArrayNakshatra[15][3] = "Tao";
alternativArrayNakshatra[16][0] = "Na";
alternativArrayNakshatra[16][1] = "Nee";
alternativArrayNakshatra[16][2] = "Noo";
alternativArrayNakshatra[16][3] = "Ne";
alternativArrayNakshatra[17][0] = "Nao";
alternativArrayNakshatra[17][1] = "Ya";
alternativArrayNakshatra[17][2] = "Yee";
alternativArrayNakshatra[17][3] = "Yoo";
alternativArrayNakshatra[18][0] = "Yae";
alternativArrayNakshatra[18][1] = "Yao";
alternativArrayNakshatra[18][2] = "Bha";
alternativArrayNakshatra[18][3] = "Bhee";
alternativArrayNakshatra[19][0] = "Bhoo";
alternativArrayNakshatra[19][1] = "Dha";
alternativArrayNakshatra[19][2] = "Pha";
alternativArrayNakshatra[19][3] = "Rha";
alternativArrayNakshatra[20][0] = "Bhe";
alternativArrayNakshatra[20][1] = "Bho";
alternativArrayNakshatra[20][2] = "Ja";
alternativArrayNakshatra[20][3] = "Jee";
alternativArrayNakshatra[21][0] = "Khi";
alternativArrayNakshatra[21][1] = "Khoo";
alternativArrayNakshatra[21][2] = "Khai";
alternativArrayNakshatra[21][3] = "Kho";
alternativArrayNakshatra[22][0] = "Ga";
alternativArrayNakshatra[22][1] = "Gee";
alternativArrayNakshatra[22][2] = "Goo";
alternativArrayNakshatra[22][3] = "Gay";
alternativArrayNakshatra[23][0] = "Go";
alternativArrayNakshatra[23][1] = "Sa";
alternativArrayNakshatra[23][2] = "See";
alternativArrayNakshatra[23][3] = "Soo";
alternativArrayNakshatra[24][0] = "sae";
alternativArrayNakshatra[24][1] = "So";
alternativArrayNakshatra[24][2] = "Daa";
alternativArrayNakshatra[24][3] = "Dee";
alternativArrayNakshatra[25][0] = "Doo";
alternativArrayNakshatra[25][1] = "Tha";
alternativArrayNakshatra[25][2] = "Jha";
alternativArrayNakshatra[25][3] = "Jha";
alternativArrayNakshatra[26][0] = "De";
alternativArrayNakshatra[26][1] = "Do";
alternativArrayNakshatra[26][2] = "Cha";
alternativArrayNakshatra[26][3] = "Chee";

//*****************Hindi words	
arrayNakshatraHindi[0][0] = "चू";
arrayNakshatraHindi[0][1] = "चे";
arrayNakshatraHindi[0][2] = "चो";
arrayNakshatraHindi[0][3] = "ला";
arrayNakshatraHindi[1][0] = "ली";
arrayNakshatraHindi[1][1] = "लू";
arrayNakshatraHindi[1][2] = "ले";
arrayNakshatraHindi[1][3] = "लो";
arrayNakshatraHindi[2][0] = "आ";
arrayNakshatraHindi[2][1] = "ई";
arrayNakshatraHindi[2][2] = "उ";
arrayNakshatraHindi[2][3] = "ऐ";
arrayNakshatraHindi[3][0] = "ओ";
arrayNakshatraHindi[3][1] = "वा";
arrayNakshatraHindi[3][2] = "वी";
arrayNakshatraHindi[3][3] = "वू";
arrayNakshatraHindi[4][0] = "वे";
arrayNakshatraHindi[4][1] = "वो";
arrayNakshatraHindi[4][2] = "का";
arrayNakshatraHindi[4][3] = "की";
arrayNakshatraHindi[5][0] = "कू";
arrayNakshatraHindi[5][1] = "घ";
arrayNakshatraHindi[5][2] = "ङ";
arrayNakshatraHindi[5][3] = "छ";
arrayNakshatraHindi[6][0] = "के";
arrayNakshatraHindi[6][1] = "को";
arrayNakshatraHindi[6][2] = "हा";
arrayNakshatraHindi[6][3] = "ही";
arrayNakshatraHindi[7][0] = "हू";
arrayNakshatraHindi[7][1] = "हे";
arrayNakshatraHindi[7][2] = "हो";
arrayNakshatraHindi[7][3] = "डा";
arrayNakshatraHindi[8][0] = "डी";
arrayNakshatraHindi[8][1] = "डू";
arrayNakshatraHindi[8][2] = "डे";
arrayNakshatraHindi[8][3] = "डो";
arrayNakshatraHindi[9][0] = "मा";
arrayNakshatraHindi[9][1] = "मी";
arrayNakshatraHindi[9][2] = "मू";
arrayNakshatraHindi[9][3] = "मे";
arrayNakshatraHindi[10][0] = "मो";
arrayNakshatraHindi[10][1] = "टा";
arrayNakshatraHindi[10][2] = "टी";
arrayNakshatraHindi[10][3] = "टू";
arrayNakshatraHindi[11][0] = "टे";
arrayNakshatraHindi[11][1] = "टो";
arrayNakshatraHindi[11][2] = "पा";
arrayNakshatraHindi[11][3] = "पी";
arrayNakshatraHindi[12][0] = "पू";
arrayNakshatraHindi[12][1] = "ष";
arrayNakshatraHindi[12][2] = "ण";
arrayNakshatraHindi[12][3] = "ठ";
arrayNakshatraHindi[13][0] = "पे";
arrayNakshatraHindi[13][1] = "पो";
arrayNakshatraHindi[13][2] = "रा";
arrayNakshatraHindi[13][3] = "री";
arrayNakshatraHindi[14][0] = "रू";
arrayNakshatraHindi[14][1] = "रे";
arrayNakshatraHindi[14][2] = "रो";
arrayNakshatraHindi[14][3] = "ता";
arrayNakshatraHindi[15][0] = "ती";
arrayNakshatraHindi[15][1] = "तू";
arrayNakshatraHindi[15][2] = "ते";
arrayNakshatraHindi[15][3] = "तो";
arrayNakshatraHindi[16][0] = "ना";
arrayNakshatraHindi[16][1] = "नी";
arrayNakshatraHindi[16][2] = "नू";
arrayNakshatraHindi[16][3] = "ने";
arrayNakshatraHindi[17][0] = "नो";
arrayNakshatraHindi[17][1] = "या";
arrayNakshatraHindi[17][2] = "यी";
arrayNakshatraHindi[17][3] = "यू";
arrayNakshatraHindi[18][0] = "ये";
arrayNakshatraHindi[18][1] = "यो";
arrayNakshatraHindi[18][2] = "भा";
arrayNakshatraHindi[18][3] = "भी";
arrayNakshatraHindi[19][0] = "भू";
arrayNakshatraHindi[19][1] = "धा";
arrayNakshatraHindi[19][2] = "फा";
arrayNakshatraHindi[19][3] = "ढा";
arrayNakshatraHindi[20][0] = "भे";
arrayNakshatraHindi[20][1] = "भो";
arrayNakshatraHindi[20][2] = "जा";
arrayNakshatraHindi[20][3] = "जी";
arrayNakshatraHindi[21][0] = "खी";
arrayNakshatraHindi[21][1] = "खू";
arrayNakshatraHindi[21][2] = "खे";
arrayNakshatraHindi[21][3] = "खो";
arrayNakshatraHindi[22][0] = "गा";
arrayNakshatraHindi[22][1] = "गी";
arrayNakshatraHindi[22][2] = "गू";
arrayNakshatraHindi[22][3] = "गे";
arrayNakshatraHindi[23][0] = "गो";
arrayNakshatraHindi[23][1] = "सा";
arrayNakshatraHindi[23][2] = "सी";
arrayNakshatraHindi[23][3] = "सू";
arrayNakshatraHindi[24][0] = "से";
arrayNakshatraHindi[24][1] = "सो";
arrayNakshatraHindi[24][2] = "दा";
arrayNakshatraHindi[24][3] = "दी";
arrayNakshatraHindi[25][0] = "दू";
arrayNakshatraHindi[25][1] = "थ";
arrayNakshatraHindi[25][2] = "झ";
arrayNakshatraHindi[25][3] = "झा";
arrayNakshatraHindi[26][0] = "दे";
arrayNakshatraHindi[26][1] = "दो";
arrayNakshatraHindi[26][2] = "चा";
arrayNakshatraHindi[26][3] = "ची";

//*****************Ignore case query	
dontSearchNameArray[0][0] = " ";
dontSearchNameArray[0][1] = "and name not like 'Chee%'";
dontSearchNameArray[0][2] = "and name not like 'Choo%'";
dontSearchNameArray[0][3] = "and name not like 'lai%' and name not like 'lau%' and name not like 'lae%' and name not like 'lao%'";
dontSearchNameArray[1][0] = "and name not like 'Lie%'";
dontSearchNameArray[1][1] = " ";
dontSearchNameArray[1][2] = "and name not like 'Lee%'";
dontSearchNameArray[1][3] = "and name not like 'Loo%'";
dontSearchNameArray[2][0] = "and name not like 'Ai%'  and name not like 'Au%' and name not like 'Ao%'";
dontSearchNameArray[2][1] = " ";
dontSearchNameArray[2][2] = " ";
dontSearchNameArray[2][3] = "and name not like 'OO%'";
dontSearchNameArray[3][0] = "and name not like 'OO%'";
dontSearchNameArray[3][1] = "and name not like 'Vai%'  and name not like 'Vao%' and name not like 'Vau%' and name not like 'Vae%'";
dontSearchNameArray[3][2] = "and name not like 'Vie%'";
dontSearchNameArray[3][3] = "and name not like 'Vuo%' and name not like 'Vuu%'";
dontSearchNameArray[4][0] = "and name not like 'Vee%'";
dontSearchNameArray[4][1] = "and name not like 'Voo%'";
dontSearchNameArray[4][2] = "and name not like 'kai%' and name not like 'Kao%' and name not like 'Kau'";
dontSearchNameArray[4][3] = " ";
dontSearchNameArray[5][0] = " ";
dontSearchNameArray[5][1] = " ";
dontSearchNameArray[5][2] = " ";
dontSearchNameArray[5][3] = "and name not like 'Chhae%' and name not like 'Chhai%' and name not like 'Chhao%' and name not like 'Chhau%'";
dontSearchNameArray[6][0] = "and name not like 'kee%'  and name not like 'kaee%'";
dontSearchNameArray[6][1] = " and name not like  'koo%'";
dontSearchNameArray[6][2] = "and name not like 'hai%' and name not like 'hau%' and name not like 'hae%' and name not like 'hao%'";
dontSearchNameArray[6][3] = " ";
dontSearchNameArray[7][0] = " ";
dontSearchNameArray[7][1] = " ";
dontSearchNameArray[7][2] = "and name not like 'hoo%'";
dontSearchNameArray[7][3] = "and name not like 'dai%' and name not like 'dau%' and name not like 'dao%' and name not like 'dae%'";
dontSearchNameArray[8][0] = " ";
dontSearchNameArray[8][1] = " ";
dontSearchNameArray[8][2] = " ";
dontSearchNameArray[8][3] = " and name not like 'doo%'";
dontSearchNameArray[9][0] = "and name not like 'mau%' and name not like 'mai%' and name not like 'mao%' and name not 'mae%'";
dontSearchNameArray[9][1] = " ";
dontSearchNameArray[9][2] = " ";
dontSearchNameArray[9][3] = " ";
dontSearchNameArray[10][0] = "and name not like 'Moo%'";
dontSearchNameArray[10][1] = "and name not like 'tai%' and name not like 'tau%' and name not like 'tae%' and name not like 'tao%'";
dontSearchNameArray[10][2] = " ";
dontSearchNameArray[10][3] = " ";
dontSearchNameArray[10][0] = "and name not like 'tee%' and name not like 'teo%'";
dontSearchNameArray[11][1] = "and name not like 'too%'";
dontSearchNameArray[11][2] = "and name not like 'pau%' and name not like 'pae%' and name not like 'pai%' and name not like 'pao%'";
dontSearchNameArray[11][3] = " ";
dontSearchNameArray[12][0] = " ";
dontSearchNameArray[12][1] = "and name not like 'shaa%'";
dontSearchNameArray[12][2] = " ";
dontSearchNameArray[12][3] = "and name not like 'thai%'  and name not like 'thae%' and name not like 'thao%'  and name not like 'thau%'";
dontSearchNameArray[13][0] = "and name not like 'pee%'";
dontSearchNameArray[13][1] = "and name not like 'poo%'"; 
dontSearchNameArray[13][2] = "and name not like 'rae%'  and name not like 'rai%'   and name not like 'rao%' and name not like 'rau%'";
dontSearchNameArray[13][3] = " ";
dontSearchNameArray[14][0] = " ";
dontSearchNameArray[14][1] = "and name not like 'ree%'";
dontSearchNameArray[14][2] = "and name not like 'roo%'";
dontSearchNameArray[14][3] = "and name not like 'tai%' and name not like 'tao%' and name not like 'tau' and name not like 'tae%'";
dontSearchNameArray[15][0] = " ";
dontSearchNameArray[15][1] = " ";
dontSearchNameArray[15][2] = "and name not like 'tee%'";
dontSearchNameArray[15][3] = "and name not like 'too%'";
dontSearchNameArray[16][0] = "and name not like 'nai%' and name not like 'nao%' and name not like 'nau%' and name not like 'nae%'";
dontSearchNameArray[16][1] = " ";
dontSearchNameArray[16][2] = " ";
dontSearchNameArray[16][3] = "and name not like 'nee%'";
dontSearchNameArray[17][0] = "and name not like 'noo%'";
dontSearchNameArray[17][1] = "and name not like 'yae%'  and name not like 'yai%'  and name not like 'yao%'  and name not like 'yau%'";
dontSearchNameArray[17][2] = " ";
dontSearchNameArray[17][3] = " ";
dontSearchNameArray[18][0] = "and name not like 'yee%'";
dontSearchNameArray[18][1] = "and name not like 'yoo%'";
dontSearchNameArray[18][2] = "and name not like 'Bhau%'";
dontSearchNameArray[18][3] = " ";
dontSearchNameArray[19][0] = " ";
dontSearchNameArray[19][1] = "and name not like 'dhau%'  and name not like 'dhao%'  and name not like 'dhae%'";
dontSearchNameArray[19][2] = "and name not like 'phau%'  and name not like 'phae%'  and name not like 'phai%'  and name not like 'phao%'";
dontSearchNameArray[19][3] = " ";
dontSearchNameArray[20][0] = "and name not like 'bhee%'";
dontSearchNameArray[20][1] = "and name not like 'bhoo%'";
dontSearchNameArray[20][2] = " ";
dontSearchNameArray[20][3] = " ";
dontSearchNameArray[21][0] = " ";
dontSearchNameArray[21][1] = " ";
dontSearchNameArray[21][2] = " ";
dontSearchNameArray[21][3] = "and name not like 'khoo%'";
dontSearchNameArray[22][0] = " ";
dontSearchNameArray[22][1] = " ";
dontSearchNameArray[22][2] = " ";
dontSearchNameArray[22][3] = "and name not like 'gee%'";
dontSearchNameArray[23][0] = " and name not like 'goo%'";
dontSearchNameArray[23][1] = " ";
dontSearchNameArray[23][2] = " ";
dontSearchNameArray[23][3] = "and name not like 'sui%'";
dontSearchNameArray[24][0] = " ";
dontSearchNameArray[24][1] = " ";
dontSearchNameArray[24][2] = " ";
dontSearchNameArray[24][3] = " ";
dontSearchNameArray[25][0] = " ";
dontSearchNameArray[25][1] = " ";
dontSearchNameArray[25][2] = "and name not like 'jhu%' and name not like 'jhi%' and name not like 'jho%'  and name not like 'jhe%'  and name not like 'jhee%'";
dontSearchNameArray[25][3] = " ";
dontSearchNameArray[26][0] = "and name not like 'dee%'";
dontSearchNameArray[26][1] = "and name not like 'doo%'";
dontSearchNameArray[26][2] = "and name not like 'chai%' and name not like 'chau%' and name not like 'chao%' and name not like 'chae%'";
dontSearchNameArray[26][3] = " ";

	for(int i = 0; i <= 26; i++)
	{
	    for(int j = 0; j <= 3; j++)
	    {
			arrayNakshatra[i][j] = (arrayNakshatra[i][j]).toLowerCase();
	    }
	}

%>

<%! 
public String firstLetterOfBabyName(int Nakshatra, int Charan, String arrayNakshatra[][])
{
	String firstLetterOfBabyName;
	firstLetterOfBabyName = arrayNakshatra[Nakshatra][Charan];
	return firstLetterOfBabyName;
}

public String firstLetterOfBabyNameHindi(int Nakshatra, int Charan, String arrayNakshatraHindi[][])
{
	String  FirstLetterOfBabyNameHindi;
	FirstLetterOfBabyNameHindi = arrayNakshatraHindi[Nakshatra][Charan];	
	return FirstLetterOfBabyNameHindi;
}
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("BABY_NAMES_SUGGESTION")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">
<p> <% String startingSwar = "";                 
if (langCode == 1) 
{
    startingSwar = firstLetterOfBabyNameHindi(nakshatraNumber,padaNumber,arrayNakshatraHindi);
}
 if (langCode == 0)
 {
	String  startchar, alternativStartChar;
    startchar = formatString(firstLetterOfBabyName(nakshatraNumber,padaNumber,arrayNakshatra));
    alternativStartChar = formatString(alternativArrayNakshatra[nakshatraNumber][padaNumber]);
    if (startchar.equals(alternativStartChar)) 
    {
      startingSwar = startchar;
    }		  
      else
      {
      startingSwar =  startchar +", "+ alternativStartChar;
      }
 }
 out.println(rBBabyname.getString("YOUR_RASHI_NAME_IS") + " " + "<b>" + hindi.unicode(rasiName,langCode) + "</b>" + rBBabyname.getString("DOT") + " " + rBBabyname.getString("YOUR_NAKSHATRA_NAME_IS") + " " + "<b>" + formatString(hindi.unicode(nakshatraName,langCode)) + "</b>" + " " + rBConstants.getString("HAI") + " "+ rBBabyname.getString("AND_YOU_ARE_BORN_IN")+ " "+"<b>" + rBBabyname.getString(numberToWord(myAstrologyObject.getPadaOfPlanet(2)).toUpperCase()+"_CHARAN") + "</b>"+" " + rBBabyname.getString("CHARAN_PADA_OF_THE_NAKSHATRA") + " " + rBBabyname.getString("BASED_ON_IT_ASTROSAGE_COM_OFFERS_FOLLOWING_SUGGESTIONS_FOR_NAME"));
 out.println ("<br/>" + rBBabyname.getString("FIRST_LETTER_OF_NAME_IN_ROMAN_ACCORDING_TO_YOUR_SIGN") + " " + "<b>" + startingSwar + "</b>");
 DatabaseUtils dBUtils = new DatabaseUtils();
 Connection connObj = null;
 Statement stm = null;
 ResultSet shmRsCity = null;
 String shmStrSql = "select * from babyname where (name like '" + firstLetterOfBabyName(nakshatraNumber,padaNumber,arrayNakshatra) + "%' or name like '" + alternativArrayNakshatra[nakshatraNumber][padaNumber] + "%') " +  dontSearchNameArray[nakshatraNumber][padaNumber] +  " AND MF like '" + sex + "%'";
 try
	{
	 connObj = dBUtils.getConnection();
  stm = connObj.createStatement();
  shmRsCity = stm.executeQuery(shmStrSql);

 if (!shmRsCity.next())
 {
 	out.println("<br/><b>" + rBBabyname.getString("NO_SUGGESTIONS_AVAILABLE") + "</b>");
 }
 else
 {
 %> </p>
</div>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>



                         <div class="row mrt-30 mrb-30">
                           <div class="col s12 l12 ui-btm ui-btm-zero">
                              <div class="card table-panel">
                              
                                <table class="highlight striped bordered ui-table ui-font">
                                 <tr class="amber lighten-5">
						<th class='cellhead'>
							<%=rBConstants.getString("NAM")%>
						</th>
						<th class='cellhead'>
							<%=rBBabyname.getString("MEANING")%>
						</th>
					</tr>
					<%
	do 
     { %>
					<tr>
						<td class='cellcontent'><%=formatString(shmRsCity.getString("name")) %>
						</td>
						<td class='cellcontent'><%=shmRsCity.getString("descrip")%>
						</td>
					</tr>
					<%
	}
	while(shmRsCity.next());
	%>
	
	<p>
					<b><%=rBConstants.getString("NOTE")%>:<%=rBBabyname.getString("THESE_ARE_JUST_APPROXIMATE_SUGGESTIONS_PLEASE_ENSURE_THAT_THE_NAME_SOUND_START_WITH_THE_FIRST_LETTER_GIVEN_ABOVE")%></b>
				</p> <%
}
}
	catch(SQLException ex)
	{
		//out.println(ex);
	}
	finally
	{
		dBUtils.closeConnection(connObj,stm,shmRsCity);
	}
%>
 
 
                                 
                                 </table>
                                 </div>
                                 </div>
                                 </div>
