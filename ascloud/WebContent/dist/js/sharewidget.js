jQuery(function ($) {
    function open_popup(url, width, height, scroll) {
        var left = ($(window).width() - width) / 2,
                top = ($(window).height() - height) / 2,
                opts = 'status=1,' + (scroll ? 'scrollbars=1,' : '') + 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left;
        window.open(url, "", opts);
    }
    $('<div class="as-sharing-container"></div>')
            .appendTo(document.body)
            .append(
                $('<div class="mobile sharing-item sharing-wa"><div class="sharing-img"></div></div>').click(function () {
                    open_popup("whatsapp://send?text=" + encodeURIComponent($(document).find("title").text()) + " " + encodeURIComponent(document.location.href));
                }),
                $('<div class="sharing-item sharing-fb"><div class="sharing-img"></div></div>').click(function () {
                    open_popup("https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(document.location.href), 600, 350);
                }),
                $('<div class="sharing-item sharing-gp"><div class="sharing-img"></div></div>').click(function () {
                    open_popup("https://plus.google.com/share?url=" + encodeURIComponent(document.location.href), 500, 500);
                }),
                $('<div class="sharing-item sharing-tw"><div class="sharing-img"></div></div>').click(function () {
                    open_popup("https://twitter.com/share?url=" + encodeURIComponent(document.location.href) + "&text=" + encodeURIComponent($(document).find("title").text()), 575, 400, true);
                }),
                $('<div class="sharing-item sharing-li"><div class="sharing-img"></div></div>').click(function () {
                    open_popup("https://www.linkedin.com/shareArticle?mini=true&url=" + encodeURIComponent(document.location.href) + "&title=" + encodeURIComponent($(document).find("title").text()), 750, 400, true);
                }),
                $('<div class="sharing-item sharing-pt"><div class="sharing-img"></div></div>').click(function () {
                    open_popup("http://pinterest.com/pin/create/link/?url=" + encodeURIComponent(document.location.href) + "&title=" + encodeURIComponent($(document).find("title").text()), 500, 500, true);
                }),
                 $('<div class="sharing-item sharing-mail"><div class="sharing-img"></div></div>').click(function () {
                     open_popup("mailto:?subject=" + encodeURIComponent($(document).find("title").text()) + "&body=" + encodeURIComponent(document.location.href), 500, 500, true);
                 })
            );
                 $('<ul class="nav navbar-nav-custom navbar-fixed-bottom bg-lgtgrey bottom10 shadow-top mobile"> </ul>')
            .appendTo(document.body)
            .append(
                $('<li><a href="javascript:void(0);"><i class="fa fa-whatsapp txt-green"></i></a></li>').click(function () {
                    _gaq.push(['_trackEvent', 'share-wh', 'share-widget']);
                    open_popup("whatsapp://send?text=" + encodeURIComponent($(document).find("title").text()) + " " + encodeURIComponent(document.location.href));
                }),
                $('<li><a href="javascript:void(0);"><i class="fa fa-facebook txt-blue"></i></a></li>').click(function () {
                    _gaq.push(['_trackEvent', 'share-fb', 'share-widget']);
                    open_popup("https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(document.location.href), 600, 350);
                }),
                $('<li><a href="javascript:void(0);"><i class="fa fa-google-plus txt-red"></i></a></li>').click(function () {
                    _gaq.push(['_trackEvent', 'share-g+', 'share-widget']);
                    open_popup("https://plus.google.com/share?url=" + encodeURIComponent(document.location.href), 500, 500);
                })            
            );

});

$(document).ready(function () {
    $('.as-sharing-open').click(function () {
        $('.as-sharing-container').animate({ left: '0' }, 500, function () { });
        $('.as-sharing-open').hide();
        $('.as-sharing-close').show();
    });
    $('.as-sharing-close').click(function () {
        $('.as-sharing-container').animate({ left: '-100' }, 400, function () { });
        $('.as-sharing-open').show();
        $('.as-sharing-close').hide();
    });
$('#GetAnalyticsData').click(function () { _gaq.push(['_trackEvent', 'share-wh-rashifal', 'share-widget']);});    
});

