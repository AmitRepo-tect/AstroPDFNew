<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%  
int lang_bhHoro = Util.safeInt(session.getAttribute("languageCode"));
String evnval = "service";
String dodURL = "";
String tagval ="",imgSource="";

if(lang_bhHoro == 1 || request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("hindi"))
{
        dodURL = "https://buy.astrosage.com/service/astrosage-brihat-horoscope?language=hi&prtnr_id=NCBKP";
        tagval = "bk-popup-hindi";        
        imgSource = "https://www.astrosage.com/images/promotion/bk-popup-hi.jpg";  
}
else
{
        dodURL = "https://buy.astrosage.com/service/astrosage-brihat-horoscope?language=en&prtnr_id=NCBKP";
        tagval = "bk-popup-other";       
        imgSource = "https://www.astrosage.com/images/promotion/bk-popup-en.jpg";  
}
  
%>

<div id="overlay6"></div>
    <div id="bhModal" class="promo-popup modal">
    <a href="javascript:closePopup('cancel-bh','<%=tagval %>','overlay6','bhModal')" class="cbtnp"><i class="material-icons black-text">close</i></a>   
 <div class="modal-content no-padding">             
            <div>
                <a href="<%=dodURL%>" onclick="closePopup('<%=evnval %>','<%=tagval %>','overlay6','bhModal')">
                    <img src="<%=imgSource%>" class="img-full"/>
                </a>
            </div>
        </div>
    </div>