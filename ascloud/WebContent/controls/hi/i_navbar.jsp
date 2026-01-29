<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%if(SharedFunction.Is_Mobile(request)) { %>
     <div class="navbar-header">          
        <button type="button" class="navbar-toggle-l" id="side-nav-slide-left">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button> 
        <%@include file='/controls/hi/i_search-mobile.jsp'%>
        <%@include file='/controls/hi/i_menu-mobile.jsp'%>
    </div>
      <%}else{%>
 <div class="col-sm-3">
        <a class="fav-ico pull-left" href="/" data-toggle="tooltip-r" title="मुफ्त कुंडली और ज्योतिष"><img width="132" src="http://www.astrosage.com/images/logo-white.png" alt="मुफ्त कुंडली और ज्योतिष"/></a>
         </div>
          
         
       <div class="col-sm-6">
            <div align="center">
             <%@include file='/controls/hi/i_search.jsp'%>
            </div>
        </div>
         

  <div class="col-sm-3">
   <ul class="nav navbar-nav pull-right">
        <li class="dropdown">
                <button type="button" class="btn btn-white br-radius card-shadow dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user"></span>
                    <%if(session.getAttribute("userid")!=null && !session.getAttribute("userid").equals("")){
                    if(session.getAttribute("UserID").toString().length() >5){
                    out.println(session.getAttribute("UserID").toString().substring(0,5)+"..");
                    }else{
                     out.println(session.getAttribute("userid"));
                   }
                   }else {
                    %>साइन इन <% 
                    }%>
                    <b class="caret"></b>
                </button>
                <ul class="dropdown-menu bottom">
                <%@include file='/controls/hi/i_login.jsp'%>
                </ul>
            </li>
        </ul>
        </div>
         <%}%>
       



