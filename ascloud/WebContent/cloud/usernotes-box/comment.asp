<% Response.Charset = "utf-8" %>
<!--#xinclude virtual='\cloud\util\local.asp'-->
<!--#xinclude virtual='\cloud\util\hindi.asp'-->
<!--#include virtual='\cloud\util\comments.res'-->
<!--#include virtual='\cloud\util\comments_hi.res'-->
<!--#include virtual='\cloud\util\comments_ta.res'-->
<!--#include virtual='\cloud\util\comments_te.res'-->
<!--#include virtual='\cloud\util\comments_mr.res'-->
<link href='usernotes-box/styles.css' rel='stylesheet' type='text/css'/>
<script src="usernotes-box/script/jquery.ui.mouse.js"></script>
<script src="usernotes-box/script/jquery.ui.draggable.js"></script>
<script src="usernotes-box/script/usernotes-box.js"></script>

<script type="text/javascript">
    
    $(document).ready(function() {
        showUserContent();
    });

    function saveComments() {
        
        showUserContent();  // Checking for session
        
        filtercomments('comments');
        var originalcontent = $('#comments').val();

        replacedcontent = originalcontent.replace(/'/gi, "''");
        $('#comments').val(replacedcontent);
        $('#usertext').html('<font size="2" color="maroon"><b>saving...</b></font>');
        var getReturnObj = $.get('control/user-notes.asp', $('#notesfrm').serialize(), function(data, status) {

            if (data == "0") {
                $('#usertext').html('<%=GetString("ERROR_IN_UPDATING_COMMENTS_PLEASE_TRY_AGAIN") %>');
                //$('#dialog-form-notification').dialog('open');
            }
            else {
                if (data == "2") {
                    showUserContent();
                }
                else {
                    document.getElementById('comments').value = data;
                    $("#show-usernotes").animate({ "bottom": "-2" }, "fast");
                    $('#usertext').html('<font size="2" color="maroon"><b><%=GetString("YOUR_COMMENTS_UPDATED_SUCCESSFULLY") %></b></Font>');
                    setTimeout(removeHTML, 5000);
                }
            }
        });

        getReturnObj.error(function(jqxhr, textStatus, errorThrown) {
            if (textStatus == "error") {
                $('#usertext').html('<font size="2" color="maroon"><b><%=GetString("ERROR_IN_UPDATING_COMMENTS_PLEASE_TRY_AGAIN") %></b></Font>');
                setTimeout(removeHTML, 5000);
            }
            if (textStatus == "timeout") {
                $('#usertext').html('<font size="2" color="maroon"><b>Time Out. Please try again.</b></Font>');
                setTimeout(removeHTML, 5000);
            }
        });
    }

    function showUserContent() {
        var sessionval;
        var msg = "";
        var useridsession;
        var chartidsession;
        var hh22;
        var horoscopesession;
        $.get('control/getsession.asp', function(data) {

            sessionval = data.split("|");
            useridsession = sessionval[0];
            chartidsession = sessionval[1];
            hh22 = sessionval[2];
            horoscopesession = sessionval[3];

            if (hh22 == "True" && chartidsession == "True") {
                msg = "";
            }
            else {
                if (hh22 == "True" && chartidsession == "False") {
                    msg = "Please <a href='#' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;' onclick=openChart('open');>open the chart</a> first to save comment.";
                }
                else {
                    if (useridsession == "False") {
                        msg = "You are not logged in.Please <a href='login.asp' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;'>Login</a>.";
                    }
                    else {
                        //msg = '<%=GetString("YOU_ARE_NOT_OUR_PREMIUM_USER_TO_HAVE_THIS_FACILITY_PLEASE_UPGRADE_YOUR_PLAN1") %><font size="3" color="red"><%=Application("contactNumber")%></font><%=GetString("ONCONTACT")%>';
                        msg = '<%=GetString("YOU_ARE_NOT_OUR_PREMIUM_USER_TO_HAVE_THIS_FACILITY_PLEASE_UPGRADE_YOUR_PLAN1") %>';
                    }
                }
            }
            if (horoscopesession == "False") {
                msg = "<b>Your Session has been expired.Please <a href='login.asp' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;'>Login</a> again.</b>";
            }

            if (msg == "") {
                document.getElementById('usercontent').style.display = 'block';
                document.getElementById('user-msg').style.display = 'none';
            }
            else {
                document.getElementById('usercontent').style.display = 'none';
                document.getElementById('user-msg').style.display = 'block';
                document.getElementById('user-msg').innerHTML = msg;
            }
        });
    
    }
    
</script>

<div id="show-usernotes">    
    <%If session("LanguageCode")="1" Then %>
        <img src="usernotes-box/images/comment-btn-hindi.png"/>    
    <%ElseIf session("LanguageCode")="2" Then  %>
        <img src="usernotes-box/images/comment-btn-tamil.png"/>
    <%Else %>
        <img src="usernotes-box/images/comment-btn.png"/>
    <%End If %>
</div>

<div class="usernotesdiv" id="draggable">
    <div id="close-usernotes">
    </div>
    <div align="right" class="usernotes-box">
       <!--#include file = 'new_notes.asp'-->
    </div>
</div>
