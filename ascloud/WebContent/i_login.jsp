<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="java.util.HashMap"%>
<li class="arrow"></li>
<!--<li>
    <h3 class="popover-title">
        <span>New to AstroSage? </span><a href="/freechart/RegisterUser.asp"><b>Sign Up</b></a></h3>
</li>
  -->
<% Object userExistsObj = session.getAttribute("UserExists");
 
//Object UserExistsData = session.getAttribute("UserExists");%>
<% if(userExistsObj == null || userExistsObj.toString().equals("") || userExistsObj.toString().equals("false")){ %>
<li>
    <form class="ui-margin-all" method="post" action="/loginchk.jsp" onsubmit="return LoginValidation(this)"
    id="login" name="login">
    <div class="input-group">
        <span class="input-group-addon">Username</span>
        <input type="text" name="txtLoginID" id="txtLoginID" class="form-control" placeholder="Username">
    </div>
    <div class="input-group ui-margin-t">
        <span class="input-group-addon">&nbsp;Password&nbsp;</span>
        <input type="password" name="txtLoginPassword" id="txtLoginPassword" class="form-control"
            placeholder="Password">
    </div>
    <div class="ui-chk">
        <span style="float: left;">
            <input type="checkbox" id="Staysignedin" name="Staysignedin" value="1">
            <label for="Staysignedin">
                <span></span>Remember Me</label>
        </span>
    </div>
    <div class="ui-margin-t">
        <button type="submit" name="submit" value="Login" class="btn btn-secondary btn-min">
            Sign In
        </button>
    </div>
    </form>
</li>
<% }else{ %>
<li>
    <div class="ui-margin-all">
        Welcome <span style="color: #ff0000;">
            <%=String.valueOf(session.getAttribute("User_Id"))%></span>
        <div class="ui-margin-t">
            <a href="/checkbirthdetails.jsp?Msg=<%=SharedFunction.encryptstring(String.valueOf(session.getAttribute("User_Id")))%>&Reg=false"><b>Go
                to AstroSage Cloud</b></a>
        </div>
        <div align="right" class="ui-margin-t">
            <a class="btn btn-secondary btn-min" href="/logout.jsp">Log Out</a>
        </div>
    </div>
</li>
<%}%>
<li class="panel-footer">
    <h3 class="popover-footer">
        <a href="/forgetPassword.jsp">Forgot Password?</a> <a href="/forgetUserid.jsp" class="pull-right">
            Forgot Username?</a></h3>
</li>

<% 
Cookie[] cookies = request.getCookies();
HashMap<String, String> hm = new HashMap<String, String>();
if(cookies != null)
for(Cookie cookie : cookies)
{
hm.put(cookie.getName(), cookie.getValue());
}

%>

<input type="hidden" value="<%=hm.get("uidCookie")%>" name="useridcookievalue">
<input type="hidden" value="<%=hm.get("pwdCookie")%>" name="passwordcookievalue">
<input type="hidden" value="<%=hm.get("uidcookie")%>" name="usercookievalue">
<input type="hidden" value="<%=hm.get("pwdcookie")%>" name="passcookievalue">