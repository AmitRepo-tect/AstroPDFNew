/**********************************************************Start Code for PrintChart Method************************************************************ */
/*Description: It will be call the method to print chart either NorthIndianChart Style or SouthIndianChart Style */
/*Method type: Private */
/*Input: (1) Co-ordinates point x1, y1, x2, y2 (2)RaashiNo (3)Chart-Type (4)Language-code  */
/*Output: To print the chart in either NorthIndianChart Style or SouthIndianChart Style */
function PrintChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, Chart_Type, LanguageCode, truefalse) {
    if (Chart_Type == CHART_NORTH) {
        //alert("You are In PrintChart method");
        PrintNorthIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, truefalse)
        //PrintEastIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, arrPlanetsShodashvarga, LanguageCode, false);
    }
    else {
        PrintSouthIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, truefalse)

    }
}

function PrintChartofKP(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, arrBhavRashi, Rashiposition, Rashipositionforsouth, Chart_Type, LanguageCode, truefalse) {
    if (Chart_Type == CHART_NORTH) {

        PrintNorthIndianChartKP(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, arrBhavRashi, Rashiposition, LanguageCode, truefalse)
    }
    else {

        //PrintSouthIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, Rashipositionforsouth, LanguageCode, truefalse)
        PrintSouthIndianChartKP(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, Rashipositionforsouth, LanguageCode, truefalse)
    }
}

function PrintChartofCommon(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, arrBhavRashi, Rashiposition, Rashipositionforsouth, Chart_Type, LanguageCode, truefalse) {
    if (Chart_Type == CHART_NORTH) {

        PrintNorthIndianChartCommon(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, arrBhavRashi, Rashiposition, LanguageCode, truefalse)
    }
    else {

        //PrintSouthIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, Rashipositionforsouth, LanguageCode, truefalse)
        PrintSouthIndianChartCommon(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, Rashipositionforsouth, LanguageCode, truefalse)
    }
}
/***********************************************************End Code for PrintChart Method************************************************************ */

/* ****************************************Start Code for Print_North_Indian_Chart Method**************************************************** */
/*PrintEastIndianChart function to create and draw the East indian chart*/
/*BhavaValue is ignored in case of PrintEastIndianChart. Introduced just to have same signature.*/
function PrintNorthIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
    var totalPlanetInBhav;
    var aryPlanet;
    var XRashiPoint, YRashiPoint;
    var XPlanetCo_ordinate, YPlanetCo_ordinate;
    var XPlanetPoint, YPlanetPoint;
    var rashiNo, newRashiNo;
    var NewRaashiNoCorrespondingToPlanets = new Array(11);
    var currentBhavofPlanet;
    var tmp, i, lagnaRasi, fontcolor, ColorArray;
    var WesternPlanetPermissionvalue;
    WesternPlanetPermissionvalue = NORMAL_PLANET;

    totalPlanetInBhav = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    if (LanguageCode == LANGUAGE_ENGLISH) { aryPlanet = Array("Su", "Mo", "Ma", "Me", "Ju", "Ve", "Sa", "Ra", "Ke", "Ur", "Ne", "Pl"); }
    else { aryPlanet = Array("सू", "चं", "मं", "बु", "गु", "शु", "श", "रा", "के", "यू", "ने", "प्लू"); }
    ColorArray = Array("#F52443", "#554ffc", "#cc0000", "#008000", "#ff6600", "#e60073", "#0000ff", "#4d4d4d", "#C88E45", "#ff00ff", "#33cc33", "#33cccc");

    /* *****************************Co-ordinates of Rashi No.******************************** */
    XRashiPoint = new Array(139, 64, 54, 126, 50, 65, 139, 213, 227, 154, 228, 214);
    YRashiPoint = new Array(129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55);
    /* ****************************End Co-ordinates of Rashi No.***************************** */

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[0] = new Array(71, 25, 71, 71, 110, 45, 45, 89, 89);

    XPlanetPoint[1] = new Array(65, 36, 83, 62, 43, 83, 23, 103, 63);
    YPlanetPoint[1] = new Array(29, 9, 9, 9, 29, 29, 9, 9, 49);

    XPlanetPoint[2] = new Array(3, 3, 3, 3, 3, 23, 23, 23, 43);
    YPlanetPoint[2] = new Array(71, 91, 51, 31, 120, 71, 91, 51, 71);

    XPlanetPoint[3] = new Array(63, 63, 23, 103, 63, 43, 83, 43, 83);
    YPlanetPoint[3] = new Array(146, 105, 146, 146, 180, 126, 126, 166, 166);

    XPlanetPoint[4] = new Array(2, 2, 2, 2, 2, 23, 23, 23, 43);
    YPlanetPoint[4] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[5] = new Array(37, 91, 64, 64, 24, 44, 84, 104, 64);
    YPlanetPoint[5] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[6] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[6] = new Array(220, 181, 220, 220, 264, 201, 201, 240, 240);

    XPlanetPoint[7] = new Array(239, 187, 213, 213, 173, 193, 233, 253, 213);
    YPlanetPoint[7] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[8] = new Array(269, 269, 269, 269, 269, 249, 249, 249, 229);
    YPlanetPoint[8] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[9] = new Array(213, 213, 175, 253, 223, 193, 232, 193, 233);
    YPlanetPoint[9] = new Array(146, 105, 146, 146, 186, 126, 126, 166, 166);

    XPlanetPoint[10] = new Array(269, 269, 269, 269, 269, 249, 249, 249, 229);
    YPlanetPoint[10] = new Array(71, 91, 51, 31, 110, 71, 91, 51, 71);

    XPlanetPoint[11] = new Array(213, 188, 233, 212, 193, 233, 173, 253, 213);
    YPlanetPoint[11] = new Array(29, 9, 9, 9, 29, 29, 9, 9, 49);

    XPlanetCo_ordinate = new Array(12);
    for (var XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (var YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }

    /* ****************************Co-ordinates of Planets*********************************** */
    /*DrawLinesofChart method to draw all lines(Border/Digonal Lines) of Kundali*/
    DrawLinesofChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)


    /*SetFontSize to Set font size for Rashi No.*/
    SetFontSize(RASHI_FONT_SIZE);

    /*Code to print Rashi No. in the Chart*/
    lagnaRasi = RaashiNoCorrespondingToPlanets[0];

    for (i = 0; i < 12; i++) {

        newRashiNo = parseInt(lagnaRasi, 10) + i;
        //PrintText(110 + (i * 25), 80, newRashiNo);
        if (newRashiNo > 12) { newRashiNo = newRashiNo - 12 }
        if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = "#0d0d0d"; FontColorFunction(fontcolor) }
        //alert("lagnaRasi" + lagnaRasi);
        PrintText((XRashiPoint[i] + chart_topleft_x_new_cordinate + (XRashiPoint[i] / (320 - 21)) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XRashiPoint[i]), YRashiPoint[i] + chart_topleft_y_new_cordinate + (YRashiPoint[i] / (320 - 21)) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YRashiPoint[i], newRashiNo);
        //PrintText(110+(i*20), 120, newRashiNo);
    }


    /*Set font size to Print Planets*/
    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

    /*Calculate BhavaValue Position and store in array named NewRaashiNoCorrespondingToPlanets*/
    if (!BhavaValue) {
        for (i = 1; i <= 12; i++) {
            //alert(rasiToBhava(lagnaRasi, RaashiNoCorrespondingToPlanets[i]));
            NewRaashiNoCorrespondingToPlanets[i - 1] = rasiToBhava(lagnaRasi, RaashiNoCorrespondingToPlanets[i]);
            //alert(NewRaashiNoCorrespondingToPlanets[i - 1]);
        }
    }
    else {
        for (i = 1; i <= 12; i++) {
            NewRaashiNoCorrespondingToPlanets[i - 1] = RaashiNoCorrespondingToPlanets[i];
        }
    }

    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 11; i++) {
        if (WesternPlanetPermissionvalue && i == 9) {

            break;
        }
        else {
            currentBhavofPlanet = NewRaashiNoCorrespondingToPlanets[i];
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL(XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], aryPlanet[i], LanguageCode);
            totalPlanetInBhav[currentBhavofPlanet - 1] = totalPlanetInBhav[currentBhavofPlanet - 1] + 1;
        }
    }

} /* Close Brase for PrintNorthIndianChart Method */
/* ****************************************End Code for Print_North_Indian_Chart Method**************************************************** */

