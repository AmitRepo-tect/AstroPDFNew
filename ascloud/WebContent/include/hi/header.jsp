
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<div class="navbar navbar-custom navbar-fixed-top card-shadow" id="appNavbar">
    <div class="container">
         <%@include file='/controls/hi/i_navbar.jsp'%>
    </div>
</div>
<%if(!SharedFunction.Is_Mobile(request)){%>
<div class="bg-white card-shadow">
    <div class="container">
        <%@include file='/controls/hi/i_main-menu.jsp'%>
    </div>
</div>
<div class="ui-margin-b">
</div>
<%}%>
    <%@include file='/controls/hi/i_topbtn.jsp'%>
<div class="container" id="main">
    <div class="col-sm-8">        
        <div class="no-padding-l">  
        <%@include file='/controls/hi/i_services-banner.jsp'%>
          
     
