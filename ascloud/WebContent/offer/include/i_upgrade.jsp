<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%
int langUp = Util.safeInt(session.getAttribute("languageCode"));
%>
<p class="text-center">
    <em>
        <%if(langUp == 1) {%>
        	संपूर्ण जानकारी एस्ट्रोसेज महा कुंडली में उपलब्ध है 
        <% } else { %>
        More details are available in AstroSage Big Horoscope
        <% } %>
    </em>
    <br />
    <a href='javascript:void(0);' data-toggle='modal' data-target='#myModal'><i class='material-icons str3'>
        &#xE315;</i><i class='material-icons str2'>&#xE315;</i><i class='material-icons str1'>&#xE315;</i>
        <%if(langUp == 1) { %>
        	अभी प्राप्त करें
        <% } else { %>
        Get It Now
        <% } %>
        <i class='material-icons str6'>&#xE314;</i><i class='material-icons str5'>&#xE314;</i><i
            class='material-icons str4'>&#xE314;</i> </a>
</p>
