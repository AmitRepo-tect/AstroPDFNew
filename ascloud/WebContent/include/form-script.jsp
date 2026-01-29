<link rel="stylesheet" type="text/css" href="/atlas/css/jquery.autocomplete.css" />
<link rel='stylesheet' type="text/css" href="/atlas/css/birth-details.css" />
<script type='text/javascript' src='/dist/js/jquery.autocomplete.min.js'></script>
<script type="text/javascript" src="/kundli/js/kundli.js"></script>
<script type="text/javascript" src="/atlas/js/date.js"></script>
<script type="text/javascript" src="/kundli/js/autofillgps.js"></script>
<script type="text/javascript" src="/kundli/js/gpsfill.js"></script>

<script type="text/javascript">
    function toggleAndChangeText() {
        $('#divToToggle').toggle();
        if ($('#divToToggle').css('display') == 'none') {
            $('#aTag').html('[&#43] Coordinates and Advance Settings');
        }
        else {
            $('#aTag').html('[&#8722] Coordinates and Advance Settings');
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
         //findlocation();
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
        
    </script>
  

