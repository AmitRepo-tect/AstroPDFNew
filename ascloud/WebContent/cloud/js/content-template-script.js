
var flagold;
flagold = 1;

function resizeimg(img, horiver) {
      if(screen.width<=1152) {
          if (horiver == 1) {
              img.height = 650;
              img.width = 350;
          }
          else {
              img.width = 500; 
          }  
      }
      
      if(screen.width>1152) {
          if (horiver == 1) {
              img.height = 650;
              img.width = 350;
          }
          else {
              img.width = 600;
          }
      }
    }

function Right(str, n){
    if (n <= 0)
       return "";
    else if (n > String(str).length)
       return str;
    else {
       var iLen = String(str).length;
       return String(str).substring(iLen, iLen - n);
    }
}

function openPage(pageName) {

    if (subURL.indexOf("login.asp") >= 0 || subURL.indexOf("signup.asp") >= 0) {

        myURL = window.location.href;
        if (myURL.indexOf('?') == -1) {
            myURL = myURL + '?a=' + Math.random();
        }
        else {
            myURL = myURL + '&a=' + Math.random();
        }
        myURL = Right(myURL, myURL.length - (myURL).indexOf('?') - 1);
        $.get(pageName, myURL, function(data, status, xhr) {
        	if (textStatus == "success") {
            $("#main-content").html(data);
            $('#welcome').remove();
            $('#topheading').append($('.boxhdg').html());
            $('#topheading').addClass('boxhdg');

            //$('table:nth(2)').remove();
            ChangePlanetImage();
        	}
            temppagename = Right(pageName, (pageName.length - 4));
            if (status == "error") {
                $("#main-content").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div><div style="width: 55%;padding-bottom:30px;"><div style="float: left;"><a href="' + temppagename + '" style="text-decoration: underline; font-size: 16px;font-weight: bold;">Click here to refresh this page</a><span style="text-decoration: underline; font-size: 16px;font-weight: bold; padding-left:5px;">|<span><a href="home.asp"style="padding-left:5px;text-decoration: underline; font-size: 16px;font-weight: bold;">Go to home page</a></div></div></div></center>');
            }
            if (status == "timeout") {
                $("#main-content").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div><div style="width: 55%;padding-bottom:30px;"><div style="float: left;"><a href="' + temppagename + '" style="text-decoration: underline; font-size: 16px;font-weight: bold;">Click here to refresh this page</a><span style="text-decoration: underline; font-size: 16px;font-weight: bold; padding-left:5px;">|<span><a href="home.asp"style="padding-left:5px;text-decoration: underline; font-size: 16px;font-weight: bold;">Go to home page</a></div></div></div></center>');
            }
        });
    }
    else if (subURL.indexOf("service-order.asp") >= 0) {
        $('#welcome').remove();
        $('#topheading').append($('.boxhdg').html());
        $('#topheading').addClass('boxhdg');

        //$('table:nth(4)').remove();
        ChangePlanetImage();
    }
    else {
        $('#welcome').remove();
        $('#topheading').append($('.boxhdg').html());
        $('#topheading').addClass('boxhdg');

        //$('table:nth(2)').remove();
        ChangePlanetImage();
    }
}

    function changeHeading() {
        if (subURL.indexOf("service-order.asp") >= 0) {
            $('#welcome').remove();
            $('#topheading').append($('.boxhdg').html());
            $('#topheading').addClass('boxhdg');

            //$('table:nth(4)').remove();
            ChangePlanetImage();
        }
        else {
            $('#welcome').remove();
            $('#topheading').append($('.boxhdg').html());
            $('#topheading').addClass('boxhdg');

            //$('table:nth(2)').remove();
            ChangePlanetImage();
        }
    }
    
    function ajaxcallforcontent() {
        loadpaidservices();
        loadfreereports();
        loadadproduct();
    }

    function loadpaidservices() {    	
    	$.ajax({
    	    url: "services/i_services-icons.jsp",
    	    type: "GET",
    	    success: function(data, status, xhr) {
    	    	$("#Div1").html(data);
    	    },
    	    error: function(jqXHR, textStatus, errorThrown) {
    	    	if(textStatus == "error"){
                    $("#Div1").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div></div></center>');
                }
    	        if(textStatus==="timeout") {
    	        	$("#Div1").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div></div></center>');
    	        	
    	        } 
    	    }
    	});
    
    }
   
    function loadfreereports() {
        $.get("freechart_icon1.jsp", function(data, status, xhr) {
            //alert(data);
            $('#main-content-report').append('<div align="center" class="topbottompad"><img src="/images/loading.gif" height="40" align="center" width="40"> loading...</div>');
            if(status == "success"){   
            	$("#main-content-report").html(data);     
            }       
            if (status == "error") {
                $("#main-content-report").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div></div></center>');
            }
            if (status == "timeout") {
                $("#main-content-report").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div></div></center>');
            }
        });
    }

    function loadadproduct() {
        $.get("ad-product.jsp", function(data, status, xhr) {
            //alert(data);
            $('#ad-product').append('<div align="center" class="topbottompad"><img src="/images/loading.gif" height="40" align="center" width="40"> loading...</div>');
            if(status == "success"){   
            	$("#ad-product").html(data);
            }        
            if (status == "error") {
                $("#ad-product").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div></div></center>');
            }
            if (status == "timeout") {
                $("#ad-product").html('<center><div style="padding: 20px 20px 20px 20px; margin-bottom: 20px; width: 90%; border: #f96d06 1px solid;background-color: #faecd1;" align="center"><div><font size="3" color="red"><b>Page loading fail, it might be due to slow internet connection.</b></font></div></div></center>');
            }
        });
    }
    function blinkText() {
        if (flagold == 1) {
            document.getElementById("olderversion").innerHTML = 'Try Older Version';
            flagold = 0;
        }
        else {
            document.getElementById("olderversion").innerHTML = '&nbsp;';
            flagold = 1;
        }
    }
    function animateOlderVersionText() {
        setInterval('blinkText()', 700);
    }

   // Start Of Print code in File menu
    function print() {
        //select all the a tag with name equal to modal
        $('a[name=modal]').click(function(e) {
            //Cancel the link behavior
            e.preventDefault();

            //Get the A tag
            var id = $(this).attr('href');

            //Get the screen height and width
            var maskHeight = $(document).height();
            var maskWidth = $(window).width();

            //Set heigth and width to mask to fill up the whole screen
            $('#mask').css({ 'width': maskWidth, 'height': maskHeight });

            //transition effect		
            $('#mask').fadeIn(1000);
            $('#mask').fadeTo("slow", 0.8);

            //Get the window height and width
            var winH = $(window).height();
            var winW = $(window).width();

            //Set the popup window to center
            $(id).css('top', winH / 2 - $(id).height() / 2);
            $(id).css('left', winW / 2 - $(id).width() / 2);

            //transition effect
            $(id).fadeIn(2000);

        });

        //if close button is clicked

        $('.window .close').click(function(e) {
            //Cancel the link behavior
            e.preventDefault();

            $('#mask').hide();
            $('.window').hide();
        });

        //if mask is clicked
        $('#mask').click(function() {
            $(this).hide();
            $('.window').hide();
        });
    }
    function closeModal() {
        $('#dialog-form-print').modal('close');
    }
    function submitOrder() 
    {       
        var Cookies_Var = "";
        var alertString = String("");        
        if (document.getElementById('BD').checked == true) {
            alertString += "1,";

            Cookies_Var="BD|"            
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('LP').checked == true) {
            Cookies_Var = Cookies_Var+"LP|"
            alertString += "2,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('GP').checked == true) {
            Cookies_Var = Cookies_Var + "GP|"
            alertString += "3,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('MC').checked == true) {
            Cookies_Var = Cookies_Var + "MC|"
            alertString += "4,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('CTP').checked == true) {
            Cookies_Var = Cookies_Var + "CTP|"
            alertString += "5,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('DP').checked == true) {
            Cookies_Var = Cookies_Var + "DP|"
            alertString += "6,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('SSR').checked == true) {
            Cookies_Var = Cookies_Var + "SSR|"
            alertString += "7,";
        }
        else {
            alertString += "786,";
        }       
        if (document.getElementById('LKP').checked == true) {
            Cookies_Var = Cookies_Var + "LKP|"
            alertString += "8,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('AP').checked == true) {
            Cookies_Var = Cookies_Var + "AP|"
            alertString += "9,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('SV').checked == true) {
            Cookies_Var = Cookies_Var + "SV|"
            alertString += "10,";
        }
        else {
            alertString += "786,";
        }
        
        if (document.getElementById('LalK').checked == true) {
            Cookies_Var = Cookies_Var + "LalK|"
            alertString += "11,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('KP').checked == true) {
            Cookies_Var = Cookies_Var + "KP|"
            alertString += "12,";
        }
        else {
            alertString += "786,";
        }

        //deepak June 6 2011
        if (document.getElementById('CD').checked == true) {
            Cookies_Var = Cookies_Var + "CD|"
            alertString += "13,";
        }
        else {
            alertString += "786,";
        }
        
       
        if (document.getElementById('YD').checked == true) {
            Cookies_Var = Cookies_Var + "YD|"
            alertString += "14,";
        }
        else {
            alertString += "786,";
        }        
        
        if (document.getElementById('FT').checked == true) {
            Cookies_Var = Cookies_Var + "FT|"
            alertString += "15,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('SnB').checked == true) {
            Cookies_Var = Cookies_Var + "SnB|"
            alertString += "16,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('AT').checked == true) {
            Cookies_Var = Cookies_Var + "AT|"
            alertString += "17,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('Pvarga').checked == true) {
            Cookies_Var = Cookies_Var + "Pvarga|"
            alertString += "18,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('kalsharp').checked == true) {
            Cookies_Var = Cookies_Var + "kalsharp|"
            alertString += "19,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('PlanetConsideration').checked == true) {
            Cookies_Var = Cookies_Var + "PlanetConsideration|"
            alertString += "20,";
        }
        else {
            alertString += "786,";
        }        
        if (document.getElementById('Check_ctr').checked == true) {
            Cookies_Var = Cookies_Var + "Check_ctr|"
            alertString += "21,";
        }
        else{
            alertString += "786";
        }
        
            if (alertString=="786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786") {
            alert("Please select atleast one check box.");
            return false;
        }        
        /*var r = confirm("Do You want to save print PDF report", "Save Print");
        if (r == true) {
            Create_Cookies(Cookies_Var);
        } */


        if (alertString != "") {            
             window.location = "Indexbox.asp?pagecounter=" + alertString           
        }
        closeModal();
    }

    /*function Create_Cookies(cookie_value) {
        $.cookie('Print_Cookies', cookie_value);
    }

    function get_Cookies() {
        var str = $.cookie('Print_Cookies');
        if (str != null) {
            var cookies_val = str.split("|")
            for (i = 0; i < cookies_val.length - 1; i++) {
                $('#' + cookies_val[i]).attr('checked', 'checked');
            }
        }
    }*/
   
    function Check(chk) {
        if (document.orderForm.Check_ctr.checked == true) {
            for (i = 0; i < chk.length; i++)
                chk[i].checked = true;
        }
        else {
            for (i = 0; i < chk.length; i++)
                chk[i].checked = false;
        }

    }
    // End Of Print code in File menu
    // Notification
function create(template, vars, opts) {
        return $container.notify("create", template, vars, opts);
    }
   
