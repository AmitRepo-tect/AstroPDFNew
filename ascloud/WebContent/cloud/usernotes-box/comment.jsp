<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*, java.util.*" %>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="java.util.ResourceBundle"%>
<script src="/cloud/usernotes-box/script/usernotes-box.js"></script>




<%
     Local local_new = new Local();
     int language_Code = Util.safeInt(session.getAttribute("languageCode"));
     MyResourceBundle rB_Constants = local_new.loadPropertiesFileNew("comments", language_Code);
     MyResourceBundle rB_Constants2 = local_new.loadPropertiesFileNew("new_notes", language_Code);
     MyResourceBundle Constants_new = local_new.loadPropertiesFileNew("constants", language_Code);     
     Hindi hi = new Hindi();
    %>
<script type="text/javascript">
    
    $(document).ready(function() {   	
    	
    	show();
    });
     
    function saveComments() {
        
    	show();  // Checking for session
        
        filtercomments('comments');
        var originalcontent = $('#comments').val();

        replacedcontent = originalcontent.replace(/'/gi, "''");
        $('#comments').val(replacedcontent);
        $('#usertext').html('<div class="progress"><div class="indeterminate"></div></div>');
        $.get('control/user-notes.jsp', $('#notesfrm').serialize(), function(data, status) {
        	 if (status == "success") {
        	if (data.trim() == "0") {
        		Materialize.toast('<%=Constants_new.getString("ERROR_IN_UPDATING_COMMENTS_PLEASE_TRY_AGAIN") %>', 5000);             
            }
            else {
                if (data.trim() == "2") {
                	
                	show();
                }
                else {
                    document.getElementById('comments').value = data.trim();
                    Materialize.toast('<%=rB_Constants.getString("YOUR_COMMENTS_UPDATED_SUCCESSFULLY") %>', 5000);
                    $("#usertext").html("");
                    //setTimeout(removeHTML, 1000);
                    
                }
            }  
        	 }
            if (status == "error") {
            	Materialize.toast('<%=Constants_new.getString("ERROR_IN_UPDATING_COMMENTS_PLEASE_TRY_AGAIN") %>', 5000);
                //setTimeout(removeHTML, 5000);
            	$("#usertext").html("");
            }
            if (status == "timeout") {
            	Materialize.toast('Time Out. Please try again.', 5000);
                //setTimeout(removeHTML, 5000);
                $("#usertext").html("");
            }
        });
    }

   function show(){
	   //alert("the");
    	var sessionval;
        var msg = "";
        var useridsession;
        var chartidsession;
        var planidsession;
        var horoscopesession;
        $.get('control/getsession.jsp', function(data) {
        	sessionval = data.trim().split("|");
            useridsession = sessionval[0];
            chartidsession = sessionval[1];
            planidsession = sessionval[2];
            horoscopesession = sessionval[3];
            //alert(hh22.trim()+","+chartidsession+","+useridsession.trim());
            if (chartidsession.trim() == "true") {
                msg = "";               
            }
            else {
            	
                if (chartidsession == "false" && useridsession.trim() == "true") {
                    msg = "Please <a href=javascript:openChart('open'); class='alert-link'>open the chart</a> first to save comment.";
                }
                else {
                
                    if (useridsession.trim() == "false") {
                        msg = "You are not logged in.Please <a href='login.asp' class='alert-link'>Login</a>.";
                    }
                    else {
                    	
                    	 msg = "";
                    }
                }
            }
            if (horoscopesession.trim() == "false") {
                msg = "<b>Your Session has been expired. Please <a href='login.asp' class='alert-link'>Login</a> again.</b>";
            }

            if (msg.trim() == "") {
                document.getElementById('usercontent').style.display = 'block';
                document.getElementById('user-msg').style.display = 'none';
                $(".sv-notes").show();
                $(".cn-notes").show();                
            }
            else {
                document.getElementById('usercontent').style.display = 'none';
                document.getElementById('user-msg').style.display = 'block';
                document.getElementById('user-msg').innerHTML = msg;
                $(".sv-notes").hide();
                $(".cn-notes").hide();
            }
           
        });
    
    }
    
</script>




<div class="fixed-bottom notes-btn">
	<a class="btn btn-large modal-trigger" href="#notesModal"> 
	<%=rB_Constants2.getString("COMMENTS")%>
	</a>
</div>


     <%@include file='new_notes.jsp'%>   
     
    
  
  
