<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<link type="text/css" href="/dist/css/lightslider.min.css" rel="stylesheet" />
<style>.uls li {border-right: 0px solid #ddd;}</style>
<script type="text/javascript" src="/dist/js/lightslider.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () { $("#content-slider").lightSlider({ loop: true, keyPress: true, pager: false, item: 1, auto: true, pause: 4000, controls: false }); });        
</script>

<div class="item bg-white card-shadow <%if(!SharedFunction.Is_Mobile(request)){%>ui-margin-t <%}%>">
    <ul id="content-slider" class="content-slider uls">             
       <li>
            <a href="http://buy.astrosage.com/service/2018-year-book-large?language=hi&prtnr_id=TSBAN" title="Trikal Samhita 2018" onclick="getEvents('service', 'trikal-samhita-2018');">
                <img src="http://www.astrosage.com/images/promotion/trikal-samhita-2018-hi.jpg" class="img-responsive" alt="Trikal Samhita 2018" />
            </a>
        </li>
        <li>
            <a href="http://www.astrosage.com/offer/big-horoscope.asp?prtnr_id=BHBAN" title="AstroSage Big Horoscope" onclick="getEvents('service', 'big-horoscope-banner');">
                <img src="http://www.astrosage.com/images/promotion/big-horoscope-lg-hi-3.jpg" class="img-responsive" alt="AstroSage Big Horoscope" />
            </a>
        </li>       
        
    </ul>
</div>