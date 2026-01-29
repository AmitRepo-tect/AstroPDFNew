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

<script type="text/javascript" src="/cloud/js/constents.js"></script>
<script type="text/javascript" src="/cloud/js/draw-chart.js"></script>
<script type="text/javascript" src="/cloud/js/canvas.js"></script>

<%
Local localVA = new Local();
Hindi hindiVA = new Hindi();
Util utl = new Util();
DesktopHoroDllFunction dsk = new DesktopHoroDllFunction();
SharedFunction shr = new SharedFunction();

int languageCodeVA = (Integer)session.getAttribute("languageCode");
MyProperties rBConstantsVA = (MyProperties) session.getAttribute("constants");
MyResourceBundle varshphalallpages = localVA.loadPropertiesFileNew("varshphalallpages",languageCodeVA);
MyResourceBundle svkVarshShods = localVA.loadPropertiesFileNew("svklagna-varshphalallpages-shodascharts",languageCodeVA);
MyResourceBundle shodsWesternVarshKp = localVA.loadPropertiesFileNew("shodashvargatable-westernsystem-varshphalallpages-kpplanetcusp-kpsignirp-kptoday",languageCodeVA);
MyResourceBundle birthVarsh = localVA.loadPropertiesFileNew("birthdetails-varshphalallpages",languageCodeVA);
%>

<div align="center" class="heading-sec">
    <h2>
        <%=rBConstantsVA.getString("VARSHAPHAL") %>
        &nbsp;<%=varshphalallpages.getString("DETAILS")%>
    </h2>
</div>
<div class="inner-sec">
    <%
//************* find day of birth according Sun rise
String Splitval= "";
if(languageCodeVA== 1){
    Splitval = ":" ;  
}
if(languageCodeVA == 0 || session.getAttribute("languageCode").equals("") || languageCodeVA == 2  || languageCodeVA == 4 || languageCodeVA== 5 || languageCodeVA == 6 || languageCodeVA == 7 || languageCodeVA == 8 || languageCodeVA == 9 || languageCodeVA == 10) {
    Splitval = "." ;
}


DesktopHoro myAstrologyObjectVA = (DesktopHoro)session.getAttribute("HoroscopeObj");

if(languageCodeVA==1){
    myAstrologyObjectVA.setLanguageCode("1");
}
else {
    myAstrologyObjectVA.setLanguageCode("0");
}
    
myAstrologyObjectVA.initialize();
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
myvalue = myvalue - Integer.parseInt(String.valueOf(myAstrologyObjectVA.getYearOfBirth()));          
currYear=myvalue + myAstrologyObjectVA.getYearOfBirth();


