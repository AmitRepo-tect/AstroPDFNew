<%@page import="java.util.ArrayList"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.cslsoftware.varshphala.Varshphala"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<script language="JavaScript">

    function forwordMove() {
        var yy;
        yy = parseInt(document.Varshphal.ChangeYear.value);
        yy = yy + 1;
        document.Varshphal.ChangeYear.value = yy;
    }
    function backMove() {
        var yy;
        yy = document.Varshphal.ChangeYear.value;
        yy = yy - 1;
        if (yy > 0) {
            document.Varshphal.ChangeYear.value = yy;
        }
        else {
            alert("Invalid Value of Year !....")
        }
    }

</script>
<script language="JavaScript">

    function Validation(theform) {
        if (theform.ChangeYear.value == "") {
            alert("Please enter the correct year");
            theform.ChangeYear.focus();
            return (false);
        }

        var checkOK = "0123456789-!";
        var checkStr = theform.ChangeYear.value;
        var allValid = true;
        var decPoints = 0;
        var allNum = "";
        for (i = 0; i < checkStr.length; i++) {
            ch = checkStr.charAt(i);
            for (j = 0; j < checkOK.length; j++)
                if (ch == checkOK.charAt(j))
                break;
            if (j == checkOK.length) {
                allValid = false;
                break;
            }
            if (ch != ",")
                allNum += ch;
        }
        if (!allValid) {
            alert("Please enter only digit characters in the Year field.");
            theform.ChangeYear.focus();
            return (false);
        }

        return (true);
    }

</script>

<%
Local local = new Local();
Hindi hindi = new Hindi();
Util utl = new Util();
DesktopHoroDllFunction dsk = new DesktopHoroDllFunction();
SharedFunction shr = new SharedFunction();
int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle varshphalallpages = local.loadPropertiesFileNew("varshphalallpages",languageCode);
MyResourceBundle svkVarshShods = local.loadPropertiesFileNew("svklagna-varshphalallpages-shodascharts",languageCode);
MyResourceBundle shodsWesternVarshKp = local.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday",languageCode);
MyResourceBundle birthVarsh = local.loadPropertiesFileNew("birthdetails-varshphalallpages",languageCode);
%>
 <div class="hdg-lg card">
	<h1><%=rBConstants.getString("VARSHAPHAL") %> &nbsp;<%=varshphalallpages.getString("DETAILS")%></h1>	
</div>




<%
//************* find day of birth according Sun rise
String Splitval= "";
if(languageCode== 1){
    Splitval = ":" ;  
}
if(languageCode == 0 || session.getAttribute("languageCode").equals("") || languageCode == 2  || languageCode == 4 || languageCode== 5 || languageCode == 6 || languageCode == 7 || languageCode == 8 || languageCode == 9 || languageCode == 10) {
    Splitval = "." ;
}


DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");

if(languageCode==1){
    myAstrologyObject.setLanguageCode("1");
}
else {
    myAstrologyObject.setLanguageCode("0");
}
    
myAstrologyObject.initialize();
Varshphala objVarshPhal = new Varshphala();

if(request.getParameter("ChangeYear")!=null && !request.getParameter("ChangeYear").equals("")){
request.getSession().setAttribute("tt",request.getParameter("ChangeYear"));
}

int myvalue = 0,currYear=0;
if(session.getAttribute("tt")!=null && !session.getAttribute("tt").equals("0")){
    myvalue=Integer.parseInt(String.valueOf(session.getAttribute("tt")));
}else{
    myvalue=Calendar.getInstance().get(Calendar.YEAR);
}   
//System.out.println(myvalue+","+request.getParameter("ChangeYear"));
myvalue = myvalue - Integer.parseInt(String.valueOf(myAstrologyObject.getYearOfBirth()));          
currYear=myvalue + myAstrologyObject.getYearOfBirth();


%>
 <%
 initializeVarshPhal(myvalue, myAstrologyObject.getYearOfBirth(),myAstrologyObject,objVarshPhal,languageCode);
	      
 int intJD = Integer.parseInt(String.valueOf(objVarshPhal.calculateJdForVarshphal()));
 int intVarshYear = objVarshPhal.getVarshphalYear();
 //out.println(intVarshYear+","+intJD);
 int[] arrVarshPhal = objVarshPhal.getVarshphal(intVarshYear, intJD);
 objVarshPhal.initializeForBirthTime();
 objVarshPhal.initializeForVarshphala();
 objVarshPhal.calculateMuntha();
 objVarshPhal.calculateOpeningDasa();

 	   
	       	//*************calling methods before state of objects get changed to Varshparvesh time 28/03/03**********
	       	int munthaInBhav = objVarshPhal.getMunthaInBhav();
	           int intMunthaNo = objVarshPhal.getMuntha();
	       	//out.println(munthaInBhav+","+intMunthaNo);
	       	String strMuntheshName = objVarshPhal.getMunthesh();
	       	
	       	//*************calling methods before state of objects get changed to Varshparvesh time 28/03/03**********
	       			double[] arrSahamValue = objVarshPhal.getSahamvalue();
	       			
	       			//if(langCode == 1) {
	       			//   objVarshPhal.setLanguageCode(String.valueOf(langCode));
	       			//}
	       			//objVarshPhal.setLanguageCode("0");
	       			int[] arrPlanetsShodashvarga = objVarshPhal.getPositionForShodasvarg(0);
	       			//out.println(arrPlanetsShodashvarga[0]);
           //-------------------Code of Varshphal Chart----------------
          
            int[] RaashiNoCorrespondingToPlanets1 =  new int[13];
            int[] tempraashi =  new int[13];
            int[] myRashi =  new int[13];
            for(int k = 0 ;k<= 12;k++){
                RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
            }
            int raashiNo[] = SharedFunction.getRaashi(RaashiNoCorrespondingToPlanets1[0]);  
            //out.println(raashiNo[0]+","+raashiNo[1]+","+RaashiNoCorrespondingToPlanets1[0]);
            int count=0;
            for(int i=0 ;i<= 12;i++){
            	//out.println(raashiNo[i]+"<br/>");
                if(raashiNo[i]>=1){
                    tempraashi[count]=raashiNo[i];
                    count=count+1;
                }
            }
            
            int mycount=count;
            int mycount2=count;
           // out.println(raashiNo.length);
            for(int i=0 ;i<= mycount-1;i++){
                tempraashi[mycount2]=raashiNo[i];  
                //out.println(tempraashi[mycount2]+"<br/>"); 
            }
            for(int i=0 ;i<= 11;i++){
                myRashi[i+1]=tempraashi[i]+1;
               // out.println( myRashi[1]+"<br/>");
                
            }
           // out.println( myRashi[0]+","+myRashi[1]+"<br/>");
            //--------Code To Draw the Planets----------
            int[] planetno =  new int[13];
            for(int i=1;i<= 12;i++){
                planetno[i-1]=RaashiNoCorrespondingToPlanets1[i];
            }
             int detect=tempraashi[0]-1;
            for(int  i=0 ;i<= 11;i++){
               planetno[i]=planetno[i]-detect;
               if(planetno[i]<=0) {
                  planetno[i]=planetno[i]+12;
               }
              // response.Write planetno(i)&","
            }	  
            %>
            
            <div class="row mrt-30">
<div class="col s12 l12">
<div class="card padding-all hdg-content justify">

<form name="Varshphal" method="Get" action="varshphalallpages.asp" onsubmit="return Validation(this)" id="form1">
<div class="row mrt-30">
<div class="col s4 l2">
<input type="button" value="&lt;&lt;" name="butYearNavigation1" onclick="backMove()" class="btn amber darken-4 waves-effect waves-light">
</div>
<div class="col s4 l8">
<input name="ChangeYear" size="20" value="<%=currYear%>">
</div>
<div class="col s4 l2">
<input type="button" value="&gt;&gt;" name="butYearNavigation2" onclick="forwordMove()" class="btn amber darken-4 waves-effect waves-light right">
</div>
</div>
<div align="center">  <button class="btn amber darken-4 waves-effect waves-light" type="Submit" name="Submit" value=""> <%=rBConstants.getString("CHANGE_YEAR")%></button></div>
</form>
</div>
</div>
</div>






