<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Local promoLocal = new Local();
int langCodePromo = Util.safeInt(session.getAttribute("languageCode"));
MyProperties promoConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBIServicesPromo = promoLocal.loadPropertiesFileNew("i_services",langCodePromo);
MyResourceBundle promoBan = promoLocal.loadPropertiesFileNew("bk-popup",langCodePromo);
%>
<style type="text/css">
.clearfix:before, .clearfix:after{display: table;content: " ";}    
.clearfix:after { clear: both;}    
.pull-right{float: right !important;}    
.pull-left{float: left !important;}   
.left-section{float: left !important; width: 50%;}
.right-section{float: right !important; width: 50%;}    
.left-section img{ width: 120px;padding-right: 10px; vertical-align: middle; }
.right-section img{width: 120px; padding-right: 10px;vertical-align: middle;}
.sec-text{ position: relative;}
.sec-text h3{margin: 0;padding: 0;}
.sec-text p {margin: 0;padding: 0;}
.ui-widget-content a{color: #fff;}
a.smp{color: #990000;outline: none;}
.mrgb-0{margin-bottom:0;}
.sec-sample{border-bottom: 1px solid #ddd; padding-bottom: 10px;}
.buy-button{background: #e35e05;-moz-border-radius: 3px;-webkit-border-radius: 3px; border-radius: 3px;cursor: pointer;font-size: 16px;font-weight: bold;padding: 8px 15px;text-decoration: none;display: block;outline: none; margin: 10px 20px;box-shadow: 0 1px 2px 0 rgba(0,0,0,0.16),0 1px 5px 0 rgba(0,0,0,0.12);}
</style>
<script type="text/javascript">

    function openBigHoroPopup() {
        $("#dialog-bh-horo").modal("open");
    }
    function openRajYogaPopup() {
        $("#dialog-rajyoga").modal("open");
    }   

</script>
<%
String param="NCBHB";
String rjban="NCRYB";
String gtImgUrl = "";
String ryhdg = "";
String rytxt1 = "";
String rytxt2 ="";
String rytxt3 ="";
String rytxt4 ="";
String rytxt5 ="";
String rytxt6 ="";
if(langCodePromo==1)
{
	param="NCBHB&language=hi";
	rjban="NCRYB&language=hi";
	gtImgUrl = "hi";
	ryhdg = "राज योग रिपोर्ट";
	rytxt1 = "जानें आपकी जन्म कुंडली में उपस्थित राज योग से जुड़ी जानकारी। आपकी कुंडली में कौन-कौन से योग हैं उपस्थित और क्या हैं उनके प्रभाव? क्योंकि इन योगों के माध्यम से आपको होगी धन-संपत्ति, सौंदर्य, वाहन और समस्त भौतिक सुखों की प्राप्ति।";
	rytxt2 = " राज योग रिपोर्ट (पीडीएफ)";
	rytxt3 = "तुरंत पाएँ";
	rytxt4 = "<b>कीमत:</b> <strike>&#x20B9; 499/-</strike> <b>&#x20B9; 299/-</b>";
	rytxt5 = "सैंपल देखें";
	rytxt6 = "अभी खरीदें";	
}else{
	gtImgUrl = "en";
	ryhdg = "Raj Yoga Report";
	rytxt1 = "Get details about several Raj Yogas originating in the horoscope. Through these yogas, get information about various aspects of your life, income, beauty, vehicles and other worldly pleasures.";
	rytxt2 = "Raj Yoga Report (PDF)";
	rytxt3 = "Instant Delivery";
	rytxt4 = "<b>Price:</b> <strike>&#x20B9; 499/-</strike> <b>&#x20B9; 299/-</b>";
	rytxt5 = "English Sample";
	rytxt6 = "BUY NOW";	
}

%>

<div class="row low-padding class-main padding-top-51 padding-top-24 mrgb-0">

<%if(Util.isMobileDevice(request)) { %>
<div class="col s12 l4 np-lr-m">
<link type="text/css" href="//www.astrosage.com/dist/css/lightslider.min.css" rel="stylesheet" />
<style>.uls li {border-right: 0px solid #ddd;}</style>
<script type="text/javascript" src="//www.astrosage.com/dist/js/lightslider.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () { $("#content-slider").lightSlider({ loop: true, keyPress: true, pager: false, item: 1, auto: true, pause: 4000, controls: false }); });        
</script>
<div class="item">
    <ul id="content-slider" class="content-slider uls" style="padding:0px;">          
 
	     <li><a href="javascript: openServicePopup('148', '<%=rBIServicesPromo.getString("SERVICE_NAME_3") %>', 'brihat-horoscope.png', '750', '1498', 'https://www.astrosage.com/pdf/brihat-horoscope.pdf', 'https://www.astrosage.com/pdf/brihat-horoscope-hi.pdf', '<%=rBIServicesPromo.getString("SERVICE_DESC_3") %>', 'NCBKB'); getEvents('service', 'bk-bn-ascloud');">
         	<img src="//www.astrosage.com/images/promotion/web-bk-<%=gtImgUrl %>.jpg" class="responsive-img" alt="AstroSage Brihat Horoscope" /></a></li>         
         <li><a href="javascript: openServicePopup('120', '<%=rBIServicesPromo.getString("SERVICE_NAME_8") %>', 'raj-yoga.png', '399', '599','https://www.astrosage.com/pdf/rajyoga-en.pdf', 'https://www.astrosage.com/pdf/rajyoga-hi.pdf', '<%=rBIServicesPromo.getString("SERVICE_DESC_8") %>', 'NCRYB'); getEvents('service', 'ry-bn-ascloud');">
         	<img src="//www.astrosage.com/images/promotion/raj-yoga-<%=gtImgUrl %>.jpg" class="responsive-img" alt="Raj Yoga Reort" /></a></li>         
         <li><a href="javascript: openDetailedServicePopup('1', '<%=rBIServicesPromo.getString("SERVICE_NAME_1") %>', '', '250', '520', '', '', '', 'NCASK', ''); getEvents('service', 'sr-ascloud');">
         	<img src="//www.astrosage.com/images/promotion/web-ask-a-question-<%=gtImgUrl %>.jpg" class="responsive-img" alt="Ask A Question" /></a></li>
     </ul>
</div>
</div>

<%
}else{
%>

	<div class="col s12 l4 np-lr-m">
		<a href="javascript: openDetailedServicePopup('1', '<%=rBIServicesPromo.getString("SERVICE_NAME_1") %>', '', '250', '520', '', '', '', 'NCASK', '');"><img src="//www.astrosage.com/images/promotion/web-ask-a-question-<%=gtImgUrl %>.jpg" alt="Ask A Question"
			class="responsive-img card-img" /></a>
	</div>
	
	<div class="col s12 l4 hide-on-small-only">
		<a href="javascript: openServicePopup('148', '<%=rBIServicesPromo.getString("SERVICE_NAME_3") %>', 'brihat-horoscope.png', '750', '1498', 'https://www.astrosage.com/pdf/brihat-horoscope.pdf', 'https://www.astrosage.com/pdf/brihat-horoscope-hi.pdf', '<%=rBIServicesPromo.getString("SERVICE_DESC_3") %>', 'NCBKB');"><img src="//www.astrosage.com/images/promotion/web-bk-<%=gtImgUrl %>.jpg" alt="Brihat Horoscope"
			class="responsive-img card-img" /></a>
	</div>
	<div class="col s12 l4 hide-on-small-only">
		<!-- <a href="javascript:openRajYogaPopup();"><img src="//www.astrosage.com/images/promotion/raj-yoga-<%//=gtImgUrl %>.jpg" alt="Raj Yoga Report"
			class="responsive-img card-img" /></a> -->
		<a href="javascript: openServicePopup('120', '<%=rBIServicesPromo.getString("SERVICE_NAME_8") %>', 'raj-yoga.png', '399', '599', 'https://www.astrosage.com/pdf/rajyoga-en.pdf', 'https://www.astrosage.com/pdf/rajyoga-hi.pdf', '<%=rBIServicesPromo.getString("SERVICE_DESC_8") %>', '');"><img src="//www.astrosage.com/images/promotion/raj-yoga-<%=gtImgUrl %>.jpg" alt="Raj Yoga Report"
			class="responsive-img card-img" /></a> 
	</div>
	<%} %>

</div>

<div id="dialog-bh-horo" class="modal">
  <div class="model-header amber darken-1">
<h4 class="white-text padding-all-5"><%=promoBan.getString("BK_BUY_HDG")%>
<a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
</h4>
</div>
<div class="modal-content hdg-content clearfix">
    <p>
        <%=promoBan.getString("BK_DESC")%>
    </p> 
    <div align="center" class="sec-sample">
        <img src="/images/pdf.png" width="36" style="vertical-align: middle;" />
        <a class="smp" href='http://www.astrosage.com/pdf/<%=promoBan.getString("BK_SMP_IMG")%>.pdf' onclick="_gaq.push(['_trackEvent', 'popup', 'sample']);"><u><%=promoBan.getString("BK_SAMPLE")%></u></a>
    </div>
    
    <div class="row">
    <div class="col s12 m6">  
    <div class="valign-wrapper">
    <img src="https://www.astrosage.com/offer/images/bk-en-pdf.jpg" class="img-responsive left" />
    <div class="sec-text">
                        <h2>
                            <%=promoBan.getString("BK_PDF_ONLY")%></h2>
                        <p>
                            <%=promoBan.getString("BK_INST_DELIVERY")%></p>
                        <p>
                            <%=promoBan.getString("BK_SERVICE_PRICE")%></p>
                    </div>
    
       </div>
       
       
        <div align="center">
            <a href="//buy.astrosage.com/service/astrosage-brihat-horoscope?prtnr_id=<%=param%>"  onclick="_gaq.push(['_trackEvent', 'popup', 'buy-pdf']);" class="btn amber darken-4 wave-effects white-text btn-block"><%=promoBan.getString("BK_BUY_NOW")%></a></div>
    </div>

 
    <div class="col s12 m6">
    <div class="valign-wrapper">
    <img src="https://www.astrosage.com/offer/images/bk-en.jpg" class="img-responsive left" />
    <div class="sec-text">
                        <h2>
                            <%=promoBan.getString("BK_PRINTED")%></h2>
                        <p>
                            <%=promoBan.getString("BK_7DAY_DELIVERY")%></p>
                        <p>
                            <%=promoBan.getString("BK_PRINT_PRICE")%></p>
                    </div>
       
     
       </div>
        <div align="center">
            <a href="https://buy.astrosage.com/miscellaneous/astrosage-brihat-horoscope?prtnr_id=<%=param%>"
                onclick="_gaq.push(['_trackEvent', 'popup', 'print-pdf']);" class="btn amber darken-4 wave-effects white-text btn-block"><%=promoBan.getString("BK_BUY_NOW")%></a></div>
    </div>
    <div class="clearfix">
    </div>
    </div>
    </div>
</div>




<div id="dialog-rajyoga" class="modal">
  <div class="model-header amber darken-1">
<h4 class="white-text padding-all-5"><%=ryhdg%>
<a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
</h4>
</div>
<div class="modal-content hdg-content clearfix">
    <p>
        <%=rytxt1%>
    </p> 
    <div align="center" class="sec-sample">
        <img src="/images/pdf.png" width="36" style="vertical-align: middle;" />
        <a class="smp" href='//www.astrosage.com/pdf/rajyoga-<%=gtImgUrl%>.pdf' onclick="_gaq.push(['_trackEvent', 'popup', 'sample']);"><u><%=rytxt5%></u></a>
    </div>
    
    <div class="row">
    <div class="col s12 m6">  
    <div class="valign-wrapper">
    <img src="//www.astrosage.com/offer/images/raj-yog.jpg" class="img-responsive left" />
    <div class="sec-text">
                        <h2>
                            <%=rytxt2%></h2>
                        <p>
                            <%=rytxt3%></p>
                        <p>
                            <%=rytxt4%></p>
                    </div>
    
       </div>
       
       
        <div align="center">
            <a href="//buy.astrosage.com/service/raj-yoga-report?prtnr_id=<%=rjban%>"  onclick="_gaq.push(['_trackEvent', 'popup', 'buy-pdf']);" class="btn amber darken-4 wave-effects white-text btn-block"><%=rytxt6%></a></div>
    </div>

 
 
    <div class="clearfix">
    </div>
    </div>
    </div>
</div>