%>
 <%
 initializeVarshPhal(myvalue, myAstrologyObjectVA.getYearOfBirth(),myAstrologyObjectVA,objVarshPhal,languageCodeVA);
	      
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
	       			int[] arrPlanetsShodashvargaVA = objVarshPhal.getPositionForShodasvarg(0);
	       			//out.println(arrPlanetsShodashvarga[0]);
           //-------------------Code of Varshphal Chart----------------
          
            int[] RaashiNoCorrespondingToPlanets1 =  new int[13];
            int[] tempraashi =  new int[13];
            int[] myRashi =  new int[13];
            for(int k = 0 ;k<= 12;k++){
                RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvargaVA[k];
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
            if(myvalue!=0) {   
            	  //  Call InitializeVarshPhal(CInt(myValue), myAstrologyObject.getYearOfBirth)
            	}
            	String[] myarray = new String[24];
            	String[] myArrayJnm =new String[24];
            	String[] myArrayVarsh =new String[24];
            	 printDetailsHeadingsVarshaPhala(myarray,rBConstantsVA,birthVarsh,varshphalallpages);
            	 printDetailsHeadingsVarshaPhalaJnm(myAstrologyObjectVA, myArrayJnm, hindiVA, rBConstantsVA, localVA, dsk, languageCodeVA,shr,Splitval,birthVarsh);
            	printDetailsHeadingsVarshaPhalaYr(objVarshPhal,myArrayVarsh,rBConstantsVA,hindiVA,languageCodeVA,localVA,dsk,shr, birthVarsh);
            %>
    <table class="table table-bordered">
        <tr>
            <th>
                <%=varshphalallpages.getString("JANAM") %>
            </th>
            <th>
                &nbsp;
            </th>
            <th>
                <%=varshphalallpages.getString("VARSHA") %>
            </th>
        </tr>
        <% for(int i=0 ;i<= 23;i++){ %>
        <tr>
            <td>
                <%=myArrayJnm[i]%>
            </td>
            <td class="text-center">
                <b>
                    <%=myarray[i]%></b>
            </td>
            <td>
                <%=myArrayVarsh[i]%>
            </td>
        </tr>
        <% } %>
    </table>
    <h3 id="td1">
        <%=varshphalallpages.getString("VARSHAPHAL_CHART_TABLE") %></h3>
    
    <h3 align="center">
        <%=varshphalallpages.getString("VARSHAPHAL_CHART") %></h3>
    
    <div id="chartText">
    </div>
    <div align="center">
        <canvas id="CanvasChartVarP" width="600px" height="400px" class="ui-canvas">
        </canvas>
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
    <%
    String[] arrHeadingVA= new String[3];
    String[] myPlanetNames =  new String[13];
    String[] myArray1 =  new String[13];
    String[] myArray2 =  new String[13];
    arrHeadingVA[0]=rBConstantsVA.getString("PLANETS");
    arrHeadingVA[1]=rBConstantsVA.getString("RASHI");
    arrHeadingVA[2]=rBConstantsVA.getString("LONGITUDE");	       	        
    myPlanetNames[0]=rBConstantsVA.getString("LAGNA");
    myPlanetNames[1]=rBConstantsVA.getString("SUN");
    myPlanetNames[2]=rBConstantsVA.getString("MOON");
    myPlanetNames[3]=rBConstantsVA.getString("MARS");
    myPlanetNames[4]=rBConstantsVA.getString("MERCURY");
    myPlanetNames[5]=rBConstantsVA.getString("JUPITER");
    myPlanetNames[6]=rBConstantsVA.getString("VENUS");
    myPlanetNames[7]=rBConstantsVA.getString("SATURN");
    myPlanetNames[8]=rBConstantsVA.getString("RAHU");
    myPlanetNames[9]=rBConstantsVA.getString("KETU");
    myPlanetNames[10]=shodsWesternVarshKp.getString("URANUS") ;    
    myPlanetNames[11]=shodsWesternVarshKp.getString("NEPTUNE");
    myPlanetNames[12]=shodsWesternVarshKp.getString("PLUTO");
    objVarshPhal.setLanguageCode("0");
    objVarshPhal.initialize();    
    for(int i = 1 ;i<= 13;i++){
       if(i == 1) {
    	   String z = objVarshPhal.getLagnaSign();
       
            myArray1[i - 1] = rBConstantsVA.getString((z+"_full").toUpperCase());
       }else{
    	   String z = objVarshPhal.getPlanetaryRasiName(i - 1);
       
            myArray1[i - 1] = rBConstantsVA.getString((z+"_full").toUpperCase());
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
    if(languageCodeVA == 1)
    	x = "1";
    objVarshPhal.setLanguageCode(x);
    objVarshPhal.initialize(); 
    %>
    <h3>
        <%=varshphalallpages.getString("VARSHAPHAL_TABLE") %></h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>
                    <%=arrHeadingVA[0]%>
                </th>
                <th>
                    <%=arrHeadingVA[1]%>
                </th>
                <th>
                    <%=arrHeadingVA[2]%>
                </th>
            </tr>
        </thead>
        <tbody>
            <% for(int i=0 ;i<= 12;i++){ %>
            <tr>
                <td>
                    <%=myPlanetNames[i]%>
                </td>
                <td>
                    <%=myArray1[i]%>
                </td>
                <td>
                    <%=myArray2[i]%>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% intMunthaNo = objVarshPhal.getMunthaInBhav();
    	CloudDAO CD = new CloudDAO();
		        //Dim RsMuntha,strSqlMuntha,getMunthaPrediction		
		String getMunthaPrediction = CD.getMunthaPredictionRegional(intMunthaNo, languageCodeVA,null);;//GetMunthaPredictionRegional(intMunthaNo, session("languagecode"))
		      
    %>
    <p>
        <b>
            <%=varshphalallpages.getString("MUNTHA") %>
            : <%=munthaInBhav%>&nbsp;
            <%=rBConstantsVA.getString("BHAV")%></b>
    </p>
    <p>
        <%=hindiVA.unicode(getMunthaPrediction,languageCodeVA)%></p>   
  
    <h2>
        <%=rBConstantsVA.getString("VARSHAPHAL") %>&nbsp;
        <%=varshphalallpages.getString("PREDICTION") %>
    </h2>
    <div class="topbottompad">
        <%
          
            int[] arrDashSeries = objVarshPhal.calculateDasaSeries();
             int  intAsc = arrPlanetsShodashvargaVA[0];
            String[] arrYearRange1 = objVarshPhal.calculateIstLevelMuddaVimshottari();
            String[] arrYearRange = new String[arrYearRange1.length];
            for(int v=0;v<arrYearRange1.length;v++)
            {
               String str = arrYearRange1[v].replaceAll("@", "/");
               arrYearRange[v] = str;
            }
            int intYearDashaStart = arrVarshPhal[0];
            int intMonthDashaStart = arrVarshPhal[1];
            int intDayDashaStart = arrVarshPhal[2];
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
        int intPlanetPosition=0;
        int intDashaSeries=0;
	   for(int iCount = intLowerLimit ;iCount<= intUpperLimit;iCount++){ //1 To 9
		intPlanetPosition = arrDashSeries[iCount - 1];
		intDashaSeries = fnGetDashSeries(intPlanetPosition);
		intPlanetPosition = arrPlanetsShodashvargaVA[intDashaSeries];
	    arrPlanetInBhav[iCount] = getPlanetInBhava(intAsc, intPlanetPosition);
        String strDashaSpan2 = arrYearRange[iCount - 1];
		String strYearRange = strDashaSpan1 + strLimiter2 + strDashaSpan2;
		strDashaSpan1 = strDashaSpan2;

		String rsdata = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount], languageCodeVA,null,hindiVA);//GetMuddaPredictionRegional(intDashaSeries, arrPlanetInBhav(iCount), session("languagecode"))
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
            arrstartDate1 = utl.fullMonthName(Integer.parseInt(arrstartDate[1]), languageCodeVA, rBConstantsVA)+" "+arrstartDate[0]+", "+arrstartDate[2];//FullMonthName(arrstartDate[1])+" "+arrstartDate[0]+", "+arrstartDate[2];
            //split(arrStartEnddate(1),"/")
            arrEndDate1 = utl.fullMonthName(Integer.parseInt(arrEndDate[1]), languageCodeVA, rBConstantsVA)+" "+arrEndDate[0]+", "+arrEndDate[2];//FullMonthName(arrEndDate[1])+" "+arrEndDate[0]+", "+arrEndDate[2];
    		 
	        strHeading1 = arrstartDate1 +" - "+ arrEndDate1;                
		    strHeading1 = strHeading1+ "  " + rBConstantsVA.getString("Dasha".toUpperCase())+ "  " + rBConstantsVA.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase()); ;//strHeading1 + "  " + rBConstants.getString("Dasha").toUpperCase() + "  " + rBConstants.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase());
    		    		
		    strHeading2 = rBConstantsVA.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase()) + " " + rBConstantsVA.getString("IS_IN") 
		     + " " + varshphalallpages.getString("BHAV_NUMBER") + " " + arrPlanetInBhav[iCount] + " " + varshphalallpages.getString("EXTRAFORHINDI"); 
        
		    strText = rsdata;	
        %>
        <h3>
            <%=strHeading1%>
        </h3>
        <p>
            <b>
                <%=strHeading2%></b>
        </p>
        <p>
            <%=hindiVA.unicode(strText,languageCodeVA)%></p>
        <% } %>
        <% } %>
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
		intPlanetPosition = arrPlanetsShodashvargaVA[intDashaSeries];
		arrPlanetInBhav[iCount] = getPlanetInBhava(intAsc, intPlanetPosition);
		strDashaSpan2 = arrYearRange[iCount - 1];
		strYearRange = strDashaSpan1 + strLimiter2 + strDashaSpan2;
		strDashaSpan1 = strDashaSpan2;
        rsdata1 = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount], languageCodeVA,null,hindiVA);//GetMuddaPredictionRegional(intDashaSeries, arrPlanetInBhav(iCount), session("languagecode"))
        	   	    
		if(!rsdata1.equals("")) {
		    arrStartEnddateNew = strYearRange.split("-");//(strYearRange,"-")
            arrstartDateNew = arrStartEnddateNew[0].split("/");//(arrStartEnddateNew(0),"/")
            //System.out.println(Integer.parseInt(arrstartDateNew[1]));
            arrstartDateNew1 = utl.fullMonthName(Integer.parseInt(arrstartDateNew[1]),languageCodeVA,rBConstantsVA)+" "+arrstartDateNew[0]+", "+arrstartDateNew[2];//FullMonthName(arrstartDateNew(1))&" "&arrstartDateNew(0)&", "&arrstartDateNew(2)
            arrEndDateNew = arrStartEnddateNew[1].split("/");//split(arrStartEnddateNew(1),"/")
            arrEndDateNew1 =utl.fullMonthName(Integer.parseInt(arrEndDateNew[1]),languageCodeVA,rBConstantsVA)+" "+arrEndDateNew[0]+", "+arrEndDateNew[2];//FullMonthName(arrEndDateNew(1))&" "&arrEndDateNew(0)&", "&arrEndDateNew(2)
            strHeadingNew = arrstartDateNew1 +" - "+ arrEndDateNew1;
		
		    strHeading1 = strHeadingNew + "  " + rBConstantsVA.getString(("DASHA").toUpperCase()) + "  " + rBConstantsVA.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase());
		    strHeading2 = rBConstantsVA.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase()) + "  " + rBConstantsVA.getString("IS_IN")
		    + "  " + varshphalallpages.getString("BHAV_NUMBER")+ " " +arrPlanetInBhav[iCount] + " " + varshphalallpages.getString("EXTRAFORHINDI");
            String strText = rsdata1;;
        %>
        <h3>
            <%=strHeading1%>
        </h3>
        <p>
            <b>
                <%=strHeading2%></b>
        </p>
        <p>
            <%=hindiVA.unicode(strText,languageCodeVA)%></p>
        <% } %>
        <% } %>
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

