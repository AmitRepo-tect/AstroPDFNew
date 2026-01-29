$(document).ready(function() {
   
    //Default Action
    $(".tab_content").hide(); //Hide all content
    $("ul.tabs li:first").addClass("active").show(); //Activate first tab
    $(".tab_content:first").show(); //Show first tab content


    //On Click Event

    $("ul.tabs li").click(function() {
        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content
        var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
        $(activeTab).fadeIn(1000); //Fade in the active content
        return false;
    });
    
    var currenturl = window.location;
    currenturl = currenturl.toString();
    showtabindex = currenturl.indexOf('?');
    showtab = currenturl.substr(showtabindex + 1, 4);
    showtab = '#' + showtab;

    if (showtab == "#tab1") {
        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $("ul.tabs li#t1").addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content
        $(showtab).fadeIn(1000); //Fade in the active content
        return false;
    }
    else {
        if (showtab == "#tab2") {
            alert('Mohit');
            getsavedcharts();
            $("ul.tabs li").removeClass("active"); //Remove any "active" class
            $("ul.tabs li#t2").addClass("active"); //Add "active" class to selected tab
            $(".tab_content").hide(); //Hide all tab content
            $(showtab).fadeIn(1000); //Fade in the active content
            return false;
        }
        else {
            if (showtab == "#tab3") {
                $("ul.tabs li").removeClass("active"); //Remove any "active" class
                $("ul.tabs li#t3").addClass("active"); //Add "active" class to selected tab
                $(".tab_content").hide(); //Hide all tab content
                $(showtab).fadeIn(1000); //Fade in the active content
                return false;
            }
            else {
                $("ul.tabs li").removeClass("active"); //Remove any "active" class
                $("ul.tabs li#t1").addClass("active"); //Add "active" class to selected tab
                $(".tab_content").hide(); //Hide all tab content
                $('#tab1').fadeIn(1000); //Fade in the active content
                return false;
            }

        }
    }


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

function findValue(li) {
    if (li == null) return alert("No match!");
    $('#LatDeg').val(li.extra[3]);
    $('#LatMin').val(li.extra[4]);
    $('#LatNS').val(li.extra[5]);
    $('#LongDeg').val(li.extra[6]);
    $('#LongMin').val(li.extra[7]);
    $('#LongEW').val(li.extra[8]);
    $('#timeZone').val(li.extra[9]);
}
function selectItem(li) {
    findValue(li);
}

function formatItem(row) {
    return row[0] + " (" + row[2] + " " + row[3] + ")";
}

function lookupAjax() {
    var oSuggest = $("#place")[0].autocompleter;
    oSuggest.findValue();
    return false;
}