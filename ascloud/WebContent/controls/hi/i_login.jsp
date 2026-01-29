<li class="arrow"></li>
<li>
    <h3 class="popover-title">
        <span>नये यूज़र? </span><a href="/freechart/RegisterUser.asp"><b>साइन अप करें</b></a></h3>
</li>
<%if(session.getAttribute("UserExists")==null || !session.getAttribute("UserExists").equals("true")){%>
<li>
    <form id="login" name="login" action="http://www.astrosage.com/freechart/LoginChk.asp"
    method="post" class="form-signin-alt" onsubmit="return LoginValidation(this)">
    <label for="inputEmail" class="sr-only">
        यूज़र-आईडी</label>
    <input type="text" id="txtLoginID" name="txtLoginID" class="form-control" placeholder="यूज़र-आईडी"
        required autofocus>
    <label for="inputPassword" class="sr-only">
        पासवर्ड</label>
    <input type="password" id="txtLoginPassword" name="txtLoginPassword" class="form-control"
        placeholder="पासवर्ड" required>
    <div class="ui-chk">
        <span style="float: left;">
            <input type="checkbox" id="Staysignedin" name="Staysignedin" value="1">
            <label for="Staysignedin">
                <span></span>लोगिन रहें</label>
        </span>
    </div>
    <div align="right" class="ui-margin-t">
        <button type="submit" name="submit" value="Login" class="btn btn-secondary btn-min">
            साइन इन
        </button>
    </div>
    </form>
</li>
<% }else{ %>
<li>
    <div class="ui-margin-all">
        Welcome <span style="color: #ff0000;">
            <%if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("") ){
            	out.println(session.getAttribute("User_Id").toString());
            	}%></span>
        <div class="ui-margin-t">
            <a href="http://www.astrosage.com/freechart/checkbirthdetails.asp?Msg=<%if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("") ){out.println(session.getAttribute("User_Id").toString());}%>&Reg=false"><b>Go
                to AstroSage Cloud</b></a>
        </div>
        <div align="right" class="ui-margin-t">
            <a class="btn btn-secondary btn-min" href="/LogOut.asp">Log Out</a>
        </div>
    </div>
</li>
<%}%>
<li class="panel-footer">
    <h3 class="popover-footer">
        <a href="/forgetPassword.asp">पासवर्ड भूल गए?</a> <a href="http://www.astrosage.com/forgetUserid.asp" class="pull-right">
            यूजर नाम भूल गए?</a></h3>
</li>
