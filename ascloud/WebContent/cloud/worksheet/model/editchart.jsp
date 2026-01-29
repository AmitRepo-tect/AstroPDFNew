<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
//System.out.println(session.getAttribute("ChartId")+"neha");
Local editLocal = new Local();
int editLanguageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBEditConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle newChartEditConstant = editLocal.loadPropertiesFileNew("newchart-editchart",editLanguageCode);
MyResourceBundle editChartConst = editLocal.loadPropertiesFileNew("editchart",editLanguageCode);
MyResourceBundle editChartMatchMakConst = editLocal.loadPropertiesFileNew("editchart-matchmaking",editLanguageCode);
MyResourceBundle newChartEditMatchMakConst1 = editLocal.loadPropertiesFileNew("newchart-editchart-matchmaking",editLanguageCode);
String tags = "";
String chartId = "";
String chartType = "";
DesktopHoro horoObject	 = new DesktopHoro();
Object reqChartObj = request.getParameter("chartid");
if(reqChartObj != null && !reqChartObj.equals(""))
{
	chartId = reqChartObj.toString();
	UserDAO dao = new UserDAO();
	HashMap<String, Object> hm = dao.getChart(chartId);
	horoObject = (DesktopHoro) hm.get("HoroObject");
	chartType = hm.get("Charting").toString();
}
else
{
	Object chartObj = session.getAttribute("ChartId");
	Object sessionObj = session.getAttribute("HoroscopeObj");
	chartType =  session.getAttribute("chartType").toString();
	if(sessionObj != null)
	{
		
		horoObject = (DesktopHoro) sessionObj;
		if(chartObj != null && !chartObj.equals(""))
		{
			chartId = chartObj.toString();
			
			//tags = gettagvalue(chartId);
	        if(tags.equals("1") || tags.equals("0")) 
	            tags = "";
		}
	}
}
%>

<script type="text/javascript">
    $(document).ready(function () {
        $("#editplace").autocomplete(
		    "/cloud/FindPlaces.jsp",
		    {
		        delay: 10,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 1,
		        cacheLength: 10,
		        onItemSelect: selectItemedit,
		        onFindValue: findValueedit,
		        formatItem: formatItemedit,
		        autoFill: true
		    }
	    );
		});

    function openedit() {
        if (formValidation())
            document['editchart'].submit();
    }

    function findValueedit(li) {
    	//alert(li.extra[0]+","+li.extra[1]+","+li.extra[2]+","+li.extra[3]+","+li.extra[4]+","+li.extra[5]+","+li.extra[6]+","+li.extra[7]+","+li.extra[8]+","+li.extra[9]);
        if (li == null) return alert("No match!");
        $('#editLatDeg').val(li.extra[2]);
        $('#editLatMin').val(li.extra[3]);
        $('#editLatNS').val(li.extra[4]);
        $('#editLongDeg').val(li.extra[5]);
        $('#editLongMin').val(li.extra[6]);
        $('#editLongEW').val(li.extra[7]);
        $('#edittimeZone').val(li.extra[8]);
    }
    function selectItemedit(li) {
        findValueedit(li);
    }

    function formatItemedit(row) {
        return row[0] + " (" + row[1] + " " + row[2] + ")";
    }

  
    </script> 

