<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>

 <%@include file = '/controls/i_right-ad.jsp'%>


<%if(!SharedFunction.Is_Mobile(request)){%>

<div class="ui-padding-t ui-padding-b border-t">
 <%@include file = '/controls/i_ad-336-280.jsp'%>
</div>

 <%@include file  = '/controls/i_download.jsp'%>
<div class="border-t">
 <%@include file  = '/controls/i_video.jsp'%>
</div>
<%}else{%>
<div class="ui-video border-t">
    <a href="//www.youtube.com/embed/videoseries?list=UUHBM-lmpDCFzu8hpo8HjW-A&wmode=transparent"
        rel="nofollow" target="_blank">
        <img src="/images/astrosage-tv.jpg" style="width:100%;" alt="Watch AstroSage TV" /></a>
</div>

<div align="center" class="ui-padding-t ui-padding-b border-t">
 <%@include file  = '/controls/i_ad-300-250.jsp'%>
</div>
<%} %>
<div class="ui-margin-t border-t">
  <%@include file  = '/controls/i_subscribe.jsp'%>
</div>

<div class="ui-buybox">
 <%@include file  = '/controls/i_buy.jsp'%>
</div>
<%if(!SharedFunction.Is_Mobile(request)){%>
<div class="ui-margin-t border-t">
    <div class="ui-padding-all">
    </div>
    <div align="center">
  <%@include file  = '/controls/i_ad-300-600.jsp'%>
    </div>
    <div class="ui-padding-t">
    </div>
</div>
<%} %>
<div class="ui-margin-t">
   <%@include file  = '/controls/i_punit.jsp'%>
</div>