/*PrintSouthIndianChart function to create and draw the north indian chart*/
/*BhavaValue is ignored in case of SouthIndianChart. Introduced just to have same signature.*/
/* ********************************************************************************************************************************************* */
function PrintSouthIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
    //Declare variables
    var totalPlanetInBhav;
    var aryPlanet;
    var XRashiPoint, YRashiPoint;
    var XPlanetCo_ordinate, YPlanetCo_ordinate;
    var XPlanetPoint, YPlanetPoint;
    var NewRaashiNoCorrespondingToPlanets = new Array(12);
    var currentPosOfPlanet;
    var XCoForPlanetName, YCoForPlanetName;
    var tmp, i, lagnaRasi, fontcolor, ColorArray;

    var WesternPlanetPermissionvalue;
    WesternPlanetPermissionvalue = NORMAL_PLANET;
    totalPlanetInBhav = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    if (LanguageCode == LANGUAGE_ENGLISH) { aryPlanet = Array("ASC", "Su", "Mo", "Ma", "Me", "Ju", "Ve", "Sa", "Ra", "Ke", "Ur", "Ne", "Pl"); }
    else {
        //aryPlanet = Array("yXu", "lw", "pa", "ea", "cq", "xq", "’kq", "’k", "jk", "ds", ";w", "us", "Iyw");
        aryPlanet = Array("लग्न", "सू", "चं", "मं", "बु", "गु", "शु", "श", "रा", "के", "यू", "ने", "प्लू");
    }
    //ColorArray = Array("#F52443", "#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "#B71510", "#C88E45", "#FF0000", "#190634", "#0B0823");
      ColorArray = Array("#F52443", "#554ffc", "#cc0000", "#008000", "#ff6600", "#e60073", "#0000ff", "#4d4d4d", "#C88E45", "#ff00ff", "#33cc33", "#33cccc");

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(103, 74, 127, 74, 127, 92, 112, 92, 112);
    YPlanetPoint[0] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[1] = new Array(175, 149, 199, 149, 199, 164, 186, 164, 186);
    YPlanetPoint[1] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[2] = new Array(250, 224, 275, 224, 275, 248, 258, 238, 258);
    YPlanetPoint[2] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[3] = new Array(249, 224, 274, 224, 274, 239, 264, 239, 264);
    YPlanetPoint[3] = new Array(106, 80, 80, 137, 137, 92, 92, 121, 121);

    XPlanetPoint[4] = new Array(249, 224, 275, 224, 275, 238, 258, 238, 258);
    YPlanetPoint[4] = new Array(181, 155, 155, 206, 206, 166, 166, 199, 199);

    XPlanetPoint[5] = new Array(249, 224, 274, 224, 274, 238, 258, 238, 258);
    YPlanetPoint[5] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[6] = new Array(174, 150, 199, 150, 201, 165, 185, 165, 185);
    YPlanetPoint[6] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[7] = new Array(102, 75, 124, 75, 128, 92, 112, 92, 112);
    YPlanetPoint[7] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[8] = new Array(25, 0, 49, 0, 52, 17, 37, 17, 37);
    YPlanetPoint[8] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[9] = new Array(26, 0, 49, 0, 52, 17, 37, 167, 17, 37);
    YPlanetPoint[9] = new Array(181, 155, 154, 208, 208, 167, 199, 199);

    XPlanetPoint[10] = new Array(26, 0, 49, 0, 50, 17, 37, 17, 37);
    YPlanetPoint[10] = new Array(106, 80, 80, 134, 134, 92, 92, 121, 121);

    XPlanetPoint[11] = new Array(26, 0, 49, 0, 52, 16, 37, 16, 37);
    YPlanetPoint[11] = new Array(34, 4, 4, 63, 63, 19, 19, 47, 47);

    XPlanetCo_ordinate = new Array(12);
    for (var XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (var YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }

    /* ****************************Co-ordinates of Planets*********************************** */

    /*SetFontSize to Set font size for Rashi No.*/
    //SetFontSize(RASHI_FONT_SIZE);

    /*Draw All Lines(Border/Digonal Lines) of Kundali*/
    DrawLinesofSouthChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)


    /*Set font size to Print Planets*/
    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

    //Valid values are: 0 - left (default), 1 - right, 2 - center and 3 - justified. Width property must also be specified.
    // FontAlignent(TEXT_ALIGNMENT_JUSTIFY,FONT_WIDTH)

    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 12; i++) {
        if ((NORMAL_PLANET) && (i == 10)) {

            //break;
        }
        else {
            currentPosOfPlanet = RaashiNoCorrespondingToPlanets[i];
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL((XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), (YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), aryPlanet[i], LanguageCode);
            totalPlanetInBhav[currentPosOfPlanet - 1] = totalPlanetInBhav[currentPosOfPlanet - 1] + 1;
        }
    }

}
/* End PrintSouthIndianChart function to create and draw the chart */
/* ********************************************************************************************************************************************** */

