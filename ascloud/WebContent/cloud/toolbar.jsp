<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.ojassoft.astrosagecloud.util.*"%>
<%
	Local toolLocal = new Local();
	
	int toolLang= Util.safeInt(session.getAttribute("languageCode"));
	
	MyResourceBundle rBToolbar = toolLocal.loadPropertiesFileNew("toolbar",toolLang);
	
	Object objtool = session.getAttribute("constants");
	MyProperties toolConstants = null;
	if(objtool != null)
	{
		toolConstants = (MyProperties) objtool;
	}
	else
	{
		toolConstants = new MyProperties(toolLocal.loadPropertiesFile("constants", toolLang));
		session.setAttribute("constants", toolConstants);
	}
%>
<script type="text/javascript">

    $(document).ready(function() { 
    	
    	$(".svc-close").hide();    	
    	
		$(".svc-yes").click(function(){    		
                $("#ajax-loader").clone(true).appendTo("#plzwait").show();
                if ($("#Userid").val() != "") {

                    $.get('/cloud/ChartServlet?methodName=checkAndSaveChart', $("#two").serialize(), function(data) {

                        if (data == "1" || data == "-3") {
                            $("#issave").val("0");
                            $("#Confirmsg").hide();
                            validationMsg('<%=toolConstants.getString("YOUR_CHART_HAS_BEEN_SAVED_SUCCESSFULLY")%>');
                            clearInterval(timer);
                            $(".svc-yes").hide();
                            $(".svc-no").hide();
                            $(".svc-close").show();
                            $('#plzwait').html('');
                        }
                        else if (data == "-2") {
                        validationMsgWithLink('<%=rBToolbar.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN_FOR_TOOLBAR")%>');
                            $("#Confirmsg").hide();
                            $(".svc-yes").hide();
                            $(".svc-no").hide();
                            $(".svc-close").text("<%=rBToolbar.getString("UPGRADE_YR_PLAN")%>");                            
                            $(".svc-close").show('fast', function () {$(this).click(function () {popupvisibility();});});                            
                            $('#plzwait').html('');

                        }
                        else if (data == "10") {
                            window.location = "login.asp?refferurl=loginwelcome.asp?val=saveonly";
                        }
                        else {
                            validationMsg('<%=toolConstants.getString("SORRY_YOUR_CHART_HAS_NOT_SAVED_PLEASE_TRY_AGAIN")%>');
                            $("#Confirmsg").hide();
                            $(".svc-yes").hide();
                            $(".svc-no").hide();
                            $(".svc-close").show();                      
                            $('#plzwait').html('');
                        }

                    });
                }
                else {
                    window.location = "login.asp?refferurl=loginwelcome.asp?val=saveonly";
                }
});
    	
$(".svc-no").click(function(){    		
                 $("#ajax-loader").clone(true).appendTo("#plzwait").show();
                 //alert("vijay");
                 $("#issave").val("0");
                 clearInterval(timer);
        $.ajax({
             'async': false,
             'global': false,
             'url': 'control/change-save-session.jsp',
             'success': function(data) { }
         });
         $("#dialog-form-Timer").modal("close");     
});
    	
$(".svc-close").click(function(){ 
                 $("#ajax-loader").clone(true).appendTo("#plzwait").show();
                 // alert("vijay");
                 $("#issave").val("0");
                 clearInterval(timer);
                 $.ajax(
         {
             'async': false,
             'global': false,
             'url': 'control/change-save-session.jsp',
             'success': function(data) { }
         });
                 
         $("#dialog-form-Timer").modal("close");
            
});

});
    	
    
    	 

    var timer = setInterval(function() { myTimer() }, 90000);    
    
    function myTimer() {
        if ($("#issave").val() == "1") {
            $("#dialog-form-Timer").modal("open");
        }
    }
    function updateTips(t) {
        tips
		.text(t)
		.addClass('ui-state-highlight');
        setTimeout(function() {
            tips.removeClass('ui-state-highlight', 1500);
        }, 500);
    }

    function validationMsg(msg) {
        updateTips(msg);
        return false;
    }

    function updateTipsWithLink(t) {
        tips
		.html(t)
		.addClass('ui-state-highlight');
        setTimeout(function() {
            tips.removeClass('ui-state-highlight', 1500);
        }, 500);
    }

    function validationMsgWithLink(msg) {
        updateTipsWithLink(msg);
        return false;
    } 
</script>
<%
Object oops = session.getAttribute("User_Id");
String userId = "";
if ( oops != null)
{
	
 userId = oops.toString();
}
%>
<input type="hidden" id="Userid" value="<%=userId%>" />
<input type="hidden" id="issave" value="<%=session.getAttribute("IsSaved")%>" />
<div id="dialog-form-Timer" class="modal model-bar model-width">
<div class="model-header amber darken-1">
	<h4 class="white-text padding-all-5"><%=rBToolbar.getString("UNSAVED")%>
	
     <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
	</h4>
</div>

 <div class="modal-content clearfix">
 <div class="row"> 
 <div class="col s12 l12">
 <div class="validateTips center-align" id="opchart"></div>
 <div id="Confirmsg" class="ui-para">
		<p>
			<%=rBToolbar.getString("CHART_NOT_SAVED_YET")%>
		</p>
	</div>
  </div>
 </div>	
	<div class="progress" id="ajax-loader" style="display: none;">
      <div class="indeterminate"></div>
  	</div>
        
        
	<div id="plzwait"></div>
	
	
	</div>
	
	 <div class="modal-footer">
      <a href="javascript:void(0);" class="modal-action waves-effect wave-green btn-flat text-orange svc-yes"><%=toolConstants.getString("YES")%></a>
      <a href="javascript:void(0);" class="modal-action waves-effect wave-green btn-flat text-orange svc-no"><%=toolConstants.getString("NO")%></a>
      <a href="javascript:void(0);" class="modal-action waves-effect wave-green btn-flat text-orange svc-close"><%=toolConstants.getString("CLOS")%></a>
    </div>
</div>








