<%@page import="com.ojassoft.astrosagecloud.answertemplate.AnswerTemplate"%>
<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@ page import="com.cslsoftware.util.Constants"%>

<%
int langCode = Integer.parseInt(request.getParameter("languageCode"));
Local local = new Local();
Hindi hindi = new Hindi();
MyResourceBundle rBHouseKeys = local.loadPropertiesFileNew("housekeys",langCode);
MyResourceBundle rBAnsTemaplate = local.loadPropertiesFileNew("anstemplate",langCode);
MyResourceBundle rBSignCharacteristics = local.loadPropertiesFileNew("signcharacteristics",langCode);

DesktopHoro ObjHoro = (DesktopHoro) request.getAttribute("HoroObject");
String DOB = String.valueOf(request.getAttribute("DOB"));
String TOB = String.valueOf(request.getAttribute("TOB"));
String place = String.valueOf(request.getAttribute("Place"));
String gender = String.valueOf(request.getAttribute("Gender"));
String astrologerAns = String.valueOf(request.getAttribute("AstrologerAns"));
String QRT = String.valueOf(request.getAttribute("QRT"));

int moonsign = ObjHoro.getMoonSign()+1;
String[] signHeading = {rBSignCharacteristics.getString(getSignCharacteristics(moonsign))};

String houseDescrption = "";
List<String> houseDes = new ArrayList<String>();
AnswerTemplate anss = new AnswerTemplate();
List<Integer> arrFinal = anss.getArrayOfQuesRelTo(QRT);

for (int j=0; j < arrFinal.size() ; j++){
	 
	 houseDescrption = houseDescrption+rBAnsTemaplate.getString(getStringValueOfHouseNum(arrFinal.get(j)));
     houseDescrption = houseDescrption+" ("+rBHouseKeys.getString(getStringValueOfHouse(arrFinal.get(j)))+")";
     //System.out.println(j+","+arrFinal.size());
     if(j<arrFinal.size()-1){  houseDescrption = houseDescrption+", ";}
 }


houseDes.add(houseDescrption);
houseDes.add(rBAnsTemaplate.getString(gender.toUpperCase()));
houseDes.add(DOB);
houseDes.add(TOB);
houseDes.add(place);
houseDes.add(place);


String htmlRespone = "<html>";
PrintWriter writer = null;
try
{
 writer = response.getWriter();
//response.setContentType("text/html; charset=UTF-8"); 
response.setCharacterEncoding("UTF-8"); 

String lagna = langCode ==0 ? ObjHoro.getLagnaSign().substring(0, 1).toUpperCase() + ObjHoro.getLagnaSign().substring(1):ObjHoro.getLagnaSign() ;
String rasi = langCode ==0 ? ObjHoro.getRasiName().substring(0, 1).toUpperCase() + ObjHoro.getRasiName().substring(1):ObjHoro.getRasiName();
String lanLordame = langCode ==0 ? getStringOfLordName(ObjHoro.getLagnaLordName()) :ObjHoro.getLagnaLordName() ;//ObjHoro.getLagnaLordName().substring(0, 1).toUpperCase() + ObjHoro.getLagnaLordName().substring(1);
String rashiLord =  langCode ==0 ?getStringOfLordName(ObjHoro.getRasiLordName()) : ObjHoro.getRasiLordName();//ObjHoro.getRasiLordName().substring(0, 1).toUpperCase() + ObjHoro.getRasiLordName().substring(1);

htmlRespone = htmlRespone +rBAnsTemaplate.getString("ANALYSIS_INTER")+"<br/>";

String[] footerArr = null;



if (langCode == 1){
	
	footerArr =new String[] {hindi.unicode(lagna,langCode),hindi.unicode(rasi,langCode),hindi.unicode(lagna,langCode),hindi.unicode(lanLordame,langCode),hindi.unicode(rasi,langCode),hindi.unicode(rashiLord,langCode)};
}
else
{
	footerArr =new String[] {hindi.unicode(lagna,langCode),hindi.unicode(rasi,langCode),hindi.unicode(lanLordame,langCode),hindi.unicode(lagna,langCode),hindi.unicode(rashiLord,langCode),hindi.unicode(rasi,langCode)};
}

htmlRespone = htmlRespone +local.getDesiredString(rBAnsTemaplate.getString("ASCSIGNTEXT"),footerArr);

String head = rBAnsTemaplate.getString("HEADERTEXT");

String[] replArr = houseDes.toArray(new String[0]);
htmlRespone = htmlRespone +" "+local.getDesiredString(head,replArr);
htmlRespone = htmlRespone +" "+ astrologerAns;
htmlRespone = htmlRespone +" "+local.getDesiredString(rBAnsTemaplate.getString("SIGN_CHAR_SENTENCE"),signHeading)+"<br/><br/>";
htmlRespone = htmlRespone +rBAnsTemaplate.getString("WISHES");
htmlRespone += "</html>";
writer.println(htmlRespone);
}
catch(Exception e)
{
	e.printStackTrace();
}
finally
{
writer.close();
}
%>

