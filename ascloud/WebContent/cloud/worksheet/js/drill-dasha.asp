<% Response.Charset = "utf-8" %>

DegreeofMoon   = <%=request("moon")%>;
DayofBirth     = <%=Cint(request("DoB"))%>;
MonthofBirth   = <%=Cint(request("MoB"))%>;
YearofBirth    = <%=Cint(request("YoB"))%>;
HourofBirth    = <%=Cint(request("Hour"))%>;
MinuteofBirth  = <%=Cint(request("Min"))%>;
SecondofBirth  = <%=Cint(request("Sec"))%>;
LanguageCode   = <%=Cint(request("LanguageCode"))%>;
var total = 120;
//var planets = ["Ke", "Ve", "Su", "Mo", "Ma", "Ra", "Ju", "Sa", "Me"];
//alert(LanguageCode);

var y1 = [7, 20, 6, 10, 7, 18, 16, 19, 17];
var tillDate = new Array();

if (LanguageCode == 1)
{
var planets = ["के", "शु", "सु", "चं", "मं", "रा", "गु", "श", "बु"];
// Hashtable to get planet number given planet name
var planetNumber = new Array();
planetNumber['के'] = 0;
planetNumber['शु'] = 1;
planetNumber['सु'] = 2;
planetNumber['चं'] = 3;
planetNumber['मं'] = 4;
planetNumber['रा'] = 5;
planetNumber['गु'] = 6;
planetNumber['श'] = 7;
planetNumber['बु'] = 8;
}
else
{
var planets = ["Ke", "Ve", "Su", "Mo", "Ma", "Ra", "Ju", "Sa", "Me"];
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



var dob, dobInDouble;
var planetWidth = 2;
var level = 0; //0=mahadasa, 1=antardasa, 2=pratyantardasa, 3=sookshma and so on
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

//dobInDouble = YearofBirth + MonthofBirth / 12.0 + DayofBirth / 365.0;

lastEndDate[level] = dobInDouble;
lastStartDate[level] = dobInDouble;
arStartPlanet[level] = nakshatra;
periodSpan[level] = 120;

//Main method to show Drill dasha
//showDasa(nakshatra);

function Left(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else
        return String(str).substring(0, n);
}

function Right(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else {
        var iLen = String(str).length;
        return String(str).substring(iLen, iLen - n);
    }
}
        
$(document).ready(function () {
    showDasa(nakshatra);    
});

function fract(doubleValue) {
    return parseFloat(doubleValue) - parseInt(doubleValue);
}

function balance(moon) {
    var d0, n0, balance; //double
    var q, dd, mm, yy; //int
    d0 = moon;
    d0 = 9.0 * fract(d0 / 120);
    n0 = fract(d0);
    q = parseInt(d0);
    balance = (1 - n0) * y1[q];
    return balance;
}

// state variables -> lastEndDate, total, level, levelName, tillDate
function doubleToStringDate(doubleDate) {
    var bod = doubleDate;
    var yy, mm, dd;
    yy = parseInt(bod);
    mm = parseInt(fract(bod) * 12) + 1;
    dd = parseInt((fract(fract(bod) * 12)) * 31);
    if(dd==0){
        dd=1;
    }
    return (dd + '/' + mm + '/' + yy);
}

// returns nakshatra lord number
function getNakshatra(longitude) {
    var nak = parseInt(longitude * 0.075);
    if (nak >= 18)
        nak -= 18;
    if (nak >= 9)
        nak -= 9;
    return nak;
}

// generates the UI
function showDasa(startPlanet) {
    i = startPlanet;
    $("div.dasa").children().remove();
    for (var count = 0; count < 9; count++, i++) {
        if (i >= 9)
            i -= 9;
        if (level != 0)
            seperator = " - ";
        $("div.dasa").append('<div class="ui-planet ui-block-0">' + levelName[level] + seperator + planets[i] + '</div><div class="ui-block-1">' + dasa(i) + '</div>');
    }
    //history.pushState(JSON.stringify(tillDate), "title " + level, "?page=" + level);
    installClickHandler();
}

function dasa(i) {

    if (level == 0) {
        if (i == nakshatra)
            lastEndDate[level] = lastEndDate[level] + balance(moon);
        else
            lastEndDate[level] = lastEndDate[level] + y1[i];
    } else {
        lastEndDate[level] = lastEndDate[level] + periodSpan[level] * y1[i] / 120;
    }
    tillDate[i] = lastEndDate[level];
    return doubleToStringDate(lastEndDate[level]);
}

function installClickHandler() {
    // this function is called whenever we click on a row
    
    $("div.ui-planet").click(function () {
        if(level<3){
        level++;
        levelName[level] = this.innerHTML; //It contains name of the planet on which user clicked
        arStartPlanet[level] = planetNumber[Right(levelName[level], planetWidth)]; // It contains number of planet on which user clicked

        //this will contain start date of the dasa. for end dasa we will add each planet's period to this base period
        if ((arStartPlanet[level] == arStartPlanet[level-1]) && (level>1)) {
            lastEndDate[level] = lastStartDate[level-1];
            periodSpan[level] = tillDate[arStartPlanet[level]] - lastEndDate[level];
        } else
        {
            lastEndDate[level] = tillDate[((arStartPlanet[level] - 1 < 0) ? arStartPlanet[level] - 1 + 9 : arStartPlanet[level] - 1)];
            periodSpan[level] = tillDate[arStartPlanet[level]] - tillDate[((arStartPlanet[level] - 1 < 0) ? arStartPlanet[level] - 1 + 9 : arStartPlanet[level] - 1)];
        } 
        
        if (level > 1)
            total = total * y1[arStartPlanet[level]] / 120;

        //e.g. somebody clicked on last item
        if (periodSpan[level] < 0) {
            periodSpan[level] += total;
            lastEndDate[level] -= total;
        }
        lastStartDate[level] = lastEndDate[level];
        showDasa(arStartPlanet[level]);
        }
    });
}

function back() {
    if (level == 0)
        return;
    if (level > 1)
        total = total * 120 / y1[arStartPlanet[level]];
    level--;
    if (level == 0)
        seperator = "";
    lastEndDate[level] = lastStartDate[level];
    showDasa(arStartPlanet[level]);
}