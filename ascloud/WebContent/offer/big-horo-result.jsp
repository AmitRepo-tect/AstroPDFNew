<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
int LanguageCode = Util.safeInt(session.getAttribute("languageCode"));

DesktopHoro ObjHoroChalit = (DesktopHoro)session.getAttribute("HoroscopeObj");

Object objres = session.getAttribute("constants");
MyProperties rBConstants = null;
if(objres != null)
{
	rBConstants = (MyProperties) objres;
}
else
{
	rBConstants = new MyProperties(new Local().loadPropertiesFile("constants", LanguageCode));
	session.setAttribute("constants", rBConstants);
}

MyResourceBundle miscConst = new Local().loadPropertiesFileNew("misc", LanguageCode);

%>
<%@include file='create-session.jsp'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#FFC107" />
    <title><%=miscConst.getString("TITLE_ASTROSAGE_OFFER") %></title>
    <meta name="description" content=<%=miscConst.getString("OFFER_ASTROSAGE_DESC") %> />
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" src="/dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/app.css" />
    <script type="text/javascript" src="/cloud/js/constents.js"></script>
    <script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
    <script type="text/javascript" src="/cloud/js/canvas.js"></script>
    <script>
        window.onscroll = function (ev) {
            if ((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
                $('#myModal').modal('show');
            }
        };
    
    </script>
   
</head>
<body>
<%@include file='bh-popup.jsp'%>
<%@include file='snackbar.jsp'%>

    <div class="full-width">
        <div class="app-toolbar navbar-fixed-top">
            <div class="container">
                <a href="http://www.astrosage.com/">
                    <img src="/images/logo.png" alt="" /></a> 
                <a href="javascript:void(0);" data-toggle='modal' data-target='#myModal' class="shop-cart btn btn-white pull-right"><i class="material-icons">&#xE8CC;</i></a>

            </div>
        </div>
    </div>
    <div class="container">
        <div class="horoscope-online-result">
            <div class="padding-all">
                <div class="god-gn" align="center">
                    <img src="/offer/images/ganesha.jpg" class="img-responsive" />
                </div>
                <div class="content-bar">
                    <div class="text-center">
                        <h2>
                            <%=miscConst.getString("OFFER_ASTROSAGE_DESC") %>
                        </h2>
                    </div>
                    <p class="text-justify">
                        <%=miscConst.getString("DESCRIPTION") %>
                    </p>
                </div>
                <div class="main-contain">
                <%@include file='include/i_birth-details.jsp'%>
                    
                </div>
            </div>
            <div class="ad-section">
            	<%@include file='include/i_promotion.jsp'%>
                
            </div>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<%@include file='include/i_life-prediction.jsp'%>
                    
                </div>
            </div>
            <div class="ad-section">
               <jsp:include page="include/i_promotion.jsp"/>
            </div>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<%@include file='include/i_panchang.jsp'%>
                    
                </div>
            </div>
           <%@include file='include/i_separator.jsp'%>
            <div class="full-conatin-bar">
           		 <%@include file='include/i_bhavphal.jsp'%>
                
            </div>
             <%@include file='include/i_separator.jsp'%>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<%@include file='include/i_planet-position.jsp'%>
                    
                </div>
            </div>
             <%@include file='include/i_separator.jsp'%>
            <div class="full-conatin-bar">
            	<%@include file='include/i_remedies.jsp'%>
                
            </div>
             <%@include file='include/i_separator.jsp'%>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<%@include file='include/i_ascendant-prediction.jsp'%>
                    
                </div>
                 <%@include file='include/i_separator.jsp'%>
                <div class="full-conatin-bar">
                	<%@include file='include/i_manglik-details.jsp'%>
                    
                </div>
            </div>
            <div class="ad-section">
               <jsp:include page="include/i_promotion.jsp"/>
            </div>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<%@include file='include/i_sadesati-report.jsp'%>
                    
                </div>
                 <%@include file='include/i_separator.jsp'%>
                <div class="full-conatin-bar">
                	<jsp:include page='include/i_kalsarpa-yoga.jsp'/>
                    
                </div>
            </div>
            <div class="ad-section">
                <jsp:include page="include/i_promotion.jsp"/>
            </div>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<jsp:include page='include/i_varshphal-allpages.jsp'/>
                	                    
                </div>
                 <%@include file='include/i_separator.jsp'%>
                <div class="full-conatin-bar">
                	<%@include file='include/i_gemstones-report.jsp'%>
                    
                </div>
                 <%@include file='include/i_separator.jsp'%>
                <div class="full-conatin-bar">
                <jsp:include page="include/i_dasha-phala.jsp"/>
                	
                    
                </div>
            </div>
            <div class="ad-section">
            	<jsp:include page="include/i_promotion.jsp"/>
            	
            </div>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<jsp:include page="include/i_planets-in-vedic-astrology.jsp"/>
                    
                </div>
                 <%@include file='include/i_separator.jsp'%>
                <div class="full-conatin-bar">
                	<jsp:include page="include/i_transit-today.jsp"/>
                    
                </div>
                 <%@include file='include/i_separator.jsp'%>
                <div class="full-conatin-bar">
                	<jsp:include page="include/i_nakshatra-report.jsp"/>
                    
                </div>
           
            </div>
            <div class="ad-section">
                <jsp:include page="include/i_promotion.jsp"/>
            </div>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<jsp:include page="include/i_moon-sign.jsp"/>
                    >
                </div>
                 <%@include file='include/i_separator.jsp'%>
               
            </div>
            <div class="full-conatin-bar">
            	<jsp:include page="include/i_favourable.jsp"/>
                
            </div>
            <div class="padding-all">
                <div class="full-conatin-bar">
                	<jsp:include page="include/i_lalkitab-prediction.jsp"/>
                    
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>
