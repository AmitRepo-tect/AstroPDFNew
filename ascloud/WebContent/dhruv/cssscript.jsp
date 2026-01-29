<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css" media="screen,projection" />

<link type="text/css" rel="stylesheet" href="/cloud/dist/css/theme.css">
<link type="text/css" rel="stylesheet" href="/dist/css/app.css">
<link type="text/css" rel="stylesheet" href="/cloud/dist/css/responsive.css">
<link type="text/css" rel="stylesheet" href="/cloud/dist/css/perfect-scrollbar.css">
<link type="text/css" rel="stylesheet" href="/cloud/js/script/jquery.autocomplete.css" />

<script type="text/javascript" src="/cloud/dist/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.js"></script>
<script type="text/javascript" src="/cloud/dist/js/perfect-scrollbar.min.js"></script>
<script type='text/javascript' src='/cloud/js/script/jquery.autocomplete.js'></script>
	
<script type="text/javascript" src="/dhruv/js/app.js"></script>

<script type="text/javascript" src="/kundli/js/kundli.js" charset="utf-8"></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>
<script type="text/javascript" src="/kundli/js/autofillgps.js"></script>
<script type="text/javascript" src="/kundli/js/gpsfill.js"></script>
<script type="text/javascript" src="/dist/js/shared-functions.js"></script>

<script type="text/javascript">

//---------------------
    function toggleAndChangeText() {
        $('#divToToggle').toggle();
        if ($('#divToToggle').css('display') == 'none') {
            $('#aTag').html('[&#43]  Settings ');
        }
        else {
            $('#aTag').html('[&#8722] Settings ');
        }
    }
    function toggleAndChangeText1() {
        $('#divToToggle1').toggle();
        if ($('#divToToggle1').css('display') == 'none') {
            $('#aTag1').html('[&#43]  Settings ');
        }
        else {
            $('#aTag1').html('[&#8722] Settings ');
        }
    }
    function fillkphn() {

        $("#kphn").val(randomMinToMax(1, 249));
    }
    function randomMinToMax(c, a) {
        var b = a - c + 1;
        return Math.floor(Math.random() * b + c)
    }
    function getgpsAccuracy() {
        msg = 'Estimated GPS Accuracy is ' + $("#accuracy").val() + ' meters'
        alert(msg);
    }
    function setCurrDatTim() {
        var currentTime = new Date();
        $("#Day").val(currentTime.getDate());
        $("#Month").val(currentTime.getMonth() + 1);
        $("#Year").val(currentTime.getFullYear());
        $("#Hrs").val(currentTime.getHours());
        $("#Min").val(currentTime.getMinutes());
        $("#Sec").val(currentTime.getSeconds());
        $("#Name").val($("#Day").val() + "/" + $("#Month").val() + "/" + $("#Year").val() + " " + currentTime.getHours() + ":" + currentTime.getMinutes() + ":" + currentTime.getSeconds());

    }
    function findlocation(clickType) {
        $("#dstval").html('');
        autofillgps(clickType);
    }  
    function validateEphemeris() {
  	  var x = document.forms["Ephemeris"]["place"].value;
  	  if (x == "") {
  	    alert("Please select place");
  	    return false;
  	  }
  	} 

</script>