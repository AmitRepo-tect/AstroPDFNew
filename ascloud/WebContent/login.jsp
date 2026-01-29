<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="/cloud/js/jquery-1.11.1.min.js"></script>  
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Sign in to AstroSage</title>
    <meta name="keywords" content="astrologer punit pandey, vedic astrologer punit pandey, top astrologer punit pandey, best astrologer punit pandey">
    <meta name="description" content="Punit Pandey is a renowned 21st century astrologer with modern approach to astrology. People fondly call him ''Hi-Tech Astrologer'' or ''Digital Age Astrologer'' all because of his extensive usage of technology in astrology.">
    <link rel='stylesheet' type='text/css' href='/styles.css'>
    <style type="text/css">
        .slidingDiv
        {
            display: none;
        }
        .alert-messages
        {
            left: 0;
            right: 0;
            z-index: 7000;
            padding-bottom: 15px;
        }
        .message
        {
            position: relative;
            width: 350px;
            padding: 10px 12px;
            margin: 0 auto;
            text-shadow: 0 -1px 1px rgba(0,0,0,.5);
            background: #C10404;
            border-radius: 6px;
            -webkit-box-shadow: 0 2px 4px rgba(0,0,0,.25);
            box-shadow: 0 2px 4px rgba(0,0,0,.25);
        }
        .message-text
        {
            display: block;
            margin-right: 20px;
            color: #ccc;
            font-weight: bold;
            font-size: 12px;
            line-height: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
    <!--#include virtual='/include/header-without-ad.asp'-->
    <div id="roundborder">
        <div id="roundtopheadid">
            <div class="roundtophead">
                <div>
                    <div class="AscTopHead" style="text-align: left;">
                        <a href="/" class="BreadCrumb">Home</a> &#187; <a href="#" class="BreadCrumb">Login
                            Form</a>
                    </div>
                </div>
            </div>
        </div>
        <%
int referrervalues= 0;
String referrer ="";
if(request.getParameter("referrer")!=null && !request.getParameter("referrer").equals("")){
referrer = request.getParameter("referrer");
}
if(referrer!=null && !referrer.equals("")) {
    referrervalues = 1;
}else{
    referrervalues = 0;
}
        %>
        <h1 align="center">
            Sign in to AstroSage
        </h1>
        <div class="ui-form-widget-nobr">
            <form name="UserLoginForm" id="UserLoginfrm" method="post" class="form-horizontal" role="form" action="loginchk.jsp">
            <fieldset class="form-box">
                <div class="slidingDiv">
                    <div class="alert-messages " id="message-drawer">
                        <div class="message ">
                            <div class="message-inside">
                                <span class="message-text">Wrong User Id and password combination.</span>
                            </div>
                        </div>
                    </div>
                </div>
                <%
    if(request.getParameter("LoginInfo").equals("fail")){
                %>
                <div class="alert-messages " id="message-drawer">
                    <div class="message ">
                        <div class="message-inside">
                            <span class="message-text">Wrong User Id and password combination.</span>
                        </div>
                    </div>
                </div>
                <%
    }
                %>
                <div class="ui-clear">
                </div>
                <div class="form-group">
                    <label for="Name" class="col-sm-4 control-label">
                        Username</label>
                    <div class="col-sm-4">
                        <!--<input type="text" name="userId" id="userId" class="form-control" placeholder="User Name"
                            tabindex="1" />-->
                        <input type="text" name="txtLoginID" id="userId" class="form-control" placeholder="User Name"
                            tabindex="1" />
                    </div>
                    <div class="col-sm-4">
                        Forgot your <a href="/forgetUserid.asp"><b class="maroon">username</b></a> ?
                    </div>
                </div>
                <div class="form-group">
                    <label for="Name" class="col-sm-4 control-label">
                        Password</label>
                    <div class="col-sm-4">
              <input type="password" name="txtLoginPassword" id="dP" class="form-control" placeholder="Password"
                            tabindex="1" />
                    </div>
                    <div class="col-sm-4">
                        Forgot your <a href="/forgetPassword.asp"><b class="maroon">password</b></a> ?
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <div class="checkbox">
                            <label>
                                
                                <input type="checkbox" id="Staysignedin1" name="Staysignedin" value="1">
                                Remember me
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-5 col-sm-4">
                        <input name="submit" type="submit" value="Sign in" class="btn btn-secondary btn-small"
                            id="SubBtn">
                    </div>
                </div>
                <div class="ui-clear">
                </div>
                <p align="center">
                    New to AstroSage? <b><a href="/freechart/RegisterUser.asp">Sign up now &#187;</a></b></p>
                <input type="hidden" name="referrer" value="<%=referrer%>" />
                <input type="hidden" name="referrervalues" value="<%=referrervalues %>" />
            </fieldset>
            </form>
        </div>
    </div>
    <!-- #include virtual='/include/footer-without-ad.asp'-->
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            $("#SubBtn").click(function () {
                var USid;
                USid = $("#userId").val();
                PWiD = $("#dP").val();
                if (USid == "") {
                    alert("Please enter a value for the User Id.");
                    document.getElementById('userId').focus();
                    return false;
                }
                if (PWiD == "") {
                    alert("Please enter a value for the Password.");
                    document.getElementById('dP').focus();
                    return false;
                }
                return true;
                /* var getReturnObj = $.get('validlogin.asp', $("#UserLoginfrm").serialize(), function (data) {
                MyUrl = data.split("#");
                switch (MyUrl[0]) {
                case "0":
                //alert("Deepak"+MyUrl[1]);
                window.location.href = MyUrl[1];
                break
                case "1":
                window.location.href = MyUrl[1];
                break
                case "2":
                var info;
                info = '<%=request.getParameter("LoginInfo") %>';
                if (info != 'fail') {
                $(".slidingDiv").show();
                }
                break
                }
                });*/
            });
        });
	</script>
</body>
</html>