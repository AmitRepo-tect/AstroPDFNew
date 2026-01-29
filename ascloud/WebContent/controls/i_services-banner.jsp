<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>

<link type="text/css" href="/dist/css/lightslider.min.css" rel="stylesheet" />
<style>.uls li {border-right: 0px solid #ddd;}</style>
<script type="text/javascript" src="/dist/js/lightslider.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () { $("#content-slider").lightSlider({ loop: true, keyPress: true, pager: false, item: 1, auto: true, pause: 4000, controls: false }); });        
</script>

<div class="item bg-white card-shadow <%if(!SharedFunction.Is_Mobile(request)){%>ui-margin-t <%} %>">
    <ul id="content-slider" class="content-slider uls">             
        <li><a href="https://buy.astrosage.com/service/astrosage-brihat-horoscope?language=en&prtnr_id=BKBNH" onclick="getEvents('service', 'brihat-horoscope-banner');"><img src="https://www.astrosage.com/images/promotion/web-bk1-en.jpg" class="img-responsive" alt="AstroSage Brihat Horoscope" /></a></li> 
         <li><a href="//buy.astrosage.com/service/ask-a-question?language=en&prtnr_id=ASKBN" onclick="getEvents('service', 'ask-a-question');"><img src="https://www.astrosage.com/images/promotion/web-ask-a-question-en.jpg" class="img-responsive" alt="Ask A Question" /></a></li> 
         <li><a href="//buy.astrosage.com/service/raj-yoga-report?language=en&prtnr_id=RAJBN" onclick="getEvents('service', 'raj-yoga-report');"><img src="https://www.astrosage.com/images/promotion/raj-yoga-en.jpg" class="img-responsive" alt="Raj Yoga Report" /></a></li>
         <li><a href="https://www.astrosage.com/offer/big-astro-festival.asp?prtnr_id=CABAN" onclick="getEvents('service', 'career-counseling');"><img src="https://www.astrosage.com/images/promotion/ca-bn-en.jpg" class="img-responsive" alt="Career Guidance" /></a></li> 
        
    </ul>
</div>
