var flag,latNS;
flag = false;
$(function() { $("label").inFieldLabels(); });
function showAdvanced() {
    $('div#advancedDiv').toggle('slow');
}

$(document).ready(function() {

    $("div#advancedDiv").hide();
    $('#Year').blur(function() {
        yearval = $('#Year').val();
        monthval = $('#Month').val();
        dayval = $('#Day').val();
        placeval = $('#place').val();
        timezoneid = $('#timezoneid').val();
        timeZone = $('#timeZone').val();
        latNS = $('#LatNS').val();
        var today = new Date();
        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
            if (timezoneid == "Asia/Kolkata" && isWarTimeCorrectionInIndia()) {
                $('#dstval').html('Day light saving time');
                if (!flag) {
                    $('#timeZone').val(parseFloat(timeZone) + 1);
                    flag = true;
                }
            }
            else {
                if (today.isDst()) {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
                else {

                    $('#dstval').html('Standard time');
                    if (flag) {
                        flag = false;
                        $('#timeZone').val(parseFloat(timeZone) - 1);

                    }
                }
            }
        } 
        else {
            $('#dstval').html('');
        }

    });
    $('#Month').blur(function() {
        yearval = $('#Year').val();
        monthval = $('#Month').val();
        dayval = $('#Day').val();
        placeval = $('#place').val();
        timezoneid = $('#timezoneid').val();
        timeZone = $('#timeZone').val();
        latNS = $('#LatNS').val();
        var today = new Date();
        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
            if (timezoneid == "Asia/Kolkata" && yearval >= 1942 && yearval <= 1945) {
                if ((yearval == 1942 && monthval < 9) || (yearval == 1945 && monthval >= 10)) {

                    if (yearval == 1945 && monthval == 10 && dayval <= 15) {
                        $('#dstval').html('Day light saving time');
                        if (!flag) {
                            $('#timeZone').val(parseFloat(timeZone) + 1);
                            flag = true;
                        }
                    }
                    else {

                        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
                            if (today.isDst()) {
                                $('#dstval').html('Day light saving time');
                                if (!flag) {
                                    $('#timeZone').val(parseFloat(timeZone) + 1);
                                    flag = true;
                                }
                            }
                            else {

                                $('#dstval').html('Standard time');
                                if (flag) {
                                    flag = false;
                                    $('#timeZone').val(parseFloat(timeZone) - 1);

                                }
                            }
                        }
                        else {
                            $('#dstval').html('');
                        }
                    }

                }
                else {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
            }
            else {
                if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
                    if (today.isDst()) {
                        $('#dstval').html('Day light saving time');
                        if (!flag) {
                            $('#timeZone').val(parseFloat(timeZone) + 1);
                            flag = true;
                        }
                    }
                    else {

                        $('#dstval').html('Standard time');
                        if (flag) {
                            flag = false;
                            $('#timeZone').val(parseFloat(timeZone) - 1);

                        }
                    }
                }
                else {
                    $('#dstval').html('');
                }
            }
        }
    });
    $('#Day').blur(function() {
        yearval = $('#Year').val();
        monthval = $('#Month').val();
        dayval = $('#Day').val();
        placeval = $('#place').val();
        timezoneid = $('#timezoneid').val();
        timeZone = $('#timeZone').val();
        latNS = $('#LatNS').val();
        var today = new Date();
        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
            if (timezoneid == "Asia/Kolkata" && yearval >= 1942 && yearval <= 1945) {
                if ((yearval == 1942 && monthval < 9) || (yearval == 1945 && monthval >= 10)) {

                    if (yearval == 1945 && monthval == 10 && dayval <= 15) {
                        $('#dstval').html('Day light saving time');
                        if (!flag) {
                            $('#timeZone').val(parseFloat(timeZone) + 1);
                            flag = true;
                        }
                    }
                    else {

                        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
                            if (today.isDst()) {
                                $('#dstval').html('Day light saving time');
                                if (!flag) {
                                    $('#timeZone').val(parseFloat(timeZone) + 1);
                                    flag = true;
                                }
                            }
                            else {

                                $('#dstval').html('Standard time');
                                if (flag) {
                                    flag = false;
                                    $('#timeZone').val(parseFloat(timeZone) - 1);

                                }
                            }
                        }
                        else {
                            $('#dstval').html('');
                        }
                    }

                }
                else {
                    $('#dstval').html('Day light saving time');
                    if (!flag) {
                        $('#timeZone').val(parseFloat(timeZone) + 1);
                        flag = true;
                    }
                }
            }
            else {
                if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
                    if (today.isDst()) {
                        $('#dstval').html('Day light saving time');
                        if (!flag) {
                            $('#timeZone').val(parseFloat(timeZone) + 1);
                            flag = true;
                        }
                    }
                    else {

                        $('#dstval').html('Standard time');
                        if (flag) {
                            flag = false;
                            $('#timeZone').val(parseFloat(timeZone) - 1);

                        }
                    }
                }
                else {
                    $('#dstval').html('');
                }
            }
        }
    });

    $("#place").autocomplete(
		    "FindPlaces.asp",
		    {
		        delay: 10,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 1,
		        cacheLength: 10,
		        onItemSelect: selectItem,
		        onFindValue: findValue,
		        formatItem: formatItem,
		        autoFill: true
		    }
	    );

});