<div class="row mrt-30"> 
  <div class="col s12 l12">  
  <div class="card table-panel"> <h4 class="vd-hdg br-amber-b amber lighten-5"> <%=rBConstants.getString("VARSHAPHAL") %> &nbsp;<%=rBConstants.getString("YEA") %> &nbsp;<%=currYear%></h4> 
   <%          
//if(!myvalue.equals("")) {   
	if(myvalue!=0) {   
  //  Call InitializeVarshPhal(CInt(myValue), myAstrologyObject.getYearOfBirth)
}
String[] myarray = new String[24];
String[] myArrayJnm =new String[24];
String[] myArrayVarsh =new String[24];
 printDetailsHeadingsVarshaPhala(myarray,rBConstants,birthVarsh,varshphalallpages);
 printDetailsHeadingsVarshaPhalaJnm(myAstrologyObject, myArrayJnm, hindi, rBConstants, local, dsk, languageCode,shr,Splitval,birthVarsh);
printDetailsHeadingsVarshaPhalaYr(objVarshPhal,myArrayVarsh,rBConstants,hindi,languageCode,local,dsk,shr, birthVarsh);
%>
			
			<table class="highlight striped bordered ui-table ui-font">
			<thead>
			 <tr>
        <th class="cellhead"><%=varshphalallpages.getString("JANAM") %></th>
        <th class="cellhead">&nbsp;</th>
        <th class="cellhead"><%=varshphalallpages.getString("VARSHA") %></th>
    </tr>
    </thead>
    <tbody>
    <% for(int i=0 ;i<= 23;i++){ %>
   
        <tr>
            <td class="cellcontent"><%=myArrayJnm[i]%>&nbsp;</td>
            <td class="cellcontent"><%=myarray[i]%>&nbsp;</td>
            <td class="cellcontent"><%=myArrayVarsh[i]%>&nbsp;</td>
        </tr>
        
    <% }%>
    </tbody>
			</table>
			</div>
			</div>
			</div>


<%@include file='ui-control/ad-content-area.jsp'%>


<div class="row mrt-30"> 
  <div class="col s12 l12">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5"> <%=varshphalallpages.getString("VARSHAPHAL_CHART_TABLE") %></h4>
  
  <h3 class="font-size" align="center"><%=varshphalallpages.getString("VARSHAPHAL_CHART") %></h3>
  <%//******************Canvas Chart'************************************** %>
             <div id="chartText"></div>
             <div align="center">
             <canvas id="CanvasChartVarP" width="600px" height="400px" class="responsive-canvas-m"></canvas>
             <script language="JavaScript" type="text/javascript">

             LanguageCode = <%=session.getAttribute("languageCode")%>;
             if (LanguageCode=="")
              {
             LanguageCode =0;
              }
             var textcolor = COLOR_INFO;

            if(<%=session.getAttribute("chartType")%> =="0"){
            chartpref = "north";
            }
          else{
          chartpref = "south";
           }
          if(window.HTMLCanvasElement) {
          var c=document.getElementById("CanvasChartVarP");
          var cxt = c.getContext("2d");
          cxt.strokeStyle = "#f96d06";
          Chart_Type = '<%=session.getAttribute("chartType") %>'; 
      <%
      String mySyn= "";
      for(int i = 1; i<= 12;i++){
      if(i==12) {
      mySyn = mySyn + planetno[i-1];  
      }else{
      mySyn = mySyn + planetno[i-1] + ","; 
      }
      }

     mySyn = myRashi[12]+","+mySyn;
     out.println("arrPlanets = new Array(" + mySyn + ");"); //(Asc, sun,moon,....pl)
     out.println("lagna = " + myRashi[12]+";");  //(lagna

%>
    x1_canvas= 80;//10+40;
    y1_canvas= 10;
    x2_canvas= 520;//320+75;
    y2_canvas= 380;//300-20;
    SetFontSize(14);    
 
    PrintChartOthers(x1_canvas-5, y1_canvas, x2_canvas, y2_canvas, arrPlanets,lagna, Chart_Type, LanguageCode,true);  
      myval="";

          }  
else {
   $('#CanvasChartVarP').hide();
   $('#tb').hide();
    $('#td1').hide();
    myval = '<div align=center class="ui-canvas-text">Please upgrade your browser!</div>';
}
</script>
<script language="JavaScript" type="text/javascript">
    $("#chartText").append(myval);
</script>
</div>
  </div>
  </div>
  </div>
  
  

  



             <%   
            
            //-----------------------------------------------------------%>
             
