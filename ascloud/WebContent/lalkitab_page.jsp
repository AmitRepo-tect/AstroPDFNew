<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.astrocamp.horo.RLalKitab"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.printhoroscope.NorthChart"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.lalkitab.UtilLalkitab"%>
<%@page import="com.cslsoftware.lalkitab.LalKitab"%>

<script>
    function chk(g, kt) {
        kt++;
        if (g.KundliType.value == '2' && (g.period.value < 1 || g.period.value > 12)) {

            alert("for Month Kundli Period must be POSITIVE and LESS THEN 13");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '3' && (g.period.value < 1 || g.period.value > 31)) {

            alert("for Day Kundli Period must be POSITIVE and LESS THEN 32");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '4' && (g.period.value < 1 || g.period.value > 24)) {

            alert("for Hour Kundli Period must be POSITIVE and LESS THEN 25");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '5' && (g.period.value < 1 || g.period.value > 60)) {

            alert("for Minute Kundli Period must be POSITIVE and LESS THEN 61");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '6' && (g.period.value < 1 || g.period.value > 60)) {

            alert("for Second Kundli Period must be POSITIVE and LESS THEN 61");
            g.period.focus();
            return false;

        }
        if (g.KundliType.value == '7' && (g.period.value < 1 || g.period.value > 60)) {

            alert("for Degree Kundli Period must be POSITIVE and LESS THEN 61");
            g.period.focus();
            return false;

        }
        return true;

        alert(kt);
    }
