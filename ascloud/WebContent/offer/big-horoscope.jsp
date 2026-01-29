<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- #include virtual = "/include/safestr.inc" -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>AstroSage Big Horoscope</title>
    <meta name="description" content="AstroSage Big Horoscope" />
    <meta name="keywords" content="kundli" />
    <!--#include virtual="/include/cssscript-other.asp"-->
<style type="text/css">
    .btn-buy > a{font-size: 18px;display: block;max-width: 250px;}       
    .col-xs-6{padding-left: 0px;padding-right: 0px;}
    .text-sm{ font-size:13px;}
    .panel-heading h4 {margin:0;color:#8a6d3b;}
    .panel-heading i { vertical-align:middle;}
    .panel-heading a {color:#8a6d3b;}
    .buy-page p {margin: 0 0 4px;}
</style>
</head>
<body>

<%
     String getPrtnrId = Util.safestr(request.getParameter("prtnr_id"));
     
 %>
    <div class="ui-container buy-page">
        <div id="roundtopheadid">
            <div class="panel-heading">
                <h4>
                    <a href="javascript:history.back()"><i class="material-icons">&#xE5C4;</i></a>&nbsp;&nbsp;&nbsp;AstroSage
                    Big Horoscope</h4>
            </div>
        </div>
        <div class="ui-padding-t ui-padding-l ui-padding-r">
            <p class="text-justify text-sm">
                <b>What will you get in 100+ pages Big Horoscope:</b> Detailed predictions on marriage, career, finance, health,
                children, property, family etc. Dasha analysis for life. Varshphal for 10 years.
                Favorable period for marriage, career, business. Gemstones and Remedies. Sade-sati,
                Kaal Sarp, Mangal dosha. Bhav Phal and Graha Phal. Detailed calculations - Parashari,
                KP, Lal Kitab.
            </p>
        </div>
        <div class="margin-b">
            <div class="col-xs-6 text-center">
                <img src="/images/pdf.png" width="36" />
                <a href="/pdf/vedic-report-en.pdf" onclick='getEvents("snackbar", "sample-en");'><u>English Sample</u></a>
            </div>
            <div class="col-xs-6 text-center">
                <img src="/images/pdf.png" width="36" />
                <a href="/pdf/vedic-report-hi.pdf" onclick='getEvents("snackbar", "sample-hi");'><u>हिंदी में सैंपल</u></a>
            </div>
            <div class="clear">
            </div>
        </div>
        <div class="margin-b border-t">
            <div class="col-xs-3 col-sm-2">
                <img src="/images/print-kundli-en.png" class="img-responsive" />
            </div>
            <div class="col-xs-9 col-sm-10">
                <h4>
                    PDF Only</h4>
                <p class="text-muted">
                    Instant Delivery</p>
                <p>
                    <b>Price:</b> <strike>Rs. 1105</strike> <b>Rs. 650/-</b></p>
            </div>
            <div class="clear">
            </div>
            <div class="col-xs-12">
                <div align="center" class="btn-buy">
                    <a href="http://buy.astrosage.com/service/astrosage-big-horoscope?prtnr_id=<%=getPrtnrId%>" onclick='getEvents("snackbar", "buy-pdf");' class="btn btn-deep-orange card-shadow br-radius">
                        BUY NOW</a></div>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <div class="margin-t border-t margin-b">
            <div class="col-xs-3 col-sm-2">
                <img src="/images/printed-book.png" class="img-responsive" />
            </div>
            <div class="col-xs-9 col-sm-10">
                <h4>
                    Printed</h4>
                <p class="text-muted">                   
                    Delivery in 7 Days</p>
                <p>
                    <b>Price:</b> <strike>Rs. 2101</strike> <b>Rs. 999/-</b></p>
            </div>
            <div class="clear">
            </div>
            <div class="col-xs-12">
                <div align="center" class="btn-buy">
                    <a href="http://buy.astrosage.com/miscellaneous/astrosage-big-horoscope?prtnr_id=<%=getPrtnrId%>" onclick='getEvents("snackbar", "print-pdf");' class="btn btn-deep-orange card-shadow br-radius">
                        BUY NOW</a></div>
            </div>
            <div class="clearfix">
            </div>
        </div>
        <br />
    </div>
</body>
</html>
