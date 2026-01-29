function autofillgps(clickType) {
    $("#timeZone").val(isDst().std_time_offset);
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(b) {
         $("#accuracy").val(b.coords.accuracy);
         populateGeoLocation(b.coords.latitude, b.coords.longitude, "GPS Coordinate", clickType)
        }, function(b) {
           $("#accuracy").val("Unknown");
            alert("Unable to find location")
        }, {
            enableHighAccuracy: true,
            maximumAge: 0,
            timeout: 15000
        })
    }
    else {
        (function() {
            geofill.find({
                callback: function(b) {
                populateGeoLocation(b.latitude, b.longitude, b.city, clickType)
                }
            })
        })()
    }
}

function populateGeoLocation(g, f, b, clickType) {
    var d, e;
    var c, a;
    if (g < 0) {
        latNS = "S";
        c = g * (-1)
    } else {
        latNS = "N";
        c = g
    } if (f < 0) {
        longEW = "W";
        a = f * (-1)
    } else {
        longEW = "E";
        a = f
    }
    $("#LatNS").val(latNS);
    $("#LongEW").val(longEW);
    d = getDMS(c);
    e = getDMS(a);
    $("#LatDeg").val(d.deg);
    $("#LatMin").val(d.min);
    $("#LongDeg").val(e.deg);
    $("#LongMin").val(e.min);
    $('#place').val(b);

    if (clickType == "CurrentTime") {
            setCurrDatTim();
    }
    
    
    
   }

function getDMS(a) {
    var c = new Object;
    c.deg = parseInt(a);
    var b = (a - parseInt(a));
    c.min = parseInt(b * 60);
    b = b * 60;
    b = (b - parseInt(b));
    c.sec = parseInt(b * 60);
    return c
}
        