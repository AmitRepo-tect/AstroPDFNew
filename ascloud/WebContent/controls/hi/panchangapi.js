function getaajkapanchangjsonp() {
    $('#printPanchang').html('<div align="center" class="ui-padding-all"><img src="/images/loading.gif"></div>');
    $.ajax({
        type: 'POST',
        //url: 'http://panchang-1205.appspot.com/panchang/aajkapanchangapi',
        url: '/controls/hi/panchang-fortoday.asp',
        async: true,
        data: '',
        dataType: 'jsonp',
        jsonp: 'callback',
        jsonpCallback: 'jsonCallback',
        contentType: "application/json",
        cache: false,
        success: function (data, textStatus, jqXHR) {

            //alert(data.aajkapanchag[0].sunrise);
            $('#printPanchang').html('');
            $('#printPanchang').append("<p class='text-center'><b>" + data.aajkapanchag[0].placename + " (" + data.aajkapanchag[0].date + ")</b></p><div class='divider'></div>");
            $('#printPanchang').append("<div class='item-second'><b>तिथि:</b> " + data.aajkapanchag[0].paksha + " " + data.aajkapanchag[0].tithi + "</div><div class='item-second'><b>मास अमांत:</b> " + data.aajkapanchag[0].monthamanta + "</div><div class='item-second'><b>वार:</b> " + data.aajkapanchag[0].day + " | <b>सम्वत:</b> " + data.aajkapanchag[0].vikramsamvat + "</div><div class='divider'></div><div class='item-second'><b>नक्षत्र:</b> " + data.aajkapanchag[0].nakshatra + "</div><div class='item-second'><b>योग:</b> " + data.aajkapanchag[0].yoga + "</div><div class='item-second'><b>करण:</b> " + data.aajkapanchag[0].karana + "</div><div class='item-second'><b>सूर्योदय:</b> " + data.aajkapanchag[0].sunrise + " | <b>सूर्यास्त:</b> " + data.aajkapanchag[0].sunset + "</div><div class='divider'></div>");
            $("[data-toggle=tooltip]").tooltip();
        },
        error: function (jqxhr, textStatus) {
            if (textStatus == "timeout") {
                $('#printPanchang').html('');
                $('#printPanchang').append("Time Out. Please try again.");
            }
            else {
                $('#printPanchang').html('');
                $('#printPanchang').append("An error occurred. Please try again.");
            }
        }
    });

}

function getMoreEvents(tagvalue, tag) { 
        _gaq.push(['_trackEvent', tagvalue, tag]);        
}

$(document).ready(function () {
    getaajkapanchangjsonp();   
});