/* PrintEastIndianChart function to create and draw the East indian chart */
/* BhavaValue is ignored in case of PrintEastIndianChart. Introduced just to have same signature. */
/* ********************************************************************************************************************************************** */
function PrintEastIndianChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
    /* Declare variables */
    var totalPlanetInBhav;
    var aryPlanet;
    var XRashiPoint, YRashiPoint;
    var XPlanetCo_ordinate, YPlanetCo_ordinate;
    var XPlanetPoint, YPlanetPoint;
    var NewRaashiNoCorrespondingToPlanets = new Array(12);
    var currentPosOfPlanet;
    var XCoForPlanetName, YCoForPlanetName;
    var tmp, i, lagnaRasi, fontcolor, ColorArray;
    var WesternPlanetPermissionvalue;

    WesternPlanetPermissionvalue = NORMAL_PLANET;
    totalPlanetInBhav = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    if (LanguageCode == LANGUAGE_ENGLISH) { aryPlanet = Array("Su", "Mo", "Ma", "Me", "Ju", "Ve", "Sa", "Ra", "Ke", "Ur", "Ne", "Pl"); }
    else { aryPlanet = Array("सू", "चं", "मं", "बु", "गु", "शु", "श", "रा", "के", "यू", "ने", "प्लू"); }
    ColorArray = Array("#F52443", "#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "&HB71510", "#C88E45", "#FF0000", "#190634", "#0B0823");

    //'*****************************Co-ordinates of Planets***********************************
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(138, 138, 103, 173, 138, 118, 158, 118, 158);
    YPlanetPoint[0] = new Array(50, 6, 50, 50, 87, 24, 24, 71, 71);

    XPlanetPoint[1] = new Array(62, 62, 62, 38, 19, 19, 76, 62, 42);
    YPlanetPoint[1] = new Array(50, 8, 24, 8, 8, 24, 24, 37, 37);

    XPlanetPoint[2] = new Array(2, 2, 2, 2, 27, 27, 27, 47, 47);
    YPlanetPoint[2] = new Array(50, 66, 30, 84, 84, 50, 67, 84, 67);

    XPlanetPoint[3] = new Array(42, 42, 2, 72, 72, 22, 62, 22, 62);
    YPlanetPoint[3] = new Array(141, 107, 141, 141, 181, 121, 121, 161, 161);

    XPlanetPoint[4] = new Array(1, 1, 1, 27, 27, 52, 1, 22, 44);
    YPlanetPoint[4] = new Array(247, 227, 208, 208, 227, 207, 262, 242, 227);

    XPlanetPoint[5] = new Array(63, 63, 63, 39, 43, 75, 19, 26, 44);
    YPlanetPoint[5] = new Array(246, 285, 266, 285, 266, 226, 285, 266, 246);

    XPlanetPoint[6] = new Array(138, 138, 103, 173, 138, 118, 158, 118, 158);
    YPlanetPoint[6] = new Array(246, 207, 246, 246, 286, 227, 227, 266, 267);

    XPlanetPoint[7] = new Array(202, 202, 202, 202, 229, 229, 229, 249, 249);
    YPlanetPoint[7] = new Array(246, 226, 266, 286, 286, 266, 246, 286, 266);

    XPlanetPoint[8] = new Array(268, 268, 268, 244, 244, 222, 228, 268, 248);
    YPlanetPoint[8] = new Array(244, 225, 205, 205, 225, 204, 224, 257, 239);

    XPlanetPoint[9] = new Array(239, 239, 204, 272, 244, 219, 258, 219, 259);
    YPlanetPoint[9] = new Array(141, 107, 141, 141, 181, 121, 121, 161, 161);

    XPlanetPoint[10] = new Array(268, 268, 268, 244, 222, 222, 228, 268, 248);
    YPlanetPoint[10] = new Array(50, 70, 34, 86, 86, 50, 70, 89, 70);

    XPlanetPoint[11] = new Array(204, 204, 204, 229, 229, 229, 204, 224, 247);
    YPlanetPoint[11] = new Array(50, 30, 10, 10, 30, 9, 64, 50, 28);

    XPlanetCo_ordinate = new Array(12);
    for (XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }
    /* ****************************Co-ordinates of Planets*********************************** */

    /* Draw All Lines(Border/Digonal Lines) of Kundali */
    DrawLinesofEastChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)

    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

    //FontAlignent(TEXT_ALIGNMENT_JUSTIFY, FONT_WIDTH);

    /* Code to print Planets in the Chart */
    for (i = 0; i < 12; i++) {
        if (WesternPlanetPermissionvalue && i == 9) {
            break;
        }
        else {
            currentPosOfPlanet = RaashiNoCorrespondingToPlanets[i];
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL((XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), (YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), aryPlanet[i], LanguageCode);
            totalPlanetInBhav[currentPosOfPlanet - 1] = totalPlanetInBhav[currentPosOfPlanet - 1] + 1;
        }
    }
}
/* End PrintEastIndianChart function to create and draw the chart */
/* ********************************************************************************************************************************************* */



