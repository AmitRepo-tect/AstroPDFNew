<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%  
	Local localSS = new Local();
	Hindi hindiSS = new Hindi();
	int languageCodeSS = (Integer) session.getAttribute("languageCode");
	DesktopHoro myAstrologyObjectSS = (DesktopHoro) session.getAttribute("HoroscopeObj");
	if(languageCodeSS > 1)
	{
		myAstrologyObjectSS.setLanguageCode("0");
		myAstrologyObjectSS.initialize();
	}
	MyProperties baseConstantsSS = (MyProperties) session.getAttribute("constants");
	MyResourceBundle sadeSatiConstants = (MyResourceBundle) localSS.loadPropertiesFileNew("sadesatireport", languageCodeSS);

	int[] ArrayLagnaChartRashiPositions = myAstrologyObjectSS.getPositionForShodasvarg(0);

int[] ArrayRashi = new int[243];
int[] ArraySaniStartDate = new int[243];
int[] ArraySaniEndDate = new int[243];

ArrayRashi[0] = 0;
for(int i=1;i<=18;i++)
{
	ArrayRashi[i] = 1;
}
for(int i=19;i<=40;i++)
{
	ArrayRashi[i] = 10;
}
for(int i=41;i<=60;i++)
{
	ArrayRashi[i] = 11;
}
for(int i=61;i<=79;i++)
{
	ArrayRashi[i] = 12;
}
for(int i=80;i<=97;i++)
{
	ArrayRashi[i] = 2;
}
for(int i=98;i<=116;i++)
{
	ArrayRashi[i] = 3;
}
for(int i=117;i<=135;i++)
{
	ArrayRashi[i] = 4;
}
for(int i=136;i<=156;i++)
{
	ArrayRashi[i] = 5;
}
for(int i=157;i<=177;i++)
{
	ArrayRashi[i] = 6;
}
for(int i=178;i<=198;i++)
{
	ArrayRashi[i] = 7;
}
for(int i=199;i<=220;i++)
{
	ArrayRashi[i] = 8;
}
for(int i=221;i<=242;i++)
{
	ArrayRashi[i] = 9;
}

