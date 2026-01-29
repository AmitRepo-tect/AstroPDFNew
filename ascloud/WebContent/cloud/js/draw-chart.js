function PrintChart(e, n, m, k, f, d, l, p, q, c) { count = q; a1 = d; e1 = l; d1 = p; g4 = c; d == CHART_NORTH ? PrintNorthIndianChart(e, n, m, k, f, l, p) : d == CHART_EAST ? PrintEastIndianChart(e, n, m, k, f, l, p) : PrintSouthIndianChart(e, n, m, k, f, l, p) }
function PrintNorthIndianChart(e, n, m, k, f, d, l) {
    var p, q, c, a, b, h, g, t, r = Array(11), w, u, x, v; v = NORMAL_PLANET; p = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; q = d == LANGUAGE_ENGLISH ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : d == LANGUAGE_TAMIL ? "\u0b9a\u0bc2;\u0b9a\u0ba8\u0bcd;\u0b9a\u0bc6;\u0baa\u0bc1;\u0b95\u0bc1;\u0b9a\u0bc1;\u0b9a\u0ba9\u0bbf;\u0bb0\u0bbe;\u0b95\u0bc7;\u0baf\u0bc1 ;\u0ba8\u0bc6;\u0baa\u0bcd\u0bb3\u0bc1".split(";") : d == LANGUAGE_KANNADA ? "ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : d == LANGUAGE_TELUGU ?
"సూ చం కు బు గు శు శ రా కే యు నె ప్లూ".split(" ") : d == LANGUAGE_BENGALI ? "\u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1:".split(" ") : d == LANGUAGE_GUJARATI ? "સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") : d == LANGUAGE_MALAYALAM ? "ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") : d == LANGUAGE_MARATHI ? "सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" ");
    x = "#F52443 #a5a2fe #23481D #4C69A5 #B63BB0 #014700 #CB2813 #B71510 #C88E45 #FF0000 #190634 #0B0823".split(" "); c = [139, 64, 54, 126, 50, 65, 139, 213, 227, 154, 228, 214]; a = [129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55]; h = Array(12); g = Array(12); h[0] = [139, 139, 104, 174, 139, 119, 159, 119, 159]; g[0] = [71, 25, 71, 71, 110, 45, 45, 89, 89]; h[1] = [65, 36, 83, 62, 43, 83, 23, 103, 63]; g[1] = [29, 9, 9, 9, 29, 29, 9, 9, 49]; h[2] = [3, 3, 3, 3, 3, 23, 23, 23, 43]; g[2] = [71, 91, 51, 31, 120, 71, 91, 51, 71]; h[3] = [63, 63, 23, 103, 63, 43, 83, 43, 83]; g[3] = [146, 105, 146, 146, 180, 126,
126, 166, 166]; h[4] = [2, 2, 2, 2, 2, 23, 23, 23, 43]; g[4] = [220, 240, 201, 181, 261, 220, 241, 201, 220]; h[5] = [37, 91, 64, 64, 24, 44, 84, 104, 64]; g[5] = [267, 267, 267, 287, 287, 287, 287, 287, 247]; h[6] = [139, 139, 104, 174, 139, 119, 159, 119, 159]; g[6] = [220, 181, 220, 220, 264, 201, 201, 240, 240]; h[7] = [239, 187, 213, 213, 173, 193, 233, 253, 213]; g[7] = [267, 267, 267, 287, 287, 287, 287, 287, 247]; h[8] = [269, 269, 269, 269, 269, 249, 249, 249, 229]; g[8] = [220, 240, 201, 181, 261, 220, 241, 201, 220]; h[9] = [213, 213, 175, 253, 223, 193, 232, 193, 233]; g[9] = [146, 105, 146, 146, 186, 126, 126, 166,
166]; h[10] = [269, 269, 269, 269, 269, 249, 249, 249, 229]; g[10] = [71, 91, 51, 31, 110, 71, 91, 51, 71]; h[11] = [213, 188, 233, 212, 193, 233, 173, 253, 213]; g[11] = [29, 9, 9, 9, 29, 29, 9, 9, 49]; b = Array(12); for (u = 0; u < b.length; u++) b[u] = h[u]; h = Array(12); for (u = 0; u < b.length; u++) h[u] = g[u]; DrawLinesofChart(e, n, m, k); SetFontSize(RASHI_FONT_SIZE); w = f[0]; for (g = 0; 12 > g; g++) t = parseInt(w + g, 10), 12 < t && (t -= 12), "1" == textcolor ? FontColorFunction("&H000000") : (u = x[g], FontColorFunction(u)), PrintText(c[g] + e + c[g] / 299 * (m - e) - c[g], a[g] + n + a[g] / 299 * (k - n) - a[g], t);
    d == LANGUAGE_ENGLISH ? SetFontSize(HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); if (l) for (g = 1; 12 >= g; g++) r[g - 1] = f[g]; else for (g = 1; 12 >= g; g++) r[g - 1] = rasiToBhava(w, f[g]); for (g = 0; 11 >= g && (!v || 9 != g); g++) f = r[g], "1" == textcolor ? FontColorFunction("&H000000") : (u = x[g], FontColorFunction(u)), PrintTextL(b[f - 1][p[f - 1]] + e + b[f - 1][p[f - 1]] / 299 * (m - e) - b[f - 1][p[f - 1]], h[f - 1][p[f - 1]] + n + h[f - 1][p[f - 1]] / 299 * (k - n) - h[f - 1][p[f - 1]], q[g], d), p[f - 1] += 1
}
function PrintSouthIndianChart(e, n, m, k, f, d, l) {
    var p, q, c, a, b, h, g; l = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; p = d == LANGUAGE_ENGLISH ? "Asc Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : d == LANGUAGE_TAMIL ? "\u0bb2 \u0b9a\u0bc2 \u0b9a\u0ba8\u0bcd \u0b9a\u0bc6 \u0baa\u0bc1 \u0b95\u0bc1 \u0b9a\u0bc1 \u0b9a\u0ba9\u0bbf \u0bb0\u0bbe \u0b95\u0bc7  \u0baf\u0bc1 \u0ba8\u0bc6 \u0baa\u0bcd\u0bb3\u0bc1".split(" ") : d == LANGUAGE_KANNADA ? "ಲಗ್ನ ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : d == LANGUAGE_TELUGU ? "ల \u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42".split(" ") :
d == LANGUAGE_BENGALI ? "\u09b2\u0997\u09cd\u09a8 \u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1:".split(" ") : d == LANGUAGE_GUJARATI ? "લગ્ન સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") : d == LANGUAGE_MALAYALAM ? "ല ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") : d == LANGUAGE_MARATHI ? "ल सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0932\u0917\u094d\u0928 \u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" ");
    g = "#F52443 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 #B71510 #C88E45 #FF0000 #190634 #0B0823".split(" "); c = Array(12); a = Array(12); c[0] = [103, 74, 127, 74, 127, 92, 112, 92, 112]; a[0] = [34, 7, 7, 64, 64, 19, 19, 49, 49]; c[1] = [175, 149, 199, 149, 199, 164, 186, 164, 186]; a[1] = [34, 7, 7, 64, 64, 19, 19, 49, 49]; c[2] = [250, 224, 275, 224, 275, 248, 258, 238, 258]; a[2] = [34, 7, 7, 64, 64, 19, 19, 49, 49]; c[3] = [249, 224, 274, 224, 274, 239, 264, 239, 264]; a[3] = [106, 80, 80, 137, 137, 92, 92, 121, 121]; c[4] = [249, 224, 275, 224, 275, 238, 258, 238, 258]; a[4] = [181, 155, 155, 206,
206, 166, 166, 199, 199]; c[5] = [249, 224, 274, 224, 274, 238, 258, 238, 258]; a[5] = [257, 230, 230, 287, 287, 242, 242, 272, 272]; c[6] = [174, 150, 199, 150, 201, 165, 185, 165, 185]; a[6] = [257, 230, 230, 287, 287, 242, 242, 272, 272]; c[7] = [102, 75, 124, 75, 128, 92, 112, 92, 112]; a[7] = [257, 230, 230, 287, 287, 242, 242, 272, 272]; c[8] = [25, 0, 49, 0, 37, 17, 37, 17, 37]; a[8] = [257, 230, 230, 282, 282, 242, 242, 272, 272]; c[9] = [26, 0, 49, 0, 52, 17, 37, 167, 17, 37]; a[9] = [181, 155, 154, 208, 208, 167, 199, 199]; c[10] = [26, 0, 49, 0, 50, 17, 37, 17, 37]; a[10] = [106, 80, 80, 134, 134, 92, 92, 121, 121]; c[11] =
[26, 0, 49, 0, 52, 16, 37, 16, 37]; a[11] = [34, 4, 4, 63, 63, 19, 19, 47, 47]; q = Array(12); for (b = 0; b < q.length; b++) q[b] = c[b]; c = Array(12); for (b = 0; b < q.length; b++) c[b] = a[b]; DrawLinesofSouthChart(e, n, m, k); d == LANGUAGE_ENGLISH ? SetFontSize(HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); for (b = 0; 12 >= b; b++) NORMAL_PLANET && 10 == b || (a = f[b], "1" == textcolor ? FontColorFunction("&H000000") : (h = g[b], FontColorFunction(h)), PrintTextL(q[a - 1][l[a - 1]] + e + q[a - 1][l[a - 1]] / 299 * (m - e) - q[a - 1][l[a - 1]], c[a - 1][l[a - 1]] + n + c[a - 1][l[a - 1]] / 299 * (k - n) - c[a -
1][l[a - 1]], p[b], d), l[a - 1] += 1)
}
function PrintEastIndianChart1(e, n, m, k, f, d, l) {
    var p, q, c, a, b, h, g, t; t = NORMAL_PLANET; l = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; p = d == LANGUAGE_ENGLISH ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : d == LANGUAGE_TAMIL ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : d == LANGUAGE_KANNADA ? "ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : d == LANGUAGE_TELUGU ? "సూ చం కు బు గు శు శ రా కే యు నె ప్లూ".split(" ") : d == LANGUAGE_BENGALI ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : d == LANGUAGE_GUJARATI ? "સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") :
d == LANGUAGE_MALAYALAM ? "ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") : d == LANGUAGE_MARATHI ? "सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" "); g = "#F52443 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 &HB71510 #C88E45 #FF0000 #190634 #0B0823".split(" "); c = Array(12); a = Array(12); c[0] = [138, 138, 103, 173, 138, 118, 158, 118, 158]; a[0] = [50,
6, 50, 50, 87, 24, 24, 71, 71]; c[1] = [62, 62, 62, 38, 19, 19, 76, 62, 42]; a[1] = [50, 8, 24, 8, 8, 24, 24, 37, 37]; c[2] = [2, 2, 2, 2, 27, 27, 27, 47, 47]; a[2] = [50, 66, 30, 84, 84, 50, 67, 84, 67]; c[3] = [42, 42, 2, 72, 72, 22, 62, 22, 62]; a[3] = [141, 107, 141, 141, 181, 121, 121, 161, 161]; c[4] = [1, 1, 1, 27, 27, 52, 1, 22, 44]; a[4] = [247, 227, 208, 208, 227, 207, 262, 242, 227]; c[5] = [63, 63, 63, 39, 43, 75, 19, 26, 44]; a[5] = [246, 285, 266, 285, 266, 226, 285, 266, 246]; c[6] = [138, 138, 103, 173, 138, 118, 158, 118, 158]; a[6] = [246, 207, 246, 246, 286, 227, 227, 266, 267]; c[7] = [202, 202, 202, 202, 229, 229, 229, 249,
249]; a[7] = [246, 226, 266, 286, 286, 266, 246, 286, 266]; c[8] = [268, 268, 268, 244, 244, 222, 228, 268, 248]; a[8] = [244, 225, 205, 205, 225, 204, 224, 257, 239]; c[9] = [239, 239, 204, 272, 244, 219, 258, 219, 259]; a[9] = [141, 107, 141, 141, 181, 121, 121, 161, 161]; c[10] = [268, 268, 268, 244, 222, 222, 228, 268, 248]; a[10] = [50, 70, 34, 86, 86, 50, 70, 89, 70]; c[11] = [204, 204, 204, 229, 229, 229, 204, 224, 247]; a[11] = [50, 30, 10, 10, 30, 9, 64, 50, 28]; q = Array(12); for (XPl_Co = 0; XPl_Co < q.length; XPl_Co++) q[XPl_Co] = c[XPl_Co]; c = Array(12); for (YPl_Co = 0; YPl_Co < q.length; YPl_Co++) c[YPl_Co] =
a[YPl_Co]; DrawLinesofEastChart(e, n, m, k); d == LANGUAGE_ENGLISH ? SetFontSize(HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); for (b = 0; 12 > b && (!t || 9 != b); b++) a = f[b], "1" == textcolor ? FontColorFunction("&H000000") : (h = g[b], FontColorFunction(h)), PrintTextL(q[a - 1][l[a - 1]] + e + q[a - 1][l[a - 1]] / 299 * (m - e) - q[a - 1][l[a - 1]], c[a - 1][l[a - 1]] + n + c[a - 1][l[a - 1]] / 299 * (k - n) - c[a - 1][l[a - 1]], p[b], d), l[a - 1] += 1
} function IIIf(e, n, m) { return e ? n : m }
function getKPPlanetBhavaPosition(e, n) { var m, k, f, d, l; m = e; for (j = 0; 11 >= j; j++) if (k = n[j], f = n[IIIf(11 <= j, j - 11, j + 1)], k > f && (d = f, f += 360), 0 != d && m < d && (m += 360, d = 0), m >= k && m < f) { l = j + 1; break } return l } function rasiToBhava(e, n) { var m; m = n - e; 0 > m && (m += 12); return m + 1 } var count = 0, a1, e1, d1, g4;
function PrintEastIndianChart(e, n, m, k, f, d, l) {
    var p, q, c, a, b, h, g, t; t = NORMAL_PLANET; l = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; p = d == LANGUAGE_ENGLISH ? "Asc Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : d == LANGUAGE_TAMIL ? "\u0bb2 \u0b9a\u0bc2 \u0b9a\u0ba8\u0bcd \u0b9a\u0bc6 \u0baa\u0bc1 \u0b95\u0bc1 \u0b9a\u0bc1 \u0b9a\u0ba9\u0bbf \u0bb0\u0bbe \u0b95\u0bc7 \u0baf\u0bc1 \u0ba8\u0bc6 \u0baa\u0bcd\u0bb3\u0bc1".split(" ") : d == LANGUAGE_KANNADA ? "ಲಗ್ನ ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : d == LANGUAGE_TELUGU ? "ల \u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42".split(" ") :
d == LANGUAGE_BENGALI ? "\u09b2\u0997\u09cd\u09a8 \u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1:".split(" ") : d == LANGUAGE_GUJARATI ? "લગ્ન સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") : d == LANGUAGE_MALAYALAM ? "ല ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") : d == LANGUAGE_MARATHI ? "ल सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0932\u0917\u094d\u0928 \u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" ");
    g = "#F52443 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 #HB71510 #C88E45 #FF0000 #190634 #0B0823".split(" "); c = Array(12); a = Array(12); c[0] = [138, 138, 103, 173, 138, 118, 158, 118, 158]; a[0] = [50, 6, 50, 50, 87, 24, 24, 71, 71]; c[1] = [62, 62, 62, 38, 19, 19, 76, 62, 42]; a[1] = [50, 8, 24, 8, 8, 24, 24, 37, 37]; c[2] = [2, 2, 2, 2, 27, 27, 27, 47, 47]; a[2] = [50, 66, 30, 84, 84, 50, 67, 84, 67]; c[3] = [42, 42, 2, 72, 72, 22, 62, 22, 62]; a[3] = [141, 107, 141, 141, 181, 121, 121, 161, 161]; c[4] = [1, 1, 1, 37, 27, 52, 1, 22, 44]; a[4] = [247, 227, 208, 208, 227, 207, 262, 242, 227]; c[5] = [63, 63,
63, 39, 43, 75, 19, 26, 44]; a[5] = [246, 285, 266, 285, 266, 226, 285, 266, 246]; c[6] = [138, 138, 103, 173, 138, 118, 158, 118, 158]; a[6] = [246, 207, 246, 246, 286, 227, 227, 266, 267]; c[7] = [202, 202, 202, 202, 229, 229, 229, 249, 249]; a[7] = [246, 226, 266, 286, 286, 266, 246, 286, 266]; c[8] = [253, 253, 268, 244, 244, 222, 228, 268, 248]; a[8] = [244, 225, 205, 205, 225, 204, 224, 257, 239]; c[9] = [239, 239, 204, 272, 244, 219, 258, 219, 259]; a[9] = [141, 107, 141, 141, 181, 121, 121, 161, 161]; c[10] = [268, 268, 268, 244, 222, 222, 228, 268, 248]; a[10] = [50, 70, 34, 86, 86, 50, 70, 89, 70]; c[11] = [204, 204,
204, 229, 229, 229, 204, 224, 247]; a[11] = [50, 30, 10, 10, 30, 9, 64, 50, 28]; q = Array(12); for (XPl_Co = 0; XPl_Co < q.length; XPl_Co++) q[XPl_Co] = c[XPl_Co]; c = Array(12); for (YPl_Co = 0; YPl_Co < q.length; YPl_Co++) c[YPl_Co] = a[YPl_Co]; DrawLinesofEastChart(e, n, m, k); d == LANGUAGE_ENGLISH ? SetFontSize(HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); for (b = 0; 13 > b && (!t || 9 != b); b++) a = f[b], "1" == textcolor ? FontColorFunction("&H000000") : (h = g[b], FontColorFunction(h)), PrintTextL(q[a - 1][l[a - 1]] + e + q[a - 1][l[a - 1]] / 299 * (m - e) - q[a - 1][l[a - 1]], c[a -
1][l[a - 1]] + n + c[a - 1][l[a - 1]] / 299 * (k - n) - c[a - 1][l[a - 1]], p[b], d), l[a - 1] += 1
} function PrintChartOthers(e, n, m, k, f, d, l, p, q, c, a) { count = c; a1 = l; e1 = p; d1 = q; g4 = a; l == CHART_NORTH ? PrintNorthIndianChartOthers(e, n, m, k, f, p, q) : l == CHART_EAST ? PrintEastIndianChartOthers(e, n, m, k, f, d, p, q) : PrintSouthIndianChartOthers(e, n, m, k, f, d, p, q) }
function PrintEastIndianChartOthers(e, n, m, k, f, d, l, p) {
    var q, c, a, b, h, g, t, r; r = NORMAL_PLANET; p = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; q = l == LANGUAGE_ENGLISH ? "Asc Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : l == LANGUAGE_TAMIL ? "\u0bb2 ;\u0b9a\u0bc2;\u0b9a\u0ba8\u0bcd;\u0b9a\u0bc6;\u0baa\u0bc1;\u0b95\u0bc1;\u0b9a\u0bc1;\u0b9a\u0ba9\u0bbf;\u0bb0\u0bbe;\u0b95\u0bc7;\u0baf\u0bc1 ;\u0ba8\u0bc6;\u0baa\u0bcd\u0bb3\u0bc1".split(";") : l == LANGUAGE_KANNADA ? "ಲಗ್ನ ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : l == LANGUAGE_TELUGU ?
"ల \u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42".split(" ") : l == LANGUAGE_BENGALI ? "\u09b2\u0997\u09cd\u09a8 \u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1:".split(" ") : l == LANGUAGE_GUJARATI ? "લગ્ન સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") : l == LANGUAGE_MALAYALAM ? "ല ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") :
l == LANGUAGE_MARATHI ? "ल सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0932\u0917\u094d\u0928 \u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" "); t = "#F52443 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 &HB71510 #C88E45 #FF0000 #190634 #0B0823".split(" "); a = Array(12); b = Array(12); a[0] = [138, 138, 103, 173, 138, 118, 158, 118, 158]; b[0] = [50, 6, 50, 50, 87, 24, 24, 71, 71]; a[1] = [62, 62, 62, 38,
19, 19, 76, 62, 42]; b[1] = [50, 8, 24, 8, 8, 24, 24, 37, 37]; a[2] = [2, 2, 2, 2, 27, 27, 27, 47, 47]; b[2] = [50, 66, 30, 84, 84, 50, 67, 84, 67]; a[3] = [42, 42, 2, 72, 72, 22, 62, 22, 62]; b[3] = [141, 107, 141, 141, 181, 121, 121, 161, 161]; a[4] = [1, 1, 1, 27, 27, 62, 1, 22, 44]; b[4] = [247, 227, 208, 208, 225, 207, 262, 242, 227]; a[5] = [63, 63, 63, 39, 43, 75, 19, 26, 44]; b[5] = [246, 285, 266, 285, 266, 226, 285, 266, 246]; a[6] = [138, 138, 103, 173, 138, 118, 158, 118, 158]; b[6] = [246, 207, 246, 246, 286, 227, 227, 266, 267]; a[7] = [202, 202, 202, 202, 229, 229, 229, 249, 249]; b[7] = [246, 226, 266, 286, 286, 266, 246, 286,
266]; a[8] = [268, 268, 268, 244, 244, 222, 228, 268, 248]; b[8] = [244, 225, 205, 205, 225, 204, 224, 257, 239]; a[9] = [239, 239, 204, 272, 244, 219, 258, 219, 259]; b[9] = [141, 107, 141, 141, 181, 121, 121, 161, 161]; a[10] = [268, 268, 268, 244, 222, 222, 228, 268, 248]; b[10] = [50, 70, 34, 86, 86, 50, 70, 89, 70]; a[11] = [204, 204, 204, 229, 229, 229, 204, 224, 247]; b[11] = [50, 30, 10, 10, 30, 9, 64, 50, 28]; c = Array(12); for (XPl_Co = 0; XPl_Co < c.length; XPl_Co++) c[XPl_Co] = a[XPl_Co]; a = Array(12); for (YPl_Co = 0; YPl_Co < c.length; YPl_Co++) a[YPl_Co] = b[YPl_Co]; DrawLinesofEastChartOthers(e,
n, m, k); l == LANGUAGE_ENGLISH ? SetFontSize(HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); for (h = 0; 13 > h && (!r || 9 != h); h++) b = 0 != h ? f[h] + d - 1 : f[h], 12 < b && (b -= 12), "1" == textcolor ? FontColorFunction("&H000000") : (g = t[h], FontColorFunction(g)), PrintTextL(c[b - 1][p[b - 1]] + e + c[b - 1][p[b - 1]] / 299 * (m - e) - c[b - 1][p[b - 1]], a[b - 1][p[b - 1]] + n + a[b - 1][p[b - 1]] / 299 * (k - n) - a[b - 1][p[b - 1]], q[h], l), p[b - 1] += 1
}
function DrawLinesofEastChartOthers(e, n, m, k) {
    var f, d, l, p; f = 21 + (e - 21); d = 21 + (n - 21); l = 320 + (m - 320); p = 320 + (k - 320); DrawRectangle(f, d, l, p); DrawRectangle(f - 2.5, d - 2.5, l + 3, p + 3); CanvasLine((m - e) / 3 + e, n, (m - e) / 3 + e, k); CanvasLine((m - e) / 2 + (m - e) / 6 + e, n, (m - e) / 2 + (m - e) / 6 + e, k); CanvasLine(e, (k - n) / 3 + n, m, (k - n) / 3 + n); CanvasLine(e, (k + k) / 2.1 - (k + k) / 8 - d, m, (k + k) / 2.1 - (k + k) / 8 - d); CanvasLine(f, d, (m - e) / 3 + e, (k - n) / 3 + n); CanvasLine(m, n, (m - e) / 2 + (m - e) / 6 + e, (k - n) / 3 + n); CanvasLine((m - e) / 3 + e, (k + k) / 2 - (k + k) / 6.8 - d + 1, e, k); CanvasLine((m - e) / 2 + (m - e) / 6 +
e, (k + k) / 2 - (k + k) / 6.8 - d + 1, m, k)
}
function PrintSouthIndianChartOthers(e, n, m, k, f, d, l, p) {
    var q, c, a, b, h, g, t; p = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; q = l == LANGUAGE_ENGLISH ? "Asc Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : l == LANGUAGE_TAMIL ? "\u0bb2 ;\u0b9a\u0bc2;\u0b9a\u0ba8\u0bcd;\u0b9a\u0bc6;\u0baa\u0bc1;\u0b95\u0bc1;\u0b9a\u0bc1;\u0b9a\u0ba9\u0bbf;\u0bb0\u0bbe;\u0b95\u0bc7;\u0baf\u0bc1 ;\u0ba8\u0bc6;\u0baa\u0bcd\u0bb3\u0bc1".split(";") : l == LANGUAGE_KANNADA ? "ಲಗ್ನ ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : l == LANGUAGE_TELUGU ? "ల \u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42".split(" ") :
l == LANGUAGE_BENGALI ? "\u09b2\u0997\u09cd\u09a8 \u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1:".split(" ") : l == LANGUAGE_GUJARATI ? "લગ્ન સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") : l == LANGUAGE_MALAYALAM ? "ല ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") : l == LANGUAGE_MARATHI ? "ल सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0932\u0917\u094d\u0928 \u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" ");
    t = "#F52443 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 &HB71510 #C88E45 #FF0000 #190634 #0B0823".split(" "); a = Array(12); b = Array(12); a[0] = [103, 74, 127, 74, 127, 92, 112, 92, 112]; b[0] = [34, 7, 7, 64, 64, 19, 19, 49, 49]; a[1] = [175, 149, 199, 149, 199, 164, 186, 164, 186]; b[1] = [34, 7, 7, 64, 64, 19, 19, 49, 49]; a[2] = [250, 224, 275, 224, 275, 248, 258, 238, 258]; b[2] = [34, 7, 7, 64, 64, 19, 19, 49, 49]; a[3] = [249, 224, 274, 224, 274, 239, 264, 239, 264]; b[3] = [106, 80, 80, 137, 137, 92, 92, 121, 121]; a[4] = [249, 224, 275, 224, 275, 238, 258, 238, 258]; b[4] = [181, 155, 155, 206,
206, 166, 166, 199, 199]; a[5] = [249, 224, 274, 224, 274, 238, 258, 238, 258]; b[5] = [257, 230, 230, 287, 287, 242, 242, 272, 272]; a[6] = [174, 150, 199, 150, 201, 165, 185, 165, 185]; b[6] = [257, 230, 230, 287, 287, 242, 242, 272, 272]; a[7] = [102, 75, 124, 75, 128, 92, 112, 92, 112]; b[7] = [257, 230, 230, 287, 287, 242, 242, 272, 272]; a[8] = [25, 0, 49, 0, 52, 17, 37, 17, 37]; b[8] = [257, 230, 230, 287, 287, 242, 242, 272, 272]; a[9] = [26, 0, 49, 0, 52, 17, 37, 167, 17, 37]; b[9] = [181, 155, 154, 208, 208, 167, 199, 199]; a[10] = [26, 0, 49, 0, 50, 17, 37, 17, 37]; b[10] = [106, 80, 80, 134, 134, 92, 92, 121, 121]; a[11] =
[26, 0, 49, 0, 52, 16, 37, 16, 37]; b[11] = [34, 4, 4, 63, 63, 19, 19, 47, 47]; c = Array(12); for (h = 0; h < c.length; h++) c[h] = a[h]; a = Array(12); for (h = 0; h < c.length; h++) a[h] = b[h]; DrawLinesofSouthChart(e, n, m, k); l == LANGUAGE_ENGLISH ? SetFontSize(HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); for (h = 0; 12 >= h; h++) NORMAL_PLANET && 10 == h || (b = 0 != h ? f[h] + d - 1 : f[h], 12 < b && (b -= 12), "1" == textcolor ? FontColorFunction("&H000000") : (g = t[h], FontColorFunction(g)), PrintTextL(c[b - 1][p[b - 1]] + e + c[b - 1][p[b - 1]] / 299 * (m - e) - c[b - 1][p[b - 1]], a[b - 1][p[b - 1]] +
n + a[b - 1][p[b - 1]] / 299 * (k - n) - a[b - 1][p[b - 1]], q[h], l), p[b - 1] += 1)
}
function PrintNorthIndianChartOthers(e, n, m, k, f, d, l) {
    var p, q, c, a, b, h, g, t, r = Array(11), w, u, x, v; v = NORMAL_PLANET; p = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; q = d == LANGUAGE_ENGLISH ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : d == LANGUAGE_TAMIL ? "\u0b9a\u0bc2;\u0b9a\u0ba8\u0bcd;\u0b9a\u0bc6;\u0baa\u0bc1;\u0b95\u0bc1;\u0b9a\u0bc1;\u0b9a\u0ba9\u0bbf;\u0bb0\u0bbe;\u0b95\u0bc7;\u0baf\u0bc1 ;\u0ba8\u0bc6;\u0baa\u0bcd\u0bb3\u0bc1".split(";") : d == LANGUAGE_KANNADA ? "ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : d == LANGUAGE_TELUGU ?
"\u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42".split(" ") : d == LANGUAGE_BENGALI ? "\u09b2\u0997\u09cd\u09a8 \u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1:".split(" ") : d == LANGUAGE_GUJARATI ? "સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") : d == LANGUAGE_MALAYALAM ? "ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") :
d == LANGUAGE_MARATHI ? "सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" "); x = "#F52443 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 &HB71510 #C88E45 #FF0000 #190634 #0B0823".split(" "); c = [139, 64, 54, 126, 50, 65, 139, 213, 227, 154, 228, 214]; a = [129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55]; h = Array(12); g = Array(12); h[0] = [139, 139, 104, 174, 139,
119, 159, 119, 159]; g[0] = [71, 25, 71, 71, 110, 45, 45, 89, 89]; h[1] = [65, 36, 83, 62, 43, 83, 23, 103, 63]; g[1] = [29, 9, 9, 9, 29, 29, 9, 9, 49]; h[2] = [3, 3, 3, 3, 3, 23, 23, 23, 43]; g[2] = [71, 91, 51, 31, 120, 71, 91, 51, 71]; h[3] = [63, 63, 23, 103, 63, 43, 83, 43, 83]; g[3] = [146, 105, 146, 146, 180, 126, 126, 166, 166]; h[4] = [2, 2, 2, 2, 2, 23, 23, 23, 43]; g[4] = [220, 240, 201, 181, 261, 220, 241, 201, 220]; h[5] = [37, 91, 64, 64, 24, 44, 84, 104, 64]; g[5] = [267, 267, 267, 287, 287, 287, 287, 287, 247]; h[6] = [139, 139, 104, 174, 139, 119, 159, 119, 159]; g[6] = [220, 181, 220, 220, 264, 201, 201, 240, 240]; h[7] = [239,
187, 213, 213, 173, 193, 233, 253, 213]; g[7] = [267, 267, 267, 287, 287, 287, 287, 287, 247]; h[8] = [269, 269, 269, 269, 269, 249, 249, 249, 229]; g[8] = [220, 240, 201, 181, 261, 220, 241, 201, 220]; h[9] = [213, 213, 175, 253, 223, 193, 232, 193, 233]; g[9] = [146, 105, 146, 146, 186, 126, 126, 166, 166]; h[10] = [269, 269, 269, 269, 269, 249, 249, 249, 229]; g[10] = [71, 91, 51, 31, 110, 71, 91, 51, 71]; h[11] = [213, 188, 233, 212, 193, 233, 173, 253, 213]; g[11] = [29, 9, 9, 9, 29, 29, 9, 9, 49]; b = Array(12); for (u = 0; u < b.length; u++) b[u] = h[u]; h = Array(12); for (u = 0; u < b.length; u++) h[u] = g[u]; DrawLinesofChart(e,
n, m, k); SetFontSize(RASHI_FONT_SIZE); w = f[0]; for (g = 0; 12 > g; g++) t = parseInt(w, 10) + g, 12 < t && (t -= 12), "1" == textcolor ? FontColorFunction("&H000000") : (u = x[g], FontColorFunction(u)), PrintText(c[g] + e + c[g] / 299 * (m - e) - c[g], a[g] + n + a[g] / 299 * (k - n) - a[g], t); d == LANGUAGE_ENGLISH ? SetFontSize(HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); if (l) for (g = 0; 12 >= g; g++) r[g - 1] = f[g]; else for (g = 1; 12 >= g; g++) r[g - 1] = rasiToBhava(w, f[g]); for (g = 0; 11 >= g && (!v || 9 != g); g++) f = r[g], "1" == textcolor ? FontColorFunction("&H000000") : (u = x[g], FontColorFunction(u)),
PrintTextL(b[f - 1][p[f - 1]] + e + b[f - 1][p[f - 1]] / 299 * (m - e) - b[f - 1][p[f - 1]], h[f - 1][p[f - 1]] + n + h[f - 1][p[f - 1]] / 299 * (k - n) - h[f - 1][p[f - 1]], q[g], d), p[f - 1] += 1
} function PrintChartofKP(e, n, m, k, f, d, l, p, q, c, a) { q == CHART_NORTH ? PrintNorthIndianChartKP(e, n, m, k, f, d, l, c, a) : q == CHART_SOUTH ? PrintSouthIndianChartKP(e, n, m, k, p, c, a) : PrintEastIndianChartKP(e, n, m, k, p, c, a) }
function PrintNorthIndianChartKP(e, n, m, k, f, d, l, p, q) {
    var c, a, b, h, g, t, r, w, u = Array(11), x, v, y, z; z = NORMAL_PLANET; c = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; a = p == LANGUAGE_ENGLISH ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl".split(" ") : p == LANGUAGE_TAMIL ? "\u0b9a\u0bc2;\u0b9a\u0ba8\u0bcd;\u0b9a\u0bc6;\u0baa\u0bc1;\u0b95\u0bc1;\u0b9a\u0bc1;\u0b9a\u0ba9\u0bbf;\u0bb0\u0bbe;\u0b95\u0bc7;\u0baf\u0bc1 ;\u0ba8\u0bc6;\u0baa\u0bcd\u0bb3\u0bc1".split(";") : p == LANGUAGE_KANNADA ? "ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು".split(" ") : p == LANGUAGE_TELUGU ?
"\u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42".split(" ") : p == LANGUAGE_BENGALI ? "\u09b2\u0997\u09cd\u09a8 \u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1:".split(" ") : p == LANGUAGE_GUJARATI ? "સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ".split(" ") : p == LANGUAGE_MALAYALAM ? "ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ".split(" ") :
p == LANGUAGE_MARATHI ? "सू चं मं बु गु शु श रा के यू ने प्लू".split(" ") : "\u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942".split(" "); y = "#F52443 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 &HB71510 #C88E45 #FF0000 #190634 #0B0823".split(" ");
b = [139, 64, 54, 126, 50, 65, 139, 213, 227, 154, 228, 214]; 
h = [129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55]; 
t = Array(12); r = Array(12); 

t[0] = [130, 130, 90, 174, 139,119, 159, 119, 159];
r[0] = [71, 25, 71, 71, 110, 45, 45, 89, 89];
t[1] = [65+9, 21, 98, 62, 43, 83, 23, 103, 63];
r[1] = [29, 9, 9, 9, 29, 29, 9, 9, 49];
t[2] = [3, 3, 3, 3, 3, 23, 23, 23, 43];
r[2] = [71, 91, 51, 31, 111, 71, 91, 51, 71];
t[3] = [63, 63, 23, 98, 63, 43, 83, 43, 83]; 
r[3] = [146, 105, 146, 146, 180, 126, 126, 166, 166];
t[4] = [1, 1, 1, 1, 1, 23+5, 23, 23, 43]; 
r[4] = [220, 240, 201, 181, 261, 220+10, 241, 201, 220];
t[5] = [37, 91, 64, 64+12, 24-12, 44, 84, 104, 64];
r[5] = [267, 267, 247, 287, 287, 287, 287, 287, 247];
t[6] = [139, 139, 104, 174, 139, 119, 159, 119, 159];
r[6] = [220, 181, 220, 220, 264, 201, 201, 240, 240];
t[7] = [239,187, 213, 213+15, 173-15, 193, 233, 253, 213];
r[7] = [267, 267, 247, 287, 287, 287, 287, 287, 247];
t[8] = [262+6, 262+6 ,262+6, 262+6, 262+6, 249-10, 249, 249, 229];
r[8] = [220, 240, 201, 181, 261, 220, 241, 201, 220];
t[9] = [213, 213, 175, 253, 223, 193, 232, 193, 233];
r[9] = [146, 105, 146, 146, 186, 126, 126, 166, 166];
t[10] = [262+6, 262+6, 262+6, 262+6, 262+6, 249-10, 249, 249, 229];
r[10] = [71, 91, 51, 31, 110, 71, 91, 51, 71];
t[11] = [213, 173, 248, 212, 193, 233, 173, 253, 213]; 
r[11] = [29+12, 9, 9, 9, 29, 29, 9, 9, 49]; g = Array(12); for (v = 0; v < g.length; v++) g[v] = t[v]; t = Array(12); for (v = 0; v < g.length; v++) t[v] = r[v]; DrawLinesofChart(e,
n, m, k); SetFontSize(RASHI_FONT_SIZE); x = f[0]; for (r = 0; 12 > r; r++) w = l[r], 12 < w && (w -= 12), "1" == textcolor ? FontColorFunction("&H000000") : (v = y[r], FontColorFunction(v)), PrintText(b[r] + e + b[r] / 299 * (m - e) - b[r], h[r] + n + h[r] / 299 * (k - n) - h[r], w); p != LANGUAGE_HINDI ? SetFontSize(KP_HINDI_PLANAT_FONT_SIZE) : SetFontSize(PLANAT_FONT_SIZE); if (q) for (r = 1; 12 >= r; r++) u[r - 1] = f[r]; else for (r = 1; 12 >= r; r++) u[r - 1] = rasiToBhava(x, f[r]); for (r = 0; 11 >= r && (!z || 9 != r); r++) f = u[r], "1" == textcolor ? FontColorFunction("&H000000") : (v = y[r], FontColorFunction(v)),
PrintTextL(g[f - 1][c[f - 1]] + e + g[f - 1][c[f - 1]] / 299 * (m - e) - g[f - 1][c[f - 1]], t[f - 1][c[f - 1]] + n + t[f - 1][c[f - 1]] / 299 * (k - n) - t[f - 1][c[f - 1]], a[r] + "(" + d[r] + ")", p), c[f - 1] += 1
}
function PrintEastIndianChartKP(e, n, m, k, f, d, l) {
    var p, q, c, a, b, h, g; l = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; p = d == LANGUAGE_ENGLISH ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_TAMIL ? "\u0b9a\u0bc2;\u0b9a\u0ba8\u0bcd;\u0b9a\u0bc6;\u0baa\u0bc1;\u0b95\u0bc1;\u0b9a\u0bc1;\u0b9a\u0ba9\u0bbf;\u0bb0\u0bbe;\u0b95\u0bc7;\u0baf\u0bc1 ;\u0ba8\u0bc6;\u0baa\u0bcd\u0bb3\u0bc1;I;II;III;IV;V;VI;VII;VIII;IX;X;XI;XII".split(";") : d == LANGUAGE_KANNADA ? "ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು I II III IV V VI VII VIII IX X XI XII".split(" ") :
d == LANGUAGE_TELUGU ? "\u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42 I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_BENGALI ? "\u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1: I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_GUJARATI ? "સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ I II III IV V VI VII VIII IX X XI XII".split(" ") :
d == LANGUAGE_MALAYALAM ? "ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_MARATHI ? "सू चं मं बु गु शु श रा के यू ने प्लू I II III IV V VI VII VIII IX X XI XII".split(" ") : "\u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942 1 2 3 4 5 6 7 8 9 10 11 12".split(" "); g = "#BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 #B71510 #C88E45 #FF0000 #190634 #B71510 #B63BB0 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 #B71510 #C88E45 #FF0000 #190634 #B71510 #B63BB0".split(" ");
    c = Array(12); a = Array(12); b = Array(12); h = Array(12); c[0] = [180, 165, 150, 135, 120, 110, 110, 110, 110]; a[0] = [1, 1, 1, 1, 1, 1, 1, 1, 1]; c[1] = [81, 65, 50, 35, 20, 20, 20, 20, 20]; a[1] = [1, 1, 1, 1, 1, 1, 1, 1, 1]; c[2] = [2, 2, 2, 2, 2, 2, 2, 2, 2]; a[2] = [25, 40, 55, 70, 85, 95, 95, 95, 95]; c[3] = [2, 2, 2, 2, 2, 2, 2, 2, 2]; a[3] = [105, 120, 135, 150, 165, 155, 155, 155, 155]; c[4] = [2, 2, 2, 2, 2, 2, 2, 2, 2]; a[4] = [205, 220, 235, 250, 265, 255, 255, 255, 255]; c[5] = [15, 30, 45, 60, 85, 85, 85, 85, 85]; a[5] = [285, 285, 285, 285, 285, 285, 285, 285, 285]; c[6] = [100, 115, 130, 145, 160, 150, 150, 150, 150]; a[6] = [285, 285,
285, 285, 285, 285, 285, 285, 285]; c[7] = [200, 215, 230, 245, 260, 270, 270, 270, 270]; a[7] = [285, 285, 285, 285, 285, 285, 285, 285, 285]; c[8] = [280, 280, 280, 280, 280, 280, 280, 280, 280]; a[8] = [265, 250, 235, 220, 205, 195, 195, 195, 195]; c[9] = [280, 280, 280, 280, 280, 280, 280, 280, 280]; a[9] = [180, 165, 150, 135, 120, 110, 110, 110, 110]; c[10] = [280, 280, 280, 280, 280, 280, 280, 280, 280]; a[10] = [85, 70, 55, 40, 25, 15, 15, 15, 15]; c[11] = [265, 250, 235, 220, 220, 210, 210, 210, 210]; a[11] = [1, 1, 1, 1, 1, 1, 1, 1, 1]; b[0] = [130, 130, 130, 130, 130, 130, 130, 130, 130]; h[0] = [0, 10, 20, 30, 40, 50,
50, 50, 50]; b[1] = [55, 55, 55, 55, 55, 55, 55, 55, 55]; h[1] = [0, 10, 20, 30, 40, 50, 50, 50, 50]; b[2] = [2, 2, 2, 2, 2, 2, 2, 2, 2]; h[2] = [20, 30, 40, 50, 60, 60, 60, 60, 60]; b[3] = [15, 15, 15, 15, 15, 15, 15, 15, 15]; h[3] = [94, 104, 114, 124, 134, 134, 135, 135, 135]; b[4] = [2, 2, 2, 2, 2, 2, 2, 2, 2]; h[4] = [194, 204, 214, 224, 234, 234, 234, 234, 234]; b[5] = [55, 55, 55, 55, 55, 55, 55, 55, 55]; h[5] = [265, 255, 245, 235, 225, 225, 225, 225, 225]; b[6] = [130, 130, 130, 130, 130, 130, 130, 130, 130]; h[6] = [265, 255, 245, 235, 225, 225, 225, 225, 225]; b[7] = [205, 205, 205, 205, 205, 205, 205, 205, 205]; h[7] = [265, 255, 245,
235, 225, 225, 225, 225, 225]; b[8] = [260, 260, 260, 260, 260, 260, 260, 260, 260]; h[8] = [235, 225, 215, 205, 195, 195, 195, 195, 195]; b[9] = [245, 245, 245, 245, 245, 245, 245, 245, 245]; h[9] = [170, 160, 150, 140, 130, 120, 110, 110, 110]; b[10] = [260, 260, 260, 260, 260, 260, 260, 260, 260]; h[10] = [74, 64, 54, 44, 34, 24, 24, 24, 24]; b[11] = [205, 205, 205, 205, 205, 205, 205, 205, 205]; h[11] = [40, 30, 20, 10, 10, 1, 10, 10, 10]; q = Array(12); for (XPl_Co = 0; XPl_Co < q.length; XPl_Co++) q[XPl_Co] = c[XPl_Co]; c = Array(12); for (YPl_Co = 0; YPl_Co < q.length; YPl_Co++) c[YPl_Co] = a[YPl_Co]; XPlanetCo_ordinate1 =
Array(12); for (XPl_Co = 0; XPl_Co < XPlanetCo_ordinate1.length; XPl_Co++) XPlanetCo_ordinate1[XPl_Co] = b[XPl_Co]; YPlanetCo_ordinate1 = Array(12); for (YPl_Co = 0; YPl_Co < XPlanetCo_ordinate1.length; YPl_Co++) YPlanetCo_ordinate1[YPl_Co] = h[YPl_Co]; DrawLinesofEastChartKP(e, n, m, k); for (j = 0; 11 >= j; j++) for (countkp = 1; countkp <= Object.keys(f[j]).length; countkp++) {
        switch (countkp) {
            case 1: newvalue = f[j].val1; splitnewvalue = newvalue.split("#"); break; case 2: newvalue = f[j].val2; splitnewvalue = newvalue.split("#"); break; case 3: newvalue =
f[j].val3; splitnewvalue = newvalue.split("#"); break; case 4: newvalue = f[j].val4; splitnewvalue = newvalue.split("#"); break; case 5: newvalue = f[j].val5; splitnewvalue = newvalue.split("#"); break; case 6: newvalue = f[j].val6; splitnewvalue = newvalue.split("#"); break; case 7: newvalue = f[j].val7, splitnewvalue = newvalue.split("#")
        } q = parseInt(j) + 1; d == LANGUAGE_HINDI ? (SetFontSize(12), valueOfpoint = splitnewvalue[1], valueOfpointnew = splitnewvalue[1].split("&")) : (SetFontSize(12), valueOfpoint = splitnewvalue[1], valueOfpointnew = splitnewvalue[1].split("-"));
        "1" == textcolor ? FontColorFunction("&H000000") : (a = g[j], FontColorFunction(a)); PrintTextL(XPlanetCo_ordinate1[q - 1][l[q - 1]] + e + XPlanetCo_ordinate1[q - 1][l[q - 1]] / 299 * (m - e) - XPlanetCo_ordinate1[q - 1][l[q - 1]], YPlanetCo_ordinate1[q - 1][l[q - 1]] + n + YPlanetCo_ordinate1[q - 1][l[q - 1]] / 299 * (k - n) - YPlanetCo_ordinate1[q - 1][l[q - 1]], p[splitnewvalue[0]] + "(" + valueOfpointnew[0].substring(1, 3) + ")", d); l[q - 1] += 1
    } 
}
function PrintSouthIndianChartKP(e, n, m, k, f, d, l) {
    var p, q, c, a, b, h; l = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; p = d == LANGUAGE_ENGLISH ? "Su Mo Ma Me Ju Ve Sa Ra Ke Ur Ne Pl I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_TAMIL ? "\u0b9a\u0bc2;\u0b9a\u0ba8\u0bcd;\u0b9a\u0bc6;\u0baa\u0bc1;\u0b95\u0bc1;\u0b9a\u0bc1;\u0b9a\u0ba9\u0bbf;\u0bb0\u0bbe;\u0b95\u0bc7;\u0baf\u0bc1 ;\u0ba8\u0bc6;\u0baa\u0bcd\u0bb3\u0bc1;I;II;III;IV;V;VI;VII;VIII;IX;X;XI;XII".split(";") : d == LANGUAGE_KANNADA ? "ರ ಚಂ ಮಂ ಬು ಗು ಶು ಶ ರಾ ಕೇ ಯೂ ನೆ ಪ್ಲು I II III IV V VI VII VIII IX X XI XII".split(" ") :
d == LANGUAGE_TELUGU ? "\u0c30 \u0c1a\u0c02 \u0c15\u0c41 \u0c2c\u0c41 \u0c17\u0c41 \u0c36\u0c41 \u0c36 \u0c30\u0c3e \u0c15\u0c47 \u0c2f\u0c41 \u0c28\u0c46 \u0c2a\u0c4d\u0c32\u0c42 I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_BENGALI ? "\u09b8\u09c2: \u099a: \u09ae: \u09ac\u09c1: \u09ac\u09c3\u09b9: \u09b6\u09c1: \u09b6: \u09b0\u09be: \u0995\u09c7: \u0987\u0989: \u09a8\u09c7: \u09aa\u09cd\u09b2\u09c1: I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_GUJARATI ? "સૂ ચં મં બુ ગુ શુ શ રા કે યુ ને પ્લુ I II III IV V VI VII VIII IX X XI XII".split(" ") :
d == LANGUAGE_MALAYALAM ? "ര ച കു ബു ഗു ശു മ സ ശി യു നെ പ്ലൂ I II III IV V VI VII VIII IX X XI XII".split(" ") : d == LANGUAGE_MARATHI ? "सू चं मं बु गु शु श रा के यू ने प्लू I II III IV V VI VII VIII IX X XI XII".split(" ") : "\u0938\u0942 \u091a\u0902 \u092e\u0902 \u092c\u0941 \u0917\u0941 \u0936\u0941 \u0936 \u0930\u093e \u0915\u0947 \u092f\u0942 \u0928\u0947 \u092a\u094d\u0932\u0942 1 2 3 4 5 6 7 8 9 10 11 12".split(" "); h = "#BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 #B71510 #C88E45 #FF0000 #190634 #B71510 #B63BB0 #BBB9FF #23481D #4C69A5 #B63BB0 #014700 #CB2813 #B71510 #C88E45 #FF0000 #190634 #B71510 #B63BB0".split(" ");
    c = Array(12); a = Array(12); c[0] = [76, 76, 76, 76, 76, 76, 76, 76, 76]; a[0] = [1, 12, 24, 36, 48, 60, 72, 84, 96]; c[1] = [149, 149, 149, 149, 149, 149, 149, 149, 149]; a[1] = [1, 12, 24, 36, 48, 60, 72, 84, 96]; c[2] = [224, 224, 224, 224, 224, 224, 224, 224, 224]; a[2] = [1, 12, 24, 36, 48, 60, 72, 84, 96]; c[3] = [224, 224, 224, 224, 224, 224, 224, 224, 224]; a[3] = [75, 87, 99, 111, 123, 135, 147, 159, 171]; c[4] = [224, 224, 224, 224, 224, 224, 224, 224, 224]; a[4] = [149, 161, 173, 185, 197, 209, 221, 233, 245]; c[5] = [224, 224, 224, 224, 224, 224, 224, 224, 224]; a[5] = [224, 236, 248, 260, 272, 284, 296, 308, 320]; c[6] =
[149, 149, 149, 149, 149, 149, 149, 149, 149]; a[6] = [279, 267, 255, 243, 231, 219, 207, 195, 183]; c[7] = [76, 76, 76, 76, 76, 76, 76, 76, 76]; a[7] = [279, 267, 255, 243, 231, 219, 207, 195, 183]; c[8] = [0, 0, 0, 0, 0, 0, 0, 0, 0]; a[8] = [279, 267, 255, 243, 231, 219, 207, 195, 183]; c[9] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; a[9] = [204, 192, 180, 168, 156, 144, 132, 120, 108]; c[10] = [0, 0, 0, 0, 0, 0, 0, 0, 0]; a[10] = [132, 120, 108, 96, 84, 72, 60, 48, 36]; c[11] = [0, 0, 0, 0, 0, 0, 0, 0, 0]; a[11] = [55, 43, 31, 19, 7, 0, 66, 77, 88]; q = Array(12); for (b = 0; b < q.length; b++) q[b] = c[b]; c = Array(12); for (b = 0; b < q.length; b++) c[b] =
a[b]; DrawLinesofSouthChart(e, n, m, k); for (j = 0; 11 >= j; j++) for (countkp = 1; countkp <= Object.keys(f[j]).length; countkp++) {
        switch (countkp) {
            case 1: newvalue = f[j].val1; splitnewvalue = newvalue.split("#"); break; case 2: newvalue = f[j].val2; splitnewvalue = newvalue.split("#"); break; case 3: newvalue = f[j].val3; splitnewvalue = newvalue.split("#"); break; case 4: newvalue = f[j].val4; splitnewvalue = newvalue.split("#"); break; case 5: newvalue = f[j].val5; splitnewvalue = newvalue.split("#"); break; case 6: newvalue = f[j].val6; splitnewvalue = newvalue.split("#");
                break; case 7: newvalue = f[j].val7, splitnewvalue = newvalue.split("#")
        } d == LANGUAGE_ENGLISH ? (SetFontSize(ENGLISH_PLANAT_KP__FONT_SIZE), valueOfpoint = splitnewvalue[1]) : (SetFontSize(ENGLISH_PLANAT_KP__FONT_SIZE), valueOfpoint = splitnewvalue[1].replace(/&/g, ".")); a = parseInt(j) + 1; "1" == textcolor ? FontColorFunction("&H000000") : (b = h[j], FontColorFunction(b)); PrintTextL(q[a - 1][l[a - 1]] + e + q[a - 1][l[a - 1]] / 299 * (m - e) - q[a - 1][l[a - 1]], c[a - 1][l[a - 1]] + n + c[a - 1][l[a - 1]] / 299 * (k - n) - c[a - 1][l[a - 1]], p[splitnewvalue[0]] + " " + valueOfpoint,
d); l[a - 1] += 1
    } 
}
function DrawLinesofEastChartKP(e, n, m, k) {
    var f, d, l, p; f = 21 + (e - 21); d = 21 + (n - 21); l = 320 + (m - 320); p = 320 + (k - 320); DrawRectangle(f, d, l, p); DrawRectangle(f - 2.5, d - 2.5, l + 3, p + 3); CanvasLine(e, (k + k) / 2 - (k + k) / 6 - d, m, (k + k) / 2 - (k + k) / 6 - d); CanvasLine(e, (k - n) / 3.2 + n, m, (k - n) / 3.2 + n); CanvasLine((m - e) / 2 + (m - e) / 6 + e, (k + k) / 2 - (k + k) / 6 - d, m, k); CanvasLine((m - e) / 3 + e, n, (m - e) / 3 + e, k); CanvasLine((m - e) / 2 + (m - e) / 6 + e, n, (m - e) / 2 + (m - e) / 6 + e, k); CanvasLine(f, d, (m - e) / 2.9 + e - 3, (k - n) / 3 + n - 2); CanvasLine(m, n, (m - e) / 2 + (m - e) / 6 + e, (k - n) / 3 + n - 3); CanvasLine((m - e) / 3 +
e, (k + k) / 2 - (k + k) / 6 - d, e, k)
};
//*****************************Pada Charts*********************************