<%!

public String getStringValueOfHouse(int honum) 
{
	String HouseString= "";
	
	switch (honum) 
	{
	    case 1:  HouseString = "FIRST_HOUSE";
	             break;
	    case 2:  HouseString = "SECOND_HOUSE";
	             break;
	    case 3:  HouseString = "THIRD_HOUSE";
	             break;
	    case 4:  HouseString = "FOURTH_HOUSE";
	             break;
	    case 5:  HouseString = "FIFTH_HOUSE";
	             break;
	    case 6:  HouseString = "SIXTH_HOUSE";
	             break;
	    case 7:  HouseString = "SEVENTH_HOUSE";
	             break;
	    case 8:  HouseString = "EIGHTH_HOUSE";
                 break;
	    case 9:  HouseString = "NINTH_HOUSE";
                 break;
	    case 10:  HouseString = "TENTH_HOUSE";
                  break;
	    case 11:  HouseString = "ELEVENTH_HOUSE";
                  break;
	    case 12:  HouseString = "TWELFTH_HOUSE";
                  break;
	    default: HouseString = "";
	             break;
	}
	return HouseString;
	
	
}

public String getStringValueOfHouseNum(int honum) 
{
	String HouseString= "";
	
	switch (honum) 
	{
	    case 1:  HouseString = "FIRST";
	             break;
	    case 2:  HouseString = "SECOND";
	             break;
	    case 3:  HouseString = "THIRD";
	             break;
	    case 4:  HouseString = "FOURTH";
	             break;
	    case 5:  HouseString = "FIFTH";
	             break;
	    case 6:  HouseString = "SIXTH";
	             break;
	    case 7:  HouseString = "SEVENTH";
	             break;
	    case 8:  HouseString = "EIGHTH";
                 break;
	    case 9:  HouseString = "NINTH";
                 break;
	    case 10:  HouseString = "TENTH";
                  break;
	    case 11:  HouseString = "ELEVENTH";
                  break;
	    case 12:  HouseString = "TWELFTH";
                  break;
	    default: HouseString = "";
	             break;
	}
	return HouseString;
}


public String getSignCharacteristics(int sinum) 
{
	String SignString= "";
	
	switch (sinum) 
	{
	    case 1:  SignString = "SIGN_CHARACTERISTICS1";
	             break;
	    case 2:  SignString = "SIGN_CHARACTERISTICS2";
	             break;
	    case 3:  SignString = "SIGN_CHARACTERISTICS3";
	             break;
	    case 4:  SignString = "SIGN_CHARACTERISTICS4";
	             break;
	    case 5:  SignString = "SIGN_CHARACTERISTICS5";
	             break;
	    case 6:  SignString = "SIGN_CHARACTERISTICS6";
	             break;
	    case 7:  SignString = "SIGN_CHARACTERISTICS7";
	             break;
	    case 8:  SignString = "SIGN_CHARACTERISTICS8";
                 break;
	    case 9:  SignString = "SIGN_CHARACTERISTICS9";
                 break;
	    case 10:  SignString = "SIGN_CHARACTERISTICS10";
                  break;
	    case 11:  SignString = "SIGN_CHARACTERISTICS11";
                  break;
	    case 12:  SignString = "SIGN_CHARACTERISTICS12";
                  break;
	    default: SignString = "";
	             break;
	}
	return SignString;
	
	
}

public String getStringOfLordName(String lordName) 
{
	String LordString= "";
	
	if(lordName.equals("SUN")){
		LordString= "Sun";
	}
	else if (lordName.equals("MOON")){
		LordString= "Sun";
	}
   else if (lordName.equals("MAR")){
	   LordString= "Mars";
	   }
   else if (lordName.equals("MER")){
	   LordString= "Mercury";
    }
   else if (lordName.equals("JUP")){
	   LordString= "Jupiter";
    }
   else if (lordName.equals("VEN")){
	   LordString= "Venus";
   }
   else if (lordName.equals("SAT")){
	   LordString= "Saturn";
    }
  else if (lordName.equals("RAH")){
	  LordString= "Rahu";
   }
   else if (lordName.equals("KET")){
	   LordString= "Ketu";
  }
	return LordString;
}


%>