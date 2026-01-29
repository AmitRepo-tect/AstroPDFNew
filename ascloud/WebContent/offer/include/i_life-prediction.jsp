<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
    DesktopHoro myAstrologyObject=(DesktopHoro)session.getAttribute("HoroscopeObj")   ;    
	CloudDAO dao = new CloudDAO();
	DatabaseUtils dBUtils = new DatabaseUtils();
	
	Local localLP = new Local();
	Hindi hindiLP = new Hindi();
	int langCode = (Integer)session.getAttribute("languageCode");
	MyProperties rBConstantsLP = (MyProperties) session.getAttribute("constants");
	MyResourceBundle rBPredCharHoro = localLP.loadPropertiesFileNew("prediction1-characterhoroscope",langCode);
	MyResourceBundle rBPredCareerHoro = localLP.loadPropertiesFileNew("prediction2-careerhoroscope",langCode);
	MyResourceBundle rBPredLoveHoro = localLP.loadPropertiesFileNew("prediction3-lovehoroscope",langCode);
	Connection connObj = null;
	try
	{
	connObj = dBUtils.getConnection();
%>
<div align="center" class="heading-sec">
    <h2>
        <%=rBConstantsLP.getString("GENERAL_PREDICTION")%>
    </h2>
</div>

<div class="inner-sec">
    <h3>
        <%=rBPredCharHoro.getString("CHARACTER")%></h3>
    <p>
        <%=dao.getPredictionForAspect(0,"CHARACTER", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBPredCharHoro.getString("HAPPINESS_AND_FULFILLMENT")%></h3>
    <p>
        <%=dao.getPredictionForAspect(0,"HAPPINESS AND FULFILLMENT", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBPredCharHoro.getString("LIFE_STYLE")%></h3>
    <p>
        <%=dao.getPredictionForAspect(0,"LIFE STYLE", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBPredCareerHoro.getString("CAREER")%></h3>
    <p>
        <%=dao.getPredictionForAspect(3,"CAREER", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBPredCareerHoro.getString("OCCUPATION")%></h3>
    <p>
        <%=dao.getPredictionForAspect(4,"OCCUPATION", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBConstantsLP.getString("HEALTHE")%></h3>
    <p>
        <%=dao.getPredictionForAspect(5,"HEALTH", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBPredLoveHoro.getString("HOBBIES")%></h3>
    <p>
        <%=dao.getPredictionForAspect(6,"HOBBIES", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBPredLoveHoro.getString("LOVE_MATTERS")%></h3>
    <p>
        <%=dao.getPredictionForAspect(7,"LOVE MATTERS", myAstrologyObject, langCode, hindiLP, connObj )%></p>
    <h3>
        <%=rBConstantsLP.getString("FINANCE")%></h3>
    <p>
        <%=dao.getPredictionForAspect(8,"FINANCE", myAstrologyObject, langCode, hindiLP, connObj )%></p>
</div>
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