function PrintChartPada(n, m, g, r, e,arrValue, d, h, q, lagnaRashi) {
	//alert(lagnaRashi);
    count = lagnaRashi; a1 = d; e1 = h; d1 = q; g4 = c;
    //d == CHART_NORTH ? PrintNorthIndianChart(n, m, g, r, e, h, q) : PrintSouthIndianChart(n, m, g, r, e, h, q)
    if (d == CHART_NORTH) {
       
        PrintNorthIndianChartPada(n, m, g, r, e,arrValue, h, q,lagnaRashi);
    }
    else if (d == CHART_EAST) {
    PrintEastIndianChartPada(n, m, g, r, e,arrValue, h, q,lagnaRashi);
    }
else {
    
        PrintSouthIndianChartPada(n, m, g, r, e,arrValue, h, q,lagnaRashi);
    }
}


function PrintNorthIndianChartPada(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets,aryPlanet, LanguageCode, BhavaValue,lagnRashi) {
	//alert(lagnRashi);
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

    //ColorArray = Array("#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000");
    ColorArray = Array("#F52443", "#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "&HB71510", "#C88E45", "#000000", "#000000", "#000000");
    /* *****************************Co-ordinates of Rashi No.******************************** */
    XRashiPoint = new Array(139, 64, 54, 126, 55, 67, 139, 213, 227, 154, 228, 214);
    YRashiPoint = new Array(129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55);
    
    /* ****************************End Co-ordinates of Rashi No.***************************** */

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[0] = new Array(71, 25, 71, 71, 110, 45, 45, 89, 89);

    XPlanetPoint[1] = new Array(65, 36, 83, 62, 43, 83, 23-6, 103, 63);
    YPlanetPoint[1] = new Array(25, 5, 5,5, 25, 25,5, 5, 42);

    XPlanetPoint[2] = new Array(1, 1, 1, 1, 1, 19, 19, 19, 36);
    YPlanetPoint[2] = new Array(71, 91, 51, 31, 109, 71, 91, 51, 71);

    XPlanetPoint[3] = new Array(63, 63, 23, 103, 63, 43, 83, 43, 83);
    YPlanetPoint[3] = new Array(146, 105, 146, 146, 180, 126, 126, 166, 166);

    XPlanetPoint[4] = new Array(1, 1, 1, 1, 1, 19, 19, 19, 36);
    YPlanetPoint[4] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[5] = new Array(37, 91, 64, 64, 24, 44, 84, 104, 64);
    YPlanetPoint[5] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[6] = new Array(139, 139, 104, 174, 139, 119, 159, 119, 159);
    YPlanetPoint[6] = new Array(220, 181, 220, 220, 264, 201, 201, 240, 240);

    XPlanetPoint[7] = new Array(239, 187, 213, 213, 173, 193, 233, 253, 213);
    YPlanetPoint[7] = new Array(267, 267, 267, 287, 287, 287, 287, 287, 247);

    XPlanetPoint[8] = new Array(277, 277, 277, 277, 277, 259, 259, 259, 239);
    YPlanetPoint[8] = new Array(220, 240, 201, 181, 261, 220, 241, 201, 220);

    XPlanetPoint[9] = new Array(213, 213, 175, 253, 223, 193, 232, 193, 233);
    YPlanetPoint[9] = new Array(146, 105, 146, 146, 186, 126, 126, 166, 166);

    XPlanetPoint[10] = new Array(279, 279, 279, 279, 279, 259, 259, 259, 239);
    YPlanetPoint[10] = new Array(71, 91, 51, 31, 110, 71, 91, 51, 71);

    XPlanetPoint[11] = new Array(213, 188, 233, 212, 193, 233, 173-6, 253, 213);
    YPlanetPoint[11] = new Array(25, 5, 5, 5, 25, 25, 5, 5, 42);

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
    lagnaRasi = lagnRashi;
   // alert(lagnaRasi)
    for (i = 0; i < 12; i++) {
    	//alert(XRashiPoint[i]+","+YRashiPoint[i]);
        newRashiNo = parseInt(lagnaRasi, 10) + i;     
        if (newRashiNo > 12) { newRashiNo = newRashiNo - 12 }
        if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
        PrintText((XRashiPoint[i] + chart_topleft_x_new_cordinate + (XRashiPoint[i] / (320 - 21)) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XRashiPoint[i]), YRashiPoint[i] + chart_topleft_y_new_cordinate + (YRashiPoint[i] / (320 - 21)) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YRashiPoint[i], newRashiNo);
       
    }

  /*Set font size to Print Planets*/

    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } 
    else if(LanguageCode==LANGUAGE_TAMIL || LanguageCode==LANGUAGE_MALAYALAM){ SetFontSize(10)}
    else { SetFontSize(PLANAT_FONT_SIZE) }
    
    /*Calculate BhavaValue Position and store in array named NewRaashiNoCorrespondingToPlanets*/
    //alert(!BhavaValue);
    if (!BhavaValue) {
        for (i = 0; i <= 20; i++) {
          
            NewRaashiNoCorrespondingToPlanets[i] = rasiToBhava(lagnaRasi, RaashiNoCorrespondingToPlanets[i]);
          
        }
    }
   
   
    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 20; i++) {
            //arrange here othere wise we have to set in cordinates
            currentBhavofPlanet = NewRaashiNoCorrespondingToPlanets[i] //arrange 
            //alert(currentBhavofPlanet);
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL(XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentBhavofPlanet - 1][totalPlanetInBhav[currentBhavofPlanet - 1]], aryPlanet[i], LanguageCode);
            totalPlanetInBhav[currentBhavofPlanet - 1] = totalPlanetInBhav[currentBhavofPlanet - 1] + 1;
        
    }

} /* Close Brase for PrintNorthIndianChart Method */

