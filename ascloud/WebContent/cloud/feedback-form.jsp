<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
Local feedLocal = new Local();
int feedLang = Util.safeInt(session.getAttribute("languageCode"));
MyResourceBundle rBFeedBackForm = feedLocal.loadPropertiesFileNew("feedbackform", feedLang);

Object objfeed = session.getAttribute("constants");
MyProperties Constants = null;
if(objfeed != null)
{
	Constants = (MyProperties) objfeed;
}
else
{
	Constants = new MyProperties(feedLocal.loadPropertiesFile("constants", feedLang));
	session.setAttribute("constants", Constants);
}

String userid = Util.safestr(session.getAttribute("User_Id"));
%>
<%
String userIdVal ="",horoObjName="",horoObjPlace="",horoObjTimezone="",horoObjDob="",horoObjTob="";
String horoObjLatitude="",horoObjLongitude="",horoObjAyanamsa="",horoObjDst="";
if(session.getAttribute("HoroscopeObj")!=null) {
DesktopHoro toolHoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
userIdVal = "<b>User Id:</b> "+ userid+"<br/>"; 
horoObjName = "<b>Name:</b> "+ toolHoro.getName()+"<br>";
horoObjPlace = "<b>Place:</b> "+ toolHoro.getPlace()+"<br>";
horoObjTimezone = "<b>Timezone:</b> "+toolHoro.getTimeZone()+"<br>";
horoObjDob = "<b>Date(dd/mm/yyyy):</b> "+toolHoro.getDayOfBirth() + " - " + toolHoro.getMonthOfBirth() +" - "+ toolHoro.getYearOfBirth()+"<br>";
horoObjTob = "<b>Time:</b> "+toolHoro.getHourOfBirth() + " : " +	toolHoro.getMinuteOfBirth() +" : "+  toolHoro.getSecondOfBirth()+"<br>";
horoObjLatitude = "<b>Latitude:</b> "+toolHoro.getDegreeOfLattitude() + " : " + toolHoro.getMinuteOfLattitude() + " : " +toolHoro.getNorthSouth() +"<br>"; //'ns 
horoObjLongitude = "<b>Longitude:</b> "+ toolHoro.getDegreeOfLongitude() + " : " + toolHoro.getMinuteOfLongitude() + " : " + toolHoro.getEastWest() +"<br>"; //ew
horoObjAyanamsa = "<b>Ayanamsa:</b> "+ SharedFunction.getAyan(toolHoro)+"<br/>";
horoObjDst = "<b>DST:</b> "+toolHoro.getDST() +"<br/>";
}

%>

<script type="text/javascript">

    $(document).ready(function() {
    	
       $(".send-feed").click(function() {
                    if (absubmitOrder()) {
                        $('#progessbar').html('<div class="progress"><div class="indeterminate"></div></div>');
                        var getReturnObj = $.get('sendfeedbackdata.jsp', $('#feedbackfrm').serialize(), function(data) {
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
                        getReturnObj.error(function(jqxhr, textStatus, errorThrown) {
                            if (textStatus == "error") {
                                $('#progessbar').html('');
                                $('#msgdiv').css('color', 'Red');
                                updateMsg('<%=rBFeedBackForm.getString("MAIL_NOT_SEND") %>');
                            }
                        });
                    }
                });
        
        		$(".close-feed").click(function() {
                    var urltohit = location.href;                   
                    urltohit1 = urltohit.substring(0, (urltohit.length) - 1);
                    window.location.href = urltohit1;
                });
        
        
        
    });
    function openfeedbackform() {
    	//alert("hii");
	   	var url = window.location.href;
    	document.getElementById("urlval").value = url;
        $('#dialog-form-feedback').modal('open');
    }
    function updateMsg(t) {    	
    	$('#msgdiv').addClass('ui-state-highlight')
        $('#msgdiv').html('<div class="center-align alert-box">' + t + '</div>');
        setTimeout(function() {
        $('#msgdiv').removeClass('ui-state-highlight', 1500);
        }, 500);
    }
    function resetFormFields() {
        document.forms['frm'].reset();
    }


    function absubmitOrder() {
        var isr = '&nbsp;<%=rBFeedBackForm.getString("IS_REQUIRED")%>';
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
                updateMsg('<%=Constants.getString("VALID_PHONE_NUMBER")%>');
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



<div id="dialog-form-feedback" title="Feedback" class="modal model-bar model-width">
  <div class="model-header amber darken-1">
<h4 class="white-text padding-all-5"><%=Constants.getString("FEEDBACK") %>
 <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i class="material-icons">close</i></a> 
</h4>
</div>
<div class="modal-content">

<div id="basic-form" class="section">
 
    <form action="feedback.asp" method="post" onsubmit="return myValidation1(this)" name="frm" id="feedbackfrm" class="col s12 clearfix">
    
      <div id="msgdiv" class="clearfix"></div>
      
      <div id="frmfeedback">
      <div class="row">
        <div class="input-field col s12">
          <input id="feedname" type="text" name="feedname">
          <label for="first_name"><%=rBFeedBackForm.getString("NEM") %> *</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="feedemail" type="email" name="feedemail">
          <label for="email"><%=Constants.getString("EMAIL") %> *</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="feedphone" type="number" name="feedphone">
          <label for="number"><%=Constants.getString("PHONE") %></label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <textarea class="inputtextarea materialize-textarea" cols="100" name="feedsuggestion"
							id="feedmessage" rows="5"
							onkeypress="limitcharById('feedmessage','lengthofchar',500);"
							onkeydown="limitcharById('feedmessage','lengthofchar',500);"
							onkeyup="limitcharById('feedmessage','lengthofchar',500);"></textarea>
          <label for="feedmessage"><%=rBFeedBackForm.getString("SUGGESTIONS") %> *</label>
          
          <%=Constants.getString("REMAINS_CHAR") %> (<span id="lengthofchar">500</span>)
        </div>
      
         
         <span id="progessbar"></span>
         
         <div
			style="margin-left: 21%; text-align: center; border: 0px solid; width: 78%">
			<input type="hidden" name="useridsession" value="<%=userIdVal %>" />
			<input type="hidden" name="horoobjname" value="<%=horoObjName %>" />
			<input type="hidden" name="horoobjplace" value="<%=horoObjPlace %>" />
			<input type="hidden" name="horoobjtimezone"
				value="<%=horoObjTimezone %>" /> <input type="hidden"
				name="horoobjdob" value="<%=horoObjDob %>" /> <input type="hidden"
				name="horoobjtob" value="<%=horoObjTob %>" /> <input type="hidden"
				name="horoobjlongitude" value="<%=horoObjLongitude %>" /> <input
				type="hidden" name="horoobjlatitude" value="<%=horoObjLatitude %>" />
			<input type="hidden" name="horoobjayanamsa"
				value="<%=horoObjAyanamsa %>" /> <input type="hidden"
				name="horoobjdst" value="<%=horoObjDst %>" /> <input type="hidden"
				value="" name="urlval" id="urlval" />
		</div>
       </div>
      </div>
    </form>
  </div>
	</div>
	
	<div class="modal-footer">     
      <a href="javascript:void(0);" class="modal-action waves-effect waves-red btn-flat text-orange send-feed"><%=Constants.getString("SEND_FEEDBACK") %></a>
      <a href="javascript:void(0);" class="modal-action waves-effect waves-red btn-flat text-orange modal-close"><%=Constants.getString("CANCEL") %></a>
    </div>
</div>