<%
			
	        String[] arrHeading= new String[3];
            String[] myPlanetNames =  new String[13];
            String[] myArray1 =  new String[13];
            String[] myArray2 =  new String[13];
	        arrHeading[0]=rBConstants.getString("PLANETS");
	        arrHeading[1]=rBConstants.getString("RASHI");
	        arrHeading[2]=rBConstants.getString("LONGITUDE");	       	        
	        myPlanetNames[0]=rBConstants.getString("LAGNA");
	        myPlanetNames[1]=rBConstants.getString("SUN");
	        myPlanetNames[2]=rBConstants.getString("MOON");
	        myPlanetNames[3]=rBConstants.getString("MARS");
	        myPlanetNames[4]=rBConstants.getString("MERCURY");
	        myPlanetNames[5]=rBConstants.getString("JUPITER");
	        myPlanetNames[6]=rBConstants.getString("VENUS");
	        myPlanetNames[7]=rBConstants.getString("SATURN");
	        myPlanetNames[8]=rBConstants.getString("RAHU");
	        myPlanetNames[9]=rBConstants.getString("KETU");
	        myPlanetNames[10]=shodsWesternVarshKp.getString("URANUS") ;    
	        myPlanetNames[11]=shodsWesternVarshKp.getString("NEPTUNE");
	        myPlanetNames[12]=shodsWesternVarshKp.getString("PLUTO");
	        objVarshPhal.setLanguageCode("0");
            objVarshPhal.initialize();    
            for(int i = 1 ;i<= 13;i++){
               if(i == 1) {
            	   String z = objVarshPhal.getLagnaSign();
               
                    myArray1[i - 1] = rBConstants.getString((z+"_full").toUpperCase());
               }else{
            	   String z = objVarshPhal.getPlanetaryRasiName(i - 1);
               
                    myArray1[i - 1] = rBConstants.getString((z+"_full").toUpperCase());
               }
            }
            //objVarshPhal.setLanguageCode("0");
            //objVarshPhal.initialize();    
            for(int i = 1 ;i<= 13;i++){
                if(i == 1) {
                    myArray2[i - 1] =(objVarshPhal.getAscendentDms()).substring(1,objVarshPhal.getAscendentDms().length());// Mid(objVarshPhal.getAscendentDms, 2, Len(objVarshPhal.getAscendentDms))
                }else{
                    myArray2[i - 1] =objVarshPhal.getPlanetaryRasiDms(i - 1).substring(1,objVarshPhal.getPlanetaryRasiDms(i - 1).length());// Mid(objVarshPhal.getPlanetaryRasiDms(i - 1), 2, Len(objVarshPhal.getPlanetaryRasiDms(i - 1)))
                }
            }
            String x = "0";
            if(languageCode == 1)
            	x = "1";
            objVarshPhal.setLanguageCode(x);
            objVarshPhal.initialize(); 
            %>
           
  <div class="row mrt-30"> 
  <div class="col s12 l12">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5 text-left"> <%=varshphalallpages.getString("VARSHAPHAL_TABLE") %></h4>
  <table class="highlight striped bordered ui-table ui-font">
  <thead>
                    <tr>
                        <th class="cellhead">
                            <%=arrHeading[0]%></b>&nbsp;
                        </th>
                        <th class="cellhead">
                            <%=arrHeading[1]%></b>&nbsp;
                        </th>
                        <th class="cellhead">
                            <%=arrHeading[2]%></b>&nbsp;
                        </th>
                    </tr>
                    </thead>
                    <% for(int i=0 ;i<= 12;i++){ %>
                    <tr>
                        <td class="cellcontent">
                            <%=myPlanetNames[i]%>&nbsp;
                        </td>
                        <td class="cellcontent">
                            <%=myArray1[i]%>&nbsp;
                        </td>
                        <td class="cellcontent">
                            <%=myArray2[i]%>&nbsp;
                        </td>
                    </tr>
                    <%} %>
                </table>
                <% intMunthaNo = objVarshPhal.getMunthaInBhav(); %>
                
                <%
                CloudDAO CD = new CloudDAO();
		        //Dim RsMuntha,strSqlMuntha,getMunthaPrediction		
		       String getMunthaPrediction = CD.getMunthaPredictionRegional(intMunthaNo, languageCode,null);;//GetMunthaPredictionRegional(intMunthaNo, session("languagecode"))
		      
                %>
                <br>
  </div>
  </div>
  </div>
  
    <div class="row mrt-30"> 
  <div class="col s12 l12">  
  <div class="card ui-paragraph-head padding-all"> 
  <h5> <%=varshphalallpages.getString("MUNTHA") %> : <%=munthaInBhav%>&nbsp;
                            <%=rBConstants.getString("BHAV")%></h5>
                            <p><%=hindi.unicode(getMunthaPrediction,languageCode)%></p>

  </div>
  </div>
  </div>
          
            <div class="row mrt-30"> 
  <div class="col s12 l12">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5 text-left"> <%=rBConstants.getString("VARSHAPHAL") %>&nbsp; <%=varshphalallpages.getString("SAHAM")%></h4>
  <table class="highlight striped bordered ui-table ui-font">
          <%	  
	                        String[] arrSahamName = new String[23];
                            arrSahamName[0]=varshphalallpages.getString("PUNYA");
                            arrSahamName[1]=svkVarshShods.getString("EDUCATION");
                            arrSahamName[2]=varshphalallpages.getString("POPULARITY_FAME");
                            arrSahamName[3]=rBConstants.getString("FRIENDS");
                            arrSahamName[4]=varshphalallpages.getString("FATHER");
                            arrSahamName[5]=varshphalallpages.getString("MOTHER");
                            arrSahamName[6]=varshphalallpages.getString("LIFE");
                            arrSahamName[7]=varshphalallpages.getString("KARNA");
                            arrSahamName[8]=varshphalallpages.getString("DEATH");
                            arrSahamName[9]=varshphalallpages.getString("FOREIGN_TRAVELS");
                            arrSahamName[10]=svkVarshShods.getString("WEALTH");
                            arrSahamName[11]=varshphalallpages.getString("ADULTERY");
                            arrSahamName[12]=varshphalallpages.getString("DISEASE");
                            arrSahamName[13]=varshphalallpages.getString("ALTERNATE_VOCATION");
                            arrSahamName[14]=varshphalallpages.getString("TRADE");
                            arrSahamName[15]=varshphalallpages.getString("KARYA_SIDDHI");
                            arrSahamName[16]=varshphalallpages.getString("MARRIAGE");
                            arrSahamName[17]=varshphalallpages.getString("PROGENY");
                            arrSahamName[18]=rBConstants.getString("LOVE");
                            arrSahamName[19]=varshphalallpages.getString("BUSINESS");
                            arrSahamName[20]=varshphalallpages.getString("FOES");
                            arrSahamName[21]=varshphalallpages.getString("IMPRISONMENT");
                            arrSahamName[22]=varshphalallpages.getString("FINANCIAL_GAINS");
     
                        %>
                       <thead>
                            <tr>
                                <th class="cellhead">
                                    <%=varshphalallpages.getString("SAHAM")%>
                                </th>
                                <th colspan="2" class="cellhead">
                                    <%=rBConstants.getString("DEGREE")%>
                                </th>
                                <th class="cellhead">
                                    <%=rBConstants.getString("PLANETS")%>
                                </th>
                            </tr>
                            </thead>
                            <%  
                            double tmpSahamVal=0.0;
                            String[] arrSahamRasiAndRasilordAndItsDegree = new String[24] ;
	                        for(int  ij = 0 ;ij<= 22;ij++){
	                            tmpSahamVal = arrSahamValue[ij];
		                        arrSahamRasiAndRasilordAndItsDegree = objVarshPhal.getRasiAndRasilordAndItsDegree(tmpSahamVal);
		                       // out.println(arrSahamRasiAndRasilordAndItsDegree[0]);
		                    %>
                            <tr>
                                <td class="cellcontent">
                                    <%=arrSahamName[ij]%>
                                </td>
                                <td class="cellcontent">
                                    <%=hindi.unicode(arrSahamRasiAndRasilordAndItsDegree[0],languageCode)%>
                                </td>                                
                                <td class="cellcontent">
                                    <%=local.correctSeperatorDot(arrSahamRasiAndRasilordAndItsDegree[1])%>
                                </td>                                
                                <td class="cellcontent">
                                    <%=hindi.unicode(arrSahamRasiAndRasilordAndItsDegree[2],languageCode)%>
                                </td>
                            </tr>
                            <% tmpSahamVal = 0;%>
                            <%}%>
                     
         </table>
         </div>
         </div>
         </div>       
                      
                 <div class="row mrt-30"> 
  <div class="col s12 l12">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5 text-left"> <%=varshphalallpages.getString("MUDDA")%> &nbsp;<%=rBConstants.getString("VIMSHOTTARI_DASHA")%></h4>
  <table class="highlight striped bordered ui-table ui-font">
   <%
                      
                        //initializeVarshPhal(myvalue, myAstrologyObject.getYearOfBirth(), myAstrologyObject, objVarshPhal, languageCode);
                        objVarshPhal.setLanguageCode("0");
                        objVarshPhal.initialize();
                         String[] strDashaSpan3 = objVarshPhal.calculateIstLevelMuddaVimshottari();
                         String[] strDashaSpan = new String[strDashaSpan3.length];
	                     for(int v=0;v<strDashaSpan3.length;v++)
	                     {
	                        String str = strDashaSpan3[v].replaceAll("@", "/");
	                        strDashaSpan[v] = str;
	                     }
	                     
	                     int[] arrDasaSeries = objVarshPhal.calculateDasaSeries();
	                    // out.println(arrDasaSeries[0]+","+myAstrologyObject.getYearOfBirth()+","+myvalue+","+"<br/");
                         int intYearDashaStart = arrVarshPhal[0];
                         int intMonthDashaStart = arrVarshPhal[1];
                         int intDayDashaStart = arrVarshPhal[2];
                         String strDate = intDayDashaStart + "/" + intMonthDashaStart + "/" + intYearDashaStart;
                        int intPlanetPosition=0;
                        int intDashaSeries=0;
                        String[]  arrPlanetName = new String[9];
                        for(int IntDasha = 0 ;IntDasha<= 8;IntDasha++){
                            intPlanetPosition = arrDasaSeries[IntDasha];
                            intDashaSeries = fnGetDashSeries(intPlanetPosition);                    
                            arrPlanetName[IntDasha] = fngetVarshaphalPlanetName(intDashaSeries);
                           // out.println(intPlanetPosition+","+intDashaSeries+"<br/>");
                        }				
					   String str1 = strDashaSpan[0].substring(0,2)+"/";//Left(strDashaSpan(0), 2) & "/"
					   str1 = str1 +strDashaSpan[0].substring(3,5)+"/";// Mid(strDashaSpan(0), 4, 2) & "/"
					   str1 = str1 + strDashaSpan[0].substring(6,strDashaSpan[0].length());//Right(strDashaSpan(0), 2)
					  // int  tempDateDiff= 2;//DateDiff("d", strDate, str1)
					    int[] DayDifference = new int[9];
				        for(int CIntDasha = 0; CIntDasha<=7;CIntDasha++){
                          String  str2 = strDashaSpan[CIntDasha].substring(0,2)+"/";//Left(strDashaSpan(CIntDasha), 2) & "/"
                          str2 = str2 + strDashaSpan[CIntDasha].substring(3,5)+"/";//str2 & Mid(strDashaSpan(CIntDasha), 4, 2) & "/"
                          str2 = str2 +strDashaSpan[CIntDasha].substring(6,strDashaSpan[CIntDasha].length());// Right(strDashaSpan(CIntDasha), 2)

                          String  str3 = strDashaSpan[CIntDasha + 1].substring(0,2)+"/";//Left(strDashaSpan(CIntDasha + 1), 2) & "/"
                          str3 = str3 + strDashaSpan[CIntDasha + 1].substring(3,5)+"/";//Mid(strDashaSpan(CIntDasha + 1), 4, 2) & "/"
                          str3 = str3 + strDashaSpan[CIntDasha + 1].substring(6,strDashaSpan[CIntDasha + 1].length());//Right(strDashaSpan(CIntDasha + 1), 2)

                           // DayDifference[CIntDasha] = 3;// DateDiff("d", str2, str3)
				        }
                       
                        %>
                        
                         <thead>
                            <tr>
                                <th class="cellhead">
                                    <%=rBConstants.getString("PLANETS") %>
                                </th>                                
                                <th class="cellhead">
                                    <%=varshphalallpages.getString("FROM")%>
                                </th>
                                <th class="cellhead">
                                    <%=varshphalallpages.getString("T")%>
                                </th>
                            </tr>
                            </thead>
                            <tr>
                                <td class="cellcontent">
                                    <%=rBConstants.getString((arrPlanetName[0].toUpperCase()))%>
                                </td>                                
                                <td class="cellcontent">
                                    <%=strDate%>
                                </td>
                                <td class="cellcontent">
                                    <%=strDashaSpan[0]%>
                                </td>
                            </tr>
                            <tr>
                                <td class="cellcontent">
                                    <%=rBConstants.getString(arrPlanetName[1].toUpperCase())%>
                                </td>                                
                                <td class="cellcontent">
                                    <%=strDashaSpan[0]%>
                                </td>
                                <td class="cellcontent">
                                    <%=strDashaSpan[1]%>
                                </td>
                            </tr>
                            <%for(int i=2 ;i<= 8;i++){ %>
                            <tr>
                                <td class="cellcontent">
                                    <%=rBConstants.getString((arrPlanetName[i].toUpperCase()))%>
                                </td>                                
                                <td class="cellcontent">
                                    <%=strDashaSpan[i-1]%>
                                </td>
                                <td class="cellcontent">
                                    <%=strDashaSpan[i]%>
                                </td>
                            </tr>
                            <%}%>
                        
  </table>
  </div>
  </div>
  </div>
  
                   <div class="row mrt-30"> 
  <div class="col s12 l6">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5 text-left"> <%=varshphalallpages.getString("PANCHADIKARI")%></h4>
  <table class="highlight striped bordered ui-table ui-font">
  <%
	                                   // Dim arrHeadingsPanchadhikari,arr1Planet
		
                                        String[] arrHeadingsPanchadhikari =  new String[6];
                                        String[] arr1Planet = new String[6];
                                        arrHeadingsPanchadhikari[0]= varshphalallpages.getString("MUNTHA")+" "+rBConstants.getString("LORD");
                                        arrHeadingsPanchadhikari[1]= rBConstants.getString("BIRTH")+" "+rBConstants.getString("ASCENDANT")+"&nbsp;"+rBConstants.getString("LORD");
                                        arrHeadingsPanchadhikari[2]= rBConstants.getString("YEA") +" "+rBConstants.getString("ASCENDANT")+"&nbsp;"+rBConstants.getString("LORD");
                                        arrHeadingsPanchadhikari[3]= varshphalallpages.getString("TRIRASHI")+" "+rBConstants.getString("LORD");
                                        arrHeadingsPanchadhikari[4]= varshphalallpages.getString("DINRATRI")+" "+rBConstants.getString("LORD");
                                    	 
	                                    arr1Planet[0] = objVarshPhal.getMunthesh();
	                                    arr1Planet[1] = objVarshPhal.getBirthAscendentLord();
	                                    arr1Planet[2] = objVarshPhal.getVarshAscendentLord();
	                                    arr1Planet[3] = objVarshPhal.getTriRashiPati();
	                                    arr1Planet[4] = objVarshPhal.getDinRatriPati();
                                        %>
                               
                                        <thead>
                                            <tr>
                                                <th class="cellhead" width="60%">
                                                    <%=rBConstants.getString("LORD")%>
                                                </th>
                                                <th class="cellhead" width="40%">
                                                    <%=rBConstants.getString("PLANETS")%>
                                                </th>
                                            </tr>
                                            </thead>
                                            <% for(int i=0 ;i<= 4;i++){ %>
                                            <tr>
                                                <td class="cellcontent">
                                                    <%=arrHeadingsPanchadhikari[i]%>
                                                </td>
                                                <td class="cellcontent">
                                                    <%=rBConstants.getString((arr1Planet[i].toUpperCase()))%>
                                                </td>
                                            </tr>
                                            <% } %>
                                        
  </table>
  </div>
  </div>
  <div class="col s12 l6">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5 text-left"><%=varshphalallpages.getString("VARSH") %> &nbsp;<%=varshphalallpages.getString("DETAILS")%></h4>
  <table class="highlight striped bordered ui-table ui-font">
  <% 
                                        // Dim arrValue,arrHeadingVarsh
                                        // Redim arrValue(4),arrHeadingVarsh(4)	  
                                        String[] arrValue = new String[5];
                                        String[] arrHeadingVarsh = new String[5];
                                         arrValue[0] = objVarshPhal.getVarshparveshDate();
                                         arrValue[1] = objVarshPhal.getVarshparveshTimeHms().replace(".",":");
                                         arrValue[2] = rBConstants.getString((objVarshPhal.getMunthaName()+"_full").toUpperCase());
                                         arrValue[3] = String.valueOf(objVarshPhal.getMunthaInBhav());
                                         arrValue[4] = String.valueOf(objVarshPhal.getMunthaInBhavForBirthChart());
                                         arrHeadingVarsh[0]=varshphalallpages.getString("VARSHPRAVESH")+" "+rBConstants.getString("DATAM");
                                         arrHeadingVarsh[1]=varshphalallpages.getString("VARSHPRAVESH")+" "+rBConstants.getString("TIMAR");
                                         arrHeadingVarsh[2]=varshphalallpages.getString("MUNTHA")+" "+rBConstants.getString("RASHI");
                                         arrHeadingVarsh[3]=varshphalallpages.getString("MUNTHA_IN_HOUSE");
                                         arrHeadingVarsh[4]=varshphalallpages.getString("MUNTHA_IN_BIRTH_CHART");
                                        %>
                                        
                                       
                                       <thead>
                                            <tr>
                                                <th class="cellhead" width="60%">
                                                   <%=varshphalallpages.getString("HEAD")%>
                                                </th>
                                                <th class="cellhead" width="40%">
                                                    <%=varshphalallpages.getString("DETAILS")%>
                                                </th>
                                            </tr>
                                            </thead>
                                            <% for(int i=0 ;i<= 4;i++){ %>
                                            <tr>
                                                <td class="cellcontent">
                                                    <%=arrHeadingVarsh[i]%>
                                                </td>
                                                <td class="cellcontent">
                                                    <%=arrValue[i]%>
                                                </td>
                                            </tr>
                                            <%}%>
                                        
  </table>
  </div>
  </div>
  </div>
  
  
  <div class="row mrt-30">
  <div class="col s12 l12">  
  <div class="card table-panel"> 
  <h4 class="vd-hdg br-amber-b amber lighten-5 text-left"> <%=varshphalallpages.getString("MUDDA") %> &nbsp;<%=rBConstants.getString("YOGINI_DASHA") %></h4>
  <table class="highlight striped bordered ui-table ui-font">
  
   <% 
       String[] arrYoginiDashaSpan1 = objVarshPhal.calculateIstLevelMuddaYoginiDasa();
       String[] arrYoginiDashaSpan = new String[arrYoginiDashaSpan1.length];
	    for(int v=0;v<arrYoginiDashaSpan1.length;v++)
	    {
	       String str = arrYoginiDashaSpan1[v].replaceAll("@", "/");
	       arrYoginiDashaSpan[v] = str;
	    }                         
       String[] yoginilordname = objVarshPhal.getYoginiLordName();
       String[] arrYoginiName = objVarshPhal.getYoginiName(); 
      	//String str1 = "";	
      	 
        str1 = arrYoginiDashaSpan[0].substring(0,2)+"/";//Left(arrYoginiDashaSpan(0), 2) & "/"
        str1 = str1 +arrYoginiDashaSpan[0].substring(3,5)+"/";// Mid(arrYoginiDashaSpan(0), 4, 2) & "/"
        str1 = str1 + arrYoginiDashaSpan[0].substring(6,arrYoginiDashaSpan[0].length());//Right(arrYoginiDashaSpan(0), 2)
        //tempDateDiff = 4;//DateDiff("d", strDate, str1)	 
	   
	    //String DayDifference = new String[7];
        String str2="",str3="";
        for(int IntDasha = 0 ;IntDasha<= 6 ;IntDasha++){ //******7
            str2 = arrYoginiDashaSpan[IntDasha].substring(0,2)+"/";//Left(arrYoginiDashaSpan(IntDasha), 2) & "/"
            str2 = str2 + arrYoginiDashaSpan[IntDasha].substring(3,5)+"/";//Mid(arrYoginiDashaSpan(IntDasha), 4, 2) & "/"
            str2 = str2 + arrYoginiDashaSpan[IntDasha].substring(6,arrYoginiDashaSpan[IntDasha].length());// Right(arrYoginiDashaSpan(IntDasha), 2)
            str3 = arrYoginiDashaSpan[IntDasha + 1].substring(0,2)+"/";//Left(arrYoginiDashaSpan(IntDasha + 1), 2) & "/"
            str3 = str3 + arrYoginiDashaSpan[IntDasha + 1].substring(3,5)+"/";// Mid(arrYoginiDashaSpan(IntDasha + 1), 4, 2) & "/"
            str3 = str3 + arrYoginiDashaSpan[IntDasha + 1].substring(6,arrYoginiDashaSpan[IntDasha + 1].length());//Right(arrYoginiDashaSpan(IntDasha + 1), 2)
           // DayDifference[IntDasha] = 3;// DateDifference(str2, str3)
        }
        
        %>
         <thead>
                <tr>
                    <th class="cellhead">
                        <%=rBConstants.getString("DASHA") %>
                    </th>
                    <th class="cellhead">
                         <%=rBConstants.getString("PLANETS") %>
                    </th>                    
                    <th class="cellhead">
                        <%=varshphalallpages.getString("FROM")%>
                    </th>
                    <th class="cellhead">
                        <%=varshphalallpages.getString("T")%>
                    </th>
                </tr>
                </thead>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString(arrYoginiName[0].toUpperCase())%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[0].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=strDate%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[0]%>
                    </td>
                </tr>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString((arrYoginiName[1].toUpperCase()))%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[1].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[0]%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[1]%>
                    </td>
                </tr>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString((arrYoginiName[2]).toUpperCase())%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[2].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[1]%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[2]%>
                    </td>
                </tr>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString((arrYoginiName[3]).toUpperCase())%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[3].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[2]%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[3]%>
                    </td>
                </tr>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString((arrYoginiName[4]).toUpperCase())%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[4].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[3]%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[4]%>
                    </td>
                </tr>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString((arrYoginiName[5]).toUpperCase())%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[5].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[4]%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[5]%>
                    </td>
                </tr>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString((arrYoginiName[6]).toUpperCase())%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[6].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[5]%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[6]%>
                    </td>
                </tr>
                <tr>
                    <td class="cellcontent">
                        <%=rBConstants.getString((arrYoginiName[7]).toUpperCase())%>
                    </td>
                    <td class="cellcontent">
                        <%=rBConstants.getString(yoginilordname[7].toUpperCase())%>
                    </td>                    
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[6]%>
                    </td>
                    <td class="cellcontent">
                        <%=arrYoginiDashaSpan[7]%>
                    </td>
                </tr>
            </table>
  
  </div>
  </div>
  </div>
  