$(function() {
    $("form div :input").tooltip({
        position: "left top",
        offset: [-10, -30],
        effect: "fade"
    });
});

function findValue(li) {
    if (li == null) return alert("No match!");
   
    $('#LatDeg').val(li.extra[2]);
    $('#LatMin').val(li.extra[3]);
    $('#LatNS').val(li.extra[4]);
    $('#LongDeg').val(li.extra[5]);
    $('#LongMin').val(li.extra[6]);
    $('#LongEW').val(li.extra[7]);
    $('#timeZone').val(li.extra[8]);
    $('#timezoneid').val(li.extra[9]);    
}

function selectItem(li) {
    flag = false;
    findValue(li);

    yearval = $('#Year').val();
    monthval = $('#Month').val();
    dayval = $('#Day').val();
    placeval = $('#place').val();
    timezoneid = $('#timezoneid').val();
    timeZone = $('#timeZone').val();
    latNS = $('#LatNS').val();
    var today = new Date();
    if (timezoneid == "Asia/Kolkata") {
        if ((yearval == 1942 && monthval < 9) || (yearval == 1945 && monthval >= 10)) {

            if (yearval == 1945 && monthval == 10 && dayval <= 15) {
                $('#dstval').html('Day light saving time');
                if (!flag) {
                    $('#timeZone').val(parseFloat(timeZone) + 1);
                    flag = true;
                }
            }
            else {

                if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
                    if (today.isDst()) {
                        $('#dstval').html('Day light saving time');
                        if (!flag) {
                            $('#timeZone').val(parseFloat(timeZone) + 1);
                            flag = true;
                        }
                    }
                    else {

                        $('#dstval').html('Standard time');
                        if (flag) {
                            flag = false;
                            $('#timeZone').val(parseFloat(timeZone) - 1);

                        }
                    }
                }
                else {
                    $('#dstval').html('');
                }
            }

        }
        else {
            $('#dstval').html('Day light saving time');
            if (!flag) {
                $('#timeZone').val(parseFloat(timeZone) + 1);
                flag = true;
            }
        }
    }
    else {
        if ((yearval != "") && (monthval != "") && (dayval != "") && (placeval != "")) {
            if (today.isDst()) {
                $('#dstval').html('Day light saving time');
                if (!flag) {
                    $('#timeZone').val(parseFloat(timeZone) + 1);
                    flag = true;
                }
            }
            else {

                $('#dstval').html('Standard time');
                if (flag) {
                    flag = false;
                    $('#timeZone').val(parseFloat(timeZone) - 1);

                }
            }
        }
        else {
            $('#dstval').html('');
        }
    }
}

function formatItem(row) {
    return row[0] + ", " + row[1] + " (" + row[2] + ")";
}

function lookupAjax() {
    var oSuggest = $("#place")[0].autocompleter;
    oSuggest.findValue();
    return false;
}

