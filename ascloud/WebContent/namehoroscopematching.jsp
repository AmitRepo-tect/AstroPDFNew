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
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


    <div class="ui-container ui-margin-tb">
        <div id="roundtopheadid">
            <div class="roundtophead">
                <div>
                    <div class="AscTopHead" style="text-align: left;">
                        <a href="//www.astrosage.com" title="Home" class="BreadCrumb">Home</a> &#187; <a href="//www.astrosage.com/compatibility/"
                            title="Compatibility" class="BreadCrumb">Compatibility</a> &#187; <a title="Name Kundli Match"
                                class="BreadCrumb">Name Kundli Match</a>
                    </div>
                </div>
            </div>
        </div>
        <%
        
        //Util.getRequestObjectValue(request);
        int intNakshatraBoy = 0;
        int intCharanBoy = 0;
        int intNakshatraGirl = 0;
        int intCharanGirl =0;
        int intForBoy=0;
        int intForGirl=0;
        
        EngHoro mmMaleHoro=new EngHoro();
        EngHoro mmFemaleHoro=new EngHoro();

        int mmLanguageCode =Util.safeInt(request.getParameter("languageCode"));

    	MatchMaking matchmaking = new MatchMaking();
           
           if(mmLanguageCode == 1)
           {
        	   matchmaking.setLanguageCode ("1");       
           }            

       // matchmaking.initializesArrayValues();      

           Constants ObjConst = new Constants();
           ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
           matchmaking.initializesArrayValues();      

        Local mmLocal = new Local();
        MyProperties baseConstants = new MyProperties(mmLocal.loadPropertiesFile("constants", mmLanguageCode));
        MyResourceBundle matchMakingOutputConstants = (MyResourceBundle) mmLocal.loadPropertiesFileNew("matchmakingoutput", mmLanguageCode);
        MyResourceBundle birthDetailsMMConstants = (MyResourceBundle) mmLocal.loadPropertiesFileNew("birthdetails-matchmakingoutput", mmLanguageCode);
        
        
        
    if (request.getParameter("btnSubmit") == "" && request.getParameter("nb") == "")
    	{
         response.sendRedirect("http://www.astrosage.com/namehoroscopematching.asp&isapi=1");
        %>
       <%
    	}
    else 
    	if (request.getParameter("nb")== null || request.getParameter("nb").equals("")) 
         {
    		//out.print("hii   ="+request.getParameter("nb"));
            String strBoyName="", strGirlName="";
            String ArrayNakshatra[][] =new String[27][78];
            String strBoyNakshatraResult="", strBoyCharanResult="", strGirlNakshatraResult="", strGirlCharanResult="";
            String aryBoyNakshatraResult[] = new String[20];
            String aryGirlNakshatraResult[]= new String[20];
            String aryBoyCharanResult[]= new String[20];
            String aryGirlCharanResult[]= new String[20];
            String[][] ArrayNakshatraHindi = new String[27][78];
            String[][] alternativArrayNakshatra = new String[27][4];
            String[][] dontSearchNameArray = new String[27][4];
            
            String strBoyOthersName="", strGirlOthersName="";
            String aryBoyOthersName[];
            String aryGirlOthersName[];
            
			strBoyName = request.getParameter("BoyName");
            strGirlName = request.getParameter("GirlName");
            
            session.setAttribute("BoyName",strBoyName);
            session.setAttribute("GirlName",strGirlName);
        
                
//*****************English words	
 //Some starting characters of the name
            ArrayNakshatra[0][0]  = "chu";
            ArrayNakshatra[0][1]  = "che";
            ArrayNakshatra[0][2]  = "cho";
            ArrayNakshatra[0][3]  = "la";
            ArrayNakshatra[0][4]  = "choo";
            ArrayNakshatra[0][5]  = "chai";
            ArrayNakshatra[0][6]  = "chau";
            ArrayNakshatra[0][7]  = "laa";
            
            ArrayNakshatraHindi[0][0]  = "चू";
            ArrayNakshatraHindi[0][1]  = "चे";
            ArrayNakshatraHindi[0][2]  = "चो";
            ArrayNakshatraHindi[0][3]  = "ल";
            ArrayNakshatraHindi[0][4]  = "चू";
            ArrayNakshatraHindi[0][5]  = "चै";
            ArrayNakshatraHindi[0][6]  = "चौ";
            ArrayNakshatraHindi[0][7]  = "ला";

            ArrayNakshatra[1][0]  = "li";
            ArrayNakshatra[1][1]  = "lu";
            ArrayNakshatra[1][2]  = "le";
            ArrayNakshatra[1][3]  = "lo";
            ArrayNakshatra[1][4]  = "lee";
            ArrayNakshatra[1][5]  = "loo";
            ArrayNakshatra[1][6]  = "lai";
            ArrayNakshatra[1][7]  = "lau";
            
            ArrayNakshatraHindi[1][0]  = "लि";
            ArrayNakshatraHindi[1][1]  = "लु";
            ArrayNakshatraHindi[1][2]  = "ले";
            ArrayNakshatraHindi[1][3]  = "लो";
            ArrayNakshatraHindi[1][4]  = "ली";
            ArrayNakshatraHindi[1][5]  = "लू";
            ArrayNakshatraHindi[1][6]  = "लै";
            ArrayNakshatraHindi[1][7]  = "लौ";

            ArrayNakshatra[2][0]  = "a";
            ArrayNakshatra[2][1]  = "i";
            ArrayNakshatra[2][2]  = "u";
            ArrayNakshatra[2][3]  = "e";
            ArrayNakshatra[2][4]  = "aa";
            ArrayNakshatra[2][5]  = "ee";
            ArrayNakshatra[2][6]  = "oo";
            ArrayNakshatra[2][7]  = "ai";
            
            ArrayNakshatraHindi[2][0]  = "अ";
            ArrayNakshatraHindi[2][1]  = "इ";
            ArrayNakshatraHindi[2][2]  = "उ";
            ArrayNakshatraHindi[2][3]  = "ए";
            ArrayNakshatraHindi[2][4]  = "आ";
            ArrayNakshatraHindi[2][5]  = "ई";
            ArrayNakshatraHindi[2][6]  = "ऊ";
            ArrayNakshatraHindi[2][7]  = "ऐ";

            ArrayNakshatra[3][0]  = "o";
            ArrayNakshatra[3][1]  = "va";
            ArrayNakshatra[3][2]  = "vi";
            ArrayNakshatra[3][3]  = "vu";
            ArrayNakshatra[3][4]  = "oh";
            ArrayNakshatra[3][5]  = "ba";
            ArrayNakshatra[3][6]  = "bi";
            ArrayNakshatra[3][7]  = "voo";
            
            ArrayNakshatraHindi[3][0]  = "ओ";
            ArrayNakshatraHindi[3][1]  = "व";
            ArrayNakshatraHindi[3][2]  = "वि";
            ArrayNakshatraHindi[3][3]  = "वु";
            ArrayNakshatraHindi[3][4]  = "ओ";
            ArrayNakshatraHindi[3][5]  = "ब";
            ArrayNakshatraHindi[3][6]  = "बि";
            ArrayNakshatraHindi[3][7]  = "वू";

            ArrayNakshatra[3][9]  = "bra";
            ArrayNakshatra[3][10]  = "bee";
            ArrayNakshatra[3][11]  = "bu";
            ArrayNakshatra[3][13]  = "brj";
            ArrayNakshatra[3][14]  = "bri";
            ArrayNakshatra[3][17]  = "bru";
            ArrayNakshatra[3][18]  = "vhi";
            ArrayNakshatra[3][21]  = "vra";
            ArrayNakshatra[3][22]  = "vri";
            ArrayNakshatra[3][25]  = "vru";
            ArrayNakshatra[3][29]  = "vy";
            ArrayNakshatra[3][33]  = "wa";

            ArrayNakshatraHindi[3][9]  = "ब्र";
            ArrayNakshatraHindi[3][10]  = "बी";
            ArrayNakshatraHindi[3][11]  = "बु";
            ArrayNakshatraHindi[3][13]  = "brj";
            ArrayNakshatraHindi[3][14]  = "ब्रि";
            ArrayNakshatraHindi[3][17]  = "ब्रु";
            ArrayNakshatraHindi[3][18]  = "vhi";
            ArrayNakshatraHindi[3][21]  = "व्र";
            ArrayNakshatraHindi[3][22]  = "व्रि";
            ArrayNakshatraHindi[3][25]  = "व्रु";
            ArrayNakshatraHindi[3][29]  = "व्य";
            ArrayNakshatraHindi[3][33]  = "व";

            ArrayNakshatra[4][0]  = "ve";
            ArrayNakshatra[4][1]  = "vo";
            ArrayNakshatra[4][2]  = "ka";
            ArrayNakshatra[4][3]  = "ki";
            ArrayNakshatra[4][4]  = "vai";
            ArrayNakshatra[4][5]  = "vau";
            ArrayNakshatra[4][6]  = "kaa";
            ArrayNakshatra[4][7]  = "kee";
            
            ArrayNakshatraHindi[4][0]  = "वे";
            ArrayNakshatraHindi[4][1]  = "वो";
            ArrayNakshatraHindi[4][2]  = "क";
            ArrayNakshatraHindi[4][3]  = "कि";
            ArrayNakshatraHindi[4][4]  = "वै";
            ArrayNakshatraHindi[4][5]  = "वौ";
            ArrayNakshatraHindi[4][6]  = "का";
            ArrayNakshatraHindi[4][7]  = "की";

            ArrayNakshatra[4][8]  = "be";
            ArrayNakshatra[4][9]  = "bo";
            ArrayNakshatra[4][10]  = "kma";
            ArrayNakshatra[4][11]  = "kri";
            ArrayNakshatra[4][13]  = "bou";
            ArrayNakshatra[4][14]  = "kraa";
            ArrayNakshatra[4][17]  = "vyo";
            ArrayNakshatra[4][18]  = "kra";
            ArrayNakshatra[4][22]  = "kru";
            ArrayNakshatra[4][26]  = "ksh";
            ArrayNakshatra[4][30]  = "kslss";
            ArrayNakshatra[4][34]  = "qu";

            ArrayNakshatraHindi[4][8]  = "बे";
            ArrayNakshatraHindi[4][9]  = "बो";
            ArrayNakshatraHindi[4][10]  = "क्म";
            ArrayNakshatraHindi[4][11]  = "कृ";
            ArrayNakshatraHindi[4][13]  = "बौ";
            ArrayNakshatraHindi[4][14]  = "क्रा";
            ArrayNakshatraHindi[4][17]  = "व्यो";
            ArrayNakshatraHindi[4][18]  = "क्र";
            ArrayNakshatraHindi[4][22]  = "कृ";
            ArrayNakshatraHindi[4][26]  = "क्ष";
            ArrayNakshatraHindi[4][30]  = "kslss";
            ArrayNakshatraHindi[4][34]  = "क़";

            ArrayNakshatra[5][0]  = "ku";
            ArrayNakshatra[5][1]  = "gha";
            ArrayNakshatra[5][2]  = "nga";
            ArrayNakshatra[5][3]  = "chha";
            ArrayNakshatra[5][4]  = "koo";
            ArrayNakshatra[5][5]  = "ghaa";
            ArrayNakshatra[5][6]  = "anga";
            ArrayNakshatra[5][7]  = "chh";
            
            ArrayNakshatraHindi[5][0]  = "कु";
            ArrayNakshatraHindi[5][1]  = "घ";
            ArrayNakshatraHindi[5][2]  = "ङ";
            ArrayNakshatraHindi[5][3]  = "छा";
            ArrayNakshatraHindi[5][4]  = "कू";
            ArrayNakshatraHindi[5][5]  = "घा";
            ArrayNakshatraHindi[5][6]  = "ङ";
            ArrayNakshatraHindi[5][7]  = "छ";

            ArrayNakshatra[5][9]  = "gho";
            ArrayNakshatra[5][13]  = "ghri";
            ArrayNakshatra[5][17]  = "ghru";
            ArrayNakshatra[5][21]  = "ghu";

            ArrayNakshatraHindi[5][9]  = "घो";
            ArrayNakshatraHindi[5][13]  = "घ्रि";
            ArrayNakshatraHindi[5][17]  = "घ्रु";
            ArrayNakshatraHindi[5][21]  = "घु";

            ArrayNakshatra[6][0]  = "ke";
            ArrayNakshatra[6][1]  = "ko";
            ArrayNakshatra[6][2]  = "ha";
            ArrayNakshatra[6][3]  = "hi";
            ArrayNakshatra[6][4]  = "kae";
            ArrayNakshatra[6][5]  = "kau";
            ArrayNakshatra[6][6]  = "haa";
            ArrayNakshatra[6][7]  = "hee";
            
            ArrayNakshatraHindi[6][0]  = "के";
            ArrayNakshatraHindi[6][1]  = "को";
            ArrayNakshatraHindi[6][2]  = "ह";
            ArrayNakshatraHindi[6][3]  = "हि";
            ArrayNakshatraHindi[6][4]  = "कै";
            ArrayNakshatraHindi[6][5]  = "कौ";
            ArrayNakshatraHindi[6][6]  = "हा";
            ArrayNakshatraHindi[6][7]  = "ही";
        
            ArrayNakshatra[6][9]  = "kro";
            ArrayNakshatra[6][10]  = "hru";
            ArrayNakshatra[6][11]  = "hree";
            ArrayNakshatra[6][15]  = "hri";

            ArrayNakshatraHindi[6][9]  = "क्रो";
            ArrayNakshatraHindi[6][10]  = "ह्रु";
            ArrayNakshatraHindi[6][11]  = "ह्री";
            ArrayNakshatraHindi[6][15]  = "ह्रि";

            ArrayNakshatra[7][0]  = "hu";
            ArrayNakshatra[7][1]  = "he";
            ArrayNakshatra[7][2]  = "ho";
            ArrayNakshatra[7][3]  = "da";
            ArrayNakshatra[7][4]  = "hoo";
            ArrayNakshatra[7][5]  = "hae";
            ArrayNakshatra[7][6]  = "hau";
            ArrayNakshatra[7][7]  = "daa";
            
            ArrayNakshatraHindi[7][0]  = "हु";
            ArrayNakshatraHindi[7][1]  = "हे";
            ArrayNakshatraHindi[7][2]  = "हो";
            ArrayNakshatraHindi[7][3]  = "ड";
            ArrayNakshatraHindi[7][4]  = "हू";
            ArrayNakshatraHindi[7][5]  = "है";
            ArrayNakshatraHindi[7][6]  = "हौ";
            ArrayNakshatraHindi[7][7]  = "डा";

            ArrayNakshatra[8][0]  = "di";
            ArrayNakshatra[8][1]  = "du";
            ArrayNakshatra[8][2]  = "de";
            ArrayNakshatra[8][3]  = "do";
            ArrayNakshatra[8][4]  = "dee";
            ArrayNakshatra[8][5]  = "doo";
            ArrayNakshatra[8][6]  = "dae";
            ArrayNakshatra[8][7]  = "dau";
            
            ArrayNakshatraHindi[8][0]  = "डि";
            ArrayNakshatraHindi[8][1]  = "डु";
            ArrayNakshatraHindi[8][2]  = "डे";
            ArrayNakshatraHindi[8][3]  = "डो";
            ArrayNakshatraHindi[8][4]  = "डी";
            ArrayNakshatraHindi[8][5]  = "डू";
            ArrayNakshatraHindi[8][6]  = "डै";
            ArrayNakshatraHindi[8][7]  = "डौ";

            ArrayNakshatra[9][0]  = "ma";
            ArrayNakshatra[9][1]  = "mi";
            ArrayNakshatra[9][2]  = "mu";
            ArrayNakshatra[9][3]  = "me";
            ArrayNakshatra[9][4]  = "maa";
            ArrayNakshatra[9][5]  = "mee";
            ArrayNakshatra[9][6]  = "moo";
            ArrayNakshatra[9][7]  = "mae";
            
            ArrayNakshatraHindi[9][0]  = "म";
            ArrayNakshatraHindi[9][1]  = "मि";
            ArrayNakshatraHindi[9][2]  = "मु";
            ArrayNakshatraHindi[9][3]  = "मे";
            ArrayNakshatraHindi[9][4]  = "मा";
            ArrayNakshatraHindi[9][5]  = "मी";
            ArrayNakshatraHindi[9][6]  = "मू";
            ArrayNakshatraHindi[9][7]  = "मै";


            ArrayNakshatra[9][8]  = "mru";
            ArrayNakshatra[9][9]  = "mri";

            ArrayNakshatraHindi[9][8]  = "म्रु";
            ArrayNakshatraHindi[9][9]  = "म्रि";

            ArrayNakshatra[10][0]  = "mo";
            ArrayNakshatra[10][1]  = "ta";
            ArrayNakshatra[10][2]  = "ti";
            ArrayNakshatra[10][3]  = "tu";
            ArrayNakshatra[10][4]  = "mau";
            ArrayNakshatra[10][5]  = "taa";
            ArrayNakshatra[10][6]  = "tee";
            ArrayNakshatra[10][7]  = "too";
            
            ArrayNakshatraHindi[10][0]  = "मो";
            ArrayNakshatraHindi[10][1]  = "ट";
            ArrayNakshatraHindi[10][2]  = "टि";
            ArrayNakshatraHindi[10][3]  = "टु";
            ArrayNakshatraHindi[10][4]  = "मौ";
            ArrayNakshatraHindi[10][5]  = "टा";
            ArrayNakshatraHindi[10][6]  = "टी";
            ArrayNakshatraHindi[10][7]  = "टू";

            ArrayNakshatra[11][0]  = "te";
            ArrayNakshatra[11][1]  = "to";
            ArrayNakshatra[11][2]  = "pa";
            ArrayNakshatra[11][3]  = "pi";
            ArrayNakshatra[11][4]  = "tae";
            ArrayNakshatra[11][5]  = "tau";
            ArrayNakshatra[11][6]  = "paa";
            ArrayNakshatra[11][7]  = "pee";
            
            ArrayNakshatraHindi[11][0]  = "टे";
            ArrayNakshatraHindi[11][1]  = "टो";
            ArrayNakshatraHindi[11][2]  = "प";
            ArrayNakshatraHindi[11][3]  = "पि";
            ArrayNakshatraHindi[11][4]  = "टै";
            ArrayNakshatraHindi[11][5]  = "टौ";
            ArrayNakshatraHindi[11][6]  = "पा";
            ArrayNakshatraHindi[11][7]  = "पी";
        
            ArrayNakshatra[11][10]  = "pra";
            ArrayNakshatra[11][14]  = "praa";
            ArrayNakshatra[11][18]  = "pree";
            ArrayNakshatra[11][22]  = "pri";
            ArrayNakshatra[11][26]  = "pya";

            ArrayNakshatraHindi[11][10]  = "प्र";
            ArrayNakshatraHindi[11][14]  = "प्रा";
            ArrayNakshatraHindi[11][18]  = "प्री";
            ArrayNakshatraHindi[11][22]  = "प्रि";
            ArrayNakshatraHindi[11][26]  = "प्य";

            ArrayNakshatra[12][0]  = "pu";
            ArrayNakshatra[12][1]  = "sha";
            ArrayNakshatra[12][2]  = "ana";
            ArrayNakshatra[12][3]  = "th";
            ArrayNakshatra[12][4]  = "poo";
            ArrayNakshatra[12][5]  = "sha";
            ArrayNakshatra[12][6]  = "anaa";
            ArrayNakshatra[12][7]  = "tha";
            
            ArrayNakshatraHindi[12][0]  = "पु";
            ArrayNakshatraHindi[12][1]  = "ष";
            ArrayNakshatraHindi[12][2]  = "ण";
            ArrayNakshatraHindi[12][3]  = "ठ";
            ArrayNakshatraHindi[12][4]  = "पू";
            ArrayNakshatraHindi[12][5]  = "षा";
            ArrayNakshatraHindi[12][6]  = "णा";
            ArrayNakshatraHindi[12][7]  = "ठा";

            ArrayNakshatra[13][0]  = "pe";
            ArrayNakshatra[13][1]  = "po";
            ArrayNakshatra[13][2]  = "ra";
            ArrayNakshatra[13][3]  = "ri";
            ArrayNakshatra[13][4]  = "pae";
            ArrayNakshatra[13][5]  = "pau";
            ArrayNakshatra[13][6]  = "raa";
            ArrayNakshatra[13][7]  = "ree";
            
            ArrayNakshatraHindi[13][0]  = "पे";
            ArrayNakshatraHindi[13][1]  = "पो";
            ArrayNakshatraHindi[13][2]  = "र";
            ArrayNakshatraHindi[13][3]  = "रि";
            ArrayNakshatraHindi[13][4]  = "पै";
            ArrayNakshatraHindi[13][5]  = "पौ";
            ArrayNakshatraHindi[13][6]  = "रा";
            ArrayNakshatraHindi[13][7]  = "री";

            ArrayNakshatra[13][8]  = "pre";
            ArrayNakshatra[13][12]  = "pru";

            ArrayNakshatraHindi[13][8]  = "प्रे";
            ArrayNakshatraHindi[13][12]  = "प्रु";

            ArrayNakshatra[14][0]  = "ru";
            ArrayNakshatra[14][1]  = "re";
            ArrayNakshatra[14][2]  = "ro";
            ArrayNakshatra[14][3]  = "ta";
            ArrayNakshatra[14][4]  = "roo";
            ArrayNakshatra[14][5]  = "rae";
            ArrayNakshatra[14][6]  = "rau";
            ArrayNakshatra[14][7]  = "taa";
            
            ArrayNakshatraHindi[14][0]  = "रु";
            ArrayNakshatraHindi[14][1]  = "रे";
            ArrayNakshatraHindi[14][2]  = "रो";
            ArrayNakshatraHindi[14][3]  = "त";
            ArrayNakshatraHindi[14][4]  = "रू";
            ArrayNakshatraHindi[14][5]  = "रै";
            ArrayNakshatraHindi[14][6]  = "रौ";
            ArrayNakshatraHindi[14][7]  = "ता";

            ArrayNakshatra[14][11]  = "tra";
            ArrayNakshatra[14][15]  = "tru";
            ArrayNakshatra[14][16]  = "tva";
            ArrayNakshatra[14][20]  = "twe";

            ArrayNakshatraHindi[14][11]  = "त्र";
            ArrayNakshatraHindi[14][15]  = "त्रु";
            ArrayNakshatraHindi[14][16]  = "त्व";
            ArrayNakshatraHindi[14][20]  = "त्वे";

            ArrayNakshatra[15][0]  = "tee";
            ArrayNakshatra[15][1]  = "tu";
            ArrayNakshatra[15][2]  = "te";
            ArrayNakshatra[15][3]  = "to";
            ArrayNakshatra[15][4]  = "ti";
            ArrayNakshatra[15][5]  = "too";
            ArrayNakshatra[15][6]  = "tae";
            ArrayNakshatra[15][7]  = "tau";
            
            ArrayNakshatraHindi[15][0]  = "ती";
            ArrayNakshatraHindi[15][1]  = "तु";
            ArrayNakshatraHindi[15][2]  = "ते";
            ArrayNakshatraHindi[15][3]  = "तो";
            ArrayNakshatraHindi[15][4]  = "ति";
            ArrayNakshatraHindi[15][5]  = "तू";
            ArrayNakshatraHindi[15][6]  = "तै";
            ArrayNakshatraHindi[15][7]  = "तौ";

            ArrayNakshatra[15][8]  = "tri";
            ArrayNakshatra[15][10]  = "trai";
            ArrayNakshatra[15][12]  = "trri";
            ArrayNakshatra[15][16]  = "trya";
            ArrayNakshatra[15][20]  = "twi";
            ArrayNakshatra[15][24]  = "tya";

            ArrayNakshatraHindi[15][8]  = "त्रि";
            ArrayNakshatraHindi[15][10]  = "त्रै";
            ArrayNakshatraHindi[15][12]  = "त्रि";
            ArrayNakshatraHindi[15][16]  = "त्र्य";
            ArrayNakshatraHindi[15][20]  = "त्वि";
            ArrayNakshatraHindi[15][24]  = "त्य";

            ArrayNakshatra[16][0]  = "na";
            ArrayNakshatra[16][1]  = "ni";
            ArrayNakshatra[16][2]  = "nu";
            ArrayNakshatra[16][3]  = "ne";
            ArrayNakshatra[16][4]  = "naa";
            ArrayNakshatra[16][5]  = "nee";
            ArrayNakshatra[16][6]  = "noo";
            ArrayNakshatra[16][7]  = "nae";
            
            ArrayNakshatraHindi[16][0]  = "न";
            ArrayNakshatraHindi[16][1]  = "नि";
            ArrayNakshatraHindi[16][2]  = "नु";
            ArrayNakshatraHindi[16][3]  = "ने";
            ArrayNakshatraHindi[16][4]  = "ना";
            ArrayNakshatraHindi[16][5]  = "नी";
            ArrayNakshatraHindi[16][6]  = "नू";
            ArrayNakshatraHindi[16][7]  = "नै";

            ArrayNakshatra[16][8]  = "nru";
            ArrayNakshatra[16][9]  = "nri";
            ArrayNakshatra[16][12]  = "nyaa";
            ArrayNakshatra[16][16]  = "nya";

            ArrayNakshatraHindi[16][8]  = "न्रु";
            ArrayNakshatraHindi[16][9]  = "न्रि";
            ArrayNakshatraHindi[16][12]  = "न्या";
            ArrayNakshatraHindi[16][16]  = "न्य";

            ArrayNakshatra[17][0]  = "no";
            ArrayNakshatra[17][1]  = "ya";
            ArrayNakshatra[17][2]  = "yi";
            ArrayNakshatra[17][3]  = "yu";
            ArrayNakshatra[17][4]  = "nau";
            ArrayNakshatra[17][5]  = "yaa";
            ArrayNakshatra[17][6]  = "yee";
            ArrayNakshatra[17][7]  = "yoo";
            
            ArrayNakshatraHindi[17][0]  = "नो";
            ArrayNakshatraHindi[17][1]  = "य";
            ArrayNakshatraHindi[17][2]  = "यि";
            ArrayNakshatraHindi[17][3]  = "यु";
            ArrayNakshatraHindi[17][4]  = "नौ";
            ArrayNakshatraHindi[17][5]  = "या";
            ArrayNakshatraHindi[17][6]  = "यी";
            ArrayNakshatraHindi[17][7]  = "यू";
            
            ArrayNakshatra[18][0]  = "ye";
            ArrayNakshatra[18][1]  = "yo";
            ArrayNakshatra[18][2]  = "bha";
            ArrayNakshatra[18][3]  = "bhi";
            ArrayNakshatra[18][4]  = "yae";
            ArrayNakshatra[18][5]  = "yau";
            ArrayNakshatra[18][6]  = "bhaa";
            ArrayNakshatra[18][7]  = "bhee";

            ArrayNakshatraHindi[18][0]  = "ये";
            ArrayNakshatraHindi[18][1]  = "यो";
            ArrayNakshatraHindi[18][2]  = "भ";
            ArrayNakshatraHindi[18][3]  = "भि";
            ArrayNakshatraHindi[18][4]  = "यै";
            ArrayNakshatraHindi[18][5]  = "यौ";
            ArrayNakshatraHindi[18][6]  = "भा";
            ArrayNakshatraHindi[18][7]  = "भी";
        
            ArrayNakshatra[18][10]  = "bhr";

            ArrayNakshatraHindi[18][10]  = "भ्र";

            ArrayNakshatra[19][0]  = "bhu";
            ArrayNakshatra[19][1]  = "dha";
            ArrayNakshatra[19][2]  = "pha";
            ArrayNakshatra[19][3]  = "rha";
            ArrayNakshatra[19][4]  = "bhoo";
            ArrayNakshatra[19][5]  = "dhaa";
            ArrayNakshatra[19][6]  = "fa";
            ArrayNakshatra[19][7]  = "rhaa";
            
            ArrayNakshatraHindi[19][0]  = "भु";
            ArrayNakshatraHindi[19][1]  = "ध";
            ArrayNakshatraHindi[19][2]  = "फ";
            ArrayNakshatraHindi[19][3]  = "ढ";
            ArrayNakshatraHindi[19][4]  = "भू";
            ArrayNakshatraHindi[19][5]  = "धा";
            ArrayNakshatraHindi[19][6]  = "फा";
            ArrayNakshatraHindi[19][7]  = "ढा";

            ArrayNakshatra[19][9]  = "dhee";
            ArrayNakshatra[19][10]  = "fi";
            ArrayNakshatra[19][13]  = "dhi";
            ArrayNakshatra[19][14]  = "foo";
            ArrayNakshatra[19][17]  = "dhoo";
            ArrayNakshatra[19][18]  = "fu";
            ArrayNakshatra[19][21]  = "dhri";
            ArrayNakshatra[19][22]  = "phe";
            ArrayNakshatra[19][25]  = "dhru";
            ArrayNakshatra[19][26]  = "phi";
            ArrayNakshatra[19][29]  = "dhu";
            ArrayNakshatra[19][30]  = "phoo";
            ArrayNakshatra[19][33]  = "dhw";
            ArrayNakshatra[19][37]  = "dhy";

            ArrayNakshatraHindi[19][9]  = "धी";
            ArrayNakshatraHindi[19][10]  = "फ़ि";
            ArrayNakshatraHindi[19][13]  = "धि";
            ArrayNakshatraHindi[19][14]  = "फ़ू";
            ArrayNakshatraHindi[19][17]  = "धू";
            ArrayNakshatraHindi[19][18]  = "फ़ु";
            ArrayNakshatraHindi[19][21]  = "ध्रि";
            ArrayNakshatraHindi[19][22]  = "फे";
            ArrayNakshatraHindi[19][25]  = "ध्रु";
            ArrayNakshatraHindi[19][26]  = "फि";
            ArrayNakshatraHindi[19][29]  = "धु";
            ArrayNakshatraHindi[19][30]  = "फू";
            ArrayNakshatraHindi[19][33]  = "ध्व";
            ArrayNakshatraHindi[19][37]  = "ध्य";

            ArrayNakshatra[20][0]  = "bhe";
            ArrayNakshatra[20][1]  = "bho";
            ArrayNakshatra[20][2]  = "ja";
            ArrayNakshatra[20][3]  = "ji";
            ArrayNakshatra[20][4]  = "bhae";
            ArrayNakshatra[20][5]  = "bhao";
            ArrayNakshatra[20][6]  = "za";
            ArrayNakshatra[20][7]  = "jee";
            
            ArrayNakshatraHindi[20][0]  = "भे";
            ArrayNakshatraHindi[20][1]  = "भो";
            ArrayNakshatraHindi[20][2]  = "ज";
            ArrayNakshatraHindi[20][3]  = "जि";
            ArrayNakshatraHindi[20][4]  = "भै";
            ArrayNakshatraHindi[20][5]  = "भौ";
            ArrayNakshatraHindi[20][6]  = "ज़";
            ArrayNakshatraHindi[20][7]  = "जी";

            ArrayNakshatra[20][10]  = "je";
            ArrayNakshatra[20][11]  = "zee";
            ArrayNakshatra[20][14]  = "jnaa";
            ArrayNakshatra[20][15]  = "zi";
            ArrayNakshatra[20][18]  = "jna";
            ArrayNakshatra[20][22]  = "jne";
            ArrayNakshatra[20][26]  = "jnyaa";
            ArrayNakshatra[20][30]  = "jnya";
            ArrayNakshatra[20][34]  = "jo";
            ArrayNakshatra[20][38]  = "ju";
            ArrayNakshatra[20][42]  = "jwaa";
            ArrayNakshatra[20][46]  = "jwa";
            ArrayNakshatra[20][50]  = "jye";
            ArrayNakshatra[20][54]  = "jyo";
            ArrayNakshatra[20][58]  = "ze";
            ArrayNakshatra[20][62]  = "zo";
            ArrayNakshatra[20][66]  = "zu";

            ArrayNakshatraHindi[20][10]  = "जे";
            ArrayNakshatraHindi[20][11]  = "ज़ी";
            ArrayNakshatraHindi[20][14]  = "ज्ना";
            ArrayNakshatraHindi[20][15]  = "ज़ि";
            ArrayNakshatraHindi[20][18]  = "ज्न";
            ArrayNakshatraHindi[20][22]  = "ज्ने";
            ArrayNakshatraHindi[20][26]  = "ज्न्या";
            ArrayNakshatraHindi[20][30]  = "ज्न्य";
            ArrayNakshatraHindi[20][34]  = "जो";
            ArrayNakshatraHindi[20][38]  = "जु";
            ArrayNakshatraHindi[20][42]  = "ज्वा";
            ArrayNakshatraHindi[20][46]  = "ज्व";
            ArrayNakshatraHindi[20][50]  = "ज्ये";
            ArrayNakshatraHindi[20][54]  = "ज्यो";
            ArrayNakshatraHindi[20][58]  = "ज़े";
            ArrayNakshatraHindi[20][62]  = "ज़ो";
            ArrayNakshatraHindi[20][66]  = "ज़ु";

            ArrayNakshatra[21][0]  = "khee";
            ArrayNakshatra[21][1]  = "khu";
            ArrayNakshatra[21][2]  = "khe";
            ArrayNakshatra[21][3]  = "kho";
            ArrayNakshatra[21][4]  = "khi";
            ArrayNakshatra[21][5]  = "khoo";
            ArrayNakshatra[21][6]  = "khai";
            ArrayNakshatra[21][7]  = "khau";
            
            ArrayNakshatraHindi[21][0]  = "खी";
            ArrayNakshatraHindi[21][1]  = "खु";
            ArrayNakshatraHindi[21][2]  = "खे";
            ArrayNakshatraHindi[21][3]  = "खो";
            ArrayNakshatraHindi[21][4]  = "खि";
            ArrayNakshatraHindi[21][5]  = "खू";
            ArrayNakshatraHindi[21][6]  = "खै";
            ArrayNakshatraHindi[21][7]  = "खौ";
        
            ArrayNakshatra[21][10]  = "kha";
            ArrayNakshatra[21][14]  = "khyaa";
            ArrayNakshatra[21][18]  = "khya";

            ArrayNakshatraHindi[21][10]  = "ख";
            ArrayNakshatraHindi[21][14]  = "ख्या";
            ArrayNakshatraHindi[21][18]  = "ख्य";

            ArrayNakshatra[22][0]  = "ga";
            ArrayNakshatra[22][1]  = "gi";
            ArrayNakshatra[22][2]  = "gu";
            ArrayNakshatra[22][3]  = "ge";
            ArrayNakshatra[22][4]  = "gaa";
            ArrayNakshatra[22][5]  = "gee";
            ArrayNakshatra[22][6]  = "goo";
            ArrayNakshatra[22][7]  = "gay";
            
            ArrayNakshatraHindi[22][0]  = "ग";
            ArrayNakshatraHindi[22][1]  = "गि";
            ArrayNakshatraHindi[22][2]  = "गु";
            ArrayNakshatraHindi[22][3]  = "गे";
            ArrayNakshatraHindi[22][4]  = "गा";
            ArrayNakshatraHindi[22][5]  = "गी";
            ArrayNakshatraHindi[22][6]  = "गू";
            ArrayNakshatraHindi[22][7]  = "गै";

            ArrayNakshatra[22][8]  = "gnaa";
            ArrayNakshatra[22][9]  = "gree";
            ArrayNakshatra[22][12]  = "gnya";
            ArrayNakshatra[22][13]  = "gri";
            ArrayNakshatra[22][16]  = "graa";
            ArrayNakshatra[22][20]  = "gra";
            ArrayNakshatra[22][24]  = "gruh";
            ArrayNakshatra[22][28]  = "gnna";

            ArrayNakshatraHindi[22][8]  = "ग्ना";
            ArrayNakshatraHindi[22][9]  = "ग्री";
            ArrayNakshatraHindi[22][12]  = "ग्न";
            ArrayNakshatraHindi[22][13]  = "ग्रि";
            ArrayNakshatraHindi[22][16]  = "ग्रा";
            ArrayNakshatraHindi[22][20]  = "ग्र";
            ArrayNakshatraHindi[22][24]  = "ग्रुह";
            ArrayNakshatraHindi[22][28]  = "ग्न्ना";

            ArrayNakshatra[23][0]  = "go";
            ArrayNakshatra[23][1]  = "sa";
            ArrayNakshatra[23][2]  = "si";
            ArrayNakshatra[23][3]  = "su";
            ArrayNakshatra[23][4]  = "gau";
            ArrayNakshatra[23][5]  = "saa";
            ArrayNakshatra[23][6]  = "see";
            ArrayNakshatra[23][7]  = "soo";
            
            ArrayNakshatraHindi[23][0]  = "गो";
            ArrayNakshatraHindi[23][1]  = "स";
            ArrayNakshatraHindi[23][2]  = "सि";
            ArrayNakshatraHindi[23][3]  = "सु";
            ArrayNakshatraHindi[23][4]  = "गौ";
            ArrayNakshatraHindi[23][5]  = "सा";
            ArrayNakshatraHindi[23][6]  = "सी";
            ArrayNakshatraHindi[23][7]  = "सू";

            ArrayNakshatra[23][9]  = "she";
            ArrayNakshatra[23][10]  = "shee";
            ArrayNakshatra[23][13]  = "shla";
            ArrayNakshatra[23][14]  = "shei";
            ArrayNakshatra[23][17]  = "shra";
            ArrayNakshatra[23][18]  = "shi";
            ArrayNakshatra[23][21]  = "shru";
            ArrayNakshatra[23][22]  = "shli";
            ArrayNakshatra[23][25]  = "shu";
            ArrayNakshatra[23][26]  = "shree";
            ArrayNakshatra[23][29]  = "shve";
            ArrayNakshatra[23][30]  = "shri";
            ArrayNakshatra[23][33]  = "shw";
            ArrayNakshatra[23][37]  = "shy";
            ArrayNakshatra[23][41]  = "ska";
            ArrayNakshatra[23][45]  = "sm";
            ArrayNakshatra[23][49]  = "sn";
            ArrayNakshatra[23][53]  = "sp";
            ArrayNakshatra[23][57]  = "sr";
            ArrayNakshatra[23][61]  = "ss";
            ArrayNakshatra[23][65]  = "st";
            ArrayNakshatra[23][69]  = "sv";
            ArrayNakshatra[23][73]  = "sw";
            ArrayNakshatra[23][77]  = "sy";

            ArrayNakshatraHindi[23][9]  = "शे";
            ArrayNakshatraHindi[23][10]  = "शी";
            ArrayNakshatraHindi[23][13]  = "श्ल";
            ArrayNakshatraHindi[23][14]  = "शै";
            ArrayNakshatraHindi[23][17]  = "श्र";
            ArrayNakshatraHindi[23][18]  = "शि";
            ArrayNakshatraHindi[23][21]  = "श्रु";
            ArrayNakshatraHindi[23][22]  = "श्लि";
            ArrayNakshatraHindi[23][25]  = "शु";
            ArrayNakshatraHindi[23][26]  = "श्री";
            ArrayNakshatraHindi[23][29]  = "श्वे";
            ArrayNakshatraHindi[23][30]  = "श्रि";
            ArrayNakshatraHindi[23][33]  = "श्व";
            ArrayNakshatraHindi[23][37]  = "श्य";
            ArrayNakshatraHindi[23][41]  = "स्क";
            ArrayNakshatraHindi[23][45]  = "स्म";
            ArrayNakshatraHindi[23][49]  = "स्न";
            ArrayNakshatraHindi[23][53]  = "स्प";
            ArrayNakshatraHindi[23][57]  = "स्र";
            ArrayNakshatraHindi[23][61]  = "स्स";
            ArrayNakshatraHindi[23][65]  = "स्त";
            ArrayNakshatraHindi[23][69]  = "स्व";
            ArrayNakshatraHindi[23][73]  = "स्व";
            ArrayNakshatraHindi[23][77]  = "स्य";

            ArrayNakshatra[24][0]  = "se";
            ArrayNakshatra[24][1]  = "so";
            ArrayNakshatra[24][2]  = "da";
            ArrayNakshatra[24][3]  = "di";
            ArrayNakshatra[24][4]  = "sae";
            ArrayNakshatra[24][5]  = "sau";
            ArrayNakshatra[24][6]  = "daa";
            ArrayNakshatra[24][7]  = "dee";
            
            ArrayNakshatraHindi[24][0]  = "से";
            ArrayNakshatraHindi[24][1]  = "सो";
            ArrayNakshatraHindi[24][2]  = "द";
            ArrayNakshatraHindi[24][3]  = "दि";
            ArrayNakshatraHindi[24][4]  = "सै";
            ArrayNakshatraHindi[24][5]  = "सौ";
            ArrayNakshatraHindi[24][6]  = "दा";
            ArrayNakshatraHindi[24][7]  = "दी";

            ArrayNakshatra[24][8]  = "shre";
            ArrayNakshatra[24][9]  = "sho";
            ArrayNakshatra[24][10]  = "dra";
            ArrayNakshatra[24][11]  = "dri";
            ArrayNakshatra[24][13]  = "shoo";
            ArrayNakshatra[24][14]  = "dru";
            ArrayNakshatra[24][15]  = "dwi";
            ArrayNakshatra[24][17]  = "shou";
            ArrayNakshatra[24][18]  = "dwaa";
            ArrayNakshatra[24][19]  = "dyu";
            ArrayNakshatra[24][22]  = "dwai";

            ArrayNakshatraHindi[24][8]  = "श्रे";
            ArrayNakshatraHindi[24][9]  = "शो";
            ArrayNakshatraHindi[24][10]  = "द्र";
            ArrayNakshatraHindi[24][11]  = "द्रि";
            ArrayNakshatraHindi[24][13]  = "शू";
            ArrayNakshatraHindi[24][14]  = "द्रु";
            ArrayNakshatraHindi[24][15]  = "द्वि";
            ArrayNakshatraHindi[24][17]  = "शौ";
            ArrayNakshatraHindi[24][18]  = "द्वा";
            ArrayNakshatraHindi[24][19]  = "द्यु";
            ArrayNakshatraHindi[24][22]  = "द्वै";

            ArrayNakshatra[25][0]  = "du";
            ArrayNakshatra[25][1]  = "th";
            ArrayNakshatra[25][2]  = "jh";
            ArrayNakshatra[25][3]  = "nja";
            ArrayNakshatra[25][4]  = "doo";
            ArrayNakshatra[25][5]  = "tha";
            ArrayNakshatra[25][6]  = "jha";
            ArrayNakshatra[25][7]  = "nda";
            
            ArrayNakshatraHindi[25][0]  = "दु";
            ArrayNakshatraHindi[25][1]  = "थ";
            ArrayNakshatraHindi[25][2]  = "झ";
            ArrayNakshatraHindi[25][3]  = "ञ";
            ArrayNakshatraHindi[25][4]  = "दू";
            ArrayNakshatraHindi[25][5]  = "था";
            ArrayNakshatraHindi[25][6]  = "झा";
            ArrayNakshatraHindi[25][7]  = "ञ";

            ArrayNakshatra[26][0]  = "de";
            ArrayNakshatra[26][1]  = "do";
            ArrayNakshatra[26][2]  = "cha";
            ArrayNakshatra[26][3]  = "chi";
            ArrayNakshatra[26][4]  = "dae";
            ArrayNakshatra[26][5]  = "dau";
            ArrayNakshatra[26][6]  = "chaa";
            ArrayNakshatra[26][7]  = "chee";
            
            ArrayNakshatraHindi[26][0]  = "दे";
            ArrayNakshatraHindi[26][1]  = "दो";
            ArrayNakshatraHindi[26][2]  = "च";
            ArrayNakshatraHindi[26][3]  = "चि";
            ArrayNakshatraHindi[26][4]  = "दै";
            ArrayNakshatraHindi[26][5]  = "दौ";
            ArrayNakshatraHindi[26][6]  = "चा";
            ArrayNakshatraHindi[26][7]  = "ची";

            
            int intNakshatraBoy1=0, intCharanBoy1=0, intNakshatraGirl1=0, intCharanGirl1=0;
            int l = 0, k = 0;
           //Find all Nakshatra and Charan of the boy and girl
            for (int i = 0; i< 26;i++)
            {
               for(int j = 0; j<77; j++)
               {
                  // if(strBoyName.toLowerCase().indexOf(ArrayNakshatra[i][j].toLowerCase())==1)
                   //if(true)
                	   if(ArrayNakshatra[i][j]!=null){
                		 //  out.println(strBoyName+","+ArrayNakshatra[i][j]);
                	   //if(strBoyName.toLowerCase().contains(ArrayNakshatra[i][j].toLowerCase()))
                		  // if(strBoyName.toLowerCase().indexOf(ArrayNakshatra[i][j].toLowerCase())==0)
                if(strBoyName.toLowerCase().startsWith(ArrayNakshatra[i][j].toLowerCase()))
            	    {
                         
                		  // out.println(strBoyName+","+i);
                       strBoyNakshatraResult = strBoyNakshatraResult +i+"#";
                            
                            //'Boy's Charan
                        strBoyCharanResult = strBoyCharanResult +j+"#";
                            
                            //'Boy's Others Name
                        strBoyOthersName = strBoyOthersName + ArrayNakshatraHindi[i][j]+"#";
            	   }
            	  // if(strGirlName.toLowerCase().indexOf(ArrayNakshatra[i][j].toLowerCase())==1)
            		   //if(false)
            	// if(strGirlName.toLowerCase().contains(ArrayNakshatra[i][j].toLowerCase()))
            		  if(strGirlName.toLowerCase().startsWith(ArrayNakshatra[i][j].toLowerCase()))
            	   {
            		  // 'Girl's Nakshatra
                       strGirlNakshatraResult = strGirlNakshatraResult +i+"#";

                      // 'Girl's Charan
                       strGirlCharanResult = strGirlCharanResult +j+"#";
                       
                      // 'Girl's Others Name
                      //out.println(ArrayNakshatraHindi[i][j]);
                       strGirlOthersName = strGirlOthersName +""+ ArrayNakshatraHindi[i][j]+"#";
            	   }

                   }     
                }
           }
              
  //Find Nakshatra and Charan of the boy
            if (!strBoyNakshatraResult.equals(""))
            	{
                aryBoyNakshatraResult = strBoyNakshatraResult.split("#");
                aryBoyCharanResult = strBoyCharanResult.split("#");

                intNakshatraBoy = Integer.parseInt(aryBoyNakshatraResult[0]) + 1;
                
                 if(Integer.parseInt(aryBoyCharanResult[0]) > 3)
                	{
                    
                    intCharanBoy = (Integer.parseInt(aryBoyCharanResult[0])%4) + 1;
                	}
                else
                {
                    
                    intCharanBoy = Integer.parseInt(aryBoyCharanResult[0]) + 1;
                }
            	}
                
            else
            {
                intNakshatraBoy = 0;
                intCharanBoy = 0;
            }



            //Find Nakshatra and Charan of the girl
            if (!strGirlNakshatraResult.equals(""))
            {
                aryGirlNakshatraResult =  strGirlNakshatraResult.split("#");
                aryGirlCharanResult = strGirlCharanResult.split("#");
                intNakshatraGirl = Integer.parseInt(aryGirlNakshatraResult[0]) + 1;
                if (Integer.parseInt(aryGirlCharanResult[0]) > 3){ 
                   
                    intCharanGirl = (Integer.parseInt(aryGirlCharanResult[0]) % 4) + 1;
                }
                else
                {
                    intCharanGirl = Integer.parseInt(aryGirlCharanResult[0]) + 1;
                }
            }
            else
            {   
                intNakshatraGirl = 0;
                intCharanGirl = 0;
            }
		
            out.print("<h1 align='center'>"+ "Name Horoscope Matching Result" + "</h1>");
            out.print("<h2>" + "Matching between Mr. " + strBoyName+ " and Ms. " +strGirlName+ "</h2>");

            aryBoyOthersName  = strBoyOthersName.split("#");//   split(strBoyOthersName, "#")
            aryGirlOthersName = strGirlOthersName.split("#");

           // if (((0) > 1) || ((0) > 1))
        	   
        	 //  out.println(aryBoyOthersName.length);
        	   if((aryBoyOthersName.length > 1)|| (aryGirlOthersName.length > 1))
            {
                out.print("<p>&nbsp;If boy's swar doesn't start from " + aryBoyOthersName[0] + " or/and girl's swar doesn't start from " + aryGirlOthersName[0]+ " then ");
                
    %>
    <a id="aTag" href="javascript:toggleAndChangeText();">click here</a>. </p>
    <div id="divToToggle" style="display: none;">
        <%
           

                   
                    //out.println("<br/>"+aryBoyOthersName.length +","+aryGirlOthersName.length+"<br/>");
                    if ((aryBoyOthersName.length > 1) && (aryGirlOthersName.length>1))
                    	{
                        for (k = 0; k < aryBoyOthersName.length ; k++)
                        {
                            for (l = 0; l < aryGirlOthersName.length ; l++)
                            {
                            	//out.println("<br/>"+k+","+l+"<br/>");
                            	 if(k == 0 && l==0) {
                            	 
                            	 }
                            else{
                                intNakshatraBoy1 = Integer.parseInt(aryBoyNakshatraResult[k]) + 1;

                                if (Integer.parseInt(aryBoyCharanResult[k]) > 3)
                                {
                                    intCharanBoy1 = (Integer.parseInt(aryBoyCharanResult[k]) % 4) + 1;
                                }
                                else
                                {
                                    intCharanBoy1 = Integer.parseInt(aryBoyCharanResult[k]) + 1;
                                }

                                intNakshatraGirl1 = Integer.parseInt(aryGirlNakshatraResult[l]) + 1;

                                if (Integer.parseInt(aryGirlCharanResult[l]) > 3)
                                	{
                                    intCharanGirl1 = (Integer.parseInt(aryGirlCharanResult[l]) % 4) + 1;
                                	}
                                else
                                {
                                    intCharanGirl1 = Integer.parseInt(aryGirlCharanResult[l]) + 1;
                                }
                                
                                out.print("<p>&nbsp;If boy's name start from " + aryBoyOthersName[k] + " and girl's name start from " + aryGirlOthersName[l] + " then <a href=namehoroscopematching.asp?nb=" + intNakshatraBoy1+ "&cb=" + intCharanBoy1 + "&ng=" + intNakshatraGirl1 + "&cg=" + intCharanGirl1 + "&bn=" + aryBoyOthersName[k] + "&gn=" + aryGirlOthersName[l] + "&isapi=1>click here</a>.");
                            }
                            }
                        }
                    	}
    //this is comment by manoj after consulting with smriti mam beacuse asp page have some issue in this page   
   
     else if ((aryGirlOthersName.length) <= 1)
                    {
                        for (k = 1; k<=aryBoyOthersName.length-1; k++)
                        {
                        	 //for (int l = 1; l<=aryGirlOthersName.length-1; l++)
                            // {
                            
                            intNakshatraBoy1 = Integer.parseInt(aryBoyNakshatraResult[k]) + 1;

                            if (Integer.parseInt(aryBoyCharanResult[k]) > 3)
                            {
                                intCharanBoy1 = (Integer.parseInt(aryBoyCharanResult[k]) % 4) + 1;
                            }
                            else
                            {
                                intCharanBoy1 = Integer.parseInt(aryBoyCharanResult[k]) + 1;
                            }

                            intNakshatraGirl1 = Integer.parseInt(aryGirlNakshatraResult[0]) + 1;

                            if (Integer.parseInt(aryGirlCharanResult[0]) > 3)
                            	{
                                intCharanGirl1 = (Integer.parseInt(aryGirlCharanResult[0]) % 4) + 1;
                            	}
                            else
                            {
                                intCharanGirl1 = Integer.parseInt(aryGirlCharanResult[0]) + 1;
                            }
                            
                            out.print("<p>&nbsp;If boy's name start from " + aryBoyOthersName[k] + " and girl's name start from " + aryGirlOthersName[0] + " then <a href=namehoroscopematching.asp?nb=" + intNakshatraBoy1+ "&cb=" + intCharanBoy1 + "&ng=" +intNakshatraGirl1 + "&cg=" + intCharanGirl1 + "&bn=" + aryBoyOthersName[k] + "&gn=" + aryGirlOthersName[l] + "&isapi=1>click here</a>.");
                        }
                   // }
                    }
                    else if ((aryBoyOthersName.length) <= 1)
                    	{
                        for (l = 1; l<= aryGirlOthersName.length-1; l++)
                        {
                           
                            
                            intNakshatraBoy1 = Integer.parseInt(aryBoyNakshatraResult[0]) + 1;

                            if (Integer.parseInt(aryBoyCharanResult[0]) > 3 )
                            {
                                intCharanBoy1 = (Integer.parseInt(aryBoyCharanResult[0]) % 4) + 1;
                            }
                            else
                            {
                                intCharanBoy1 = Integer.parseInt(aryBoyCharanResult[0]) + 1;
                            }

                            intNakshatraGirl1 = Integer.parseInt(aryGirlNakshatraResult[l]) + 1;

                            if (Integer.parseInt(aryGirlCharanResult[l]) > 3 )
                            {
                                intCharanGirl1 = (Integer.parseInt(aryGirlCharanResult[l]) % 4) + 1;
                            }
                            else
                            {
                                intCharanGirl1 = Integer.parseInt(aryGirlCharanResult[l]) + 1;
                            }
                        

                            out.print("<p>&nbsp;If boy's name start from " + aryBoyOthersName[0] + " and girl's name start from " + aryGirlOthersName[l] + " then <a href=namehoroscopematching.asp?nb=" + intNakshatraBoy1+ "&cb=" + intCharanBoy1 + "&ng=" + intNakshatraGirl1 + "&cg=" + intCharanGirl1 + "&bn=" + aryBoyOthersName[k] + "&gn=" + aryGirlOthersName[l] + "&isapi=1>click here</a>.");
                        }
                    	}
   %>
  
        <div class="ui-clear">
        </div>
    </div>
    
    <%
            }
         }
        else
        {
         
        	 intNakshatraBoy = Integer.parseInt(Util.safestr(request.getParameter("nb")));
        	 intCharanBoy = Integer.parseInt(Util.safestr(request.getParameter("cb")));
        	 intNakshatraGirl =Integer.parseInt(Util.safestr(request.getParameter("ng")));
        	 intCharanGirl = Integer.parseInt(Util.safestr(request.getParameter("cg")));

            out.print("<h1 align='center'>"+ "Name Horoscope Matching Result" + "</h1>");
            
            out.print("<p>&nbsp;boy's swar start from " + request.getParameter("bn")+ " and girl's swar start from " + request.getParameter("gn") + "</p>");
            
        }
    
      String AryNakshatraName[]=new String[27];

        //'Name of Nakshatra
        AryNakshatraName[0] = "Aswini";
        AryNakshatraName[1] = "Bharani";
        AryNakshatraName[2] = "Krithika";
        AryNakshatraName[3] = "Rohini";
        AryNakshatraName[4] = "Mrigashiras";
        AryNakshatraName[5] = "Aardhra /Arudra (Telugu)";
        AryNakshatraName[6] = "Punarvasu";
        AryNakshatraName[7] = "Pushyami";
        AryNakshatraName[8] = "Ashlesha";
        AryNakshatraName[9] = "Magha/Makha";
        AryNakshatraName[10] = "P.Phalguni/ Poorva Phalguni/ Pubba (Telugu)";
        AryNakshatraName[11] = "U.Phalguni/ Uthraphalguni /Uttara (Telugu)";
        AryNakshatraName[12] = "Hastha";
        AryNakshatraName[13] = "Chitra";
        AryNakshatraName[14] = "Swaathi";
        AryNakshatraName[15] = "Vishaakha";
        AryNakshatraName[16] = "Anuraadha";
        AryNakshatraName[17] = "Jyeshta";
        AryNakshatraName[18] = "Moola";
        AryNakshatraName[19] = "P.Shada/Poorvashaada";
        AryNakshatraName[20] = "U.Shada/Uthrashaada";
        AryNakshatraName[21] = "Shraavan";
        AryNakshatraName[22] = "Dhanishta";
        AryNakshatraName[23] = "Shathabhisha";
        AryNakshatraName[24] = "P.Bhadra/Poorvabhadra";
        AryNakshatraName[25] = "U.Bhadra/Uthrabhadra";
        AryNakshatraName[26] = "Revathi";



