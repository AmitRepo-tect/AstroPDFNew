<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>

<%
Local snackBarLocal = new Local();
int snackBarLang= Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle rBIServicesSnackBar = snackBarLocal.loadPropertiesFileNew("i_services",snackBarLang);
String snbLang = "";

if(snackBarLang==1){
	snbLang = "Hi";
}else{
	
	snbLang = "En";
}
%>

<script type="text/javascript">

function getRndInteger(max) {
    return Math.floor(Math.random() * max) + 1;
}

function getSnackBarRnd() {  
    
	var randomTextEn = new Array(2);
    var randomTextHi = new Array(2);
	
	langCodeEN = "EN"
	langCodeHI = "HI"
    
    randomTextEn[1] = '<a href="" onclick="getSnackBar("snackbar", "click-ask-cloud");">Ask A Question @ Rs. 299 <span class="btn white black-text">ASK NOW</span></a>';    
    randomTextEn[2] = '<a href="#" onclick=popupFromSnackBar("'+langCodeEN+'");>Brihat Horoscope @ 999 <span class="btn white black-text">BUY NOW</span></a>';
    
    
    randomTextHi[1] = '<a href="https://buy.astrosage.com/service/ask-a-question?prtnr_id=NCAQS" onclick="getSnackBar("snackbar", "click-ask-cloud");">प्रश्न पूछें मात्र  &#x20B9; 299 में <span class="btn white black-text">अभी पूछें</span></a>';    
    randomTextHi[2] = '<a href="#" onclick=popupFromSnackBar("'+langCodeHI+'"); >बृहत कुंडली मात्र &#x20B9; 999 में <span class="btn white black-text">अभी खरीदें</span></a>';
   
    <%-- document.getElementById("RandomText<%=snbLang%>").innerHTML = randomText<%=snbLang%>[2]; --%>
    
    
}

function setAnchorText(){
	if("<%=snackBarLang%>"==1){
		document.getElementById("txtAnchSnack").innerHTML = "कुंडली खरीदें";
		document.getElementById("spnOffer").innerHTML = "आज का ऑफर: 52% ऑफ";
		document.getElementById("paraOffer").innerHTML = "सबसे विस्तृत व सटीक कुंडली";
		
	}
	else{
		document.getElementById("txtAnchSnack").innerHTML = "Buy Horoscope";
		document.getElementById("spnOffer").innerHTML = "Today's OFFER: 52% OFF";
		document.getElementById("paraOffer").innerHTML = "most detailed Horoscope";
	}
}

<%-- function setAnchorText(){
	if("<%=snackBarLang%>"==1){
		document.getElementById("txtAnchSnack").innerHTML = "अभी खरीदें";
		document.getElementById("spnOffer").innerHTML = "शुरुआती छूट : 33% ऑफ";
		document.getElementById("paraOffer").innerHTML = "आधुनिक ज्योतिष सॉफ्टवेयर";
		
	}
	else{
		document.getElementById("txtAnchSnack").innerHTML = "Buy Now";
		document.getElementById("spnOffer").innerHTML = "Introductory Offer : 33% Off";
		document.getElementById("paraOffer").innerHTML = "Modern Astrology Software";
	}
} --%>

$(function(){
	setAnchorText();
});

function popupFromSnackBar(lang){
	
	if(lang=='HI'){
		openServicePopup('148', '<%=rBIServicesSnackBar.getString("SERVICE_NAME_3")%>', 'brihat-horoscope.png', '750', '1498', 'https://www.astrosage.com/pdf/brihat-horoscope.pdf', 'https://www.astrosage.com/pdf/brihat-horoscope-hi.pdf','<%=rBIServicesSnackBar.getString("SERVICE_DESC_3")%>', 'NCBKS');
		getSnackBar("snackbar", "click-bk-cloud");
	}
	else{
		openServicePopup('148', '<%=rBIServicesSnackBar.getString("SERVICE_NAME_3")%>', 'brihat-horoscope.png', '750', '1498', 'https://www.astrosage.com/pdf/brihat-horoscope.pdf', 'https://www.astrosage.com/pdf/brihat-horoscope-hi.pdf','<%=rBIServicesSnackBar.getString("SERVICE_DESC_3")%>', 'NCBKS');
		getSnackBar("snackbar", "click-bk-cloud");
	}
}
</script>



<div class="fixedBottom valign-wrapper snackbar">
    <span class="btn btn-flat white-text snackbar-close cancel-btn" onclick="closeSnackBar('snackbar', 'cancel-snackbar');"><i class="material-icons">close</i></span> 
    <div class="left cont"> <span id="spnOffer"></span> <p id="paraOffer"> </p></div>    
    <div class="right anch"> <a href="#" onclick="popupFromSnackBar('EN');" id="txtAnchSnack"></a> </div>    
    <%-- <span id="RandomText<%=snbLang%>"></span>  --%>     
</div>     
<style>    
    .fixedBottom{ padding: 13px 5px 4px 5px;background: #263238; bottom: -100px; position:fixed; display:none; width:100%;box-shadow: 0px -1px 4px #888888; z-index:1051} 
    .fixedBottom a{font-size: 16px;color: #fff;display: block; text-align:center;}  
    .cancel-btn { position: absolute; right:-14px; top:-9px;}   
    .fixedBottom .cont { width:58%; text-align: left; font-size: 16px; line-height: 28px; } .fixedBottom .cont span { background: #ffeb3b; color:#000; padding: 5px 6px; border-radius:4px; margin-right: 6px; }  
    .cont p { padding-top: 2px; }
    .anch { margin-top: 8px; margin-right: 20px; } .anch a { font-size: 16px; padding: 5px 8px; line-height: 28px; border-radius:4px; text-transform: capitalize; background: #fff; color:#000; font-weight:bold; }
    @media (max-width:380px){.fixedBottom a{font-size: 14px;}  .anch a {font-size: 14px;} .fixedBottom .cont {font-size: 14px; }}
</style>
<script type="text/javascript">
    $(function () {
        $(".snackbar").animate({ bottom: "0px" }, 1200);
        $(".snackbar").hide();
        if (!getCookiesSnackBar()) {
            $(".snackbar").show();
            $(".snackbar-close").click(function () {
                $(".snackbar").hide(300);
                setCookiesSnackBar();
            });
        }
    });
    function getSnackBar(tagvalue, tag) {
        _gaq.push(['_trackEvent', tagvalue, tag]);
    }
    function closeSnackBar(tagvalue, tag) {
        _gaq.push(['_trackEvent', tagvalue, tag]);
        setCookiesSnackBar();
    }
    function setCookiesSnackBar() {
        document.cookie = "snackbar=1";
    }
    function getCookiesSnackBar() {
        flag = 0;
        findcookies = "snackbar=1";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            if (c.indexOf(findcookies) != -1) {
                flag = 1;
                break;
            }
        }
        if (flag == 1) {
            return true;
        }
        else {
            return false;
        }
    }
</script>