<div class="row mrt-30">
<div class="col s12 l12 hdg-content">

<h2 class="center">  <%=rBConstants.getString("VARSHAPHAL") %>&nbsp; <%=varshphalallpages.getString("PREDICTION") %>  </h2>
 <%
          
            int[] arrDashSeries = objVarshPhal.calculateDasaSeries();
             int  intAsc = arrPlanetsShodashvarga[0];
            String[] arrYearRange1 = objVarshPhal.calculateIstLevelMuddaVimshottari();
            String[] arrYearRange = new String[arrYearRange1.length];
            for(int v=0;v<arrYearRange1.length;v++)
            {
               String str = arrYearRange1[v].replaceAll("@", "/");
               arrYearRange[v] = str;
            }
           
           String strLimiter = "/";
           String  strLimiter2 = "-";
           int intLowerLimit = 1;
           int  intUpperLimit = 5;
           String strDashaSpan1 = intDayDashaStart + strLimiter + intMonthDashaStart + strLimiter + intYearDashaStart;
            %>
        <%		
	  //*****make Connection To Database
	  // Dim	rsPredictions,strPredictions
	  int[] arrPlanetInBhav =  new int[12];
	   for(int iCount = intLowerLimit ;iCount<= intUpperLimit;iCount++){ //1 To 9
		intPlanetPosition = arrDashSeries[iCount - 1];
		intDashaSeries = fnGetDashSeries(intPlanetPosition);
		intPlanetPosition = arrPlanetsShodashvarga[intDashaSeries];
	    arrPlanetInBhav[iCount] = getPlanetInBhava(intAsc, intPlanetPosition);
        String strDashaSpan2 = arrYearRange[iCount - 1];
		String strYearRange = strDashaSpan1 + strLimiter2 + strDashaSpan2;
		strDashaSpan1 = strDashaSpan2;

		String rsdata = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount], languageCode,null,hindi);//GetMuddaPredictionRegional(intDashaSeries, arrPlanetInBhav(iCount), session("languagecode"))
		 String strHeading1="",arrstartDate1="",arrEndDate1="",strHeading2="",strText="";
		String[] arrstartDate= new String[10];
		String[] arrEndDate= new String[10];
		if(!rsdata.equals("")) {
          String[] arrStartEnddate = strYearRange.split("-");//split(strYearRange,"-")

          arrstartDate = arrStartEnddate[0].split("/");//split(arrStartEnddate(0),"/")
          arrEndDate = arrStartEnddate[1].split("/");
          if(arrstartDate.length == 1)
          {
        	  arrstartDate = arrStartEnddate[0].split("@");//split(arrStartEnddate(0),"/")
          }
          if(arrEndDate.length == 1)
          {
        	  arrEndDate = arrStartEnddate[1].split("@");//split(arrStartEnddate(0),"/")
          }
            arrstartDate1 = utl.fullMonthName(Integer.parseInt(arrstartDate[1]), languageCode, rBConstants)+" "+arrstartDate[0]+", "+arrstartDate[2];//FullMonthName(arrstartDate[1])+" "+arrstartDate[0]+", "+arrstartDate[2];
            //split(arrStartEnddate(1),"/")
            arrEndDate1 = utl.fullMonthName(Integer.parseInt(arrEndDate[1]), languageCode, rBConstants)+" "+arrEndDate[0]+", "+arrEndDate[2];//FullMonthName(arrEndDate[1])+" "+arrEndDate[0]+", "+arrEndDate[2];
    		 
	        strHeading1 = arrstartDate1 +" - "+ arrEndDate1; 
	        String dashaPlanetName = rBConstants.getString(fngetVarshaphalPlanetName(intDashaSeries).toUpperCase());
		    strHeading1 = strHeading1+ "  " + rBConstants.getString("Dasha".toUpperCase())+ "  " + dashaPlanetName ;//strHeading1 + "  " + rBConstants.getString("Dasha").toUpperCase() + "  " + rBConstants.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase());
    		    		
		    strHeading2 = getStrHeading(languageCode, rBConstants) ;
		    strHeading2 = strHeading2.replaceAll("replaceableText", String.valueOf(arrPlanetInBhav[iCount]));
		    strHeading2 = strHeading2.replaceAll("dashaName", dashaPlanetName);
        
		    strText = rsdata;	
        %>
               
               <div class="card hdg-content mrt-20 padding-all">
                          <h2>  <%=strHeading1%> </h2> 
                    
                
                          <p><b>   <%=strHeading2%> </b> </p>
                                                    
                    
                   
                            <p>
                                <%=hindi.unicode(strText,languageCode)%></p>
                 

           </div>
           
            
                <% } %>
                <%}%>                
              
                      <% 
	 
        strLimiter = "/";
        strLimiter2 = "-"	;  
	 
	    intLowerLimit = 6;
	    intUpperLimit = 9;
	    strDashaSpan1 = arrYearRange[4]; %>
       <%
       String strDashaSpan2="",strYearRange="",rsdata1="",arrstartDateNew1="",arrEndDateNew1="",strHeadingNew="",strHeading1="";
       String strHeading2="";
       String[] arrStartEnddateNew = new String[10];
       String[] arrstartDateNew = new String[10];
       String[] arrEndDateNew = new String[10];
        //<!--#include virtual="/DbConnection.inc"-->      
	  //*****make Connection To Database	   
	   for(int iCount = intLowerLimit ;iCount<= intUpperLimit;iCount++){ //1 To 9
		intPlanetPosition = arrDashSeries[iCount - 1];
		intDashaSeries = fnGetDashSeries(intPlanetPosition);
		intPlanetPosition = arrPlanetsShodashvarga[intDashaSeries];
		arrPlanetInBhav[iCount] = getPlanetInBhava(intAsc, intPlanetPosition);
		strDashaSpan2 = arrYearRange[iCount - 1];
		strYearRange = strDashaSpan1 + strLimiter2 + strDashaSpan2;
		strDashaSpan1 = strDashaSpan2;
        rsdata1 = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount], languageCode,null,hindi);;//GetMuddaPredictionRegional(intDashaSeries, arrPlanetInBhav(iCount), session("languagecode"))
        	   	    
		if(!rsdata1.equals("")) {
		    arrStartEnddateNew = strYearRange.split("-");//(strYearRange,"-")
            arrstartDateNew = arrStartEnddateNew[0].split("/");//(arrStartEnddateNew(0),"/")
            //System.out.println(Integer.parseInt(arrstartDateNew[1]));
            arrstartDateNew1 = utl.fullMonthName(Integer.parseInt(arrstartDateNew[1]),languageCode,rBConstants)+" "+arrstartDateNew[0]+", "+arrstartDateNew[2];//FullMonthName(arrstartDateNew(1))&" "&arrstartDateNew(0)&", "&arrstartDateNew(2)
            arrEndDateNew = arrStartEnddateNew[1].split("/");//split(arrStartEnddateNew(1),"/")
            arrEndDateNew1 =utl.fullMonthName(Integer.parseInt(arrEndDateNew[1]),languageCode,rBConstants)+" "+arrEndDateNew[0]+", "+arrEndDateNew[2];//FullMonthName(arrEndDateNew(1))&" "&arrEndDateNew(0)&", "&arrEndDateNew(2)
            strHeadingNew = arrstartDateNew1 +" - "+ arrEndDateNew1;
		
            String dashaPlanetName = rBConstants.getString(fngetVarshaphalPlanetName(intDashaSeries).toUpperCase());
            
		    strHeading1 = strHeadingNew + "  " + rBConstants.getString(("DASHA").toUpperCase()) + "  " + dashaPlanetName;
		    /*strHeading2 = rBConstants.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase()) + "  " + rBConstants.getString("IS_IN")
		    + "  " + varshphalallpages.getString("BHAV_NUMBER")+ " " +arrPlanetInBhav[iCount] + " " + varshphalallpages.getString("EXTRAFORHINDI");*/
            String strText = rsdata1;;
            strHeading2 = getStrHeading(languageCode, rBConstants) ;
		    strHeading2 = strHeading2.replaceAll("replaceableText", String.valueOf(arrPlanetInBhav[iCount]));
		    strHeading2 = strHeading2.replaceAll("dashaName", dashaPlanetName);
        %>
        

 <div class="card hdg-content mrt-20 padding-all">
               <h2> <%=strHeading1%> </h2>  
           
            <p>
                  <b>  <%=strHeading2%> </b></p>  
            
           
                    <p>
                        <%=hindi.unicode(strText,languageCode)%></p>
             
             
      </div>
      
      
      
        <%} %>
        <%}%>
          
       

