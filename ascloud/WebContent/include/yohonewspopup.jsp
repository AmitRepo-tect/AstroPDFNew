<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>

<% int lang_yoho = Util.safeInt(session.getAttribute("languageCode"));

String tagval="",L1="",L2="",L3="",L4="";
if(lang_yoho  == 0 ||  session.getAttribute("languageCode").equals("") || request.getParameter("LanguageType")!=null &&  request.getParameter("LanguageType").equals("english")) {
    tagval = "cross-english";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 1 || request.getParameter("LanguageType")!=null &&  request.getParameter("LanguageType").equals("hindi")) {
    tagval = "cross-hindi";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 2){
    tagval = "cross-tamil";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 4){
 tagval = "cross-kannada";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 5){
    tagval = "cross-telugu";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 6) {
 tagval = "cross-bengali";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 7){
 tagval = "cross-gujarati";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 8) {
 tagval = "cross-malayalam";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 9) {
    tagval = "cross-marathi";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

if(lang_yoho == 10) {
 tagval = "cross-urdu";
    L1 = "1 मिनट में पूरे दिन की ख़बरें ";
    L2 = "तब भी ख़बरें पढें जब इंटरनेट न हो";
    L3 ="हर ख़बर की विस्तृत खबर भी";
    L4 = "हिंदी हमारा स्वाभिमान है, और उसका प्रचार हमारा उद्देश्य ";
}

String curr_url = request.getRequestURI();
String  usingclass="",usingclass1="",usingclass2="";
if(curr_url.contains("freekundali") || curr_url.contains("cloud") ){
 //if instr(curr_url, "freekundali") > 0 or instr(curr_url, "cloud") > 0  then
  usingclass="col1";
  usingclass1="col2";
   usingclass2="";
}else{
  usingclass="leftbox";
  usingclass1="rightbox";
   usingclass2="row";
 
}
%>

<div id="overlay4"></div>
<div id="popup4">
    <div class="box-area">
        <a href="javascript:closePopup('cancel-yohonews','<%=tagval %>','overlay4','popup4')" class="close4"></a>
        <div class="<%=usingclass2 %>">
        <div class="col-md-4 <%=usingclass %>">
            <div align="center" style="margin: 15px 0 0 15px;">
            <a target="_blank" href="https://play.google.com/store/apps/details?id=com.ojassoft.news&referrer=utm_source=aspopup&utm_medium=web&utm_campaign=downloadyohonews" rel="nofollow"  onclick="javascript:closePopup('download-yohonews','icon','overlay4','popup4');">
                <img src="/images/promotion/modi.png" width="200" /></a></div>
            <div align="center" style="margin: 0px 0 0 15px;">
                <a target="_blank" href="https://play.google.com/store/apps/details?id=com.ojassoft.news&referrer=utm_source=aspopup&utm_medium=web&utm_campaign=downloadyohonews" rel="nofollow"  onclick="javascript:closePopup('download-yohonews','left','overlay4','popup4');">
                  <img src="/images/promotion/play-store-small.png" width="200" /></a>
                   
            </div>
        </div>
        <div class="col-md-8 <%=usingclass1 %>">
            <div class="header-area">
                <h2 align="center">
                <a  target="_blank" href="https://play.google.com/store/apps/details?id=com.ojassoft.news&referrer=utm_source=aspopup&utm_medium=web&utm_campaign=downloadyohonews" rel="nofollow"  onclick="javascript:closePopup('download-yohonews','logo','overlay4','popup4')">
                    
                     <img src="/images/promotion/yohonewslogo.png" width="100" /></a></h2>
                <div style="clear: both">
                </div>
            </div>
            <div class="content-areanews">
                <ul>
                    <li style="text-align:left;"><%=L1%></li>
                    <li style="text-align:left;"><%=L2%></li>
                    <li style="text-align:left;"><%=L3%></li>
                    <li style="text-align:left;"><%=L4%></li> 
                </ul>
                <%if(SharedFunction.Is_Mobile(request)) { %>
                <div align="right" style="margin-top: 16px; margin-right: 05px">
                     <%}else{%>
                <div align="right" style="margin-top: 16px; margin-right: 85px">
                <%} %>
                        <a target="_blank" href="https://play.google.com/store/apps/details?id=com.ojassoft.news&referrer=utm_source=aspopup&utm_medium=web&utm_campaign=downloadyohonews" rel="nofollow"  onclick="javascript:closePopup('download-yohonews','right','overlay4','popup4')">
                        <img src="/images/promotion/play-store-small.png" width="279" /></a>
                      
                </div>
                <div style="clear: both">
                </div>
            </div>
            <div class="footer-area">
            </div>
        </div>
        <div style="clear: both">
        </div>
        </div>
    </div>
</div>