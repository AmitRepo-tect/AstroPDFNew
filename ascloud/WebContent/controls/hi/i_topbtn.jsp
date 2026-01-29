<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%if(SharedFunction.Is_Mobile(request)){%>
<div align="center" class="bg-white">
    <div class="btn-group ui-padding-tb">
        <a href="http://hindi.astrosage.com/free/hindi-kundli.asp" onclick="getEvents('button-clicked', 'otherpages-kundli-hi');" class="btn btn-secondary btn-sm">कुंडली</a> 
        <a href="http://hindi.astrosage.com/freechart/kundli-milan-matching.asp" onclick="getEvents('button-clicked', 'otherpages-matching-hi');" class="btn btn-secondary btn-sm">कुंडली मिलान</a> 
         <a href="http://www.astrosage.com/offer/big-horoscope-hi.asp?prtnr_id=ASBTN" onclick="getEvents('button-clicked-hindiblog', 'mahakundli');" class="btn btn-secondary btn-sm">महा कुंडली</a>
        <!--<a href="http://buy.astrosage.com/" onclick="getEvents('button-clicked', 'otherpages-shopping-hi');" class="btn btn-secondary btn-sm">शॉपिंग</a> 
        <a href="https://hindi.astrosage.com/upay/" onclick="getEvents('button-clicked', 'otherpages-upay');" class="btn btn-secondary btn-sm">उपाय</a>-->
    </div>
</div>
<%}%>