ArraySaniStartDate[0] = 0;
ArraySaniStartDate[1] = 18800506	;
ArraySaniStartDate[2] = 18810103	;
ArraySaniStartDate[3] = 18821121	;
ArraySaniStartDate[4] = 19090709	;
ArraySaniStartDate[5] = 19100319	;
ArraySaniStartDate[6] = 19390428	;
ArraySaniStartDate[7] = 19411215	;
ArraySaniStartDate[8] = 19680617	;
ArraySaniStartDate[9] = 19690308	;
ArraySaniStartDate[10] = 19980418	;
ArraySaniStartDate[11] = 20270603	;
ArraySaniStartDate[12] = 20280224	;
ArraySaniStartDate[13] = 20291006	;
ArraySaniStartDate[14] = 20570407	;
ArraySaniStartDate[15] = 20860522	;
ArraySaniStartDate[16] = 20870208	;
ArraySaniStartDate[17] = 20881031	;
ArraySaniStartDate[18] = 21160330	;
ArraySaniStartDate[19] = 18730101	;
ArraySaniStartDate[20] = 18750824	;
ArraySaniStartDate[21] = 19020212	;
ArraySaniStartDate[22] = 19021106	;
ArraySaniStartDate[23] = 19310412	;
ArraySaniStartDate[24] = 19311225	;
ArraySaniStartDate[25] = 19340914	;
ArraySaniStartDate[26] = 19610202	;
ArraySaniStartDate[27] = 19611008	;
ArraySaniStartDate[28] = 19900321	;
ArraySaniStartDate[29] = 19901215	;
ArraySaniStartDate[30] = 19931016	;
ArraySaniStartDate[31] = 20200124	;
ArraySaniStartDate[32] = 20220713	;
ArraySaniStartDate[33] = 20490307	;
ArraySaniStartDate[34] = 20491204	;
ArraySaniStartDate[35] = 20790115	;
ArraySaniStartDate[36] = 20810803	;
ArraySaniStartDate[37] = 21080225	;
ArraySaniStartDate[38] = 21081123	;
ArraySaniStartDate[39] = 21380107	;
ArraySaniStartDate[40] = 21400823	;
ArraySaniStartDate[41] = 18750326	;
ArraySaniStartDate[42] = 18751221	;
ArraySaniStartDate[43] = 19050205	;
ArraySaniStartDate[44] = 19071008	;
ArraySaniStartDate[45] = 19340316	;
ArraySaniStartDate[46] = 19341208	;
ArraySaniStartDate[47] = 19640128	;
ArraySaniStartDate[48] = 19661103	;
ArraySaniStartDate[49] = 19930306	;
ArraySaniStartDate[50] = 19931110	;
ArraySaniStartDate[51] = 19950810	;
ArraySaniStartDate[52] = 20220429	;
ArraySaniStartDate[53] = 20230118	;
ArraySaniStartDate[54] = 20520225	;
ArraySaniStartDate[55] = 20540902	;
ArraySaniStartDate[56] = 20810412	;
ArraySaniStartDate[57] = 20820107	;
ArraySaniStartDate[58] = 21110217	;
ArraySaniStartDate[59] = 21130922	;
ArraySaniStartDate[60] = 21400401	;
ArraySaniStartDate[61] = 18780307	;
ArraySaniStartDate[62] = 18801215	;
ArraySaniStartDate[63] = 19070420	;
ArraySaniStartDate[64] = 19080111	;
ArraySaniStartDate[65] = 19090902	;
ArraySaniStartDate[66] = 19370226	;
ArraySaniStartDate[67] = 19660409	;
ArraySaniStartDate[68] = 19661220	;
ArraySaniStartDate[69] = 19680928	;
ArraySaniStartDate[70] = 19950602	;
ArraySaniStartDate[71] = 19960217	;
ArraySaniStartDate[72] = 20250330	;
ArraySaniStartDate[73] = 20271020	;
ArraySaniStartDate[74] = 20540515	;
ArraySaniStartDate[75] = 20550206	;
ArraySaniStartDate[76] = 20840320	;
ArraySaniStartDate[77] = 20861110	;
ArraySaniStartDate[78] = 21130503	;
ArraySaniStartDate[79] = 21140126	;
ArraySaniStartDate[80] = 18820630	;
ArraySaniStartDate[81] = 18830320	;
ArraySaniStartDate[82] = 18841124	;
ArraySaniStartDate[83] = 19120508	;
ArraySaniStartDate[84] = 19410619	;
ArraySaniStartDate[85] = 19420304	;
ArraySaniStartDate[86] = 19431217	;
ArraySaniStartDate[87] = 19710428	;
ArraySaniStartDate[88] = 20000607	;
ArraySaniStartDate[89] = 20030109	;
ArraySaniStartDate[90] = 20290808	;
ArraySaniStartDate[91] = 20300417	;
ArraySaniStartDate[92] = 20590528	;
ArraySaniStartDate[93] = 20620214	;
ArraySaniStartDate[94] = 20880718	;
ArraySaniStartDate[95] = 20890406	;
ArraySaniStartDate[96] = 20901025	;
ArraySaniStartDate[97] = 21180519	;
ArraySaniStartDate[98] = 18840820	;
ArraySaniStartDate[99] = 18850506	;
ArraySaniStartDate[100] = 18861120	;
ArraySaniStartDate[101] = 19140621	;
ArraySaniStartDate[102] = 19430806	;
ArraySaniStartDate[103] = 19440424	;
ArraySaniStartDate[104] = 19451222	;
ArraySaniStartDate[105] = 19730611	;
ArraySaniStartDate[106] = 20020723	;
ArraySaniStartDate[107] = 20030408	;
ArraySaniStartDate[108] = 20050114	;
ArraySaniStartDate[109] = 20320531	;
ArraySaniStartDate[110] = 20610711	;
ArraySaniStartDate[111] = 20620307	;
ArraySaniStartDate[112] = 20640206	;
ArraySaniStartDate[113] = 20900919	;
ArraySaniStartDate[114] = 20910521	;
ArraySaniStartDate[115] = 21200702	;
ArraySaniStartDate[116] = 21230309	;
ArraySaniStartDate[117] = 18600222	;
ArraySaniStartDate[118] = 18861019	;
ArraySaniStartDate[119] = 18870619	;
ArraySaniStartDate[120] = 19160802	;
ArraySaniStartDate[121] = 19190315	;
ArraySaniStartDate[122] = 19450923	;
ArraySaniStartDate[123] = 19460609	;
ArraySaniStartDate[124] = 19750724	;
ArraySaniStartDate[125] = 20040906	;
ArraySaniStartDate[126] = 20050526	;
ArraySaniStartDate[127] = 20070111	;
ArraySaniStartDate[128] = 20340713	;
ArraySaniStartDate[129] = 20630824	;
ArraySaniStartDate[130] = 20640510	;
ArraySaniStartDate[131] = 20660204	;
ArraySaniStartDate[132] = 20930703	;
ArraySaniStartDate[133] = 21220814	;
ArraySaniStartDate[134] = 21230416	;
ArraySaniStartDate[135] = 21250226	;
ArraySaniStartDate[136] = 18600101	;
ArraySaniStartDate[137] = 18600617	;
ArraySaniStartDate[138] = 18620201	;
ArraySaniStartDate[139] = 18890805	;
ArraySaniStartDate[140] = 19180918	;
ArraySaniStartDate[141] = 19190603	;
ArraySaniStartDate[142] = 19210224	;
ArraySaniStartDate[143] = 19480727	;
ArraySaniStartDate[144] = 19770907	;
ArraySaniStartDate[145] = 19800315	;
ArraySaniStartDate[146] = 20061101	;
ArraySaniStartDate[147] = 20070716	;
ArraySaniStartDate[148] = 20360828	;
ArraySaniStartDate[149] = 20390406	;
ArraySaniStartDate[150] = 20651013	;
ArraySaniStartDate[151] = 20660703	;
ArraySaniStartDate[152] = 20950819	;
ArraySaniStartDate[153] = 20980503	;
ArraySaniStartDate[154] = 21240930	;
ArraySaniStartDate[155] = 21250620	;
ArraySaniStartDate[156] = 21270205	;
ArraySaniStartDate[157] = 18611204	;
ArraySaniStartDate[158] = 18620818	;
ArraySaniStartDate[159] = 18910929	;
ArraySaniStartDate[160] = 18940405	;
ArraySaniStartDate[161] = 19201117	;
ArraySaniStartDate[162] = 19210809	;
ArraySaniStartDate[163] = 19500920	;
ArraySaniStartDate[164] = 19530424	;
ArraySaniStartDate[165] = 19791104	;
ArraySaniStartDate[166] = 19800727	;
ArraySaniStartDate[167] = 20090910	;
ArraySaniStartDate[168] = 20120516	;
ArraySaniStartDate[169] = 20381023	;
ArraySaniStartDate[170] = 20390713	;
ArraySaniStartDate[171] = 20410206	;
ArraySaniStartDate[172] = 20680830	;
ArraySaniStartDate[173] = 20971012	;
ArraySaniStartDate[174] = 20980620	;
ArraySaniStartDate[175] = 21000318	;
ArraySaniStartDate[176] = 21261208	;
ArraySaniStartDate[177] = 21270822	;
ArraySaniStartDate[178] = 18641022	;
ArraySaniStartDate[179] = 18670426	;
ArraySaniStartDate[180] = 18931207	;
ArraySaniStartDate[181] = 18940902	;
ArraySaniStartDate[182] = 19231016	;
ArraySaniStartDate[183] = 19260514	;
ArraySaniStartDate[184] = 19521126	;
ArraySaniStartDate[185] = 19530821	;
ArraySaniStartDate[186] = 19821006	;
ArraySaniStartDate[187] = 19850601	;
ArraySaniStartDate[188] = 20111115	;
ArraySaniStartDate[189] = 20120804	;
ArraySaniStartDate[190] = 20410128	;
ArraySaniStartDate[191] = 20410926	;
ArraySaniStartDate[192] = 20440623	;
ArraySaniStartDate[193] = 20701105	;
ArraySaniStartDate[194] = 20730331	;
ArraySaniStartDate[195] = 20991226	;
ArraySaniStartDate[196] = 21000917	;
ArraySaniStartDate[197] = 21291027	;
ArraySaniStartDate[198] = 21320426	;
ArraySaniStartDate[199] = 18670112	;
ArraySaniStartDate[200] = 18671009	;
ArraySaniStartDate[201] = 18700814	;
ArraySaniStartDate[202] = 18961119	;
ArraySaniStartDate[203] = 18990513	;
ArraySaniStartDate[204] = 19260101	;
ArraySaniStartDate[205] = 19260930	;
ArraySaniStartDate[206] = 19551112	;
ArraySaniStartDate[207] = 19580602	;
ArraySaniStartDate[208] = 19841221	;
ArraySaniStartDate[209] = 19850917	;
ArraySaniStartDate[210] = 20141103	;
ArraySaniStartDate[211] = 20170621	;
ArraySaniStartDate[212] = 20431212	;
ArraySaniStartDate[213] = 20440830	;
ArraySaniStartDate[214] = 20730206	;
ArraySaniStartDate[215] = 20731024	;
ArraySaniStartDate[216] = 20760711	;
ArraySaniStartDate[217] = 21021203	;
ArraySaniStartDate[218] = 21320119	;
ArraySaniStartDate[219] = 21321014	;
ArraySaniStartDate[220] = 21350808	;
ArraySaniStartDate[221] = 18700102	;
ArraySaniStartDate[222] = 18700909	;
ArraySaniStartDate[223] = 18990223	;
ArraySaniStartDate[224] = 18991117	;
ArraySaniStartDate[225] = 19020816	;
ArraySaniStartDate[226] = 19281225	;
ArraySaniStartDate[227] = 19310526	;
ArraySaniStartDate[228] = 19580208	;
ArraySaniStartDate[229] = 19581108	;
ArraySaniStartDate[230] = 19610918	;
ArraySaniStartDate[231] = 19871217	;
ArraySaniStartDate[232] = 19900621	;
ArraySaniStartDate[233] = 20170127	;
ArraySaniStartDate[234] = 20171027	;
ArraySaniStartDate[235] = 20461208	;
ArraySaniStartDate[236] = 20490710	;
ArraySaniStartDate[237] = 20760117	;
ArraySaniStartDate[238] = 20761012	;
ArraySaniStartDate[239] = 21051130	;
ArraySaniStartDate[240] = 21080729	;
ArraySaniStartDate[241] = 21350108	;
ArraySaniStartDate[242] = 21350922	;

