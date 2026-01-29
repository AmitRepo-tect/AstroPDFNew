<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String userId = "";
Object objUser = session.getAttribute("User_Id");
if(objUser != null)
{
	userId = objUser.toString();
}
Local openLocal = new Local();
int openLangCode = (Integer)session.getAttribute("languageCode");
MyProperties openRBConstants = (MyProperties) session.getAttribute("constants");

MyResourceBundle openChartConstants = openLocal.loadPropertiesFileNew("openchart",openLangCode);
MyResourceBundle saveChartCons = openLocal.loadPropertiesFileNew("savechart",openLangCode);
%>

<script type="text/javascript">

    var srno;
    var type;
    function openChart(val) {
     //alert("gg");
       checklogin();
        type = val;
        status = "0";
        $("#chartname").val();
        srno = 1;
        if (val == 'open') {
            $("#dialog-form-openchart").dialog({ title: '<%=openRBConstants.getString("OPEN_CHART")%>' });
        }
        else {
            $("#dialog-form-openchart").dialog({ title: '<%=openChartConstants.getString("MANAGE_CHART")%>'});
        }
        if ('<%=userId%>' == "") {
            if (val == 'open')
                v = '/cloud/loginwelcome.asp?val=open';
            if (val == 'manage')
                v = '/cloud/loginwelcome.asp?val=manage';
            window.location.href = 'login.asp?refferurl=' + v;
        }
        else {
            $("#opchart").empty();
            loadMore();
            $("#dialog-form-openchart").dialog('open');
        }
    }

    
    var status;
    $(document).ready(function () {
        status = "0";

        $("#dialog").dialog("destroy");

        // Start of open chart dialog

        $("#dialog-form-openchart").dialog(
            {
                autoOpen: false,
                height: 420,
                width: 720,
                modal: true,
                open: function (event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '140px');
                    $(event.target).parent().css('center');
                },
                buttons: {
                    '<%=openRBConstants.getString("CANCEL") %>': function () {
                        $("#dialog-form-openchart").dialog('close');
                        status = "0";
                    }
                },
                close: function () {
                    status = "0";
                }
            });
        // End of open chart dialog
        $("#loadButton").click(function () {
            loadMore();
        });


        $("#chartname").autocomplete(
        		"/cloud/ChartServlet",
        {
            delay: 10,
            minChars: 3,
            matchSubset: 1,
            matchContains: 1,
            cacheLength: 0,
            extraParams: { methodName:'openChartAutoComplete',userid: $("#uid").val() },
            onItemSelect: selectItem1,
            onFindValue: findvalue1,
            formatItem: formatItem1,
            autoFill: false
        });
    });


    /*function findValue(li) {
    //CreatedataList(li);
    }
    */
    function findvalue1(li) {
        CreatedataList(li);
    }

    function CreatedataList(li) {
    

        if (type == "open") {
            window.location = "/cloud/ChartServlet?methodName=openChart&ChartId=" + li.extra[0]+"&referrer=/cloud/worksheet";
        }
        var strChartData = "";
        var strTableHeading = "";

        if (li == null) return alert("No match!");

        var defaultBtnText = '<%=openChartConstants.getString("MORE_CHART") %>';
        var val = null;
        status = "0";

        if (status == "0") {
            $('#ChartData').empty();
            $("#LstChrtId").val('');
            srno = 1;
        }


        if (status == "0") {

            strTableHeading = '<tr><td class="cellhead" style="height:35px;width:10px;word-wrap:nowrap"><%=openRBConstants.getString("S_N") %></td><td nowrap class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("CHART_NAME") %></td><td class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("GENDR") %></td><td class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("DATAM") %></td><td class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("TIMAR") %></td><td  class="cellhead" style="width:15px;word-wrap:nowrap"><%=openRBConstants.getString("PLAC") %></td><td class="cellhead" style="width:18px;word-wrap:nowrap"><%=openRBConstants.getString("CHART_TYPE")%></td>';
            if (type == 'open') {
                strTableHeading = strTableHeading + '<td class="cellhead" style="word-wrap:nowrap;">Open Chart</td></tr>';
            }
            if (type == 'manage') {
                strTableHeading = strTableHeading + '<td class="cellhead" style="word-wrap:nowrap;" colspan="3">Action</td></tr>';
            }
            $('#ChartData').append(strTableHeading);
            status = "1";
        }


        strChartData = strChartData + '<tr class="pseudosecond"><td class="cellcontent" style="height:35px;">' + srno + '</td><td class="cellcontent">' + $("#chartname").val() + '</td><td class="cellcontent">' + li.extra[1] + '</td><td class="cellcontent" nowrap>' + li.extra[2] + '</td><td class="cellcontent">' + li.extra[3] + '</td><td class="cellcontent" >' + li.extra[4] + '</td><td class="cellcontent">' + li.extra[5] + '</td>';


        if (type == 'open') {
            strChartData = strChartData + '<td class="cellcontent" nowrap><a href="/cloud/ChartServlet?methodName=openChart&ChartId=' + li.extra[0] + '&referrer=/cloud/worksheet" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td></tr>';
        }
        if (type == "manage") {

            chartIdAndChartName = "'" + li.extra[0] + "," + $("#chartname").val() + "'";
            strChartData = strChartData + '<td class="cellcontent"  style="word-wrap:nowrap; width:10px;"><a href="/cloud/ChartServlet?methodName=openChart&ChartId=' + li.extra[0] + '&referrer=/cloud/worksheet" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td>';
            strChartData = strChartData + '<td class="cellcontent"  style="word-wrap:nowrap; width:10px;"><a href="#" onclick="editchartform(' + "'" + li.extra[0] + "'" + ');" class="pseudo"><%=openRBConstants.getString("EDIT") %></a></td>';
            strChartData = strChartData + '<td class="cellcontent"  style="word-wrap:nowrap; width:10px;"><a href="#" class="pseudo" onClick="deleteChart(' + chartIdAndChartName + ')"><%=openChartConstants.getString("DELETE") %></a></td></tr>';
        }
        srno = srno + 1

        $('#ChartData').append(strChartData);
        $('.pseudo').css('color', 'blue');
        $('.pseudo').css('text-decoration', 'underline');
        $("#loadButton").html(defaultBtnText);
        $("#loadButton").hide();

    }

    function selectItem1(li) {
        //findValue(li);
        findvalue1(li);
    }
    function formatItem1(row) {
        return row[0] + "," + row[3] + "," + row[4] + "," + row[5];
    }



  /*  function lookupAjax() {
        var oSuggest = $("#chartname")[0].autocompleter;
        oSuggest.findValue();
        return false;
    }*/

  //**************************************************************************************************************

    function loadMore() {
        $("#chartname").val('');
        var defaultBtnText = '<%=openChartConstants.getString("MORE_CHART") %>';
        var buttonLoadingText = "Loading..";
        var val = null;
        if (status == "0") {
            $('#ChartData').empty();
            $("#LstChrtId").val('');
            srno = 1;
        }

        $.ajax({
            url: '/cloud/ChartServlet?methodName=loadCharts',
            method: 'post',
            data: ({ userId: $("#uid").val(), ChartId: $("#LstChrtId").val() }),
            success: function (data) {
                val = data;
                if (val != "" && val != "You are not authorized to view this page") {

                    if (status == "0") {

                        strTableHeading = '<tr><td class="cellhead" style="height:35px;width:10px;word-wrap:nowrap"><%=openRBConstants.getString("S_N") %></td><td class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("CHART_NAME") %></td><td class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("GENDR") %></td><td class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("DATAM") %></td><td class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("TIMAR")%></td><td class="cellhead" style="width:15px;word-wrap:nowrap"><%=openRBConstants.getString("PLAC") %></td><td class="cellhead" style="width:18px;word-wrap:nowrap"><%=openRBConstants.getString("CHART_TYPE") %></td>';
                        if (type == 'open') {
                            strTableHeading = strTableHeading + '<td class="cellhead" style="width:18px;word-wrap:nowrap"><%=openRBConstants.getString("OPEN_CHART")%></td></tr>';
                        }
                        if (type == 'manage') {
                            strTableHeading = strTableHeading + '<td class="cellhead" colspan="3" style="width:18px;word-wrap:nowrap"><%=openRBConstants.getString("ACTION")%></td></tr>';
                        }
                        $('#ChartData').append(strTableHeading);
                        status = "1";
                    }

                    var chartData = eval('(' + val + ')');
                   // alert(val);
                    var strChartData = "";
                    for (var i = 0; i < chartData.length; i++) {
                        var len = chartData.length - 1;
                        if (chartData.length >= 20) {
                            $("#loadButton").html(buttonLoadingText);
                            $("#loadButton").show();
                        }
                        else {
                            $("#loadButton").hide();
                        }

                        $('#LstChrtId').val(chartData[len].chartId);
                        strChartData = strChartData + '<tr class="pseudosecond"><td class="cellcontent" style="height:35px;">' + srno + '</td><td class="cellcontent">' + chartData[i].chartName + '</td><td class="cellcontent">' + chartData[i].gender + '</td><td class="cellcontent" nowrap>' + chartData[i].Date_of_Birth + '</td><td class="cellcontent">' + chartData[i].Time_of_Birth + '</td><td class="cellcontent" >' + chartData[i].Place_of_Birth + '</td><td class="cellcontent">' + chartData[i].pubshared + '</td>';

                        if (type == 'open') {
                            strChartData = strChartData + '<td class="cellcontent" nowrap><a href="/cloud/ChartServlet?methodName=openChart&ChartId=' + chartData[i].chartId + '&referrer=/cloud/worksheet" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td></tr>';
                        }
                        if (type == "manage") {
                          //  alert(chartData[i].chartName);
                            chartIdAndChartName = "'" + chartData[i].chartId + "," + chartData[i].chartName + "'";
                            strChartData = strChartData + '<td class="cellcontent" style="width:50px;word-wrap:nowrap;"><a href="/cloud/ChartServlet?methodName=openChart&ChartId=' + chartData[i].chartId +'&referrer=/cloud/worksheet" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td>';
                            strChartData = strChartData + '<td class="cellcontent" style="width:25px;word-wrap:nowrap;"><a href="#" onclick="editchartform(' + "'" + chartData[i].chartId + "'" + ');" class="pseudo"><%=openRBConstants.getString("EDIT") %></a></td>';
                            strChartData = strChartData + '<td class="cellcontent" style="width:45px;word-wrap:nowrap;"><a href="#" class="pseudo" onClick="deleteChart(' + chartIdAndChartName + ')"><%=openChartConstants.getString("DELETE") %></a></td></tr>';
                        }
                        srno = srno + 1
                        strChartData = strChartData;
                    }
                    $('#ChartData').append(strChartData);
                    $('.pseudo').css('color', 'blue');
                    $('.pseudo').css('text-decoration', 'underline');
                    $("#loadButton").html(defaultBtnText);
                }
                else {
                    //if ($('#LstChrtId').val() == "")
                    //updateTips('<%=openRBConstants.getString("YOU_HAVE_NOT_SAVED_CHART") %>'); 
                    if (val == "You are not authorized to view this page") {
                        validationMsg('<%=openRBConstants.getString("YOU_ARE_NOT_AUTHORIZE")%>');
                    }
                    else {
                        validationMsg('<%=openRBConstants.getString("YOU_HAVE_NOT_SAVED_CHART") %>')
                    }
                    $("#openchart").hide();
                }
            }
        });
    }

    //**********************************************************************************************************************

   /* function updateTips(t) {
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

        function editChart(val) {
        $("#dialog-form-editchart").dialog('open');
    }

    //***********************************************************************************************************************
  $(document).ready(function () {
    $('#dialog-form-confirmalert').dialog({
            autoOpen: false,
            title: '<%=saveChartCons.getString("ALERT")%>',
            width: 420,
            height: 250,
            modal: true,            
            open: function (event, ui) {
                $(event.target).parent().css('position', 'absolute');
                $(event.target).parent().css('top', '200px');
                $(event.target).parent().css('center');
                $(event.target).parent().css('z-index', '1001');
            },
            buttons: {
                '<%=openRBConstants.getString("YES") %>': function () {
                      chartId = document.getElementById("deletechartid").value;
                      chartIdAndName = chartId.split(",");
                     var value = (function () {
                    var val;
                    val = null;
                    $.ajax({
                        'async': false,
                        'global': false,
                        'url': '/cloud/ChartServlet?methodName=deleteChart',
                        'data': ({ deleteChartId: chartIdAndName[0] }),
                        'success': function (data) {
                            val = data;
                            showUserContent(); //method to update the session variable for commentbox
                             $("#dialog-form-confirmalert").dialog('close');
                        }
                    });
                    return val;
                })();

                status = "0";
                loadMore();
                if (value == "<%=ConstantValues.DELETION_SUCCESSFULLY %>") {
                    updateTips('<%=openChartConstants.getString("CHART_HAS_BEEN_DELETED_SUCCESSFULLY") %>');
                    $("#dialog-form-confirmalert").dialog('close');
                }

                if (value == "<%=ConstantValues.DELETING_OPENED_CHART %>") {
                    updateTips('<%=openChartConstants.getString("CURRENT_OPEN_CHART_CANT_BE_DELETE") %>');
                    $("#dialog-form-confirmalert").dialog('close');
                }

                if (value == "<%=ConstantValues.CONDITION_FAILED %>") {
                    updateTips('You must have atleast one saved chart.');
                    $("#dialog-form-confirmalert").dialog('close');
                }

                if (value == "<%=ConstantValues.CHART_DELETION_FAILED %>") {
                    updateTips('<%=openChartConstants.getString("CHART_NOT_DELETED")%>');
                    $("#dialog-form-confirmalert").dialog('close');
                }
                if (value == "<%=ConstantValues.UNKNOWN_ERROR_CODE %>") {
                    updateTips('<%=openChartConstants.getString("ERROR_OCCURRED") %>.');
                    $("#dialog-form-confirmalert").dialog('close');
                }
                },
                '<%=openRBConstants.getString("NO")%>': function () {
                        $("#dialog-form-confirmalert").dialog('close');
                }
            }
        })
    });

    function confirm(msg) {
        $("#dialog-form-confirmalert").dialog('open');
    }

    function deleteChart(chartId) {
       document.getElementById("deletechartid").value= chartId;
        chartIdAndName = chartId.split(",");

        if (chartIdAndName[0] == chartId) {
            updateTips('<%=openChartConstants.getString("CURRENT_OPEN_CHART_CANT_BE_DELETE") %>.');
        }
        else {
            updateTips('');
            confirmation = confirm('<%=openChartConstants.getString("ARE_YOU_SURE_THAT_YOU_WANT_TO_DELETE_THE_CHART_OF") %> "' + chartIdAndName[1] + '" <%=openChartConstants.getString("CHART_DELETE_FOR_HINDI")%>');
            document.getElementById("confirmalertmsg").innerHTML = '<%=openChartConstants.getString("ARE_YOU_SURE_THAT_YOU_WANT_TO_DELETE_THE_CHART_OF") %> "' + chartIdAndName[1] + '" <%=openChartConstants.getString("CHART_DELETE_FOR_HINDI")%>' ;
        }
    }

    //***********************************************************************************************************

 </script>


<div id="dialog-form-openchart" title="" style="display:none;" >
<div class="validateTips" id="opchart">
</div>
    <fieldset >
        <form name="openchart" id="openchart" >
        <table  cellpadding="0" cellspacing="0" width="100%"  align="center" style="padding-bottom:10px;" >
            <tr>
            <td align="center" style="padding-bottom:20px;">
                <b><%=openChartConstants.getString("OPEN_CHART_SEARCH")%></b>
                <input type="text" id="chartname" name="chartname" style="width:300px;height:20px;"border: 1px solid #f96d06;" />
            </td>
            </tr>

        </table>
        <input type="hidden" name="uid" id="uid" value="<%=userId%>" />
        <input type="hidden" name="LstChrtId" id="LstChrtId" />
        <input type="hidden" name="referrer"  value="/cloud/worksheet"/>
        <table  id="ChartData" cellpadding="0" cellspacing="0" width="100%" style=" border-collapse:collapse;" border="1" bordercolor="#f96d06">
       </table>
        <br />
        <a href="javascript:void(0);" >
            <div id="loadButton" style="width:680px; border: 1px solid #f96d06; line-height:25px;background: #faecd1;color: #303030;font-weight:bold; margin-left:2px; text-align:center;"></div>
        </a>
       </form>
    </fieldset>
</div>

<div id="dialog-form-confirmalert" title="" style="display:none;">
    <div class="validateTips" id="confirmalert">
    </div>
    <div id="confirmalertmsg" style="padding:20px 0px 0px 10px;">
    </div>
    <input type="hidden" id="deletechartid" />
    </div>
