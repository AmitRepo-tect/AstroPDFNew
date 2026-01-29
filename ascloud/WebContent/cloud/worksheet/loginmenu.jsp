<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%
Local localloginmenu = new Local();
//Hindi hindi = new Hindi();

int languageCodeloginmenu = (Integer)session.getAttribute("languageCode");
MyProperties  rBConstantsloginmenu = (MyProperties) session.getAttribute("constants");
MyResourceBundle loginMenu = localloginmenu.loadPropertiesFileNew("loginmenu",languageCodeloginmenu);
UserDAO  UD = new UserDAO();
HashMap<String, String> returndata = UD.getRecordOfUser(String.valueOf(session.getAttribute("User_Id")),null);

String U_name="";
if(returndata.get("firstname")!=null && returndata.get("lastname")!=null){
	U_name = returndata.get("firstname")+" "+returndata.get("lastname");
}
else if(returndata.get("firstname")!=null) {
	U_name = returndata.get("firstname");
}

%>
<div id="loginBox">
    <div id="loginContent">
        <div class="ui-login-content">
        <div class="ui-users-name"><b><%=SharedFunction.ProperCase(U_name)%></b></div>
        <div class="ui-users-link"><a href="/cloud/friend.asp"><%=loginMenu.getString("TELL_YOUR_FRIENDS_ABOUT_ASTROSAGE") %></a></div>
       </div>  
        
        <div class="ui-login-footer">        
            <div class="ui-btn-l"><a href="/cloud/edituserprofile.asp" class="as-btn-white"><%=rBConstantsloginmenu.getString("EDIT_PROFILE") %></a></div>
            <div class="ui-btn-r">
             <% if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")) { %>
            <a href="/cloud/logout.jsp" class="as-btn-white"><%=loginMenu.getString("LOGOUT")%></a>
            <%} else{ %>
            <a href="login.asp" class="as-btn-white"><%=rBConstantsloginmenu.getString("LOGIN")%></a>
            <%} %>
            </div>
           <div class="ui-clear"></div> 
           
        </div>
    </div>
</div>