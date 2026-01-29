<%@page import="com.cslsoftware.yoginidasa.YoginiDasa"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    DesktopHoro myAstrologyObject= (DesktopHoro) session.getAttribute("HoroscopeObj");
    int languageCode = (Integer)session.getAttribute("languageCode");
    Hindi hindi = new Hindi();
    Local local = new Local();
    
    MyProperties rbConstants = (MyProperties) session.getAttribute("constants");
    MyResourceBundle rBYoginiDasha = local.loadPropertiesFileNew("yoginidasha",languageCode);
    
    YoginiDasa objYogini = new YoginiDasa();

    if(String.valueOf(session.getAttribute("languageCode")).equals("1")){
        myAstrologyObject.setLanguageCode("1");
    }
    else {
        myAstrologyObject.setLanguageCode("0");
    }     
    myAstrologyObject.initialize();
    int  pagenum=2;
    int iLowerLimit = 12;     //When Page Number is "1"
    int iUpperLimit = 23;
    if(String.valueOf(session.getAttribute("languageCode")).equals("1")){
        objYogini.setLanguageCode ("1");  //Hindi languagecde
    }else{                
        objYogini.setLanguageCode ("0"); //English languagecde
     }
    
    objYogini.initializesArrayValues();
    
    objYogini.setUserBirthTime(myAstrologyObject.getDayOfBirth(), myAstrologyObject.getMonthOfBirth(), myAstrologyObject.getYearOfBirth());
    objYogini.restDasaOfYogini (myAstrologyObject.getPlanetaryLongitude(2));
    objYogini.generate1stLevelYoginiDasa();
    String strMahaDasha = objYogini.generate2ndLevelYoginiDasa(0).toString();
    String[] arrSplittedCell = strMahaDasha.split("\\+"+(char)10);  
    String[]  arrYoginiAntraDasha = new String[24];
    for(int iCount = 0;iCount<= iUpperLimit ;iCount++){
        arrYoginiAntraDasha[iCount] = objYogini.generate2ndLevelYoginiDasa(iCount).toString();
    } 
%>

<div class="hdg-lg card">
	<h1><%=rbConstants.getString("YOGINI_DASHA") %></h1>	
</div>
<div class="mrt-30"> 
<div class="card"> 


	<div class="row top-border">
		<% for(int iCount = iLowerLimit ; iCount<=iUpperLimit ; iCount++){
            %>
            
			<div class="col s4 m4 altcolor">
				<div class="center">
				<% String[] arrsplitted = arrYoginiAntraDasha[iCount].split("\\"+(char)10);
                    for(int iCount1 = 0 ; iCount1 <= arrsplitted.length-1;iCount1++){%>
				
					<div class="table-alt cr-font"> <% if(languageCode==0 ||languageCode ==1){%>
								<%=hindi.unicode(arrsplitted[iCount1],languageCode)%> <% }else{ %>
								<%=local.unicodefForDasha(arrsplitted[iCount1].trim(),languageCode)%> <% } %>
						</div>
						<%}%>
					
				</table> 
				</div>
				</div>
				<%}%>
		
	</div>
	
	</div>
	</div>

	<%@include file='ui-control/ad-content-area.jsp'%>
		<div class="row mrt-30">
	<div class="col s12 l12"> 
<div class="card table-panel rt-custom"> 
		<table class="highlight striped bordered ui-table ui-font responsive-table">
		<thead>
			<tr class="amber lighten-5">
				<th><%=rBYoginiDasha.getString("S_No") %></th>
				<th><%=rbConstants.getString("MA") %></th>
				<th><%=rBYoginiDasha.getString("PI") %></th>
				<th><%=rBYoginiDasha.getString("DH") %></th>
				<th><%=rBYoginiDasha.getString("BR") %></th>
				<th><%=rBYoginiDasha.getString("BA") %></th>
				<th><%=rBYoginiDasha.getString("UL") %></th>
				<th><%=rBYoginiDasha.getString("SI") %></th>
				<th><%=rBYoginiDasha.getString("SN")%></th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th><%=rBYoginiDasha.getString("YOGINI") %></th>
				<td><%=rbConstants.getString("MANGALA")%></td>
				<td><%=rbConstants.getString("PINGALA")%></td>
				<td><%=rbConstants.getString("DHANYA")%></td>
				<td><%=rbConstants.getString("BHRAMARI")%>
				</td>
				<td><%=rbConstants.getString("BHADRIKA")%>
				</td>
				<td><%=rbConstants.getString("ULKA")%></td>
				<td><%=rbConstants.getString("SIDDHA")%></td>
				<td><%=rbConstants.getString("SANKATA")%></td>
			</tr>
			<tr>
				<th><%=rbConstants.getString("LORD")%></th>
				<td><%=rbConstants.getString("MOON")%></td>
				<td><%=rbConstants.getString("SUN") %></td>
				<td><%=rbConstants.getString("JUPITER") %>
				</td>
				<td><%=rbConstants.getString("MARS") %></td>
				<td><%=rbConstants.getString("MERCURY") %>
				</td>
				<td><%=rbConstants.getString("SATURN") %></td>
				<td><%=rbConstants.getString("VENUS") %></td>
				<td><%=rbConstants.getString("RAHU") %></td>
			</tr>
			</tbody>
		</table>
		</div>
		</div>
		</div>
		
		<div class="mrt-30"> 
   <div class="card">
   <div class="padding-2">
   <a href="yoginidasha1.asp" class="waves-effect waves-light btn amber darken-4 box-shadow"><%=rbConstants.getString("BACK") %></a>
   </div>
   </div>
   </div>
	
	

<%@include file='calculations-footer.jsp'%>