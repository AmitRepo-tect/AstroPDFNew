<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
   int lang_Trikal = Util.safeInt(session.getAttribute("languageCode"));
    String evnval = "service";
    String dodURL ="",tagval="",imgSource="";
   if(lang_Trikal == 1 || request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("hindi") ){
        dodURL = "http://buy.astrosage.com/service/2018-year-book-large?language=hi&prtnr_id=TSPOP";
        tagval = "trikal-samhita-popup-hindi";        
        imgSource = "/images/promotion/pop-up-trikal-samhita-2018-hi.jpg";  
   }else{
        dodURL = "http://buy.astrosage.com/service/2018-year-book-large?prtnr_id=TSPOP";
        tagval = "trikal-samhita-popup-other";       
        imgSource = "/images/promotion/pop-up-trikal-samhita-2018-en.jpg" ; 
   }
  
%>

<div id="overlay5"></div>
<div id="tsModal" class="promo-popup modal">  
    <a href="javascript:closePopup('cancel-ts','<%=tagval %>','overlay5', 'tsModal')" class="waves-effect waves-green btn-flat right"><i class="material-icons">close</i></a>
 <div class="modal-content no-padding"> 
  <a href="<%=dodURL%>" onclick="closePopup('<%=evnval %>','<%=tagval %>','overlay5', 'tsModal')">
                    <img src="<%=imgSource%>" class="img-full"/>
                </a> 
 

 </div>
 </div>
 
