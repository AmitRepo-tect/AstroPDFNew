<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*, java.util.*"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%if(SharedFunction.Is_Mobile(request)){%>
<div align="center" class="bg-white">
    <div class="btn-group ui-padding-tb">
        <a href="http://www.astrosage.com/kundli/" onclick="getEvents('button-clicked', 'otherpages-kundli');" class="btn btn-secondary btn-sm">Kundli</a> 
        <a href="http://www.astrosage.com/freechart/matchmaking.asp" onclick="getEvents('button-clicked', 'otherpages-matching');" class="btn btn-secondary btn-sm">Matching</a> 
        <a href="http://www.astrosage.com/offer/big-horoscope.asp?prtnr_id=ASBTN" style="background:#58000a;" onclick="getEvents('button-clicked-blog', 'bighoro');" class="btn btn-secondary btn-sm">Big Horoscope</a>
       
    </div>
</div>
<%}%>