/* CheckRetrograde function is use to check Planet is Retrograde or Direct */
/*function CheckRetrograde(PlanetName) {
if(myAstrologyObject.isPlanetDirect(PlanetName) == "True") {
CheckRetrograde = "True";
}
else {
CheckRetrograde = "False";
}
}
*/
function IIIf(condition, truecase, falsecase) {
    if (condition)
        return truecase;
    else
        return falsecase;

}

function getKPPlanetBhavaPosition(planetLongitude, cuspsLongitudes) {
    var pl, startd, endd, d3, bhava;
    pl = planetLongitude;
    for (j = 0; j <= 11; j++) {
        startd = cuspsLongitudes[j];
        endd = cuspsLongitudes[IIIf(j >= 11, j - 11, j + 1)];
        if (startd > endd) {
            d3 = endd;
            endd = endd + 360;  //' 360#
        }
        if (d3 != 0)  //  'If (d3 <> 0#) Then
        {
            if (pl < d3) {
                pl = pl + 360;
                d3 = 0;      //'0#
            }
        }
        if (pl >= startd && pl < endd) {
            bhava = j + 1;
            break; //Exit For
        }
    }
    return bhava;
}

/*Calculate rasiToBhava Position in a Traditional Chart*/
function rasiToBhava(lagnaRasi, planetRasi) {
    var bhava;
    bhava = planetRasi - lagnaRasi;
    if (bhava < 0) { bhava = bhava + 12; } return (bhava + 1);
}