ArraySaniEndDate[0] = 0;
ArraySaniEndDate[1] = 18801214	;
ArraySaniEndDate[2] = 18820629	;
ArraySaniEndDate[3] = 18830319	;
ArraySaniEndDate[4] = 19090901	;
ArraySaniEndDate[5] = 19120507	;
ArraySaniEndDate[6] = 19410618	;
ArraySaniEndDate[7] = 19420303	;
ArraySaniEndDate[8] = 19680927	;
ArraySaniEndDate[9] = 19710427	;
ArraySaniEndDate[10] = 20000606	;
ArraySaniEndDate[11] = 20271019	;
ArraySaniEndDate[12] = 20290807	;
ArraySaniEndDate[13] = 20300416	;
ArraySaniEndDate[14] = 20590527	;
ArraySaniEndDate[15] = 20861109	;
ArraySaniEndDate[16] = 20880717	;
ArraySaniEndDate[17] = 20890405	;
ArraySaniEndDate[18] = 21180518	;
ArraySaniEndDate[19] = 18750325	;
ArraySaniEndDate[20] = 18751220	;
ArraySaniEndDate[21] = 19020815	;
ArraySaniEndDate[22] = 19050204	;
ArraySaniEndDate[23] = 19310525	;
ArraySaniEndDate[24] = 19340315	;
ArraySaniEndDate[25] = 19341207	;
ArraySaniEndDate[26] = 19610917	;
ArraySaniEndDate[27] = 19640127	;
ArraySaniEndDate[28] = 19900620	;
ArraySaniEndDate[29] = 19930305	;
ArraySaniEndDate[30] = 19931109	;
ArraySaniEndDate[31] = 20220428	;
ArraySaniEndDate[32] = 20230117	;
ArraySaniEndDate[33] = 20490709	;
ArraySaniEndDate[34] = 20520224	;
ArraySaniEndDate[35] = 20810411	;
ArraySaniEndDate[36] = 20820106	;
ArraySaniEndDate[37] = 21080728	;
ArraySaniEndDate[38] = 21110216	;
ArraySaniEndDate[39] = 21400331	;
ArraySaniEndDate[40] = 21401227	;
ArraySaniEndDate[41] = 18750823	;
ArraySaniEndDate[42] = 18780306	;
ArraySaniEndDate[43] = 19070419	;
ArraySaniEndDate[44] = 19080110	;
ArraySaniEndDate[45] = 19340913	;
ArraySaniEndDate[46] = 19370225	;
ArraySaniEndDate[47] = 19660408	;
ArraySaniEndDate[48] = 19661219	;
ArraySaniEndDate[49] = 19931015	;
ArraySaniEndDate[50] = 19950601	;
ArraySaniEndDate[51] = 19960216	;
ArraySaniEndDate[52] = 20220712	;
ArraySaniEndDate[53] = 20250329	;
ArraySaniEndDate[54] = 20540514	;
ArraySaniEndDate[55] = 20550205	;
ArraySaniEndDate[56] = 20810802	;
ArraySaniEndDate[57] = 20840319	;
ArraySaniEndDate[58] = 21130502	;
ArraySaniEndDate[59] = 21140125	;
ArraySaniEndDate[60] = 21400822	;
ArraySaniEndDate[61] = 18800505	;
ArraySaniEndDate[62] = 18810102	;
ArraySaniEndDate[63] = 19071007	;
ArraySaniEndDate[64] = 19090708	;
ArraySaniEndDate[65] = 19100318	;
ArraySaniEndDate[66] = 19390427	;
ArraySaniEndDate[67] = 19661102	;
ArraySaniEndDate[68] = 19680616	;
ArraySaniEndDate[69] = 19690307	;
ArraySaniEndDate[70] = 19950809	;
ArraySaniEndDate[71] = 19980417	;
ArraySaniEndDate[72] = 20270602	;
ArraySaniEndDate[73] = 20280223	;
ArraySaniEndDate[74] = 20540901	;
ArraySaniEndDate[75] = 20570406	;
ArraySaniEndDate[76] = 20860521	;
ArraySaniEndDate[77] = 20870207	;
ArraySaniEndDate[78] = 21130921	;
ArraySaniEndDate[79] = 21160329	;
ArraySaniEndDate[80] = 18821120	;
ArraySaniEndDate[81] = 18840819	;
ArraySaniEndDate[82] = 18850505	;
ArraySaniEndDate[83] = 19140620	;
ArraySaniEndDate[84] = 19411214	;
ArraySaniEndDate[85] = 19430805	;
ArraySaniEndDate[86] = 19440423	;
ArraySaniEndDate[87] = 19730610	;
ArraySaniEndDate[88] = 20020722	;
ArraySaniEndDate[89] = 20030407	;
ArraySaniEndDate[90] = 20291005	;
ArraySaniEndDate[91] = 20320530	;
ArraySaniEndDate[92] = 20610710	;
ArraySaniEndDate[93] = 20620306	;
ArraySaniEndDate[94] = 20881030	;
ArraySaniEndDate[95] = 20900918	;
ArraySaniEndDate[96] = 20910520	;
ArraySaniEndDate[97] = 21200701	;
ArraySaniEndDate[98] = 18841123	;
ArraySaniEndDate[99] = 18861018	;
ArraySaniEndDate[100] = 18870618	;
ArraySaniEndDate[101] = 19160801	;
ArraySaniEndDate[102] = 19431216	;
ArraySaniEndDate[103] = 19450922	;
ArraySaniEndDate[104] = 19460608	;
ArraySaniEndDate[105] = 19750723	;
ArraySaniEndDate[106] = 20030108	;
ArraySaniEndDate[107] = 20040905	;
ArraySaniEndDate[108] = 20050525	;
ArraySaniEndDate[109] = 20340712	;
ArraySaniEndDate[110] = 20620213	;
ArraySaniEndDate[111] = 20630823	;
ArraySaniEndDate[112] = 20640509	;
ArraySaniEndDate[113] = 20901024	;
ArraySaniEndDate[114] = 20930702	;
ArraySaniEndDate[115] = 21220813	;
ArraySaniEndDate[116] = 21230415	;
ArraySaniEndDate[117] = 18600616	;
ArraySaniEndDate[118] = 18861119	;
ArraySaniEndDate[119] = 18890804	;
ArraySaniEndDate[120] = 19180917	;
ArraySaniEndDate[121] = 19190602	;
ArraySaniEndDate[122] = 19451221	;
ArraySaniEndDate[123] = 19480726	;
ArraySaniEndDate[124] = 19770906	;
ArraySaniEndDate[125] = 20050113	;
ArraySaniEndDate[126] = 20061031	;
ArraySaniEndDate[127] = 20070715	;
ArraySaniEndDate[128] = 20360827	;
ArraySaniEndDate[129] = 20640205	;
ArraySaniEndDate[130] = 20651012	;
ArraySaniEndDate[131] = 20660702	;
ArraySaniEndDate[132] = 20950818	;
ArraySaniEndDate[133] = 21230308	;
ArraySaniEndDate[134] = 21240929	;
ArraySaniEndDate[135] = 21250619	;
ArraySaniEndDate[136] = 18600221	;
ArraySaniEndDate[137] = 18611203	;
ArraySaniEndDate[138] = 18620817	;
ArraySaniEndDate[139] = 18910928	;
ArraySaniEndDate[140] = 19190314	;
ArraySaniEndDate[141] = 19201116	;
ArraySaniEndDate[142] = 19210808	;
ArraySaniEndDate[143] = 19500919	;
ArraySaniEndDate[144] = 19791103	;
ArraySaniEndDate[145] = 19800726	;
ArraySaniEndDate[146] = 20070110	;
ArraySaniEndDate[147] = 20090909	;
ArraySaniEndDate[148] = 20381022	;
ArraySaniEndDate[149] = 20390712	;
ArraySaniEndDate[150] = 20660203	;
ArraySaniEndDate[151] = 20680829	;
ArraySaniEndDate[152] = 20971011	;
ArraySaniEndDate[153] = 20980619	;
ArraySaniEndDate[154] = 21250225	;
ArraySaniEndDate[155] = 21261207	;
ArraySaniEndDate[156] = 21270821	;
ArraySaniEndDate[157] = 18620131	;
ArraySaniEndDate[158] = 18641021	;
ArraySaniEndDate[159] = 18931206	;
ArraySaniEndDate[160] = 18940901	;
ArraySaniEndDate[161] = 19210223	;
ArraySaniEndDate[162] = 19231015	;
ArraySaniEndDate[163] = 19521125	;
ArraySaniEndDate[164] = 19530820	;
ArraySaniEndDate[165] = 19800314	;
ArraySaniEndDate[166] = 19821005	;
ArraySaniEndDate[167] = 20111114	;
ArraySaniEndDate[168] = 20120803	;
ArraySaniEndDate[169] = 20390405	;
ArraySaniEndDate[170] = 20410127	;
ArraySaniEndDate[171] = 20410925	;
ArraySaniEndDate[172] = 20701104	;
ArraySaniEndDate[173] = 20980502	;
ArraySaniEndDate[174] = 20991225	;
ArraySaniEndDate[175] = 21000916	;
ArraySaniEndDate[176] = 21270204	;
ArraySaniEndDate[177] = 21291026	;
ArraySaniEndDate[178] = 18670111	;
ArraySaniEndDate[179] = 18671008	;
ArraySaniEndDate[180] = 18940404	;
ArraySaniEndDate[181] = 18961118	;
ArraySaniEndDate[182] = 19251231	;
ArraySaniEndDate[183] = 19260929	;
ArraySaniEndDate[184] = 19530423	;
ArraySaniEndDate[185] = 19551111	;
ArraySaniEndDate[186] = 19841220	;
ArraySaniEndDate[187] = 19850916	;
ArraySaniEndDate[188] = 20120515	;
ArraySaniEndDate[189] = 20141102	;
ArraySaniEndDate[190] = 20410205	;
ArraySaniEndDate[191] = 20431211	;
ArraySaniEndDate[192] = 20440829	;
ArraySaniEndDate[193] = 20730205	;
ArraySaniEndDate[194] = 20731023	;
ArraySaniEndDate[195] = 21000317	;
ArraySaniEndDate[196] = 21021202	;
ArraySaniEndDate[197] = 21320118	;
ArraySaniEndDate[198] = 21321013	;
ArraySaniEndDate[199] = 18670425	;
ArraySaniEndDate[200] = 18700101	;
ArraySaniEndDate[201] = 18700908	;
ArraySaniEndDate[202] = 18990222	;
ArraySaniEndDate[203] = 18991116	;
ArraySaniEndDate[204] = 19260513	;
ArraySaniEndDate[205] = 19281224	;
ArraySaniEndDate[206] = 19580207	;
ArraySaniEndDate[207] = 19581107	;
ArraySaniEndDate[208] = 19850531	;
ArraySaniEndDate[209] = 19871216	;
ArraySaniEndDate[210] = 20170126	;
ArraySaniEndDate[211] = 20171026	;
ArraySaniEndDate[212] = 20440622	;
ArraySaniEndDate[213] = 20461207	;
ArraySaniEndDate[214] = 20730330	;
ArraySaniEndDate[215] = 20760116	;
ArraySaniEndDate[216] = 20761011	;
ArraySaniEndDate[217] = 21051129	;
ArraySaniEndDate[218] = 21320425	;
ArraySaniEndDate[219] = 21350107	;
ArraySaniEndDate[220] = 21350921	;
ArraySaniEndDate[221] = 18700813	;
ArraySaniEndDate[222] = 18721231	;
ArraySaniEndDate[223] = 18990512	;
ArraySaniEndDate[224] = 19020211	;
ArraySaniEndDate[225] = 19021105	;
ArraySaniEndDate[226] = 19310411	;
ArraySaniEndDate[227] = 19311224	;
ArraySaniEndDate[228] = 19580601	;
ArraySaniEndDate[229] = 19610201	;
ArraySaniEndDate[230] = 19611007	;
ArraySaniEndDate[231] = 19900320	;
ArraySaniEndDate[232] = 19901214	;
ArraySaniEndDate[233] = 20170620	;
ArraySaniEndDate[234] = 20200123	;
ArraySaniEndDate[235] = 20490306	;
ArraySaniEndDate[236] = 20491203	;
ArraySaniEndDate[237] = 20760710	;
ArraySaniEndDate[238] = 20790114	;
ArraySaniEndDate[239] = 21080224	;
ArraySaniEndDate[240] = 21081122	;
ArraySaniEndDate[241] = 21350807	;
ArraySaniEndDate[242] = 21380106	;

	int[] ArraySaniStartDate2 = new int[243];
	int[] ArraySaniEndDate2 = new int[243];
	
		ArraySaniStartDate2[0] = 0;
		ArraySaniEndDate2[0] = 0;
		for(int i = 1;i<=242;i++)
		{
			ArraySaniStartDate2[i] = ArraySaniStartDate[i];
			ArraySaniEndDate2[i] = ArraySaniEndDate[i];
		}
	
	
		int[] temp1 = ShortArraySani(ArraySaniStartDate2);
		int[] temp2 = ShortArraySani(ArraySaniEndDate2);
		int[] ArrayRashi2 = new int[243];
		ArrayRashi2[0] = 0;
		for(int i = 1;i<=242;i++)
		{
			for(int j = 1;j<=242;j++)
			{
				if(ArraySaniStartDate2[i] == ArraySaniStartDate[j])
				{
					ArrayRashi2[i] = ArrayRashi[j];
				}
			}
		}
	
		int TempraryLagnaChartRashiPosition1 = ArrayLagnaChartRashiPositions[2];
		int TempraryLagnaChartRashiPosition2 = ArrayLagnaChartRashiPositions[2];
		
		int TempRashiPositionForSmallPanoti1 = ArrayLagnaChartRashiPositions[2] + 7;
		int TempRashiPositionForSmallPanoti2 = ArrayLagnaChartRashiPositions[2] + 3;
		
	if(ArrayLagnaChartRashiPositions[2] == 1)
	{
		TempraryLagnaChartRashiPosition1 = 13;
	}
	if(ArrayLagnaChartRashiPositions[2] == 12)
	{
		TempraryLagnaChartRashiPosition2 = 0;
	}
	
	if(TempRashiPositionForSmallPanoti1 > 12)
	{
		TempRashiPositionForSmallPanoti1 = TempRashiPositionForSmallPanoti1 - 12;
	}
	if(TempRashiPositionForSmallPanoti2 > 12)
	{
		TempRashiPositionForSmallPanoti2 = TempRashiPositionForSmallPanoti2 - 12;
	}
	
	int Tempvariable2 = -1;
	int Tempvariable3 = -1;
	int Tempvariable4 = -1;
	int TempDate = 0;
	String[] SadeSatiRashi = new String[242];
	String[] SadeSatiRiseAndSet = new String[242];
	int[] SadeSatiStartDate = new int[242];
	int[] SadeSatiEndDate = new int[242];
	SadeSatiRashi[0] = "";
	SadeSatiRiseAndSet[0] = "";
	SadeSatiStartDate[0] = 0;
	SadeSatiEndDate[0] = 0;
	
	String[] CombinedPanotiSadeSatiRashi = new String[242];
	int[] CombinedPanotiSadeSatiStartDate = new int[242];
	int[] CombinedPanotiSadeSatiEndDate = new int[242];
	String[] CombinedPanotiAndSadeSati = new String[242];
	CombinedPanotiSadeSatiRashi[0] = "";
	CombinedPanotiAndSadeSati[0] = "";
	CombinedPanotiSadeSatiStartDate[0] = 0;
	CombinedPanotiSadeSatiEndDate[0] = 0;
	
	String[] SmallPanotiRashi = new String[242];
	int[] SmallPanotiStartDate = new int[242];
	int[] SmallPanotiEndDate = new int[242];
	SmallPanotiRashi[0] = "";
	SmallPanotiStartDate[0] = 0;
	SmallPanotiEndDate[0] = 0;
	
	Calendar cal = Calendar.getInstance();
	cal.set(Calendar.DATE, myAstrologyObjectSS.getDayOfBirth());
	cal.set(Calendar.MONTH, myAstrologyObjectSS.getMonthOfBirth()-1);
	cal.set(Calendar.YEAR, myAstrologyObjectSS.getYearOfBirth());
	SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
	TempDate = Integer.valueOf(sdf.format(cal.getTime()));
	
	for(int i = 1;i<=242;i++)
	{
		int TempStartDate = ArraySaniStartDate2[i];
		int TempEndDate = ArraySaniEndDate2[i];
		if( TempDate >= TempStartDate && TempDate <= TempEndDate)
		{
			for(int j = i;j<=242;j++)
			{
				if((ArrayRashi2[j] ==  ArrayLagnaChartRashiPositions[2]) || (ArrayRashi2[j] ==  TempraryLagnaChartRashiPosition1 - 1) || (ArrayRashi2[j] ==  TempraryLagnaChartRashiPosition2 + 1) )
				{
					Tempvariable2 = Tempvariable2 + 1;
					SadeSatiRashi[Tempvariable2] = Common.engRashiNames[ArrayRashi2[j]-1];
					SadeSatiStartDate[Tempvariable2] = ArraySaniStartDate2[j];
					SadeSatiEndDate[Tempvariable2] = ArraySaniEndDate2[j];
					
					Tempvariable4 = Tempvariable4 + 1;
					CombinedPanotiSadeSatiRashi[Tempvariable4] = Common.engRashiNames[ArrayRashi2[j]-1];
					CombinedPanotiSadeSatiStartDate[Tempvariable4] = ArraySaniStartDate2[j];
					CombinedPanotiSadeSatiEndDate[Tempvariable4] = ArraySaniEndDate2[j];
					CombinedPanotiAndSadeSati[Tempvariable4] = sadeSatiConstants.getString("SADESATI");
				
					//'********This Code Is For Chadati SadeSati And Utarati SadeSati)
					if(ArrayRashi2[j] ==  ArrayLagnaChartRashiPositions[2])
					{
						SadeSatiRiseAndSet[Tempvariable4] = "Peak";
					} 
					else if(ArrayRashi2[j] ==  TempraryLagnaChartRashiPosition1 - 1)
					{
						SadeSatiRiseAndSet[Tempvariable4] = "Rising";
					}
					else if(ArrayRashi2[j] ==  TempraryLagnaChartRashiPosition2 + 1)
					{
						SadeSatiRiseAndSet[Tempvariable4] = "Setting";
					}
				}
				if( ArrayRashi2[j] == TempRashiPositionForSmallPanoti1 || ArrayRashi2[j] == TempRashiPositionForSmallPanoti2)
				{
					Tempvariable3 = Tempvariable3 + 1;
					//System.out.println(ArrayRashi2[j]);
					SmallPanotiRashi[Tempvariable3] = Common.engRashiNames[ArrayRashi2[j]-1];
					SmallPanotiStartDate[Tempvariable3] = ArraySaniStartDate2[j];
					SmallPanotiEndDate[Tempvariable3] = ArraySaniEndDate2[j];
					
					Tempvariable4 = Tempvariable4 + 1;
					//System.out.println(Tempvariable4+",");
					CombinedPanotiSadeSatiRashi[Tempvariable4] = Common.engRashiNames[ArrayRashi2[j]-1];
					CombinedPanotiSadeSatiStartDate[Tempvariable4] = ArraySaniStartDate2[j];
					CombinedPanotiSadeSatiEndDate[Tempvariable4] = ArraySaniEndDate2[j];
					CombinedPanotiAndSadeSati[Tempvariable4] = sadeSatiConstants.getString("SMALL_PANOTI");
					
					
				} 
			}	
		}
	}
	String[] NewCombPanotiSadeSatiEndDate = new String[243];
	for(int i = 0;i<Tempvariable4;i++)
	{
		//CombinedPanotiSadeSatiStartDate[i] =Dateserial(Left(CombinedPanotiSadeSatiStartDate(i),4),Right(Left(CombinedPanotiSadeSatiStartDate(i),6),2),Right(CombinedPanotiSadeSatiStartDate(i),2));
		//CombinedPanotiSadeSatiEndDate(i) = Dateserial(Left(CombinedPanotiSadeSatiEndDate(i),4),Right(Left(CombinedPanotiSadeSatiEndDate(i),6),2),Right(CombinedPanotiSadeSatiEndDate(i),2))
		//String NewComb = String.valueOf(CombinedPanotiSadeSatiEndDate[i]);
		//NewCombPanotiSadeSatiEndDate[i] =NewComb.substring(0,4)+"/"+NewComb.substring(4,6)+"/"+NewComb.substring(6,8);//Dateserial(Left(CombinedPanotiSadeSatiEndDate(i),4),Right(Left(CombinedPanotiSadeSatiEndDate(i),6),2),Right(CombinedPanotiSadeSatiEndDate(i),2));
		//Date NewCombPanoti = dateConversion(TempDate1 , 365*120);
		//out.println(CombinedPanotiSadeSatiEndDate[i]+","+NewCombPanotiSadeSatiEndDate[i]+"<br/>");
	}
