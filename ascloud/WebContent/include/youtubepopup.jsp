<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
int lang_Utube = Util.safeInt(session.getAttribute("languageCode"));
String tagval = "",LeftImagePath="",RightImagePath="",AstroSageImg="",L1="",L2="",L3="",L4="";
if(lang_Utube == 0 || session.getAttribute("languageCode").equals("") || request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("english")) {
    tagval = "cross-english";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

if(lang_Utube == 1 || request.getParameter("LanguageType")!=null &&  request.getParameter("LanguageType").equals("hindi")) {
    tagval = "cross-hindi";
    LeftImagePath = "/images/promotion/subscribe-btn-hin.png";
    RightImagePath = "/images/promotion/subscribe-large-btn-hin.png";
    AstroSageImg ="/images/promotion/astrosage-tv-hin.png";
    L1 = "विशेषज्ञों से सीखिए ज्योतिष";
    L2 = "जीवन की बेहतरी के सूत्र";
    L3 ="ज्योतिष द्वारा जीवन में पाएँ सफलता";
    L4 = "जानें ज्योतिष के रहस्य और गूढ़ तत्व";
}

if(lang_Utube == 2){
    tagval = "cross-tamil";
    LeftImagePath = "/images/promotion/subscribe-btn-tam.png";
    RightImagePath = "/images/promotion/subscribe-large-btn-tam.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "ஜோதிட ஆசிரியர்களிடம் ஜோதிடம் கற்றுக் கொள்ளுங்கள்";
    L2 = "வாழ்க்கை முன்னேற்றக் குறிப்புகள்";
    L3 ="ஜோதிடம் மூலம் வாழ்க்கையில் வெற்றி பெறுவது எப்படி";
    L4 = "ஜோதிடத்தின் ரகசியங்களும் மர்மங்களும்";
}

if(lang_Utube == 4) {
 tagval = "cross-kannada";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

if( lang_Utube == 5) {
    tagval = "cross-telugu";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

if(lang_Utube == 6){
 tagval = "cross-bengali";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

if(lang_Utube == 7) {
 tagval = "cross-gujarati";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

if(lang_Utube == 8) {
 tagval = "cross-malayalam";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

if(lang_Utube == 9) {
    tagval = "cross-marathi";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

if(lang_Utube == 10) {
 tagval = "cross-urdu";
    LeftImagePath = "/images/promotion/subscribe-btn.png";
    RightImagePath = "/images/promotion/subscribe-large-btn.png";
    AstroSageImg ="/images/promotion/astrosage-tv2.png";
    L1 = "Learn astrology with astrology masters";
    L2 = "Tips on improving life";
    L3 ="How to achieve success in life with astrology";
    L4 = "Secrets &amp; mysteries of astrology";
}

String curr_url = request.getRequestURI();
String usingclass= "",usingclass1="",usingclass2;
if(curr_url.contains("freekundali") || curr_url.contains("cloud") ){
  usingclass="col1";
  usingclass1="col2";
   usingclass2="";
}else{
  usingclass="leftbox";
  usingclass1="rightbox";
   usingclass2="row";
 
}
%>

<div id="overlay0"></div>
<div id="popup0" class="promo-popup modal">
 <div class="modal-content no-padding"> 
        <a href="javascript:closePopup('cancel-youtube','<%=tagval %>','overlay0','popup0')" class="close1"></a>
        <div class="<%=usingclass2 %>">
        <div class="col-md-4 <%=usingclass %>">
            <div align="center" style="margin: 30px 0 0 15px;">
            <a target="_blank" href="http://www.youtube.com/user/AstroSageIndia?sub_confirmation=1" rel="nofollow"  onclick="javascript:closePopup('subscribe-youtube','icon','overlay0','popup0');">
                <img src="/images/promotion/videoicon.png" width="200" /></a></div>
            <div align="center" style="margin: 55px 0 0 15px;">
                <a target="_blank" href="http://www.youtube.com/user/AstroSageIndia?sub_confirmation=1" rel="nofollow"  onclick="javascript:closePopup('subscribe-youtube','left','overlay0','popup0');">
                  <img src="<%=LeftImagePath%>" width="200" /></a>
                   
            </div>
        </div>
        <div class="col-md-8 <%=usingclass1 %>">
            <div class="header-area">
                <h2 align="center">
                <a  target="_blank" href="http://www.youtube.com/user/AstroSageIndia?sub_confirmation=1" rel="nofollow"  onclick="javascript:closePopup('subscribe-youtube','logo','overlay0','popup0')">
                    
                     <img src="<%=AstroSageImg%>" width="300" /></a></h2>
                <div style="clear: both">
                </div>
            </div>
            <div class="content-area">
                <ul>
                    <li style="text-align:left;"><%=L1%></li>
                    <li style="text-align:left;"><%=L2%></li>
                    <li style="text-align:left;"><%=L3%></li>
                    <li style="text-align:left;"><%=L4%></li> 
                </ul>
                <div align="right" style="margin-top: 16px; margin-right: 15px">
                    <a target="_blank" href="http://www.youtube.com/user/AstroSageIndia?sub_confirmation=1" rel="nofollow"  onclick="javascript:closePopup('subscribe-youtube','right','overlay0','popup0')">
                        <img src="<%=RightImagePath%>" width="379" /></a>
                      
                </div>
                <div style="clear: both">
                </div>
            </div>
            <div class="footer-area">
            </div>
        </div>
        <div style="clear: both">
        </div>
        </div>
    </div>
</div>