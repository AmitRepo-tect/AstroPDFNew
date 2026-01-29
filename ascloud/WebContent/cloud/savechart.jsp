<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<%
Local savelocal = new Local();
int savelanguageCode = Util.safeInt(session.getAttribute("languageCode"));

Object objsave = session.getAttribute("constants");
MyProperties saveConstants = null;
if(objsave != null)
{
	saveConstants = (MyProperties) objsave;
}
else
{
	saveConstants = new MyProperties(savelocal.loadPropertiesFile("constants", savelanguageCode));
	session.setAttribute("constants", saveConstants);
}
MyResourceBundle saveChartConstants = savelocal.loadPropertiesFileNew("savechart",savelanguageCode);
MyResourceBundle sharePublicConstants = savelocal.loadPropertiesFileNew("savechart-sharechartpubliclyjs",savelanguageCode);
DesktopHoro saveHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
String chartIdsave = Util.safestr(session.getAttribute("ChartId"));
%>
<script type="text/javascript">
    function fillChartName() {
        var value = (function() {
            var val = null;
            $.ajax({
                'async': false,
                'global': false,
                'url': 'control/ajax-publicchartname.jsp',
                'data': ({ chartid: '<%=chartIdsave %>' }),
                'success': function(data) {
                    val = data;
                    if (data != "") {
                        document.getElementById('chartName').value = data;
                        document.getElementById('rbShared').checked = true;
                        document.getElementById('divChartName').style.visibility = 'visible';
                    }
                    else {
                        document.getElementById('rbPrivate').checked = true;
                        $.get('control/getrandomchartname.jsp', function(data) {
                            if (data == "0") {
                                window.location.href = "home.asp"
                            }
                            else if (data == "1") {
                            }
                            else {
                                document.getElementById('chartName').value = data;
                            }
                        });
                    }
                }
            });
            return val;
        })();
    }
    function fillTagValue() {       
        var value = (function() {
            var val = null;
            $.ajax({
                'async': false,
                'global': false,
                'url': 'ChartServlet?methodName=getTagValue',
                'data': ({ chartid: '<%=chartIdsave %>' }),
                'success': function(data) {
                    val = data;                    
                    if (data == "1") {                        
                    }
                    else {
                        if (data == "0") {
                            data = ""
                            $('#tags').val(data);
                        }
                        else {
                            $('#tags').val(data);
                        }
                    }
                }
            });
            return val;
        })();
    }
    function savechart() { 
    	if (document.getElementById("HideUserID") == null || document.getElementById("HideUserID").value == "") {
            v = 'loginwelcome.asp?val=saveonly';           
            window.location.href = 'login.asp?refferurl=' + v;            
        }
        else {
        	fillTagValue(); 
            document.getElementById("hideChartName").value = "";
            $("#tagsval").val($("#tags").val());
            $.get('ChartServlet?methodName=checkAndSaveChart', $("#two").serialize(), function(data) {
            if (data == "1" || data == "-3") {
                        $("#issave").val("0");
                        clearInterval(timer);
                    //$('#dialog-form-notification').modal('open');
                    
                    $('#dialog-form-notification').html('<%=saveConstants.getString("YOUR_CHART_HAS_BEEN_SAVED_SUCCESSFULLY") %>');
                	openToast('#dialog-form-notification');
                    showUserContent(); //method to update the session variable for commentbox
                }
                else if (data == "-2") {                	
                	$('#alertToast').html('<%=saveConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN1")%>');
                 	openToast('#alertToast');
                 	}            
                else {
                    $('#alerttext').html('<div class="alert alert-danger"><%=saveConstants.getString("SORRY_YOUR_CHART_HAS_NOT_SAVED_PLEASE_TRY_AGAIN") %></div>');
                    setTimeout(function(){$('#alerttext').html(''); }, 5000);
                }
            });    
        }                        
    }
    function openLoginForm()
    {
    	var getRes = "";
    	
    	$.ajax({url: "sessioncheckofuserid.jsp",  async: false, success: function(result)
   		{
        	getRes = result;
        }});
    	
        if (document.getElementById("HideUserID") == null || document.getElementById("HideUserID").value == "" || getRes==null || getRes=="") {
        	
            v = 'loginwelcome.asp?val=save';
            window.location.href = 'login.asp?refferurl=' +v ;
        }
        else
        {
            document.getElementById("tags").value = "";
            document.getElementById("lblPath").innerHTML = "";
            
            fillChartName();
            fillTagValue()
            $('#pleasewaiting').html('');
            $('#alerttext').html('');
            $('#dialog-form-savechart').modal('open');
        }
    }
    
    function checkLength(o, n, min) {
        
        if (o.val().length < min) {
            o.addClass('ui-state-error');
            updateTips('<%=saveChartConstants.getString("PLEASE_ENTER") %> ' + n + '<%=saveChartConstants.getString("Fill_HINDI") %>');
            return false;
        }
        else {
            return true;
        }
    }
    // Checking length for Chart Name 

    function checkLengthChartName(o, n, min, max) {
        if (o.val().length > max || o.val().length < min) {
            o.addClass('ui-state-error');
            updateTips("Length of " + n + " must be between " + min + " and " + max + ".");
            return false;
        }
        else {
            return true;
        }
    }

    function updateTips(t) {
        tips.text(t).addClass('ui-state-highlight');
        setTimeout(function() {tips.removeClass('ui-state-highlight', 1500);}, 500);
    }

    function validationMsg(msg) {
        updateTips(msg);
        return false;
    }

    function openSignUpDialog() {
        $('#dialog-form-login').modal('close');
        $('#dialog-form-signup').modal('open');
    }

    function showDiv(status) {
        document.getElementById("divChartName").style.visibility = status;        
    }

    $(document).ready(function() {
        tips = $(".validateTips");
        var name = $("#chartName");
        // Start Save Chart Dialog Box      
        
        
        $(".save-chart").click(function() {            
        	$('#pleasewaiting').html('<div class="progress"><div class="indeterminate"></div></div>');
                        var bValid, chosen
                        bValid = true;
                        chosen = ""
                        len = document.frmSaveChart.rb.length
                        for (i = 0; i < len; i++) {
                            if (document.frmSaveChart.rb[i].checked) {
                                chosen = document.frmSaveChart.rb[i].value
                            }
                        }
                                              
                        if (chosen == "shared") {                        	
                        	bValid = bValid && checkLengthChartName(name, "Chart Name", 1, 15);
                            document.getElementById("hideChartName").value = $("#chartName").val();
                            $("#tagsval").val($("#tags").val());
                            var Availability = checkAvailability();                           
                            if (Availability) {                            
                            	$.get('ChartServlet?methodName=checkAndSaveChart', $("#two").serialize(), function(data) {
                                    if (data == "1" || data == "-3") {  
                                    	$("#issave").val("0");
                                    	$('#dialog-form-savechart').modal('close');
                                    	$('#dialog-form-notification').html('<%=saveConstants.getString("YOUR_CHART_HAS_BEEN_SAVED_SUCCESSFULLY") %>');
                                    	openToast('#dialog-form-notification');
                                        //$('#dialog-form-notification').modal('open');
                                        showUserContent(); //method to update the session variable for commentbox
                                    }
                                    else if (data == "-2") {
                                    $('#pleasewaiting').html('');                                 
                                    //$('#dialog-form-savechart').modal('close');                                    
                                    	$('#alerttext').html('<div class="alert alert-danger center-align"><%=saveConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN1")%></div>');
                                    	
                                    }
                                    else {
                                        $('#pleasewaiting').html('');                                       
                                        validationMsg('<%=saveConstants.getString("SORRY_YOUR_CHART_HAS_NOT_SAVED_PLEASE_TRY_AGAIN") %>');
                                    }
                                });
                                document.getElementById('chartNameAvailablity').innerHTML = "";
                                document.getElementById('chartNameAvailablity').style.display = 'none';
                            }
                            else {                            	
                            	$('#pleasewaiting').html('');
                             
                            }
                        }
                        if (chosen == "private") {
                            document.getElementById("hideChartName").value = "";
                            $("#tagsval").val($("#tags").val());
                            $.get('ChartServlet?methodName=checkAndSaveChart', $("#two").serialize(), function(data) {
                                if (data == "1" || data == "-3") {
                                    $('#dialog-form-savechart').modal('close');
                                    
                                    $('#dialog-form-notification').html('<%=saveConstants.getString("YOUR_CHART_HAS_BEEN_SAVED_SUCCESSFULLY") %>');
                                    
                                    openToast('#dialog-form-notification');
                                    
                                    showUserContent(); //method to update the session variable for commentbox
                                }
                                else if (data == "-2") {
                                    $('#pleasewaiting').html('');
                                    //$('#dialog-form-savechart').modal('close');                                    
                                    $('#alerttext').html('<div class="alert alert-danger center-align"><%=saveConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN1")%></div>');
                                   
                                    //$('#dialog-form-alert').modal('open');
                                    //validationMsg('<%=saveConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN")%>');
                                }
                                else {
                                    $('#pleasewaiting').html('');
                                    validationMsg('<%=saveConstants.getString("SORRY_YOUR_CHART_HAS_NOT_SAVED_PLEASE_TRY_AGAIN") %>');
                                }
                            });

                        }
                    });
        
        $(".cancel-svc").click(function() {
            document.getElementById('chartNameAvailablity').innerHTML = "";
            document.getElementById('chartNameAvailablity').style.display = 'none';
            showDiv('hidden');
            validationMsg('<%=saveChartConstants.getString("CHOOSE_CHART_VISIBILITY") %>');
            $("#dialog-form-savechart").modal('close');

        });
        
        $(".close-svc").click(function() {
            showDiv('hidden');
            document.getElementById('chartNameAvailablity').innerHTML = "";
            document.getElementById('chartNameAvailablity').style.display = 'none';
            validationMsg('<%=saveChartConstants.getString("CHOOSE_CHART_VISIBILITY") %>');
        });
        // End Save Chart Dialog Box
        

        // Start notification Dialog Box
        
         $(".noti-svc").click(function() {
        	 $('#dialog-form-notification').modal('close');
          });
        // End notification Dialog Box

        // Start alert Dialog Box
         $(".alert-svc").click(function() {
        	 $('#dialog-form-alert').modal('close');
          });
        // End alert Dialog Box        
    });

    // Checking Chart name Availability 

    function checkAvailability() {    	
        if ($("#chartName").val() == "") {
            
        	$('#alerttext').html('<div class="alert alert-danger center-align"><%=sharePublicConstants.getString("PLEASE_ENTER_CHART_NAME_FIRST") %></div>');
            //$('#dialog-form-alert').modal('open');
        	setTimeout(function(){$('#alerttext').html(''); }, 5000);
            
        }
        if (validChartNameCheck()) {        	
        	if($("#chartName").val()!=null && $("#chartName").val()!="")        	
        	{
        	
        	var value = (function() {
                var val = null;
                $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': 'control/ajax-getchartname.jsp',
                    'data': ({ chartname: $("#chartName").val(), chartid: '<%=chartIdsave %>' }),
                    'success': function(data) {
                    	//alert(data);
                        val = data.trim();
                    }
                });
                return val;
            })();

            if (value == "1") {            	
            	$('#alerttext').html('');
            	document.getElementById('chartNameAvailablity').style.display = 'block';
            	$('#chartNameAvailablity').html('<div class="alert alert-success center-align"><%=sharePublicConstants.getString("CHART_NAME_IS_AVAILABLE") %></div>');                
            	return true;
            }
            else {            	
            	$('#alerttext').html('');
            	document.getElementById('chartNameAvailablity').style.display = 'block';
            	$('#chartNameAvailablity').html('<div class="alert alert-danger center-align"><%=sharePublicConstants.getString("CHART_NAME_IS_NOT_AVAILABLE") %></div>');              
            	return false;
            }
        }
        }
    }
    function updatePath() {
        if (document.getElementById("chartName").value == "") {
            document.getElementById('chartNameAvailablity').style.display = 'none';
        }

        var pathval = document.getElementById("chartName").value;
        pathval = pathval.toLowerCase();

        document.getElementById("lblPath").innerHTML = '<%=saveConstants.getString("NOTE") %>' + ": "+'<%=saveConstants.getString("THIS_CHART_WILL_BE_ACCESSIBLE_AT")%>'+" <b>http://k.astrosage.com/" + pathval + "</b>"
    }

    function showtag(id) {
        if (document.getElementById(id).style.display == 'none')
            document.getElementById(id).style.display = 'block';
        else
            document.getElementById(id).style.display = 'none';
    }
    function validChartNameCheck() {
        var currchartname = document.getElementById("chartName").value;

        var firstcharcurrchartname = currchartname.substr(0, 1);
        var lastcharcurrchartname = currchartname.substr((currchartname.length) - 1, 1);

        if ((firstcharcurrchartname.charCodeAt() >= 48 && firstcharcurrchartname.charCodeAt() <= 57) || (firstcharcurrchartname.charCodeAt() == 45)) {
            $('#chartNameAvailablity').html('');
            $('.validateTips').html('<div class="alert alert-danger center-align"><%=saveChartConstants.getString("CHART_NAME_CAN_NOT_BE_START_WITH_DIGIT") %></div>');
            setTimeout(function(){$('.validateTips').html(''); }, 5000);
            //validationMsg('');
        }
        else {
            if (lastcharcurrchartname.charCodeAt() == 45) {
                $('#chartNameAvailablity').html('');
                $('.validateTips').html('<div class="alert alert-danger center-align"><%=saveChartConstants.getString("CHART_NAME_CAN_NOT_BE_END_HYPHEN") %></div>');
                setTimeout(function(){$('.validateTips').html(''); }, 5000);
                //validationMsg('');
            }
            else {
                var rexp = /^[A-Za-z0-9-]*$/;
                if (currchartname.search(rexp) == 0) {
                    $('.validateTips').html('');
                        return true;
                }
                else {
                    $('#chartNameAvailablity').html('');
                    $('.validateTips').html('<div class="alert alert-danger center-align"><%=saveChartConstants.getString("PLEASE_ENTER_VALID_CHART_NAME") %></div>');
                    setTimeout(function(){$('.validateTips').html(''); }, 5000);
                    //validationMsg('');
                    return false;
                }
            }
        }
    }
   