<script type="text/javascript">
        $(document).ready(function () {
            $('#dialog-form-editchart').dialog({
                autoOpen: false,
                title: '<%=rBEditConstants.getString("EDIT_CHART") %>',
                width: 700,
                height: 450,
                modal: true,
                open: function (event, ui) {
                    $(event.target).parent().css('position', 'fixed');
                    $(event.target).parent().css('top', '120px');
                    $(event.target).parent().css('center');
                    //$(event.target).parent().css('z-index', '1001');
                },
                buttons: {
                    '<%=rBEditConstants.getString("DONE") %>': function () {
                        if (formValidation()) {
                            $("#methodNameId").attr('value', 'editChartDone');
                            $("#editdone").attr('value', 'Done');
                            //document.getElementById("methodName").value = "editChartDone";
                            //alert("11111 : "+document.getElementById("methodName").value);
                            document.forms["editchart"].submit();
                        }
                    },
                    '<%=rBEditConstants.getString("DONE_AND_SAVE_CHART")%>': function () {
                        $("#methodNameId").attr('value', 'editChartDoneAndSave');
                        if (formValidation()) {
                        	//document.getElementById("methodName").value = "editChartDoneAndSave";
                        	//alert("2222");
                            document.forms["editchart"].submit();
                            $("#dialog-form-editchart").dialog('close');
                        }
                    }
                }
            })
        });

        /* function editchartformmain() {
        $('#dialog-form-editchart').dialog('open');
        } */

        function editchartform(myval)
        {
        	//alert(myval)
        	if (myval != "1") {
                sendurl = "chartid=" + myval;
                $.get('/cloud/worksheet/control/editchartdata.jsp', sendurl, function (data) {
                    //alert(data + "data");
                    var UserDetails = eval('(' + data + ')');
                    document.getElementById("chartid").value = myval;//UserDetails.chartid;
                    document.getElementById("editname").value = UserDetails.name;
                    document.getElementById("editsex").value = UserDetails.sex;
                    document.getElementById("editday").value = UserDetails.day;
                    document.getElementById("editmonth").value = UserDetails.month;
                    document.getElementById("edityear").value = UserDetails.year;
                    document.getElementById("edithrs").value = UserDetails.hrs;
                    document.getElementById("editmin").value = UserDetails.min;
                    document.getElementById("editsec").value = UserDetails.sec;
                    document.getElementById("editplace").value = UserDetails.place;
                    document.getElementById("editLongDeg").value = UserDetails.longdeg;
                    document.getElementById("editLongMin").value = UserDetails.longmin;
                    document.getElementById("editLongEW").value = UserDetails.longew;
                    document.getElementById("editLatDeg").value = UserDetails.latdeg;
                    document.getElementById("editLatMin").value = UserDetails.latmin;
                    document.getElementById("edittimeZone").value = UserDetails.timezone;
                    document.getElementById("editLatNS").value = UserDetails.latns;
                    document.getElementById("editkphn").value = UserDetails.kphn;
                    document.getElementById("editayanamsa").value = UserDetails.AyanamsaType;
                    document.getElementById("editdst").value = UserDetails.dst;
                });
            }
            else {
        	document.getElementById("editname").value = '<%=horoObject.getName()%>';
            document.getElementById("editsex").value = '<%=horoObject.getMaleFemale()%>';
            document.getElementById("editday").value = '<%=horoObject.getDayOfBirth()%>';
            document.getElementById("editmonth").value = '<%=horoObject.getMonthOfBirth()%>';
            document.getElementById("edityear").value = '<%=horoObject.getYearOfBirth()%>';
            document.getElementById("edithrs").value = '<%=horoObject.getHourOfBirth()%>';
            document.getElementById("editmin").value = '<%=horoObject.getMinuteOfBirth()%>';
            document.getElementById("editsec").value = '<%=horoObject.getSecondOfBirth()%>';
            document.getElementById("editplace").value = '<%=horoObject.getPlace()%>';
            document.getElementById("editLongDeg").value = '<%=horoObject.getDegreeOfLongitude()%>';
            document.getElementById("editLongMin").value = '<%=horoObject.getMinuteOfLongitude()%>';
            document.getElementById("editLongEW").value = '<%=horoObject.getEastWest()%>';
            document.getElementById("editLatDeg").value = '<%=horoObject.getDegreeOfLattitude()%>';
            document.getElementById("editLatMin").value = '<%=horoObject.getMinuteOfLattitude()%>';
            document.getElementById("edittimeZone").value = '<%=horoObject.getTimeZone()%>';
            document.getElementById("editLatNS").value = '<%=horoObject.getNorthSouth()%>';
            document.getElementById("editkphn").value = '<%=horoObject.getKPHorarySeed()%>';
            document.getElementById("editayanamsa").value = '<%=SharedFunction.getAyan(horoObject)%>';
            document.getElementById("editdst").value = '<%=horoObject.getDST()%>';
            }
	        $('#dialog-form-editchart').dialog('open');
	        $("#dialog-form-openchart").dialog('close');
        }
    
    </script>

