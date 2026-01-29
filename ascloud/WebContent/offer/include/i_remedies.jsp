<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<% 
Local localR = new Local();
int languageCodeRem = (Integer) session.getAttribute("languageCode");
DesktopHoro myAstrologyObjectR = (DesktopHoro) session.getAttribute("HoroscopeObj");
//MyResourceBundle constants = (MyResourceBundle)request.getAttribute("constants");
MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle miscConstantsR = localR.loadPropertiesFileNew("misc", languageCodeRem); 
%>
<div align="center" class="heading-sec">
    <h2>
         <%=miscConstantsR.getString("REMEDIES")%>&nbsp;(<%=miscConstantsR.getString("SAMPLE")%>)
    </h2>
</div>
<div class="inner-sec">
<div class="padding-lr"><%=miscConstantsR.getString("REMEDY_SAMPLE_DESC")%></div>
    <% 
    
    int[] arrPlanetsRemedy = myAstrologyObjectR.getPositionForShodasvarg(0);

String[] remedyHDG = new String[] {"DRESS", "PRAYER", "FASTING", "DAAN", "JADI", "RUDRAKSHA", "YANTRA", "MANTRA"};


for(int i=0;i<=7;i++) 
{
    String resultRemedy =  GetRemedyPrediction(remedyHDG[i], 1, languageCodeRem);  
    String[] resultRemedyArr = resultRemedy.split("\\|");             
    
    %>
    <div class='padding-lr padding-t'>
        <%     
        String newArr1 = "";
        if(resultRemedyArr.length > 1)
            newArr1 = "<p>"+resultRemedyArr[1].replace("\n", "<br />")+"</p>";
           if(resultRemedyArr.length > 2)
               newArr1 += "<p>"+resultRemedyArr[2].replace("\n", "<br />")+"</p>";
                
  		out.println("<h3>"+ resultRemedyArr[0] +"</h3>"+newArr1);  
        %>
    </div>
    <div class="upgrade-section">
        <%@include file='i_upgrade.jsp'%>
    </div>
    <%  
     
}
%>
<%!
public String GetRemedyPrediction(String remType, int planetNumber, int LanguageCode) throws Exception
{
	String remedyPredictionText = "";
	Connection connObj = null;
	Statement stmt = null;
	ResultSet rs = null;
	DatabaseUtils dBUtils = new DatabaseUtils();
	try
	{
	connObj = dBUtils.getConnection();
	stmt = connObj.createStatement();
	String remedyStrSql = "select * from tbl_RemediesPrediction where RemedyType= '" + remType + "' And (Planet="+planetNumber+" Or Planet=0) and LanguageCode=" + LanguageCode +" Order by Id";
	rs = stmt.executeQuery(remedyStrSql);
	
	String title = "";
        while(rs.next())
        {
        	title = rs.getString("Title")+"|";
         	remedyPredictionText += rs.getString("PredictionText")+"|";
         	
        }

        if(!title.equals(""))
        	remedyPredictionText = title+remedyPredictionText;
	}
	finally{
		/* rs.close();
		stmt.close();
		connObj.close(); */ //commented by ambuj(07 may 2018)
		dBUtils.closeConnection(connObj, stmt, rs);
	}
	return remedyPredictionText;
}
    %>
</div>


