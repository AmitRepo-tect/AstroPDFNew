<div id="c-menu--slide-left" class="side-nav side-nav-slide-left">
    <div class="side-panel-header">
        <%if(session.getAttribute("UserExists") == null || !session.getAttribute("UserExists").equals("true")) {%>
        <div class="user">
            <a class="menu-item user" href="/login.asp"><i class="glyphicon glyphicon-user"></i> लोगिन</a></div>
        <% }else{ %>
        <div class="user">
            <a class="menu-item user pull-left" href="http://www.astrosage.com/freechart/checkbirthdetails.asp?Msg=<%=session.getAttribute("UserID").toString()%>&Reg=false">
                <i class="glyphicon glyphicon-user"></i> Welcome <span style="color: #ff0000;"><%if(session.getAttribute("UserID").toString().length()>8){%><%=session.getAttribute("UserID").toString().substring(0,8)+".."%><%}else{%><%=session.getAttribute("userid")%><%}%></span>
            </a>
            <a class="btn-white br-radius card-shadow" style="margin-top: -5px; margin-right: 5px; padding:5px;color:#000;" href="/LogOut.asp">लॉगआउट </a>
            <div class="clear"></div>
        </div>
        <%}%>
        <span class="c-menu__close side-nav-close"><i class="material-icons">&#xE5CD;</i></span>
    </div>
    <div class="menu-group clear">
        <ul>
            <li><a href="/">होम</a></li>            
            <li><a href="http://www.astrosage.com/rashifal/">राशिफल</a></li>
            <li><a href="http://www.astrosage.com/2017/rashifal2017.asp">राशिफल 2017</a></li>
            <li><a href="http://hindi.astrosage.com/numerology/">अंक ज्योतिष</a></li>
            <li><a href="http://hindi.astrosage.com/free/">फ्री रिपोर्ट</a></li>
            <li><a href="http://hindi.astrosage.com/free/lal-kitab-report.asp">लाल किताब</a></li>
            <li><a href="http://www.astrosage.com/hindi/planet/">ज्योतिष में ग्रह</a></li>
            <li><a href="http://hindi.astrosage.com/upay/">उपाय</a></li>
            <li><a href="http://hindi.astrosage.com/gochar/">गोचर</a></li>
            <li><a href="http://hindi.astrosage.com/muhurat/">मुहूर्त</a></li>     
            <li><a href="http://hindi.astrosage.com/jyotish/">ज्योतिष</a></li>
            <li><a href="http://hindi.astrosage.com/rashi/">आपकी राशि</a></li>       
        </ul>
    </div>
</div>

<style>
.side-nav-fixjb {position: absolute;}
.side-nav-slide-left-fixjb{height: 640px;}
</style>
<script type="text/javascript">
    var ua = navigator.userAgent;
    if (ua.indexOf("Android") >= 0) {
        var getAndroidVersion = parseFloat(ua.slice(ua.indexOf("Android") + 8));        
        if (getAndroidVersion <= 4.3) {
            $("#c-menu--slide-left").addClass("side-nav-fixjb side-nav-slide-left-fixjb");
        }

    }
   
</script>