</script>

    <div class="ui-container ui-margin-tb">
        <div id="roundtopheadid">
            <div class="roundtophead">
                <div>
                    <div class="AscTopHead" style="text-align: left;">
                        <a href="/" title="Home" class="BreadCrumb">Home</a> &#187; <a href="/lalkitab/"
                            class="BreadCrumb">lalkitab</a> &#187; <a class="BreadCrumb">Lal Kitab Charts Online</a>
                    </div>
                </div>
            </div>
        </div>
        <h1 align="center">
            Lal Kitab Charts Online</h1>
        <%
		//****** Option Base ******
		
		// on error resume next
		
		int[] planetinBhav = new int[12]; 
		int[] planetinBhav2 = new int[12]; 
		int[] planetinBhavForVarshaphal;
		int period, kundliType;
		
		String[] maleficBenefic = new String[2];
		maleficBenefic[0] = "<font color=red>Malefic</font>";
		maleficBenefic[1] = "Benefic";
		
		NorthChart pChart2 = new NorthChart();
		UtilLalkitab lalKitabUtil = new UtilLalkitab();
		RLalKitab lalKitab = new RLalKitab();
		NorthChart pChart = new NorthChart();
		
		
			planetinBhav[0] = Integer.parseInt(request.getParameter("planet1"));
			planetinBhav[1] = Integer.parseInt(request.getParameter("planet2"));
			planetinBhav[2] = Integer.parseInt(request.getParameter("planet3"));
			planetinBhav[3] = Integer.parseInt(request.getParameter("planet4"));
			planetinBhav[4] = Integer.parseInt(request.getParameter("planet5"));
			planetinBhav[5] = Integer.parseInt(request.getParameter("planet6"));
			planetinBhav[6] = Integer.parseInt(request.getParameter("planet7"));
			planetinBhav[7] = Integer.parseInt(request.getParameter("planet8"));
			planetinBhav[8] = Integer.parseInt(request.getParameter("planet9"));
			planetinBhav[9] = 6;
			planetinBhav[10] = 6;
			planetinBhav[11] = 6;
		
			pChart.setBhavPositionForPlanets(planetinBhav);
			pChart.setBhavPositionForRashi(1);
			
			//  ------------------------------------------
	
			lalKitab.set(planetinBhav);
			
			period = Integer.parseInt(request.getParameter("period"));
			kundliType = Integer.parseInt(request.getParameter("KundliType"));
			
			planetinBhavForVarshaphal = lalKitab.getAlteredKundli(period, kundliType);
			
			for (int i = 0;  i<=8; i++) {
			   	planetinBhav2[i] = planetinBhavForVarshaphal[i];
			}
			planetinBhav2[9] = 6;
			planetinBhav2[10] = 6;
			planetinBhav2[11] = 6;
			pChart2.setBhavPositionForPlanets(planetinBhav2);
			pChart2.setBhavPositionForRashi(1);
	%>
	<script>
		var kType=<%=kundliType%>;
	</script>
	<table align="center" border="0" width="366" bordercolor="#FF0000" cellspacing="0">
	     <tr>
	         <th style="text-align: center;">
	             <%=lalKitab.getChartTypeName(kundliType-1)%>
	             Chart
	         </th>
	     </tr>
	     <tr>
	         <td width="436">
	             <%= pChart.printChart() %>
	         </td>
	     </tr>
	     <tr>
	         <td>
	             &nbsp;
	         </td>
	     </tr>
	     <tr>
	         <th style="text-align: center;">
	             <%=lalKitab.getChartTypeName(kundliType)%>
	             Chart
	         </th>
	     </tr>
	     <tr>
	         <td width="436">
	             <%= pChart2.printChart() %>
	         </td>
	     </tr>
	     <tr>
	         <td>
	             <form method="post" action="lalkitab_page.asp" name="FrontPage_Form1" onsubmit="return chk(this,kType)">
	             <div>
	                 <input type="hidden" name="KundliType" value="<%=kundliType+1%>">
		              <%
					    for (int i = 1; i<= 9; i++) {
					    	out.write("<input type=hidden name=planet" + i + " " + "value=" + planetinBhavForVarshaphal[i-1] + "> \n");
					    	}
						%>
                        <input type="hidden" name="planet10" value="7">
                        <input type="hidden" name="planet11" value="7">
                        <input type="hidden" name="planet12" value="7">
                        <% if (kundliType != 7) { %>
	                        <b>
	                            <%= lalKitab.getChartTypeName(kundliType+1) %>
	                        </b>
	                        <input type="text" name="period" size="5" class="input">
	                        <input class="mybutton" type="submit" value="Get <%= lalKitab.getChartTypeName(kundliType+1) %> Chart" name="B1">
	                        <input class="mybutton" type="button" onclick="javascript:history.back()" value="Back" />
                        <% } %>
		                    </div>
		                    </form>
		                </td>
		            </tr>
		        </table>
		        <div class="ui-clear" style="height: 15px;">
		        </div>
		        <div class="ui-global-table table-responsive">
		            <table>
		                <tr>
		                    <td>
		                        <b>Planet</b>
		                    </td>
		                    <td colspan="2">
		                        <b>
		                            <%=lalKitab.getChartTypeName(kundliType-1)%>
		                            Chart</b>
		                    </td>
		                    <td colspan="2">
		                        <b>
		                            <%=lalKitab.getChartTypeName(kundliType)%>
		                            Chart</b>
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Jupiter
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[4] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(5, planetinBhav[4])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[4] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic (5, planetinBhavForVarshaphal[4])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Sun
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[0] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(1, planetinBhav[0])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[0] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(1, planetinBhavForVarshaphal[0])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Moon
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[1] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(2, planetinBhav[1])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[1] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(2, planetinBhavForVarshaphal[1])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Venus
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[5] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(6, planetinBhav[5])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[5]%>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(6, planetinBhavForVarshaphal[5])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Mars
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[2] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(3, planetinBhav[2])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[2] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(3, planetinBhavForVarshaphal[2])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Mercury
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[3] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(4, planetinBhav[3])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[3] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(4, planetinBhavForVarshaphal[3])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Saturn
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[6] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(7, planetinBhav[6])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[6] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(7, planetinBhavForVarshaphal[6])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Rahu
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[7] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(8, planetinBhav[7])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[7] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(8, planetinBhavForVarshaphal[7])] %>&nbsp;
		                    </td>
		                </tr>
		                <tr>
		                    <td width="20%">
		                        Ketu
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhav[8] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(9, planetinBhav[8])] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= planetinBhavForVarshaphal[8] %>&nbsp;
		                    </td>
		                    <td width="20%">
		                        <%= maleficBenefic[lalKitabUtil.getMaleficBenafic(9, planetinBhavForVarshaphal[8])] %>&nbsp;
		                    </td>
		                </tr>
		            </table>
		        </div>
		    </div>