function PrintSouthIndianChartKP(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
    //Declare variables
    //alert(RaashiNoCorrespondingToPlanets[0].val2);
    var totalPlanetInBhav;
    var aryPlanet;
    var XRashiPoint, YRashiPoint;
    var XPlanetCo_ordinate, YPlanetCo_ordinate;
    var XPlanetPoint, YPlanetPoint;
    var NewRaashiNoCorrespondingToPlanets = new Array(12);
    var currentPosOfPlanet;
    var XCoForPlanetName, YCoForPlanetName;
    var tmp, i, lagnaRasi, fontcolor, ColorArray;

    var WesternPlanetPermissionvalue;
    WesternPlanetPermissionvalue = NORMAL_PLANET;
    totalPlanetInBhav = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    if (LanguageCode == LANGUAGE_ENGLISH) { aryPlanet = Array("Su", "Mo", "Ma", "Me", "Ju", "Ve", "Sa", "Ra", "Ke", "Ur", "Ne", "Pl", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII"); }
    else {
        //aryPlanet = Array("yXu", "lw", "pa", "ea", "cq", "xq", "’kq", "’k", "jk", "ds", ";w", "us", "Iyw");
        aryPlanet = Array("सू", "चं", "मं", "बु", "गु", "शु", "श", "रा", "के", "यू", "ने", "प्लू", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12");
    }
    ColorArray = Array("#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "#B71510", "#C88E45", "#FF0000", "#190634", "#B71510", "#B63BB0", "#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "#B71510", "#C88E45", "#FF0000", "#190634", "#B71510", "#B63BB0");


    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(76, 76, 76, 76, 76, 76, 76, 76, 76);
    YPlanetPoint[0] = new Array(1, 12, 24, 36, 48, 60, 72, 84, 96);

    XPlanetPoint[1] = new Array(149, 149, 149, 149, 149, 149, 149, 149, 149);
    YPlanetPoint[1] = new Array(1, 12, 24, 36, 48, 60, 72, 84, 96);

    XPlanetPoint[2] = new Array(224, 224, 224, 224, 224, 224, 224, 224, 224);
    YPlanetPoint[2] = new Array(1, 12, 24, 36, 48, 60, 72, 84, 96);

    XPlanetPoint[3] = new Array(224, 224, 224, 224, 224, 224, 224, 224, 224);
    YPlanetPoint[3] = new Array(75, 87, 99, 111, 123, 135, 147, 159, 171);

    XPlanetPoint[4] = new Array(224, 224, 224, 224, 224, 224, 224, 224, 224);
    YPlanetPoint[4] = new Array(149, 161, 173, 185, 197, 209, 221, 233, 245);

    XPlanetPoint[5] = new Array(224, 224, 224, 224, 224, 224, 224, 224, 224);
    YPlanetPoint[5] = new Array(224, 236, 248, 260, 272, 284, 296, 308, 320);

    XPlanetPoint[6] = new Array(149, 149, 149, 149, 149, 149, 149, 149, 149);
    YPlanetPoint[6] = new Array(279, 267, 255, 243, 231, 219, 207, 195, 183);

    XPlanetPoint[7] = new Array(76, 76, 76, 76, 76, 76, 76, 76, 76);
    YPlanetPoint[7] = new Array(279, 267, 255, 243, 231, 219, 207, 195, 183);

    XPlanetPoint[8] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
    YPlanetPoint[8] = new Array(279, 267, 255, 243, 231, 219, 207, 195, 183);

    XPlanetPoint[9] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    YPlanetPoint[9] = new Array(204, 192, 180, 168, 156, 144, 132, 120, 108);

    XPlanetPoint[10] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
    YPlanetPoint[10] = new Array(132, 120, 108, 96, 84, 72, 60, 48, 36);

    XPlanetPoint[11] = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
    YPlanetPoint[11] = new Array(55, 43, 31, 19, 7, 0, 66, 77, 88);

    XPlanetCo_ordinate = new Array(12);
    for (var XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (var YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }

    /* ****************************Co-ordinates of Planets*********************************** */

    /*SetFontSize to Set font size for Rashi No.*/
    //SetFontSize(RASHI_FONT_SIZE);

    /*Draw All Lines(Border/Digonal Lines) of Kundali*/
    DrawLinesofSouthChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate);

    for (j = 0; j <= 11; j++) {
        //alert(count);
        // alert(Object.keys(RaashiNoCorrespondingToPlanets[j]));
        for (countkp = 1; countkp <= Object.keys(RaashiNoCorrespondingToPlanets[j]).length; countkp++) {
            switch (countkp) {
                case 1:
                    newvalue = RaashiNoCorrespondingToPlanets[j].val1;
                    splitnewvalue = newvalue.split("#");
                    break;
                case 2:
                    newvalue = RaashiNoCorrespondingToPlanets[j].val2;
                    splitnewvalue = newvalue.split("#");
                    break;
                case 3:
                    newvalue = RaashiNoCorrespondingToPlanets[j].val3;
                    splitnewvalue = newvalue.split("#");
                    break;
                case 4:
                    newvalue = RaashiNoCorrespondingToPlanets[j].val4;
                    splitnewvalue = newvalue.split("#");
                    break;
                case 5:
                    newvalue = RaashiNoCorrespondingToPlanets[j].val5;
                    splitnewvalue = newvalue.split("#");
                    break;
                case 6:
                    newvalue = RaashiNoCorrespondingToPlanets[j].val6;
                    splitnewvalue = newvalue.split("#");
                    break;
                case 7:
                    newvalue = RaashiNoCorrespondingToPlanets[j].val7;
                    splitnewvalue = newvalue.split("#");
                    break;
            }

            /*Set font size to Print Planets*/
            if (LanguageCode == LANGUAGE_ENGLISH) {
                SetFontSize(ENGLISH_PLANAT_KP__FONT_SIZE);
                valueOfpoint = splitnewvalue[1];
            } else {
            SetFontSize(ENGLISH_PLANAT_KP__FONT_SIZE);
                valueOfpoint = splitnewvalue[1].replace(/&/g, ".");
            }

            //alert(splitnewvalue[1]);
            currentPosOfPlanet = parseInt(j) + 1;
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[j]; FontColorFunction(fontcolor) }
            PrintTextL((XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), (YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), aryPlanet[splitnewvalue[0]] + " " + valueOfpoint, LanguageCode);
            totalPlanetInBhav[currentPosOfPlanet - 1] = totalPlanetInBhav[currentPosOfPlanet - 1] + 1;
        }
    }
}



function PrintNorthIndianChartKP(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, rasiofplanet, Rasipostion, LanguageCode, BhavaValue) {
    var totalPlanetInBhav;
    var aryPlanet;
    var XRashiPoint, YRashiPoint;
    var XPlanetCo_ordinate, YPlanetCo_ordinate;
    var XPlanetPoint, YPlanetPoint;
    var rashiNo, newRashiNo;
    var NewRaashiNoCorrespondingToPlanets = new Array(11);
    var currentBhavofPlanet;
    var tmp, i, lagnaRasi, fontcolor, ColorArray;
    var WesternPlanetPermissionvalue;
    WesternPlanetPermissionvalue = NORMAL_PLANET;

    totalPlanetInBhav = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    if (LanguageCode == LANGUAGE_ENGLISH) { aryPlanet = Array("Su", "Mo", "Ma", "Me", "Ju", "Ve", "Sa", "Ra", "Ke", "Ur", "Ne", "Pl"); }
    else { aryPlanet = Array("सू", "चं", "मं", "बु", "गु", "शु", "श", "रा", "के", "यू", "ने", "प्लू"); }
   // ColorArray = Array("#F52443", "#a5a2fe", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "#B71510", "#C88E45", "#FF0000", "#190634", "#0B0823");
    ColorArray = Array("#F52443", "#554ffc", "#cc0000", "#008000", "#ff6600", "#e60073", "#0000ff", "#4d4d4d", "#C88E45", "#ff00ff", "#33cc33", "#33cccc");

    /* *****************************Co-ordinates of Rashi No.******************************** */
    XRashiPoint = new Array(139, 64, 54, 126, 50, 65, 139, 213, 227, 154, 228, 214);
    YRashiPoint = new Array(129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55);
    /* ****************************End Co-ordinates of Rashi No.***************************** */

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[0] = new Array(71, 25, 71, 71, 110, 45, 45, 89, 89);

    XPlanetPoint[1] = new Array(65, 36, 83, 62, 43, 83, 23, 103, 63);
    YPlanetPoint[1] = new Array(29, 9, 9, 9, 29, 29, 9, 9, 49);

    XPlanetPoint[2] = new Array(3, 3, 3, 3, 3, 23, 23, 23, 43);
    YPlanetPoint[2] = new Array(71, 91, 51, 31, 120, 71, 91, 51, 71);

    XPlanetPoint[3] = new Array(63, 63, 23, 103, 63, 43, 83, 43, 83);
    YPlanetPoint[3] = new Array(146, 105, 146, 146, 180, 126, 126, 166, 166);

    XPlanetPoint[4] = new Array(2, 2, 2, 2, 2, 23, 23, 23, 43);
    YPlanetPoint[4] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[5] = new Array(37, 91, 64, 64, 24, 44, 84, 104, 64);
    YPlanetPoint[5] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[6] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[6] = new Array(220, 181, 220, 220, 264, 201, 201, 240, 240);

    XPlanetPoint[7] = new Array(239, 187, 213, 213, 173, 193, 233, 253, 213);
    YPlanetPoint[7] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[8] = new Array(269, 269, 269, 269, 269, 249, 249, 249, 229);
    YPlanetPoint[8] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[9] = new Array(213, 213, 175, 253, 223, 193, 232, 193, 233);
    YPlanetPoint[9] = new Array(146, 105, 146, 146, 186, 126, 126, 166, 166);

    XPlanetPoint[10] = new Array(269, 269, 269, 269, 269, 249, 249, 249, 229);
    YPlanetPoint[10] = new Array(71, 91, 51, 31, 110, 71, 91, 51, 71);

    XPlanetPoint[11] = new Array(213, 188, 233, 212, 193, 233, 173, 253, 213);
    YPlanetPoint[11] = new Array(29, 9, 9, 9, 29, 29, 9, 9, 49);

    XPlanetCo_ordinate = new Array(12);
    for (var XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (var YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }

    /* ****************************Co-ordinates of Planets*********************************** */
    /*DrawLinesofChart method to draw all lines(Border/Digonal Lines) of Kundali*/
    DrawLinesofChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)


    /*SetFontSize to Set font size for Rashi No.*/
    SetFontSize(RASHI_FONT_SIZE);

    /*Code to print Rashi No. in the Chart*/
    lagnaRasi = RaashiNoCorrespondingToPlanets[0];

    for (i = 0; i < 12; i++) {

        // newRashiNo = parseInt(lagnaRasi, 10) + i;
        newRashiNo = Rasipostion[i];
        //PrintText(110 + (i * 25), 80, newRashiNo);
        if (newRashiNo > 12) { newRashiNo = newRashiNo - 12 }
        if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = "#0d0d0d"; FontColorFunction(fontcolor) }
        //alert("lagnaRasi" + lagnaRasi);
        PrintText((XRashiPoint[i] + chart_topleft_x_new_cordinate + (XRashiPoint[i] / (320 - 21)) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XRashiPoint[i]), YRashiPoint[i] + chart_topleft_y_new_cordinate + (YRashiPoint[i] / (320 - 21)) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YRashiPoint[i], newRashiNo);
        //PrintText(110+(i*20), 120, newRashiNo);
    }


    /*Set font size to Print Planets*/
    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

    /*Calculate BhavaValue Position and store in array named NewRaashiNoCorrespondingToPlanets*/
    if (!BhavaValue) {
        for (i = 1; i <= 12; i++) {
            //alert(rasiToBhava(lagnaRasi, RaashiNoCorrespondingToPlanets[i]));
            NewRaashiNoCorrespondingToPlanets[i - 1] = rasiToBhava(lagnaRasi, RaashiNoCorrespondingToPlanets[i]);
            //alert(NewRaashiNoCorrespondingToPlanets[i - 1]);
        }
    }
    else {
        for (i = 1; i <= 12; i++) {
            NewRaashiNoCorrespondingToPlanets[i - 1] = RaashiNoCorrespondingToPlanets[i];
        }
    }

    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 11; i++) {
        if (WesternPlanetPermissionvalue && i == 9) {

            break;
        }
        else {
            currentBhavofPlanet = NewRaashiNoCorrespondingToPlanets[i];
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL(XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], aryPlanet[i] + "(" + rasiofplanet[i] + ")", LanguageCode);
            totalPlanetInBhav[currentBhavofPlanet - 1] = totalPlanetInBhav[currentBhavofPlanet - 1] + 1;
        }
    }

} /* Close Brase for PrintNorthIndianChartKP Method */

