<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.maitri.Maitri"%>
<%@page import="java.util.ResourceBundle"%>

<%
Local local = new Local();

int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBFriendship = local.loadPropertiesFileNew("friendship",languageCode);
MyResourceBundle rBPlanetPositionFriendship = local.loadPropertiesFileNew("planetposition-friendship",languageCode);
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
String[] planetNames = new String[7];
planetNames[0]=rBConstants.getString("SUN");
planetNames[1]=rBConstants.getString("MOON");
planetNames[2]=rBConstants.getString("MARS");
planetNames[3]=rBConstants.getString("MERCURY");
planetNames[4]=rBConstants.getString("JUPITER");
planetNames[5]=rBConstants.getString("VENUS");
planetNames[6]=rBConstants.getString("SATURN");
%>

<div class="hdg-lg card">
	<h1><%=rBConstants.getString("FRIENDSHIP_TABLE") %></h1>	
</div>



	
		<%
                 //declare variable
                 int[] arrshodasvarg = new int[6];
                  // String[][] cities = new String[3][3]; 
                 //  String[][] arrshodasvarg = new String[6][6];
                   String[] arrPlanet = new String[7];
                  // String[][] arrPlanet = new String[6][6];
                   int[][] arrPermanent = new int[7][7];
                   int[][] arrTemporal = new int[7][7];
                   int[][] arrPanchadha = new int[7][7];
                  
                   String[][] myarraystr = new String[7][7];
                   int relationbwplanet = 0;
               
                 DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
                 Maitri objMaitri =  new Maitri();
                 arrshodasvarg=myAstrologyObject.getPositionForShodasvarg(0);
                 
                 objMaitri.getPositionForlagnaKundli(arrshodasvarg);
	
	             for(int i=1; i<=7 ;i++){
                     arrPlanet[i-1] = myAstrologyObject.getPlanetName(i);
	             }

	for(int i=0 ; i<=6 ; i++){ 
	     for(int ixplanet = 0 ; ixplanet<=6 ; ixplanet++){
                            // arrPermanent[i][ixplanet]=objMaitri.ggetNaisargikMatri[i + 1][ixplanet + 1];
                             arrPermanent[i][ixplanet]=objMaitri.getNaisargikMatri((i + 1), (ixplanet + 1));
                                                 
                             relationbwplanet=arrPermanent[i][ixplanet];
                        switch(relationbwplanet){
                            case -2:
                                    myarraystr[i][ixplanet] = rBFriendship.getString("BITTER");
                                   break;
                            case -1:
                                     myarraystr[i][ixplanet] = rBPlanetPositionFriendship.getString("ENEMY");
                                     break; 
                            case 0:
                                    myarraystr[i][ixplanet] = rBPlanetPositionFriendship.getString("NEUTRAL");
                                    break;
                            case 1:
                                    myarraystr[i][ixplanet] = rBConstants.getString("FRIENDS");
                                    break;
                            case 2:
                                   myarraystr[i][ixplanet] = rBFriendship.getString("INTIMAT");
                                   break;
                            case 3:
                                   myarraystr[i][ixplanet] = "---";
                                   break;
                            default:
                                   myarraystr[i][ixplanet] = "---" ;
                        }
	     }
	}
        %>
        
        
        <div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel formate-table rt-custom">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBFriendship.getString("PERMANENT_FRIENDSHIP") %> </h4>
<table class="highlight striped bordered ui-table ui-font responsive-table">
		<thead>
			<tr>
				<th class="cellhead"></th>
				<%
                for(String plName : planetNames)
                {%>
				<th class="cellhead"><%=plName %></th>
				<% } %>
			</tr>
			
			</thead>

			<%
	for(int i=0 ; i<=6 ; i++){ 
	%>
			<tr>
				<td class='cellhead'><b><%=planetNames[i] %></b></td>

				<!--<tr>-->
				<%   
     for(int j=0;j<=6 ; j++){
            %>
				<td class="cellcontent"><%=myarraystr[i][j]%></td>
				<% }%>
			</tr>
			<%
	}
            %>

		</table>
</div>
</div>
</div>

