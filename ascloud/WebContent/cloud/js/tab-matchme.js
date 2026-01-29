$(document).ready(function() {
    $(".tab_content").hide(); $("ul.tabs li:first").addClass("active").show(); $(".tab_content:first").show(); $("ul.tabs li").click(function() { $("ul.tabs li").removeClass("active"); $(this).addClass("active"); $(".tab_content").hide(); var a = $(this).find("a").attr("href"); $(a).fadeIn(1E3); return !1 }); var a = window.location, a = a.toString(); showtabindex = a.indexOf("?"); showtab = a.substr(showtabindex + 1, 4); showtab = "#" + showtab; "#tab1" == showtab ? ($("ul.tabs li").removeClass("active"), $("ul.tabs li#t1").addClass("active"),
$(".tab_content").hide(), $(showtab).fadeIn(1E3)) : "#tab2" == showtab ? (getsavedcharts(), $("ul.tabs li").removeClass("active"), $("ul.tabs li#t2").addClass("active"), $(".tab_content").hide(), $(showtab).fadeIn(1E3)) : "#tab3" == showtab ? ($("ul.tabs li").removeClass("active"), $("ul.tabs li#t3").addClass("active"), $(".tab_content").hide(), $(showtab).fadeIn(1E3)) : ($("ul.tabs li").removeClass("active"), $("ul.tabs li#t1").addClass("active"), $(".tab_content").hide(), $("#tab1").fadeIn(1E3)); return !1
});
/*function findValue(a) { 
	
	if (null == a) return alert("No match!"); 
$('#LatDeg').val(a.extra[2]);
$('#LatMin').val(a.extra[3]);
$('#LatNS').val(a.extra[4]);
$('#LongDeg').val(a.extra[5]);
$('#LongMin').val(a.extra[6]);
$('#LongEW').val(a.extra[7]);
$('#timeZone').val(a.extra[8]);
$('#timezoneid').val(a.extra[9]);   } 
function selectItem(a) { findValue(a) } function formatItem(a) { return a[0] + " (" + a[2] + " " + a[3] + ")" } function lookupAjax() { $("#place")[0].autocompleter.findValue(); return !1 };
*/