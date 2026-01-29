<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<% 
Local local_feedBack = new Local();

int languageCodeFeed = (Integer)session.getAttribute("languageCode");
MyProperties rBConstantsFeedBack = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBFeedBackForm = local_feedBack.loadPropertiesFileNew("feedbackform", languageCodeFeed);
%>
<%
String useridval="",horoobjname="",horoobjplace="",horoobjtimezone="",horoobjdob="",horoobjtob="",horoobjlatitude="",horoobjlongitude="",horoobjayanamsa="",horoobjdst="";
if(session.getAttribute("HoroscopeObj")!=null && !session.getAttribute("HoroscopeObj").equals("")) {
 DesktopHoro myAstrologyObjectFeedBack = (DesktopHoro)session.getAttribute("HoroscopeObj");
 SharedFunction shr_FeedBack = new SharedFunction();
 
 useridval = "<b>User Id:</b> "+ session.getAttribute("User_Id")+"<br/>"; 
 horoobjname = "<b>Name:</b> "+ myAstrologyObjectFeedBack.getName()+"<br>";
 horoobjplace = "<b>Place:</b> "+ myAstrologyObjectFeedBack.getPlace()+"<br>";
 horoobjtimezone = "<b>Timezone:</b> "+myAstrologyObjectFeedBack.getTimeZone()+"<br>";
 horoobjdob = "<b>Date(dd/mm/yyyy):</b> "+myAstrologyObjectFeedBack.getDayOfBirth() + " - " +	myAstrologyObjectFeedBack.getMonthOfBirth() +" - "+myAstrologyObjectFeedBack.getYearOfBirth()+"<br>";
 horoobjtob = "<b>Time:</b> "+myAstrologyObjectFeedBack.getHourOfBirth() + " : " +	myAstrologyObjectFeedBack.getMinuteOfBirth() +" : "+  myAstrologyObjectFeedBack.getSecondOfBirth()+"<br>";
 horoobjlatitude = "<b>Latitude:</b> "+myAstrologyObjectFeedBack.getDegreeOfLattitude() + " : " + myAstrologyObjectFeedBack.getMinuteOfLattitude() + " : " +myAstrologyObjectFeedBack.getNorthSouth() +"<br>"; 
 horoobjlongitude = "<b>Longitude:</b> "+ myAstrologyObjectFeedBack.getDegreeOfLongitude() + " : " + myAstrologyObjectFeedBack.getMinuteOfLongitude() + " : " +myAstrologyObjectFeedBack.getEastWest() +"<br>";
 //horoobjayanamsa = "<b>Ayanamsa:</b> "& myAstrologyObject.getAyanamsaType &","&getAyan(myAstrologyObject)&"<br/>"
 horoobjayanamsa = "<b>Ayanamsa:</b> "+ shr_FeedBack.getAyan(myAstrologyObjectFeedBack)+"<br/>";
 horoobjdst = "<b>DST:</b> "+myAstrologyObjectFeedBack.getDST() +"<br/>";
 
}
%>

<style type="text/css">
form input#feedname, #feedemail, #feedphone, #feedmessage{
	border: 1px solid #a7a6aa;
	background-image: url(/images/form-text-box.gif);
	background-repeat:repeat-x;
   -webkit-border-top-left-radius: 4px;
   -webkit-border-top-right-radius: 4px;
   -webkit-border-bottom-left-radius: 4px;
   -webkit-border-bottom-right-radius: 4px;
   -moz-border-radius:4px 4px 4px 4px;
   -khtml-border-radius:4px 4px 4px 4px;
    border-radius:4px 4px 4px 4px;
    margin-bottom: 5px;
	margin-right:5px;
	height:23px;
	color:#800000;
	line-height:20px;
	padding-left:3px;
   	}
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('#dialog-form-feedback').dialog({
            autoOpen: false,
            title: '<%=rBConstantsFeedBack.getString("FEEDBACK") %>',
            width: 580,
            height: 450,
            modal: true,
            open: function (event, ui) {
                $(event.target).parent().css('position', 'fixed');
                $(event.target).parent().css('top', '100px');
                $(event.target).parent().css('center');
                $(event.target).parent().css('z-index', '1001');
            },
            buttons: {
                '<%=rBConstantsFeedBack.getString("SEND_FEEDBACK") %>': function () {
                    if (absubmitOrder()) {

                        $('#progessbar').html('<img src="/cloud/images/loading1.gif">');
                        var getReturnObj = $.get('/cloud/sendfeedbackdata.jsp', $('#feedbackfrm').serialize(), function (data) {
                            var myObject = eval('(' + data + ')');
                            if ((myObject.success == 1) && (status = "success")) {
                                $('#progessbar').html('');
                                $('#msgdiv').css('color', 'Green');
                                updateMsg('<%=rBFeedBackForm.getString("THANKS_FOR_YOUR_FEEDBACK")%>');
                            }
                            else {
                                $('#progessbar').html('');
                                $('#msgdiv').css('color', 'Red');
                                updateMsg('<%=rBFeedBackForm.getString("MAIL_NOT_SEND") %>');
                            }
                        });
                        getReturnObj.error(function (jqxhr, textStatus, errorThrown) {
                            if (textStatus == "error") {
                                $('#progessbar').html('');
                                $('#msgdiv').css('color', 'Red');
                                updateMsg('<%=rBFeedBackForm.getString("MAIL_NOT_SEND") %>');
                            }
                        });
                    }
                },
                '<%=rBConstantsFeedBack.getString("CLOS") %>': function () {
                    //var urltohit = location.href;
                    //urltohit1 = urltohit.substring(0, (urltohit.length) - 1);
                    //window.location.href = urltohit1;
                    $("#dialog-form-feedback").dialog('close'); 
                }
            }
        })
    });

    function openfeedbackform() {
        $('#dialog-form-feedback').dialog('open');
    }

    function updateMsg(t) {
        $('#msgdiv').addClass('ui-state-highlight')
        $('#msgdiv').html(t);
        setTimeout(function () {
            $('#msgdiv').removeClass('ui-state-highlight', 1500);
        }, 500);
    }

    /*function resetFormFields() {
        document.forms['frm'].reset();
    }*/


    function absubmitOrder() {
        var isr = '<%=rBFeedBackForm.getString("IS_REQUIRED")%>';
        var emailval = document.getElementById('feedemail').value;
        if (document.getElementById('feedname').value == "") {
            $('#msgdiv').css('color', 'Red');
            $('#msgdiv').css('font-weight', 'Bold');
            updateMsg('<%=rBFeedBackForm.getString("EMPTY_NAME")%>' + isr);
            document.getElementById('feedname').focus();
            return false;
        }

        if (!emailval.match(/^([a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,4}$)/i)) {
            $('#msgdiv').css('color', 'Red');
            $('#msgdiv').css('font-weight', 'Bold');
            updateMsg('<%=rBFeedBackForm.getString("VALID_EMAIL")%>' + isr);
            document.getElementById('feedemail').focus();
            return false;
        }

        if (document.getElementById('feedphone').value != "") {
            if (isNaN(document.getElementById('feedphone').value)) {
                $('#msgdiv').css('color', 'Red');
                $('#msgdiv').css('font-weight', 'Bold');
                updateMsg('<%=rBConstantsFeedBack.getString("VALID_PHONE_NUMBER")%>');
                document.getElementById('feedphone').focus();
                return false;
            }
        }
        if (document.getElementById('feedmessage').value == "") {
            $('#msgdiv').css('color', 'Red');
            $('#msgdiv').css('font-weight', 'Bold');
            updateMsg('<%=rBFeedBackForm.getString("VALID_MESSAGE")%>' + isr);
            document.getElementById('feedmessage').focus();
            return false;
        }
        return true;
    }    
