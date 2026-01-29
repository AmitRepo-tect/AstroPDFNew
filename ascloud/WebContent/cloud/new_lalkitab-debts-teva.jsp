<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.*"%>

<%
Local local = new Local();
int languageCode = (Integer)session.getAttribute("languageCode");

MyProperties rBConstants = (MyProperties) session.getAttribute("constants");

MyResourceBundle rBLalkitabTeva = local.loadPropertiesFileNew("lalkitabdebtsteva",languageCode);
MyResourceBundle rBLalkitabtevaDebts = local.loadPropertiesFileNew("lalkitabteva-lalkitabdebtsteva",languageCode);


String[] cause = new String[10];
String[] reason = new String[10];
String[] remedy =  new String[10];
String[] rinResult =  new String[10];
String[] indication = new String[10];

//-------------------------------------------------------------------------
SharedFunction sf = new SharedFunction();
DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
LalKitab objLalKitab = sf.getLalKitab(myAstrologyObject);
%>
<div class="hdg-lg card">
	<h1><%if(Integer.parseInt(session.getAttribute("languageCode").toString())==2 || Integer.parseInt(session.getAttribute("languageCode").toString())==8) { %>
					<%=rBLalkitabTeva.getString("LK_Rin_TEXT") %>
					
					<%}else {%>
					<%=rBLalkitabTeva.getString("LK_Rin_TEXT") %>
					<%}%></h1>	
</div>

<%

String[] rin = local.getStringArray(rBLalkitabTeva.getString("RINS"));

//Rin Array for Causes, Reasons, Remedy, Rin Result
cause[0]       = rBLalkitabTeva.getString("LK_FOREFATHER_DEBTS_SYMPTOM");
reason[0]      = rBLalkitabTeva.getString("LK_FOREFATHER_DEBTS_REASON");
indication[0]  = rBLalkitabTeva.getString("LK_FOREFATHER_DEBTS_INDICATION");
remedy[0]      = rBLalkitabTeva.getString("LK_FOREFATHER_DEBTS_REMEDY");
if(objLalKitab.isOfFatherDebt()== false) {
    rinResult[0] = rBLalkitabTeva.getString("FATHER_DEBTS_FALSE");
}else{
    rinResult[0] = rBLalkitabTeva.getString("FATHER_DEBTS_TRUE");
}

//Self Debts
cause[1]       = rBLalkitabTeva.getString("LK_SELF_DEBTS_SYMPTOM");
reason[1]      = rBLalkitabTeva.getString("LK_SELF_DEBTS_REASON");
indication[1]  = rBLalkitabTeva.getString("LK_SELF_DEBTS_INDICATION");
remedy[1]      = rBLalkitabTeva.getString("LK_SELF_DEBTS_REMEDY");

if(objLalKitab.isOfOwnDebt()== false) {
    rinResult[1] = rBLalkitabTeva.getString("SELF_DEBTS_FALSE");
}else{
    rinResult[1] = rBLalkitabTeva.getString("SELF_DEBTS_TRUE");
}

//MOTHER DEBTS
cause[2]       = rBLalkitabTeva.getString("LK_MOTHER_DEBTS_SYMPTOM");
reason[2]      = rBLalkitabTeva.getString("LK_MOTHER_DEBTS_REASON");
indication[2]  = rBLalkitabTeva.getString("LK_MOTHER_DEBTS_INDICATION");
remedy[2]      = rBLalkitabTeva.getString("LK_MOTHER_DEBTS_REMEDY");

if(objLalKitab.isOfMothresDebt()== false) {
    rinResult[2] = rBLalkitabTeva.getString("MOTHER_DEBTS_FALSE");
}else{
    rinResult[2] = rBLalkitabTeva.getString("MOTHER_DEBTS_TRUE");
}

//Woman DEBTS
cause[3]       = rBLalkitabTeva.getString("LK_WOMAN_DEBTS_SYMPTOM");
reason[3]      = rBLalkitabTeva.getString("LK_WOMAN_DEBTS_REASON");
indication[3]  = rBLalkitabTeva.getString("LK_WOMAN_DEBTS_INDICATION");
remedy[3]      = rBLalkitabTeva.getString("LK_WOMAN_DEBTS_REMEDY");

if(objLalKitab.isOfWifesDebt()== false) {
    rinResult[3] = rBLalkitabTeva.getString("WOMAN_DEBTS_FALSE");
}else{
    rinResult[3] = rBLalkitabTeva.getString("WOMAN_DEBTS_TRUE");
}

