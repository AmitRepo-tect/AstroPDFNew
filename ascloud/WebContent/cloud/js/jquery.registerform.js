//Code specially for IE Browser.
/*if (!event)
event = window.event;
var target = (event.target) ? event.target : event.srcElement;*/

$(document).ready(function() {
    $(document.body).addClass('front-page');
    var RegCSS_Class_Name = 'hasome';
    $("div.holding").each(function(i) {
        var div = $('div.holding');
        var inp = $('div.holding input')[i];
        var spn = $('div.holding span.holder')[i];
        if (inp && spn) {
            inp.onclick = function() {
                inp.focus();
                //alert("Deepak" + $("div.holding").length);
                for (var j = 0; j < $("div.holding").length; j++) {
                    if (j != i) {
                        if ($('div.holding input')[j].value.length > 0) {
                            $('div.holding input')[j].addClass(RegCSS_Class_Name);
                        }
                    }
                }
            };
            spn.onclick = function() {
                //alert("within span");
                inp.focus();
                //alert("Mohit" + $("div.holding").length);
                for (var j = 0; j < $("div.holding").length; j++) {
                    if (j != i) {
                        if ($('div.holding input')[j].value.length > 0) {
                            $('div.holding   input')[j].addClass(RegCSS_Class_Name);
                        }
                    }
                }
            };

            //inp.onblur = function() { /*if (!inp.value.length) $(div).removeClass(RegCSS_Class_Name);*/ }
            inp.onkeyup = function(event) {
                //alert("mohit");
                if (!event)
                    event = window.event;
                var target = (event.target) ? event.target : event.srcElement;
                if (event && event.keyCode == 8 || inp.value.length)
                    $(target).parent().addClass(RegCSS_Class_Name);
                else
                    $(target).parent().removeClass(RegCSS_Class_Name);
                if (inp.value.length == 0) {
                    $(target).parent().removeClass(RegCSS_Class_Name);
                }
            }

        }
    });

});