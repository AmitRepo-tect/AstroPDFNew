<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
String headtext="",content="",tagval="";
int lang_FB = Util.safeInt(session.getAttribute("languageCode"));

if(lang_FB == 0 ||  session.getAttribute("languageCode").equals("") || request.getParameter("LanguageType")!= null && request.getParameter("LanguageType").equals("english")){ 
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}

tagval = "cross-english" ;

if(lang_FB == 1 || request.getParameter("LanguageType")!=null &&  request.getParameter("LanguageType").equals("hindi")) { 
    headtext = "एस्ट्रोसेज को लोगों तक पहुंचाने में मदद करें";
    content = "एस्ट्रोसेज भारतीय ज्योतिष की सबसे लोकप्रिय साइट है। एस्ट्रोसेज परिवार के सदस्य बनें और ज्योतिष से जुडी जानकारी प्राप्त करें। <b>लाइक बटन पर क्लिक करके ज्वाइन करें।</b>";
}

if(lang_FB == 2) {
    headtext = "ஆஸ்ட்ரோஸேஜ் உங்களுக்குப் பயனுள்ளதாக இருந்ததா? தெரிந்தவர்களுக்குச் சொல்லுங்கள்";
    content = "ஆஸ்ட்ரோஸேஜ்  இந்தியாவின் மிகப்பெரிய இந்திய ஜோதிடத் தளமாகும். இந்தியாவின் மாபெரும் ஜோதிடக் குழுவின் ஒரு அங்கமாகுங்கள். அதன் மூலம் உங்கள் ஜோதிடத் தகவல்களை உடனுக்குடன் அறிந்து கொள்ளுங்கள். இப்பொழுதே சேருங்கள்!!";
}
if(lang_FB == 4){
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}
if(lang_FB == 5) {
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}

if(lang_FB == 6) {
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}

if(lang_FB == 7){
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}
if(lang_FB == 8) {
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}

if(lang_FB == 9) {
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}

if(lang_FB == 10){
    headtext = "Found AstroSage Useful? Spread the Word";
    content = "AstroSage is largest Indian Astrology Portal. Be part of India's biggest astrology community and keep yourself updated on latest astrology stuff. Join Now!!";
}
%>
<div id="overlay1">
</div>
<div id="popup1">
    <div class="box-area">
        <a href="javascript:closePopup('cancel-facebook','<%=tagval %>','overlay1','popup1')"
            class="close1"></a>
        <div class="container contents">
            <h2>
                <%=headtext %></h2>
            <p>
                <%=content %></p>
            <div class="col3">
             <iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Ffacebook.com%2Fastrology.horoscope&amp;width=50&amp;layout=box_count&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=65" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:50px; height:65px;" allowTransparency="true"></iframe>
             </div>
            <div style="clear: both">
            </div>
        </div>
    </div>
</div>