function PrintNorthIndianChartCommon(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, rasiofplanet, Rasipostion, LanguageCode, BhavaValue) {
    var totalPlanetInBhav;
    var aryPlanet;
    var XRashiPoint, YRashiPoint;
    var XPlanetCo_ordinate, YPlanetCo_ordinate;
    var XPlanetPoint, YPlanetPoint;
    var rashiNo, newRashiNo;
    var NewRaashiNoCorrespondingToPlanets = new Array(11);
    var currentBhavofPlanet;
    var tmp, i, lagnaRasi, fontcolor, ColorArray;
    var WesternPlanetPermissionvalue;
    WesternPlanetPermissionvalue = NORMAL_PLANET;

    totalPlanetInBhav = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    if (LanguageCode == LANGUAGE_ENGLISH) { aryPlanet = Array("Su", "Mo", "Ma", "Me", "Ju", "Ve", "Sa", "Ra", "Ke", "Ur", "Ne", "Pl"); }
    else { aryPlanet = Array("सू", "चं", "मं", "बु", "गु", "शु", "श", "रा", "के", "यू", "ने", "प्लू"); }
    //ColorArray = Array("#F52443", "#a5a2fe", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "#B71510", "#C88E45", "#FF0000", "#190634", "#0B0823");
    ColorArray = Array("#F52443", "#554ffc", "#cc0000", "#008000", "#ff6600", "#e60073", "#0000ff", "#4d4d4d", "#C88E45", "#ff00ff", "#33cc33", "#33cccc");

    /* *****************************Co-ordinates of Rashi No.******************************** */
    XRashiPoint = new Array(139, 64, 54, 126, 50, 65, 139, 213, 227, 154, 228, 214);
    YRashiPoint = new Array(129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55);
    /* ****************************End Co-ordinates of Rashi No.***************************** */

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[0] = new Array(71, 25, 71, 71, 110, 45, 45, 89, 89);

    XPlanetPoint[1] = new Array(65, 36, 83, 62, 43, 83, 23, 103, 63);
    YPlanetPoint[1] = new Array(29, 9, 9, 9, 29, 29, 9, 9, 49);

    XPlanetPoint[2] = new Array(3, 3, 3, 3, 3, 23, 23, 23, 43);
    YPlanetPoint[2] = new Array(71, 91, 51, 31, 120, 71, 91, 51, 71);

    XPlanetPoint[3] = new Array(63, 63, 23, 103, 63, 43, 83, 43, 83);
    YPlanetPoint[3] = new Array(146, 105, 146, 146, 180, 126, 126, 166, 166);

    XPlanetPoint[4] = new Array(2, 2, 2, 2, 2, 23, 23, 23, 43);
    YPlanetPoint[4] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[5] = new Array(37, 91, 64, 64, 24, 44, 84, 104, 64);
    YPlanetPoint[5] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[6] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[6] = new Array(220, 181, 220, 220, 264, 201, 201, 240, 240);

    XPlanetPoint[7] = new Array(239, 187, 213, 213, 173, 193, 233, 253, 213);
    YPlanetPoint[7] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[8] = new Array(269, 269, 269, 269, 269, 249, 249, 249, 229);
    YPlanetPoint[8] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[9] = new Array(213, 213, 175, 253, 223, 193, 232, 193, 233);
    YPlanetPoint[9] = new Array(146, 105, 146, 146, 186, 126, 126, 166, 166);

    XPlanetPoint[10] = new Array(269, 269, 269, 269, 269, 249, 249, 249, 229);
    YPlanetPoint[10] = new Array(71, 91, 51, 31, 110, 71, 91, 51, 71);

    XPlanetPoint[11] = new Array(213, 188, 233, 212, 193, 233, 173, 253, 213);
    YPlanetPoint[11] = new Array(29, 9, 9, 9, 29, 29, 9, 9, 49);

    XPlanetCo_ordinate = new Array(12);
    for (var XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (var YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }

    /* ****************************Co-ordinates of Planets*********************************** */
    /*DrawLinesofChart method to draw all lines(Border/Digonal Lines) of Kundali*/
    DrawLinesofChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)


    /*SetFontSize to Set font size for Rashi No.*/
    SetFontSize(RASHI_FONT_SIZE);

    /*Code to print Rashi No. in the Chart*/
    lagnaRasi = RaashiNoCorrespondingToPlanets[0];

    for (i = 0; i < 12; i++) {

        newRashiNo = parseInt(lagnaRasi, 10) + i;
        //PrintText(110 + (i * 25), 80, newRashiNo);
        if (newRashiNo > 12) { newRashiNo = newRashiNo - 12 }
        if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = "#0d0d0d"; FontColorFunction(fontcolor) }
        //alert("lagnaRasi" + lagnaRasi);
        PrintText((XRashiPoint[i] + chart_topleft_x_new_cordinate + (XRashiPoint[i] / (320 - 21)) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XRashiPoint[i]), YRashiPoint[i] + chart_topleft_y_new_cordinate + (YRashiPoint[i] / (320 - 21)) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YRashiPoint[i], newRashiNo);
        //PrintText(110+(i*20), 120, newRashiNo);
    }


    /*Set font size to Print Planets*/
    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

    /*Calculate BhavaValue Position and store in array named NewRaashiNoCorrespondingToPlanets*/
    if (!BhavaValue) {
        for (i = 1; i <= 12; i++) {
            //alert(rasiToBhava(lagnaRasi, RaashiNoCorrespondingToPlanets[i]));
            NewRaashiNoCorrespondingToPlanets[i - 1] = rasiToBhava(lagnaRasi, RaashiNoCorrespondingToPlanets[i]);
            //alert(NewRaashiNoCorrespondingToPlanets[i - 1]);
        }
    }
    else {
        for (i = 1; i <= 12; i++) {
            NewRaashiNoCorrespondingToPlanets[i - 1] = RaashiNoCorrespondingToPlanets[i];
        }
    }

    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 11; i++) {
        if (WesternPlanetPermissionvalue && i == 9) {

            break;
        }
        else {
            currentBhavofPlanet = NewRaashiNoCorrespondingToPlanets[i];
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL(XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], aryPlanet[i], LanguageCode);
            totalPlanetInBhav[currentBhavofPlanet - 1] = totalPlanetInBhav[currentBhavofPlanet - 1] + 1;
        }
    }


} /* Close Brase for PrintNorthIndianChartKP Method */

