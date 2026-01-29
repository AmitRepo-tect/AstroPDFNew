</div>
</div>
<div class="col-sm-4">
  <div class="bg-white br-radius card-shadow ui-margin-t">
    <%@include file='/include/hi/right.jsp'%>
    </div>
</div>
</div>
<div align="center" id="footer">
    <%@include file='/controls/hi/i_footer.jsp'%>
</div>



<%if(SharedFunction.Is_Mobile(request)){%>
<script>
    $(document).ready(function () {
        $("a.BreadCrumb").text(
        function (f, g) {
            var e = $.trim(g); 
            if (e.length > 15) { return $.trim(e).substring(0, 15) + ".." }
            return e
        });
    });
</script>
  <%}%>
<div id="bodyMask" class="body-mask"></div>
<%if(SharedFunction.Is_Mobile(request)){ %>
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



