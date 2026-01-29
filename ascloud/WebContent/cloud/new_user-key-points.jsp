<%
/*
##SUMMARY
#© copyrights Ojas Softech pvt. ltd. 
#This page is used to show the user key point according to his lagna number
#Creation Date: 18/06/2019
#author: jitendra singh
##
*/
%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%@page contentType="text/html; charset=UTF-8"%>

<%@page import="com.cslsoftware.ghatakfavourable.GhatakFavourable"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>

<%
  	  Local local = new Local();
      Hindi hindi = new Hindi();
      int languageCode = (Integer)session.getAttribute("languageCode");
      com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction desktopHoroDllFunction = new com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction();
      com.cslsoftware.util.Util util = new com.cslsoftware.util.Util();
      
      MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
      MyResourceBundle rBBirthDetails = local.loadPropertiesFileNew("birthdetails",languageCode);
      MyResourceBundle rBUserKeyPoints = local.loadPropertiesFileNew("userkeypoints",languageCode);
      
      DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
      GhatakFavourable ObjGhatak = new GhatakFavourable();
      int lagnNumber= myAstrologyObject.getAscendentSign();
        
      if(languageCode == 1)
      {
		myAstrologyObject.setLanguageCode("1");
		myAstrologyObject.initialize();
		ObjGhatak.setLanguageCode("1");
		ObjGhatak.init();
      }
      else
      {
     	 Constants ObjConst = new Constants();
		 ObjConst.setConstPath(getServletContext().getRealPath("/cloud/"));	
	     myAstrologyObject.setLanguageCode("0");
	     myAstrologyObject.initialize();
	     ObjGhatak.setLanguageCode("0");
	     ObjGhatak.init();
      }

      String singName []={"","ARIS","TAURUS","GEMINI","CANCER","LEO","VIRGO","LIBRA","SCORPIO","SAGITTARIUS","CAPRICORN","AQUARIUS","PISCES"};
      String getAllQuestionList = rBUserKeyPoints.getString("ALL_KEY_POINTS_QUESTION");
      String getAllAnswerForLagna = rBUserKeyPoints.getString("ALL_KEY_POINTS_ANSWER_FOR_"+singName[lagnNumber]);
      String arrAllQuestionList [] = getAllQuestionList.split("##");
      String arrAllAnswerList [] = getAllAnswerForLagna.split("##");
      
      //CODING FOR FAVOURABLE VALUES
      String[]  myArrayFAV =  new String[7] ;
      ObjGhatak.setJodiacSign(myAstrologyObject.getMoonSign() + 1);
      myArrayFAV[0] = GetGhatakData(ObjGhatak.getLuckyStone(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
      myArrayFAV[1] = ObjGhatak.getLuckyNumbers();
      myArrayFAV[2] = GetGhatakData(ObjGhatak.getLuckyDays(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
      myArrayFAV[3] = GetGhatakData(ObjGhatak.getFriendlySigns(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
      myArrayFAV[4] = ObjGhatak.getGoodYears(); 
 	  myArrayFAV[5] = GetGhatakData(ObjGhatak.getGoodPlanets(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
      myArrayFAV[6] = GetGhatakData(ObjGhatak.getLuckyMetal(),","," ",languageCode,rBConstants,hindi,rBBirthDetails);
      
   	//Code For Heading Of Favourable Points
	  String[] arrHeadingFAV =  new  String[7];
      arrHeadingFAV[0] = rBUserKeyPoints.getString("KEY_STONE");
      arrHeadingFAV[1] = rBUserKeyPoints.getString("KEY_NUMBERS");
      arrHeadingFAV[2] = rBUserKeyPoints.getString("KEY_DAYS");
      arrHeadingFAV[3] = rBUserKeyPoints.getString("KEY_SIGNS");
      arrHeadingFAV[4] = rBUserKeyPoints.getString("KEY_YEARS");
      arrHeadingFAV[5] = rBUserKeyPoints.getString("KEY_PLANETS");
      arrHeadingFAV[6] = rBUserKeyPoints.getString("KEY_METAL");
      
      
    //CODING FOR GHATAK VALUES
      Double d = new Double(myAstrologyObject.getMoon()/30 + 1);
      ObjGhatak.setJodiacSign(d.intValue());
     
   	  String[] myArrayGHT =  new String[7];
	  myArrayGHT[0] = GetGhatakData(ObjGhatak.getGhatakNakshatra(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
	  myArrayGHT[1] = ObjGhatak.getEvilNumbers();
	  myArrayGHT[2] = GetGhatakData(ObjGhatak.getGhatakDay(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
	  myArrayGHT[3] = GetGhatakData(ObjGhatak.getGhatakRasi(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
	  myArrayGHT[4] = GetGhatakData(ObjGhatak.getGhatakMonths(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
	  myArrayGHT[5] = GetGhatakData(ObjGhatak.getEvilPlanets(),",","",languageCode,rBConstants,hindi,rBBirthDetails);
	  myArrayGHT[6] = ObjGhatak.getGhatakTithi();
	  
	  //Code For Heading Of Ghatak Values
	  
	  String[] arrHeadingGHT = new  String[7];
	  arrHeadingGHT[0] = rBUserKeyPoints.getString("KEY_NAKSHATRA");
	  arrHeadingGHT[1] = rBUserKeyPoints.getString("KEY_NUMBERS");
	  arrHeadingGHT[2] = rBUserKeyPoints.getString("KEY_DAYS");
	  arrHeadingGHT[3] = rBUserKeyPoints.getString("KEY_RASI");
	  arrHeadingGHT[4] = rBUserKeyPoints.getString("KEY_MONTH");
	  arrHeadingGHT[5] = rBUserKeyPoints.getString("KEY_PLANETS");
	  arrHeadingGHT[6] = rBUserKeyPoints.getString("KEY_TITHI");
	  
	  
      %>
		<%@include file='ui-control/ad-content-area.jsp'%>
		<div class="dashboard-new">
		   <div class="row">
		      <div class="col s12 l12">
		         <div class="dash-create Rmb-15">
		            <h1 class="card-title activator grey-text text-darken-4"><%=rBUserKeyPoints.getString("KEY_POINTS") %></h1>
		         </div>
		      </div>
		   </div>
		   <div class="row">
		      <div class="col s12 l12">
		         <div class="card great-ambi">
		            <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[0] %><img class="right" src="images/your-greatest-ambition.png" /></h4>
		            <h3 class="amber-text text-darken-4"><%=arrAllAnswerList[0] %></h3>
		         </div>
		      </div>
		   </div>
		  <div class="row mb-0">
            <div class="col s12 l12">
               <div class="card great-ambi mb-20">
                  <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[1] %><img class="right" src="images/inspiration.png" /></h4>
                  <h3 class="blue-color"> <%=arrAllAnswerList[1] %> </h3>
               </div>
            </div>
           </div>
		  <div class="row">
		   <div class="col s12 l12">
              <div class="card great-ambi">
                 <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[6] %><img class="right" src="images/motive-of-life.png" /></h4>
                 <h3 class="red-color"><%=arrAllAnswerList[6] %> </h3>
              </div>
           </div>
		   </div>
		   <div class="row">
		      <div class="col s12 l12">
		         <div class="card great-ambi">
		            <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[2] %><img class="right" src="images/skill.png" /></h4>
		            <h3 class="green-color"> <%=arrAllAnswerList[2] %> </h3>
		         </div>
		      </div>
		   </div>
		   <div class="row">
		      <div class="col s12 l12">
		         <div class="card great-ambi">
		            <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[3] %><img class="right" src="images/weakness.png" /></h4>
		            <h3 class="maroom-color"><%=arrAllAnswerList[3] %></h3>
		         </div>
		      </div>
		   </div>
		   <div class="row">
		      <div class="col s12 l12">
		         <div class="card great-ambi">
		            <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[4] %><img class="right" src="images/principal-statement.png" /></h4>
		            <h3 class="purple-color"><%=arrAllAnswerList[4] %></h3>
		         </div>
		      </div>
		   </div>
		   <div class="row">
            <div class="col s12 l12">
               <div class="card great-ambi mb-20">
                  <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[7] %><img class="right" src="images/line-of-direction.png" /></h4>
                  <h3 class="skyblue-color"> <%=arrAllAnswerList[7] %></h3>
               </div>
            </div>
          </div>
		  <div class="row">
		   <div class="col s12 l12">
             <div class="card great-ambi">
                <h4 class="card-title activator grey-text text-darken-4"><%=arrAllQuestionList[5] %> <img class="right" src="images/identity.png" /></h4>
                <h3 class="brown-color"><%=arrAllAnswerList[5] %></h3>
             </div>
          </div>
          </div>
		   <div class="row">
		      <div class="col s12 l12">
		         <div class="good-key-point">
		            <h2><%=rBBirthDetails.getString("FAVOURABLE_POINTS")%></h2>
		            <div class="row">
		               <div class="col s4 l4">
		                <img src="images/good.png" class="sh-img">
		               </div>
		               <div class="col s8 l8">
		                  <div class="row">
		                     <div class="col s6 l6">
		                        <div class="card good-card">
		                           <h3> <%=arrHeadingFAV[1]%> </h3>
		                           <h2>
		                              <%=myArrayFAV[1] %>
		                           </h2>
		                        </div>
		                     </div>
		                     <div class="col s6 l6">
		                        <div class="card good-card">
		                           <h3> <%=arrHeadingFAV[2]%> </h3>
		                           <h2> 
		                              <%=myArrayFAV[2] %>
		                           </h2>
		                        </div>
		                     </div>
		                     <div class="col s6 l6">
		                        <div class="card good-card">
		                           <h3> <%=arrHeadingFAV[4]%> </h3>
		                           <h2> <%=myArrayFAV[4] %>
		                           </h2>
		                        </div>
		                     </div>
		                     <div class="col s6 l6">
		                        <div class="card good-card">
		                           <h3> <%=arrHeadingFAV[5]%> </h3>
		                           <h2> <%=myArrayFAV[5] %>
		                           </h2>
		                        </div>
		                     </div>
		                     
		                  </div>
		               </div>
		               </div>
		                  <div class="row">
		                    <div class="col s4 l4">
		                        <div class="card good-card Rmb-15">
		                           <h3> <%=arrHeadingFAV[0]%> </h3>
		                           <h2> <%=myArrayFAV[0] %></h2>
		                        </div>
		                     </div>
		                     <div class="col s4 l4">
		                        <div class="card good-card Rmb-15">
		                           <h3> <%=arrHeadingFAV[3]%> </h3>
		                           <h2> <%=myArrayFAV[3] %>
		                           </h2>
		                        </div>
		                     </div>
		                     <div class="col s4 l4 Rmb-15">
		                        <div class="card good-card">
		                           <h3> <%=arrHeadingFAV[6]%> </h3>
		                           <h2>
		                              <%=myArrayFAV[6]%>
		                           </h2>
		                        </div>
		                     </div>
		                     
		                  </div>
		               
		            
		         </div>
		      </div>
		   </div>
		
		   <div class="row">
		      <div class="col s12 l12">
		         <div class="bad-key-point">
		            <h2> <%=rBBirthDetails.getString("GHATAK")%></h2>
		            <div class="row">
		                     <div class="col s4 l4"> 
		                        <img src="images/bad.png" class="sh-img">
		                     </div>
		               <div class="col s8 l8">
		                  <div class="row">
		                     <div class="col s6 l6">
		                        <div class="card bad-card">
		                           <h3> <%=arrHeadingGHT[1] %> </h3>
		                           <h2>
		                              <%=myArrayGHT[1] %>
		                           </h2>
		                        </div>
		                     </div>
		                     <div class="col s6 l6">
		                        <div class="card bad-card">
		                           <h3> <%=arrHeadingGHT[2] %> </h3>
		                           <h2> 
		                              <%=myArrayGHT[2] %>
		                           </h2>
		                        </div>
		                     </div>
		                      <div class="col s6 l6">
		                        <div class="card bad-card">
		                           <h3> <%=arrHeadingGHT[4] %> </h3>
		                           <h2> <%=myArrayGHT[4] %>
		                           </h2>
		                        </div>
		                     </div>
		                     <div class="col s6 l6">
		                        <div class="card bad-card">
		                           <h3> <%=arrHeadingGHT[5] %> </h3>
		                           <h2> <%=myArrayGHT[5] %>
		                           </h2>
		                        </div>
		                     </div>
		                     
		                  </div>
		               </div>
		               
		               
		            </div>
		         </div>
		      </div>
		   </div>
		   <div class="row">
		   <div class="col s4 l4">
		                        <div class="card bad-card Rmb-15">
		                           <h3> <%=arrHeadingGHT[0] %> </h3>
		                           <h2> <%=myArrayGHT[0] %>
		                           </h2>
		                        </div>
		                     </div>
		                     <div class="col s4 l4">
		                        <div class="card bad-card Rmb-15">
		                           <h3> <%=arrHeadingGHT[3] %> </h3>
		                           <h2> <%=myArrayGHT[3] %>
		                           </h2>
		                        </div>
		                     </div>
		                      <div class="col s4 l4">
		                        <div class="card bad-card Rmb-15">
		                           <h3><%=arrHeadingGHT[6] %></h3>
		                           <h2> 
		                              <%=myArrayGHT[6] %>
		                           </h2>
		                        </div>
		                     </div>
		   </div>
		</div>
	   
			
<%@include file='calculations-footer.jsp'%>
<%!public String GetGhatakData(String Ghatakdata,String Firstdelimiter,String Seconddelimiter,int Languagecode ,MyProperties rBconstants,Hindi Hindi ,MyResourceBundle rBBirthDetails){
	 String flag = "0";
	 String Ghatakreturndata= "";
	 String tempstr ="";
	 String Delimiter = "";
	 String[] Ghatakarr = new String[4];
		if(Languagecode == 0 || Languagecode == 1)
		{
			 if(Ghatakdata.equals("ihyk uhye"))
			 {
			           Ghatakdata = "iq[kjkt";
			 }
		        Ghatakreturndata = Hindi.unicode(Ghatakdata,Languagecode);
		}
		        else{
		       tempstr = "" ;
		        
	           if(Ghatakdata.indexOf(Firstdelimiter)> 0){
		       
		              Ghatakarr = Ghatakdata.split(Firstdelimiter);
		              Delimiter = Firstdelimiter ;
		              flag = "1";}
		     
		         else if((Ghatakdata.indexOf(Seconddelimiter))>0 ){
		            Ghatakarr = Ghatakdata.split(Seconddelimiter);
		            Delimiter = Seconddelimiter;
		            flag = "1";}
		      
		        if(flag != "0"){
		            for(int arrcounter=0 ; arrcounter< Ghatakarr.length ; arrcounter++){
		            	try{
		                tempstr = tempstr + rBconstants.getString((Ghatakarr[arrcounter].toUpperCase()).replaceAll(" ", ""))+Delimiter ;
		              //  tempstr = tempstr + Ghatakarr[arrcounter].toUpperCase()+Delimiter ;
		            	}
		            	   catch(Exception e)
			               {
		            		 //  tempstr = tempstr + Ghatakarr[arrcounter].toUpperCase()+Delimiter ;
		            		 tempstr = tempstr + rBBirthDetails.getString((Ghatakarr[arrcounter].toUpperCase()).replaceAll(" ", ""))+Delimiter ;
			               }
			               
		              // tempstr = tempstr + Ghatakarr[arrcounter].toUpperCase()+Delimiter ;
		            }

		            tempstr =  tempstr.substring(0, tempstr.length()-1);
		        }
		        else{
		       	
		             //  tempstr = rBconstants.getString(Ghatakdata.toUpperCase());
		             try{
		            	 tempstr = rBBirthDetails.getString(Ghatakdata.toUpperCase().replaceAll(" ", ""));
		            	
		               }
		               catch(Exception e)
		               {
		            	   tempstr = rBconstants.getString(Ghatakdata.toUpperCase().replaceAll(" ", ""));; 
		               }
		             //tempstr = Ghatakdata;
		        }
		       Ghatakreturndata = tempstr;
		        
		        }
	return Ghatakreturndata;
}%>

