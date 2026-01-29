<%
     request.getSession().setAttribute("UserExists", "false");
     request.getSession().setAttribute("User_Id", "");
     request.getSession().setAttribute("ChartType", "");
  
     Cookie killMyCookie = new Cookie("uidCookie", null);
     killMyCookie.setMaxAge(0);
     killMyCookie.setPath("/");
     response.addCookie(killMyCookie);
     
     Cookie killMyCookie1 = new Cookie("pwdCookie", null);
     killMyCookie1.setMaxAge(0);
     killMyCookie1.setPath("/");
     response.addCookie(killMyCookie1);
     
     //response.sendRedirect("/default.asp?logout=yes");
     response.sendRedirect("/i_login.jsp?logout=yes");
   
   %>