Date.prototype.isDst = function() {

    timezoneJS.timezone.zoneFileBasePath = '/js/tz';
    timezoneJS.timezone.init();
    if ((yearval != "") && (monthval != "") && (dayval != "")) {
        birthdatval = yearval + "/" + monthval + "/" + dayval;
        birthdatval = birthdatval.toString();
        //alert(latNS);
        if (latNS == "N" || latNS == "n") {
            decidedstval = yearval + "/1/1";
        }
        else {
            decidedstval = yearval + "/6/1"
        }

        var birthdate = new timezoneJS.Date(birthdatval, timezoneid);
        var decidedate = new timezoneJS.Date(decidedstval, timezoneid);
        //alert(decidedate.getTimezoneOffset() + "jan offset");
        //alert(birthdate.getTimezoneOffset() + "birth offset");

        if (decidedate.getTimezoneOffset() > birthdate.getTimezoneOffset()) {
            return true;
        }
        else {
            return false;
        }


    }
}

function isWarTimeCorrectionInIndia(dayval, monthval, yearval) {

    if (yearval >= 1942 && yearval <= 1945) {
        if ((yearval == 1942 && monthval < 9) || (yearval == 1945 && monthval >= 10)) {

            if (yearval == 1945 && monthval == 10 && dayval <= 15) {
                return true;
            }
            else {
                return false;
            }
        }
        else {
            return true;
        }
    }
    else {
        return false;
    }
}