//**********************************CODE TO GET RESULT OF MATCHMAKING****************
    /*Dim strString,myArray3(7),myArray4(7),myArray2(7),myArray1(12),arrHeading(7)
    Dim arrTara,totalGuna,k */
//**********************************calculate for Boy******************************
    //Dim nakshatraMale, maleRasiNumber  
    
    
   // int nakshatraMale = mmMaleHoro.getNakshatra();
  //  int nakshatraFemale = mmFemaleHoro.getNakshatra();
  //  out.println(nakshatraMale+","+nakshatraFemale+"<br/>");
//******************calculate for girl******************************************
    //Dim nakshatraFemale, femaleRasiNumber

    
      int  femaleRasiNumber = fnCalculateRasi(intNakshatraGirl, intCharanGirl);
      double degOfGirl = calculateDegree(intNakshatraGirl, intCharanGirl);

      int  maleRasiNumber = fnCalculateRasi(intNakshatraBoy, intCharanBoy);
      double degOfBoy = calculateDegree(intNakshatraBoy, intCharanBoy);
    
        //  out.println(intNakshatraGirl+","+intCharanGirl+"<br/>");
        //  out.println(intNakshatraBoy+","+intCharanBoy+"<br/>");
        //  out.println(degOfGirl+","+degOfBoy+"<br/>");
    
    String[] arrHeading = new String[8];
    //out.println(baseConstants.getString("VARNA"));
    arrHeading[0] = baseConstants.getString("VARNA").toUpperCase();
    arrHeading[1] = baseConstants.getString("VASYA").toUpperCase();
    arrHeading[2] = baseConstants.getString("TARAA").toUpperCase();
    arrHeading[3] = baseConstants.getString("YONI").toUpperCase();
    arrHeading[4] = baseConstants.getString("MAITRI").toUpperCase();
    arrHeading[5] = baseConstants.getString("GANA").toUpperCase();
    arrHeading[6] = baseConstants.getString("BHAKOOT").toUpperCase();
    arrHeading[7] = baseConstants.getString("NADI").toUpperCase();

    Hindi hindi =new Hindi();
    String[] myArray1 = new String[8];
    myArray1[0] = hindi.unicode(matchmaking.getVarna(maleRasiNumber), mmLanguageCode);
    myArray1[1] = hindi.unicode(matchmaking.getVashya(degOfBoy), mmLanguageCode);

    String[] arrTara = matchmaking.getTara(degOfBoy, degOfGirl);
    myArray1[2] = hindi.unicode(arrTara[0], mmLanguageCode);
    myArray1[3] = hindi.unicode(matchmaking.getYoni(degOfBoy), mmLanguageCode);
    myArray1[4] = hindi.unicode(matchmaking.getGraha(maleRasiNumber), mmLanguageCode);
    myArray1[5] = hindi.unicode(matchmaking.getGana(degOfBoy), mmLanguageCode);   
    myArray1[6] = GetrasiName(maleRasiNumber);//hindi.unicode(mmMaleHoro.getRasiName(), mmLanguageCode);
    myArray1[7] = hindi.unicode(matchmaking.getNadi(degOfBoy), mmLanguageCode);      
         
    String[] myArray2 = new String[8];
    myArray2[0] = hindi.unicode(matchmaking.getVarna(femaleRasiNumber), mmLanguageCode);
    myArray2[1] = hindi.unicode(matchmaking.getVashya(degOfGirl), mmLanguageCode);
    myArray2[2] = hindi.unicode(arrTara[1], mmLanguageCode);
    myArray2[3] = hindi.unicode(matchmaking.getYoni(degOfGirl), mmLanguageCode);
    myArray2[4] = hindi.unicode(matchmaking.getGraha(femaleRasiNumber), mmLanguageCode);
    myArray2[5] = hindi.unicode(matchmaking.getGana(degOfGirl), mmLanguageCode);
     //out.println(femaleRasiNumber);
    myArray2[6] = GetrasiName(femaleRasiNumber);//hindi.unicode(mmFemaleHoro.getRasiName(), mmLanguageCode);
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
    DecimalFormat df = new DecimalFormat("#.###");
    myArray4[0] = matchmaking.matchVarnaGuna(maleRasiNumber, femaleRasiNumber);
    myArray4[1] = matchmaking.matchVashyaGuna(degOfBoy, degOfGirl);
    myArray4[2] = matchmaking.matchTaraGuna(degOfBoy, degOfGirl);
    
    myArray4[3] = matchmaking.matchYoniGuna(degOfBoy, degOfGirl);
   // out.println(degOfBoy+","+degOfGirl+","+myArray4[3]);
    myArray4[4] = matchmaking.matchGrahaMitraGuna(maleRasiNumber, femaleRasiNumber);
    myArray4[5] = matchmaking.matchGanaGuna(degOfBoy, degOfGirl);
    myArray4[6] = matchmaking.matchBhakutGuna(maleRasiNumber, femaleRasiNumber);
    myArray4[7] = matchmaking.matchNadiGuna(degOfBoy, degOfGirl);     
    String[] arrAreaOfLife = new String[8];
  
    for(int i= 0;i<= 7;i++)
    {
        arrAreaOfLife[i] = hindi.unicode(matchmaking.getAreaOfLife(i+1), mmLanguageCode); 
    }
    double totalGuna = 0;
    
    %>

        <div class="table-responsive">
            <table class="table table-bordered" align="center">
                <thead>
                    <tr>
                        <th align="center" colspan="3">
                            Boy
                        </th>
                        <th align="center" colspan="3">
                            Girl
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>
                            Nakshatra
                        </th>
                        <th>
                            Charan
                        </th>
                        <th>
                            Rashi
                        </th>
                        <th>
                            Nakshatra
                        </th>
                        <th>
                            Charan
                        </th>
                        <th>
                            Rashi
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <%=AryNakshatraName[intNakshatraBoy -1]%>
                        </td>
                        <td>
                            <%= intCharanBoy%>
                        </td>
                        <td>
                            <%= GetrasiName(maleRasiNumber)%>
                        </td>
                        <td>
                            <%= AryNakshatraName[intNakshatraGirl -1 ]%>
                        </td>
                        <td>
                            <%= intCharanGirl%>
                        </td>
                        <td>
                            <%= GetrasiName(femaleRasiNumber)%>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
   
    <div id="contents">
        <h2 align="center">
            Guna Milan</h2>
        <div class="table-responsive">
            <table class="table table-bordered" align="center">
                <thead>
                    <tr>
                        <th>
                            Guna
                        </th>
                        <th>
                            Boy
                        </th>
                        <th>
                            Girl
                        </th>
                        <th>
                            Maximum Obtained
                        </th>
                        <th>
                            Obtained Point
                        </th>
                        <th>
                            Area Of Life
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for(int i=0 ;i<8; i++)
                    {
       
                    %>
                    <tr>
                        <td>
                            <a href="#<%=arrHeading[i]%>">
                                <%=arrHeading[i]%></a>
                        </td>
                        <td>
                            <%=myArray1[i].substring(0,1).toUpperCase()+myArray1[i].substring(1).toLowerCase()%>
                        </td>
                        <td>
                            <%=myArray2[i].substring(0,1).toUpperCase()+myArray2[i].substring(1).toLowerCase()%>
                        </td>
                        <td>
                            <%=myArray3[i]%>
                        </td>
                        <td>
                            <%=df.format(myArray4[i])%>
                        </td>
                        <td>
                            <%=arrAreaOfLife[i]%>
                        </td>
                    </tr>
                    <%
                    } //Next
                    %>
                </tbody>
            </table>
        </div>
    </div>
    
    <div style="height: 10px">
    <% 
    for(int k = 0; k<=7; k++)
    {
    totalGuna = totalGuna + myArray4[k];
   }
    
   boolean blnComp = false;
   boolean blnGunaMilan = false;
   String strConclusion= "";
   String boymangaldoshlevel ="" ;
   String girlmangaldoshlevel ="";
  // boolean mangaldoshinlagnachartboy = mmMaleHoro.isMangalDosh();
 //  boolean mangaldoshinmoonchartboy = mmMaleHoro.isMangalDoshForMoonChart();
  // boolean mangaldoshinlagnachartgirl = mmFemaleHoro.isMangalDosh();
  // boolean mangaldoshinmoonchartgirl = mmFemaleHoro.isMangalDoshForMoonChart();
  // String boymangaldoshlevel = getmangaldoshlevel(mangaldoshinlagnachartboy, mangaldoshinmoonchartboy);
  // String girlmangaldoshlevel = getmangaldoshlevel(mangaldoshinlagnachartgirl, mangaldoshinmoonchartgirl);
    if(calculateCompatibilityForMangalDosh(boymangaldoshlevel,girlmangaldoshlevel)){
            blnComp = true;
    } else{
            blnComp = false;
    }

        if(matchmaking.getTotal() >= 18){
            blnGunaMilan = true;
        }else{
            blnGunaMilan = false;
        }

        if(blnComp  && blnGunaMilan){
            strConclusion = "This Marriage is Preferable.";
        }else{
            if(blnComp && !blnGunaMilan ){
                strConclusion = "This marriage is NOT preferable due to low match points obtained.";
            }
            else if(!blnComp  && !blnGunaMilan){
                strConclusion = "This marriage is NOT preferable due to Mangal Dosha and low match points obtained.";
            } else if(!blnComp &&  blnGunaMilan ){
                strConclusion = "There is substantial difference in the level of Mangal Dosha compatibility of both the horoscopes." + " " + "It is advisable to consult a learned astrologer before proceeding to marriage.";
            }
        }
    %>
    
    </div>
    
   <h2 align="center">
        Ashtakoot Matching between boy and girl is :<%=df.format(totalGuna)%>/36</h2>
    <p align="center">
        <b align="center"><font color="red">
            CONCLUSION : </font></b>
           <%=strConclusion%></p>
    <div>
        <% 
