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
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<% 
Local local = new Local();
Hindi hindi = new Hindi();
int langCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBPredCharHoro = local.loadPropertiesFileNew("prediction3-lovehoroscope",langCode);
MyResourceBundle rBSvklagnaVarshphalShodascharts = local.loadPropertiesFileNew("svklagna-varshphalallpages-shodascharts",langCode);

    DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj")   ;
    int getDay=myAstrologyObject.getDayOfBirth();
    int getMonth=myAstrologyObject.getMonthOfBirth();
    int getYear=myAstrologyObject.getYearOfBirth();
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
<h2> <%=rBPredCharHoro.getString("HOBBIES")%> </h2>
<p>  <%=dao.getPredictionForAspect(6,"HOBBIES", myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>
<%@include file='ui-control/ad-content-area.jsp'%>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBPredCharHoro.getString("LOVE_MATTERS")%> </h2>
<p>  <%=dao.getPredictionForAspect(7,"LOVE MATTERS", myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>
<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBConstants.getString("FINANCE")%> </h2>
<p>  <%=dao.getPredictionForAspect(8,"FINANCE", myAstrologyObject, langCode, hindi, connObj )%> </p>
</div>

<div class="card padding-all hdg-content mrt-20 justify">
<h2> <%=rBSvklagnaVarshphalShodascharts.getString("EDUCATION").toUpperCase()%> </h2>
<p>  <%=dao.getPredictionForAspectBasedOnDiv(10,"EDUCATION", myAstrologyObject, langCode, hindi, connObj ,24)%> </p>

<%
Calendar calendar = Calendar.getInstance();
int getCurrentYear = calendar.get(Calendar.YEAR);
int yearDifferent = getCurrentYear - getYear;

if (yearDifferent<14){
%>
<P><%=rBConstants.getString("COGNIASTRO_REPORT_TEN_GRADE")%> - <a href='https://buy.astrosage.com/service/cogniastro-career-counseling-report'>Click Here</a></P>
<%	
}
else if (yearDifferent>=14 && yearDifferent<17){
%>
<P><%=rBConstants.getString("COGNIASTRO_REPORT_TWELVE_GRADE")%> - <a href='https://buy.astrosage.com/service/cogniastro-career-counseling-report-grade12'>Click Here</a></P>
<%	
}
else
{
%>
<P><%=rBConstants.getString("COGNIASTRO_REPORT_PROFESSIONAL")%> - <a href='https://buy.astrosage.com/service/career-counselling-report'>Click Here</a></P>
<%	
}
%>

</div>

<div class="card padding-all center mrt-20 mrb-10"> 
 <a href="prediction2.asp" class="waves-effect waves-light btn amber darken-4 box-shadow"><%=rBConstants.getString("BACK")%></a>		
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


</center>