function formValidation() {
    
    if (document.getElementById('Name').value == "") {
        alert('Please enter name');
        document.getElementById('Name').focus();
        return (false);
    }
    if (document.getElementById('sex').value == "Gender") {
        alert('Please select the gender');
        document.getElementById('sex').focus();
        return (false);
    }

    if (document.getElementById('Day').value == "") {
        alert('Please enter a value for the day field.');
        document.getElementById('Day').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('Day').value)) {
            alert('Please enter only digit characters in the day field.');
            document.getElementById('Day').focus();
            return (false);
        } else {
            if (document.getElementById('Day').value < 1 || document.getElementById('Day').value > 31) {
                alert('The value for day should be between 1 and 31.');
                document.getElementById('Day').focus();
                return (false);
            }
        }
    }

    if (document.getElementById('Month').value == "") {
        alert('Please enter a value for the month field.');
        document.getElementById('Month').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('Month').value)) {
            alert('Please enter only digit characters in the month field');
            document.getElementById('Month').focus();
            return (false);
        }
        else {
            if (document.getElementById('Month').value < 1 || document.getElementById('Month').value > 12) {
                alert('The value for month should be between 1 and 12.');
                document.getElementById('Month').focus();
                return (false);
            }
        }
    }

    if (document.getElementById('Year').value == "") {
        alert('Please enter a value for the year field.');
        document.getElementById('Year').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('Year').value)) {
            alert('Please enter only digit characters in the year field.');
            document.getElementById('Year').focus();
            return (false);
        }
        else {
            if (document.getElementById('Year').value < 1 || document.getElementById('Year').value > 9999) {
                alert('The value for day should be between 1 and 9999');
                document.getElementById('Year').focus();
                return (false);
            }
        }
    }
    
    if (document.getElementById('Hrs').value == "") {
        alert('Please enter a value for the hour field');
        document.getElementById('Hrs').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('Hrs').value)) {
            alert('Please enter only digit characters in the hour field');
            document.getElementById('Hrs').focus();
            return (false);
        } else {
        if (document.getElementById('Hrs').value < 0 || document.getElementById('Hrs').value > 23) {
                alert('The value for hour should be between 0 and 23.');
                document.getElementById('Hrs').focus();
                return (false);
            }
        }
    }

    if (document.getElementById('Min').value == "") {
        alert('Please enter a value for the minute field.');
        document.getElementById('Min').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('Min').value)) {
            alert('Please enter only digit characters in the minute field.');
            document.getElementById('Min').focus();
            return (false);
        }
        else {
            if (document.getElementById('Min').value < 0 || document.getElementById('Min').value > 59) {
                alert('The value for minute should be between 0 and 59.');
                document.getElementById('Min').focus();
                return (false);
            }
        }
    }
    if (document.getElementById('Sec').value == "") {
        alert('Please enter a value for the second field.');
        document.getElementById('Sec').focus();
        return (false);
    }
    else {
        if (isNaN(document.getElementById('Sec').value)) {
            alert('please enter only digit characters in the second field.');
            document.getElementById('Sec').focus();
            return (false);
        }
        else {
            if (document.getElementById('Sec').value < 0 || document.getElementById('Sec').value > 59) {
                alert('The value for second should be between 0 and 59.');
                document.getElementById('Sec').focus();
                return (false);
            }
        }
    }
    if (document.getElementById('place').value == "") {
        alert('Please enter place.');
        document.getElementById('place').focus();
        return (false);
    }
    if (document.getElementById('LongDeg').value == "" || document.getElementById('LongDeg').value == "LongDegree") {
        alert('Please enter longitude degree value.');
        document.getElementById('LongDeg').focus();
        return (false);
    }
    if (isNaN(document.getElementById('LongDeg').value)) {
        alert('The value for longitude degree should be between 0 and 179.');
        document.getElementById('LongDeg').focus();
        return (false);
    }
    if (document.getElementById('LongDeg').value < 0 || document.getElementById('LongDeg').value >= 180) {
        alert('The value for longitude degree should be between 0 and 179.');
        document.getElementById('LongDeg').focus();
        return (false);
    }
    if (document.getElementById('LongMin').value == "" || document.getElementById('LongMin').value == "LongMinute") {
        alert('Please enter longitude minute value.');
        document.getElementById('LongMin').focus();
        return (false);
    }
    if (isNaN(document.getElementById('LongMin').value)) {
        alert('The value for longitude minute should be between 0 and 59.');
        document.getElementById('LongMin').focus();
        return (false);
    }
    if (document.getElementById('LongMin').value < 0 || document.getElementById('LongMin').value >= 60) {
        alert('The value for longitude minute should be between 0 and 59.');
        document.getElementById('LongMin').focus();
        return (false);
    }
    if (document.getElementById('LongEW').value == "LongEW") {
        alert('Please select longitude direction.');
        document.getElementById('LongEW').focus();
        return (false);
    }

    if (document.getElementById('LatDeg').value == "" || document.getElementById('LatDeg').value == "LatDegree") {
        alert('Please enter latitude degree value.');
        document.getElementById('LatDeg').focus();
        return (false);
    }
    if (isNaN(document.getElementById('LatDeg').value)) {
        alert('The value for latitude degree should be between 0 and 89.');
        document.getElementById('LatDeg').focus();
        return (false);
    }
    if (document.getElementById('LatDeg').value < 0 || document.getElementById('LatDeg').value >= 90) {
        alert('The value for latitude degree should be between 0 and 89.');
        document.getElementById('LatDeg').focus();
        return (false);
    }
    if (document.getElementById('LatMin').value == "" || document.getElementById('LatMin').value == "LatMinute") {
        alert('Please enter latitude minute value.');
        document.getElementById('LatMin').focus();
        return (false);
    }
    if (isNaN(document.getElementById('LatMin').value)) {
        alert('The value for latitude minute should be between 0 and 59.');
        document.getElementById('LatMin').focus();
        return (false);
    }
    if (document.getElementById('LatMin').value < 0 || document.getElementById('LatMin').value >= 60) {
        alert('The value for latitude minute should be between 0 and 59.');
        document.getElementById('LatMin').focus();
        return (false);
    }
    if (document.getElementById('LatNS').value == "LatNS") {
        alert('Please select latitude direction.');
        document.getElementById('LatNS').focus();
        return (false);
    }
    if (document.getElementById('timeZone').value == "" || document.getElementById('timeZone').value == "TimeZone") {
        alert('Please enter time zone');
        document.getElementById('timeZone').focus();
        return (false);
    }
    if (isNaN(document.getElementById('timeZone').value) || document.getElementById('timeZone').value < -12.0 || document.getElementById('timeZone').value > 14.0) {
        alert('The value for time zone should be between -12 hrs and 14 hrs.');
        document.getElementById('timeZone').focus();
        return (false);
    }
    if (isNaN(document.getElementById('dst').value) || document.getElementById('dst').value < 0 || document.getElementById('dst').value > 3) {
        alert('DST must be between 0 and 3.');
        document.getElementById('dst').focus();
        return (false);
    }
    if (isNaN(document.getElementById('kphn').value) || document.getElementById('kphn').value < 0 || document.getElementById('kphn').value > 249) {
        alert('KP Horary Number must be between 0 and 249.');
        document.getElementById('kphn').focus();
        return (false);
    }

    return (true);
}