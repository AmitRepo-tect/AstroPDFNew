<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>

var DegreeofMoon = <%=request.getParameter("moon")%>;
var DayofBirth = <%=Util.safeInt(request.getParameter("DoB"))%>;
var MonthofBirth = <%=Util.safeInt(request.getParameter("MoB"))%>;
var YearofBirth = <%=Util.safeInt(request.getParameter("YoB"))%>;
var HourofBirth = <%=Util.safeInt(request.getParameter("Hour"))%>;
var MinuteofBirth = <%=Util.safeInt(request.getParameter("Min"))%>;
var SecondofBirth = <%=Util.safeInt(request.getParameter("Sec"))%>;
var LanguageCode = <%=Util.safeInt(request.getParameter("LanguageCode"))%>;
var total = 120;
var y1 = [7, 20, 6, 10, 7, 18, 16, 19, 17];
var tillDate = new Array();
if((LanguageCode == 1) || (LanguageCode == 9))
{
    var planets = ["के", "शु", "सु", "चं", "मं", "रा", "गु", "श", "बु"];
    var planetNumber = new Array();
    planetNumber['के']=0;
    planetNumber['शु']=1;
    planetNumber['सु'] = 2;
    planetNumber['चं'] = 3;
    planetNumber['मं'] = 4;
    planetNumber['रा'] = 5;
    planetNumber['गु'] = 6;
    planetNumber['श'] = 7;
    planetNumber['बु'] = 8;
}
else if(LanguageCode == 2)
{
         var planets = ["கே", "சு", "சூ", "சந்", "செ", "ரா", "கு", "சனி", "பு"];
         var planetNumber = new Array();
         planetNumber['கே'] = 0;
         planetNumber['சு'] = 1;
         planetNumber['சூ'] = 2;
         planetNumber['ந்'] = 3;
         planetNumber['செ'] = 4;
         planetNumber['ரா'] = 5;
         planetNumber['கு'] = 6;
         planetNumber['னி'] = 7;
         planetNumber['பு'] = 8;
    }
     else if(LanguageCode == 4)
    {
         var planets = ["ಕೇ", "ಶು", "ರ", "ಚಂ", "ಮಂ", "ರಾ", "ಗು", "ಶ", "ಬು"];
         var planetNumber = new Array();
         planetNumber['ಕೇ'] = 0;
         planetNumber['ಶು'] = 1;
         planetNumber['ರ'] = 2;
         planetNumber['ಚಂ'] = 3;
         planetNumber['ಮಂ'] = 4;
         planetNumber['ರಾ'] = 5;
         planetNumber['ಗು'] = 6;
         planetNumber['ಶ'] = 7;
         planetNumber['ಬು'] = 8;
    }
 else if(LanguageCode == 5)
    {
         var planets = ["కే", "శు", "ర", "చం", "కు", "రా", "గు", "శ", "బు"];
         var planetNumber = new Array();
         planetNumber['కే'] = 0;
         planetNumber['శు'] = 1;
         planetNumber['ర'] = 2;
         planetNumber['చం'] = 3;
         planetNumber['కు'] = 4;
         planetNumber['రా'] = 5;
         planetNumber['గు'] = 6;
         planetNumber['శ'] = 7;
         planetNumber['బు'] = 8;
    }
     else if(LanguageCode == 6)
    {
         var planets = ["কে", "শু", "সূ", "চ", "ম", "রা", "বৃহ", "শ", "বু"];
         var planetNumber = new Array();
         planetNumber['কে'] = 0;
         planetNumber['শু'] = 1;
         planetNumber['সূ'] = 2;
         planetNumber['চ'] = 3;
         planetNumber['ম'] = 4;
         planetNumber['রা'] = 5;
         planetNumber['ৃহ'] = 6;
         planetNumber['শ'] = 7;
         planetNumber['বু'] = 8;
    }
     else if(LanguageCode == 7)
    {
         var planets = ["કે", "શુ", "સૂ", "ચં", "મં", "રા", "ગુ", "શ", "બુ"];
         var planetNumber = new Array();
         planetNumber['કે'] = 0;
         planetNumber['શુ'] = 1;
         planetNumber['સૂ'] = 2;
         planetNumber['ચં'] = 3;
         planetNumber['મં'] = 4;
         planetNumber['રા'] = 5;
         planetNumber['ગુ'] = 6;
         planetNumber['શ'] = 7;
         planetNumber['બુ'] = 8;
    }
     else if(LanguageCode == 8)
    {
         var planets = ["ശി", "ശു", "ര", "ച", "കു", "സ", "ഗു", "മ", "ബു"];
         var planetNumber = new Array();
         planetNumber['ശി'] = 0;
         planetNumber['ശു'] = 1;
         planetNumber['ര'] = 2;
         planetNumber['ച'] = 3;
         planetNumber['കു'] = 4;
         planetNumber['സ'] = 5;
         planetNumber['ഗു'] = 6;
         planetNumber['മ'] = 7;
         planetNumber['ബു'] = 8;
    }
     else if(LanguageCode == 10)
    {
         var planets = ["Ke", "Ve", "Su", "Mo", "Ma", "Ra", "Ju", "Sa", "Me"];
         var planetNumber = new Array();
         planetNumber['Ke'] = 0;
         planetNumber['Ve'] = 1;
         planetNumber['Su'] = 2;
         planetNumber['Mo'] = 3;
         planetNumber['Ma'] = 4;
         planetNumber['Ra'] = 5;
         planetNumber['Ju'] = 6;
         planetNumber['Sa'] = 7;
         planetNumber['Me'] = 8;
    }
  else  
  {  var planets = ["Ke", "Ve", "Su", "Mo", "Ma", "Ra", "Ju", "Sa", "Me"];
// Hashtable to get planet number given planet name
var planetNumber = new Array();
planetNumber['Ke'] = 0;
planetNumber['Ve'] = 1;
planetNumber['Su'] = 2;
planetNumber['Mo'] = 3;
planetNumber['Ma'] = 4;
planetNumber['Ra'] = 5;
planetNumber['Ju'] = 6;
planetNumber['Sa'] = 7;
planetNumber['Me'] = 8;
    
 }
 
 var dob, dobInDouble;var planetWidth = 2;
 var level = 0;
 var levelName = new Array();
 levelName[level] = "";
 var arStartPlanet = new Array();
 var lastEndDate = new Array();
 var lastStartDate = new Array();
 var periodSpan = new Array();
 var seperator = "";
 var nakshatra;
 var moon;
 moon = DegreeofMoon;
 nakshatra = getNakshatra(moon);
 dobInDouble = parseFloat(YearofBirth) + (parseFloat(MonthofBirth) - 1) / 12.0 + parseFloat(DayofBirth) / 365.0;
 lastEndDate[level] = dobInDouble;
 lastStartDate[level] = dobInDouble;
 arStartPlanet[level] = nakshatra;
 periodSpan[level] = 120;
 function Left(str, n) {
 if (n <= 0)
 return "";
 else if (n > String(str).length){
 return str;
 }
 else{
 return String(str).substring(0, n);
 }}
 function Right(str, n) {
 if (n <= 0){
 return "";
 }
 else if (n > String(str).length){
 return str;
 }
 else {
 var iLen = String(str).length;
 return String(str).substring(iLen, iLen - n);
 }}
 $(document).ready(function () {
 showDasa(nakshatra);
 });
 function fract(doubleValue) {
 return parseFloat(doubleValue) - parseInt(doubleValue);
 }
 function balance(moon) {
 var d0, n0, balance;
 var q, dd, mm, yy;
 d0 = moon;
 d0 = 9.0 * fract(d0 / 120);
 n0 = fract(d0);
 q = parseInt(d0);
 balance = (1 - n0) * y1[q];
 return balance;
 }
 function doubleToStringDate(doubleDate) {
 var bod = doubleDate;
 var yy, mm, dd;
 yy = parseInt(bod);
 mm = parseInt(fract(bod) * 12) + 1;
 dd = parseInt((fract(fract(bod) * 12)) * 31);
 if(dd==0){
 dd=1;
 }
if(mm==2 && dd>28){dd=28;}
 return (dd + '/' + mm + '/' + yy);
 }
 function getNakshatra(longitude) {
 var nak = parseInt(longitude * 0.075);
 if (nak >= 18){
 nak -= 18;
 }
 if (nak >= 9){
 nak -= 9;
 }
 return nak;
 }
 function showDasa(startPlanet) {
    i = startPlanet;
 $("div.dasa").children().remove();
 for (var count = 0; count < 9; count++, i++) {
 if (i >= 9){
 i -= 9;
 }
 if (level != 0){
 seperator = " - ";
 }
 $("div.dasa").append('<div class="row hover-row"><div id="PlanetaryTableTD" class="planet col s6 br-r cursor-pointer">' + levelName[level] + seperator + planets[i] + '</div><div id="PlanetaryTableTD" class="date col s6">' + dasa(i) + '</div></div>');
 } 
 installClickHandler();
 }
 function dasa(i) {
 if (level == 0) {
 if (i == nakshatra){
 lastEndDate[level] = lastEndDate[level] + balance(moon);
 }
 else{lastEndDate[level] = lastEndDate[level] + y1[i];
 }} 
 else {lastEndDate[level] = lastEndDate[level] + periodSpan[level] * y1[i] / 120;
 }
 tillDate[i] = lastEndDate[level];
 return doubleToStringDate(lastEndDate[level]);
 }
 function installClickHandler() {
 $("div.planet").click(function () {
 if(level<3){
 level++;
 levelName[level] = this.innerHTML;
 if(LanguageCode==5){
     if(levelName[level].indexOf("-")>0)
     {   
       planetval = levelName[level].split("-");   
     } 
     if(levelName[level].indexOf("-")>0){
        arStartPlanet[level] = planetNumber[planetval[planetval.length-1].trim()]}
     else{
        arStartPlanet[level] = planetNumber[Right(levelName[level], planetWidth)];
     }
 }
 else{    
 //document.write(this.innerHTML+","+levelName[level]+","+planetWidth+","+Right(levelName[level], planetWidth)); 
 arStartPlanet[level] = planetNumber[Right(levelName[level], planetWidth).trim()];
 }
 if ((arStartPlanet[level] == arStartPlanet[level-1]) && (level>1))
  {
  lastEndDate[level] = lastStartDate[level-1];
  periodSpan[level] = tillDate[arStartPlanet[level]] - lastEndDate[level];
  } 
  else{
  lastEndDate[level] = tillDate[((arStartPlanet[level] - 1 < 0) ? arStartPlanet[level] - 1 + 9 : arStartPlanet[level] - 1)];
  periodSpan[level] = tillDate[arStartPlanet[level]] - tillDate[((arStartPlanet[level] - 1 < 0) ? arStartPlanet[level] - 1 + 9 : arStartPlanet[level] - 1)];
  }if (level > 1){
  total = total * y1[arStartPlanet[level]] / 120;
  }
  if (periodSpan[level] < 0) {
  periodSpan[level] += total;
  lastEndDate[level] -= total;
  }
  lastStartDate[level] = lastEndDate[level];
  showDasa(arStartPlanet[level]);
  }});
  }
  function back() {
  if (level == 0){
  return;
  }
  if (level > 1){
  total = total * 120 / y1[arStartPlanet[level]];
  }
  level--;
  if (level == 0){
  seperator = "";
  }
  lastEndDate[level] = lastStartDate[level];
  showDasa(arStartPlanet[level]);
  }