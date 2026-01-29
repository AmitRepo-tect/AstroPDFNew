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
MyResourceBundle rBLoveHoro = local.loadPropertiesFileNew("lovehoroscope",langCode);
MyResourceBundle rBPredLoveHoro = local.loadPropertiesFileNew("prediction3-lovehoroscope",langCode);
%>

<div class="hdg-lg card">
	<h1><%=rBLoveHoro.getString("YOUR_LOVE_HEALTH_AND_HOBBIES")%></h1>	
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
<h2> <%=rBPredLoveHoro.getString("LOVE_MATTERS") %></h2>
<p> <%=userName[0] +", "+ dao.getPredictionForAspect(7,EnglishArrayHeading[7], myAstrologyObject, langCode, hindi, connObj )%></p>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBConstants.getString("HEALTHE") %> </h2>
<p> <%=userName[0] +", "+ dao.getPredictionForAspect(5,EnglishArrayHeading[5], myAstrologyObject, langCode, hindi, connObj )%></p>
</div>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBPredLoveHoro.getString("HOBBIES") %></h2>
<p>  <%=userName[0] +", "+ dao.getPredictionForAspect(6,EnglishArrayHeading[6], myAstrologyObject, langCode, hindi, connObj )%></p>
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
	finally
	{
	    //connObj.close();//commented by ambuj(07 may 2018)
		dBUtils.closeConnection(connObj, null, null);
	}
%>
</div>