//Relative's Debt
cause[4]       = rBLalkitabTeva.getString("LK_RELATIVES_DEBTS_SYMPTOM");
reason[4]      = rBLalkitabTeva.getString("LK_RELATIVES_DEBTS_REASON");
indication[4]  = rBLalkitabTeva.getString("LK_RELATIVES_DEBTS_INDICATION");
remedy[4]      = rBLalkitabTeva.getString("LK_RELATIVES_DEBTS_REMEDY");

if(objLalKitab.isOfRelativesDebt()== false) {
    rinResult[4] = rBLalkitabTeva.getString("RELATIVES_DEBTS_FALSE");
}else{
    rinResult[4] = rBLalkitabTeva.getString("RELATIVES_DEBTS_TRUE");
}

//Daughter's Debt
cause[5]       = rBLalkitabTeva.getString("LK_DAUGHTER_DEBTS_SYMPTOM");
reason[5]      = rBLalkitabTeva.getString("LK_DAUGHTER_DEBTS_REASON");
indication[5]  = rBLalkitabTeva.getString("LK_DAUGHTER_DEBTS_INDICATION");
remedy[5]      = rBLalkitabTeva.getString("LK_DAUGHTER_DEBTS_REMEDY");

if(objLalKitab.isOfDaughterSisterDebt()== false) {
    rinResult[5] = rBLalkitabTeva.getString("DAUGHTER_DEBTS_FALSE");
}else{
    rinResult[5] = rBLalkitabTeva.getString("DAUGHTER_DEBTS_TRUE");
}

//Oppressor Debt
cause[6]       = rBLalkitabTeva.getString("LK_OPPRESSOR_DEBTS_SYMPTOM");
reason[6]      = rBLalkitabTeva.getString("LK_OPPRESSOR_DEBTS_REASON");
indication[6]  = rBLalkitabTeva.getString("LK_OPPRESSOR_DEBTS_INDICATION");
remedy[6]      = rBLalkitabTeva.getString("LK_OPPRESSOR_DEBTS_REMEDY");

if(objLalKitab.isOfJalimanaDebt()== false) {
    rinResult[6] = rBLalkitabTeva.getString("OPPRESSOR_DEBTS_FALSE");
}else{
    rinResult[6] = rBLalkitabTeva.getString("OPPRESSOR_DEBTS_TRUE");
}

//UNBORN_DEBTS
cause[7]       = rBLalkitabTeva.getString("LK_UNBORN_DEBTS_SYMPTOM");
reason[7]      = rBLalkitabTeva.getString("LK_UNBORN_DEBTS_REASON");
indication[7]  = rBLalkitabTeva.getString("LK_UNBORN_DEBTS_INDICATION");
remedy[7]      = rBLalkitabTeva.getString("LK_UNBORN_DEBTS_REMEDY");

if(objLalKitab.isOfPaidaHiNaHuaDebt()== false) {
    rinResult[7] = rBLalkitabTeva.getString("UNBORN_DEBTS_FALSE");
}else{
    rinResult[7] = rBLalkitabTeva.getString("UNBORN_DEBTS_TRUE");
}

//NATURE_DEBTS
cause[8]       = rBLalkitabTeva.getString("LK_NATURE_DEBTS_SYMPTOM");
reason[8]      = rBLalkitabTeva.getString("LK_NATURE_DEBTS_REASON");
indication[8]  = rBLalkitabTeva.getString("LK_NATURE_DEBTS_INDICATION");
remedy[8]      = rBLalkitabTeva.getString("LK_NATURE_DEBTS_REMEDY");

if(objLalKitab.isOfNaturalDebt()== false) {
    rinResult[8] = rBLalkitabTeva.getString("NATURE_DEBTS_FALSE");
}else{
    rinResult[8] = rBLalkitabTeva.getString("NATURE_DEBTS_TRUE");
}

%>

<div class="row mrt-30 mrb-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content">

<%--
<h2>
	<%=rBLalkitabTeva.getString("ANCESTRAL_DEBTS")%>
</h2>
--%>

	<p><%=rBLalkitabTeva.getString("RinIntroduction")%></p>


<% for(int i=0 ; i<=8 ; i++){%>
<h2>
	<% out.println(rin[i]);%>
</h2>

	
		<p><b><%=rBLalkitabtevaDebts.getString("LK_CAUSE")%> : </b><%=cause[i] %></p>
		<p><b><%=rBLalkitabTeva.getString("LK_REASON")%>: </b><%=reason[i] %><br /></p>
		<p><b><%=rBLalkitabTeva.getString("LK_INDICATION")%>: </b><%=indication[i] %></p>
		<p><b><%=rBLalkitabTeva.getString("LK_REMEDY")%>: </b><%=remedy[i] %><br /></p>
		<p><b><%=rBLalkitabtevaDebts.getString("LK_RESULT") %>: </b><%=rinResult[i] %></p>
	

<%}%>

</div>
</div>
</div>
