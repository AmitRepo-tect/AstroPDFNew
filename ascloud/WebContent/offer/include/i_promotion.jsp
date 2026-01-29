<%
int languageCodePromo = (Integer)session.getAttribute("languageCode");
if(languageCodePromo==1) { %>
<span class="text-highlight">अपने भविष्य को अभी सँवारें।</span> यह केवल सेम्पल रिपोर्ट
है। एस्ट्रोसेज की महा-कुंडली में आप पाएंगे विस्तृत भविष्यवाणियाँ, ज्योतिषीय गणनाएँ,
प्रभावी उपाय तथा और भी बहुत कुछ, ताकि आप अपने लिए एक बेहतर भविष्य गढ़ सकें।
<div align="center" class="margin-t">
    <a href="javascript:void(0);" data-toggle='modal' data-target='#myModal' class="btn-buy-1 orange">
        अभी ऑर्डर करें सिर्फ़ &#x20B9;650 में </a>
    <div style="color: #c00; margin-top: 5px;">
        (आप &#x20B9;455 की बचत करेंगे)</div>
</div>
<% } else { %>
<span class="text-highlight">Prepare for you future now.</span> It is just a sample
report. AstroSage's Big Horoscope contains detailed predictions, astrological calculations,
effective remedies, and much more, so that you carve a better future for yourself.
<div align="center" class="margin-t">
    <a href="javascript:void(0);" data-toggle='modal' data-target='#myModal' class="btn-buy-1 orange">
        ORDER IT NOW FOR ONLY Rs. 650/- </a>
    <div style="color: #c00; margin-top: 5px;">
        (You will save Rs. 455/-)</div>
</div>
<% } %>