<script type="text/javascript">
        function formValidation() {
            nameval = document.getElementById('editname').value;
            if (document.getElementById('editname').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_NAME_FIELD")%>');
                document.getElementById('editname').focus();
                return (false);
            }

            if (nameval.indexOf("'") != -1) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=editChartConst.getString("PLEASE_DO_NOT_ENTER_SIGN_IN_NAME_FIELD")%>');
                document.getElementById('name').focus();
                return (false);
            }

            if (nameval.indexOf("'") != -1 || nameval.indexOf("?") != -1 || nameval.indexOf("&") != -1 || nameval.indexOf("@") != -1) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=newChartEditConstant.getString("PLEASE_DO_NOT_ENTER_SPECIAL_CHARACTERS_SIGN_IN_NAME_FIELD")%>');
                document.getElementById('editname').focus();
                return (false);
            }
            if (nameval.length > 50) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=newChartEditConstant.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTER_IN_NAME_FIELD")%>');
                document.getElementById('editname').focus();
                return (false);
            }
            if (document.getElementById('editday').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=newChartEditConstant.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTER_IN_NAME_FIELD")%>');
                document.getElementById('editday').focus();
                return (false);
            }
            else {
                if (isNaN(document.getElementById('editday').value)) {
                    $('#msgdivedit').css('color', 'Red');
                    updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_DAY_FIELD")%>');
                    document.getElementById('editday').focus();
                    return (false);
                } else {
                    if (!isIntegerNumber(document.getElementById('editday').value) || document.getElementById('editday').value < 1 || document.getElementById('editday').value > 31) {
                        $('#msgdivedit').css('color', 'Red');
                        updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_31")%>');
                        document.getElementById('editday').focus();
                        return (false);
                    }
                }
            }

            if (document.getElementById('editmonth').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MONTH_FIELD")%>');
                document.getElementById('editmonth').focus();
                return (false);
            }
            else {
                if (isNaN(document.getElementById('editmonth').value)) {
                    $('#msgdivedit').css('color', 'Red');
                    updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MONTH_FIELD")%>');
                    document.getElementById('editmonth').focus();
                    return (false);
                }
                else {
                    if (!isIntegerNumber(document.getElementById('editmonth').value) || document.getElementById('editmonth').value < 1 || document.getElementById('editmonth').value > 12) {
                        $('#msgdivedit').css('color', 'Red');
                        updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_MONTH_SHOULD_BE_BETWEEN_1_AND_12")%>');
                        document.getElementById('editmonth').focus();
                        return (false);
                    }
                }
            }

            if (document.getElementById('edityear').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_YEAR_FIELD")%>');
                document.getElementById('edityear').focus();
                return (false);
            }
            else {
                if (isNaN(document.getElementById('edityear').value)) {
                    $('#msgdivedit').css('color', 'Red');
                    updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_YEAR_FIELD")%>');
                    document.getElementById('edityear').focus();
                    return (false);
                }
                else {
                    if (!isIntegerNumber(document.getElementById('edityear').value) || document.getElementById('edityear').value < 1 || document.getElementById('edityear').value > 9999) {
                        $('#msgdivedit').css('color', 'Red');
                        updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_DAY_SHOULD_BE_BETWEEN_1_AND_9999")%>');
                        document.getElementById('edityear').focus();
                        return (false);
                    }
                }
            }

            if (document.getElementById('edithrs').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_HOUR_FIELD")%>');
                document.getElementById('edithrs').focus();
                return (false);
            }
            else {
                if (isNaN(document.getElementById('edithrs').value)) {
                    $('#msgdivedit').css('color', 'Red');
                    updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_HOUR_FIELD")%>');
                    document.getElementById('edithrs').focus();
                    return (false);
                } else {
                    if (!isIntegerNumber(document.getElementById('edithrs').value) || document.getElementById('edithrs').value < 0 || document.getElementById('edithrs').value > 23) {
                        $('#msgdivedit').css('color', 'Red');
                        updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_HOUR_SHOULD_BE_BETWEEN_0_AND_23")%>');
                        document.getElementById('edithrs').focus();
                        return (false);
                    }
                }
            }

            if (document.getElementById('editmin').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_MINUTE_FIELD")%>');
                document.getElementById('editmin').focus();
                return (false);
            }
            else {
                if (isNaN(document.getElementById('editmin').value)) {
                    $('#msgdivedit').css('color', 'Red');
                    updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_MINUTE_FIELD")%>');
                    document.getElementById('editmin').focus();
                    return (false);
                }
                else {
                    if (!isIntegerNumber(document.getElementById('editmin').value) || document.getElementById('editmin').value < 0 || document.getElementById('editmin').value > 59) {
                        $('#msgdivedit').css('color', 'Red');
                        updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
                        document.getElementById('editmin').focus();
                        return (false);
                    }
                }
            }

            if (document.getElementById('editsec').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_A_VALUE_FOR_THE_SECOND_FIELD")%>');
                document.getElementById('editsec').focus();
                return (false);
            }
            else {
                if (isNaN(document.getElementById('editsec').value)) {
                    $('#msgdivedit').css('color', 'Red');
                    updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_ONLY_DIGIT_CHARACTERS_IN_THE_SECOND_FIELD")%>');
                    document.getElementById('editsec').focus();
                    return (false);
                }
                else {
                    if (!isIntegerNumber(document.getElementById('editsec').value) || document.getElementById('editsec').value < 0 || document.getElementById('editsec').value > 59) {
                        $('#msgdivedit').css('color', 'Red');
                        updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_SECOND_SHOULD_BE_BETWEEN_0_AND_59")%>');
                        document.getElementById('editsec').focus();
                        return (false);
                    }
                }
            }

            if (document.getElementById('editplace').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_PLACE")%>');
                document.getElementById('editplace').focus();
                return (false);
            }

            if (document.getElementById('editplace').value.length < 3) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("ENTER_AT_LEAST_THREE_FIRST_CHARACTERS_OF_CITY_NAME")%>');
                document.getElementById('editplace').focus();
                return (false);
            }
            if (document.getElementById('editplace').value.indexOf("'") != -1 || document.getElementById('editplace').value.indexOf("?") != -1 || document.getElementById('editplace').value.indexOf("&") != -1) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=newChartEditConstant.getString("PLEASE_DO_NOT_ENTER_SPECIAL_CHARACTERS_SIGN_IN_PLACE_FIELD")%>');
                document.getElementById('editplace').focus();
                return (false);
            }

            if (document.getElementById('editplace').value.length > 50) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_DO_NOT_ENTER_MORE_THAN_50_CHARACTERS_IN_PLACE_FIELD")%>');
                document.getElementById('editplace').focus();
                return (false);
            }
            if (document.getElementById('editLongDeg').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_LONGITUDE_DEGREE_VALUE")%>');
                document.getElementById('editLongDeg').focus();
                return (false);
            }

            if ((!isIntegerNumber(document.getElementById('editLongDeg').value) || document.getElementById('editLongDeg').value < 0 || document.getElementById('editLongDeg').value >= 180)) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_LONGITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_179")%>');
                document.getElementById('editLongDeg').focus();
                return (false);
            }

            if (document.getElementById('editLongMin').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_LONGITUDE_MINUTE_VALUE")%>');
                document.getElementById('editLongMin').focus();
                return (false);
            }


            if ((!isIntegerNumber(document.getElementById('editLongMin').value) || document.getElementById('editLongMin').value < 0 || document.getElementById('editLongMin').value >= 60)) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_LONGITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
                document.getElementById('LongMin').focus();
                return (false);
            }

            if (document.getElementById('editLatDeg').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_LATITUDE_DEGREE_VALUE")%>');
                document.getElementById('editLatDeg').focus();
                return (false);
            }

            if ((!isIntegerNumber(document.getElementById('editLatDeg').value) || document.getElementById('editLatDeg').value < 0 || document.getElementById('editLatDeg').value >= 90)) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_LATITUDE_DEGREE_SHOULD_BE_BETWEEN_0_AND_89")%>');
                document.getElementById('editLatDeg').focus();
                return (false);
            }
            if (document.getElementById('editLatMin').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_LATITUDE_MINUTE_VALUE")%>');
                document.getElementById('editLatMin').focus();
                return (false);
            }

            if ((!isIntegerNumber(document.getElementById('editLatMin').value) || document.getElementById('editLatMin').value < 0 || document.getElementById('editLatMin').value >= 60)) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_LATITUDE_MINUTE_SHOULD_BE_BETWEEN_0_AND_59")%>');
                document.getElementById('editLatMin').focus();
                return (false);
            }

            if (document.getElementById('edittimeZone').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("PLEASE_ENTER_TIME_ZONE")%>');
                document.getElementById('edittimeZone').focus();
                return (false);
            }

            if (!isRealNumber(document.getElementById('edittimeZone').value) || document.getElementById('edittimeZone').value < -12.0 || document.getElementById('edittimeZone').value > 16.0) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=rBEditConstants.getString("THE_VALUE_FOR_TIME_ZONE_SHOULD_BE_BETWEEN_12_00_AND_13_00")%>');
                document.getElementById('edittimeZone').focus();
                return (false);
            }
            if (document.getElementById('editkphn').value == "") {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=newChartEditConstant.getString("PLEASE_ENTER_A_VALUE_FOR_THE_KP_HORARY_FIELD")%>');
                document.getElementById('editkphn').focus();
                return (false);
            }

            if ((!isIntegerNumber(document.getElementById('editkphn').value) || document.getElementById('editkphn').value < 0 || document.getElementById('editkphn').value > 249)) {
                $('#msgdivedit').css('color', 'Red');
                updateMsgedit('<%=newChartEditConstant.getString("THE_VALUE_FOR_KP_HORARY_SHOULD_BE_BETWEEN_0_AND_249")%>');
                document.getElementById('editkphn').focus();
                return (false);
            }
            return (true);
        }

        /* function isRealNumber(NumberToTest) {
        var IsFound = /^(\+|-)?[0-9][0-9]*(\.[0-9]*)?$/.test(NumberToTest);
        return (IsFound);
        } */

        function updateMsgedit(t) {
            $('#msgdivedit').addClass('ui-state-highlight')
            $('#msgdivedit').html(t);
            setTimeout(function () {
                $('#msgdivedit').removeClass('ui-state-highlight', 1500);
            }, 500);
        }
    </script>
 