//*********************CODE TO SET THE INTERPRETATION OF THE MATCHMAKING*****************************

	   
	    String  strCategory="";
	    String arrHeadings[]=new String[7];
	   

	    arrHeadings[0] = "VARNA";
	    arrHeadings[1] = "VASYA";
	    arrHeadings[2] = "TARAA";
	    arrHeadings[3] = "YONI";
	    arrHeadings[4] = "GANA";
	    arrHeadings[5] = "NADI";
	    arrHeadings[6] = "RASI LORD";
	    //arrHeadings[7] = "BHAKOOT";

	    
        //
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

   intForBoy = matchmaking.calculateGana(maleRasiNumber);
   intForGirl = matchmaking.calculateGana(femaleRasiNumber);
   arrInterpretation[4] = subGetMatchMakingInterpretation("GAN", intForBoy, intForGirl, mmLanguageCode);
    
   intForBoy = matchmaking.calculateGana(degOfBoy);
   intForGirl = matchmaking.calculateGana(degOfGirl);
   arrInterpretation[5] = subGetMatchMakingInterpretation("NA", intForBoy, intForGirl, mmLanguageCode);

   intForBoy = mmMaleHoro.getRasi();
   intForGirl = mmFemaleHoro.getRasi();
   
   arrInterpretation[6] = subGetMatchMakingInterpretation("RAS", intForBoy, intForGirl, mmLanguageCode); 
  
   intForBoy = matchmaking.calculateNadi(degOfBoy);
   intForGirl = matchmaking.calculateNadi(degOfGirl);
   arrInterpretation[7] = subGetMatchMakingInterpretation("BH", intForBoy, intForGirl, mmLanguageCode);
        // 
        
        
        %>
      
            <h2 align="center">
                <%="INTERPRETATION" %>
            </h2>
     
        <%
        for(int i = 0; i<7; i++)
        {
        %>
        <div class="ui-sub-heading">
                <h2>
                        <%if (i == 6){ %>
                        <a style="color: White;" name="MAITRI"></a>&nbsp;
                        <%} else{ %>
                        <a style="color: White;" name="<%=arrHeadings[i]%>"></a>&nbsp;
                        <%} %>
                        <%=arrHeadings[i]%></h2>
            </div>
<p>                    
                       <%=arrInterpretation[i].replace("`","'")%></p>

      
        <%
        }//  Next
        %>
        <div class="GPage">
            <div class="container">
                <div class="GPage-wide">
                    <div align="center" class="ui-container">
                        <div class="ui-inner-box">
                            <a href="http://www.astrosage.com/namehoroscopematching.asp"><span class="ui-inner-img">
                                <img src="/images/Arrow-back.png" /></span><span class="ui-inner-txt">Try
                                    Another Match</span></a>
                        </div>
                    </div>
                    <div style="height: 10px;">
                    </div>
                     <div class="row">
                        <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                            <a href="http://www.astrosage.com/zodiac/<%=GetrasiName(maleRasiNumber) %>-man.asp">
                                <div class="ui-inner-box">
                                    <span class="ui-inner-img">
                                        <img src="/images/boy-icon.png" alt="Read about <%=GetrasiName(maleRasiNumber) %> man" /></span>
                                    <span class="ui-inner-txt">
                                        <%=GetrasiName(maleRasiNumber) %>
                                        Man</span>
                                </div>
                            </a>
                        </div>
                        </div> 
                        <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                            <a href="http://www.astrosage.com/zodiac/<%=GetrasiName(femaleRasiNumber)%>-woman.asp">
                                <div class="ui-inner-box">
                                    <span class="ui-inner-img">
                                        <img src="/images/girl-icon.png" alt="Read about <%=GetrasiName(femaleRasiNumber)%> woman" /></span>
                                    <span class="ui-inner-txt">
                                        <%=GetrasiName(femaleRasiNumber) %>
                                        Woman </span>
                                </div>
                            </a>
                        </div>
                        </div>
                    
                        <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                            <a href="http://www.astrosage.com/zodiac/<%=GetrasiName(maleRasiNumber) %>-zodiac-sign.asp">
                                <div class="ui-inner-box">
                                    <span class="ui-inner-img">

                                        <img width="40" src="/images/sign/<%=GetrasiName(maleRasiNumber).toLowerCase()%>.png" alt="Read about <%=GetrasiName(maleRasiNumber) %>" /></span>

                                    <span class="ui-inner-txt">More about
                                        <%=GetrasiName(maleRasiNumber) %></span>
                                </div>
                            </a>
                        </div>
                        </div> 
                        <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                            <a href="http://www.astrosage.com/zodiac/<%=GetrasiName(femaleRasiNumber) %>-zodiac-sign.asp">
                                <div class="ui-inner-box">
                                    <span class="ui-inner-img">
                                        <img width="40" src="/images/sign/<%=GetrasiName(femaleRasiNumber).toLowerCase() %>.png"
                                            alt="Read about <%=GetrasiName(femaleRasiNumber) %>" /></span> <span class="ui-inner-txt">
                                                More about
                                                <%=GetrasiName(femaleRasiNumber) %></span>
                                </div>
                            </a>
                        </div>
                        </div>

                  
                    </div>

                  
                </div>
            </div>
        </div>
    </div>
     </div>
     
     <script type="text/javascript">
        function CheckNameMatching() {
            var boy = document.getElementById('BoyName').value;
            var girl = document.getElementById('GirlName').value;

            if (boy == "") {
                alert("Please enter a value for the \"Boy's Name\" field.");
                document.getElementById('BoyName').focus();
                return (false);
            }

            if (!(isNaN(boy))) {
                alert("Special characters and Numerics are not allowed.");
                document.getElementById('BoyName').focus();
                return (false);
            }

            if (girl == "") {
                alert("Please enter a value for the \"Girl's Name\" field.");
                document.getElementById('GirlName').focus();
                return (false);
            }

            if (!(isNaN(girl))) {
                alert("Special characters and Numerics are not allowed.");
                document.getElementById('GirlName').focus();
                return (false);
            }
            return (true);
        }

        function toggleAndChangeText() {
            $('#divToToggle').toggle();

            if ($('#divToToggle').css('display') == 'none') {
                $('#aTag').html('Click here');
            }
            else {
                $('#aTag').html('Click here');
            }
        }
    </script>
    


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