/*BhavaValue is ignored in case of SouthIndianChart. Introduced just to have same signature.*/
/* ********************************************************************************************************************************************* */
function PrintSouthIndianChartPada(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets,aryPlanet, LanguageCode, BhavaValue,lagnRashi) {
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

  
    //ColorArray = Array("#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000");
    ColorArray = Array("#F52443", "#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "&HB71510", "#C88E45", "#FF0000", "#190634", "#0B0823");
    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(103, 74, 127, 74, 127, 92, 112, 92, 112);
    YPlanetPoint[0] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[1] = new Array(175, 149, 199, 149, 199, 164, 186, 164, 186);
    YPlanetPoint[1] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[2] = new Array(250, 224, 275, 224, 275, 240, 258, 238, 258);
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

    XPlanetPoint[9] = new Array(25, 0, 49, 0, 52, 17, 37, 17, 37);
    YPlanetPoint[9] = new Array(181, 155, 154, 208, 208, 167, 199, 199,167);

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
   

    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } 
    else if(LanguageCode==LANGUAGE_TAMIL || LanguageCode==LANGUAGE_MALAYALAM){ SetFontSize(10)}
    else { SetFontSize(PLANAT_FONT_SIZE) }
    //Valid values are: 0 - left (default), 1 - right, 2 - center and 3 - justified. Width property must also be specified.
    // FontAlignent(TEXT_ALIGNMENT_JUSTIFY,FONT_WIDTH)

    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 20; i++) {
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

/* ********************************************************************************************************************************************** */
function PrintEastIndianChartPada(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets,aryPlanet, LanguageCode, BhavaValue,lagnRashi) {
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

   
    //ColorArray = Array("#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000", "#000000");
    ColorArray = Array("#F52443", "#BBB9FF", "#23481D", "#4C69A5", "#B63BB0", "#014700", "#CB2813", "&HB71510", "#C88E45", "#FF0000", "#190634", "#0B0823");

    //'*****************************Co-ordinates of Planets***********************************
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(138, 138, 103, 173, 138, 118, 158, 118, 158);
    YPlanetPoint[0] = new Array(50, 6, 50, 50, 87, 24, 24, 71, 71);

    XPlanetPoint[1] = new Array(62, 62, 55, 38, 19, 32, 76, 62, 42);
    YPlanetPoint[1] = new Array(50, 8, 24, 8, 8, 24, 24, 37, 37);

    XPlanetPoint[2] = new Array(2, 2, 2, 2, 27, 27, 27, 47, 47);
    YPlanetPoint[2] = new Array(50, 66, 30, 84, 84, 50, 67, 84, 67);

    XPlanetPoint[3] = new Array(42, 42, 2, 72, 72, 22, 62, 22, 62);
    YPlanetPoint[3] = new Array(141, 107, 141, 141, 181, 121, 121, 161, 161);

    XPlanetPoint[4] = new Array(1, 1, 1, 27, 27, 52, 1, 22, 44);
    YPlanetPoint[4] = new Array(247, 227, 208, 208, 227, 207, 262, 242, 227);

    XPlanetPoint[5] = new Array(75, 63, 70, 39, 50, 75, 19, 30, 55);
    YPlanetPoint[5] = new Array(246, 285, 266, 285, 266, 226, 285, 266, 246);

    XPlanetPoint[6] = new Array(138, 138, 103, 173, 138, 118, 158, 118, 158);
    YPlanetPoint[6] = new Array(246, 207, 246, 246, 286, 227, 227, 266, 267);

    XPlanetPoint[7] = new Array(202, 202, 202, 202, 229, 229, 222, 249, 249);
    YPlanetPoint[7] = new Array(246, 226, 266, 286, 286, 266, 246, 286, 266);

    XPlanetPoint[8] = new Array(268, 268, 268, 244, 244, 222, 228, 268, 248);
    YPlanetPoint[8] = new Array(249, 230, 210, 210, 230, 209, 229, 262, 244);

    XPlanetPoint[9] = new Array(239, 239, 204, 272, 244, 219, 258, 219, 259);
    YPlanetPoint[9] = new Array(141, 107, 141, 141, 181, 121, 121, 161, 161);

    XPlanetPoint[10] = new Array(268, 268, 268, 244, 222, 246, 228, 268, 248);
    YPlanetPoint[10] = new Array(50, 70, 34, 86, 86, 50, 70, 89, 70);

    XPlanetPoint[11] = new Array(204, 204, 204, 259, 229, 229, 204, 224, 247);
    YPlanetPoint[11] = new Array(50, 30, 10, 10, 30, 9, 64, 50, 28);

    XPlanetCo_ordinate = new Array(12);
    for (XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }
    /* ****************************Co-ordinates of Planets*********************************** */

    /* Draw All Lines(Border/Digonal Lines) of Kundali */
    DrawLinesofEastChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)

    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } 
    else if(LanguageCode==LANGUAGE_TAMIL || LanguageCode==LANGUAGE_MALAYALAM){ SetFontSize(10)}
    else { SetFontSize(PLANAT_FONT_SIZE) }
    
    //FontAlignent(TEXT_ALIGNMENT_JUSTIFY, FONT_WIDTH);

    /* Code to print Planets in the Chart */
    for (i = 0; i <= 20; i++) {
       
            currentPosOfPlanet = RaashiNoCorrespondingToPlanets[i];
            //alert(RaashiNoCorrespondingToPlanets[i]);
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            PrintTextL((XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), (YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[currentPosOfPlanet - 1][totalPlanetInBhav[currentPosOfPlanet - 1]]), aryPlanet[i], LanguageCode);
            totalPlanetInBhav[currentPosOfPlanet - 1] = totalPlanetInBhav[currentPosOfPlanet - 1] + 1;
       
    }
    
    
}

