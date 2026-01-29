<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
    if(session.getAttribute("languageCode").equals("")) {
       session.setAttribute("languageCode",0);
     }
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle blog = local.loadPropertiesFileNew("blog",languageCode);
%>

<div class="hdg-lg card">
	<h1><%=blog.getString("ASTROSAGE_BLOG")%></h1>	
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<div id="divhead">
				<h5> 	<% if(session.getAttribute("languageCode").equals("1")){ %>
					<%="'आज का भविष्यफल' अब उपलब्ध है हिन्दी और तमिल में, साथ ही और भी बहुत कुछ (मंगल, जून २३, २०१५)"%>
					<%}else{ %>
					<%="'My Day Today' is now available in Hindi, Tamil & More (Tuesday, June 23, 2015)"%>
					<%}%></h5>
				</div>
				
				
				<% if(session.getAttribute("languageCode").equals("1")){%>
				<p>आज हम लेकर आए हैं एस्ट्रोसेज क्लाउड
					का नया संस्‍करण बहुत-सी नयी सुविधाओं के साथ। आइये जानते हैं इन नई
					सुविधाओं के बारे में -</p>
				<ol>
					<li>"आज का भविष्यफल" अब हिन्दी और तमिल में भी उपलब्ध है ।</li>
					<li>अनावश्यक आने वाले शब्दों को दूर कर दिया गया है।</li>
					<li>अस्त और ग्रहण की गणना मे सुधार किया गया है।</li>
					<li>अन्‍य कई छोटे-मोटे सुधार किए गए हैं।</li>
				</ol>
				<h5>1. "आज का भविष्यफल" हिन्दी और तमिल
					में</h5>
				<p>
					दैनिक भविष्यफल (जन्म कुण्डली के अनुसार दैनिक भविष्यफल) अब हिन्दी और
					तमिल दोनों भाषाओं में उपलब्ध है। अपने उपयोक्ताओं की मांगो को ध्यान
					में रखते हुए हमने आज का भविष्यफल हिन्दी और तमिल दोनों भाषाओं में
					उपलब्ध कराया है। कुछ तकनीकि कारणों की वजह से यह केवल अंग्रेज़ी में
					मौजूद था। <a href="#readmore" style="text-decoration: underline;">हमारा
						भविष्यफल कैसे कार्य करता है इसे जानने के लिए कृपया नीचे पढ़ें।</a>
				</p>
				<h5>2. अनावश्यक आने वाले शब्दों की
					पहचान</h5>
				<p id="readmore">हमने काफ़ी जाँच के बाद
					पाया कि ऐस्ट्रोसेज क्लाउड कई बार बेकार की वर्णों को दिखाता था। यह
					त्रुटि दूसरी भाषा के शब्दों के सम्मिलित करने के दौरान आती थी। अब इस
					समस्या का समाधान कर दिया गया है। अब आप सुगमतापूर्वक अपना भविष्यफल
					जान सकते हैं।</p>
				<h5>3. अस्त और ग्रहण गणना में संशोधन</h5>
				<p>अस्त और ग्रहनों की गणना में एक
					त्रुटि पाई जाती थी जिसे ऐस्ट्रोसेज कुण्डली एॅप में तो ठीक कर दिया
					गया था परंतु ऐस्ट्रोसेज क्लाउड (वेबसाइट) में यह रह गया था। इस
					समस्या के कारण अस्त और ग्रहण की तिथियाँ सटीक नहीं आ पाती थीं। अब इस
					समस्या का समाधान कर दिया गया है।</p>
				<h5>आज का भविष्यफल कैसे कार्य करता है?
				</h5>
				<p>आपने “आज का भविष्‍यफल” के डिब्बे को
					एस्ट्रोसेज डॉट कॉम के दाहिने किनारे पर सबसे नीचे देखा होगा। इस
					सुविधा को हम अंग्रेज़ी में 'True Horoscope' कहते हैं। इस पर क्लिक
					करने के बाद अाप अपने दैनिक भविष्यफल से रूबरू होते हैं। ऐसी ढेरों
					वेबसाइट्स हैं जो आपको दैनिक भविष्यफल बताती हैं। तो फिर एस्ट्रोसेज
					का दैनिक भविष्यफल इन सबसे अलग कैसे है? आइए हम आपको कुछ तकनीकि
					जानकारियों से अवगत कराते हैं।</p>
				<p>जब आप भविष्यफल जानने के लिए
					हाइपरलिंक पर क्लिक करते हैं या भविष्यफल वाले पन्ने पर जाते हैं, तो
					निम्नलिखित क्रियाएँ होती है -</p>
				<ul>
					<li>ज़रूरत पड़ने पर एस्ट्रोसेज आपका जन्म-विवरण एस्ट्रोसेज
						डाटाबेस से स्वयं लेता है।</li>
					<li>यह आपकी कुण्डली बनाता है।</li>
					<li>यह वर्तमान समय के लिए आपकी गोचर कुण्‍डली बनाता है।</li>
					<li>यह ग्रहों की वर्तमान स्थिति को आपकी कुण्डली में बैठाता है।</li>
					<li>यह ज्योतिष की अत्याधुनिक पद्धति के.पी (कृष्णमूर्ती पद्धति)
						से आपके जन्म और गोचर कुण्‍डली का एक साथ विश्लेषण करता है और आपके
						जीवन के विभन्न पहलुओं जैसे - आर्थिक, पारिवारिक, व्यापारिक और भाग्य
						आदि से जुड़ी रेटिंग तय करता है।</li>
					<li>प्राप्त रेटिंग के आधार पर यह आपके जीवन के अलग-अलग आयामों
						से जुड़े वाक्यों को दर्शाता है।</li>
					<li>परिणामों के आधार पर प्राप्त वाक्यों को यह एक पैराग्राफ़ में
						संजोकर यह आपके सामने पेश करता है।</li>
				</ul>
				<p>आपको भविष्यवाणी दिखाने से पहले यह
					विभिन्न तकनीकी चरणों से गुज़रता है। इसलिए इसे इन्टरनेट का सबसे सटीक
					भविष्यफल माना जाता है।</p>
				<p>
					क्या कहता है आपका आज का भविष्यफल? <a
						href="/cloud/personalized-horoscope.asp?LanguageType=hindi"
						style="text-decoration: underline;"> अभी जानें अपना "आज का
						भविष्यफल"।</a>
				</p> <%} else{ %>
				<p>Today, we are rolling out quite a
					few new features in AstroSage Cloud as follows:</p>
				<ol>
					<li>My Day Today is now available in Hindi and Tamil</li>
					<li>Junk Characters issue resolved</li>
					<li>Combust & Eclipsed issue resolved</li>
					<li>Many other small fixes and improvements</li>
				</ol>
				<h5>1. My Day Today is now available
					in Hindi and Tamil</h5>
				<p>
					Personalized Daily Horoscope (Daily Horoscope based on your birth
					chart) is now available in Hindi and Tamil as well. It was a long
					pending demand of our users that the My Day Today (Personalized
					Daily Horoscope) should be made available in these languages. Due
					to some technical reasons, it was only available in English. <a
						href="#readmore" style="text-decoration: underline;">Please
						check below how our True Daily Horoscopes works.</a>
				</p>
				<h5>2. Junk Characters issue resolved
				</h5>
				<p id="readmore">We saw that sometimes
					AstroSage Cloud was showing some junk characters. The issue was due
					to some mistake in picking up some characters from another
					language. This issue is fixed now, so the text you will be getting
					will be more readable.</p>
				<h5>3. Combust & Eclipsed calculation
					issue resolved </h5>
				<p>There was a bug in combust and
					eclipsed calculation module, which was fixed on AstroSage Kundli
					App, but left out on AstroSage Cloud (website). This issue was
					sometimes giving incorrect dates of combust and eclipsed. This
					issue has also been fixed now.</p>
				<h5>How "My Day Today (True Daily
					Horoscope)" works?</h5>
				<p>You would have noticed the 'True
					Horoscope' box on the bottom right corner of AstroSage.com. After
					clicking on the hyperlink, it takes you to your personalized
					horoscopes. There are various websites that give you daily
					horoscopes. So, how the AstroSage.com 'True Horoscopes' are
					different from others? In this post, I would like to share some
					technical details with you.</p>
				<p>When you request your true
					horoscope by clicking the Hyperlink or visiting to the 'True
					Horoscope' page, following actions happen in a sequence:</p>
				<ul>
					<li>AstroSage fetches your birth details from the AstroSage
						database, if needed.</li>
					<li>It generates your birth-chart.</li>
					<li>It generates your transit chart (AKA Gochara Kundli in
						Hindi) for current moment.</li>
					<li>It puts the current planetary position (planetary
						positions in Transit) into your birth-chart.</li>
					<li>It analyzes combined format of your birth chart and
						transit chart using one of the most advanced systems of Vedic
						astrology called KP System or Krishnamurti Paddhati and assigns
						ratings to various aspects of your life like finance, family,
						fortune, and profession etc.</li>
					<li>It uses True Horoscope engine to pick up the right
						sentences matching to that rating for each aspect of life.</li>
					<li>It generates the result by combining all these sentences
						into one paragraph and displays it on screen.</li>
				</ul>
				<p>So, there are lots of technical
					details that goes on before you actually see your daily
					personalized predictions on the screen. It is the reason that we
					call it the most accurate daily horoscope on Internet.</p>
				<p>
					What is your personalized horoscope telling you today? <a
						href="/cloud/personalized-horoscope.asp?LanguageType=english"
						style="text-decoration: underline;"> Check out your True
						Horoscope today now.</a>
				</p> <% } %>