</script>

<form method="post" id="two" name="two">
<%
if(saveHoro != null)
{
%>
	<input type="hidden" name="name1" id="name1" value="<%=saveHoro.getName()%>" /> 
	<input type="hidden" name="ddlSex" id="ddlSex" value="<%=saveHoro.getMaleFemale()%>" /> 
	<input type="hidden" name="day1" id="day1" value="<%=saveHoro.getDayOfBirth()%>" /> 
	<input type="hidden" name="month1" id="month1" value="<%=saveHoro.getMonthOfBirth()%>" />
	<input type="hidden" name="year1" id="year1" value="<%=saveHoro.getYearOfBirth()%>" /> 
	<input type="hidden" name="hrs1" id="hrs1" value="<%=saveHoro.getHourOfBirth()%>" /> 
	<input type="hidden" name="min1" id="min1" value="<%=saveHoro.getMinuteOfBirth()%>" /> 
	<input type="hidden" name="sec1" id="sec1" value="<%=saveHoro.getSecondOfBirth()%>" /> 
	<input type="hidden" name="dst1" id="dst1" value="<%=saveHoro.getDST()%>" />
	<input type="hidden" name="place1" id="place1" value="<%=saveHoro.getPlace()%>" /> 
	<input type="hidden" name="LongDeg1" id="LongDeg1" value="<%=saveHoro.getDegreeOfLongitude()%>" /> 
	<input type="hidden" name="LongMin1" id="LongMin1" value="<%=saveHoro.getMinuteOfLongitude()%>" /> 
	<input type="hidden" name="LongEW1" id="LongEW1" value="<%=saveHoro.getEastWest()%>" /> 
	<input type="hidden" name="LatDeg1" id="LatDeg1" value="<%=saveHoro.getDegreeOfLattitude()%>" /> 
	<input type="hidden" name="LatMin1" id="LatMin1" value="<%=saveHoro.getMinuteOfLattitude()%>" /> 
	<input type="hidden" name="LatNS1" id="LatNS1" value="<%=saveHoro.getNorthSouth()%>" /> 
	<input type="hidden" name="timeZone1" id="timeZone1" value="<%=saveHoro.getTimeZone()%>" /> 
	<input type="hidden" name="ddlAyanamsa" id="ddlAyanamsa" value="<%=saveHoro.getAyanamsa()%>" /> 
	<input type="hidden" name="ddlChartStyle" id="ddlChartStyle" value="<%=session.getAttribute("chartType")%>" /> 
	<input type="hidden" name="kphn" id="kphn" value="<%=saveHoro.getKPHorarySeed() %>" /> 
	<input type="hidden" name="hideChartName" id="hideChartName" /> 
	<input type="hidden" name="tagsval" id="tagsval" /> 
	<input type="hidden" name="HideUserID" id="HideUserID" value="<%=session.getAttribute("User_Id")%>" />
		<% } %>