function PrintChartofAstak(n, m, q, t, g, e, h, l, k, c) {
    e == CHART_SOUTH ? PrintSouthIndianChartAshtakVarga(n, m, q, t, g, h, l) :e == CHART_NORTH ?  PrintNorthIndianChartAshtakVarga(n, m, q, t, g, h, l): PrintEastIndianChartAshtakVarga(n, m, q, t, g, h, l);
}


function PrintNorthIndianChartAshtakVarga(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
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

   
    ColorArray = Array("#57a8dd", "#57a8dd", "#57a8dd", "#57a8dd", "#69c4bb", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b");

    /* *****************************Co-ordinates of Rashi No.******************************** */
    XRashiPoint = new Array(139, 64, 54, 126, 50, 65, 139, 213, 227, 154, 228, 214);
    YRashiPoint = new Array(129, 56, 70, 144, 219, 231, 159, 232, 220, 144, 71, 55);
    
    XRashiPoint1 = new Array(140, 64, 18,67, 18, 68, 139+5, 213+5, 265, 217, 265, 214);
    YRashiPoint1 = new Array(70, 26, 75, 144, 219, 265, 220, 265, 220, 144, 71, 26);
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
        if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = "#000000"; FontColorFunction(fontcolor) }
        //alert("lagnaRasi" + lagnaRasi);
        
        PrintText((XRashiPoint[i] + chart_topleft_x_new_cordinate + (XRashiPoint[i] / (320 - 21)) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XRashiPoint[i]), YRashiPoint[i] + chart_topleft_y_new_cordinate + (YRashiPoint[i] / (320 - 21)) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YRashiPoint[i], newRashiNo);
        //PrintText(110+(i*20), 120, newRashiNo);
    }


    /*Set font size to Print Planets*/
    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

 

    /*Code to print Planets in the Chart*/
    for (i = 0; i <= 11; i++) {
       
            currentBhavofPlanet = RaashiNoCorrespondingToPlanets[i+1];
            //alert(currentBhavofPlanet - 1);
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { 
            	for( j = 0 ; j<ColorArray.length ; j++ ){
            		// prashtakvarga
            		if(currentBhavofPlanet ==j ){
            			fontcolor = ColorArray[j]; 
            			FontColorFunction(fontcolor)
            		
            		}
            		
            		// ashtakvarga
            		
            		else if(currentBhavofPlanet<29 && currentBhavofPlanet>12){
            			fontcolor = ColorArray[0]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		else if(currentBhavofPlanet>29 ){
            			fontcolor = ColorArray[5]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		else if (currentBhavofPlanet==29){
            			fontcolor = ColorArray[4]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		//FontColorFunction(fontcolor)
            	}
            	}
           // alert(YRashiPoint1[i]);
            DrawCircle((XRashiPoint1[i] + chart_topleft_x_new_cordinate + (XRashiPoint1[i] / (320 - 21)) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XRashiPoint1[i])+10,YRashiPoint1[i] + chart_topleft_y_new_cordinate + (YRashiPoint1[i] / (321 - 25)) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YRashiPoint1[i],fontcolor);
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = "#ffffff"; FontColorFunction(fontcolor) }
            if(currentBhavofPlanet.toString().length >1){XRashiPoint1[i] = XRashiPoint1[i]-1;}else{XRashiPoint1[i] = XRashiPoint1[i]+1}
            PrintTextL((XRashiPoint1[i] + chart_topleft_x_new_cordinate + (XRashiPoint1[i] / (320 - 21)) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XRashiPoint1[i]), YRashiPoint1[i] + chart_topleft_y_new_cordinate + (YRashiPoint1[i] / (320 - 21)) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YRashiPoint1[i], currentBhavofPlanet, LanguageCode);
            totalPlanetInBhav[currentBhavofPlanet - 1] = totalPlanetInBhav[currentBhavofPlanet - 1] + 1;
           // alert(totalPlanetInBhav[currentBhavofPlanet - 1]);
        
    }

} /* Close Brase for PrintNorthIndianChart Method */
/*BhavaValue is ignored in case of SouthIndianChart. Introduced just to have same signature.*/
/* ********************************************************************************************************************************************* */
function PrintSouthIndianChartAshtakVarga(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
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

 
    ColorArray = Array("#57a8dd", "#57a8dd", "#57a8dd", "#57a8dd", "#69c4bb", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b");

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(107, 74, 127, 74, 127, 92, 112, 92, 112);
    YPlanetPoint[0] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[1] = new Array(177, 149, 199, 149, 199, 164, 186, 164, 186);
    YPlanetPoint[1] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[2] = new Array(252, 224, 275, 224, 275, 248, 258, 238, 258);
    YPlanetPoint[2] = new Array(34, 7, 7, 64, 64, 19, 19, 49, 49);

    XPlanetPoint[3] = new Array(252, 224, 274, 224, 274, 239, 264, 239, 264);
    YPlanetPoint[3] = new Array(106, 80, 80, 137, 137, 92, 92, 121, 121);

    XPlanetPoint[4] = new Array(252, 224, 275, 224, 275, 238, 258, 238, 258);
    YPlanetPoint[4] = new Array(181, 155, 155, 206, 206, 166, 166, 199, 199);

    XPlanetPoint[5] = new Array(252, 224, 274, 224, 274, 238, 258, 238, 258);
    YPlanetPoint[5] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[6] = new Array(177, 150, 199, 150, 201, 165, 185, 165, 185);
    YPlanetPoint[6] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[7] = new Array(107, 75, 124, 75, 128, 92, 112, 92, 112);
    YPlanetPoint[7] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[8] = new Array(29, 0, 49, 0, 52, 17, 37, 17, 37);
    YPlanetPoint[8] = new Array(257, 230, 230, 287, 287, 242, 242, 272, 272);

    XPlanetPoint[9] = new Array(29, 0, 49, 0, 52, 17, 37, 167, 17, 37);
    YPlanetPoint[9] = new Array(181, 155, 154, 208, 208, 167, 199, 199);

    XPlanetPoint[10] = new Array(29, 0, 49, 0, 50, 17, 37, 17, 37);
    YPlanetPoint[10] = new Array(106, 80, 80, 134, 134, 92, 92, 121, 121);

    XPlanetPoint[11] = new Array(29, 0, 49, 0, 52, 16, 37, 16, 37);
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
    for (i = 1; i <= 12; i++) {
      
            currentPosOfPlanet = RaashiNoCorrespondingToPlanets[i];
          
           // if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { 
            	for( j = 0 ; j<ColorArray.length ; j++ ){
            		// prashtakvarga
            		if(currentPosOfPlanet ==j ){
            			fontcolor = ColorArray[j]; 
            			FontColorFunction(fontcolor)
            		
            		}
            		
            		// ashtakvarga
            		
            		else if(currentPosOfPlanet<29 && currentPosOfPlanet>12){
            			fontcolor = ColorArray[0]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		else if(currentPosOfPlanet>29 ){
            			fontcolor = ColorArray[5]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		else if (currentPosOfPlanet==29){
            			fontcolor = ColorArray[4]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		//FontColorFunction(fontcolor)
            	}
            	}
         // alert(XPlanetCo_ordinate[i - 1]);
            DrawCircle((XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]])+10, (YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] / (320 - 25) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]),fontcolor);
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = "#ffffff"; FontColorFunction(fontcolor) }
            var xpoint = XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]+1;
            if(currentPosOfPlanet.toString().length >1){
         	   xpoint = XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]-2;
         	   }
            PrintTextL((xpoint + chart_topleft_x_new_cordinate + xpoint / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - xpoint), (YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]), currentPosOfPlanet, LanguageCode);
            totalPlanetInBhav[i - 1] = totalPlanetInBhav[i - 1] + 1;
      
    }

}
/* End PrintSouthIndianChart function to create and draw the chart */

