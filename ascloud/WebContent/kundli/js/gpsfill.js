geofill = function() {
    var c = null;
    var d = null;
    var i = null;

    function e(j) {
        c = j;
        b("http://geoip.pidgets.com/?format=json&callback=geofill.getpc")
    }
    function a(l) {
        d = l;
        var j = null;
        if (typeof arguments[1] === "string") {
            j = arguments[1]
        } else {
            var m = document.getElementById(l.postcode);
            if (m) {
                j = m.value
            }
        } if (j) {
            var k = "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.places%20where%20text%3D%22" + j + "%22&format=json&callback=geofill.pc";
            b(k)
        }
    }
    function h(n) {
        if (n.query.results) {
            var k = n.query.results.place;
            if (k[1]) {
                k = k[0]
            }
            if (k.postal) {
                var l = {
                    postcode: k.postal.content,
                    city: k.locality1.content,
                    country: k.country.content,
                    latitude: k.centroid.latitude,
                    longitude: k.centroid.longitude
                };
                for (var m in d) {
                    var j = document.getElementById(d[m]);
                    if (j) {
                        j.value = l[m]
                    }
                }
            } else {
                var l = {
                    error: "postcode"
                }
            }
        } else {
            var l = {
                error: 404
            }
        } if (typeof d.callback === "function") {
            d.callback(l)
        }
    }
    function b(j) {
        var k = document.createElement("script");
        k.setAttribute("src", j);
        document.getElementsByTagName("head")[0].appendChild(k)
    }
    function f(k) {
        i = k;
        var j = "http://query.yahooapis.com/v1/public/yql?q=select%20postal%20from%20geo.places%20where%20woeid%20in%20(select%20place.woeid%20from%20flickr.places%20where%20lat%3D%22" + k.latitude + "%22%20and%20lon%3D%22" + k.longitude + "%22)&format=json&callback=geofill.set";
        b(j)
    }
    function g(n) {
        var m = (n.query.results.place.postal === null) ? "" : n.query.results.place.postal.content;
        var k = {
            city: i.city,
            country: i.country_name,
            postcode: m,
            latitude: i.latitude,
            longitude: i.longitude
        };
        for (var l in c) {
            var j = document.getElementById(c[l]);
            if (j) {
                j.value = k[l]
            }
        }
        if (typeof c.callback === "function") {
            c.callback(k)
        }
    }
    return {
        set: g,
        find: e,
        pc: h,
        lookup: a,
        getpc: f
    }
} ();

function isDst() {
    var j = new Date();
    var b = new Date(j.getFullYear(), 0, 1, 0, 0, 0, 0);
    var h = new Date(j.getFullYear(), 6, 1, 0, 0, 0, 0);
    var i = b.toGMTString();
    var k = new Date(i.substring(0, i.lastIndexOf(" ") - 1));
    i = h.toGMTString();
    var g = new Date(i.substring(0, i.lastIndexOf(" ") - 1));
    var f = (b - k) / (1000 * 60 * 60);
    var e = (h - g) / (1000 * 60 * 60);
    var d;
    if (f == e) {
        d = "0"
    } else {
        var a = f - e;
        if (a >= 0) {
            f = e
        }
        d = "1"
    }
    var c = new Object;
    c.dst = d;
    c.std_time_offset = f;
    return c
};