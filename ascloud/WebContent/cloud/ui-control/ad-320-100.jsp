<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%
int getPlanIdMA=1; // Set the this variable as basic plan
UserDAO udMA = new UserDAO();
getPlanIdMA = Integer.parseInt(udMA.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if (getPlanIdMA != 8 && getPlanIdMA != 9 && getPlanIdMA != 10 ){
%>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- large mobile banner -->
<ins class="adsbygoogle"
     style="display:inline-block;width:320px;height:100px"
     data-ad-client="ca-pub-7494543079410386"
     data-ad-slot="1539736023"></ins>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({});
</script>
<%
}
%>