</div>
</div>



<%!

//*********Function For Dasha Series********	  
public int  fnGetDashSeries(int intNo) {
int getDashSeries = 0;
switch(intNo){
case 1:
	  getDashSeries = 1;
break;
case 2:
	  getDashSeries = 2;
break;
case 3:
	  getDashSeries = 3;
break;
case 4:
	  getDashSeries = 8;
break;
case 5:
	  getDashSeries = 5;
break;
case 6:
	  getDashSeries = 7;
break;
case 7:
	  getDashSeries = 4;
break;
case 8:
	  getDashSeries = 9;
break;
case 0:
	  getDashSeries = 6;
break;
}
return(getDashSeries);
}

//****************Code
public String  fngetVarshaphalPlanetName(int intNo){
String planetName="";
String[] arrPlanetName = new String[10];
arrPlanetName[1] ="Sun";
arrPlanetName[2] ="Moon";
arrPlanetName[3] ="Mars";
arrPlanetName[4] ="Mer";
arrPlanetName[5] = "Jupiter";
arrPlanetName[6] ="Venus";
arrPlanetName[7] ="Saturn";
arrPlanetName[8] ="Rahu";
arrPlanetName[9] ="Ketu";

switch(intNo){
case 1:
	  planetName = arrPlanetName[1];
	  break;
case 2:
	  planetName = arrPlanetName[2];
	  break;
case 3:
	  planetName = arrPlanetName[3];
	  break;
case 4:
	  planetName = arrPlanetName[4];
	  break;
case 5:
	  planetName = arrPlanetName[5];
	  break;
case 6:
	  planetName = arrPlanetName[6];
	  break;
case 7:
	  planetName = arrPlanetName[7];
	  break;
case 8:
	  planetName = arrPlanetName[8];
	  break;
case 9:
	  planetName = arrPlanetName[9];
	  break;
}
return(planetName);
}