</div>
</div>
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
<div id="divhead">
				<h5> 	<% if(session.getAttribute("languageCode").equals("1")) { %>
					<%="एस्ट्रोसेज वर्कशीट - पाएँ सब कुछ अब एक ही जगह"%>
					<%}else{ %>
					<%="Free AstroSage Worksheet Is Live To Bless Astrologer’s Life!"%>
					<%} %></h5>
				</div>
				
				<% if(session.getAttribute("languageCode").equals("1")){ %>
				<p>हम आपके लिए लाए हैं एस्ट्रोसेज की नई
					वर्कशीट, जो कि इंटरनेट की दुनिया में सबसे आधुनिक ज्योतिषीय
					सॉफ़्टवेअर है। इसके माध्यम से आप लगभग दस गुना अधिक तीव्रता से
					कुण्डलियों का विश्लेषण कर पाएंगे। क्योंकि अब सारी आवश्यक कुंडलियाँ
					और तालिकाएँ आप एक ही स्क्रीन पर पा सकते हैं। 2004 में हमने क्लाउड
					आधारित ज्योतिष का सॉफ़्टवेअर बनाया था। 2009 में हमने मोबाइल के लिए
					ऍप बनाई और अब 2015 में हम आपके लिए लाए हैं एस्ट्रोसेज वर्कशीट, जो
					है अपने आप में ख़ास।</p>
				<div class="mrt-20 video-container" align="center">
					<iframe width="560" height="315" src="https://www.youtube.com/embed/WqLX1jy3Wsc" frameborder="0" allowfullscreen></iframe>
				</div>
				<h5>वर्कशीट में ख़ास</h5>
				<ul>
					<li>अपना स्क्रीन ख़ुद डिज़ाइन करें</li>
					<li>स्वयं के अनुसार ले-आउट बनाने के लिए स्वेच्छा से विजेट
						जोड़ें</li>
					<li>वही देखें जो आप वाक़ई देखना चाहते हैं</li>
					<li>विजेट लगाने के लिए ड्रेग एंड ड्रॉप करें</li>
					<li>ढेरों तालिकाओं और कुंडलियों के विजेट उपलब्ध</li>
					<li>उत्तर भारतीय व दक्षिण भारतीय कुंडली प्रकार उपलब्ध</li>
					<li>दो भाषाओं का विकल्प - हिन्दी व अंग्रेज़ी</li>
				</ul>
				<div class="mrt-20" align="center">
				</div>
				<p>
					<!--<a href="http://astrosage.com/cloud/worksheet/">अभी एस्ट्रोसेज वर्कशीट चलाकर देखें!</a></p>-->
					<a href="/cloud/worksheet/">अभी एस्ट्रोसेज वर्कशीट चलाकर देखें!</a>
				</p>
				<p>Please click here to read in Hindi</p>
				<h5>एस्ट्रोसेज वर्कशीट का उपयोग कैसे
					करें?</h5>
				<p>
					एस्ट्रोसेज वर्कशीट को इस्तेमाल करना बेहद ही आसान है। बस,
					एस्ट्रोसेज.कॉम में <a href="http://astrosage.com/kundli/"> <!--कुंडली</a> या <a href="http://astrosage.com/cloud/login.asp">लॉग इन</a>-->
						कुंडली
					</a> या <a href="/cloud/login.asp">लॉग इन</a> पर क्लिक करें और कोने में
					बने “वर्कशीट” बटन पर क्लिक करें। तुरन्त एस्ट्रोसेज वर्कशीट अपनी
					सारी फ़ीचर्स के साथ खुल जाएगी।
				</p>
				<h5>वर्कशीट की विशेषताएँ</h5>
				<p>एस्ट्रोसेज वर्कशीट की निम्न सुविधाएँ
					इसे ख़ास बनाती हैं:</p>
				<ol>
					<li>देखें एकाधिक कुंडलियाँ: जी हाँ, अब आप एक ही पन्ने पर
						पाएंगे बहुत-सी कुंडलियाँ।</li>
					<li>अपनी पसंद से बदलाव: अब आप अपनी सुविधा से कुंडलियों तथा
						तालिकाओं को वर्कशीट पर ड्रेग-एंड-ड्रॉप कर सकते हैं। आप वैसी
						वर्कशीट बना सकते हैं जैसी आप चाहें।</li>
					<li>कुंडलियाँ सहेजें: सभी कुंडलियों, सूचनाओं और किए गए काम को
						सुरक्षित सहेजकर रख सकते हैं।</li>
					<li>हिन्दी व अंग्रेज़ी में: वर्कशीट को देखें - हिन्दी या
						अंग्रेज़ी - अपनी मनपसंद भाषा में।</li>
					<li>उत्तर व दक्षिण भारतीय कुंडली प्रकार: जिस शैली में भी
						कुंडलियाँ देखना चाहें, आप देख सकते हैं।</li>
					<li>स्वतः सुरक्षित होने वाली वर्कशीट: आपने वर्कशीट में आख़िर
						में जो भी बदलाव किया है, अगली बार लॉग इन करने पर वर्कशीट उसी रूप
						में आपको मिलेगी।</li>
					<li>मिश्रित प्रदर्शन: आप जो भी चाहें, वह वर्कशीट में रख सकते
						हैं। विभिन्न कुंडलियों से लेकर तालिकाओं तक, सब कुछ अब आपको मिलेगा
						एक ही जगह।</li>
				</ol>
				<p>आपको सिर्फ़ ऊपर दाईं ओर “नया बॉक्स”
					बटन पर क्लिक करना है और नया डिब्बा आपकी वर्कशीट में जुड़ जाएगा। इसके
					बाद आप जो इसमें देखना चाहें, वह विकल्पों में से जोड़ सकते हैं।</p>
				<div class="mrt-20" align="center">
					<img src="/cloud/images/worksheet-02.jpg" class="responsive-img" width="560" />
				</div>
				<p>
					<!--<a href="http://astrosage.com/cloud/worksheet/">अभी एस्ट्रोसेज वर्कशीट चलाकर देखें!</a></p>-->
					<a href="/cloud/worksheet/">अभी एस्ट्रोसेज वर्कशीट चलाकर देखें!</a>
				</p>
				<p>जैसे ही आप “ऑप्शन्स” के बटन पर क्लिक
					करेंगे आपके सामने एक पॉप-अप आएगा; जिसमें आप 10 तरीक़ों की कुंडलियों,
					18 तालिकाओं और 14 वर्गों में से कुछ भी अपने मुताबिक़ चुन सकते हैं।
					इतना ही नहीं, हम यहाँ और भी विकल्प जोड़ रहे हैं, जो वर्कशीट के उपयोग
					को एक यादगार अनुभव में तब्दील कर देंगे।</p>
				<div class="mrt-20" align="center">
					<img src="/cloud/images/worksheet-04.jpg" class="responsive-img" width="450" />
				</div>
				<p>एस्ट्रोसेज वर्कशीट अंग्रेज़ी में
					दिखती है ऐसी!</p>
				<p>आइए एक नज़र डालते हैं कि अंग्रेज़ी में
					वर्कशीट की सुविधा कैसी दिखेगी -</p>
				<p>ज्योतिषियों तथा ज्योतिष के
					विद्यार्थियों के लिए वर्कशीट की यह सुविधा बेहद ख़ास है। साथ ही
					ज्योतिष के अभ्यास और गहन विश्लेषण में भी वर्कशीट अत्यन्त उपयोगी
					साबित होगी।</p>
				<h5>वर्कशीट की सुविधाएँ</h5>
				<ol>
					<li>अब आपको अलग-अलग कुंडलियाँ और दशा आदि देखने के लिए अलग-अलग
						पन्नों पर जाने की ज़रूरत नहीं है।</li>
					<li>कुंडलियाँ बनाने के लिए बार-बार फ़ॉर्म भरने की आवश्यकता नहीं
						है।</li>
					<li>कुंडली के विश्लेषण के लिए अलग-अलग जगहों पर उपलब्ध सूचनाओं
						को लिखने की ज़रूरत नहीं है।</li>
					<li>सब कुछ एक ही जगह पर पाकर आप कर सकते हैं अपने क़ीमती समय की
						बचत।</li>
				</ol>
				<p>एस्ट्रोसेज.कॉम दुनिया का नं. 1
					ज्योतिषीय पोर्टल है; साथ ही यह विश्व का पहला क्लाउड आधारित
					ज्योतिषीय सॉफ़्टवेअर भी है। इसलिए, डेस्कटॉप, मोबाइल, टेब व लेपटॉप
					आदि सभी जगह यह उम्दा तरीक़े से काम करता है। इस कुंडली सॉफ़्टवेयर को
					रोज़ाना लाखों ज्योतिषी उपयोग में लाते हैं। इसलिए हम भली-भाँति समझते
					हैं कि ज्योतिषियों की क्या-क्या ज़रूरतें हैं। ज्योतिष के क्षेत्र में
					हम आधुनिकतम तकनीक सुगम तरीक़े से उपलब्ध कराते हैं। एस्ट्रोसेज
					वर्कशीट इसी दिशा में अगला क़दम है, जो दुनिया भर के ज्योतिषियों के
					लिए ज़रूर लाभदायक साबित होगा।</p>
				<p>अब आज़माइए “एस्ट्रोसेज वर्कशीट” और
					मिलाइए ज्योतिष की शक्ति में तेज़ी की सुविधा आज ही।</p>
				<div class="mrt-20" align="center">
					<img src="/cloud/images/worksheet-2.png" class="responsive-img" width="560" />
				</div> <!--<a href="http://astrosage.com/cloud/worksheet/">अभी एस्ट्रोसेज वर्कशीट चलाकर देखें!</a>-->
				<a href="/cloud/worksheet/">अभी एस्ट्रोसेज वर्कशीट चलाकर देखें!</a>
				<%} else{ %>
				<p>AstroSage’s New Worksheet, the most
					advanced astrology software of all time, is out now! This hi-tech
					solution will shorten the time spent in analyzing a birth chart to
					10x! Because, now you will see all the required charts or tables at
					one screen. In 2004 we built astrology software in cloud; in 2009,
					we built mobile extension to that and now in 2015 we are bringing
					extreme customization with AstroSage Worksheet.</p>
				<div class="mrt-20 video-container" align="center">
					<iframe width="560" height="315"
						src="https://www.youtube.com/embed/VFXbwWgmOSk" frameborder="0"
						allowfullscreen></iframe>
				</div>
				<h5>Key Features</h5>
				<ul>
					Design your own screen
					<li>Pluggable Widgets for customized layout</li>
					<li>See what you want to see</li>
					<li>Drag and drop to arrange widgets</li>
					<li>Large number of tables and charts widgets available</li>
					<li>Charts for North India as well as South India</li>
					<li>Available in 2 languages - English & Hindi</li>
				</ul>
				<div class="mrt-20" align="center">
					<img src="/cloud/images/worksheet-1.png" class="responsive-img" width="560" />
				</div>
				<p>Try New AstroSage Worksheet Now!</p>
				<h5>
					<!--<a href="http://astrosage.com/cloud/worksheet/">Try New AstroSage Worksheet Now!</a></h3>-->
					<a href="/cloud/worksheet/">Try New AstroSage Worksheet Now!</a>
				</h5>
				<p>
					<a href="">हिंदी में पढ़ने के लिए यहाँ क्लिक करें</a>
				</p>
				<h5>How To Use AstroSage Worksheet?</h5>
				<p>
					<!--It is very very simple! All you need is to first create a <a href="http://astrosage.com/kundli/">-->
					It is very very simple! All you need is to first create a <a
						href="http://www.astrosage.com/kundli/"> <!--Kundali</a> or <a href="http://astrosage.com/cloud/login.asp">Log In</a>-->
						Kundali
					</a> or <a href="/cloud/login.asp">Log In</a> at AstroSage; and then
					click on the Worksheet button given at the corner. Your worksheet
					will open.
				</p>
				<h5>Fabulous Features In Detail</h5>
				<p>AstroSage’s Worksheet comes with
					the below given features:</p>
				<ol>
					<li>Multiple Chart View : Yes, on one page, you may see all
						types of charts.</li>
					<li>Modifiable Workspace : Easily adjust your worksheet by
						just dragging and dropping the charts or tables or anything that
						you want to see on your worksheet.</li>
					<li>Save Kundalis : Save all the Kundalis, charts, and other
						work done.</li>
					<li>English &amp; Hindi Language : See your worksheet in both
						of these languages.</li>
					<li>North &amp; South India Charts : Both of these charts are
						available.</li>
					<li>Automatically Saves Worksheet : Your customized worksheet
						will be saved as per your last edit and you can see it whenever
						you Log In the next time.</li>
					<li>Mixed View : You may put all you want in your worksheet.
						From charts to tables to everything that you want to see on your
						one space!</li>
				</ol>
				<p>All you need is to click on the
					‘Add Box’ button at the top right corner and a new box will be
					added to your worksheet. Further, you may choose from the options
					what you want to put in that box.</p>
				<div class="mrt-20" align="center">
					<img src="/cloud/images/worksheet-02.jpg" class="responsive-img" width="560" />
				</div>
				<p>
					<!--<a href="http://astrosage.com/cloud/worksheet/">Try New AstroSage Worksheet Now!</a></p>-->
					<a href="/cloud/worksheet/">Try New AstroSage Worksheet Now!</a>
				</p>
				<p>As soon as you click on the options
					button, you will see a pop-up containing options for the 10 types
					of charts, 18 types of tables, and 14 types of Vargas. Choose
					anything you want to see in your box. We have not stopped here,
					more is being added to the list to give you a huge platter of
					options.</p>
				<div class="mrt-20" align="center">
					<img src="/cloud/images/worksheet-4.jpg" class="responsive-img" width="450" />
				</div>
				<h5>AstroSage Worksheet In Hindi!</h5>
				<p>This is how your worksheet will
					look if you have chosen Hindi language for our Free Kundali
					software.</p>
				<p>It is a fabulous treat for
					astrologers as well as astrology students. Also, those who know a
					little bit of astrology or want to learn it, AstroSage’s Worksheet
					is the easiest way to practice and analyze.</p>
				<h5>Why Is It Amazing?</h5>
				<ol>
					<li>Now, you don’t need to swap onto various pages and links
						to view different charts.</li>
					<li>Stop filling forms again and again to create different
						Kundalis.</li>
					<li>You needn’t note down everything anywhere.</li>
					<li>If you know English or Hindi, you don’t need a translator
						as well.</li>
					<li>You needn’t waste your time exploring so many pages for
						one Kundali.</li>
				</ol>
				<p>AstroSage is world’s #1 astrology
					portal, which owns the first astrology cloud software. This
					software is the first one which runs on desktop as well as mobile
					efficiently. The Kundali software of AstroSage is used by lakhs of
					astrologers everyday. Hence, we understand what astrologers need.
					When it comes on astrological automation, AstroSage has no
					competition. We provide the cutting edge technology to the world
					astrology. AstroSage Worksheet is another step taken by AstroSage
					to assist the astrologers of the world.</p>
				<p>All you need is to work like a
					Boss, with AstroSage’s Worksheet in your service, Your Majesty!</p>
				<div class="mrt-20" align="center">
					<img src="/cloud/images/worksheet-03.jpg" class="responsive-img" width="560" />
				</div>
				<p>
					<!--<a href="http://astrosage.com/cloud/worksheet/">Try New AstroSage Worksheet Now!</a></p>-->
					<a href="/cloud/worksheet/">Try New AstroSage Worksheet Now!</a>
				</p> <% } %>
