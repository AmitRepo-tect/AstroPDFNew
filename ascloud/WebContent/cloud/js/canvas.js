function DrawLinesofChart(g, c, j, f) { var b, d, h, a; b = 21 + (g - 21); d = 21 + (c - 21); h = 320 + (j - 320); a = 320 + (f - 320); lineWidth(0.2); CanvasLine(b, d, h, a); lineWidth(0.2); CanvasLine(h, d, b, a); lineWidth(0.2); CanvasLine((h - b) / 2 + b, d, h, (a - d) / 2 + d); CanvasLine(h, (a - d) / 2 + d, (h - b) / 2 + b, a); CanvasLine((h - b) / 2 + b, a, b, (a - d) / 2 + d); CanvasLine(b, (a - d) / 2 + d, (h - b) / 2 + b, d); lineWidth(0.2); DrawRectangle(b, d, h, a); DrawRectangle(b - 0.2, d - 0.2, h + 0.2, a + 0.2) }
function DrawLinesofSouthChart(g, k, d, b) {
    var f, l, c, j, h; 
    f = 21 + (g - 21); 
    l = 21 + (k - 21); 
    c = 320 + (d - 320);
    j = 320 + (b - 320); 
    CanvasLine((d - g) / 2 + g, k, (d - g) / 2 + g, (b - k) / 4 + k);
    CanvasLine((d - g) / 2 + g, (b - k) / 2 + (b - k) / 4 + k - 4, (d - g) / 2 + g, b);
    CanvasLine((d - g) / 4 + g, k, (d - g) / 4 + g, b);
    CanvasLine((d - g) / 2 + (d - g) / 4 + g, k, (d - g) / 2 + (d - g) / 4 + g, b);    
    CanvasLine(g, (b - k) / 4 + k, d, (b - k) / 4 + k);     
    CanvasLine(g, (b - k) / 2 + k, (d - g) / 4 + g, (b - k) / 2 + k);
    CanvasLine((d - g) / 2 + (d - g) / 4 + g, (b - k) / 2 + k, d, (b - k) / 2 + k);
    CanvasLine(g, (b - k) / 2 + (b - k) / 4 + k - 4, d, (b - k) / 2 + (b - k) / 4 + k - 4); 
    DrawRectangle(f, l, c, j);
    DrawRectangle(f - 2.5, l - 2.5, c + 3, j + 3)
}

function DrawLinesofEastChart1(g, c, j, f) { var b, d, h, a; b = 21 + (g - 21); d = 21 + (c - 21); h = 320 + (j - 320); a = 320 + (f - 320); DrawRectangle(b, d, h, a); DrawRectangle(b - 2.5, d - 2.5, h + 3, a + 3); CanvasLine((j - g) / 3 + g, c, (j - g) / 3 + g, f); CanvasLine((j - g) / 2 + (j - g) / 6 + g, c, (j - g) / 2 + (j - g) / 6 + g, f); CanvasLine(g, (f - c) / 3 + c, j, (f - c) / 3 + c); CanvasLine(g, (f + f) / 2 - (f + f) / 8 - d, j, (f + f) / 2 - (f + f) / 8 - d); CanvasLine(b, d, (j - g) / 3 + g, (f - c) / 3 + c); CanvasLine(j, c, (j - g) / 2 + (j - g) / 6 + g, (f - c) / 3 + c); CanvasLine((j - g) / 3 + g, (f + f) / 2 - (f + f) / 8 - d + 1, g, f); CanvasLine((j - g) / 2 + (j - g) / 6 + g, (f + f) / 2 - (f + f) / 8 - d + 1, j, f) }
function DrawRectangle1(c, a, d, b) { CanvasLine(c, a, d, a); CanvasLine(d, a, d, b); CanvasLine(d, b, c, b); CanvasLine(c, b, c, a) } function CanvasLine(c, a, d, b) { cxt.moveTo(c, a); cxt.lineTo(d, b); cxt.stroke() } function lineWidth(a) { cxt.lineWidth = a } function SetFontSize(a) { cxt.font = "bold " + a.toString() + "px verdana" }
function PrintText(c, a, d) {
    var b;
    cxt.fillText(d, c + 2, a + 10);
    count = count + 1;
    if (count == 24) {
      //  PrintChart(10, 269, 310, 501, g4, a1, e1, d1, count, g4)
       } 
}

 function PrintTextL(d, b, f, c) { var a, c;
     PrintText(d, b, f) 
 } 
function FontColorFunction(a) { cxt.fillStyle = a } function FontAlignent(b, a) { } function PrintHeadingofChart(d, b, f, c, a) { if (a == LANGUAGE_ENGLISH) { SetFontSize(c) } else { SetFontSize(LARGEST_FONT_SIZE) } PrintTextL(d, b, f, a) } function ProperCase(b) { var a = b.toString(); return a.charAt(0).toUpperCase() + a.substring(1, a.length).toLowerCase() };


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

    //right vertical
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);


   //lefi side line CanvasLine(chart_bottomright_y_new_cordinate, (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 2 - (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 8 - chart_topleft_y_cordinate + 1, chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2.2 + (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate - 4, chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);

    //left vertical
    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, chart_bottomright_y_new_cordinate);
    CanvasLine(chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate);
    CanvasLine(chart_topleft_x_cordinate, chart_topleft_y_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 3 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate);
    CanvasLine(chart_bottomright_x_new_cordinate, chart_topleft_y_new_cordinate, (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 3 + chart_topleft_y_new_cordinate);
    //CanvasLine(chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 2 - (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 8 - chart_topleft_y_cordinate, chart_bottomright_x_new_cordinate, (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 2 - (chart_bottomright_y_new_cordinate + chart_bottomright_y_new_cordinate) / 8 - chart_topleft_y_cordinate);
    //bottom horizontal
    CanvasLine(chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2.2 + (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate - 4, chart_bottomright_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2.2 + (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate - 4);


    CanvasLine((chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 2 + (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) / 6 + chart_topleft_x_new_cordinate, (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 2.2 + (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) / 4 + chart_topleft_y_new_cordinate - 4, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate);

}

//***************************************************************************************
//***************************************************************************************
function DrawRectangle(topleft_x_cordinate, topleft_y_cordinate, bottomright_x_cordinate, bottomright_y_cordinate) {
    CanvasLine(topleft_x_cordinate, topleft_y_cordinate, bottomright_x_cordinate, topleft_y_cordinate);
    CanvasLine(bottomright_x_cordinate, topleft_y_cordinate, bottomright_x_cordinate, bottomright_y_cordinate);
    CanvasLine(bottomright_x_cordinate, bottomright_y_cordinate, topleft_x_cordinate, bottomright_y_cordinate);
    CanvasLine(topleft_x_cordinate, bottomright_y_cordinate, topleft_x_cordinate, topleft_y_cordinate);
}
function  DrawCircle(a,b,c) {
	
	cxt.beginPath();
	cxt.arc(a, b, 15, 0, 2 * Math.PI);
	cxt.fillStyle = c;
	cxt.fill();
	cxt.stroke();
}
