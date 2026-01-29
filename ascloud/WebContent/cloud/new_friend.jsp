<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.I_SendMail"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<script type="text/javascript" src="/cloud/js/validation.js"></script>
<%
sendMail(request, response);
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle newFriend = local.loadPropertiesFileNew("friend",languageCode);
String msg = "",msgg ="";

if(request.getAttribute("msgResult")!=null && !request.getAttribute("msgResult").equals("")){
	msgg = newFriend.getString("THANK_YOU_FOR_RECOMMENDATION");
}

%>

<div class="hdg-lg card">
	<h1><%=newFriend.getString("REFER_FRIEND") %></h1>	
</div>
<div class="mrt-30 mrb-30"> 
<div class="card ui-paragraph-head padding-all"> 
<%if(msgg.equals("")){%>
<h5><%=newFriend.getString("RECOMMEND_THIS_WEBSITE") %></h5>
<p>
								<%=newFriend.getString("INTROTEXT") %>
							</p>





<div id="main-content"> 
<form method="post" name="frm" action="friend.asp">
<div class="row">
        <div class="input-field col s12">
          <input type="text" class="inputtext" name="yourname" id="yourname" maxlength="50"/>
          <label for="yourname"> <%=newFriend.getString("YOUR_NAME")%> * </label>
        </div>
        </div>
        
        <div class="row">
        <div class="input-field col s12">
          <input type="text" class="inputtext" name="youremail" id="youremail" maxlength="50" />
          <label for="youremail"> <%=newFriend.getString("YOUR_EMAIL_ID")%> *</label>
        </div>
        </div>
        
        <div class="row">
        <div class="input-field col s12">
          <input type="text" class="inputtext" name="name" id="friendname" maxlength="50"  />
          <label for="youremail"> <%=newFriend.getString("YOUR_FRIENDS") %><%=rBConstants.getString("KA") %> &nbsp;<%=rBConstants.getString("NAM")%>* </label>
        </div>
        </div>
        
        <div class="row">
        <div class="input-field col s12">
          <input type="text" class="inputtext" name="email" id="friendemail" maxlength="50" />
          <label for="youremail"> <%=newFriend.getString("YOUR_FRIENDS") %><%=rBConstants.getString("KI") %>&nbsp;<%=newFriend.getString("EMAIL_ID")%> * </label>
        </div>
        </div>
        
        <div class="row center">
        <div class="input-field col s12">
          <button type="submit" value="friend" name="methodName"
											class="waves-effect waves-light btn amber darken-4 box-shadow"
											onclick="return checkValidation();" /><%=newFriend.getString("SEND")%></button>
											
											
         <button name="resetBtn"
											type="button" value="<%=rBConstants.getString("RESET") %>"
											class="waves-effect waves-light btn amber darken-4 box-shadow" onclick="this.form.reset();"/> <%=rBConstants.getString("RESET") %></button>
        </div>
        </div>
        </form>
</div>
</div>
	
	
	<% }else{ %>
 
	<center>
		<div class="msgcls" align="center">
			<div class="boxhdg">
				<%=msgg%>
			</div>
			<div>
				<a href="friend.asp" class="waves-effect waves-light btn amber darken-4 white-text"> <%=newFriend.getString("BACK_TO_REFER_FRIEND_PAGE") %></a>
			</div>
		</div>
	</center>
	
	<% } %>
	
</div>
<%!
public void sendMail(HttpServletRequest request, HttpServletResponse response)
{
	String youremail = Util.safestr(request.getParameter("youremail"));
	String yourname = Util.safestr(request.getParameter("yourname"));
	String name = Util.safestr(request.getParameter("name"));
	String emailto = Util.safestr(request.getParameter("email"));
	String headerMsg = "";
	String footerMsg = "<br/><br/><div style='line-height:15px;font-size:11px;font-family:Arial;color:rgb(119,119,119);padding:0px 0px 10px'>This message was sent to&nbsp;"+ConstantValues.MAILREPLYTO+"<br>Ojas Softech Pvt. Ltd., Attention: A-139, Sector 63, Noida (UP) INDIA</div><div style='font-family:arial,sans-serif;font-size:13px' align='center'><b><a href='https://play.google.com/store/apps/details?id=com.ojassoft.astrosage&referrer=utm_source=astrosageemail&utm_medium=email&utm_content=footer&utm_campaign=mobileapp' target='_blank'>Love us? Download AstroSage Kundli Software Mobile App.</a></b></div></div><div style='font-family:arial,sans-serif;font-size:13px' align='center'><br></div><div style='font-family:arial,sans-serif' align='center'><font size='1'><a href='http://www.astrosage.com/about-us.asp' target='_blank'>About Us</a> | <a href='http://www.astrosage.com/privacy-policy.asp' target='_blank'>Privacy Policy</a> | Unsubscribe | &copy; AstroSage.com</font></div>";
	String isShowMAilHeader = "";
	String isShowMailFooter = "";
	
	I_SendMail send = new I_SendMail();
	String subject = "Free Horoscope Matching & Astrology website";
	String body = "You would like this excellent astrology website www.astrosage.com. It has lots of free astrology stuff like free horoscope matching, free birth chart (janampatri/kundli) and free daily horoscope etc. Please check it out - <a href=http://www.AstroSage.com>http://www.AstroSage.com</a>";
	try
	{
	    
	    if(!name.equals("") && !emailto.equals(""))
	    {
	        body = "<b>Hello "+name+"</b>,<br>"+body;
	        send.sendMail(emailto,subject, body,headerMsg,footerMsg,isShowMAilHeader,isShowMailFooter,youremail);
	       // sendmail emailto,"info@astrosage.com",subject,body,youremail
	    
	        request.setAttribute("msgResult",ConstantValues.MAIL_SEND_SUCCESSFULLY);
	    }
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
}
%>