public String GetrasiName(int RashiNumber)
{
	String RasiName="";

switch(RashiNumber)
{
    case 1:
        RasiName = "Aries";
        break;
    case 2:
        RasiName = "Taurus";
        break;
    case 3:
        RasiName = "Gemini";
        break;
    case 4:
        RasiName = "Cancer";
        break;
    case 5:
        RasiName = "Leo";
        break;
    case 6:
        RasiName = "Virgo";
        break;
    case 7:
        RasiName = "Libra";
        break;
    case 8:
        RasiName = "Scorpio";
        break;
    case 9:
        RasiName = "Sagittarius";
        break;
    case 10:
        RasiName = "Capricorn";
        break;
    case 11:
        RasiName = "Aquarius";
        break;
    case 12:
        RasiName = "Pisces";
        break;
   default:
   {
	  
   }
}

return RasiName;
}


public double calculateDegree(int nakshtra, int charan)
{
double degree;
int rasi;

degree = (((nakshtra  - 1) * 4 + (charan-1) ) * 3.33333) + 1;
return  degree;
}


public int fnCalculateRasi(int nakshtra, int charan)
{
	double degree;
	int rasi;

degree = (((nakshtra  - 1) * 4 + (charan-1) ) * 3.33333) + 1;
rasi = (int)(degree / 30) + 1;

return rasi;
}


