<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%
	Local local = new Local();
	Hindi hindi = new Hindi();
	int languageCode = (Integer)session.getAttribute("languageCode");
	MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
	MyResourceBundle rBShodasWestern = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday", languageCode);
	MyResourceBundle rBShodashVargaTable = local.loadPropertiesFileNew("shodashvargatable", languageCode);
	
	DesktopHoro objShodasVarga = (DesktopHoro)session.getAttribute("HoroscopeObj");
	
	int[] arrayLagnaChartRashiPositions = new int[13];
	int[] arrayBhavPosition = new int[12];
	String[] arrayShodashVarga = new String[17];
	arrayShodashVarga[1] = "LAGNA";
	arrayShodashVarga[2] = "HORA";
	arrayShodashVarga[3] = "DREKKANA";
	arrayShodashVarga[4] = "CHATURTHAMSHA";
	arrayShodashVarga[5] = "SAPTAMAMSHA";
	arrayShodashVarga[6] = "NAVAMSHA";
	arrayShodashVarga[7] = "DASHAMAMSHA";
	arrayShodashVarga[8] = "DWADASHAMAMSHA";
	arrayShodashVarga[9] = "SHODASHAMSHA";
	arrayShodashVarga[10] = "VIMSHAMSHA";
	arrayShodashVarga[11] = "CHATURVIMSHAMSHA";
	arrayShodashVarga[12] = "SAPTAVIMSHAMSHA";
	arrayShodashVarga[13] = "TRIMSHAMSHA";
	arrayShodashVarga[14] = "KHAVEDAMSHA";
	arrayShodashVarga[15] = "AKSHVEDAMSHA";
	arrayShodashVarga[16] = "SHASHTIAMSHA";	
	
%>
<link rel='stylesheet' type='text/css' href='styles.css'>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("SHODASHVARGA_TABLE")%></h1>	
</div>


<div class="row mrt-30"> 
<div class="col s12 l12">
<div class="card table-panel">


<table class="highlight striped bordered ui-table-reflow ui-table responsive-table">
<thead>
	<TR class="amber lighten-5">
		<TH class="cellhead"><%=rBConstants.getString("SERIAL_NUMBER")%></TH>
		<TH class="cellhead"><%=rBConstants.getString("SHODASHVARGA")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("LA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("SU_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("MO_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("MA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("ME_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("JU_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("VE_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("SA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("RA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("KE_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("UR_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("NE_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("PL_SHORT")%></TH>
	</TR>
	</thead>

	<%
    int tempCount=0,tempCount1=0,tempCount2=0;
    for(tempCount=0;tempCount<=15;tempCount++){ 
    %>
	<TR>
		<TD class="cellcontent">
			<%
	    	tempCount2 = tempCount+1;
	    	out.println(tempCount2);%>
		</TD>
		<TD class="cellcontent">
			<%out.println(rBConstants.getString(arrayShodashVarga[tempCount+1]));%>
		</TD>
		<%    
		    arrayLagnaChartRashiPositions = objShodasVarga.getPositionForShodasvarg(tempCount);
		    for(tempCount1=0;tempCount1<=12;tempCount1++){ 
		    %>
		<TD class="cellcontent">
			<% out.println(arrayLagnaChartRashiPositions[tempCount1]); %>
		</TD>
		<% } %>
	</TR>
	<% } %>

</TABLE>

</div>
</div>
</div>



<div class="mrt-30"></div>


<div class="hdg-lg card">
	<h1><%=rBShodashVargaTable.getString("SHODASHVARGA_BHAV_TABLE")%></h1>	
</div>


<div class="row mrt-30"> 
<div class="col s12 l12">
<div class="card table-panel">




<table class="highlight striped bordered ui-table-reflow ui-table responsive-table">
<thead>
	<TR class="amber lighten-5">
		<TH class="cellhead"><%=rBConstants.getString("SERIAL_NUMBER")%></TH>
		<TH class="cellhead"><%=rBConstants.getString("SHODASHVARGA")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("LA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("SU_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("MO_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("MA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("ME_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("JU_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("VE_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("SA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("RA_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("KE_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("UR_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("NE_SHORT")%></TH>
		<TH class="cellhead"><%=rBShodashVargaTable.getString("PL_SHORT")%></TH>
	</TR>
	</thead>
	<% for(tempCount=0;tempCount<=15;tempCount++){ %>
	<TR>
		<% tempCount2 = tempCount+1;%>
		<TD class="cellcontent">
			<%out.println(tempCount2);%>
		</TD>
		<TD class="cellcontent">
			<%out.println(rBConstants.getString(arrayShodashVarga[tempCount+1]));%>
		</TD>
		<TD class="cellcontent">1</TD>
		<%
	    arrayLagnaChartRashiPositions = objShodasVarga.getPositionForShodasvarg(tempCount);
	    arrayBhavPosition = rashiToBhavConversion(arrayLagnaChartRashiPositions);
	    for(tempCount1=0;tempCount1<=11;tempCount1++){%>
		<TD class="cellcontent">
			<% if(arrayBhavPosition[tempCount1]==6 || arrayBhavPosition[tempCount1]==8 || arrayBhavPosition[tempCount1]==12){ %>
			<Font color="red"> <% out.println(arrayBhavPosition[tempCount1]);%>
		</Font> <% }
		    	else{
						out.println(arrayBhavPosition[tempCount1]);
	    		} 
	          %>
		</TD>
		<% } %>
	</TR>
	<%} %>
</TABLE>
</div>
</div>
</div>

<p>
	<%@include file='calculations-footer.jsp'%>
</p>

<%!
  
//This code is written to convert rashi to bhav

//In This Function We Will Pass One Array And This Function Return One Array from
//  0th Position To 11 th Position
public int[] rashiToBhavConversion(int[] rashiPosition){

	int[] bhavPosition = new int[12];
	int i=0;
	for(i=0;i<=11;i++){
		bhavPosition[i] = rashiPosition[i+1];
  	}
	for(i=0;i<=11;i++){
		bhavPosition[i] = bhavPosition[i]- rashiPosition[0];
  		if(bhavPosition[i]<0){
  			bhavPosition[i] = bhavPosition[i] + 12;
  		}
 		bhavPosition[i] = bhavPosition[i]+1;
	}
	return(bhavPosition);
  }
%>