/* ********************************************************************************************************************************************* */
function PrintEastIndianChartAshtakVarga(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate, RaashiNoCorrespondingToPlanets, LanguageCode, BhavaValue) {
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

 
    ColorArray = Array("#57a8dd", "#57a8dd", "#57a8dd", "#57a8dd", "#69c4bb", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b", "#f6915b");

    /* ****************************Co-ordinates of Planets*********************************** */
    XPlanetPoint = new Array(12);
    YPlanetPoint = new Array(12);

    XPlanetPoint[0] = new Array(138, 138, 103, 173, 138, 118, 158, 118, 158);
    YPlanetPoint[0] = new Array(46, 6, 50, 50, 87, 24, 24, 71, 71);

    XPlanetPoint[1] = new Array(65, 62, 55, 38, 19, 32, 76, 62, 42);
    YPlanetPoint[1] = new Array(46, 8, 24, 8, 8, 24, 24, 37, 37);

    XPlanetPoint[2] = new Array(18, 2, 2, 2, 27, 27, 27, 47, 47);
    YPlanetPoint[2] = new Array(62, 66, 30, 84, 84, 50, 67, 84, 67);

    XPlanetPoint[3] = new Array(42, 42, 2, 72, 72, 22, 62, 22, 62);
    YPlanetPoint[3] = new Array(145, 107, 141, 141, 181, 121, 121, 161, 161);

    XPlanetPoint[4] = new Array(18, 1, 1, 27, 27, 52, 1, 22, 44);
    YPlanetPoint[4] = new Array(236, 227, 208, 208, 227, 207, 262, 242, 227);

    XPlanetPoint[5] = new Array(75, 63, 70, 39, 50, 75, 19, 30, 55);
    YPlanetPoint[5] = new Array(250, 285, 266, 285, 266, 226, 285, 266, 246);

    XPlanetPoint[6] = new Array(138, 138, 103, 173, 138, 118, 158, 118, 158);
    YPlanetPoint[6] = new Array(250, 207, 246, 246, 286, 227, 227, 266, 267);

    XPlanetPoint[7] = new Array(210, 202, 202, 202, 229, 229, 222, 249, 249);
    YPlanetPoint[7] = new Array(250, 226, 266, 286, 286, 266, 246, 286, 266);

    XPlanetPoint[8] = new Array(268, 268, 268, 244, 244, 222, 228, 268, 248);
    YPlanetPoint[8] = new Array(236, 230, 210, 210, 230, 209, 229, 262, 244);

    XPlanetPoint[9] = new Array(239, 239, 204, 272, 244, 219, 258, 219, 259);
    YPlanetPoint[9] = new Array(145, 107, 141, 141, 181, 121, 121, 161, 161);

    XPlanetPoint[10] = new Array(268, 268, 268, 244, 222, 246, 228, 268, 248);
    YPlanetPoint[10] = new Array(62, 70, 34, 86, 86, 50, 70, 89, 70);

    XPlanetPoint[11] = new Array(210, 204, 204, 259, 229, 229, 204, 224, 247);
    YPlanetPoint[11] = new Array(50, 30, 10, 10, 30, 9, 64, 50, 28);

    XPlanetCo_ordinate = new Array(12);
    for (var XPl_Co = 0; XPl_Co < XPlanetCo_ordinate.length; XPl_Co++) { XPlanetCo_ordinate[XPl_Co] = XPlanetPoint[XPl_Co]; }

    YPlanetCo_ordinate = new Array(12);
    for (var YPl_Co = 0; YPl_Co < XPlanetCo_ordinate.length; YPl_Co++) { YPlanetCo_ordinate[YPl_Co] = YPlanetPoint[YPl_Co]; }

    /* ****************************Co-ordinates of Planets*********************************** */

    /*SetFontSize to Set font size for Rashi No.*/
    //SetFontSize(RASHI_FONT_SIZE);

    /*Draw All Lines(Border/Digonal Lines) of Kundali*/
    DrawLinesofEastChart(chart_topleft_x_new_cordinate, chart_topleft_y_new_cordinate, chart_bottomright_x_new_cordinate, chart_bottomright_y_new_cordinate)


    /*Set font size to Print Planets*/
    if (LanguageCode == LANGUAGE_ENGLISH) { SetFontSize(HINDI_PLANAT_FONT_SIZE) } else { SetFontSize(PLANAT_FONT_SIZE) }

    //Valid values are: 0 - left (default), 1 - right, 2 - center and 3 - justified. Width property must also be specified.
    // FontAlignent(TEXT_ALIGNMENT_JUSTIFY,FONT_WIDTH)

    /*Code to print Planets in the Chart*/
    for (i = 1; i <= 12; i++) {
      
            currentPosOfPlanet = RaashiNoCorrespondingToPlanets[i];
         // alert(currentPosOfPlanet);
           // if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = ColorArray[i]; FontColorFunction(fontcolor) }
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { 
            	for( j = 0 ; j<ColorArray.length ; j++ ){
            		// prashtakvarga
            		if(currentPosOfPlanet ==j ){
            			fontcolor = ColorArray[j]; 
            			FontColorFunction(fontcolor)
            		
            		}
            		
            		// ashtakvarga
            		
            		else if(currentPosOfPlanet<29 && currentPosOfPlanet>12){
            			fontcolor = ColorArray[0]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		else if(currentPosOfPlanet>29 ){
            			fontcolor = ColorArray[5]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		else if (currentPosOfPlanet==29){
            			fontcolor = ColorArray[4]; 
            			FontColorFunction(fontcolor)
            			
            		}
            		//FontColorFunction(fontcolor)
            	}
            	}
          
            DrawCircle((XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] + chart_topleft_x_new_cordinate + XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]])+10, (YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] / (320 - 25) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]),fontcolor);
            if (textcolor == "1") { fontcolor = FontColorFunction("&H000000") } else { fontcolor = "#ffffff"; FontColorFunction(fontcolor) }
            var xpoint = XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]+1;
           if(currentPosOfPlanet.toString().length >1){
        	   xpoint = XPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]-2;
        	   }
            PrintTextL((xpoint + chart_topleft_x_new_cordinate + xpoint / (320 - 21) * (chart_bottomright_x_new_cordinate - chart_topleft_x_new_cordinate) - xpoint), (YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] + chart_topleft_y_new_cordinate + YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]] / (320 - 21) * (chart_bottomright_y_new_cordinate - chart_topleft_y_new_cordinate) - YPlanetCo_ordinate[i - 1][totalPlanetInBhav[i - 1]]), currentPosOfPlanet, LanguageCode);
            totalPlanetInBhav[i - 1] = totalPlanetInBhav[i - 1] ;
      
    }

}
/* End PrintEastIndianChartAshtakVarga function to create and draw the chart */