<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="ui-sub-heading">
    <h3>
        ज्योतिष पत्रिका</h3>
</div>
<!-- tabs -->
<ul class="nav nav-tabs ui-custom-tabs">
    <li><a href="#hin" data-toggle="tab">लेख</a></li>
    <li><a href="#panchang" data-toggle="tab">पंचांग</a></li>
     <li><a href="#fest" data-toggle="tab">त्यौहार</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane fade in active" id="hin">
        <div class="ui-tab-arrow-border ui-tab2-1"></div>
        <div class="ui-tab-arrow ui-tab2-1"></div>
        <div class="ui-scroll ul-li" style=" max-height:300px; overflow:auto;">
        <%@include file='/controls/hi/i_latestnews-hin.jsp'%>
        </div>
    </div>
    <div class="tab-pane fade" id="panchang">
        <div class="ui-tab-arrow-border ui-tab2-2"></div>
        <div class="ui-tab-arrow ui-tab2-2"></div>
        <div class="panchang-box ui-margin-t">
        <script type="text/javascript" src="/controls/hi/panchangapi.js"></script>    
        <div id="printPanchang"></div>
        <div class="text-center">
        <a href='http://panchang.astrosage.com/panchang/aajkapanchang?language=hi' onclick="getEvents('button-clicked', 'homepage-panchang-more', 'hindi');"   class='btn btn-deep-orange card-shadow br-radius ui-margin-b'>विस्तृत पंचांग</a>
        </div>
        <div class='clear'></div>
        </div>
    </div>    

     <div class="tab-pane fade" id="fest">
        <div class="ui-tab-arrow-border ui-tab2-3"></div>
        <div class="ui-tab-arrow ui-tab2-3"></div>
        <div class="ui-scroll ul-li" style="max-height:300px;overflow:auto;">
        <%@include file='/controls/hi/i_latestnews-festival.jsp'%>
        </div>
    </div>
</div>
<!-- /tabs -->
