<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%
int getPlanIdRA=1; // Set the this variable as basic plan
UserDAO udRA = new UserDAO();
getPlanIdRA = Integer.parseInt(udRA.getPlanId(String.valueOf(session.getAttribute("User_Id"))));
if (getPlanIdRA == 8 || getPlanIdRA == 9 || getPlanIdRA == 10){
%>
<div class="mrb-20"></div>
<%
}else{
%>
<div class="mrb-20">
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- AS Responsive -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-7494543079410386"
     data-ad-slot="8063632023"
     data-ad-format="auto"></ins>
<script>
    (adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>
<%
}
%>