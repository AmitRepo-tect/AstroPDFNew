//$(function () {
    //$('#sidebar-menu').sidr({ body: 'fixed' });
    //$('[data-toggle="back-page"]').click(function () { event.preventDefault(); history.back(1); });
   
    //$("#place").focusin(function () {
        //$("#input-control-display").hide();
    //}).focusout(function () {
        //$("#input-control-display").show();
    //});

//});

//top menu code
function LoginValidation(theForm) {

    if (theForm.txtLoginID.value == "") {
        alert("Please enter a value for the \"User Name\" field.");
        theForm.txtLoginID.focus();
        return (false);
    }
     if (theForm.txtLoginPassword.value == "") {
        alert("Please enter a value for the Password.");
        theForm.txtLoginPassword.focus();
        return (false);
    }

    return (true);
}



function removedefault(lid, aid, aro) {
    var toplist = document.getElementById('topul');
    //document.getElementsByTagName('ul').backgroundImage = "url('images/btn-search.gif')";
    spanlength = toplist.getElementsByTagName('span').length;
    for (var j = 0; j < spanlength; j++) {
        //toplist.getElementsByTagName('li').item(j).style.background = "url('/images/btn-search.gif')";
        //toplist.getElementsByTagName('li').item(j).style.backgroundImage = "url('/images/seprator.gif')";
        //toplist.getElementsByTagName('li').item(j).style.backgroundRepeat = "no-repeat";
        var litem = toplist.getElementsByTagName('li').item(j);
        litem.getElementsByTagName('a').item(0).style.color = "#000";
        litem.getElementsByTagName('i').item(0).style.borderTopColor = "#000";
        toplist.getElementsByTagName('span').item(j).style.display = 'none';
    }
    document.getElementById(aro).style.borderTopColor = "#ff0000"
    document.getElementById(aid).style.color = "#ff0000";
    var llist = document.getElementById(lid);
    llist.getElementsByTagName('span').item(0).style.display = 'block';
}
/* Fix Navbar Menu
----------------------------------------------------------------*/
var navbar_top = 60;
function navbar_reset_top() {
    var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
    if (scrollTop > navbar_top && navbar.className === "navbar_absolute") {
        document.getElementById("navbar").className = "navbar_fixed";
    }
    else if (scrollTop < navbar_top && navbar.className === "navbar_fixed") {
        document.getElementById("navbar").className = "navbar_absolute";
    }
}

function window_onload() {
    window.addEventListener("scroll", navbar_reset_top, false);
}
$(function () {
    $('.dropdown-menu').click(function (e) {
        e.stopPropagation();
    });
    $('#showApps').click(function () {$(".showhide-apps").toggle();});
    $(".AscTopHead span").removeAttr('style');
    $("[data-toggle=tooltip]").tooltip({ placement: 'top' });
    $("[data-toggle=tooltip-r]").tooltip({ placement: "right" })
});

var isMobileJS = {
    Android: function () {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function () {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function () {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function () {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function () {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function () {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};
/*
if (isMobileJS.iOS()) {
if (window.orientation == 0) {
//alert("astrosage");
$("#ios").addClass("ios");
}
else {
$("#ios").removeClass("ios");
}
}

if (isMobileJS.Windows()) {
$(".nav-body").removeClass('nav-body').addClass("nav-body-ie");
}
if (isMobileJS.iOS()) {
$(".nav-body").removeClass('nav-body').addClass("nav-body-ie");
}   */

$(document).ready(function () {
    if (isMobileJS.Android()) {
        if (!getCookiesAppPopup()) {
            $('#appDownload').modal('toggle');
        }
    }
});

function appDownloadClose() {
    _gaq.push(['_trackEvent', 'cancel-app-popup', 'download-app']);
    setCookiesAppPopup();
}
function setCookiesAppPopup() {
    document.cookie = "app-download=1";
}
function getCookiesAppPopup() {
    flag = 0;
    findcookies = "app-download=1";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        if (c.indexOf(findcookies) != -1) {
            flag = 1;
            break;
        }
    }
    if (flag == 1) {
        return true;
    }
    else {
        return false;
    }
}

$(function () {
    var url = window.location.href;

    $('#signTab .col-xs-1 a[href="' + url + '"]').addClass('active-nav');
    $('#signTab .col-xs-1 a').filter(function () {
        return this.href == url;
    }).addClass('active-nav');


});

$(function () {
    $('.equalHeight').each(function () {
        var eHeight = $(this).innerHeight();
        $(this).find('div.elh').outerHeight(eHeight);
    }); 

 });