<%@include file='ui-control/ad-content-area.jsp'%>
		

		<%
    for(int i=0 ; i<=6 ; i++){
	     for(int ixplanet = 0 ; ixplanet<=6 ; ixplanet++){
                             arrTemporal[i][ixplanet] =objMaitri.getTatkalikMatri((i + 1),(ixplanet + 1));
                             relationbwplanet = arrTemporal[i][ixplanet];
                        switch(relationbwplanet){
                            case -2:
                                    myarraystr[i][ixplanet] = rBFriendship.getString("BITTER");
                                    break;
                            case -1:
                                     myarraystr[i][ixplanet] = rBPlanetPositionFriendship.getString("ENEMY");
                                     break;
                            case 0:
                                    myarraystr[i][ixplanet] = rBPlanetPositionFriendship.getString("NEUTRAL");
                                    break;
                            case 1:
                                    myarraystr[i][ixplanet]= rBConstants.getString("FRIENDS");
                                    break;
                            case 2:
                                   myarraystr[i][ixplanet] = rBFriendship.getString("INTIMAT");
                                   break;
                            case 3:
                                   myarraystr[i][ixplanet] = "---";
                                   break;
                            default:
                                   myarraystr[i][ixplanet] = "---";
                        }
	     }
    }
        %>

	
		
		<div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel formate-table rt-custom">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBFriendship.getString("TEMPORAL_FRIENDSHIP") %> </h4>


		<table class="highlight striped bordered ui-table ui-font responsive-table">
		<thead>
			<tr>

				<th class="cellhead"></th>
				<%
                for(String plName : planetNames)
                {%>
				<th class="cellhead"><%=plName %></th>
				<% } %>
			</tr>
			</thead>

			<%
	for(int i=0;i <=6;i++){%>
			<tr>
				<td class='cellhead'><b><%=planetNames[i] %></b></td>


				<%   
     for(int j=0 ;j<=6;j++){
            %>
				<td class="cellcontent"><%=myarraystr[i][j]%> &nbsp;</td>
				<%  }%>
			</tr>
			<%
	}
            %>



		</table>
		</div>
		</div>
		</div>
		
		
		<% // Printing PANCHADHA Maitri  %>
		<%   
    
   for(int i=0 ; i <=6 ; i++){
	     for(int ixplanet = 0 ; ixplanet<=6 ; ixplanet++){
                                                       
                             arrPanchadha[i][ixplanet] =objMaitri.getPanchadaMatri((i + 1),(ixplanet + 1));
                             relationbwplanet=arrPanchadha[i][ixplanet];
                        switch(relationbwplanet){
                            case -2:
                                    myarraystr[i][ixplanet] = rBFriendship.getString("BITTER");
                                    break;
                            case -1:
                                     myarraystr[i][ixplanet] = rBPlanetPositionFriendship.getString("ENEMY");
                                    break;
                            case 0:
                                    myarraystr[i][ixplanet] = rBPlanetPositionFriendship.getString("NEUTRAL");
                                    break;
                            case 1:
                                    myarraystr[i][ixplanet]= rBConstants.getString("FRIENDS");
                                    break;
                            case 2:
                                   myarraystr[i][ixplanet] = rBFriendship.getString("INTIMAT");
                                    break;
                            case 3:
                                   myarraystr[i][ixplanet] = "---";
                                    break;
                           default:
                                   myarraystr[i][ixplanet] = "---";
                        }                  
	     }
   }
        %>
        
               <div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel formate-table rt-custom">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBFriendship.getString("FIVE_FOLD_FRIENDSHIP") %></h4>
<table class="highlight striped bordered ui-table ui-font responsive-table">
<thead>
			<tr>
				<th class="cellhead"></th>
				<%
                for(String plName : planetNames)
                {%>
				<th class="cellhead"><%=plName %></th>
				<% } %>
			</tr>
			</thead>

			<%
	for(int i=0; i<=6 ; i++) {%>
			<tr>
				<td class='cellhead'><b><%=planetNames[i] %></b></td>


				<%   
     for (int j=0 ; j <=6 ;j++) {
            %>
				<td class="cellcontent"><%=myarraystr[i][j]%> &nbsp;</td>
				<% } %>
			</tr>
			<%
     }
            %>

		</table>
		<div>
		</div>
		</div>
		</div>
		</div>
		
		
		<p><%@include file='calculations-footer.jsp'%></p>
		<p>&nbsp;</p>
	