%>
<%!
public int[] ShortArraySani(int[] ArraySaniStartDateOrEndDate)
{
	int temp = 0;
	for(int i = 1;i<=242;i++)
	{
		for(int j = i+1;j<=242;j++)
		{
			if(ArraySaniStartDateOrEndDate[i] > ArraySaniStartDateOrEndDate[j])
			{
				temp = ArraySaniStartDateOrEndDate[i];
				ArraySaniStartDateOrEndDate[i] = ArraySaniStartDateOrEndDate[j];
				ArraySaniStartDateOrEndDate[j] = temp;
			} 
		}
	}
	return ArraySaniStartDateOrEndDate;
}
%>
<div align="center" class="heading-sec">
    <h2>
        <%=sadeSatiConstants.getString("SADESATI_REPORT")%>
    </h2>
</div>
<div class="inner-sec">
<table class="table table-bordered table-striped">
    <tr>
        <td>
            <b>
                <%=baseConstantsSS.getString("NAM")%></b>
        </td>
        <td>
            <%=myAstrologyObjectSS.getName()%>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <b>
                <%=baseConstantsSS.getString("BIRTH")%>&nbsp;
                <%=baseConstantsSS.getString("DATAM") %></b>
        </td>
        <td>
            <%out.println(myAstrologyObjectSS.getDayOfBirth() + " : " + myAstrologyObjectSS.getMonthOfBirth() +" : "+	myAstrologyObjectSS.getYearOfBirth());%>
        </td>
        <td>
            <b>
                <%=baseConstantsSS.getString("BIRTH")%>&nbsp;
                <%=baseConstantsSS.getString("TIMAR")%></b>
        </td>
        <td>
            <%=myAstrologyObjectSS.getHourOfBirth() + " : " + myAstrologyObjectSS.getMinuteOfBirth() +" : "+  myAstrologyObjectSS.getSecondOfBirth()%>
        </td>
    </tr>
    <tr>
        <td>
            <b>
                <%=baseConstantsSS.getString("PLACE_OF_BIRTH")%></b>
        </td>
        <td>
            <%=myAstrologyObjectSS.getPlace()%>
        </td>
        <td>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td>
            <b>
                <%=baseConstantsSS.getString("GENDR")%></b>
        </td>
        <td>
            <%=baseConstantsSS.getString(myAstrologyObjectSS.getMaleFemale().toUpperCase())%>
        </td>
        <td>
            <b>
                <%=baseConstantsSS.getString("TITHI")%></b>
        </td>
        <td>
            <%=hindiSS.unicode(myAstrologyObjectSS.getTithiName(), languageCodeSS)%>
        </td>
    </tr>
    <tr>
        <td>
            <b>
                <%=baseConstantsSS.getString("RASHI")%></b>
        </td>
        <td>
            <%=hindiSS.unicode(myAstrologyObjectSS.getRasiName(), languageCodeSS)%>
        </td>
        <td>
            <b>
                <%=baseConstantsSS.getString("NAKSHATRA") %></b>
        </td>
        <td>
            <%=hindiSS.unicode(myAstrologyObjectSS.getNakshatraName(), languageCodeSS)%>
        </td>
    </tr>
