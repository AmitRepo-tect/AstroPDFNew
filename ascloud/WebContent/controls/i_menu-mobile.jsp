<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>

<div id="c-menu--slide-left" class="side-nav side-nav-slide-left">
    <div class="side-panel-header">      
        <div class="user">
         <a class="menu-item user" href="/login.asp"><i class="glyphicon glyphicon-user"></i> Login</a></div>       
        <span class="c-menu__close side-nav-close"><i class="material-icons">&#xE5CD;</i></span>
    </div>
    <div class="menu-group clear" id="accordion">

         <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#home">Home<i class="material-icons pull-right">&#xE5CF;</i></a></li>
            <ul id="home" class="panel-collapse collapse in">
                <li><a href="https://www.astrosage.com/2020/horoscope-2020.asp">Horoscope 2020</a></li> 
                <li><a href="https://www.astrosage.com/2020/rashifal-2020.asp">राशिफल 2020</a></li>
                <li><a href="https://panchang.astrosage.com/calendars/indiancalendar?date=2020&language=en">Calendar 2020</a></li>
                <li><a href="https://www.astrosage.com/kundli/">Kundli</a></li>
                <li><a href="https://www.astrosage.com/freechart/matchmaking.asp">Horoscope Matching</a></li>
                <li><a href="https://www.astrosage.com/rashifal/">Rashifal/ आज का राशिफल</a></li>
                <li><a href="https://www.astrosage.com/horoscope/">Horoscope</a></li> 
                <li><a href="https://panchang.astrosage.com/">Panchang</a></li>
                <li><a href="https://www.astrosage.com/free/hindi-kundli.asp">Hindi Kundli</a> </li>
                <li><a href="https://www.astrosage.com/numerology/">Numerology</a></li>
                <li><a href="https://www.astrosage.com/moonsigns/moon.asp">Moon Signs</a> </li>
                <li><a href="https://www.astrosage.com/sunsign.asp">Sun Signs</a> </li>
                <li><a href="//buy.astrosage.com/">Astro Shop</a> </li>
                <li><a href="https://horoscope.astrosage.com/">AstroSage Magazine</a> </li>
                <li><a href="//buy.astrosage.com/astrologer/">Ask Our Astrologers</a></li>
                <li><a href="/marriage-prediction.asp">Marriage Prediction</a></li>               
                <li><a href="https://marriage.astrosage.com/">AstroSage Marriage</a> </li>
                <li><a href="https://www.astrosage.com/magazine/" style="color:red;">E-Magazine</a> </li>
            </ul>
        </ul>

          <ul class="panel">
            <li class="ribbon"><span class="ribbon-item">NEW</span><a data-toggle="collapse" data-parent="#accordion" href="#yearnew">2020<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="yearnew" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/2020/horoscope-2020.asp">Horoscope 2020</a></li> 
                <li><a href="https://www.astrosage.com/2020/rashifal-2020.asp">राशिफल 2020</a></li>
                <li><a href="https://www.astrosage.com/2020/chinese-horoscope-2020.asp">Chinese Horoscope 2020</a></li>
                <li><a href="https://www.astrosage.com/2020/numerology-reading-2020.asp">Numerology 2020</a></li>
                <li><a href="https://www.astrosage.com/2020/lal-kitab-horoscope-2020.asp">Lal Kitab Horoscope 2020</a></li>
                <li><a href="https://www.astrosage.com/2020/ank-jyotish-2020-rashifal.asp">अंक ज्योतिष 2020</a></li>  
                <li><a href="https://www.astrosage.com/2020/grahan-2020.asp">Grahan 2020</a></li> 
                <li><a href="https://panchang.astrosage.com/calendars/indiancalendar?date=2020&language=en">Calendar 2020</a></li> 
                <li><a href="https://www.astrosage.com/2020/rasi-palan-2020.asp">Tamil Horoscope 2020</a></li>
                <li><a href="https://www.astrosage.com/2020/rasi-phalalu-2020.asp">Telugu Horoscope 2020</a></li>
                <li><a href="https://www.astrosage.com/2020/kannada-horoscope-2020.asp">Kannada Horoscope 2020 </a></li>
                <li><a href="https://www.astrosage.com/2020/rashi-phalam-2020.asp">Malayalam Horoscope 2020 </a></li>
                <li><a href="https://www.astrosage.com/2020/gujarati-rashi-bhavishya-2020.asp">Gujarati Horoscope 2020 </a></li>
                <li><a href="https://www.astrosage.com/2020/marathi-rashi-bhavishya-2020.asp">Marathi Horoscope 2020 </a></li>
                <li><a href="https://www.astrosage.com/2020/bengali-rashifal-2020.asp">Bengali Rashifal 2020 </a></li>
                <li><a href="https://www.astrosage.com/2019/nepali-rashifal-2019.asp">Nepali Rashifal 2019 </a></li>
                <li><a href="https://www.astrosage.com/2019/urdu-horoscope-2019.asp">Urdu Horoscope 2019 </a></li>
                <li><a href="https://www.astrosage.com/2020/">Astrology 2020</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#horo">Horoscope<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="horo" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/horoscope/">Horoscope</a></li>
                <li><a href="https://www.astrosage.com/horoscope/daily-horoscope-todays-horoscope.asp">Today's  Horoscope</a></li>
                <li><a href="https://www.astrosage.com/horoscope/tomorrow-horoscope.asp">Tomorrow's Horoscope</a></li>
                <li><a href="https://www.astrosage.com/horoscope/weekly-horoscope.asp">Weekly Horoscope</a></li>
                <li><a href="https://www.astrosage.com/horoscope/weekly-love-horoscope.asp">Weekly Love Horoscope</a></li>
                <li><a href="https://www.astrosage.com/horoscope/monthly-horoscope.asp">Monthly Horoscope</a></li>
                <li><a href="https://www.astrosage.com/zodiac/">Zodiac Signs</a></li>
                <li><a href="https://celebrity.astrosage.com/">Celebrity Horoscope</a></li>
                <li><a href="https://www.astrosage.com/love-horoscope/">Love Horoscope</a></li>
                <li><a href="https://www.astrosage.com/chinese-horoscope/">Chinese Horoscope</a></li>
                <li><a href="https://www.astrosage.com/chinese-zodiac/">Chinese Zodiac</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#astro">Astrology<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="astro" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/astrology/">Astrology</a></li>
                <li><a href="//k.astrosage.com/">AstroSage Cloud</a></li>
                <li><a href="https://www.astrosage.com/free/astrologysoftware.asp">Free Astrology Software</a></li>
                <li><a href="https://www.astrosage.com/magazine/learn/">Learn Astrology</a></li>
                <li><a href="https://www.astrosage.com/planet/">Planet</a></li>
                <li><a href="https://www.youtube.com/user/AstroSageIndia?sub_confirmation=1">Video Channel</a></li>
                <li><a href="https://www.astrosage.com/magazine/">Magazine</a></li>
                <li><a href="/celebrity-horoscope/">Kundli Database</a></li>
                <li><a href="//astrologer.astrosage.com/">Occult Directory</a></li>
                <li><a href="//babynames.astrosage.com/">Baby Names</a></li>
                <li><a href="https://www.astrosage.com/atlas/">Atlas</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#numero">Numerology<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="numero" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/numerology/">Numerology Reading</a></li>
                <li><a href="https://www.astrosage.com/numerology/namecompatibility.asp">Numerology Name</a></li>
                <li><a href="https://www.astrosage.com/numerology/calculator.asp">Numerology Calculator</a></li>
                <li><a href="https://www.astrosage.com/numerology/birthdatecompatibility.asp">Birth Date Compatibility</a></li>
                <li><a href="https://www.astrosage.com/namehoroscopematching.asp">Name Compatibility</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#occult">Occult<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="occult" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/occult/">Occult</a></li>
                <li><a href="https://www.astrosage.com/palmistry/">Palm Reading</a></li>
                <li><a href="https://www.astrosage.com/tarot/">Tarot Reading</a></li>
                <li><a href="https://www.astrosage.com/psychic/">Psychic</a></li>
                <li><a href="https://www.astrosage.com/vastu/">Vastu Shastra</a></li>
                <li><a href="https://www.astrosage.com/chineseastrology/">Chinese Astrology</a></li>
                <li><a href="https://www.astrosage.com/mantra/">Mantra</a></li>
                <li><a href="https://www.astrosage.com/chalisa/">Chalisa</a></li>
                <li><a href="https://www.astrosage.com/aarti/">Aarti</a></li>
                <li><a href="https://www.astrosage.com/dharma-karma/">Dharma Karma</a></li>
                <li><a href="https://www.astrosage.com/dream-interpretation/">Dream Interpretation</a></li>
                <li><a href="https://www.astrosage.com/nadiastrology/"> Nadi Astrology</a></li>
                <li><a href="https://www.astrosage.com/swarodaya/"> Swarodaya</a></li>
                <li><a href="https://www.astrosage.com/nakshatra/"> Nakshatra</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#free">Free Reports<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="free" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/free/">Reports</a></li>
                <li><a href="https://www.astrosage.com/free/kaalsarp-yog.asp">Kaalsarp Yoga</a></li>
                <li><a href="https://www.astrosage.com/gemstones/">Gemstones Report</a></li>
                <li><a href="https://www.astrosage.com/free/sade-sati-report.asp">Shani Sade Sati Report</a></li>
                <li><a href="https://www.astrosage.com/free/mangal-dosha-report.asp">Mangal Dosha Report</a></li>
                <li><a href="https://www.astrosage.com/free/annual-horoscope-varshphal.asp">Free Varshphal</a></li>
                <li><a href="https://www.astrosage.com/free/transit-today.asp">Transit Today Report</a></li>
                <li><a href="https://www.astrosage.com/free/vimshottari-dasha-prediction-life-report.asp">Vimshottari Dasha</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#heal">Healing<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="heal" class="panel-collapse collapse">                
                <li><a href="https://www.astrosage.com/feng-shui/">Feng Shui</a></li>
                <li><a href="https://www.astrosage.com/reiki/">Reiki</a></li>
                <li><a href="https://www.astrosage.com/meditation/">Meditation</a></li>
                <li><a href="https://www.astrosage.com/yoga/">Yoga</a></li>
                <li><a href="https://www.astrosage.com/crystal/">Crystal Therapy</a></li>
                <li><a href="https://www.astrosage.com/color/">Color</a></li>
                <li><a href="https://www.astrosage.com/acupressure/">Acupressure</a></li>
                <li><a href="https://www.astrosage.com/aromatherapy/">Aromatherapy</a></li>
                <li><a href="https://www.astrosage.com/ayurveda/">Ayurveda</a></li>
                <li><a href="https://www.astrosage.com/medical-astrology/">Medical Astrology</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#panchang">Panchang<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="panchang" class="panel-collapse collapse">
                 <li><a href="https://panchang.astrosage.com/panchang/aajkapanchang">Daily Panchang</a></li>
                 <li><a href="https://panchang.astrosage.com/panchang/monthly-panchang">Month Panchang</a></li>
                 <li><a href="https://panchang.astrosage.com/panchang/abhijitmuhurat">Abhijit Muhurat</a></li>
                 <li><a href="https://panchang.astrosage.com/panchang/gowripanchangam">Gowri Panchangam</a></li>
                 <li><a href="https://panchang.astrosage.com/muhurat/do-ghati-muhurat">Do Ghati Muhurat</a></li>      
                 <li><a href="https://www.astrosage.com/hora.asp">Hora Calculator</a></li>
                 <li><a href="https://www.astrosage.com/rahukaal.asp">Today's Rahukalam</a></li>
                 <li><a href="https://www.astrosage.com/chogadia.asp">Chogadia</a></li>
                 <li><a href="https://www.astrosage.com/sunrise.asp">Sunrise & Sunset Time</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#lalkitab">Lal Kitab<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="lalkitab" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/lalkitab/">Lal Kitab Home</a></li>
                <li><a href="https://www.astrosage.com/lalkitab_introduction.asp">What is Lal Kitab?</a></li>
                <li><a href="https://www.astrosage.com/free/lal-kitab-report.asp">Lal Kitab Chart Online</a></li>
                <li><a href="https://www.astrosage.com/lalkitab/index.asp">Lal Kitab Kundli Online</a></li>
                <li><a href="https://www.astrosage.com/lalkitab.asp">Lal Kitab Discussion</a></li>
                <li><a href="https://www.facebook.com/groups/lalkitab/" target="_blank" rel="nofollow"> Lal Kitab Facebook Discussion</a></li>
                <li><a href="https://www.astrosage.com/lalkitab/LKintroduction.asp"> Free Lal Kitab E-book</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#kp">KP<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="kp" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/kpSystemIntro.asp">What is KP System?</a></li>
                <li><a href="https://www.astrosage.com/free/astrologysoftware.asp">Make KP Chart Online</a></li>
                <li><a href="https://www.astrosage.com/rp.asp">Ruling Planets Now</a></li>
                <li><a href="https://www.astrosage.com/kppanchang.asp">KP Panchang Now</a></li>
                <li><a href="https://www.astrosage.com/freekphorary/instantchart.asp?charttype=kp">KP Horary Chart Online</a></li>
                <li><a href="https://www.astrosage.com/kpastrology_forum.asp">KP Astrology Discussion</a></li>
                <li><a href="http://kpastrology.astrosage.com/">KP Astrology Tutorial</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#compatibility">Compatibility<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="compatibility" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/freechart/matchmaking.asp">Horoscope Matching</a></li>
                <li><a href="https://www.astrosage.com/tamil/porutham.asp">Porutham</a></li>
                <li><a href="https://www.astrosage.com/love-match-compatibility.asp">Love Match</a></li>
                <li><a href="https://www.astrosage.com/signcompatibility.asp">Moon Sign Compatibility</a></li>
                <li><a href="https://www.astrosage.com/astrology/astrology-compatibility.asp">Astrology Compatibility</a></li>
                <li><a href="https://www.astrosage.com/numerology/birthdatecompatibility.asp">Birth Date Compatibility</a></li>
                <li><a href="https://www.astrosage.com/compatibility/">Compatibility Tools</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#calculators">Calculators<i class="material-icons pull-right">&#xE5CC;</i></a></li>
            <ul id="calculators" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/calculators/">Astrology Calculators</a></li>
                <li><a href="https://www.astrosage.com/numerology/calculator.asp">Numerology Calculator</a></li>
                <li><a href="https://www.astrosage.com/moonSign.asp">Moon Sign</a></li>
                <li><a href="https://www.astrosage.com/sunsign.asp">Sun Sign</a></li>
                <li><a href="https://www.astrosage.com/rasi-calculator.asp">Rasi Calculator</a></li>
                <li><a href="https://www.astrosage.com/free/rising-ascendant-calculator.asp">Ascendant Calculator</a></li>
                <li><a href="https://www.astrosage.com/astrology/ayanamsa-calculator.asp">Ayanamsa Calculator</a></li>
                <li><a href="https://www.astrosage.com/nakshatra-calculator.asp">Nakshatra Calculator</a></li>
                <li><a href="https://www.astrosage.com/calculators/ghati-to-hour-converter-nizhika.asp">Ghati converter</a></li>
                <li><a href="https://www.astrosage.com/astrology/download-kundli-save-kundli-as-image.asp">Chart image</a></li>
                <li><a href="https://www.astrosage.com/calculators/love-calculator.asp" title="Love Calculator">Love Calculator</a></li>
                <li><a href="https://www.astrosage.com/calculators/friendship-calculator.asp" title="Friendship Calculator">Friendship Calculator</a></li>
            </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#festival">Festivals<i class="material-icons pull-right">&#xE5CC;</i></a> </li>
            <ul id="festival" class="panel-collapse collapse">                                                                                                                      
             <li><a href="https://panchang.astrosage.com/festival/shivratri/mahashivratri?date=2020">Mahashivratri 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/holi/holi-festival?date=2020">Holi 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/navratri/chaitra-navratri?date=2020">Chaitra Navratri 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/jagannath-rath-yatra?date=2020">Jagannath Rath Yatra 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/nag-panchami/nag-panchami?date=2020">Nag Panchami 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/raksha-bandhan?date=2020">Raksha Bandhan 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/janmashtami/janmashtami?date=2020">Janmashtami 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/ganesh-chaturthi/ganesh-chaturthi?date=2020">Ganesh Chaturthi 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/navratri/sharad-navratri?date=2020">Sharad Navratri 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/dussehra/dussehra?date=2020">Dussehra 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/karvachauth/karvachauth-date-moonrise-time?date=2020">Karwa Chauth 2020</a></li>
             <li><a href="https://panchang.astrosage.com/festival/diwali/diwali-date-muhurat?date=2020">Diwali 2020</a></li>

            
         </ul>
        </ul>
        <ul class="panel">
            <li><a data-toggle="collapse" data-parent="#accordion" href="#misc">Misc<i class="material-icons pull-right">&#xE5CC;</i></a> </li>
            <ul id="misc" class="panel-collapse collapse">
                <li><a href="https://www.astrosage.com/love/">Love</a></li>
                <li><a href="https://www.astrosage.com/wallpapers/">Wallpapers</a></li>
                <li><a href="https://www.astrosage.com/sai-baba/">Sai Baba</a></li>
                <li><a href="https://www.astrosage.com/sai-baba/help-me-sai-baba.asp">Help Me Sai Baba</a></li>
                <li><a href="https://www.astrosage.com/ramshalaka.asp">Ramshalaka</a></li>
                <li><a href="https://www.astrosage.com/moonsigns/">Moon Signs</a></li>
                <li><a href="https://www.astrosage.com/kundli/">Kundli</a></li>
                <li><a href="https://www.astrosage.com/ask-ganesha-speaks-for-you.asp">Ask Ganesha : Ganesha Speaks for You</a></li>
                <li><a href="https://www.astrosage.com/god/hanuman/hanumanprashnayantra.asp">Hanuman Prashna Yantra</a></li>
                <li><a href="https://www.astrosage.com/transits/">Transit</a></li>
                <li><a href="//hindi.astrosage.com/gochar/">गोचर</a></li> 
            </ul>
        </ul>
    </div>
</div>


<script type="text/javascript">
    var ua = navigator.userAgent;
    if (ua.indexOf("Android") >= 0) {
        var getAndroidVersion = parseFloat(ua.slice(ua.indexOf("Android") + 8));
        if (getAndroidVersion <= 4.3) {
            $("#c-menu--slide-left").addClass("side-nav-fixjb side-nav-slide-left-fixjb");
        }

    }

    $('.collapse').on('shown.bs.collapse', function () {
        $(this).parent().find(".material-icons").html("&#xE5CF;");

    }).on('hidden.bs.collapse', function () {
        $(this).parent().find(".material-icons").html("&#xE5CC;");
    });
</script>