</script>

<div id="dialog-form-feedback" title="Feedback" style="display:none;">
<!--<form action="feedback.asp" method="get" onsubmit="return myValidation1(this)" name="frm" id="feedbackfrm">-->
<form action="feedback.asp" method="post" onsubmit="return myValidation1(this)" name="frm" id="feedbackfrm">
<div id="msgdiv" style="height:20px; width:85%; margin-bottom:10px; padding-left:5px; margin-left:6px;">
</div>

<div id="frmfeedback" style="padding-left:5px;">
 <table>
 <tr>
 <td width="50%"><%=rBFeedBackForm.getString("NEM") %> *</td>
 <td><input type="text" id="feedname" name="feedname" size="36" maxlength="50"></td>
 </tr>
 <tr>
 <td width="50%"> <%=rBConstantsFeedBack.getString("EMAIL") %> *</td>
 <td><input type="text" id="feedemail" name="feedemail" size="36" maxlength="90"/></td>
 </tr>
 <tr>
 <td width="50%"><%=rBConstantsFeedBack.getString("PHONE") %> </td>
 <td> <input type="text" id="feedphone" name="feedphone" size="36" maxlength="10"></td>
 </tr>
 <tr>
 <td width="50%"><%=rBFeedBackForm.getString("SUGGESTIONS") %> *</td>
 <td> <textarea  style="width:230px; height:150px;" class="inputtextarea" cols="100" name="feedsuggestion" id="feedmessage" rows="5" onkeypress="limitcharById('feedmessage','lengthofchar',500);" onkeydown="limitcharById('feedmessage','lengthofchar',500);" onkeyup="limitcharById('feedmessage','lengthofchar',500);"></textarea><br />
  <%=rBConstantsFeedBack.getString("REMAINS_CHAR") %> (<span id="lengthofchar">500</span>)</td>
 </tr>
 
 </table>

 <span id="progessbar"></span>
</div>
 
<div style="margin-left:21%; text-align:center; border: 0px solid; width:78%">
    <input type="hidden" name="useridsession" value="<%=useridval %>" />
    <input type="hidden" name="horoobjname" value="<%=horoobjname %>" />
    <input type="hidden" name="horoobjplace" value="<%=horoobjplace %>" />
    <input type="hidden" name="horoobjtimezone" value="<%=horoobjtimezone %>" />
    <input type="hidden" name="horoobjdob" value="<%=horoobjdob %>" />
    <input type="hidden" name="horoobjtob" value="<%=horoobjtob %>" />
    <input type="hidden" name="horoobjlongitude" value="<%=horoobjlongitude %>" />
    <input type="hidden" name="horoobjlatitude" value="<%=horoobjlatitude %>" />
    <input type="hidden" name="horoobjayanamsa" value="<%=horoobjayanamsa %>" />
    <input type="hidden" name="horoobjdst" value="<%=horoobjdst %>" />
    <input type="hidden" value="<%=request.getRequestURL()%>" name="urlval" id="urlval" />
</div>   
 </form>
 </div>