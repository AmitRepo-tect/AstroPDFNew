<%@page import="com.ojassoft.astrosagecloud.model.ConnectionService"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int languageCode = (Integer)session.getAttribute("languageCode");
Hindi hindi = new Hindi();
Local local = new Local();
MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle rBLogin = local.loadPropertiesFileNew("login",languageCode);
session.setAttribute("DONT_GOTO_HOME", "1");
ConnectionService connService = new ConnectionService();
%>
<script type="text/javascript">
   
    function validation() {
        if (document.getElementById('txtUserID').value == "") {
            alert('<%=rBLogin.getString("PLEASE_ENTER_USER_ID") %>')
            document.getElementById('txtUserID').focus();
            return false;
        }
        if (document.getElementById('txtPassword').value == "") {
            alert('<%=rBLogin.getString("PLEASE_ENTER_PASSWORD") %>')
            document.getElementById('txtPassword').focus();
            return false;
        }
        return true;
    }
   
    </script>
<div class="hdg-lg card">
	<h1><%=rbConstants.getString("LOGIN") %></h1>	
</div>
<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1 ui-paragraph-head padding-all">

<% String msg = request.getParameter("msg"); 
%>

<% if(msg!=null && !msg.equals("")){%>
	
		<div class="alert alert-danger center">
			<% if(msg.equals("0")){ %>
				<%=rBLogin.getString("YOU_ENTERED_THE_WRONG_USER_ID_OR_PASSWORD") %>
			<% } %>
		</div>
	
<% } %>
	<h6 class="red-text">*<%=rBLogin.getString("ALL_FORM_FIELDS_ARE_REQUIRED")%></h6>
		
			<form name="loginfrm" action="loginchk.jsp" method="post">
			<div class="row">
        <div class="input-field col s12 l12">
        <input type="text" class="inputtext" id="txtUserID" name="txtUserID" size="26" maxlength="50" autocomplete="off">
         
          <label for="txtUserID"><%=rbConstants.getString("USER_ID")%></label>
        </div>
        </div>
        
        <div class="row">
        <div class="input-field col s12 l12">
        <input type="password" class="inputtext" id="txtPassword" name="txtPassword" size="26" />
         
          <label for="txtPassword"><%=rbConstants.getString("PASSWORD")%></label>
        </div>
        </div>
        
        <div class="row">
        <div class="col s12 l12">        
        	<input type="checkbox" id="Staysignedin" value="1" name="Staysignedin" class="filled-in" />
        	<label for="Staysignedin"><%=rBLogin.getString("STAY_SIGN_IN") %></label>
        </div>
        </div>
        <input type="hidden" value=<%=Util.safestr(request.getParameter("refferurl")) %> name="refferurl" />
        
         <div class="center"> 
        <input type="submit" name="submit" onclick="return validation();" value="<%=rbConstants.getString("LOGIN") %>" class="btn amber darken-4 waves-effect waves-light">
       </div>
       
       <div class="form-group">
          <i class="pos or_txt"></i>
          </div>
       
       <div class="center"> 
       <a href="<%=connService.URL_FB_AUTH%>" class="btn fb-bg btn-style"> 
			<img src="images/icons/fb.png"> Log in with Facebook
			</a>
		
			<a	href="<%=connService.URL_GOOGLE_AUTH%>"
			class="btn google-bg btn-style"> <img src="images/icons/gmail.png"> Log in with Google
			</a>
			
			</div>
        
        
		<div class="center mrt-20"  align="center">
			<p style="text-align:center;">
				<%=rBLogin.getString("DONT_HAVE_A_USER_ID") %>
				<a href="signup.asp" style="text-decoration: underline;">
					<b>
						<%=rbConstants.getString("SIGN_UP") %>
					</b>
				</a>
				| 
				<b>
					<a style="text-decoration: underline;" href="http://www.astrosage.com/forgetPassword.asp">
						<%=rBLogin.getString("FORGOT_PWD") %>
					</a>
				</b>
				| 
				<b>
					<a style="text-decoration: underline;" href="http://www.astrosage.com/forgetUserid.asp">
						<%=rBLogin.getString("FORGOT_USERNAME") %>
					</a>
				</b>
			</p>
			
			
		</div>
	</form>	
</div>
</div>
</div>





