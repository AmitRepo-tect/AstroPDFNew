<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Local loc_bh = new Local();
int languageCode1_bh = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants1_bh = (MyProperties) session.getAttribute("constants");
MyResourceBundle bh_popup = loc_bh.loadPropertiesFileNew("bh-popup",languageCode1_bh);
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
.sec-sample{border-bottom: 1px solid #ddd; padding-bottom: 10px;}
.buy-button{background: #e35e05;-moz-border-radius: 3px;-webkit-border-radius: 3px; border-radius: 3px;cursor: pointer;font-size: 16px;font-weight: bold;padding: 8px 15px;text-decoration: none;display: block;outline: none; margin: 10px 20px;box-shadow: 0 1px 2px 0 rgba(0,0,0,0.16),0 1px 5px 0 rgba(0,0,0,0.12);}
</style>
<script type="text/javascript">

    function openBigHoroPopup() {
        $("#dialog-bh-horo").modal("open");
    }
   

</script>
<%
String param="NCLBT";
if(languageCode1_bh==1)
{
	param="NCLBT&language=hi";
}

%>



<div id="dialog-bh-horo" class="modal">
  <div class="model-header amber darken-1">
<h4 class="white-text padding-all-5"><%=bh_popup.getString("BH_BUY_HDG")%>
<a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
</h4>
</div>
<div class="modal-content hdg-content">
<div class="row mrt-50"><div class="col s12 l12"> <p>
        <%=bh_popup.getString("BH_DESC")%>
    </p> 
    </div></div>
    
    <div align="center" class="sec-sample">
        <img src="/images/pdf.png" width="36" style="vertical-align: middle;" />
        <a class="smp" href='/pdf/<%=bh_popup.getString("BH_SMP_IMG")%>.pdf' onclick="_gaq.push(['_trackEvent', 'popup', 'sample']);"><u><%=bh_popup.getString("BH_SAMPLE")%></u></a>
    </div>
    
    <div class="row">
    <div class="col s12 m6">  
    <div class="valign-wrapper">
    <img src="/images/print-kundli-en.png" class="img-responsive left" />
    <div class="sec-text">
                        <h2>
                            <%=bh_popup.getString("BH_PDF_ONLY")%></h2>
                        <p>
                            <%=bh_popup.getString("BH_INST_DELIVERY")%></p>
                        <p>
                            <%=bh_popup.getString("BH_SERVICE_PRICE")%></p>
                    </div>
    
       </div>
       
       
        <div align="center">
            <a href="http://buy.astrosage.com/service/astrosage-big-horoscope?prtnr_id=<%=param%>"  onclick="_gaq.push(['_trackEvent', 'popup', 'buy-pdf']);" class="btn amber darken-4 wave-effects white-text btn-block"><%=bh_popup.getString("BH_BUY_NOW")%></a></div>
    </div>

 
    <div class="col s12 m6">
    <div class="valign-wrapper">
    <img src="/images/printed-book.png" class="img-responsive left" />
    <div class="sec-text">
                        <h2>
                            <%=bh_popup.getString("BH_PRINTED")%></h2>
                        <p>
                            <%=bh_popup.getString("BH_7DAY_DELIVERY")%></p>
                        <p>
                            <%=bh_popup.getString("BH_PRINT_PRICE")%></p>
                    </div>
       
     
       </div>
        <div align="center">
            <a href="http://buy.astrosage.com/miscellaneous/astrosage-big-horoscope?prtnr_id=<%=param%>"
                onclick="_gaq.push(['_trackEvent', 'popup', 'print-pdf']);" class="btn amber darken-4 wave-effects white-text btn-block"><%=bh_popup.getString("BH_BUY_NOW")%></a></div>
    </div>
    <div class="clearfix">
    </div>
    </div>
    </div>
</div>