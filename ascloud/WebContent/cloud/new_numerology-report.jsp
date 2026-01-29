
<%
/*
##SUMMARY
#© copyrights Ojas Softech pvt. ltd. 
#This page is used to show numerology details of user.
#Creation Date: 2/07/2019
#author: jitendra singh
##
*/
%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="com.ojassoft.astrosagecloud.util.NumerologyUtil"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.*"%>

<%
	
	  DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
	//These parameter is used to calcualte the namank ,mulank and destiny number and recived it form session
	  int getDay = myAstrologyObject.getDayOfBirth();
	  int getMonth =myAstrologyObject.getMonthOfBirth();
	  int getYear =myAstrologyObject.getYearOfBirth();
	  String getName =myAstrologyObject.getName();
	  boolean isNameAlphabet = NumerologyUtil.isStringOnlyAlphabet(getName);
	  String getCType = "0";//this is fix 0 for only in cloud and this is used to only for calculate namank
	  	  Local local = new Local();
	      Hindi hindi = new Hindi();
		  
	      int languageCode = Util.safeInt(session.getAttribute("languageCode"));
	     // com.cslsoftware.util.Util util = new com.cslsoftware.util.Util();
	      MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
	      MyResourceBundle rBNumerology = local.loadPropertiesFileNew("numerology-calculator",languageCode);
	      
	      String fullDob=getDay+"-"+getMonth+"-"+getYear;
	      
	      String getFirstName []= getName.split(" ");
	      String firstName= getFirstName[0];
	     
	      int mulank = NumerologyUtil.getMulank(String.valueOf(getDay));
	      int destineyNumber = NumerologyUtil.getDestinyNumber(fullDob);
	      int namank = NumerologyUtil.getNameMulank(getName, Integer.parseInt(getCType));
	      
	      String radicalImgUrl="images/redical-numbers-"+mulank+".png";
	      String destinyImgUrl="images/destiny-numbers-"+destineyNumber+".png";
	      String nameImgUrl="images/name-numbers-"+namank+".png";
	      
	      String arrNamank[];
	      String cssClassNamecol;
	      if (isNameAlphabet==true){
	    	  cssClassNamecol="col s4 l4";
	      }
	      else
	      {
	    	  cssClassNamecol="col s6 l6";
	      }
	      String arrRadical[]={firstName,Integer.toString(mulank)};
	      //This condition work to provide dynamic array to show name and number in constant value
	      //In If condition we pass 4 parameter and else we pass three parameter
	      if (languageCode == 0 || languageCode == 1 ||languageCode == 5 ) { 
	    	  	arrNamank= new String[4];
	       		arrNamank[0]=firstName;
	    		arrNamank[1]=getName;
	  			arrNamank[2]=Integer.toString(namank);
	  			arrNamank[3]=Integer.toString(namank);
	      }
	      else
	      {
	    	  	arrNamank= new String[3];
	    	  	arrNamank[0]=getName;
				arrNamank[1]=Integer.toString(namank);
				arrNamank[2]=Integer.toString(namank);
	      }
	      String getFavRashi = rBNumerology.getString("NUMEROLOGY_FAVOURABLE_RASHI");
	      String getFavAlphabet = rBNumerology.getString("NUMEROLOGY_FAVOURABLE_ALPHABET");
	      String getGemstone = rBNumerology.getString("NUMEROLOGY_GEMSTONE");
	      String getDisha = rBNumerology.getString("NUMEROLOGY_DISHA");
	      String getProfession = rBNumerology.getString("NUMEROLOGY_PROFESSION");
	      String getFavDays = rBNumerology.getString("NUMEROLOGY_DAYS");
	      String getCountry = rBNumerology.getString("NUMEROLOGY_COUNTRY");
	      String getCity = rBNumerology.getString("NUMEROLOGY_CITY");
	      String getFavDate = rBNumerology.getString("NUMEROLOGY_FAV_DATE");
	      String getAuspColor = rBNumerology.getString("NUMEROLOGY_AUSPICIOUS_COLOR");
	      String getRulingPlanet = rBNumerology.getString("NUMEROLOGY_PLANET");
	      String getGod = rBNumerology.getString("NUMEROLOGY_GOD");
	      String getFast = rBNumerology.getString("NUMEROLOGY_FAST");
	      String getMantra = rBNumerology.getString("NUMEROLOGY_MANTRA");
	      String getFavNumber = rBNumerology.getString("NUMEROLOGY_FAV_NUMBER");
	      String getYantraLink = rBNumerology.getString("YANTRALINK");
	      String getYantraImageLink = rBNumerology.getString("YANTRAIMAGE");
		
	      String [] arrFavRashi= getFavRashi.split("##");
	      String [] arrFavAlphabet = getFavAlphabet.split("##");
	      String [] arrGemstone= getGemstone.split("##");
	      String [] arrFavDays= getFavDays.split("##");
	      String [] arrFavNumber= getFavNumber.split("##");
	      String [] arrDisha= getDisha.split("##");
	      String [] arrAuspColor= getAuspColor.split("##");
	      String [] arrRulingPlanet= getRulingPlanet.split("##");
	      String [] arrGod= getGod.split("##");
	      String [] arrFast= getFast.split("##");
	      String [] arrFavDate= getFavDate.split("##");
	      String [] arrMantra= getMantra.split("##");
	      String [] arrProfession= getProfession.split("##");
	      String [] arrCountry= getCountry.split("##");
	      String [] arrCity= getCity.split("##");
	      String [] arrYantraLink= getYantraLink.split("##");
	      String [] arrYantraImageLink= getYantraImageLink.split("##");
	      
	      
	      String yantraUrl="https://buy.astrosage.com/navagrah-yantra/"+arrYantraLink[mulank-1];
	      String yantraImageUrl="https://www.astrosage.com/numerology/images/yantras/"+arrYantraImageLink[mulank-1];
	%>    
	
