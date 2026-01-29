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
MyResourceBundle rBCharHoro = local.loadPropertiesFileNew("characterhoroscope",langCode);
MyResourceBundle rBPredCharHoro = local.loadPropertiesFileNew("prediction1-characterhoroscope",langCode);
%>

<div class="hdg-lg card">
	<h1><%=rBCharHoro.getString("YOUR_CHARACTER_HAPPINESS_AND_FULFILLMENT_LIFE_STYLE")%></h1>	
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
<h2> <%=rBPredCharHoro.getString("CHARACTER") %></h2>
<p> <%=userName[0] +", "+ dao.getPredictionForAspect(0,EnglishArrayHeading[0], myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBPredCharHoro.getString("HAPPINESS_AND_FULFILLMENT") %> </h2>
<p><%=userName[0] +", "+ dao.getPredictionForAspect(1,EnglishArrayHeading[1], myAstrologyObject, langCode, hindi, connObj )%></p>
</div>
<div class="card padding-all mrt-20 hdg-content justify">
<h2> <%=rBPredCharHoro.getString("LIFE_STYLE") %> </h2>
<p><%=userName[0] +", "+ dao.getPredictionForAspect(2,EnglishArrayHeading[2], myAstrologyObject, langCode, hindi, connObj )%></p>
</div>
</div>
</div>

<div>
	
	<%
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
    //connObj.close();//commented by ambuj(07 may 2018)
    finally
    {
		dBUtils.closeConnection(connObj, null, null);
    }
%>
</div>