public String getmangaldoshlevel(boolean mangaldoshinlagnachart, boolean mangaldoshinmoonchart)
{
	String mangaldoshlevel = "";
    if(mangaldoshinlagnachart && mangaldoshinmoonchart )
    {
        mangaldoshlevel = "High";//baseConstants.getString("HIGH_FOR_MATCHMAKINGOUTPUT");
    }
    else if(mangaldoshinlagnachart && !mangaldoshinmoonchart)
    {
    	mangaldoshlevel = "Low";//baseConstants.getString("LOW_FOR_MATCHMAKINGOUTPUT");
    }
    else if(!mangaldoshinlagnachart && mangaldoshinmoonchart)
    {
    	mangaldoshlevel = "Low";//baseConstants.getString("LOW_FOR_MATCHMAKINGOUTPUT");
    }
    else
    {
    	mangaldoshlevel = "No";//baseConstants.getString("NO");
    }
   return mangaldoshlevel; 	
}


public boolean calculateCompatibilityForMangalDosh(String boymangaldoshlevel, String girlmangaldoshlevel){
	boolean compatibilityresult = false;
    if(boymangaldoshlevel.equals(girlmangaldoshlevel)){
            compatibilityresult = true;
    }else{
            compatibilityresult = false;
    }
        return compatibilityresult;
}
%>
