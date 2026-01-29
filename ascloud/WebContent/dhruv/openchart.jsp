<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Local openLocal = new Local();
int openLangCode = Util.safeInt(session.getAttribute("languageCode"));
Object objConst = session.getAttribute("constants");
MyProperties openRBConstants = null;
if(objConst == null)
{
	openRBConstants = new MyProperties(openLocal.loadPropertiesFile("constants", openLangCode));
	session.setAttribute("constants", openRBConstants);
}
else
{
	openRBConstants = (MyProperties) objConst;
}

MyResourceBundle openChartConstants = openLocal.loadPropertiesFileNew("openchart",openLangCode);

%>
<style type="text/css">
.ac_results {
	z-index: 99999;
	margin-top: 2px;
}
</style>

<script type="text/javascript">
    var srno;
    var type;
    var pageUrl =window.location.href;
    function openChart(val) {
    	
    	
        type = val;
        status = "0";
        $("#chartname").val();
        srno = 1;
        $.ajax({url: "/cloud/sessioncheckofuserid.jsp", success: function(result){
                if(result.trim() == null   || result.trim() == "" || result.trim() == "null"  )
            	{
            	if (val == 'open')
                    v = '/cloud/loginwelcome.asp?val=open';
                if (val == 'manage')
                    v = '/cloud/loginwelcome.asp?val=manage';
                window.location.href = '/cloud/login.asp?refferurl=' + v;
            	}
        }});
        if ('<%=session.getAttribute("User_Id")%>' == null || '<%=session.getAttribute("User_Id")%>' == "null" || '<%=session.getAttribute("User_Id") %>' == "") {
            if (val == 'open')
                v = '/cloud/loginwelcome.asp?val=open';
            if (val == 'manage')
                v = '/cloud/loginwelcome.asp?val=manage';
            window.location.href = '/cloud/login.asp?refferurl=' + v;
        }
        else {
        	
            $("#opchart").empty();
            loadMore();
            $("#dialog-form-openchart").modal('open');
        }
        if (val == 'open') {
            $("#title").text('<%=openRBConstants.getString("OPEN_CHART") %>');
        	//$("#dialog-form-openchart").modal('open');
        }
        else {
        	$("#title").text('<%=openChartConstants.getString("MANAGE_CHART")%>');
        	//$("#dialog-form-openchart").dialog({ title: '<font size="4">' });
        }
        //alert('<%//=session.getAttribute("User_Id")%>');
     
    }
    function editChart(val) {
        $("#dialog-form-editchart").modal('open');
    }
    function deleteChart(chartId) {
    	$.ajax({
   		 url: "sessioncheckofuserid.jsp",
   		 async: false,
   		 success: function(result){
            if(result.trim() == null   || result.trim() == "" || result.trim() == "null"  )
        	{
           window.location.href = 'login.asp?refferurl=delete';
        	}
            else{
        var chartIdAndName;
        chartIdAndName = chartId.split(",");

        if ('<%=session.getAttribute("ChartId")%>' == chartIdAndName[0]) {
            updateTips('<%=openChartConstants.getString("CURRENT_OPEN_CHART_CANT_BE_DELETE") %>');
        }
        else {
            confirmation = confirm('<%=openChartConstants.getString("ARE_YOU_SURE_THAT_YOU_WANT_TO_DELETE_THE_CHART_OF") %> "' + chartIdAndName[1] + '" <%=openChartConstants.getString("CHART_DELETE_FOR_HINDI")%>');

            if (confirmation) {
                var value = (function() {
                    var val;
                    val = null;
                    $.ajax({
                        'async': false,
                        'global': false,
                        'url': '/cloud/ChartServlet?methodName=deleteChart',
                        'data': ({ deleteChartId: chartIdAndName[0] }),
                        'success': function(data) {
                            val = data;
                            showUserContent(); //method to update the session variable for commentbox
                        }
                    });
                    return val;
                })();

                //loaddata('manage');
                status = "0";
                loadMore();
                if (value == "<%=ConstantValues.DELETION_SUCCESSFULLY %>") {                  
                	updateTips('<%=openChartConstants.getString("CHART_HAS_BEEN_DELETED_SUCCESSFULLY") %>');
                }

                if (value == "<%=ConstantValues.DELETING_OPENED_CHART %>") {
                    updateTips('<%=openChartConstants.getString("CURRENT_OPEN_CHART_CANT_BE_DELETE") %>');
                }

                if (value == "<%=ConstantValues.CONDITION_FAILED %>") {
                    updateTips('You must have atleast one saved chart.');
                }

                if (value == "<%=ConstantValues.CHART_DELETION_FAILED %>") {
                    updateTips('<%=openChartConstants.getString("CHART_NOT_DELETED")%>');
                }
                if (value == "<%=ConstantValues.UNKNOWN_ERROR_CODE %>") {
                    updateTips('<%=openChartConstants.getString("ERROR_OCCURRED") %>.');
                }
            }
        }
            }}});
    }
    function updateTips(t) {
        tips.text(t).addClass('ui-state-highlight');
        setTimeout(function() {
            tips.removeClass('ui-state-highlight', 1500);
        }, 500);
    }

    function validationMsg(msg) {
        updateTips(msg);
        return false;
    }

    var status;
    $(document).ready(function() {
        status = "0";

        $("#dialog").modal("close");

        // Start of open chart dialog

       <%--  $("#dialog-form-openchart").dialog(
            {
                autoOpen: false,
                height: 420,
                width: 720,
                modal: true,
                open: function(event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '100px');
                    $(event.target).parent().css('center');
                },
                buttons: {
                    '<%=openRBConstants.getString("CANCEL") %>': function() {
                        $("#dialog-form-openchart").dialog('close');
                        status = "0";
                    }
                },
                close: function() {
                    status = "0";                    
                }
            }); --%>
        // End of open chart dialog
        $("#loadButton").click(function() {
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

    function CreatedataList(li) {
        if (type == "open") {
            window.location = "/cloud/ChartServlet?methodName=openChart&fromDhruv=1&referrer="+pageUrl+"&ChartId=" + li.extra[0];
        }
        var strChartData = "";
        var strTableHeading = "";

        if (li == null) return alert("No match!");

        var defaultBtnText = '<a href="#" class="waves-effect waves-light btn amber darken-4 box-shadow"><%=openChartConstants.getString("MORE_CHART") %></a>';
        var val = null;
        status = "0";

        if (status == "0") {
            $('#ChartData').empty();
            $("#LstChrtId").val('');
            srno = 1;
        }


        if (status == "0") {

        	strTableHeading = '<thead><tr class="orange lighten-5"><th><%=openRBConstants.getString("S_N") %></th><th nowrap class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("CHART_NAME") %></th><th class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("GENDR") %></th><th class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("DATAM") %></th><th class="cellhead" style="width:10px;word-wrap:nowrap"><%=openRBConstants.getString("TIMAR") %></th><th  class="cellhead" style="width:15px;word-wrap:nowrap"><%=openRBConstants.getString("PLAC") %></th><th class="cellhead" style="width:18px;word-wrap:nowrap"><%=openRBConstants.getString("CHART_TYPE")%></th>';
            if (type == 'open') {
                strTableHeading = strTableHeading + '<th>Open Chart</th></tr></thead>';
            }
            if (type == 'manage') {
                strTableHeading = strTableHeading + '<th colspan="3">Action</th></tr></thead><tbody>';
            }
            $('#ChartData').append(strTableHeading);
            status = "1";
        }


        strChartData = strChartData + '<tr><td>' + srno + '</td><td>' + $("#chartname").val() + '</td><td>' + li.extra[1] + '</td><td>' + li.extra[2] + '</td><td>' + li.extra[3] + '</td><td>' + li.extra[4] + '</td><td>' + li.extra[5] + '</td>';


        if (type == 'open') {
            strChartData = strChartData + '<td><a href="/cloud/ChartServlet?methodName=openChart&fromDhruv=1&referrer='+pageUrl+'&ChartId=' + li.extra[0] + '" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td></tr>';
        }
        if (type == "manage") {

            chartIdAndChartName = "'" + li.extra[0] + "," + $("#chartname").val() + "'";
            strChartData = strChartData + '<td><a href="/cloud/ChartServlet?methodName=openChart&fromDhruv=1&referrer='+pageUrl+'&ChartId=' + li.extra[0] + '" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td>';
            strChartData = strChartData + '<td><a href="editchart.asp?chartid=' + li.extra[0] + '" class="pseudo"><%=openRBConstants.getString("EDIT") %></a></td>';
            strChartData = strChartData + '<td><a href="#" class="pseudo" onClick="deleteChart(' + chartIdAndChartName + ')"><%=openChartConstants.getString("DELETE") %></a></td></tr>';
        }
        srno = srno + 1

        strChartData = strChartData + '</tbody>';

        $('#ChartData').append(strChartData);
        $('.pseudo').css('color', 'red');
        $('.pseudo').css('text-decoration', 'underline');
        $("#loadButton").html(defaultBtnText);
        $("#loadButton").hide();    
    
    }


       /*function findValue(li) {
          //CreatedataList(li);
          }
*/
       function findvalue1(li) {
           CreatedataList(li);
       }
        
        
       

        function selectItem1(li) {
            //findValue(li);
            findvalue1(li);
       }
       function formatItem1(row) {           
           return row[0] + "," + row[3] + "," + row[4] + "," + row[5];
       }

       function lookupAjax() {
           var oSuggest = $("#chartname")[0].autocompleter;
           oSuggest.findValue();
           return false;
       } 
       

    function loadMore() {
    	
        $("#chartname").val('');
        var defaultBtnText = '<a href="#" class="waves-effect waves-light btn amber darken-4 box-shadow"><%=openChartConstants.getString("MORE_CHART") %></a>';
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
            data: ({ methodName: "loadCharts", userId: $("#uid").val(), ChartId: $("#LstChrtId").val() }),
            success: function(data) {            	
                val = data;
                if (val != "" && val != "You are not authorized to view this page") {

                    if (status == "0") {

                    	strTableHeading = '<thead><tr class="amber lighten-5"><th><%=openRBConstants.getString("S_N") %></th><th><%=openRBConstants.getString("CHART_NAME") %></th><th><%=openRBConstants.getString("GENDR") %></th><th><%=openRBConstants.getString("DATAM") %></th><th><%=openRBConstants.getString("TIMAR")%></th><th><%=openRBConstants.getString("PLAC") %></th><th><%=openRBConstants.getString("CHART_TYPE") %></th>';
                        if (type == 'open') {
                        	
                            strTableHeading = strTableHeading + '<th><%=openRBConstants.getString("OPEN_CHART")%></th></tr></thead><tbody>';
                        }
                        if (type == 'manage') {
                            strTableHeading = strTableHeading + '<th><%=openRBConstants.getString("ACTION")%></th><th>&nbsp;</th><th>&nbsp;</th></tr></thead><tbody>';
                        }
                        $('#ChartData').append(strTableHeading);
                        status = "1";
                    }

					var chartData = eval('(' + val + ')');
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
                        
                        strChartData = strChartData + '<tr><td>' + srno + '</td><td>' + chartData[i].chartName + '</td><td>' + chartData[i].gender + '</td><td>' + chartData[i].Date_of_Birth + '</td><td>' + chartData[i].Time_of_Birth + '</td><td>' + chartData[i].Place_of_Birth + '</td><td>' + chartData[i].pubshared + '</td>';

                        if (type == 'open') {
                        	
                            strChartData = strChartData + '<td><a href="/cloud/ChartServlet?methodName=openChart&fromDhruv=1&referrer='+pageUrl+'&ChartId=' + chartData[i].chartId + '" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td></tr>';
                        }
                        
                        if (type == "manage") {

                            chartIdAndChartName = "'" + chartData[i].chartId + "," + chartData[i].chartName + "'";
                            strChartData = strChartData + '<td><a href="/cloud/ChartServlet?methodName=openChart&fromDhruv=1&referrer='+pageUrl+'&ChartId=' + chartData[i].chartId + '" class="pseudo"><%=openChartConstants.getString("OPENN") %></a></td>';
                            strChartData = strChartData + '<td><a href="editchart.asp?chartid=' + chartData[i].chartId + '" class="pseudo"><%=openRBConstants.getString("EDIT") %></a></td>';
                            strChartData = strChartData + '<td><a href="#" class="pseudo" onClick="deleteChart(' + chartIdAndChartName + ')"><%=openChartConstants.getString("DELETE") %></a></td></tr>';
                          
                        }
                        srno = srno + 1
                        strChartData = strChartData;
                       
                    }
                    ;
                    strChartData = strChartData + '</tbody>';
                    
                    $('#ChartData').append(strChartData);
                    $('.pseudo').css('color', 'red');
                    $('.pseudo').css('text-decoration', 'underline');
                    $("#loadButton").html(defaultBtnText);
                    
                }
                else {
                    //if ($('#LstChrtId').val() == "")
                    //updateTips('<%=openRBConstants.getString("YOU_HAVE_NOT_SAVED_CHART") %>'); 
                    if (val == "You are not authorized to view this page") {
                        validationMsg('<%=openChartConstants.getString("YOU_ARE_NOT_AUTHORIZE")%>');
                    }
                    else {
                        validationMsg('<%=openRBConstants.getString("YOU_HAVE_NOT_SAVED_CHART") %>')
                    }
                    $("#openchart").hide();


                }
            }
        });
    }

    


