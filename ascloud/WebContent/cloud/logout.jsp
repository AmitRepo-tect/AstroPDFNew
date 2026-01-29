<%@page import="com.ojassoft.astrosagecloud.util.WebKeys"%>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
       $(document).ready(function () {
    	   
    	   $(removeCookie('scookie'));
    	   $(removeCookie('ucookie'));
    	   $(removeCookie('pcookie'));
       });
</script>
<%
	request.getSession().setAttribute("UserExists", "false");
     request.getSession().setAttribute("User_Id", "");
     request.getSession().setAttribute("chartType", "");
     request.getSession().setAttribute("ChartId", "");
     request.getSession().setAttribute("planid", "");
     request.getSession().setAttribute("IsSaved", "");
     request.getSession().setAttribute("LoginUser", "");
     
     Cookie killMyCookie = new Cookie(WebKeys.COOKIE_UID, null);
     killMyCookie.setDomain(WebKeys.COOKIE_DOMAIN);
     killMyCookie.setMaxAge(0);
     killMyCookie.setPath("/");
     response.addCookie(killMyCookie);
     
     Cookie killMyCookie1 = new Cookie(WebKeys.COOKIE_PWD, null);
     killMyCookie1.setDomain(WebKeys.COOKIE_DOMAIN);
     killMyCookie1.setMaxAge(0);
     killMyCookie1.setPath("/");
     response.addCookie(killMyCookie1);
     
     Cookie killMyCookie2 = new Cookie("user", null);
     killMyCookie2.setMaxAge(0);
     killMyCookie2.setPath("/");
     response.addCookie(killMyCookie2);
     
     
     request.getSession().setAttribute("tempChartId", "");
     request.getSession().removeAttribute("HoroscopeObj");
     request.getSession().removeAttribute("constants");
     request.getSession().removeAttribute("languageCode");
     response.sendRedirect("//www.astrosage.com/logout.asp");
%>
