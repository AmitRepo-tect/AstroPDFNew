<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<link type="text/css" href="/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link type="text/css" href="http://hindi.astrosage.com/dist/css/as-global.min.css" rel="stylesheet" />
    <link type="text/css" href="/dist/css/new-style.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/dist/js/as-global-ui.min.js"></script>
    <script type="text/javascript" src="/dist/js/as-social-analytics.js"></script>
    <%if(SharedFunction.Is_Mobile(request)){%>
    <link type="text/css" href="/dist/css/side-panel.css" rel="stylesheet" />
    <script type="text/javascript" src="/dist/js/side-panel.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {$("[data-toggle=tooltip]").removeAttr("title data-toggle"); });
    function expandCollapse() { $("#exndColpsDiv").toggle(); if ($("#exndColpsDiv").css("display") == "none") { $("#exndColpsTrigger").html('<span class="glyphicon glyphicon-plus"></span>') } else { $("#exndColpsTrigger").html('<span class="glyphicon glyphicon-minus"></span>') } };
    </script>
    <%}%>

     <script type="text/javascript">
         $(document).ready(function () {             
             $("#roundborder").addClass("ui-container ui-margin-tb"); 
         });
    </script>
    
 <link rel="manifest" href="/manifest.json">
 <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async='async'></script>
  <script>
      var OneSignal = OneSignal || [];
      OneSignal.push(["init", {
          appId: "908106b3-bcef-4786-abf6-1ec1f4b06b59",
          autoRegister: true, /* Set to true to automatically prompt visitors */
          subdomainName: 'astrosage',
          notifyButton: {
              enable: false /* Set to false to hide */
          },
          safari_web_id: 'web.onesignal.auto.1ee85315-99d2-4859-abe2-d0d2d86b4cd7'

      }]);
  </script> 
<!--[if lt IE 9]>
          <script src="/assets/js/html5shiv.js"></script>
          <script src="/assets/js/respond.min.js"></script>
<![endif]-->
