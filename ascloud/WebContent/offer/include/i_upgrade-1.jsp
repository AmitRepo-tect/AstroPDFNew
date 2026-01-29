
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<a href='javascript:void(0);' data-toggle='modal' class="upgrade-link" data-target='#myModal'>
    <%if(Util.safeInt(session.getAttribute("languageCode")) == 1) { %>
        	अभी प्राप्त करें
    <% } else { %>
        Get It Now
    <% } %>
  
    </a>
