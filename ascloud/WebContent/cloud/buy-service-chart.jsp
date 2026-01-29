<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>

<input type="hidden" id="count" value=0 />

<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
Object obj = session.getAttribute("constants");
MyProperties rBConstants = null;

MyResourceBundle openChartConstants = local.loadPropertiesFileNew("openchart",languageCode);

if(obj != null)
{
	rBConstants = (MyProperties) obj;
}
else
{
	rBConstants = new MyProperties(local.loadPropertiesFile("constants", languageCode));
	session.setAttribute("constants", rBConstants);
}
MyResourceBundle servChartConstants = local.loadPropertiesFileNew("buy-service-chart",languageCode);
%>
<style type="text/css">
.ui-dialog-titlebar-close {
	display: none;
}
</style>

<%
	DesktopHoro fileHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
%>

<script type="text/javascript">

	function openChart1(serviceName)
	{
		var userID = '<%=session.getAttribute("User_Id") %>';
		$("#getTitle").append(serviceName);
		
		if($("#uid1").val() != null && $("#uid1").val() != "" && $("#uid1").val() != "null")
		{
			$("#dialog-form-openchart1").modal('open');
		    
		    if (userID == null || userID == "")
		    {
		        v = 'service-order.jsp';
		
		        //window.location.href = 'login.jsp?refferurl=' + v;
		        window.location.href = 'login.asp?refferurl=' + v;
		    }
		    else {
		        loaddata1();          
		        $("#dialog-form-openchart1").modal('open');
		    }
		}
		else
		{
			selectChart('', '<%=fileHoro.getName()%>', '<%=fileHoro.getMaleFemale()%>', '<%=fileHoro.getDayOfBirth()%>', '<%=fileHoro.getMonthOfBirth()%>', '<%=fileHoro.getYearOfBirth()%>', '<%=fileHoro.getHourOfBirth()%>', '<%=fileHoro.getMinuteOfBirth()%>', '<%=fileHoro.getPlace().trim()%>', '', '', '', '', '', '');
		}
	}
    
    //function loaddata1() {
    function loaddata1(chart_id) {
    	
    	var chart_id1 = null;
    	
    	if (chart_id !== undefined && chart_id !== null)
    	{
    		chart_id1 = chart_id;
    	}
    	
        var value = (function() {
            var val = null;

            $.ajax(
            {
                'async': false,
                'global': false,
                'url': 'ajax-buy-service-openchart.jsp',
                'data': ({userid: $("#uid1").val(), chartid: chart_id1}),
                'success': function(data) {
                    val = data;
                }
            });
 
            if (val != "") {
            	//alert(val);

            	if(val.length == 11)
           		{
            		$('#btnMoreChart').hide();
            		$('#rowMoreChartButton').hide();
           		}
            	
            	var ChartData1 = eval('(' + val + ')');

            	var day, month, year, hour, min;
                var aryDOB, aryTOB;

                //$('#ChartData1').empty();
                
                if (chart_id !== undefined && chart_id !== null)
            	{
            		chart_id1 = chart_id;
            	}
            	else
            	{
            		strTableHeading1 = '<thead><tr class="amber lighten-5"><th><%=rBConstants.getString("S_N") %></th><th><%=rBConstants.getString("CHART_NAME") %></th><th><%=rBConstants.getString("GENDR") %></th><th><%=rBConstants.getString("DATAM") %></th><th><%=rBConstants.getString("TIMAR") %></th><th><%=rBConstants.getString("PLAC") %></th><th><%=rBConstants.getString("CHART_TYPE") %></th>';
                    strTableHeading1 = strTableHeading1 + '<th><%=rBConstants.getString("ORDER_NOW") %></th></tr></thead><tbody>';
                    $('#ChartData1').append(strTableHeading1);
            	}

                var privateChart = '<%=rBConstants.getString("PRIVATE_CHART")%>';
                var sharedChart = '<%=rBConstants.getString("SHARED_CHART")%>';
				var chartType = sharedChart;

                for (var i = 0; i < ChartData1.length; i++) {
                	var sn = parseInt(document.getElementById("count").value);
					
					sn = sn + 1;
					
                    aryDOB = ChartData1[i].Date_of_Birth.split("-");
                    aryTOB = ChartData1[i].Time_of_Birth.split(":");

                    if(ChartData1[i].pubshared == 'Private_CHART')
                    	chartType = privateChart;
                    else
                    	chartType = sharedChart;
                    day = aryDOB[0];
                    month = aryDOB[1];
                    year = aryDOB[2];

                    hour = aryTOB[0];
                    min = aryTOB[1];

                    //strChartData1 = '<tr><td>' + (i + 1) + '</td><td>' + ChartData1[i].chartName + '</td><td>' + ChartData1[i].gender + '</td><td>' + ChartData1[i].Date_of_Birth + '</td><td>' + ChartData1[i].Time_of_Birth + '</td><td>' + ChartData1[i].Place_of_Birth + '</td><td>' + chartType + '</td>';
                    strChartData1 = '<tr><td>' + sn + '</td><td>' + ChartData1[i].chartName + '</td><td>' + ChartData1[i].gender + '</td><td>' + ChartData1[i].Date_of_Birth + '</td><td>' + ChartData1[i].Time_of_Birth + '</td><td>' + ChartData1[i].Place_of_Birth + '</td><td>' + chartType + '</td>';

                    strChartData1 = strChartData1 + "<td><a href=\"#jumpHere\" onclick=\"selectChart('" + ChartData1[i].chartId + "', '" + ChartData1[i].chartName + "', '" + ChartData1[i].gender + "', '" + day + "', '" + month + "', '" + year + "', '" + hour + "', '" + min + "', '" + ChartData1[i].Place_of_Birth + "', '" + ChartData1[i].phone1 + "', '" + ChartData1[i].phone2 + "', '" + ChartData1[i].mobile + "', '" + ChartData1[i].state + "', '" + ChartData1[i].country + "', '" + ChartData1[i].email + "');\" class=\"red-text\">" + '<%=rBConstants.getString("ORDER_NOW") %>' + "</td></tr>";

                    $('#ChartData1').append(strChartData1);                    
                   
                    var new_chart_id = ChartData1[i].chartId;
                    
                    document.getElementById("count").value = sn;
                }

                if (parseInt(sn) < 20)
                {
                	var elem = document.getElementById("btnMoreChart");
                    elem.parentNode.removeChild(elem);
                }
                
                if (chart_id !== undefined && chart_id !== null)
            	{
                	var elem = document.getElementById("btnMoreChart");
                    elem.parentNode.removeChild(elem);
                    
                    var elem1 = document.getElementById("rowMoreChartButton");
                    elem1.parentNode.removeChild(elem1);
            	}

                $('#ChartData1').append('<tr id="rowMoreChartButton"><td colspan="8" style="background-color: white;"><button id="btnMoreChart" type="button" onclick="loaddata1(' + new_chart_id + ')" class="waves-effect waves-light btn amber darken-4 box-shadow" style="margin-left:auto;margin-right:auto;display:block;margin-bottom:0%;"><%=openChartConstants.getString("MORE_CHART")%></button></td></tr>');

               	strChartData1CloseTbody = '</tbody>';
                $('#ChartData1').append(strChartData1CloseTbody);
            }
            else {
                $('#ChartData1').empty();
                $('#btnMoreChart').hide();
                $('#rowMoreChartButton').hide();
                validationMsg('<%=rBConstants.getString("YOU_HAVE_NOT_SAVED_CHART") %>')
            }
        })();
    }

    $(document).ready(function() {
        //$("#dialog").modal("destroy");
        
       <%--  // Start of open chart dialog
        $("#dialog-form-openchart1").dialog(
            {
                autoOpen: false,
                height: 410,
                width: 720,
                modal: true,
                open: function(event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '100px');
                    $(event.target).parent().css('center');
                },
                buttons:
                {
                    '<%=rBConstants.getString("CANCEL") %>': function() {
                    window.location.href = 'services.asp'
                    }
                },
                close: function()
                {
                }
            });
        // End of open chart dialog --%>
    });

    function selectChart(chartId, chartName, gender, day, month, year, hour, min, Place_of_Birth, phone1, phone2, mobile, state, country, email)
    {
    	document.getElementById("txtRegName").value = chartName;
        document.getElementById("PerInfo_name").value = chartName;
        document.getElementById("ddlDay").value = day;
        document.getElementById("ddlMonth").value = month;
        document.getElementById("ddlYear").value = year;
        document.getElementById("ddlHour").value = hour;
        document.getElementById("ddlMinute").value = min;
        document.getElementById("txtPlace").value = Place_of_Birth;

        document.getElementById("txtEmail").value = email;
        document.getElementById("txtEmail").innerHTML = email;
        document.getElementById("txtEmailConf").value = email;

        //if (gender = 'पुरुष')
       	if (gender == 'पुरुष' || gender == 'male' || gender == 'Male')
        {
            document.getElementById("PerInfo_gender").value = 'male';
        }
        //else if (gender = 'स्त्री')
       	else if (gender == 'स्त्री' || gender == 'female' || gender == 'Female')
        {
            document.getElementById("PerInfo_gender").value = 'female';
        }

        if (mobile != "") {
            document.getElementById("PerInfo_Phone").value = mobile
        }
        else if (phone1 != "") {
        document.getElementById("PerInfo_Phone").value = phone1;
        }
        else if (phone2 != "") {
        document.getElementById("PerInfo_Phone").value = phone2;
        }

        document.getElementById('spanChartName').innerHTML = chartName;

        $("#dialog-form-openchart1").modal('close');
       
         Materialize.updateTextFields();
        
    }
</script>

<div id="dialog-form-openchart1" title="" class="modal model-bar bg-white">

  <div class="model-header amber darken-1">
  <h4 class="white-text padding-all-5">
  <span id="getTitle"></span> 
  <a href="services.asp" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
  </h4>
 </div>

  <div class="modal-content">
	
		<form name="openChart1" id="openChart1">
			<input type="hidden" name="uid1" id="uid1" value="<%=session.getAttribute("User_Id") %>" />
			<table>
				<tr>
					<td><%=servChartConstants.getString("SELECT_CHART") %></td>
				</tr>
			
			</table>
			<div class="table-panel rt-custom"> 
			<table id="ChartData1" class="striped bordered ui-table responsive-table"></table>
			</div>
		</form>

	</div>
	
	<div class="modal-footer">
      <a href="services.asp" class="modal-action modal-close waves-effect waves-red btn-flat text-orange">CANCEL</a>      
    </div>
</div>

<%!
   public String GetStringValue(String servicevalue, Local local, MyResourceBundle servChartConstants)  
   {
       String[] servicearr =  {servicevalue};
       String actualval = local.getDesiredString(servChartConstants.getString("CHART_LISTT"),servicearr);
       return actualval;
   }
%>