//************Function For getPlanetInBhav*********
public int getPlanetInBhava(int AscendentPosition ,int  planetPosition ) {
int tempBhava=0; 
tempBhava = planetPosition - AscendentPosition + 1;
if(tempBhava <= 0){  tempBhava = tempBhava + 12;}
return(tempBhava);
}


public String[] printDetailsHeadingsVarshaPhala(String[] myArray,MyProperties rBConstants,MyResourceBundle birthVarsh,MyResourceBundle varshphalallpages)
{
//Dim strString
//ReDim myArray(23)
myArray[0] = birthVarsh.getString("SEX_MF");
myArray[1] = rBConstants.getString("DATE_OF_BIRTH");
myArray[2] = rBConstants.getString("TIME_OF_BIRTH");
myArray[3] = birthVarsh.getString("DAY_OF_BIRTH");
myArray[4] = rBConstants.getString("PLACE_OF_BIRTH");
myArray[5] = birthVarsh.getString("BIRTH_COUNTRY");
myArray[6] = rBConstants.getString("LATITUDE");
myArray[7] = rBConstants.getString("LONGITUDE");
myArray[8] = birthVarsh.getString("LOCAL_TIME_CORRECTION");
myArray[9] = birthVarsh.getString("WAR_TIME_CORRECTION");
myArray[10] = birthVarsh.getString("LMT_AT_BIRTH");
myArray[11] = birthVarsh.getString("SUNRISE");
myArray[12] = birthVarsh.getString("SUNSET");
myArray[13] = rBConstants.getString("LAGNA");
myArray[14] = varshphalallpages.getString("LAGNALORD");
                                           //LAGNALORD
myArray[15] = birthVarsh.getString("RASI");
myArray[16] = rBConstants.getString("RASI_LORD");
myArray[17] = rBConstants.getString("NAKSHATRA");
myArray[18] = birthVarsh.getString("NAKSHATRA_LORD");
myArray[19] = birthVarsh.getString("YOGA");
myArray[20] = birthVarsh.getString("KARAN");
myArray[21] = varshphalallpages.getString("SUN_SIGN_WESTERN");
myArray[22] = rBConstants.getString("AYANAMSA");
myArray[23] = birthVarsh.getString("AYANAMSA_NAME");

return myArray;
}

