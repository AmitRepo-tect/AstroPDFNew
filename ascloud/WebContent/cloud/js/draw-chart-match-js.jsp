<%@page import="java.util.HashMap"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%!
//'***************************************to get User details ***********************************************************
public HashMap<String, String> insideInfoinSouthIndian(int drawChartLangCode, DesktopHoro drawChartObj)
{
	HashMap<String, String> hm = new HashMap<String, String>();
	String[] monthnameinfo = null;
	String[] detailheading = null;
	String TimeZoneValue = "";
	String DateOfBirth = "";
	int LANGUAGE_ENGLISH = 0;
	int LANGUAGE_HINDI = 1;
	int LANGUAGE_TAMIL = 2;
	int LANGUAGE_KANNADA = 4;
	int LANGUAGE_TELUGU = 5;
	int LANGUAGE_BENGALI = 6;
	int LANGUAGE_GUJARATI = 7;
	int LANGUAGE_MALAYALAM = 8;
	int LANGUAGE_MARATHI = 9;
	int LANGUAGE_URDU = 10;
    String[] BirthInfor = {"Birth Details","जन्म विवरण ","Birth Details","","Birth Details","Birth Details","Birth Details","Birth Details","Birth Details","जन्म विवरण ", "Birth Details"};
	String[] LangComa = {",", ",", ",", ",", ",", ",", ",", ",", ",", ",", ","};
	String[] LangColons = {":", ":", ":", ":", ":", ":", ":", ":", ":", ":", ":"};
	String[] LangDirectionN = {"N", "उ", "N", "N", "N", ":", ":", ":", ":", ":", ":"};
	String[] LangDirectionE = {"E", "पू", "N", "N", "N", ":", ":", ":", ":", ":", ":"};
       
    String ns=drawChartObj.getNorthSouth();
    String ew=drawChartObj.getEastWest();
    
    if( drawChartLangCode == LANGUAGE_HINDI || drawChartLangCode == LANGUAGE_MARATHI)
    {
        monthnameinfo = new String[]{ "जनवरी", "फरवरी", "मार्च  ", "अप्रैल ", "मई", "जून ", "जुलाई  ", "अगस्त ", "सितम्बर ", "अक्टूबर ", "नवंबर ", "दिसंबर "};
        detailheading = new String[]{"समय","टाइम जोन","अक्षांश ","रेखांश"};
        if(ns.equals("N"))
            ns = LangDirectionN[drawChartLangCode];
        
        if(ew.equals("E"))
            ew = LangDirectionE[drawChartLangCode];
        
        TimeZoneValue = drawChartObj.getTimeZone().replace(".","-");        
    }
    else
    {
        monthnameinfo = new String[]{ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        detailheading = new String[]{"Time","Time Zone","Latitude","Longitude"};
        TimeZoneValue = drawChartObj.getTimeZone();
    }
   
   
    String Name = drawChartObj.getName();
    int LengthofString = Name.length();
    if(LengthofString >= 14)
    {
       Name = Name.substring(0,10)+"..";
    }
    else
    {
	    for(int icount = 1;icount<=LengthofString;icount++)
	    {
	     	Name =  " "+Name;
	    }
    }
   
    String BirthInformation =   BirthInfor[drawChartLangCode];   

                  
    for(int i = 0;i<=11;i++)
    {
        if(drawChartObj.getMonthOfBirth() == i+1) 
        {     
        	DateOfBirth = monthnameinfo[i]+" "+ drawChartObj.getDayOfBirth() + LangComa[drawChartLangCode]+" "+ drawChartObj.getYearOfBirth();
        }
    } 
   	String timeOfBirth = detailheading[0]+" "+ drawChartObj.getHourOfBirth() +LangColons[drawChartLangCode]+" "+ drawChartObj.getMinuteOfBirth() +LangColons[drawChartLangCode]+" "+  drawChartObj.getSecondOfBirth();

    String timeZone = detailheading[1]+" "+ TimeZoneValue;

    String latitudeinfo = detailheading[2]+" "+drawChartObj.getDegreeOfLattitude() + LangColons[drawChartLangCode]+" "+ drawChartObj.getMinuteOfLattitude() +LangColons[drawChartLangCode]+" "+ns;

    String longitudeinfo =  detailheading[3]+" "+ drawChartObj.getDegreeOfLongitude() +LangColons[drawChartLangCode]+" "+ drawChartObj.getMinuteOfLongitude() +LangColons[drawChartLangCode]+" "+ ew;
    hm.put("BirthInformation",BirthInformation);
    hm.put("Name",Name);
    hm.put("DateOfBirth",DateOfBirth);
    hm.put("timeOfBirth",timeOfBirth);
    hm.put("timeZone",timeZone);
    hm.put("latitudeinfo",latitudeinfo);
    hm.put("longitudeinfo",longitudeinfo);
    return hm;
}


 %>

