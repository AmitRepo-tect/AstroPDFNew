<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%  
int lang_bhHoro = Util.safeInt(session.getAttribute("languageCode"));
String evnval = "service";
String dodURL = "";
String tagval ="",imgSource="";

if(lang_bhHoro == 1 || request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("hindi"))
{
        dodURL = "https://www.astrosage.com/offer/big-horoscope-hi.asp?prtnr_id=NCBHP";
        tagval = "bighoro-popup-hindi";        
        imgSource = "https://www.astrosage.com/images/promotion/popup-bighoro-hi.jpg";  
}
else
{
        dodURL = "https://www.astrosage.com/offer/big-horoscope.asp?prtnr_id=NCBHP";
        tagval = "bighoro-popup-other";       
        imgSource = "https://www.astrosage.com/images/promotion/popup-bighoro-en.jpg";  
}
  
%>

<div id="overlay6"></div>
    <div id="bhModal" class="promo-popup modal">
    <a href="javascript:closePopup('cancel-bh','<%=tagval %>','overlay6','bhModal')" class="cbtnp"><i class="material-icons white-text">close</i></a>   
 <div class="modal-content no-padding">             
            <div>
                <a href="<%=dodURL%>" onclick="closePopup('<%=evnval %>','<%=tagval %>','overlay6','bhModal')">
                    <img src="<%=imgSource%>" class="img-full"/>
                </a>
            </div>
        </div>
    </div>