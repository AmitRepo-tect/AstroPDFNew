
<div id="setPlaceOnDashboard" class="modal bottom-sheet">
	<div class="model-header amber darken-1">
		<h4 class="white-text">Select Place</h4>
		<a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat close-btn white-text"
			style="top: 12px;"><i class="material-icons">close</i></a>
	</div>	
	
	<div class="modal-content">	
      <div class="row">
        <div class="input-field col s12">
          <input type="text" id="autocomplete-input" class="autocomplete">
          <label for="autocomplete-input">Search Place</label>
        </div>
      </div>   
  </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
$("#autocomplete-input").autocomplete(
		    "/cloud/FindPlaces.jsp",
		    {
		        delay: 0,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 0,
		        cacheLength: 10,
		        onItemSelect: selectItem,
		        onFindValue: findValue,
		        formatItem: formatItem,
		        autoFill: false
		    }
	    );
   
});
	   

function findValue(li) {
	if (li == null) return alert("No match!");
	//alert(li.extra[0]+","+li.extra[10]);
	$('#currPlace').val($('#autocomplete-input').val());
    $('#LatDeg').val(li.extra[2]);
    $('#LatMin').val(li.extra[3]);
    $('#LatNS').val(li.extra[4]);
    $('#LongDeg').val(li.extra[5]);
    $('#LongMin').val(li.extra[6]);
    $('#LongEW').val(li.extra[7]);
    $('#timeZone').val(li.extra[8]);
    $('#timezoneid').val(li.extra[9]);   
    $('select').material_select();
    standardTimezone = li.extra[8];
    $("#DsBoard").submit(); // Submit the form
}

function selectItem(li) {
    flag = false;
    findValue(li);
}

function formatItem(row) {
    return row[0] + ", " + row[1] + " (" + row[2] + ")";

}

/*function lookupAjax() {
    var oSuggest = $("#place")[0].autocompleter;
    oSuggest.findValue();
    return false;
}
*/

/*Date.prototype.isDst = function() {
	var tempTimezone;
    timezoneJS.timezone.zoneFileBasePath = '/atlas/js/tz';
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
        tempTimezone = standardTimezone * (-60);
        var birthdate = new timezoneJS.Date(birthdatval, timezoneid);
        var decidedate = new timezoneJS.Date(decidedstval, timezoneid);
       
        if (decidedate.getTimezoneOffset() > birthdate.getTimezoneOffset()) {
            return true;
        }
        else if (decidedate.getTimezoneOffset() == birthdate.getTimezoneOffset() && tempTimezone == 0 ? Math.abs(decidedate.getTimezoneOffset()) > tempTimezone : decidedate.getTimezoneOffset() > tempTimezone)
            return true;
        else {
            return false;
        }


    }
}

*/

 /*function isWarTimeCorrectionInIndia(dayval, monthval, yearval) {

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
*/
</script>

