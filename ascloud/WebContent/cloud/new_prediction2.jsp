<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
Local local = new Local();
Hindi hindi = new Hindi();
int langCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBPredCharHoro = local.loadPropertiesFileNew("prediction2-careerhoroscope",langCode);
    DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj")   ;    
	CloudDAO dao = new CloudDAO();
	DatabaseUtils dBUtils = new DatabaseUtils();
	Connection connObj = null;
	try
	{
	connObj = dBUtils.getConnection();
	
	
%>
<div class="hdg-lg card">
	<h1><%=rBConstants.getString("GENERAL_PREDICTION")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content justify">

<h2> <%=rBPredCharHoro.getString("CAREER")%> </h2>
<p> <%=dao.getPredictionForAspect(3,"CAREER", myAstrologyObject, langCode, hindi, connObj )%></p>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBPredCharHoro.getString("OCCUPATION")%> </h2>
<p> <%=dao.getPredictionForAspect(4,"OCCUPATION", myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBConstants.getString("HEALTHE")%> </h2>
<p> <%=dao.getPredictionForAspect(5,"HEALTH", myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>
<div class="card padding-all center mrt-20 mrb-10"> 
  <a href="prediction1.asp" class="waves-effect waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("BACK")%> </a>
  <a href="prediction3.asp" class="waves-effect waves-light btn amber darken-4 box-shadow"> <%=rBConstants.getString("NEX")%> </a>
</div>


</div>
</div>
<center>
	
	<%
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	finally
	{
    //connObj.close(); //commented by ambuj(07 may 2018)
	dBUtils.closeConnection(connObj, null, null);
	}
    %>
	<div class="topbottompad">
		
	</div>

</center>
