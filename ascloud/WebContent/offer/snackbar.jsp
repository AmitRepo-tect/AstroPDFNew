<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<div class="navbar-fixed-bottom fixedBottom snackbar">
    <a href="javascript:void(0);" class="pull-left snackbar-close" onclick="closeSnackBar('snackbar', 'cancel-snackbar');"><i class="material-icons md-24">&#xE5CD;</i></a> 

  <%
  int LanguageCodeSB = Util.safeInt(session.getAttribute("languageCode"));
  if( LanguageCodeSB == 1) { %>
    <a href='javascript:getSnackBar("snackbar", "click-big-horo");' data-toggle='modal' data-target='#myModal'>महा कुंडली मात्र &#x20B9; 650 में <span class='btn btn-white'>अभी खरीदें</span></a>
  <% } else { %>
    <a href='javascript:getSnackBar("snackbar", "click-big-horo");' data-toggle='modal' data-target='#myModal'>Big Horoscope @ 650 <span class='btn btn-white'>BUY NOW</span></a>
  <% } %>
</div>
<style>
    .fixedBottom{padding: 8px 8px 8px;background: #FF6F00; bottom: -100px; box-shadow: 0px -1px 4px #888888;}
    .fixedBottom .snackbar-close{ padding-top:4px;}
    .fixedBottom a{font-size: 18px;color: #fff;display: block; text-align:center;}
    .fixedBottom a span{color: #333;}
    @media (max-width:320px){.fixedBottom a{font-size: 15px;}}
</style>
<script type="text/javascript">
    $(function () {
        $(".snackbar").animate({ bottom: "0px" }, 1200);
        $(".snackbar").hide();
        if (!getCookiesSnackBar()) {
            $(".snackbar").show();
            $(".snackbar-close").click(function () {
                $(".snackbar").hide(300);
                setCookiesSnackBar();
            });
        }
    });
    function getSnackBar(tagvalue, tag) {
        _gaq.push(['_trackEvent', tagvalue, tag]);        
    }
    function closeSnackBar(tagvalue, tag) {
        _gaq.push(['_trackEvent', tagvalue, tag]);
        setCookiesSnackBar();
    }
    function setCookiesSnackBar() {
        document.cookie = "snackbar=1";
    }
    function getCookiesSnackBar() {
        flag = 0;
        findcookies = "snackbar=1";
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
</script>
