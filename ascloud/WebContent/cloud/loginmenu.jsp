<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.*"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Local loginLocal = new Local();
UserDAO udao=new UserDAO();
int loginLang = Util.safeInt(session.getAttribute("languageCode"));

	MyResourceBundle rBLoginMenu = loginLocal.loadPropertiesFileNew("loginmenu", loginLang);
	
	DesktopHoro leftMenuHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
	Object obj = session.getAttribute("constants");
	MyProperties loginConstants = null;
	if(obj != null)
	{
		loginConstants = (MyProperties) obj;
	}
	else
	{
		loginConstants = new MyProperties(loginLocal.loadPropertiesFile("constants", loginLang));
		session.setAttribute("constants", loginConstants);
	}
%>

<div id="login_menu1">
	<div class="top-arrow arrow3"></div>
	<div class="login-body">
		<!--implemented later when database will migrate <h3><%//=ProperCase(returndata)%></h3> -->
		<h3><%String loginUser = Util.safestr(session.getAttribute("User_Id"));
		HashMap<String, String> map=udao.getRecordOfUser(loginUser,null); 
		String username="";
		for(Map.Entry m:map.entrySet()){ 
			if(m.getKey().toString().equals("username"))
			{ 
				if(m.getValue() != null)
				{
					username=m.getValue().toString();
				}
				break;
			}
			}	
			%>
			<% session.setAttribute("LoggedInUserName", username); %>
			<%=username%>
		</h3>
		<h4>
			<i><%=loginUser %></i>
		</h4>
		<p>
			<a href="friend.asp"><b><%=rBLoginMenu.getString("TELL_YOUR_FRIENDS_ABOUT_ASTROSAGE") %></b></a>
		</p>
		<p>
			<a href="edituserprofile.asp"><b><%=loginConstants.getString("EDIT_PROFILE") %></b></a>
		</p>
	</div>
	<div class="login-footer">
		<% if(session.getAttribute("UserId")!= "" || session.getAttribute("UserId")!= null){ %>
		<a href="logout.jsp" class="btn-action btn-login"><%=rBLoginMenu.getString("LOGOUT")%></a>
		<% }else{ %>
		<a href="login.asp" class="btn-action btn-login"><%=loginConstants.getString("LOGIN")%></a>
		<%} %>
	</div>

</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loginPopup").click(function (e) {
            e.stopPropagation();
            $("#login_menu1").animate({ "height": "toggle" }, 500);
            $("body").click(function (e) {
                if (e.target.id != "login_menu1") {
                    $("#login_menu1").animate({ "height": "hide" }, 500);
                    $("body").unbind("click");
                }
            });
        });



    });
</script>