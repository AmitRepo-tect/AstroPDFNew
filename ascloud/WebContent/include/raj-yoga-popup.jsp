<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%
   int lang_Trikal = Util.safeInt(session.getAttribute("languageCode"));
    String evnval = "service";
    String dodURL ="",tagval="",imgSource="";
   if(lang_Trikal == 1 || request.getParameter("LanguageType")!=null && request.getParameter("LanguageType").equals("hindi") ){
        dodURL = "https://buy.astrosage.com/service/raj-yoga-report?language=hi&prtnr_id=NCRYP";
        tagval = "raj-yoga-popup-hindi";        
        imgSource = "https://www.astrosage.com/images/promotion/raj-yoga-popup-hi.jpg";  
   }else{
        dodURL = "https://buy.astrosage.com/service/raj-yoga-report?prtnr_id=NCRYP";
        tagval = "raj-yoga-popup-other";       
        imgSource = "https://www.astrosage.com/images/promotion/raj-yoga-popup1-en.jpg" ; 
   }
  
%>

<div id="overlay5"></div>
<div id="tsModal" class="promo-popup modal">  
    <a href="javascript:closePopup('cancel-ry','<%=tagval %>','overlay5', 'tsModal')" class="waves-effect waves-green btn-flat right"><i class="material-icons">close</i></a>
 <div class="modal-content no-padding"> 
  <a href="<%=dodURL%>" onclick="closePopup('<%=evnval %>','<%=tagval %>','overlay5', 'tsModal')">
                    <img src="<%=imgSource%>" class="img-full"/>
                </a> 
 

 </div>
 </div>
 
