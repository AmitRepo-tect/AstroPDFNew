/************************DrawLinesofChart method Definition to draw all lines(Border/Digonal Lines) of Kundali for North Chart***********************/
function DrawLinesofChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate) {
    var chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, chart_bottomright_y_cordinate;
    chart_topleft_x_cordinate = 21 + (chart_topleft_x_new_cordinate - 21);
    chart_topleft_y_cordinate = 21 + (chart_topleft_y_new_cordinate - 21);
    chart_bottomright_x_cordinate = 320 + (chart_bottomright_x_new_cordinate - 320);
    chart_bottomright_y_cordinate = 320 + (chart_bottomright_y_new_cordinate - 320);
    
    //alert("DrawLinesofChart" + chart_topleft_x_cordinate);
    //'Draw Diagonal Lines of Chart
    lineWidth(.2);
    CanvasLine(chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, chart_bottomright_y_cordinate);
    lineWidth(.2);
    CanvasLine(chart_bottomright_x_cordinate, chart_topleft_y_cordinate, chart_topleft_x_cordinate, chart_bottomright_y_cordinate);
    lineWidth(.2);
    CanvasLine((chart_bottomright_x_cordinate - chart_topleft_x_cordinate) / 2 + chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, (chart_bottomright_y_cordinate - chart_topleft_y_cordinate) / 2 + chart_topleft_y_cordinate);
    CanvasLine(chart_bottomright_x_cordinate, (chart_bottomright_y_cordinate - chart_topleft_y_cordinate) / 2 + chart_topleft_y_cordinate, (chart_bottomright_x_cordinate - chart_topleft_x_cordinate) / 2 + chart_topleft_x_cordinate, chart_bottomright_y_cordinate);
    CanvasLine((chart_bottomright_x_cordinate - chart_topleft_x_cordinate) / 2 + chart_topleft_x_cordinate, chart_bottomright_y_cordinate, chart_topleft_x_cordinate, (chart_bottomright_y_cordinate - chart_topleft_y_cordinate) / 2 + chart_topleft_y_cordinate);
    CanvasLine(chart_topleft_x_cordinate, (chart_bottomright_y_cordinate - chart_topleft_y_cordinate) / 2 + chart_topleft_y_cordinate, (chart_bottomright_x_cordinate - chart_topleft_x_cordinate) / 2 + chart_topleft_x_cordinate, chart_topleft_y_cordinate);
    lineWidth(.2);
    
    DrawRectangle(chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, chart_bottomright_y_cordinate)
    DrawRectangle(chart_topleft_x_cordinate - .2, chart_topleft_y_cordinate - .2, chart_bottomright_x_cordinate + .2, chart_bottomright_y_cordinate + .2)
}
/************************DrawLinesofChart method Definition to draw all lines(Border Lines) of Kundali for South Chart***********************/
function DrawLinesofSouthChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate) {
    var chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, chart_bottomright_y_cordinate, y1;
    chart_topleft_x_cordinate = 21 + (chart_topleft_x_new_cordinate - 21);
    chart_topleft_y_cordinate = 21 + (chart_topleft_y_new_cordinate - 21);
    chart_bottomright_x_cordinate = 320 + (chart_bottomright_x_new_cordinate - 320);
    chart_bottomright_y_cordinate = 320 + (chart_bottomright_y_new_cordinate - 320);

    /* Draw Horizontal and vertical Lines of Chart */
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 1.93 + (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate - 4, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 4 + chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 4 + chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 4 + chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 4 + chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine(chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate);
    CanvasLine(chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2 + chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 4 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2 + chart_topleft_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 4 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2 + chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2 + chart_topleft_y_new_cordinate);
    CanvasLine(chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate / 2 + chart_bottomright_y_new_cordinate / 4, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate / 2 + chart_bottomright_y_new_cordinate / 4);
    
    /* Draw Border(Inner, Outer) of Chart */
    DrawRectangle(chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, chart_bottomright_y_cordinate);
    DrawRectangle(chart_topleft_x_cordinate - 2.5, chart_topleft_y_cordinate - 2.5, chart_bottomright_x_cordinate + 3, chart_bottomright_y_cordinate + 3);
}
/************************DrawLinesofChart method Definition to draw all lines(Border Lines) of Kundali for East Chart***********************/
function DrawLinesofEastChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate) {
    var chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, chart_bottomright_y_cordinate;
    chart_topleft_x_cordinate = 21 + (chart_topleft_x_new_cordinate - 21);
    chart_topleft_y_cordinate = 21 + (chart_topleft_y_new_cordinate - 21);
    chart_bottomright_x_cordinate = 320 + (chart_bottomright_x_new_cordinate - 320);
    chart_bottomright_y_cordinate = 320 + (chart_bottomright_y_new_cordinate - 320);
    //'Draw Border(Inner, Outer) of Chart

    DrawRectangle(chart_topleft_x_cordinate, chart_topleft_y_cordinate, chart_bottomright_x_cordinate, chart_bottomright_y_cordinate);
    //DrawRectangle(chart_topleft_x_cordinate - 2, chart_topleft_y_cordinate - 2, chart_bottomright_x_cordinate + 2, chart_bottomright_y_cordinate + 2);
    DrawRectangle(chart_topleft_x_cordinate - 2.5, chart_topleft_y_cordinate - 2.5, chart_bottomright_x_cordinate + 3, chart_bottomright_y_cordinate + 3);

    //'Draw Horizontal and vertical Lines of Chart
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine(chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate);
    CanvasLine(chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 2 - (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 8 - chart_topleft_y_cordinate, chart_bottomright_x_new_cordinate, (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 2 - (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 8 - chart_topleft_y_cordinate);
    CanvasLine(chart_topleft_x_cordinate, chart_topleft_y_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate);
    CanvasLine(chart_bottomright_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 2 - (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 8 - chart_topleft_y_cordinate + 1, chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 2 - (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 8 - chart_topleft_y_cordinate + 1, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate);

}
/**********************************************DrawRectangle method Definition to Rectangle**************************************************************/
function DrawRectangle(topleft_x_cordinate, topleft_y_cordinate, bottomright_x_cordinate, bottomright_y_cordinate) {
    CanvasLine(topleft_x_cordinate, topleft_y_cordinate, bottomright_x_cordinate, topleft_y_cordinate);
    CanvasLine(bottomright_x_cordinate, topleft_y_cordinate, bottomright_x_cordinate, bottomright_y_cordinate);
    CanvasLine(bottomright_x_cordinate, bottomright_y_cordinate, topleft_x_cordinate, bottomright_y_cordinate);
    CanvasLine(topleft_x_cordinate, bottomright_y_cordinate, topleft_x_cordinate, topleft_y_cordinate);
}

function CanvasLine(x1, y1, x2, y2) {
    cxt.moveTo(x1, y1);
    cxt.lineTo(x2, y2);
    cxt.stroke();
}

function lineWidth(lineW) {
    cxt.lineWidth = lineW;
    //alert("lineWidth me hoo");
}

function SetFontSize(intFontSize) {
    cxt.font = "bold " + intFontSize.toString() + "px verdana";
}

function PrintText(XCor, YCor, Print_Text) {
    var chart_font_path;
    cxt.fillText(Print_Text, XCor + 2, YCor + 10);
}

function PrintTextL(XCor, YCor, Print_Text, LanguageCode) {
    var chart_font_path, LanguageCode;
    PrintText(XCor, YCor, Print_Text);
}

function FontColorFunction(fontcolor) {
    cxt.fillStyle = fontcolor;
}

function FontAlignent(FontAlignentNew, FontWidthNew) {
    /*Jpeg.Canvas.Font.Align = FontAlignentNew;     //'Justify-3
    Jpeg.Canvas.Font.Width = FontWidthNew;  //'150*/
}

/* Print Heading of Chart */
function PrintHeadingofChart(heading_x_cordinate, heading_y_cordinate, chartHeading, heading_font_size, LanguageCode) {
    if (LanguageCode == LANGUAGE_ENGLISH) {
        SetFontSize(heading_font_size)
    }
    else {
        SetFontSize(LARGEST_FONT_SIZE)
     }
    PrintTextL(heading_x_cordinate, heading_y_cordinate, chartHeading, LanguageCode);
}

function ProperCase(strText) {
    var str = strText.toString();
    return (str.charAt(0).toUpperCase() + str.substring(1, str.length).toLowerCase());
}