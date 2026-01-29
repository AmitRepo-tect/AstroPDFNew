<%@page import="java.sql.SQLException"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
Local local = new Local();
Hindi hindi = new Hindi();
int langCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBCarHoro = local.loadPropertiesFileNew("careerhoroscope",langCode);
MyResourceBundle rBPredCarHoro = local.loadPropertiesFileNew("prediction2-careerhoroscope",langCode);
%>
<div class="hdg-lg card">
	<h1><%=rBCarHoro.getString("YOUR_FINANCE_CAREER_AND_OCCUPATION")%></h1>	
</div>

<%
	
	CloudDAO dao = new CloudDAO();
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	try
	{
	connObj = dBUtils.getConnection();
	String name = myAstrologyObject.getName();
    String[] userName = SharedFunction.ProperCase(name).split(" ");
    String[] EnglishArrayHeading = { "Character", "Happiness and Fulfillment", "Life Style", "Career", "Occupation", "Health", "Hobbies", "Love Matters", "Finance"};
%>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content justify">
<h2> <%=rBPredCarHoro.getString("CAREER") %></h2>
<p> <%=userName[0] +", "+ dao.getPredictionForAspect(3,EnglishArrayHeading[3], myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBPredCarHoro.getString("OCCUPATION") %> </h2>

<p> <%=userName[0] +", "+ dao.getPredictionForAspect(4,EnglishArrayHeading[4], myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBConstants.getString("FINANCE") %> </h2>

<p> <%=userName[0] +", "+ dao.getPredictionForAspect(8,EnglishArrayHeading[8], myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>
</div>
</div>
<div>
	
	<%
    //connObj.close();//commented by ambuj(07 may 2018)
	}
	catch(Exception sqle)
	{
		sqle.printStackTrace();
	}
	finally
	{
		dBUtils.closeConnection(connObj, null, null);
	}
%>
</div>