<div class="ui-form-container" style="display:none;" id="dialog-form-editchart">
 <div class="form-controls">  
    <form id="three" name="editchart" onsubmit="return formValidation();" action="/cloud/editchart-session.asp" method="post" >

    <div id="msgdivedit" style="height:20px; width:85%; margin-bottom:10px; padding-left:5px; margin-left:6px;">
     </div>
        <input type="hidden" name="chartid" id="chartid" value="<%=chartId.trim() %>" />
        
        <label><%=rBEditConstants.getString("NAM") %></label>   
       <input type="text" placeholder="Name" name="name" id="editname" value="<%=horoObject.getName()%>" maxlength="100" tabindex="1"/>

       <label><%=rBEditConstants.getString("GENDR")%> </label>
        <select size="1" name="sex" id="editsex" tabindex="2" class="Lbox">
            <option <%if(horoObject.getMaleFemale().equals("male")) { %> selected <% } %> value="male"><%=rBEditConstants.getString("MALE")%></option>
            <option <%if(horoObject.getMaleFemale().equals("female")) { %> selected <% } %> value="female"><%=rBEditConstants.getString("FEMALE")%></option>
        </select>
        
        <label><%=rBEditConstants.getString("DATAM")%><font color="red"> (DD/MM/YYYY)</font></label>
        <input type="text"  name="day" id="editday" value='<%=horoObject.getDayOfBirth()%>' size="2" maxlength="2" tabindex="3" style="width:99px" autocomplete="off"  />
        <input type="text" name="month" id="editmonth" value='<%=horoObject.getMonthOfBirth()%>' size="2" maxlength="2" tabindex="4" style="width:99px" autocomplete="off"  />
        <input type="text"  placeholder="Year" name="year" id="edityear" title="Year"style="width:99px" tabindex='5' maxlength="4" value='<%=horoObject.getYearOfBirth()%>' />

        <label><%=rBEditConstants.getString("TIMAR")%> <font color="red">(<%=newChartEditMatchMakConst1.getString("T_24_HOUR_FORMAT") %>)</font></label>
        <input type="text" name="hrs" id="edithrs" value="<%=horoObject.getHourOfBirth()%>" size="2" maxlength="2" tabindex="6" style="width:99px"/>
        <input type="text" name="min" id="editmin" value="<%=horoObject.getMinuteOfBirth()%>" size="2" maxlength="2" tabindex="7" style="width:99px" />
        <input type="text" name="sec" size="2" maxlength="2" value="<%=horoObject.getSecondOfBirth()%>" id="editsec" tabindex="8" style="width:99px" />
        
       <label><%=rBEditConstants.getString("PLAC")%> <font color="red">(<%=newChartEditMatchMakConst1.getString("MIN_3_CHAR") %>)</font></label>
       <input type="text" id="editplace" name="place" maxlength="50" value="<%=horoObject.getPlace() %>"  tabindex="9"  />
     
       
       <label><%=rBEditConstants.getString("LONGITUDE")%></label>
        <input type="text" name="longdeg" id="editLongDeg" style="width:99px;" size="3" maxlength="3" value='<%=horoObject.getDegreeOfLongitude()%>' autocomplete="off" tabindex="10" />
        <input type="text" name="longmin" id="editLongMin" style="width:99px;" size="2" maxlength="2" value='<%=horoObject.getMinuteOfLongitude()%>' autocomplete="off" tabindex="11" />
        <select size="1" name="longew"  id="editLongEW" tabindex="12" class="Sbox">
            <option value="E" <%if(Util.safestr(request.getParameter("longew")).toLowerCase().equals("e")) { %> selected <% } %>>E</option>
            <option value="W" <%if(Util.safestr(request.getParameter("longew")).toLowerCase().equals("w")) {  %> selected <% } %>>W</option>
        </select>

    
        <label><%=rBEditConstants.getString("LATITUDE")%></label>
        <input type="text" name="latdeg" id="editLatDeg" size="3" style="width:99px;" maxlength="3" value='<%=horoObject.getDegreeOfLattitude()%>' tabindex="13" />        
        <input type="text" name="latmin" id="editLatMin" size="2" style="width:99px;" maxlength="2" value='<%=horoObject.getMinuteOfLattitude()%>' tabindex="14" />        
        <select size="1" name="latns" id="editLatNS" tabindex="15" class="Sbox">                                                                                                                             
            <option value="N" <% if(Util.safestr(request.getParameter("latns")).toLowerCase().equals("n")) { %> selected <% } %>>N</option>                                                                                                                                                                                                                                                                                         
            <option value="S" <% if(Util.safestr(request.getParameter("latns")).toLowerCase().equals("s")) { %> selected <% } %>>S</option>
        </select>
      
       <label><%=rBEditConstants.getString("TIME_ZONE") %></label>
        <input type="text" name="timezone" id="edittimeZone" value='<%=horoObject.getTimeZone()%>' tabindex="16" maxlength="6"/>
        <input type="hidden" name="tags" value="<%=tags %>" />

        <div class="clearfix"></div>
           <div class="adv-cntrol">
              <a id="aTagedit" href="javascript:toggleAndChangeTextedit();">[&#43;]<%=editChartMatchMakConst.getString("ADV_SETTINGS_HEAD") %></a>
          </div>

     <div class="clearfix"></div>
<%
String dst = horoObject.getDST();
int ayanamsaType = Integer.parseInt(SharedFunction.getAyan(horoObject));//horoObject.getAyanamsaType();
%>
     <div id="divToToggleedit" style="display: none;"> 
       <label><%=editChartMatchMakConst.getString("DST_CORRECTION") %></label>
        <select size="1" name="dst" id="editdst" tabindex="17" class="Lbox">
            <option value="0" <%if(dst.equals("0")) {%>selected<%}%>>0</option>
            <option value="1" <%if(dst.equals("1")) {%>selected<%}%>>1</option>
            <option value="2" <%if(dst.equals("2")) {%>selected<%}%>>2</option>
        </select>
      
      <label><%=rBEditConstants.getString("AYANAMSA") %></label>
           <select size="1" name="ayanamsa" id="editayanamsa" tabindex="18" class="Lbox">
                <option value="1" <%if( ayanamsaType == 1) {%>selected<%}%>><%=rBEditConstants.getString("K_P_NEW") %></option>
                <option value="2" <%if( ayanamsaType == 2) {%>selected<%}%>><%=rBEditConstants.getString("K_P_OLD") %></option>
                <option value="0" <%if( ayanamsaType == 0) {%>selected<%}%>><%=newChartEditMatchMakConst1.getString("N_C_LAHIRI") %></option>
                <option value="3" <%if( ayanamsaType == 3) {%>selected<%}%>><%=newChartEditMatchMakConst1.getString("B_V_RAMAN") %></option>
                <option value="4" <%if( ayanamsaType == 4) {%>selected<%}%>><%=rBEditConstants.getString("K_P_KHULLAR") %></option>
                <option value="5" <%if( ayanamsaType == 5) {%>selected<%}%>><%=rBEditConstants.getString("SAYAN") %></option>
            </select>
          
          <label><%=rBEditConstants.getString("CHART_TYPE") %></label>
          
            <select size="1" name="charting" id="editcharting" tabindex="19" class="Lbox">
                <option value="0" <%if( chartType.equals("0")) {%>selected<%}%>><%=rBEditConstants.getString("NORTH_INDIAN") %></option>
                <option value="1" <%if( chartType.equals("1")) {%>selected<%}%>><%=rBEditConstants.getString("SOUTH_INDIAN") %></option>
            </select>
         
          <label><%=rBEditConstants.getString("KP_HORARY_NUMBER") %> <font color="red">(1-249)</font></label>
          
            <input type="text" name="kphn" size="3" id="editkphn" value="<%=horoObject.getKPHorarySeed() %>" tabindex="20" maxlength="3"/>
        
        
<input type="hidden" name="methodName" id="methodNameId"/>
       <input type="hidden" name="done" id="editdone"/>
       <input type="hidden" name="editsaveanddone"  id="editsaveandone"/>
       <input type="hidden" name="referrer"  value="/cloud/worksheet/"/>
       
</div>
<div style="border:#fff 0px solid; width:420px; padding-bottom:20px;">
          <!--<button type="submit" name="methodName" value="editDone" class="mybutton" ><%=rBEditConstants.getString("KUNDLI_DONE") %></button>
            <input type="submit" name="editsaveanddone" value="<%=rBEditConstants.getString("DONE_AND_SAVE") %>" class="mybutton" /> -->
        </div>
 </form>
 </div>

 <script type="text/javascript">
     function toggleAndChangeTextedit() {
         $('#divToToggleedit').toggle();
         if ($('#divToToggleedit').css('display') == 'none') {
             $('#aTagedit').html('[&#43]  <%=editChartMatchMakConst.getString("ADV_SETTINGS_HEAD") %>');
         }
         else {
             $('#aTagedit').html('[&#8722] <%=editChartMatchMakConst.getString("ADV_SETTINGS_HEAD") %>');
         }
     }
 </script>
 