</form>

<div id="dialog-form-savechart" class="modal" title="Save Chart">

  <div class="model-header amber darken-1">
  
  <h4 class="white-text padding-all-5">
  <%=saveConstants.getString("SAVCHART")%>
  <a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
  </h4>
 
         </div>
         

  <div class="modal-content clearfix">
  		 <div id="alerttext"></div>
  		 
	<p class="validateTips">
		<b><%=saveChartConstants.getString("CHOOSE_CHART_VISIBILITY") %></b>
	</p>
	<form id="frmSaveChart" name="frmSaveChart">
		<fieldset class="no-br">
			<input type="radio" id="rbPrivate" name="rb" value="private" onclick="showDiv('hidden')" checked="checked" /> 
			<label for="rbPrivate"> <%=saveConstants.getString("PRIVATE_CHART") %></label>
			<br /> 
			<input type="radio" id="rbShared" name="rb" value="shared" onclick="showDiv('visible')" /> 
			<label for="rbShared"> <%=saveConstants.getString("SHARED_CHART") %></label>
			
			
			<div id="divChartName" style="visibility: hidden;">
				
				<div class="row">
					<div class="input-field col s12">		
					<p>(<%=saveChartConstants.getString("CHART_NAME_CAN_BE_GVN_AS_COMBI_ALPHB_DIGITS") %>)</p> 
				</div>			
				
		
		<div class="input-field col s12">	
			<input type="text" name="chartName" id="chartName" maxlength="15" placeholder="<%=saveConstants.getString("CHART_NAME")%>" onmouseout="updatePath()" onkeyup="updatePath();" /> 
			<label for="name"><%=saveConstants.getString("CHART_NAME")%></label> 	 
			<span id="chartNameAvailablity"></span>
		
		
		</div>
		
		<div class="col s12 right-align">	
			<input type="button" class="waves-effect amber darken-4 btn" value='<%=saveConstants.getString("CHECK_AVAILABILITY") %>' onclick="checkAvailability()" /> 
		
		</div>
		
		<div class="col s12 mrt-10">	
			<span id="lblPath"></span>
		</div>
		
		</div>
			</div>
			
			<div class="row">
			<div class="col s12">	
		<a href="#!" id="taglink" class="btn amber waves-effect black-text" onclick="showtag('addtag');"><%=saveChartConstants.getString("ADD_TAGS") %></a>
			<div id="addtag" style="display: none;">
				<input type="text" id="tags" name="tags" maxlength="254" class="text ui-widget-content ui-corner-all" />
			</div>
			</div>
		</div>
		<span id="pleasewaiting"></span>
		</fieldset>
	</form>
	
	
	 <div class="modal-footer">
      <a href="javascript:void(0);" class="modal-action waves-effect waves-red btn-flat text-orange save-chart"><%=saveConstants.getString("SAVCHART")%></a>
      <a href="javascript:void(0);" class="modal-action waves-effect waves-red btn-flat text-orange cancel-svc"><%=saveConstants.getString("CANCEL") %></a>
    </div>
	
	</div>
</div>

<div id="dialog-form-notification" class="toastbar sb-success sb-bottom">
		<a href="javascript:closeToast('#dialog-form-notification');" class="right sb-link"><i class="material-icons">close</i></a><%=saveConstants.getString("YOUR_CHART_HAS_BEEN_SAVED_SUCCESSFULLY") %>	
</div>
<div id="alertToast" class="toastbar sb-danger sb-bottom"></div>	