public String[] printDetailsHeadingsVarshaPhalaJnm(DesktopHoro myAstrologyObject,String[] myArrayJnm,Hindi hindi,MyProperties rBConstants,Local local,DesktopHoroDllFunction dsk,int languageCode,SharedFunction shr,String Splitval,MyResourceBundle birthVarsh)
{

String  strDOB = myAstrologyObject.getDayOfBirth() + "/" + myAstrologyObject.getMonthOfBirth() + "/" + myAstrologyObject.getYearOfBirth();
String  strTOB = myAstrologyObject.getHourOfBirth() + ":" + myAstrologyObject.getMinuteOfBirth() + ":" + myAstrologyObject.getSecondOfBirth();

String Timezoneval =  myAstrologyObject.getTimeZone();
String Longitudedegree = myAstrologyObject.getDegreeOfLongitude();
String Longitudeminute = myAstrologyObject.getMinuteOfLongitude();
String hrs = myAstrologyObject.getHourOfBirth();
String min = myAstrologyObject.getMinuteOfBirth();
String sec = myAstrologyObject.getSecondOfBirth();  
String longew = myAstrologyObject.getEastWest();
if( (longew).toLowerCase().equals("w") || longew.equals("0")) {
    Longitudedegree = String.valueOf(Integer.parseInt(Longitudedegree) * (-1));
    Longitudeminute = String.valueOf(Integer.parseInt(Longitudeminute) * (-1));
}

//ReDim myArrayJnm(23)
myArrayJnm[0] = rBConstants.getString((myAstrologyObject.getMaleFemale()).toUpperCase()) + " "; 
myArrayJnm[1] = strDOB ;//'myastrologyobjectForKundli.getDayOfBirth & Space(1) 
myArrayJnm[2] = strTOB ;// 'objVarshPhalForKundli.getMinuteOfBirth & Space(1) "    
myArrayJnm[4] = myAstrologyObject.getPlace() + " ";
myArrayJnm[5] = "";//country    ' "India"	
myArrayJnm[6] = myAstrologyObject.getDegreeOfLattitude();
myArrayJnm[7] = myAstrologyObject.getDegreeOfLongitude() + " "; 
myArrayJnm[8] = local.correctSeperator(myAstrologyObject.getLMTCorrectionHms()) + " ";  
myArrayJnm[9] = local.correctSeperator(myAstrologyObject.getWarDaylightCorrectionHms())+ " ";  
//System.out.println(GetLMTOfBirth1(hrs,min,sec,Timezoneval,Longitudedegree,Longitudeminute));
myArrayJnm[10] = local.correctSeperator(String.valueOf(dsk.GetLMTOfBirth(hrs,min,sec,Timezoneval,Longitudedegree,Longitudeminute))) + " ";
myArrayJnm[11] = local.correctSeperator(myAstrologyObject.getSunRiseTimeHms()) + " "; 
myArrayJnm[12] = local.correctSeperator(myAstrologyObject.getSunSetTimeHms()) + " "; 
myArrayJnm[13] = hindi.unicode(myAstrologyObject.getAscendentSignName(),languageCode) + " "; 
myArrayJnm[14] = hindi.unicode(myAstrologyObject.getLagnaLordName(),languageCode) + " ";
myArrayJnm[15] = hindi.unicode(myAstrologyObject.getRasiName(),languageCode) + " ";
myArrayJnm[16] = hindi.unicode(myAstrologyObject.getRasiLordName(),languageCode) + " ";
myArrayJnm[17] = hindi.unicode(myAstrologyObject.getNakshatraName(),languageCode)+ " ";
myArrayJnm[18] = hindi.unicode(myAstrologyObject.getNakshatraLordName(),languageCode) + " ";
myArrayJnm[19] = hindi.unicode(myAstrologyObject.getYoganame(),languageCode) + " "; 
myArrayJnm[20] = hindi.unicode(myAstrologyObject.getKaranName(),languageCode) + " ";
myArrayJnm[21] = hindi.unicode(myAstrologyObject.getSunSignName(),languageCode) + " ";
myArrayJnm[22] = hindi.unicode(myAstrologyObject.getAyanamsaDms(),languageCode)+ " ";	
//System.out.println(shr.getAyan(myAstrologyObject));
//myArrayJnm(23) = GetAyanamasaName(myAstrologyObject.getAyanamsaType) & Space(1)  ' getResourceStringForSelectedLangugage(cColon)
myArrayJnm[23] = GetAyanamasaName(Integer.parseInt(shr.getAyan(myAstrologyObject)),rBConstants) + " ";


//response.Write myAstrologyObject.getAyanamsaDms &","&myAstrologyObject.getAyanamsaType&","&myAstrologyObject.getAyanamsa

String TimeOfBirth =strTOB;
String TimeOfSunRise  = local.correctSeperator(myAstrologyObject.getSunRiseTimeHms());
String findDay = checktime(TimeOfBirth,TimeOfSunRise,Splitval) ;

if(findDay.equals("true")){
    myArrayJnm[3] = hindi.unicode(myAstrologyObject.getHinduWeekdayName(),languageCode)+"/"+hindi.unicode(myAstrologyObject.getWeekdayName(),languageCode);
    
}else{ 
    myArrayJnm[3] = hindi.unicode(myAstrologyObject.getHinduWeekdayName(),languageCode);
}

double LMTtime=Double.valueOf(myArrayJnm[10]).doubleValue();
//System.out.println(myArrayJnm[10]);
if(LMTtime<0){
    LMTtime = 24+LMTtime;
}
if(LMTtime>=24) {
    LMTtime = LMTtime-24;
}
//LMTtime=Integer.parseInt(dms(LMTtime));
myArrayJnm[10]= dms(LMTtime);//LMTtime;

return myArrayJnm;
} 

public String checktime(String TimeOfDOB,String TimeOfSunrise,String Splitval){
String[] FirstDate = TimeOfDOB.split(":");
//TimeOfSunrise = "05.13.45";
String[] SecondDate  = TimeOfSunrise.trim().split("\\."); 
if(SecondDate.length == 1)
{
	SecondDate = TimeOfSunrise.trim().split(" : ");
}
String value="";
//System.out.println(FirstDate[0]+","+TimeOfSunrise);
if(Integer.parseInt(FirstDate[0]) < Integer.parseInt(SecondDate[0])){ //** 1st index
    value = "true";
}else if (Integer.parseInt(FirstDate[0])== Integer.parseInt(SecondDate[0])) {
    if(Integer.parseInt(FirstDate[1])< Integer.parseInt(SecondDate[1])){
        value = "true";
}else if(Integer.parseInt(FirstDate[1])==Integer.parseInt(SecondDate[1])){      
        if(Integer.parseInt(FirstDate[2])<= Integer.parseInt(SecondDate[2])){   
            value = "true";             
        }else{
            value = "false";
        }
}else{
        value ="false";
}
}else{
    value = "false";
}
return value;
}

public String GetAyanamasaName(int intType,MyProperties rBConstants ) {
String ayanname="";
switch(intType){
      case 0:		
		ayanname = rBConstants.getString("LAHIRI_AYAN");
		break;
      case 1:
		ayanname = rBConstants.getString("K_P_NEW");	
		break;
      case 2:
		ayanname = rBConstants.getString("K_P_OLD");
		break;
      case 3:
		ayanname = rBConstants.getString("RAMAN");
		break;
      case 4:
		ayanname = rBConstants.getString("K_P_KHULLAR");
		break;
      case 5:
		ayanname = rBConstants.getString("SAAYAN");
}	 
return ayanname;
}

public String dms(double x) {
	String parts[] = new String[3];
	double temp;
	String sdms;
	int deg = (int) x;
	parts[0] = makelength(String.valueOf(deg), 2);
	temp = (x - (double) ((int) x));
	int min = (int) (temp * 60);
	parts[1] = makelength(String.valueOf(min), 2);
	temp = temp * 60;
	temp = (temp - (double) ((int) temp));
	int sec = (int) (temp * 60 );
	
	parts[2] = makelength(String.valueOf(sec), 2);
	sdms = parts[0] + ":" + parts[1] + ":" + parts[2];
	return sdms;
}
public static String makelength(String x, int y) {
	int diff = y - x.length();
	for (int i = 0; i < diff; i++)
		x = "0" + x;
	return x;
}

