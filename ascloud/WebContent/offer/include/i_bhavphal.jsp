<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
    
<% 
Local localB = new Local();
int langCodeBhav = Util.safeInt(session.getAttribute("languageCode"));
DesktopHoro myAstrologyObjB = (DesktopHoro)session.getAttribute("HoroscopeObj");
MyResourceBundle miscConstantsB = localB.loadPropertiesFileNew("misc", langCodeBhav);
String[] houseHeading = new String[]{"test", "Personality, health, status", "Wealth, family, properties", "Siblings, courage", "Happiness, education, house, mother, property", "Children, mind, intelligence", "Diseases, debt, enemies", "Marriage, partner", "Longevity, danger, difficulties", "Luck, father, inheritance etc.", "Profession", "Income, gain", "Expenditure, moksha"};
String[] houseHeadingHindi = new String[] {"test", "व्यक्तित्व, स्वास्थ्य, सामाजिक स्थिति", "धन, परिवार, जमीन और जायदाद", "भाई-बहन, साहस", "सुख, शिक्षा, घर, माता, प्रॉपर्टी", "बच्चे, मन, बुद्धि", "बीमारियाँ, ऋण, शत्रु", "विवाह, साथी ", "दीर्घायु, खतरा, कठिनाइयाँ", "भाग्य, पिता, विरासत", "प्रोफेशन", "आय, लाभ", "खर्च, मोक्ष"};

      int[] housesSignified = myAstrologyObjB.getPlanetInBhav(0);

      
  String[] heading = new String[13];     
  if (langCodeBhav==1)
	heading = houseHeadingHindi;
  else
	heading = houseHeading;
  %>
  <div align="center" class="heading-sec">
    <h2>
        <%=miscConstantsB.getString("BHAV_PHAL")%>
    </h2>
</div>
<%
  for(int i=1;i<= 12;i++)

  {
	  int houseLord = getHouseLord(i, myAstrologyObjB);

	  int houseLordInBhav = housesSignified[houseLord-1];

	  String resultbhavesh =  GetBhaveshPrediction(i, houseLordInBhav, langCodeBhav);   
    %>
    
<div class="inner-sec">
  <div class='padding-lr padding-t'>
  <%                  
    out.println("<h3>"+ heading[i] +"</h3><p>" + resultbhavesh.substring(0, 600) + "... </p>");
  %>  
 </div>
  <div class="upgrade-section">
  <%@include file='i_upgrade.jsp'%>
  </div> 
  <%      
} 
   %>

</div>

<%!
public String GetBhaveshPrediction(int houseNumber, int houseLordInBhav, int LanguageCode) throws Exception 
{
	String returnVal = "";
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	Statement stm = null;
	ResultSet rs = null;
	try
	{
	connObj = dBUtils.getConnection();
    String bhavStrSql = "Select * From tbl_bhavesh_prediction Where HouseLordOfBhav = " + houseNumber + " and HouseLordInBhav = " + houseLordInBhav + " and LanguageCode=" +LanguageCode;
    stm = connObj.createStatement();
	rs = stm.executeQuery(bhavStrSql);
	if(rs.next())
	{
		returnVal = rs.getString("Prediction");
	}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
    //connObj.close(); //commented by ambuj(07 may 2018)
	dBUtils.closeConnection(connObj, stm, rs);
	}
return returnVal;

} 

public int getHouseLord(int houseNo, DesktopHoro myAstrologyObj)
{
	int[] owner = new int[] {3, 6, 4, 2, 1, 4, 6, 3, 5, 7, 7, 5};
	int rasiInHouse = houseNo + myAstrologyObj.getAscendentSign() - 1;
	if(rasiInHouse > 12)
		rasiInHouse=rasiInHouse- 12;

	return owner[rasiInHouse - 1];
}

 %>
