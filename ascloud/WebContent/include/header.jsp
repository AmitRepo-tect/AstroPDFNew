
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@include file='/include/popupbox.jsp'%>

 <div class="navbar navbar-custom <%if(SharedFunction.Is_Mobile(request)){%>navbar-fixed-top card-shadow<% } else { %>navbar-static-top<%}%>" id="appNavbar">
        <%@include file='/controls/i_navbar.jsp'%>
</div>
<%if(SharedFunction.Is_Mobile(request)){%>
 <div class="sub-navbar-m navbar-default navbar-static-top" role="navigation">
        <%@include file= '/controls/i_language-alt.jsp'%>
</div>
<%}%>

<div id="main">
    <div id="header">
        <%@include file = '/controls/i_header.jsp'%>
    </div>
    <div id="middle">
        <div id="container">
            <div class="no-padding-l <%if(!SharedFunction.Is_Mobile(request)){%>container<%}%>">                     
                <%@include file = '/controls/i_services-banner.jsp'%>
            </div>
            <div class="<%if(!SharedFunction.Is_Mobile(request)){%>container <%}%> no-padding-l">