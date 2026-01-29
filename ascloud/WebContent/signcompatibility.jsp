<%@page import="com.cslsoftware.util.Constants"%>
<%@page import="javax.mail.Session"%>
<%@ page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.matchmaking.MatchMaking"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.DatabaseUtils"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.MatchMakingDAO"%>
<%@page import="com.cslsoftware.enghoro.EngHoro"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
    <script type="text/javascript">
        function CheckSignCompatibility() {
            var boy = document.getElementById('boyid').value;
            var girl = document.getElementById('girlid').value;
            if (boy == "" && girl == "") {
                alert("Please select Boy's Rashi and Girl's Rashi.");
                document.getElementById('boyid').focus();
                return false;
            }
            if (boy == "" && girl != "") {
                alert("Please select Boy's Rashi.");
                document.getElementById('boyid').focus();
                return false;
            }
            if (boy != "" && girl == "") {
                alert("Please select Girl's Rashi.");
                document.getElementById('girlid').focus();
                return false;
            }
            return true;
        }
    </script>

    <% session.setAttribute("topmenulink", "compatibility"); %>

    <div class="ui-container ui-margin-tb">
        <div id="roundtopheadid">
            <div class="roundtophead">
                <div>
                    <div class="AscTopHead" style="text-align: left;">
                        <a href="/" title="Home" class="BreadCrumb">Home</a> &#187; <a href="/compatibility/"
                            title="Compatibility" class="BreadCrumb">Compatibility</a> &#187; <a title="Sign Compatibility"
                                class="BreadCrumb">Sign Compatibility</a>
                    </div>
                </div>
            </div>
        </div>
        <%
			String boyRashiNum, girlRashiNum;
			boyRashiNum  = Util.safestr(request.getParameter("boyid"));
			girlRashiNum = Util.safestr(request.getParameter("girlid"));
			final String ERROR_MESSAGE = "Unable to calculate your Rashi (Sign) of your name";

			/* 'lordofRashi = Array(3, 6, 4, 2, 1, 4, 6, 3, 5, 7, 7, 5) */
			int[] lordofRashi = {2, 5, 3, 1, 0, 3, 5, 2, 4, 6, 6, 4};
			
			Constants ObjConst = new Constants();
            ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));
		
			MatchMaking  objMatchMakeing = new MatchMaking();
			objMatchMakeing.setLanguageCode("0");
			objMatchMakeing.initializesArrayValues();   
        %>
        <%! 
      	  String getInterpretation(String category, int boyRashiNum, int girlRashiNum) {
        		
        	MatchMakingDAO objMatchMakingDAO = new MatchMakingDAO();
	        return objMatchMakingDAO.getMatchMakingVal(category, boyRashiNum, girlRashiNum, 0);
	       }
	    %>
	       
        <% if(boyRashiNum == "" || girlRashiNum == "") {response.sendRedirect("http://www.astrosage.com/signcompatibility.asp");%>
           
	<% }
        
	if( boyRashiNum != "" && girlRashiNum != "") {
	  out.print("<h1 align='center'>Zodiac Sign Compatibility Result</h1>");
	  out.print( "<div class='contents'><p> In Vedic astrology, sign to sign compatibility and sign lord to sign lord compatibility are considered to get a better understanding of compatibility between partners.</p>");
	  out.print( "<p><b>Sign Compatibility </b>" + ((getInterpretation("BH", (Integer.parseInt(boyRashiNum) - 1), (Integer.parseInt(girlRashiNum) - 1)).replace("`","'")).replace("í","'")).replace("Zodiac sign","Sign") + "</p>");
	  out.print( "<p><b>Sign Lord Compatibility</b>" + (getInterpretation("RAS", lordofRashi[Integer.parseInt(boyRashiNum) - 1], lordofRashi[Integer.parseInt(girlRashiNum) - 1]).replace("`","'")).replace("í","'") + "</p></div>");
	  
	  double grahaMitraGuna = objMatchMakeing.matchGrahaMitraGuna(Integer.parseInt(boyRashiNum), Integer.parseInt(girlRashiNum));
	  double bhakutGuna =  objMatchMakeing.matchBhakutGuna(Integer.parseInt(boyRashiNum), Integer.parseInt(girlRashiNum));
	  double totalPoints = (grahaMitraGuna + bhakutGuna);
	  int gunaResult     = (int)((totalPoints / 12.0) * 100.0);
    %>
        <div class="content">
            <div class="GPage">
                <div class="container">
                    <div class="GPage-wide">
                        <div align="center">
                            <span class="ui-inner-img">
                                <img width="40" src="/images/heart.png" alt="Name Matching" /></span>
                            <span><font size="+2">
                                <%= getRasiName(Integer.parseInt(boyRashiNum) - 1) %>
                                and
                                <%= getRasiName(Integer.parseInt(girlRashiNum) - 1) %>
                                are
                                <%=gunaResult %>% Compatible.</font></span>
                        </div>
                        <div align="center">
                            <div class="ui-inner-box">
                                <a href="http://www.astrosage.com/signcompatibility.asp"><span class="ui-inner-img">
                                    <img src="/images/Arrow-back.png" /></span><span class="ui-inner-txt"><b>Try
                                        Another Match</b></span></a>
                            </div>
                        </div>
                        <div style="height: 10px;">
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                                    <a href="http://www.astrosage.com/zodiac/<%=getRasiName(Integer.parseInt(boyRashiNum)-1).toLowerCase() %>-man.asp">
                                        <div class="ui-inner-box">
                                            <span class="ui-inner-img">
                                                <img src="/images/boy-icon.png" alt="Read about <%=getRasiName(Integer.parseInt(boyRashiNum)-1).toLowerCase() %> man" /></span>
                                            <span class="ui-inner-txt"><b>
                                                <%=getRasiName(Integer.parseInt(boyRashiNum)-1) %>
                                                Man</b></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                                    <a href="http://www.astrosage.com/zodiac/<%= getRasiName(Integer.parseInt(girlRashiNum)-1).toLowerCase() %>-woman.asp">
                                        <div class="ui-inner-box">
                                            <span class="ui-inner-img">
                                                <img src="/images/girl-icon.png" alt="Read about <%= getRasiName(Integer.parseInt(girlRashiNum)-1).toLowerCase() %> woman" /></span>
                                            <span class="ui-inner-txt"><b>
                                                <%=getRasiName(Integer.parseInt(girlRashiNum)-1) %>
                                                Woman</b></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                                    <a href="http://www.astrosage.com/zodiac/<%= getRasiName(Integer.parseInt(boyRashiNum)-1).toLowerCase() %>-zodiac-sign.asp">
                                        <div class="ui-inner-box">
                                            <span class="ui-inner-img">
                                                <img width="40" src="/images/sign/<%= getRasiName(Integer.parseInt(boyRashiNum)-1).toLowerCase() %>.png" alt="Read about <%=getRasiName(Integer.parseInt(boyRashiNum)-1) %>" /></span>
                                            <span class="ui-inner-txt"><b>More about
                                                <%=getRasiName(Integer.parseInt(boyRashiNum)-1) %></b></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="ui-box ui-margin-b">
                                    <a href="http://www.astrosage.com/zodiac/<%= getRasiName(Integer.parseInt(girlRashiNum)-1).toLowerCase() %>-zodiac-sign.asp">
                                        <div class="ui-inner-box">
                                            <span class="ui-inner-img">
                                                <img width="40" src="/images/sign/<%= getRasiName(Integer.parseInt(girlRashiNum)-1).toLowerCase() %>.png" alt="Read about <%=getRasiName(Integer.parseInt(girlRashiNum)-1) %>" /></span>
                                            <span class="ui-inner-txt"><b>More about
                                                <%=getRasiName(Integer.parseInt(girlRashiNum)-1) %></b></span>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="ui-clear">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>

<%!
	public String getRasiName(int rashiNumber){
		String RasiName = "";
		switch(rashiNumber){
		      case 0:
		         RasiName = "Aries";
		         break;
		      case 1:
		         RasiName = "Taurus";
		         break;
		      case 2:
		         RasiName = "Gemini";
		         break;
		      case 3:
		         RasiName = "Cancer";
		         break;
		      case 4:
		         RasiName = "Leo";
		         break;
		      case 5:
		         RasiName = "Virgo";
		         break;
		      case 6:
		         RasiName = "Libra";
		         break;
		      case 7:
		         RasiName = "Scorpio";
		         break;
		      case 8:
		         RasiName = "Sagittarius";
		         break;
		      case 9:
		         RasiName = "Capricorn";
		         break;
		      case 10:
		         RasiName = "Aquarius";
		         break;
		      case 11:
		         RasiName = "Pisces";
		         break;
		      default:
		    	  break;
			}
		   return RasiName;
		}
%>