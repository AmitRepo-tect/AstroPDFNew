<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%
Local localP = new Local();
int languageCodePanchang = Util.safeInt(session.getAttribute("languageCode"));
MyProperties rBConstantsP = (MyProperties) session.getAttribute("constants");
MyResourceBundle miscConstants = localP.loadPropertiesFileNew("misc",languageCodePanchang);
MyResourceBundle bdConst = localP.loadPropertiesFileNew("birthdetails",languageCodePanchang);
MyResourceBundle bdVPConst = localP.loadPropertiesFileNew("birthdetails-varshphalallpages",languageCodePanchang);
%>
<div align="center" class="heading-sec">
    <h2>
       <%=miscConstants.getString("PANCHANG")%>
    </h2>
</div>
<div class="inner-sec">
<p>  <%if(languageCodePanchang == 1) { %>
जन्म वार, जन्म तिथि, जन्म नक्षत्र, जन्म योग तथा जन्म करण इन पाँचों को मिलाकर पंचांग फल की गणना की गई है।
जन्म के समय उपरोक्त सभी पाँचों कारकों को ध्यान में रखने के बाद जातक के जीवन पर पड़ने वाले प्रभाव की गणना की
जाती है। आपकी कुंडली में पंचांग फल निम्न प्रकार वर्णित हैः
<% } else { %>
The amalgamation of the five factors namely, the day of birth, date of birth, birth constellation, birth yoga, and
birth karana help the astrologers in calculating the Panchang Phala of a native. Considering these five factors at
the time of the birth of a native, the astrologer paints a clear hued picture denoting the ups and downs of life.
The Panchang Phala of your kundali has been mentioned below:
<% } %></p>

    
<% 
DesktopHoro myAstrologyObj = (DesktopHoro)session.getAttribute("HoroscopeObj");

int tithino = myAstrologyObj.getTithi()+1;
int Vaarno = myAstrologyObj.getHinduWeekday()+1;
int Yogano = myAstrologyObj.getYoga()+1;
String Karanno = getKaranNumber(myAstrologyObj.getKaran()+1);
int Nakshatrano = getNakshatra(myAstrologyObj)+1  ;
if (Nakshatrano > 21)
    Nakshatrano =Nakshatrano + 1;
 
DatabaseUtils dBUtilsP = new DatabaseUtils();
Statement stmt = null;
Connection connObjP = null;
ResultSet rs = null;
try
{
	connObjP = dBUtilsP.getConnection();
stmt = connObjP.createStatement();
String panTithiStrSql = "Select * From tbl_TithiPrediction Where Tithino = " + tithino + " and LanguageCode=" + languageCodePanchang;
rs = stmt.executeQuery(panTithiStrSql);
if(rs.next())
	out.println("<h3>"+ rBConstantsP.getString("TITHI") + ": " + rs.getString("Tithiname") + "</h3><p>" + rs.getString("Tithiprediction") + "</p>");

rs.close();
String panDayStrSql = "Select * From tbl_VaarPrediction Where Vaarno = " + Vaarno + " and LanguageCode=" + languageCodePanchang;
rs = stmt.executeQuery(panDayStrSql);
if(rs.next())
	out.println("<h3>"+ bdConst.getString("HINDU_WEEK_DAY") + ": "  + rs.getString("Vaarname") + "</h3><p>" + rs.getString("Vaarprediction") + "</p>");

rs.close();
String panYogStrSql = "Select * From tbl_YogaPrediction Where Yogano = " + Yogano + " and LanguageCode=" + languageCodePanchang;
rs = stmt.executeQuery(panYogStrSql);
if(rs.next())
	 out.println("<h3>"+ bdVPConst.getString("YOGA") + ": "  + rs.getString("Yoganame") + "</h3><p>" + rs.getString("Yogaprediction") + "</p>");

 rs.close();
 String panKaranStrSql = "Select * From tbl_KaranPrediction Where Karanno = " + Karanno + " and LanguageCode=" + languageCodePanchang;
 rs = stmt.executeQuery(panKaranStrSql);
 if(rs.next())        
	 out.println("<h3>"+ bdVPConst.getString("KARAN") + ": "  + rs.getString("Karanname") + "</h3><p>" + rs.getString("Karanprediction") + "</p>");

 rs.close();
 String panNakStrSql = "Select * From tbl_NakshatrasPrediction Where Nakshatrano = " + Nakshatrano + " and LanguageCode=" + languageCodePanchang;
 rs = stmt.executeQuery(panNakStrSql);
 if(rs.next())
    out.println("<h3>"+ rBConstantsP.getString("NAKSHATRA") + ": "  + rs.getString("Nakshatraname") + "</h3><p>" + rs.getString("Nakshatraprediction") + "</p>");
 
 }
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
 //connObj.close(); //commented by ambuj(07 may 2018)
	dBUtilsP.closeConnection(connObjP, stmt, rs);
	}
%>
<%!
public int getNakshatra(DesktopHoro myAstrologyObj)
{
    return new Double(myAstrologyObj.getMoon() * 0.075).intValue();
}
 
public String getKaranNumber(int karanno)
{
	String numb = "";
		
	switch(karanno)
	{
		case 2:
		case 9:
		case 16:
		case 23:
		case 30:
		case 37:
		case 44:
		case 51:
			numb = "1";
			break;
		case 3:
		case 10:
		case 17:
		case 24:
		case 31:
		case 38:
		case 45:
		case 52:
			numb = "2";
			break;			
		case 4:
		case 11:
		case 18:
		case 25:
		case 32:
		case 39:
		case 46:
		case 53:
			numb = "3";
			break;		
		case 5:
		case 12:
		case 19:
		case 26:
		case 33:
		case 40:
		case 47:
		case 54:
			numb = "4";
			break;
		case 6:
		case 13:
		case 20:
		case 27:
		case 34:
		case 41:
		case 48:
		case 55:
			numb = "5";
			break;	
		case 7:
		case 14:
		case 21:
		case 28:
		case 35:
		case 42:
		case 49:
		case 56:
			numb = "6";
			break;
		case 8:
		case 15:
		case 22:
		case 29:
		case 36:
		case 43:
		case 50:
		case 57:
			numb = "7";
			break;		
		case 58:
			numb = "8";
			break;		
		case 59:
			numb = "9";
			break;		
		case 60:
			numb = "10";
			break;		
		case 1:
			numb = "11";
		break;			
	}
	    return numb;
}

%>

</div>