</table>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>
                    <%=baseConstantsSS.getString("S_N")%>
                </th>
                <th>
                    <%=sadeSatiConstants.getString("SADESATI") %>/
                    <%=sadeSatiConstants.getString("PANOTI")%>
                </th>
                <th>
                    <%=sadeSatiConstants.getString("SHANI")%><br />
                    <%=baseConstantsSS.getString("RASHI")%>
                </th>
                <th>
                    <%=sadeSatiConstants.getString("START")%>
                </th>
                <th>
                    <%=sadeSatiConstants.getString("END_DATE") %>
                </th>
                <th>
                    <%=sadeSatiConstants.getString("PHASE")%>
                </th>
            </tr>
        </thead>
        <tbody>
            <%
	//TempDate = Integer.valueOf((myAstrologyObject.getYearOfBirth()+120)+""+myAstrologyObject.getMonthOfBirth()+""+myAstrologyObject.getDayOfBirth());
   String TempDate1 = myAstrologyObjectSS.getMonthOfBirth()+"/"+myAstrologyObjectSS.getDayOfBirth()+"/"+myAstrologyObjectSS.getYearOfBirth();
   
    /*Conver date into dateformat*/
    Date TempDateChk = dateConversion(TempDate1 , 365*120);
   // out.println(Tempvariable4);
	for(int i = 0;i<=Tempvariable4;i++)
	{
		String NewComb = String.valueOf(CombinedPanotiSadeSatiEndDate[i]);
		//out.println(CombinedPanotiSadeSatiEndDate[i]);
		NewCombPanotiSadeSatiEndDate[i] = NewComb.substring(4,6)+"/"+NewComb.substring(6,8)+"/"+NewComb.substring(0,4);//NewComb.substring(0,4)+"/"+NewComb.substring(4,6)+"/"+NewComb.substring(6,8);//Dateserial(Left(CombinedPanotiSadeSatiEndDate(i),4),Right(Left(CombinedPanotiSadeSatiEndDate(i),6),2),Right(CombinedPanotiSadeSatiEndDate(i),2));
		Date NewCombPanoti = dateConversion(NewCombPanotiSadeSatiEndDate[i] ,0);
		//System.out.println(NewCombPanoti+","+TempDateChk);
		//out.println(NewCombPanoti.compareTo(TempDateChk)<0);
		//if(CombinedPanotiSadeSatiEndDate[i] <= ((TempDate + 365) * 120)) 
			if(NewCombPanoti.compareTo(TempDateChk)==0 || NewCombPanoti.compareTo(TempDateChk)<0) 
		{ 
			//out.println(i);
		%>
            <tr>
                <td>
                    <%=i+1%>
                </td>
                <td>
                    <%=CombinedPanotiAndSadeSati[i]%>
                </td>
                <td>
                    <%=baseConstantsSS.getString(CombinedPanotiSadeSatiRashi[i].toUpperCase())%>
                </td>
                <td>
                    <%
    String tempDtString = CombinedPanotiSadeSatiStartDate[i]+"";
    int date = Integer.valueOf(tempDtString.substring(6));
    int month = Integer.valueOf(tempDtString.substring(4,6));
    int year = Integer.valueOf(tempDtString.substring(0,4));
    cal.set(Calendar.DATE, date);
    cal.set(Calendar.MONTH, month-1);
    cal.set(Calendar.YEAR, year);
    sdf = new SimpleDateFormat("MMMM dd, YYYY");
    String formattedDate = sdf.format(cal.getTime());
    String[] arrPrintStartDate = formattedDate.split(" ");
   //out.println(arrPrintStartDate);

	out.println(baseConstantsSS.getString(arrPrintStartDate[0].toUpperCase())+" "+arrPrintStartDate[1]+arrPrintStartDate[2]);
%>
                </td>
                <td>
                    <%
    tempDtString = CombinedPanotiSadeSatiEndDate[i]+"";
    date = Integer.valueOf(tempDtString.substring(6));
    month = Integer.valueOf(tempDtString.substring(4,6));
    year = Integer.valueOf(tempDtString.substring(0,4));
    cal.set(Calendar.DATE, date);
    cal.set(Calendar.MONTH, month-1);
    cal.set(Calendar.YEAR, year);
    formattedDate = sdf.format(cal.getTime());
    String[] arrPrintEndDate = formattedDate.split(" ");

    out.println(baseConstantsSS.getString(arrPrintEndDate[0].toUpperCase())+" "+arrPrintEndDate[1]+arrPrintEndDate[2]);
	%>
                </td>
                <td>
                    <% if(SadeSatiRiseAndSet[i] != null && SadeSatiRiseAndSet[i] != "")
            out.println(sadeSatiConstants.getString(SadeSatiRiseAndSet[i].toUpperCase()));
       else
            out.println(SadeSatiRiseAndSet[i]==null?"":SadeSatiRiseAndSet[i]);
    %>
                </td>
            </tr>
            <% } } 
  %>
        </tbody>
    </table>
    <h3>
        <%=sadeSatiConstants.getString("SHANI") %>&nbsp;<%=sadeSatiConstants.getString("SADESATI") %>
        :
        <%=sadeSatiConstants.getString("RISING")%>&nbsp;<%=sadeSatiConstants.getString("PHASE") %>
    </h3>
    <p>
        <%=sadeSatiConstants.getString("SADESATIRISINGPHASE")%></p>
    <h3>
        <%=sadeSatiConstants.getString("SHANI") %>&nbsp;<%=sadeSatiConstants.getString("SADESATI") %>:
        <%=sadeSatiConstants.getString("PEAK")%>
        &nbsp;<%=sadeSatiConstants.getString("PHASE") %></h3>
    <p>
        <%=sadeSatiConstants.getString("SADESATIPEAKPHASE")%></p>
    <h3>
        <%=sadeSatiConstants.getString("SHANI") %>&nbsp;<%=sadeSatiConstants.getString("SADESATI") %>:
        <%=sadeSatiConstants.getString("SETTING")%>
        &nbsp;<%=sadeSatiConstants.getString("PHASE") %></h3>
    <p>
        <%=sadeSatiConstants.getString("SADESATISETTINGPHASE")%></p>
    <p>
        <b>
            <%=baseConstantsSS.getString("NOTE") %>:</b><%=sadeSatiConstants.getString("IMPNOTE")%></p>
</div>
<%!
public Date dateConversion(String myString , int numOfDaysAdd){
	String dk="";
    SimpleDateFormat sdfk = new SimpleDateFormat("MM/dd/yyyy"); 
    Calendar c = Calendar.getInstance();
    try {
        c.setTime(sdfk.parse(myString));
    } catch (ParseException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    } 
    c.add(Calendar.DAY_OF_MONTH, numOfDaysAdd);  // number of days to add
    dk = sdfk.format(c.getTime());
    
    
    return convertStringToDate(dk);
}

public Date convertStringToDate(String dateString)
{
	Date date = null;
    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
    Date startDate = null;
    String newDateString = "";
    try {
        startDate = formatter.parse(dateString);
        newDateString = formatter.format(startDate);
       // System.out.println(newDateString);
    } catch (ParseException e) {
        e.printStackTrace();
    }
    return startDate;
}
%>