</script>
<div id="dialog-form-openchart" class="modal model-bar bg-white">

  <div class="model-header amber darken-1">
  <h4 class="white-text padding-all-5">
  <span id="title"></span> 
  <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
  </h4>
 
         </div>
         

  <div class="modal-content clearfix">
  
	<div class="validateTips" id="opchart"></div>
	
	<form name="openchart" id="openchart">
	
	  <div class="header-search-wrapper">
               <i class="material-icons">search</i>               
               <input type="text" id="chartname" name="chartname" onkeypress="call();" class="header-search-input z-depth-2" placeholder="<%=openChartConstants.getString("OPEN_CHART_SEARCH")%>">
            </div>
            

			  <div class="scol-life">
			<input type="hidden" name="uid" id="uid" value="<%=session.getAttribute("User_Id") %>" /> 
			<input type="hidden" name="LstChrtId" id="LstChrtId" />
			<div class="table-panel rt-custom"> 
				<table class="table-set striped bordered responsive-table" id="ChartData">
			
				</table>
				
			<div id="loadButton" class="border-non center mt-2 mb-2"></div>
			</div>
			</div>
		</form>


	
	
	
</div>
 <div class="modal-footer">      
      <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat text-orange">OK</a>
      <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat text-orange">CANCEL</a>
    </div>

</div>





