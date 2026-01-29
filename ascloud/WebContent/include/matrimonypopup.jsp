<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%
int lang_Matri = Util.safeInt(session.getAttribute("languageCode"));

String tagval= "",punchline="",Register_Now="",Do_You_Want_To_Get_Marry="";

if(lang_Matri == 0){
    tagval = "cross-english";
    punchline = "FREE Matrimony site by No. 1 astrology portal AstroSage.com";    
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 1){
    tagval = "cross-hindi";
    punchline = "नं. १ ज्योतिषीय पोर्टल ऐस्ट्रोसेज.कॉम की शादी के लिए नयी मुफ़्त वेबसाइट"    ;
    Register_Now = "पंजीकरण करें";
    Do_You_Want_To_Get_Marry = "आप शादी करना चाहते हैं?";
  }

if(lang_Matri == 2) {
    tagval = "cross-tamil";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com" ;    
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 4) {
    tagval = "cross-kannada";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com";
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 5) {
    tagval = "cross-telugu";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com";     
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 6){
    tagval = "cross-bengali";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com" ;    
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 7){
    tagval = "cross-gujarati";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com";     
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 8) {
    tagval = "cross-malayalam";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com";     
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 9){
    tagval = "cross-marathi";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com";     
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}

if(lang_Matri == 10) {
    tagval = "cross-urdu";
    punchline = "Free Matrimony site by No. 1 astrology portal AstroSage.com";     
    Register_Now = "Register Now";
    Do_You_Want_To_Get_Marry = "Do you want to get married?";
}
String name="",sex="",Querystrinval="";
int dayval = 0,monthval=0,yearval=0;
if(session.getAttribute("HoroscopeObj")!=null && !session.getAttribute("HoroscopeObj").equals("")) {
	DesktopHoro ObjHoro = (DesktopHoro)session.getAttribute("HoroscopeObj");  
    //Set objHoro= session("HoroscopeObj")
    name=ObjHoro.getName();     
    sex=ObjHoro.getMaleFemale();    
    dayval=ObjHoro.getDayOfBirth();
    monthval=ObjHoro.getMonthOfBirth();
    yearval=ObjHoro.getYearOfBirth();
    Querystrinval = "name="+name+"&sex="+sex+"&dayval="+dayval+"&monthval="+monthval+"&yearval="+yearval+"&refferer=astrosage&";
}
String curr_url = request.getRequestURI();
String usingclass="",usingclass1="",usingclass2="",usingstyle1="";
if(curr_url.contains("freekundali") || curr_url.contains("cloud") ){
 //if instr(curr_url, "freekundali") > 0 or instr(curr_url, "cloud") > 0  then
  usingclass="col1-1";
  usingclass1="col1-2";
  usingclass2="";
  usingstyle1="width:175px;float:left;";
}else{
  usingclass="";
  usingclass1="";
  usingclass2="row";
  usingstyle1="";
}
%>

<style>         

.p-punchline h2{text-align:center;color:#9e1e09; font-size:20px; line-height:28px; font-weight:bold; padding:0 0px 0px 15px;}
.p-punchline h3{padding:10px 0px 0 5px;font-size:19px; text-align:center; color: #04857e;font-family:Georgia; margin:5px 0 0 0; /*background:#08413e; border:1px solid #0b544f; margin:20px auto 20px;text-shadow: -6px -2px 5px #333333;*/}
.url{text-align:center;color:#9e1e09; line-height:28px; font-weight:bold; padding:0 0px 0px 15px;}

</style>

<div id="overlay2"></div>
<div id="popup2" class="promo-popup modal">
    <div class="model-header">
            <h4>            
        		<a href="javascript:closePopup('cancel-marriage','<%=tagval %>','overlay2','popup2')" class="waves-effect btn-flat black-text text-lighten-2 right"><i class="material-icons">close</i></a>
        </h4>
        </div>
    <div class="modal-content">
 
        <div class="row">
        <div class="col l5 br-r">     
              <div class="p-punchline"><h3><%=Do_You_Want_To_Get_Marry %></h3></div>
              <div class="url"><a href="https://marriage.astrosage.com?<%=Querystrinval %>utm_source=onlinead&utm_medium=popup&utm_campaign=asmarriage" target="_blank" rel="nofollow"  onclick="javascript:closePopup('register-marriage','link','overlay2','popup2')">http://www.AstroSageMarriage.com/</a></div>
          
            <div align="center">
            <a href="https://marriage.astrosage.com?<%=Querystrinval %>utm_source=onlinead&utm_medium=popup&utm_campaign=asmarriage" rel="nofollow" target="_blank"  onclick="javascript:closePopup('register-marriage','icon','overlay2','popup2')">
            <img src="/freekundali/promotional-box/images/marriage.png" width="250" class="p-img" />
            </a>
            </div>
        </div>
        <div class="col l7">
            <div class="content-area">
             <div align="center">
             <a href="https://marriage.astrosage.com?<%=Querystrinval %>utm_source=onlinead&utm_medium=popup&utm_campaign=asmarriage" rel="nofollow" target="_blank"  onclick="javascript:closePopup('register-marriage','logo','overlay2','popup2')">
             <img src="/freekundali/promotional-box/images/logo1.png" width="300" class="p-img" />
             </a>
             </div>
               <div class="p-punchline"><h2><%=punchline %></h2></div>
               <div align="center" style=" margin-top:30px;"> 
                <a href="https://marriage.astrosage.com?<%=Querystrinval %>utm_source=onlinead&utm_medium=popup&utm_campaign=asmarriage" target="_blank" class="btn btn-large amber darken-4 txt24" rel="nofollow" onclick="javascript:closePopup('register-marriage','button','overlay2','popup2');"><%=Register_Now %></a>
               </div>
            </div>
            <div style=" height:20px;"></div>
        </div>
        </div>
        <div style="clear: both"></div>
         
    </div>
</div>