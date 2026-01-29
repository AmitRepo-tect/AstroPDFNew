
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>

<div class="padding-2px-l  <%if(SharedFunction.Is_Mobile(request)){%>ui-margin-l ui-margin-r<%}%> ui-margin-b">
 
    <div class="ui-container ui-margin-tb ui-padding-tb">
        <div align="center">
            <%@include file = '/controls/i_ad-responsive.jsp'%>
        </div>
    </div>

<%if(SharedFunction.Is_Mobile(request)){%>
    <%@include file = '/controls/i_shopping-widget.jsp'%>

    <div align="center" class="card-shadow bg-white ui-margin-tb">
        <div class="zodiac-sign">
            <%@include file = '/controls/i_zodiac.jsp'%>
        </div>
        <div class="clear"> </div>
    </div>
    <%}%>
    
   
</div>



</div> 
</div>
<div id="sideRight">
   	<%@include file='/include/right.jsp'%>
</div>
</div>
<div align="center" id="footer">
     	<%@include file='/controls/i_footer.jsp'%>
</div>

</div>
<%if(SharedFunction.Is_Mobile(request)){%>
<script>
    $(document).ready(function () {
        $("a.BreadCrumb").text(
        function (f, g) {
            var e = $.trim(g); if (e.length > 15) { return $.trim(e).substring(0, 15) + ".." }
            return e
        });
    });
</script>

<div id="bodyMask" class="body-mask"></div>
<script type="text/javascript">

    var slideLeft = new Menu({
        wrapper: '#main',
        type: 'slide-left',
        menuOpenerClass: '.side-nav',
        maskId: '#bodyMask'
    });
    var slideLeftBtn = document.querySelector('#side-nav-slide-left');
    slideLeftBtn.addEventListener('click', function (e) {
        e.preventDefault;
        slideLeft.open();
    });

</script>

<%} %>