//****************Code For Varshphal Values
public String[] printDetailsHeadingsVarshaPhalaYr(Varshphala objVarshPhal,String[] myArrayVarsh,MyProperties rBConstants,Hindi hindi,int languageCode,Local local,DesktopHoroDllFunction dsk,SharedFunction shr,MyResourceBundle birthVarsh){
   String strDOB = objVarshPhal.getDayOfBirth() + "/" + objVarshPhal.getMonthOfBirth() + "/" + objVarshPhal.getYearOfBirth();
   String strTOB = objVarshPhal.getHourOfBirth() + ":" + objVarshPhal.getMinuteOfBirth() + ":" + objVarshPhal.getSecondOfBirth();
   String VarshphalTimezoneval =  objVarshPhal.getTimeZone();
   String VarshphalLongitudedegree = objVarshPhal.getDegreeOfLongitude();
   String VarshphalLongitudeminute = objVarshPhal.getMinuteOfLongitude();
   String Varshphalhrs = objVarshPhal.getHourOfBirth();
   String Varshphalmin = objVarshPhal.getMinuteOfBirth(); 
   String Varshphalsec = objVarshPhal.getSecondOfBirth(); 
   String Varshphallongew = objVarshPhal.getEastWest();
    if((Varshphallongew).toLowerCase().equals("w") || Varshphallongew.equals("0")) {
        VarshphalLongitudedegree = String.valueOf(Integer.parseInt(VarshphalLongitudedegree) * (-1));
        VarshphalLongitudeminute = String.valueOf(Integer.parseInt(VarshphalLongitudeminute) * (-1));
    } 
  
    //ReDim myArrayVarsh(23)
    myArrayVarsh[0] =   rBConstants.getString((objVarshPhal.getMaleFemale()).toUpperCase());
    myArrayVarsh[1] =   strDOB;// ' objVarshPhal.getDayOfBirth
    myArrayVarsh[2] =   strTOB;// ' objVarshPhal.getMinuteOfBirth
    myArrayVarsh[3] =   hindi.unicode(objVarshPhal.getHinduWeekdayName(),languageCode);
    myArrayVarsh[4] =   objVarshPhal.getPlace();
    myArrayVarsh[5] =   "";//country;//	  '"India" 
    myArrayVarsh[6] =   objVarshPhal.getDegreeOfLattitude() ; 
    myArrayVarsh[7] =   objVarshPhal.getDegreeOfLongitude(); 
    myArrayVarsh[8] =   local.correctSeperator(objVarshPhal.getLMTCorrectionHms());
    myArrayVarsh[9] =   local.correctSeperator(objVarshPhal.getWarDaylightCorrectionHms());    
    myArrayVarsh[10] =  local.correctSeperator(String.valueOf(dsk.GetLMTOfBirth(Varshphalhrs,Varshphalmin,Varshphalsec,VarshphalTimezoneval,VarshphalLongitudedegree,VarshphalLongitudeminute)));
    myArrayVarsh[11] =  local.correctSeperator(objVarshPhal.getSunRiseTimeHms());
    myArrayVarsh[12] =  local.correctSeperator(objVarshPhal.getSunSetTimeHms());
    myArrayVarsh[13] =  hindi.unicode(objVarshPhal.getAscendentSignName(),languageCode);
    myArrayVarsh[14] =  hindi.unicode(objVarshPhal.getLagnaLordName(),languageCode);
    myArrayVarsh[15] =  hindi.unicode(objVarshPhal.getRasiName(),languageCode);
    myArrayVarsh[16] =  hindi.unicode(objVarshPhal.getRasiLordName(),languageCode);
    myArrayVarsh[17] =  hindi.unicode(objVarshPhal.getNakshatraName(),languageCode);
    myArrayVarsh[18] =  hindi.unicode(objVarshPhal.getNakshatraLordName(),languageCode);
    myArrayVarsh[19] =  hindi.unicode(objVarshPhal.getYoganame(),languageCode);
    myArrayVarsh[20] =  hindi.unicode(objVarshPhal.getKaranName(),languageCode);
    myArrayVarsh[21] =  hindi.unicode(objVarshPhal.getSunSignName(),languageCode);
    myArrayVarsh[22] =  hindi.unicode(objVarshPhal.getAyanamsaDms(),languageCode);
    //myArrayVarsh(23) =  GetAyanamasaName(objVarshPhal.getAyanamsaType)
    myArrayVarsh[23] =  GetAyanamasaName(Integer.parseInt(SharedFunction.getAyan(objVarshPhal)),rBConstants);
                       
  
  
    double LMTVarshphaltime=Double.valueOf(myArrayVarsh[10]).doubleValue();
    if(LMTVarshphaltime<0){
        LMTVarshphaltime = 24+LMTVarshphaltime;
    }
    if(LMTVarshphaltime>=24){
        LMTVarshphaltime = LMTVarshphaltime-24;
    }
   // LMTVarshphaltime=dms(LMTVarshphaltime);
    myArrayVarsh[10]=dms(LMTVarshphaltime);//LMTVarshphaltime;
    
    return myArrayVarsh;
}



public void initializeVarshPhal(int intInput ,int strYear,DesktopHoro myAstrologyObject,Varshphala objVarshPhal , int languageCode) throws Exception{
	objVarshPhal.setName (myAstrologyObject.getName());
	objVarshPhal.setPlace (myAstrologyObject.getPlace());
	objVarshPhal.setTimeZone (myAstrologyObject.getTimeZone());
	objVarshPhal.setMaleFemale (myAstrologyObject.getMaleFemale());
	objVarshPhal.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
	objVarshPhal.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
	objVarshPhal.setHourOfBirth (myAstrologyObject.getHourOfBirth());
	objVarshPhal.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
	objVarshPhal.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
	objVarshPhal.setYearOfBirth (String.valueOf(strYear)); 
	objVarshPhal.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
	objVarshPhal.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
	objVarshPhal.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
	objVarshPhal.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
	objVarshPhal.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
	objVarshPhal.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
	objVarshPhal.setEastWest (myAstrologyObject.getEastWest());
	objVarshPhal.setNorthSouth (myAstrologyObject.getNorthSouth());
	objVarshPhal.setDST (myAstrologyObject.getDST());
	
	String setLC = "0";
	if(languageCode == 1)
	{
		setLC = "1";
	}
	//objVarshPhal.setLanguageCode ("0")
	//if(languageCode==1) {
	   objVarshPhal.setLanguageCode(setLC);
	//}
	
	objVarshPhal.initialize(); 
	objVarshPhal.setVarshphalYear(intInput);

}
%>

<%!

public String getStrHeading(int langCode, MyProperties rBConstants)
{
	String strHeading2 = "";
	if(langCode == 1) {
		 strHeading2 = "dashaName" +" "+ rBConstants.getString("MONTHPREP1")+" replaceableText " + rBConstants.getString("MONTHPREP2");
	  
	 }
    
      
      else if(langCode == 6) {
      strHeading2 = "dashaName" + " " + rBConstants.getString("MONTHPREP1") + " replaceableText " + rBConstants.getString("MONTHPREP2") ;
     }
      
      
	 else{
      strHeading2 = rBConstants.getString("DYNAMIC_VARSHPHAL_DASHA_DISPLAY");
	 }
	return strHeading2;
}

/*
public Double GetLMTOfBirth1(String hrs,String min,String sec,String timezone,String longdeg,String longmin)
	{
		
	   Double  longi = Double.parseDouble(longdeg)+(Double.parseDouble(longmin))/60.0 ;
	   Double  temptimzone =Double.parseDouble(timezone)* 15.0;
	   Double lmtcorrection = temptimzone - longi;
	   lmtcorrection = lmtcorrection * 4;
	   lmtcorrection = lmtcorrection / 60 ;
	    
	   Double birthtime = Double.parseDouble(hrs)+Double.parseDouble(min)/60+Double.parseDouble(sec)/3600.0;
	   Double lmtatbirth = birthtime - lmtcorrection;
	   Double GetLMTOfBirth = lmtatbirth  ;
	    return GetLMTOfBirth;
	    }
*/
	    %>