<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Local savelocal = new Local();
int savelanguageCode = (Integer)session.getAttribute("languageCode");
MyProperties saveConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle saveChartConstants = savelocal.loadPropertiesFileNew("savechart",savelanguageCode);
MyResourceBundle sharePublicConstants = savelocal.loadPropertiesFileNew("savechart-sharechartpubliclyjs",savelanguageCode);
MyResourceBundle toolBar = savelocal.loadPropertiesFileNew("toolbar",savelanguageCode);
DesktopHoro saveHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
%>
<script type="text/javascript">
function popupvisibility() {
 		window.location.href='/cloud/home.asp?openPaidPopup'            
     }
    function savechart() {
        if (document.getElementById("HideUserID").value == "") {
            v = 'loginwelcome.jsp?val=saveonly';           
            window.location.href = 'login.jsp?refferurl=' + v;            
        }
        else {     
            fillTagValue(); 
            document.getElementById("hideChartName").value = "";
            $("#tagsval").val($("#tags").val());
            $.get('/cloud/ChartServlet?methodName=checkAndSaveChart', $("#two").serialize(), function (data) {
                if (data == "1" || data == "-3") {
                    $("#issave").val("0");
                    clearInterval(timer);
                    $('#dialog-form-notification').dialog('open');
                    //showUserContent(); //method to update the session variable for commentbox
                }
                else if (data == "-2") {
                    //$('#alerttext').html('<font size="3" color="maroon"><b><%=saveConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN1")%></b></font>');
                    $('#alerttext').html('<font size="3" color="black"><%=saveConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN1")%></font>');
                    $('#dialog-form-alert').dialog({ height: 235 }, { width: 480 });
                    $('#dialog-form-alert').dialog('open');
                }
                else {
                    $('#alerttext').html('<font size="3" color="maroon"><b><%=saveConstants.getString("SORRY_YOUR_CHART_HAS_NOT_SAVED_PLEASE_TRY_AGAIN") %></b></font>');
                    $('#dialog-form-alert').dialog('open');
                }
            });    
        }
    }

    
    var timer = setInterval(function () { myTimer() }, 90000);
    function myTimer() {
    	//alert($("#issave").val());
        if ($("#issave").val() == "1") {
            $("#dialog-form-Timer").dialog("open");
        }
    }


    function fillTagValue() {       
        var value = (function() {
            var val = null;
            $.ajax({
                'async': false,
                'global': false,
                'url': '/cloud/ChartServlet?methodName=getTagValue',
                'data': ({ chartid: '<%=session.getAttribute("ChartId") %>' }),
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
   
    
    // Checking length for Chart Name 

   
    function openSignUpDialog() {
        $('#dialog-form-login').dialog('close');
        $('#dialog-form-signup').dialog('open');
    }

    function showDiv(status) {
        document.getElementById("divChartName").style.visibility = status;        
    }

   $(document).ready(function () {
        tips = $(".validateTips");
        var name = $("#chartName");
  
        // Start notification Dialog Box

        $("#dialog-form-notification").dialog(
            {
                autoOpen: false,
                title: '<%=saveConstants.getString("MESSAGE") %>',
                height: 180,
                width: 440,
                modal: true,
                open: function (event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '160px');
                    $(event.target).parent().css('center');
                },
                buttons:
                {
                    '<%=saveConstants.getString("OKVAL") %>': function () {
                        $(this).dialog('close');
                    }

                },
                close: function () {
                }
            });

        // End notification Dialog Box

        // Start alert Dialog Box

        $("#dialog-form-alert").dialog(
            {
                autoOpen: false,
                title: '<%=saveChartConstants.getString("ALERT") %>',
                height: 180,
                width: 440,
                modal: true,
                open: function (event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '160px');
                    $(event.target).parent().css('center');
                },
                close: function () {
                 window.location = "/cloud/worksheet/";
                }
            });

        // End alert Dialog Box        
    });

</script>
<!-- For The Timer popup box -->
<script type="text/javascript">
    $(document).ready(function () {

        //$("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button').eq(2).hide();
        $("#dialog-form-Timer").dialog(
            {
                autoOpen: false,
                height: 260,
                width: 320,
                closeOnEscape: false,
                modal: true,
                title: '<%=toolBar.getString("UNSAVED") %>',
                open: function (event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '200px');
                    $(event.target).parent().css('center');
                },

                buttons:
                {
                    '<%=saveConstants.getString("YES")%>': function () {
                        $("#ajax-loader").clone(true).appendTo("#plzwait").show();
                        if ($("#Userid").val() != "") {

                            $.get('/cloud/ChartServlet?methodName=checkAndSaveChart', $("#two").serialize(), function (data) {

                                if (data == "1" || data == "-3") {
                                    $("#issave").val("0");
                                    $("#Confirmsg").hide();
                                    validationMsg('<%=saveConstants.getString("YOUR_CHART_HAS_BEEN_SAVED_SUCCESSFULLY") %>');
                                    clearInterval(timer);
                                    $("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button:first').hide();
                                    $("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button').eq(1).hide();
                                    $("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button').eq(2).show();
                                    $('#plzwait').html('');
                                }
                                else if (data == "-2") {
                                    validationMsgWithLink('<%=saveConstants.getString("SORYY_YOU_CAN_NOT_SAVE_MORE_CHARTS_PLEASE_UPGRADE_YOUR_PLAN") %>');
                                    $("#Confirmsg").hide();
                                    $("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button:first').hide();
                                    $("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button').eq(1).hide();
                                    $("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button').eq(2).show();
                                    $('#plzwait').html('');

                                }
                                else if (data == "10") {
                                    window.location = "login.jsp?refferurl=loginwelcome.asp?val=saveonly";
                                }
                                else {
                                    validationMsg('<%=saveConstants.getString("SORRY_YOUR_CHART_HAS_NOT_SAVED_PLEASE_TRY_AGAIN") %>');
                                    $("#Confirmsg").hide();
                                    $('#plzwait').html('');
                                }
                            });
                        }
                        else {
                            window.location = "login.jsp?refferurl=loginwelcome.jsp?val=saveonly";
                        }
                    },

                    '<%=saveConstants.getString("NO")%>': function () {
                        $("#ajax-loader").clone(true).appendTo("#plzwait").show();
                        //alert("vijay");
                        $("#issave").val("0");
                        clearInterval(timer);
                        $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': '/cloud/control/change-save-session.jsp',
                    'success': function (data) { }
                });
                        $("#dialog-form-Timer").dialog("close");
                    },
                    '<%=saveConstants.getString("CLOS") %>': function () {
                        $("#ajax-loader").clone(true).appendTo("#plzwait").show();
                        // alert("vijay");
                        $("#issave").val("0");
                        clearInterval(timer);
                        $.ajax(
                {
                    'async': false,
                    'global': false,
                    'url': '/cloud/control/change-save-session.jsp',
                    'success': function (data) { }
                });
                        $("#dialog-form-Timer").dialog("close");
                    }
                }
            });
        $("#dialog-form-Timer").siblings('.ui-dialog-buttonpane').find('button').eq(2).hide();
    });

    /*function updateTips(t) {
    tips
    .text(t)
    .addClass('ui-state-highlight');
    setTimeout(function () {
    tips.removeClass('ui-state-highlight', 1500);
    }, 500);
    }

    function validationMsg(msg) {
    updateTips(msg);
    return false;
    }*/

    function updateTipsWithLink(t) {
        tips
		.html(t)
		.addClass('ui-state-highlight');
        setTimeout(function () {
            tips.removeClass('ui-state-highlight', 1500);
        }, 500);
    }

    function validationMsgWithLink(msg) {
        updateTipsWithLink(msg);
        return false;
    } 
</script>

<form method="post" id="two" name="two">
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
</form>

<%
if(request.getParameter("upgrade") != null)
{
%>
<script type="text/javascript">savechart();</script>
<% } %>
<!--<div id="dialog-form-savechart" title="Save Chart" style="display:none;">
    <p class="validateTips">
        <b><%=saveChartConstants.getString("CHOOSE_CHART_VISIBILITY") %></b>
    </p>
    <form id="frmSaveChart" name="frmSaveChart">
    <fieldset>
        <input type="radio" id="rbPrivate" name="rb" value="private" onclick="showDiv('hidden')"
            checked="checked" />
        <label for="rbPrivate">
            <%=saveConstants.getString("PRIVATE_CHART") %></label>
        <br />
        <input type="radio" id="rbShared" name="rb" value="shared" onclick="showDiv('visible')" />
        <label for="rbShared">
            <%=saveConstants.getString("SHARED_CHART") %></label>
        <div id="divChartName" style="visibility:hidden;">
            <br />
            <label for="name">
                <b><%=saveConstants.getString("CHART_NAME")%>: </b></label>
                <br />
                <font size="1">(<%=saveChartConstants.getString("CHART_NAME_CAN_BE_GVN_AS_COMBI_ALPHB_DIGITS") %>)</font>
            <input type="text" name="chartName" id="chartName" maxlength="15" class="text ui-widget-content ui-corner-all"
                onmouseout="updatePath()" onkeyup="updatePath();"   />
            <span id="chartNameAvailablity"></span><br />
            <input type="button" value='<%=saveConstants.getString("CHECK_AVAILABILITY") %>' onclick="checkAvailability()" />
            <br />
            <br />
            <span id="lblPath"></span>
        </div>
        <br />
        <a href="#" id="taglink" onclick="showtag('addtag');"><b><%=saveChartConstants.getString("ADD_TAGS") %></b></a>
        <div id="addtag" style=" padding-top:5px; display:none;">            
            <input type="text" id="tags" name="tags" maxlength="254" class="text ui-widget-content ui-corner-all"/>
        </div> 
        <br />
        <br />
        <span id="pleasewaiting"></span>   
    </fieldset>
    </form>
</div>-->


<div id="dialog-form-notification" style=" border:#000 0px solid; display:none;" class="ui-dialog-content ui-widget-content">
 <div class="dialognotification">
 <img src="/cloud/images/availableimg.png" /></div>
 <div align="left" style="border:#000 0px solid; text-align:center;">
    <b><%=saveConstants.getString("YOUR_CHART_HAS_BEEN_SAVED_SUCCESSFULLY") %></b>
 </div>
</div>

<div id="dialog-form-alert" style=" border:#000 0px solid;display:none;">
 <div style="border:#000 0px solid; float:left;"><img src="/cloud/images/alert.png" /></div>
 <div align="left" id="alerttext" style="border:#000 0px solid; text-align:left;">    
 </div>
</div>

<input type="hidden" id="issave" value="<%=session.getAttribute("IsSaved")%>" />

<div id="dialog-form-Timer" title="" style="display:none;">
    <div class="validateTips" id="opchart">
    </div>
    <div id="Confirmsg">
        <p><b><%=toolBar.getString("CHART_NOT_SAVED_YET") %></b></p>
    </div>
    <div id="ajax-loader" style="display: none; font-weight: bold;">
        <img src='/cloud/images/loding2.gif' alt="" /><span><%=toolBar.getString("PLEASE_WAIT") %>...</span></div>
    <div id="plzwait">
    </div>
</div>






