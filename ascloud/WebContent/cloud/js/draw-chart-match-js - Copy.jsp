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


<%
/* **************************************To get Boy details********************************************************
 'Call BoyInformation

 Dim BoyN,BoyBirthplace,BoyDateOfBirth,BoytimeOfBirth,Boytz,Boylatitudeinfo,Boylongitudeinfo

 Sub BoyInformation
  '****Create an Array for month name
    Dim monthnameinfo,ns, ew, MonthofDate, Name, LengthofString, i, detailheading ,TimeZoneValueInfo 
    dim BirthInformation,DateOfBirth,timeOfBirth,timeZone,latitudeinfo,longitudeinfo

     dim boyname,boydob,boymob,boyyob,boyhrs,boymin,boysec,boyplace,boylongdeg,boylongmin,boylongew,boylatdeg
      dim boylatmin,boylatns,boytimezone,colorcodetext           
           
        boyname = objHoroMale.getname
        boydob = objHoroMale.getdayofbirth
        boymob = objHoroMale.getmonthofbirth
        boyyob = objHoroMale.getyearofbirth
        boyhrs = objHoroMale.gethourofbirth 
        boymin = objHoroMale.getminuteofbirth 
        boysec = objHoroMale.getsecondofbirth 
        boyplace = objHoroMale.getplace
        boylongdeg = objHoroMale.getdegreeoflongitude
        boylongmin = objHoroMale.getminuteoflongitude 
        boylongew = objHoroMale.geteastwest 
        boylatdeg = objHoroMale.getdegreeoflattitude
        boylatmin = objHoroMale.getminuteoflattitude 
        boylatns = objHoroMale.getnorthsouth 
        boytimezone = objHoroMale.gettimezone


        ns=boylatns
        ew=boylongew
        Dim TimeZoneValue
        If CInt(LanguageCode) = LANGUAGE_ENGLISH Then
            monthnameinfo = Array( "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
            detailheading = array("Time","Time Zone","Latitude","Longitude")
            TimeZoneValueInfo = boytimezone
        Else
            monthnameinfo = Array( "जनवरी", "फरवरी", "मार्च  ", "अप्रैल ", "मई", "जून ", "जुलाई  ", "अगस्त ", "सितम्बर ", "अक्टूबर ", "नवंबर ", "दिसंबर ")
            detailheading = Array("समय","टाइम जोन","अक्षांश ","रेखांश")
            If lcase(boylatns) = "n" Then
                ns = "m"
            End If
            If lcase(boylongew) = "e" Then
                ew = "iw"
            End If
            TimeZoneValue = Replace(boytimezone,".","-")
        End If

         '***************Name*************************************
     BoyN = boyname  
    LengthofString = Len(BoyN)
    If LengthofString > 14 Then
       BoyN = Left(BoyN,10)&".."
    Else
    for icount = 1  to Len(BoyN) 
     BoyN =  " "&BoyN
     next
    End If
   
   ' response.write BoyN&"<br/>" 

    '*************************Boy Place***************

     If Len(boyplace)>10 Then
             boyplace = left(boyplace,10)
             boyplace = boyplace&"..."
        End If
     
    '**************Birth place ******************** 
    BoyBirthplace = "Place: "&boyplace

   ' Response.Write BoyBirthplace&"<br/>"
        
   '***********Date of Birth***********************
   
     BoyDateOfBirth = "Date: "&Boydob&"-"&Boymob&"-"&Boyyob
     'Response.write BoyDateOfBirth&"<br/>"
     

    '*************Time Of Birth***********************
    BoytimeOfBirth = "Time: "&boyhrs&":"&boymin&":"&boysec&" hrs"

    'Response.Write BoytimeOfBirth&"<br/>"

    '****************Time Zone**********************

    Boytz = "Timezone: "&boytimezone

    'Response.Write Boytz&"<br/>"

    '******************Latitude********************

    Boylatitudeinfo = "Latitude: "&boylatdeg&boylatns&boylatmin   

    'Response.Write Boylatitudeinfo&"<br/>" 'detailheading(2)&" "&myAstrologyObject.getDegreeOfLattitude &LangColons(CInt(LanguageCode))&" "& myAstrologyObject.getMinuteOfLattitude &LangColons(CInt(LanguageCode))&" "& ns&"<br/>"

    '*******************Longitude************************
    Boylongitudeinfo =  "Longitude: "&boylongdeg&boylongew&boylongmin

   'Response.Write Boylongitudeinfo&"<br/>"

 End Sub

 '************************************To get girl details**************************************
 Dim GirlN,GirlBirthplace,GirlDateOfBirth,GirltimeOfBirth,Girltz,Girllatitudeinfo,Girllongitudeinfo

 sub GirlInformation
'****Create an Array for month name
        dim girlname,girldob,girlmob,girlyob,girlhrs,girlmin,girlsec,girlplace,girllongdeg,girllongmin,girllongew,girllatdeg
        dim girllatmin,girllatns,girltimezone,colorcodetextgirl
           
        girlname = objHorofemale.getname
        girldob = objHorofemale.getdayofbirth
        girlmob = objHorofemale.getmonthofbirth
        girlyob = objHorofemale.getyearofbirth
        girlhrs = objHorofemale.gethourofbirth 
        girlmin = objHorofemale.getminuteofbirth 
        girlsec = objHorofemale.getsecondofbirth 
        girlplace = objHorofemale.getplace
        girllongdeg = objHorofemale.getdegreeoflongitude
        girllongmin = objHorofemale.getminuteoflongitude 
        girllongew = objHorofemale.geteastwest 
        girllatdeg = objHorofemale.getdegreeoflattitude
        girllatmin = objHorofemale.getminuteoflattitude 
        girllatns = objHorofemale.getnorthsouth 
        girltimezone = objHorofemale.gettimezone

        ns=girllatns
        ew=girllongew
        'Dim TimeZoneValue
        If CInt(LanguageCode) = LANGUAGE_ENGLISH Then
            monthnameinfo = Array( "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
            detailheading = array("Time","Time Zone","Latitude","Longitude")
            TimeZoneValueInfo = boytimezone
        Else
            monthnameinfo = Array( "जनवरी", "फरवरी", "मार्च  ", "अप्रैल ", "मई", "जून ", "जुलाई  ", "अगस्त ", "सितम्बर ", "अक्टूबर ", "नवंबर ", "दिसंबर ")
            detailheading = Array("समय","टाइम जोन","अक्षांश ","रेखांश")
            If lcase(girllatns) = "n" Then
                ns = "m"
            End If
            If lcase(girllongew) = "e" Then
                ew = "iw"
            End If
            TimeZoneValue = Replace(girltimezone,".","-")
        End If

         '***************Name*************************************
     GirlN = girlname  
    LengthofString = Len(GirlName)
    If LengthofString > 14 Then
       GirlN = Left(GirlN,10)&".."
    Else
    for icount = 1  to Len(GirlN) 
     GirlN =  " "&GirlN
     next
    End If
   
   ' response.write GirlN&"<br/>"

    '*************************Boy Place***************

     If Len(girlplace)>10 Then
             girlplace = left(girlplace,10)
             girlplace = girlplace&"..."
        End If
     
    '**************Birth place ******************** 
    GirlBirthplace = "Place: "&girlplace

    'Response.Write GirlBirthplace&"<br/>"
        
   '***********Date of Birth***********************
    
     GirlDateOfBirth = "Date: "&girldob&"-"&girlmob&"-"&girlyob
   '  Response.write GirlDateOfBirth&"<br/>"
     

    '*************Time Of Birth***********************
    GirltimeOfBirth = "Time:"&girlhrs&":"&girlmin&":"&girlsec&" hrs"

    'Response.Write GirltimeOfBirth&"<br/>"

    '****************Time Zone**********************

    Girltz = "Timezone: "&girltimezone

    'Response.Write Girltz&"<br/>"

    '******************Latitude********************

    Girllatitudeinfo = "Latitude: "&girllatdeg&girllatns&girllatmin   

   ' Response.Write Girllatitudeinfo&"<br/>" 'detailheading(2)&" "&myAstrologyObject.getDegreeOfLattitude &LangColons(CInt(LanguageCode))&" "& myAstrologyObject.getMinuteOfLattitude &LangColons(CInt(LanguageCode))&" "& ns&"<br/>"

    '*******************Longitude************************
    Girllongitudeinfo =  "Longitude: "&girllongdeg&girllongew&girllongmin

  ' Response.Write Girllongitudeinfo&"<br/>"

 End sub*/
  %>