function PrintSouthIndianChartCommon(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
    //Declare variables
    var totalPlanetInBhav;
    var aryPlanet;
    var XRashiPoint, YRashiPoint;
    var XPlanetCo_ordinate, YPlanetCo_ordinate;
    var XPlanetPoint, YPlanetPoint;
    var NewRaashiNoCorrespondingToPlanets = new Array(12);
    var currentPosOfPlanet;
    var XCoForPlanetName, YCoForPlanetName;
    var tmp, i, lagnaRasi, fontcolor, ColorArray;

    var WesternPlanetPermissionvalue;
    WesternPlanetPermissionvalue = NORMAL_PLANET;
    totalPlanetInBhav = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

    if (LanguageCode == LANGUAGE_ENGLISH) { aryPlanet = Array("ASC", "Su", "Mo", "Ma", "Me", "Ju", "Ve", "Sa", "Ra", "Ke", "Ur", "Ne", "Pl"); }
    else {
        //aryPlanet = Array("yXu", "lw", "pa", "ea", "cq", "xq", "’kq", "’k", "jk", "ds", ";w", "us", "Iyw");
        aryPlanet = Array("लग्न", "सू", "चं", "मं", "बु", "गु", "शु", "श", "रा", "के", "यू", "ने", "प्लू");
    }
   // ColorArray = Array("#F52443", "#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "#B71510", "#C88E45", "#FF0000", "#190634", "#0B0823");
    ColorArray = Array("#F52443", "#554ffc", "#cc0000", "#008000", "#ff6600", "#e60073", "#0000ff", "#4d4d4d", "#C88E45", "#ff00ff", "#33cc33", "#33cccc");

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(103, 74, 127, 74, 127, 92, 112, 92, 112);
    YPlanetPoint[0] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[1] = new Array(175, 149, 199, 149, 199, 164, 186, 164, 186);
    YPlanetPoint[1] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[2] = new Array(250, 224, 275, 224, 275, 248, 258, 238, 258);
    YPlanetPoint[2] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[3] = new Array(249, 224, 274, 224, 274, 239, 264, 239, 264);
    YPlanetPoint[3] = new Array(106, 80, 80, 137, 137, 92, 92, 121, 121);

    XPlanetPoint[4] = new Array(249, 224, 275, 224, 275, 238, 258, 238, 258);
    YPlanetPoint[4] = new Array(181, 155, 155, 206, 206, 166, 166, 199, 199);

    XPlanetPoint[5] = new Array(249, 224, 274, 224, 274, 238, 258, 238, 258);
    YPlanetPoint[5] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[6] = new Array(174, 150, 199, 150, 201, 165, 185, 165, 185);
    YPlanetPoint[6] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[7] = new Array(102, 75, 124, 75, 128, 92, 112, 92, 112);
    YPlanetPoint[7] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[8] = new Array(25, 0, 49, 0, 52, 17, 37, 17, 37);
    YPlanetPoint[8] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[9] = new Array(26, 0, 49, 0, 52, 17, 37, 167, 17, 37);
    YPlanetPoint[9] = new Array(181, 155, 154, 208, 208, 167, 199, 199);

    XPlanetPoint[10] = new Array(26, 0, 49, 0, 50, 17, 37, 17, 37);
    YPlanetPoint[10] = new Array(106, 80, 80, 134, 134, 92, 92, 121, 121);

    XPlanetPoint[11] = new Array(26, 0, 49, 0, 52, 16, 37, 16, 37);
    YPlanetPoint[11] = new Array(34, 4, 4, 63, 63, 19, 19, 47, 47);

    XPlanetCo_ordinate = new Array(12);
    for (var XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (var YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }

    /* ****************************Co-ordinates of Planets*********************************** */

    /*SetFontSize to Set font size for Rashi No.*/
    //SetFontSize(RASHI_FONT_SIZE);

    /*Draw All Lines(Border/Digonal Lines) of Kundali*/
    DrawLinesofSouthChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)


    /*Set font size to Print Planets*/
    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

    //Valid values are: 0 - left (default), 1 - right, 2 - center and 3 - justified. Width property must also be specified.
    // FontAlignent(TEXT_ALIGNMENT_JUSTIFY,FONT_WIDTH)

    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 12; i++) {
        if ((NORMAL_PLANET) && (i == 10)) {

            //break;
        }
        else {
            currentPosOfPlanet = RaashiNoCorrespondingToPlanets[i];
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL((XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), (YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), aryPlanet[i], LanguageCode);
            totalPlanetInBhav[currentPosOfPlanet - 1] = totalPlanetInBhav[currentPosOfPlanet - 1] + 1;
        }
    }

}