<div class="row mrt-30">
<div class="col s12 l12">
<div class="card hdg-lg1 ui-paragraph-head padding-all">
<%if (languageCode == 1){ %>
	<h2>एस्ट्रोसेज के बारे में</h2>
	<p>एस्ट्रोसेज डॉट कॉम मुख्य रूप से पंडित पुनीत पांडेय के दिमाग की उपज है। साल 2000 से ही वो लोगों को ज्योतिष के राजों से लाभ पहुंचाने का प्रयत्न कर रहे हैं। उनके द्वारा बोये गए इस बीज ने अब एक पेड़  का स्वरुप ले लिया है जिसकी जड़ें जमीन में है लेकिन शाखाएं आसमान की उंचाईयों को छूने का जज़्बा रखती हैं।  </p> 
	<p>ये कंपनी ज्योतिष को तकनीक से जोड़कर पेश करती है। ज्योतिषीय गणनाओं की सटीक भविष्यवाणी करने वाली वेबसाइट एस्ट्रोसेज ज्योतिष के क्षेत्र में दुनिया में नंबर वन है। जो लोग अपनी समस्याओं का समाधान ढूँढना चाहते हैं वो एस्ट्रोसेज मोबाइल ऐप या वेबसाइट का इस्तेमाल करके लाभ उठा सकते हैं। वहीं जो लोग ज्योतिष विज्ञान को गहराई से जानना चाहते हैं उनके लिए भी एस्ट्रोसेज एक लाभदायक वेबसाइट है। </p> 
	<p>एस्ट्रोसेज अपने आप में प्रमाणिकता का एक निशान है। ये एक ऐसा प्लेटफार्म है जहाँ आपको  अपनी समस्याओं को बताने में संकोच करने की आवश्यकता नहीं है। एस्ट्रोसेज के विशेषज्ञ आपकी समस्याओं के समाधान में कोई कमी नहीं छोड़ते हैं। हमारा उद्देश्य इस आधुनिक युग में लोगों को वैदिक ग्रंथों और ज्योतिष के वरदान से अवगत करवाना है। </p>
	<h2>एस्ट्रोसेज क्लाउड सेवाएं </h2>
	<p>अब हम आंकड़े और डेटा का उपयोग करके भविष्यवाणियां करना सीख रहे हैं, जबकि हमारे पूर्वजों ने हजारों साल पहले ऐसा किया था, वह भी बहुत सटीकता के साथ। एस्ट्रोसेज क्लाउड सेवाएं उसी स्तर का विश्वास और विश्वसनीयता लाती हैं जो ऋषि मुनियों ने सुनहरे काल में स्थापित किया था। हम कुंडली, आकस्मिक रिपोर्ट, लग्न चार्ट, लाल किताब कुंडली, जीवन रिपोर्ट, साढ़े साती रिपोर्ट, वर्ष विश्लेषण, गोचर फल या पारगमन रिपोर्ट, लव कुंडली, मंगल दोष और दशा फल विश्लेषण सहित कई मुफ्त रिपोर्ट प्रदान करते हैं।</p>
	<p>एस्ट्रोसेज क्लाउड आपको प्रदान की जाने वाली सेवाओं की एक विस्तृत श्रृंखला प्रस्तुत कर रहा है। यहाँ आपको अपनी कुंडली बनाने के लिए सबसे पहले खुद को पंजीकृत करना होगा और इसे दूसरों के साथ साझा करने या इसका प्रिंट निकालने के लिए कुछ बेहद आसान चरणों का पालन करना होगा। हमारे द्वारा जारी इस विस्तृत कुंडली में आपको अपने ग्रहों की दशा का ज्ञान होगा। इसके अलावा आपको चालित तालिका, पृथ्वीशक्तिवर्गा टेबल, आदि की भी जानकारी मिलेगी। </p>
	<p>आप अपनी पसंद के अनुसार वैदिक ज्योतिषीय गणना, भविष्यवाणी के लिए लाल किताब या केपी प्रणाली का भी चयन कर सकते हैं।</p>
	<p>हमारी ये क्लाउड सेवा आपको अपनी पसंदीदा भाषा चुनने का भी विकल्प देती है। जन्मकुंडली मिलान करना या विशेषज्ञ से परामर्श करना इससे आसान कभी नहीं था। एस्ट्रोसेज, ज्योतिष विज्ञान का प्रणेता आपकी सुविधा अनुसार आपको राह दिखाता है। </p>

<%}else{ %>
	<h2>About AstroSage</h2>
	<p>AstroSage.com is the brain-child of Pt. Punit Pandey who, since 2000, is trying to benefit the mankind with the secrets of astrology. The seeds sown have taken the shape of a tree with its roots deep inside the ground and branches having the capability to embark upon the sky. </p> 
	<p>The company focuses on bringing astrology closer to technology. AstroSage holds the title of being the number one in astrology in the world. Be it the mobile applications or website, a platform is offered by AstroSage to those who seek solutions for their problems and those who wish to pursue research for the development of this underrated science.</p> 
	<p>AstroSage is the mark of authenticity. It is one such place where you do not need to hesitate in sharing your problems. Experts at AstroSage leave no stone unturned in solving your queries. The aim here is to make the modern world know and accept the greatness of Vedic scriptures and the gift of astrology. </p>
	<h2>About AstroSage Cloud Services </h2>
	<p>We are now learning to make predictions using stats and data, while our ancestors could do it thousands of years ago, that too, with great precision. AstroSage Cloud Services bring the same level of trust and reliability that a rishi from the golden period could offer. We offer a number of free reports including Kundli, Ascendant report, Lagna chart, Lal Kitab Horoscope, Life report, Sade Sati report, Year analysis, Gochar phal or transit report, Love horoscope, Mangal dosha and Dasha Phal analysis.</p>
	<p>AstroSage Cloud offers you a wide range of services to choose from. All you need to do is register yourself and follow simple steps to make your kundli, save or share it with someone or print it. The detailed kundli gives you information about the planetary position in your kundli, the dashas as well as different tables like Chalit table, Prastharashtakvarga table, etc. You may opt for Vedic astrological calculations or Lal Kitab or KP system of prediction as per your choice. The cloud service even gives you the choice of language. Matching horoscopes or consulting an expert can not get easier than this. AstroSage, the world leader of Astrology - guides your way at your convenience. </p> 

<%} %>

</div>
</div>
</div>
