<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<div class="body-padding-t navbar-fixed-top">
        <div class="navbar navbar-custom navbar-fixed-top card-shadow" id="appNavbar">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle-l" id="side-nav-slide-left">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>               
                <div id="c-menu--slide-left" class="side-nav side-nav-slide-left">
                    <div class="side-panel-header">
                        <div class="user">
                            <a class="menu-item user" href="/login.asp"><i class="glyphicon glyphicon-user"></i>
                                Login</a></div>
                        <span class="c-menu__close side-nav-close"><i class="material-icons">&#xE5CD;</i></span>
                    </div>
                    <div class="menu-group clear" id="accordion">
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#home" class="collapsed">
                                Home<i class="material-icons pull-right"></i></a></li>
                            <ul id="home" class="panel-collapse collapse" style="height: 0px;">
                                <li><a href="/kundli/">Free Kundli</a></li>
                                <li><a href="/freechart/matchmaking.asp">Horoscope Matching</a></li>
                                <li><a href="/rashifal/">Rashifal/ आज का राशिफल</a></li>
                                <li><a href="/free/hindi-kundli.asp">Hindi Kundli</a> </li>
                                <li><a href="https://marriage.astrosage.com/">AstroSage Marriage</a> </li>
                                <li><a href="/moonsigns/moon.asp">Moon Signs</a> </li>
                                <li><a href="/sunsign.asp">Sun Signs</a> </li>
                                <li><a href="http://buy.astrosage.com/">Astro Shop</a> </li>
                                <li><a href="http://buy.astrosage.com/astrologer">Ask Our Astrologers</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#horo" class="collapsed">
                                Horoscope<i class="material-icons pull-right"></i></a></li>
                            <ul id="horo" class="panel-collapse collapse">
                                <li><a href="/horoscope/">Daily Horoscope</a></li>
                                <li><a href="/horoscope/daily-horoscope-todays-horoscope.asp">Today's Horoscope</a></li>
                                <li><a href="/horoscope/weekly-horoscope.asp">Weekly Horoscope</a></li>
                                <li><a href="/horoscope/weekly-love-horoscope.asp">Weekly Love Horoscope</a></li>
                                <li><a href="/horoscope/monthly-horoscope.asp">Monthly Horoscope</a></li>
                                <li><a href="/rssfeeds/feed.asp">Horoscope RSS</a></li>
                                <li><a href="/zodiac/">Zodiac Signs</a></li>
                                <li><a href="/celebrity-horoscope/">Celebrity Horoscope</a></li>
                                <li><a href="/love-horoscope/">Love Horoscope</a></li>
                                <li><a href="/chinese-horoscope/">Chinese Horoscope</a></li>
                                <li><a href="/chinese-zodiac/">Chinese Zodiac</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#astro" class="collapsed">
                                Astrology<i class="material-icons pull-right"></i></a></li>
                            <ul id="astro" class="panel-collapse collapse">
                                <li><a href="/astrology/">Astrology</a></li>
                                <li><a href="http://k.astrosage.com/">AstroSage Cloud</a></li>
                                <li><a href="/free/astrologysoftware.asp">Free Astrology Software</a></li>
                                <li><a href="/magazine/learn/">Learn Astrology</a></li>
                                <li><a href="/planet/">Planet</a></li>
                                <li><a href="http://video.astrosage.com/">Video Channel</a></li>
                                <li><a href="/magazine/">Magazine</a></li>
                                <li><a href="/celebrity-horoscope/">Kundli Database</a></li>
                                <li><a href="http://astrologer.astrosage.com/">Occult Directory</a></li>
                                <li><a href="http://babynames.astrosage.com/">Baby Names</a></li>
                                <li><a href="http://www.astrosage.com/atlas/">Atlas</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#numero" class="collapsed">
                                Numerology<i class="material-icons pull-right"></i></a></li>
                            <ul id="numero" class="panel-collapse collapse">
                                <li><a href="/numerology/">Numerology Reading</a></li>
                                <li><a href="/numerology/namecompatibility.asp">Numerology Name</a></li>
                                <li><a href="/numerology/calculator.asp">Numerology Calculator</a></li>
                                <li><a href="/numerology/birthdatecompatibility.asp">Birth Date Compatibility</a></li>
                                <li><a href="/namehoroscopematching.asp">Name Compatibility</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#year" class="collapsed">
                                2017<i class="material-icons pull-right"></i></a></li>
                            <ul id="year" class="panel-collapse collapse">
                                <li><a href="/2017/">Year 2017</a></li>
                                <li><a href="/2017/horoscope-2017.asp">Horoscope 2017</a> </li>
                                <li><a href="/2017/tarotreading2017.asp">Tarot Reading 2017</a></li>
                                <li><a href="/2017/jupiter-transit-2017.asp">Jupiter Transit 2017</a> </li>
                                <li><a href="/2017/lalkitab-horoscope-2017.asp">Lal Kitab Horoscope 2017</a></li>
                                <li><a href="/2017/shani-peyarchi-palan-2017.asp">Sani Peyarchi Palan 2017</a></li>
                                <li><a href="/2017/rashifal2017.asp">राशिफल 2017</a> </li>
                                <li><a href="/2017/chinesehoroscope2017.asp">Chinese Horoscope 2017</a> </li>
                                <li><a href="/2017/numerology2017.asp">Numerology 2017</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li class="ribbon"><span class="ribbon-item">NEW</span><a data-toggle="collapse"
                                data-parent="#accordion" href="#yearnew" class="collapsed">2018<i class="material-icons pull-right"></i></a></li>
                            <ul id="yearnew" class="panel-collapse collapse">
                                <li><a href="/2018/">Year 2018</a></li>
                                <li><a href="/2018/horoscope-2018.asp">Horoscope 2018 </a></li>
                                <li><a href="/2018/chinese-horoscope-2018.asp">Chinese Horoscope 2018</a></li>
                                <li><a href="/2018/numerology-reading-2018.asp">Numerology 2018</a></li>
                                <li><a href="/2018/rashifal-2018.asp">राशिफल 2018</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#occult" class="collapsed">
                                Occult<i class="material-icons pull-right"></i></a></li>
                            <ul id="occult" class="panel-collapse collapse">
                                <li><a href="/occult/">Occult</a></li>
                                <li><a href="/palmistry/">Palm Reading</a></li>
                                <li><a href="/tarot/">Tarot Reading</a></li>
                                <li><a href="/psychic/">Psychic</a></li>
                                <li><a href="/vastu/">Vastu Shastra</a></li>
                                <li><a href="/chineseastrology/">Chinese Astrology</a></li>
                                <li><a href="/mantra/">Mantra</a></li>
                                <li><a href="/dream-interpretation/">Dream Interpretation</a></li>
                                <li><a href="/nadiastrology/">Nadi Astrology</a></li>
                                <li><a href="/swarodaya/">Swarodaya</a></li>
                                <li><a href="/nakshatra/">Nakshatra</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#free" class="collapsed">
                                Free Reports<i class="material-icons pull-right"></i></a></li>
                            <ul id="free" class="panel-collapse collapse">
                                <li><a href="/free/">Reports</a></li>
                                <li><a href="/free/kaalsarp-yog.asp">Kaalsarp Yoga</a></li>
                                <li><a href="/gemstones/">Gemstones Report</a></li>
                                <li><a href="/free/sade-sati-report.asp">Shani Sade Sati Report</a></li>
                                <li><a href="/free/mangal-dosha-report.asp">Mangal Dosha Report</a></li>
                                <li><a href="/free/annual-horoscope-varshphal.asp">Free Varshphal</a></li>
                                <li><a href="/free/transit-today.asp">Transit Today Report</a></li>
                                <li><a href="/free/vimshottari-dasha-prediction-life-report.asp">Vimshottari Dasha</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#heal" class="collapsed">
                                Healing<i class="material-icons pull-right"></i></a></li>
                            <ul id="heal" class="panel-collapse collapse">
                                <li><a href="/feng-shui/">Feng Shui</a></li>
                                <li><a href="/reiki/">Reiki</a></li>
                                <li><a href="/meditation/">Meditation</a></li>
                                <li><a href="/yoga/">Yoga</a></li>
                                <li><a href="/crystal/">Crystal Therapy</a></li>
                                <li><a href="/color/">Color</a></li>
                                <li><a href="/acupressure/">Acupressure</a></li>
                                <li><a href="/aromatherapy/">Aromatherapy</a></li>
                                <li><a href="/ayurveda/">Ayurveda</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#panchang" class="collapsed">
                                Panchang<i class="material-icons pull-right"></i></a></li>
                            <ul id="panchang" class="panel-collapse collapse">
                                <li><a href="http://panchang.astrosage.com/panchang/aajkapanchang">Daily Panchang</a></li>
                                <li><a href="http://panchang.astrosage.com/panchang/monthly-panchang">Month Panchang</a></li>
                                <li><a href="http://panchang.astrosage.com/panchang/abhijitmuhurat">Abhijit Muhurat</a></li>
                                <li><a href="http://panchang.astrosage.com/panchang/gowripanchangam">Gowri Panchangam</a></li>
                                <li><a href="http://panchang.astrosage.com/muhurat/do-ghati-muhurat">Do Ghati Muhurat</a></li>
                                <li><a href="/hora.asp">Hora Calculator</a></li>
                                <li><a href="/rahukaal.asp">Today's Rahukalam</a></li>
                                <li><a href="/chogadia.asp">Chogadia</a></li>
                                <li><a href="/sunrise.asp">Sunrise &amp; Sunset Time</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#lalkitab" class="collapsed">
                                Lal Kitab<i class="material-icons pull-right"></i></a></li>
                            <ul id="lalkitab" class="panel-collapse collapse">
                                <li><a href="/lalkitab/">Lal Kitab Home</a></li>
                                <li><a href="/lalkitab_introduction.asp">What is Lal Kitab?</a></li>
                                <li><a href="/free/lal-kitab-report.asp">Lal Kitab Chart Online</a></li>
                                <li><a href="/lalkitab/index.asp">Lal Kitab Kundli Online</a></li>
                                <li><a href="/lalkitab.asp">Lal Kitab Discussion</a></li>
                                <li><a href="https://www.facebook.com/groups/lalkitab/">Lal Kitab Facebook Discussion</a></li>
                                <li><a href="/lalkitab/LKintroduction.asp">Free Lal Kitab E-book</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#kp" class="collapsed">
                                KP<i class="material-icons pull-right"></i></a></li>
                            <ul id="kp" class="panel-collapse collapse">
                                <li><a href="/kpSystemIntro.asp">What is KP System?</a></li>
                                <li><a href="/free/astrologysoftware.asp">Make KP Chart Online</a></li>
                                <li><a href="/rp.asp">Ruling Planets Now</a></li>
                                <li><a href="/kppanchang.asp">KP Panchang Now</a></li>
                                <li><a href="/freekphorary/instantchart.asp?charttype=kp">KP Horary Chart Online</a></li>
                                <li><a href="/kpastrology_forum.asp">KP Astrology Discussion</a></li>
                                <li><a href="http://kpastrology.astrosage.com">KP Astrology Tutorial</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#compatibility" class="collapsed">
                                Compatibility<i class="material-icons pull-right"></i></a></li>
                            <ul id="compatibility" class="panel-collapse collapse">
                                <li><a href="/freechart/matchmaking.asp">Horoscope Matching</a></li>
                                <li><a href="/tamil/porutham.asp">Porutham</a></li>
                                <li><a href="/love-match-compatibility.asp">Love Match</a></li>
                                <li><a href="/signcompatibility.asp">Moon Sign Compatibility</a></li>
                                <li><a href="/astrology/astrology-compatibility.asp">Astrology Compatibility</a></li>
                                <li><a href="/numerology/birthdatecompatibility.asp">Birth Date Compatibility</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#calculators" class="collapsed">
                                Calculators<i class="material-icons pull-right"></i></a></li>
                            <ul id="calculators" class="panel-collapse collapse">
                                <li><a href="/numerology/calculator.asp">Numerology Calculator</a></li>
                                <li><a href="/moonSign.asp">Moon Sign</a></li>
                                <li><a href="/sunsign.asp">Sun Sign</a></li>
                                <li><a href="/rasi-calculator.asp">Rasi Calculator</a></li>
                                <li><a href="/free/rising-ascendant-calculator.asp">Ascendant Calculator</a></li>
                                <li><a href="/astrology/ayanamsa-calculator.asp">Ayanamsa Calculator</a></li>
                                <li><a href="/nakshatra-calculator.asp">Nakshatra Calculator</a></li>
                                <li><a href="/calculators/ghati-to-hour-converter-nizhika.asp">Ghati converter</a></li>
                                <li><a href="/astrology/download-kundli-save-kundli-as-image.asp">Chart image</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#festival" class="collapsed">
                                Festivals<i class="material-icons pull-right"></i></a> </li>
                            <ul id="festival" class="panel-collapse collapse">
                                <li><a href="http://panchang.astrosage.com/festival/guru-purnima/guru-purnima">Guru
                                    Purnima 2017</a></li>
                                <li><a href="http://panchang.astrosage.com/festival/nag-panchami/nag-panchami">Nag Panchami
                                    2017</a></li>
                                <li><a href="http://panchang.astrosage.com/festival/raksha-bandhan">Raksha Bandhan 2017</a></li>
                                <li><a href="http://panchang.astrosage.com/festival/janmashtami/janmashtami">Janmashtami
                                    2017</a></li>
                                <li><a href="http://panchang.astrosage.com/festival/ganesh-chaturthi/ganesh-chaturthi">
                                    Ganesh Chaturthi 2017</a></li>
                                <li><a href="http://panchang.astrosage.com/festival/onam/thiruvonam">Onam/Thiruvonam
                                    2017</a></li>
                                <li><a href="http://panchang.astrosage.com/festival/navratri">Navratri 2017</a></li>
                                <li><a href="http://panchang.astrosage.com/festival/diwali">Diwali 2017</a></li>
                            </ul>
                        </ul>
                        <ul class="panel">
                            <li><a data-toggle="collapse" data-parent="#accordion" href="#misc" class="collapsed">
                                Misc<i class="material-icons pull-right"></i></a> </li>
                            <ul id="misc" class="panel-collapse collapse">
                                <li><a href="/love/">Love</a></li>
                                <li><a href="/wallpapers">Wallpapers</a></li>
                                <li><a href="/sai-baba">Sai Baba</a></li>
                                <li><a href="/sai-baba/help-me-sai-baba.asp">Help Me Sai Baba</a></li>
                                <li><a href="/ramshalaka.asp">Ramshalaka</a></li>
                                <li><a href="/moonsigns/">Moon Signs</a></li>
                                <li><a href="/kundli/">Kundli</a></li>
                                <li><a href="/ask-ganesha-speaks-for-you.asp">Ask Ganesha : Ganesha Speaks for You</a></li>
                                <li><a href="/god/hanuman/hanumanprashnayantra.asp">Hanuman Prashna Yantra</a></li>
                                <li><a href="/transits/">Transit</a></li>
                                <li><a href="http://hindi.astrosage.com/gochar/">गोचर</a></li>
                            </ul>
                        </ul>
                    </div>
                </div>
            </div>
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
   
  