</div>
</div>
</div>

<div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all ui-paragraph-head">
	<div id="divhead">
			<h5> 	<% if(session.getAttribute("languageCode").equals("1")) {%>
					<%="एस्‍ट्रोसेज क्‍लाउड: असीमित जन्म कुंड़ली, असीमित कुंडली मिलान, असीमित मुफ्त रिपोर्ट और बहुत कुछ"%>
					<%}else{%>
					<%="AstroSage Cloud: Unlimited Birth Chart, Unlimited Horoscope Matching, Unlimited Free Reports"%>
					<%}%> </h5>	
				</div>
				
				<% if(session.getAttribute("languageCode").equals("1")){%>
				<p>
					<i>सबसे उत्कृष्ट ऑनलाइन ज्योतिषीय सॉफ्टवेयर "एस्‍ट्रोसेज
						क्‍लाउड" अब असीमित जन्म कुंडली, कुंडली मिलान, मोबाइल फोन सुविधा और
						कई नि:शुल्क रिपोर्ट के साथ उपलब्ध है। </i> <br /> <br /> <b>NOIDA,
						SATURDAY 31<sup>st</sup>, 2012:
					</b> <br /> हमें ये बताते हुए खुशी हो रही है कि अब तक के सबसे उत्कृष्ट
					आनलाइन ज्योतिषीय सॉफ्टवेयर “एस्‍ट्रोसेज क्‍लाउड” की उद्घोषणा हम
					चैत्र नवरात्र अष्टमी के शुभअवसर पर करने जा रहे हैं। सटीक गणना,
					व्यापक भविष्यवाणियां, मुफ्त रिपोर्ट्स ये युक्त है हमारा यह आनलाइन
					ज्योतिषीय सॉफ्टवेयर। ज्योतिषियों और आम आदमी की जरूरतों को पूरा करने
					के लिए यह एक बिल्कुल सही ज्योतिषीय सॉफ्टवेयर है। यह उपयोगकर्ता के
					अनुकूल सॉफ्टवेयर है जो पेचीदा ज्योतिषीय गणनाओं को कम करके निर्णय
					करने मे सरलता प्रदान करता है। केवल इतना ही नहीं यह दो भाषाओं,
					हिन्दी और अंग्रेजी में उपलब्ध है और सभी के लिए बिल्कुल फ़्री है।
					यहां इस सॉफ्टवेयर की कुछ नई विशेषताएं बताई जा रही हैं जिन्हें आप
					इस्तेमाल में लाना चाहेंगे: <br /> <br /> <b>असीमित कुंडलियों
						को सुरक्षित (save) करने की सुविधा:</b> <br /> यह उत्कृष्ट सॉफ्टवेयर
					आपको न केवल एक बल्कि अनेकों कुण्डलियों को सुरक्षित, और उनको पुन:
					देखने और प्रिन्ट करने की सुविधा देता है। इसमे आप केवल अपना ही नहीं
					बल्कि अपने पूरे परिवार की कुण्डलियां, भावी दूल्हे/दुल्हन, ग्राहकों
					की कुण्डलियां एक बार सुरक्षित करके नियमित रूप से कई रिपोर्ट्स पा
					सकते हैं। केवल एक माउस क्लिक पर पाएं संबंधित तस्वीर और सम्पूर्ण
					सिंहावलोकन। <br /> <br /> <b>सरलीकृत कुंडली मिलान:</b><br />
					कुंडली मिलान पहले की तुलना में अब आसान है। अब आप विवाह के समय
					कुण्‍डली मिलान में सभी लडकों / लडकियों की कुण्‍डली एक ही जगह देख
					सकते हैं और तुलनात्‍मक गुण मिलान जान सकते हैं। अब लडके वाले, लडकी
					वालों से और लडकी वाले, लडके वालों से आसानी से कुण्‍डली और मिलान
					परिणाम शेयर कर पाएंगे। इससे बेहतर कुण्डली मिलान का कोई और रास्ता
					नहीं है। <br /> <br /> <b>आसानी से मित्र और ज्योतिषी के साथ
						कुण्डली शेअर करें:</b><br /> क्या आप अपनी कुंडली मिलान के लिए देना
					चाहते हैं? या आप अपना चार्ट ज्योतिषी से शेअर करना चाहते हैं? अब आप
					यह काम बस एक क्लिक में कर सकते हैं। अब आप पुराने जमाने की उस
					प्रक्रिया को भूल जाएं जब डाउनलोड, सेव और इसके बाद मेल में अटैचमेंट
					करके एक से अधिक कुण्डलियों को भेजते थे। समय बचाएं, हमारी सुविधा का
					लाभ उठाएं और एक ही समय में कई कुण्डलिया सुरक्षित करें और उसी समय
					ज्योतिषियों से शेअर करें।<br /> <br /> <b>मोबाइल फोन में भी:</b><br />
					यदि आपके पास एण्ड्रोइड प्रणाली पर आधारित स्मार्टफोन है तो सभी
					सुरक्षित कुण्डलियों को अब आप हमारे ज्योतिषीय मोबाइल सॉफ्टवेयर के
					द्वारा अपने मोबाइल पर भी देख सकते हैं। AstroSage.com से जुडकर इसका
					लाभ उठाएं। आप अपनी कुण्डली को हमेशा कभी भी और कहीं भी देख सकते हैं,
					जो आपकी यूजर आइडी मे सुरक्षित हैं। आई फोन और विन्डोज मोबाइल के लिए
					भी यह सुविधा शीघ्र आ रही है। <a
						href="https://play.google.com/store/apps/details?id=com.ojassoft.astrosage"
						target="_blank" title="नि: शुल्क डाउनलोड, वैदिक ज्योतिष सॉफ्टवेयर"><u>एण्‍ड्रोइड
							मोबाइल फोन के लिए एस्‍ट्रोसेज ऐप्‍लीकेशन एण्‍ड्रोइड मार्केट से
							डाउनलोड की जा सकती है।</u></a><br /> <br /> <b>बनाएं नोट्स और
						ग्राहक की रिकार्ड हिस्ट्री:</b><br /> अगर आप कुण्‍डली से जुडे कुछ
					नोट्स बनाना चाहते हैं तो आपको अब नोटपैड आदि को प्रयोग करने की जरूरत
					नहीं है – आप अपने नोट्स सीधें एस्‍ट्रोसेज क्‍लाउड में रख सकते हैं।
					इन नोट्स तक कहीं से और किसी भी समय पहुँचा जा सकता है।<br /> <br />
					<b>गूगल मैप्स भी:</b><br /> यदि आपका जन्म स्थान कोई छोटा शहर है और
					आप उसके सहारे अपनी कुंडली नहीं बना पा रहे हैं तो चिंता की कोई बात
					नहीं, अब आप गूगल मैप्स सुविधा के साथ, आप न केवल अपनी जगह ढूँढ
					सकेंगे बल्कि आप उसका सही सही अक्षांश और देशांतर भी प्राप्त कर सकते
					हैं।<br /> <br /> <b>हिन्दी और अंग्रेजी भाषा का समर्थन:</b><br />
					न केवल अंग्रेजी भाषा में बल्कि हिन्दी में भी सब कुछ उपलब्ध है। यदि
					आप हिन्दी पसंद करते हैं तो आप स्वयं को भी एस्‍ट्रोसेज क्‍लाउड का आप
					उतना ही आनन्‍द ले सकते हैं। <br /> <br /> <b>अभेद सुरक्षा की
						गारंटी:</b><br /> हम आपकी गोपनीयता को महत्व देते हैं और अपकी सुरक्षा
					और निजता हमारी प्राथमिक चिंता का विषय है। यह सॉफ्टवेयर पूरी तरह से
					वैध है और आपकी यूजर आइडी के हैक या क्रैक होने की कोई गुंजाइस नहीं
					है। वाइरस के दृष्टिकोण से भी यह100% साफ और सुरक्षित है। वर्षों के
					उपयोगकर्ता परीक्षण जानकारों की अनुकूल टिप्पणियों के बाद हमने इसे
					जारी किया है। आपको इस सॉफ्टवेयर जिसमें आपकी जरूरतों का सारा सामन
					है, ऐसे उपहार को भेंट करते हुए हमें बहुत खुशी हो रही है। इस
					सॉफ्टवेयर का प्रयोग कर आप लाभान्वित और आनंदित हों!!!<br />
				</p> <% }else{ %>
				<p>
					Most advanced online astrology software "AstroSage Cloud" is
						available now with unlimited birth chart saving, horoscope
						matching, mobile phone support, and many free reports.<br /> <br />
					<b>NOIDA, SATURDAY 31<sup>st</sup>, 2012:
					</b> <br /> On this auspicious occasion of Chaitra Navratra Ashtami,
					we are pleased to announce “AstroSage Cloud” – the most advanced
					online Astrology System ever. Accurate calculations, comprehensive
					predictions, free reports, this is exactly the right software to
					meet the needs of astrologers and common man, ALL IN ONE. It’s
					extremely user-friendly and reduces brain-twisting calculations and
					judgments to simple procedures. Not just this, it’s available in
					two languages English and Hindi and is ALL FOR FREE!! Here are some
					of the new features that you would love to explore: <br /> <br />
					<b>Unlimited Kundli (Birth Charts) saving</b> <br /> This advanced
					software not only allows you to save, open, print birth charts of
					one but many. Save not just your chart but that of each family
					member, prospective grooms, brides, clients once and get various
					reports regularly. Get a relative picture and holistic overview,
					all at a click of a mouse. <br /> <br /> <b>Simplified and
						User Friendly Horoscope Matching</b><br /> Horoscope Matching is now
					simpler than ever before. Imagine how easy it get’s when you have
					the birth chart of all prospective partners all at one place,
					giving you a relative picture. ‘Gun Milap’ is easy as now you can
					match horoscope with existing saved charts as well as shared chart.
					There is no better way for horoscope matching than this and your
					comfort is our priority. <br /> <br /> <b>Share Chart with
						Friends & Astrologers with Ease</b><br /> Want to give your chart for
					horoscope matching? Or Want to share your chart with astrologer?
					Now you can do it in just one click. Forget the age old procedure
					of downloading, saving and then sharing multiple charts as
					attachments in mails one a time. Save time, using our multiple
					charts saving feature for Horoscope Matching and sharing the same
					with astrologers.<br /> <br /> <b>Have everything On Go with
						Mobile Phone integration (AstroSage App)</b><br /> All the saved
					charts can now be accessed with our Astrology Mobile Software –
					"AstroSage Kundli for Android" If you have Android based
					Smartphone, enjoy integration with AstroSage.com. You will always
					have access to your horoscope and of those saved in your user id
					anywhere and everywhere. iPhone and Windows Mobile coming soon. <a
						href="https://play.google.com/store/apps/details?id=com.ojassoft.astrosage"
						target="_blank"
						title="Get Free Vedic Astrology Software and Carry Kundli In Your Pocket"><u>AstroSage
							App for Android can be downloaded from Android Market. </u></a> <br /> <br />
					<b>Take Notes & Record Client History</b><br /> Now you can take
					notes on birth chart and store that in AstroSage Cloud. The notes
					can be accessed anytime from anywhere. <br /> <br /> <b>Google
						Maps Support</b><br /> If your birth place is a small city and you
					are not able to make your horoscope, no need for worry. Now with
					Google Maps integration, you can not only locate your place but
					also precisely get latitude/ longitude of exact addresses.<br /> <br />
					<b>Hindi & English Language Support </b> <br /> Everything is
					available not only in English but also in Hindi. You will not feel
					left out, if you prefer Hindi. <br /> <br /> <b>High End -
						Security Guaranteed</b><br /> We value your privacy and your
					security. This software is legal and there is no possibility of
					crack or hack of your user id. Checked for possible viruses it’s
					100% clean and safe. Released after years of user testing and
					favorable comments from scholars we are happy to gift you software
					that meets all your needs.<br />
				</p> <%}%>
				
				<div class="mrt-20 video-container" align="center"> 
				<iframe width="500"
					height="315" src="http://www.youtube.com/embed/nViAVU-hJjo"
					frameborder="0" allowfullscreen></iframe>
					</div>
</div>
</div>
</div>