<script>
	$(function(){		
		var hash = location.hash.substr(1);		
		$('html,body').animate({scrollTop: $('#'+hash).offset().top-120},200);		
	});	
	$(window).on('hashchange', function() {
		var hash1 = location.hash.substr(1);		
		$('html,body').animate({scrollTop: $('#'+hash1).offset().top-120},200);	
	});	
</script>   
		<% if (isNameAlphabet==false){%>
			<div class="row mb-0 numerlogy-numers-sec" id="namenumber">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec anchor-style">
	                  <div class="number-img">
	                     <h4> <%=rBNumerology.getString("LBL_NAME_NUMBER") %></h4>
	                  </div>
	                  <p class="red-c"> <%=rBNumerology.getString("NAME_NUMBER_INFO") %>
	                  <a href="editchart.asp" class="anch" onclick="getEvents('ascloud','numerology-editchart');"><%=rBConstants.getString("EDIT_NAME") %></a>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
		<%}%>
	     <div class="numerlogy-dashbaord" id="keydetails">
	   		<div class="row mb-0">
	         <div class="col s12 l12">
	            <div class="row mb-0 numerology-section">
	               <div class="<%=cssClassNamecol%>">
	                  <div class="card center">
	                     <div class="Number orange-color"><%=mulank %></div>
	                     <p> <%=rBNumerology.getString("LBL_RADICAL_NUM") %></p>
	                  </div>
	               </div>
	               <div class="<%=cssClassNamecol%>">
	                  <div class="card center">
	                     <div class="Number yellow-color"><%=destineyNumber %></div>
	                     <p> <%=rBNumerology.getString("LBL_DESTINY_NUM") %></p>
	                  </div>
	               </div>
	               <% if (isNameAlphabet== true){%>
	               <div class="<%=cssClassNamecol %>">
	                  <div class="card center">
	                     <div class="Number blue-dark-color"><%=namank %></div>
	                     <p> <%=rBNumerology.getString("LBL_NAME_NUMBER") %></p>
	                  </div>
	               </div>
	               <%} %>
	            </div>
	            <div class="row mb-0 numerology-section">
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_YOUR_NAME") %></p>
	                     <div class="result-numero"> <%=getName %></div>
	                  </div>
	               </div>
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_DOB") %></p>
	                     <div class="result-numero"> <%=fullDob %></div>
	                  </div>
	               </div>
	            </div>
	            <div class="row mb-0 numerology-section">
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_FAV_RASHI") %></p>
	                     <div class="result-numero orange-color"> <%=arrFavRashi[mulank-1] %></div>
	                  </div>
	               </div>
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_FAV_ALPHABETS") %></p>
	                     <div class="result-numero orange-color"><%=arrFavAlphabet[mulank-1] %></div>
	                  </div>
	               </div>
	            </div>
	            <div class="row mb-0 numerology-section">
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_GEMSTONE") %></p>
	                     <div class="result-numero blue-dark-color"> <%=arrGemstone[mulank-1] %></div>
	                  </div>
	               </div>
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_FAV_DAY") %></p>
	                     <div class="result-numero blue-dark-color"> <%=arrFavDays[mulank-1] %></div>
	                  </div>
	               </div>
	            </div>
	            <div class="row mb-0 numerology-section">
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_FAV_NUMBER") %></p>
	                     <div class="result-numero"> <%=arrFavNumber[mulank-1] %></div>
	                  </div>
	               </div>
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p><%=rBNumerology.getString("LBL_DIRECTION") %></p>
	                     <div class="result-numero"> <%=arrDisha[mulank-1] %></div>
	                  </div>
	               </div>
	            </div>
	            <div class="row mb-0 numerology-section">
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_AUSP_COLOR") %> </p>
	                     <div class="result-numero blue-dark-color"> <%=arrAuspColor[mulank-1] %></div>
	                  </div>
	               </div>
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p><%=rBNumerology.getString("LBL_PLANET") %></p>
	                     <div class="result-numero blue-dark-color"> <%=arrRulingPlanet[mulank-1] %></div>
	                  </div>
	               </div>
	            </div>
	            <div class="row mb-0 numerology-section">
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p> <%=rBNumerology.getString("LBL_GOD") %></p>
	                     <div class="result-numero"> <%=arrGod[mulank-1] %></div>
	                  </div>
	               </div>
	               <div class="col s6 l6">
	                  <div class="card">
	                     <p><%=rBNumerology.getString("LBL_FAST") %></p>
	                     <div class="result-numero"> <%=arrFast[mulank-1] %></div>
	                  </div>
	               </div>
	            </div>
	            <div class="row mb-0 numerology-section">
	               <div class="col s12 l12">
	                  <div class="card">
	                     <p><%=rBNumerology.getString("LBL_FAV_DATE") %></p>
	                     <div class="result-numero"><%=arrFavDate[mulank-1] %></div>
	                  </div>
	               </div>
	            </div>
	           
	            <div class="row mb-0 numerology-section">
	               <div class="col s12 l12">
	                  <div class="card">
	                     <p><%=rBNumerology.getString("LBL_MANTRA") %></p>
	                     <div class="result-numero orange-color"><%=arrMantra[mulank-1] %></div>
	                  </div>
	               </div>
	            </div>
	         </div>
	      </div>
	   
	      <div class="row mb-0 numerlogy-numers-sec" id="radicalnumber">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="<%=radicalImgUrl %>" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_RADICAL_NUM") %></h4>
	                  </div>
	                  <p> <%=local.getDesiredString(rBNumerology.getString("MULANK_TEXT"), arrRadical) %><br><br>
	                	  <%=rBNumerology.getString("MULANK_DESC_TEXT"+mulank) %>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      
	      <div class="row mb-0 numerlogy-numers-sec" id="destinynumber">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="<%=destinyImgUrl %>" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_DESTINY_NUM") %></h4>
	                  </div>
	                  <p> <%=rBNumerology.getString("DESTINY_TEXT"+destineyNumber)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <%if (isNameAlphabet==true){ %>
	      <div class="row mb-0 numerlogy-numers-sec" id="namenumber">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="<%=nameImgUrl %>" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_NAME_NUMBER") %></h4>
	                  </div>
	                  <p> <%=local.getDesiredString(rBNumerology.getString("NAMANK_TEXT"),arrNamank)  %><br><br>
	                	  <%=rBNumerology.getString("NAMANK_DESC_TEXT"+namank)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <%}%>
	      <div class="row mb-0 numerlogy-numers-sec" id="ausplacetime">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/4.png" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_AUSP_PLACE") %></h4>
	                  </div>
	                  <p> <%=rBNumerology.getString("PLACE_TEXT"+mulank)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <div class="row mb-0 numerlogy-numers-sec">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/6.png" /> </span>  
	                     <h4>  <%=rBNumerology.getString("LBL_AUSP_TIME") %></h4>
	                  </div>
	                  <p>  <%=rBNumerology.getString("TIME_TEXT"+mulank)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <div class="row mb-0 numerlogy-numers-sec" id="healthcareer">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/5.png" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_HEALTH") %> </h4>
	                  </div>
	                  <p> <%=rBNumerology.getString("HEALTH_TEXT"+mulank)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <div class="row mb-0 numerlogy-numers-sec">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/7.png" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_CAREER") %></h4>
	                  </div>
	                  <p><%=rBNumerology.getString("CAREER_TEXT"+mulank)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <div class="row mb-0 numerlogy-numers-sec" id="fastremedy">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/8.png" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_FAST_REMD") %> </h4>
	                  </div>
	                  <p><%=rBNumerology.getString("FAST_TEXT"+mulank)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <div class="row mb-0 numerlogy-numers-sec">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/9.png" /> </span>  
	                     <h4> <%=rBNumerology.getString("LBL_YANTRA") %> </h4>
	                  </div>
	                  <p><%=rBNumerology.getString("YANTRA_TEXT"+mulank)%>
	                  </p><br>
	                  <div align="center">
	                  <img src=<%=yantraImageUrl %>>
	                  <div class="clearfix"></div>
	                  <a href="<%=yantraUrl%>"  class="waves-effect waves-light btn amber darken-4 box-shadow" ><%=rBNumerology.getString("BUY_NOW") %></a>
	                  </div>
	               </div>
	            </div>
	         </div>
	      </div>
	      <% if ((getDay==11) || (getDay==22)){%>
	      <div class="row mb-0 numerlogy-numers-sec">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/10.png" /> </span>  
	                     <h4><%=rBNumerology.getString("LBL_SPECIAL_TAB") %></h4>
	                  </div>
	                  <p> <%=rBNumerology.getString("MASTER_NUMBER_TEXT")%><br><br>
	                      <%=rBNumerology.getString("MASTER_NUMBER_TEXT"+getDay)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	      <%
	      }
	      else if ((getDay==13) || (getDay==14)||(getDay==16) || (getDay==19)){%>
	    	<div class="row mb-0 numerlogy-numers-sec">
	         <div class="col s12 l12">
	            <div class="card">
	               <div class="numerb-sec">
	                  <div class="number-img">
	                     <span> <img src="images/10.png" /> </span>  
	                     <h4><%=rBNumerology.getString("LBL_SPECIAL_TAB") %></h4>
	                  </div>
	                  <p> <%=rBNumerology.getString("KARMIC_NUMBER_TEXT")%><br><br>
	                      <%=rBNumerology.getString("KARMIC_NUMBER_TEXT"+getDay)%>
	                  </p>
	               </div>
	            </div>
	         </div>
	      </div>
	    	  
	      <%}%>
	   </div>
  

     
      
     

