<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.CloudDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.DesktopHoroDllFunction"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.cslsoftware.varshphala.Varshphala"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.astrocamp.util.Util"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Free Kundli Software Online, Janam Kundli, Prashna Kundli, KP Horary Astrology
        Software</title>
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="pragma" content="no-cache" />
    <link rel='stylesheet' type='text/css' href='css/stylesheet.css'>
</head>
<body>
<%  
Hindi hindi = new Hindi();
String  year1="";
    boolean flag = false;
    if(request.getParameter("SubmitYear")!=null && !request.getParameter("SubmitYear").equals("")){
        //dim year1, flag
       // flag = false
        year1 = request.getParameter("ChangeYear");          // safestr(request.form("ChangeYear"))

        if(year1.equals("")) {
            out.println("<b>ERROR: Please enter year.</b><br />");
            flag = true;
        }else{
            if (!SharedFunction.isNumeric(year1)){
            out.println("<b>ERROR: Please enter correct year.</b><br />");
                flag = true;
            }else if(Integer.parseInt(year1) < 1 || Integer.parseInt(year1) > 9999){
            	out.println("<b>ERROR: Please enter correct year.</b><br />");
                flag = true;
        }
    }
    }

    if(!flag){
        request.getSession().setAttribute("year",request.getParameter("ChangeYear"));
    }
  out.println("<b>Varshphal Details</b>"+"<br>");
%>
	<%
          DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
           Varshphala objVarshPhal = new Varshphala();

	    request.getSession().setAttribute("tt",session.getAttribute("year"));
	    int myValue = 0,currYear=0;
	    if(session.getAttribute("tt")!=null && !session.getAttribute("tt").equals("0")){
	    	myValue=Integer.parseInt(String.valueOf(session.getAttribute("tt")));
	    }else{
	    	myValue=Calendar.getInstance().get(Calendar.YEAR);
	    } 
	    
	     //*********
         myValue = myValue - Integer.parseInt(String.valueOf(myAstrologyObject.getYearOfBirth()));          
         currYear= myValue + myAstrologyObject.getYearOfBirth();
	   
	         %>  
      
<Form Name="Varshphal" Method="Post" action="new_VarshphalAllPages.asp" id="form1">
    <Input Name="ChangeYear" size="20" value="<%=currYear%>">
    <Input Type ="Submit" Name="SubmitYear" Value="Change Year">
    <br /><br />
    <div class="textad"><b>Varshphal Year <%=currYear%></b><br />
      <% 
         //String cityid = session.getAttribute("CityId").toString();
        // out.println(cityid);
         initializeVarshPhal(myValue, myAstrologyObject.getYearOfBirth(),myAstrologyObject,objVarshPhal,0);
		 int intJD = Integer.parseInt(String.valueOf(objVarshPhal.calculateJdForVarshphal()));
		 int intVarshYear = objVarshPhal.getVarshphalYear();
		 //out.println(intVarshYear+","+intJD);
		 int[] arrVarshPhal = objVarshPhal.getVarshphal(intVarshYear, intJD);
		 objVarshPhal.initializeForBirthTime();
		 objVarshPhal.initializeForVarshphala();
		 objVarshPhal.calculateMuntha();
		 objVarshPhal.calculateOpeningDasa();
   
	  String[] myarray = new String[24];
      String[] myArrayJnm =new String[24];
      String[] myArrayVarsh =new String[24];
	  
      DesktopHoroDllFunction dsk = new DesktopHoroDllFunction();
      SharedFunction shr = new SharedFunction();
      printDetailsHeadingsVarshaPhala(myarray);
      String Splitval= "";
   
      printDetailsHeadingsVarshaPhalaJnm(myAstrologyObject, myArrayJnm,dsk,0,shr,Splitval);
      
     // Varshphala objVarshPhal,String[] myArrayVarsh,SharedFunction shr,DesktopHoroDllFunction dsk
      printDetailsHeadingsVarshaPhalaYr(objVarshPhal,myArrayVarsh,shr,dsk);
%>
<table>
<tr><td><b>Janam</b></td><td>&nbsp;</td><td><b>Varshphal</b></td></tr>
<%for(int i=0 ;i<= 22 ; i++){ %>
<tr>
<td>
  <%=myArrayJnm[i]%></td>  
<th>
  <%=myarray[i]%></th>
<td>
  <%=myArrayVarsh[i]%></td>  
</tr>
<%}%>
</table>
</div><br />

                <%
//##Summay: This Page Displays the Chart & Planetory Details & Muntha Prediction
%>
<%
            int[] arrPlanetsShodashvarga = objVarshPhal.getPositionForShodasvarg(0);
            int[] RaashiNoCorrespondingToPlanets1 =  new int[13];
            int[] tempraashi =  new int[13];
            int[] myRashi =  new int[13];
            for(int k = 0 ;k<= 12;k++){
                RaashiNoCorrespondingToPlanets1[k] = arrPlanetsShodashvarga[k];
            }
           int raashiNo[] = SharedFunction.getRaashi(RaashiNoCorrespondingToPlanets1[0]);  


      //********Code For Rashi
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

<% //************Code For Muntha
int munthaInBhav = objVarshPhal.getMunthaInBhav();
int intMunthaNo = objVarshPhal.getMunthaInBhav();
   //*****Make Connection To Get Muntha Prediction

CloudDAO CD = new CloudDAO();
//Dim RsMuntha,strSqlMuntha,getMunthaPrediction		
String getMunthaPrediction = CD.getMunthaPredictionRegional(intMunthaNo, 0,null);;//GetMunthaPredictionRegional(intMunthaNo, session("languagecode"))

%>
<div class="textad"><b>Muntha: <%=munthaInBhav%> Bhav</b><br />
<%=getMunthaPrediction%>
</div><br />

<%
//##Summay: This Page Displays the Varshphal Saham
%>
    <div class="textad"><b>Varshphal Saham</b><br />
<%	    

	     String[] arrSahamName = new String[23];
         arrSahamName[0]="Punya";
	     arrSahamName[1]="Education";
	     arrSahamName[2]="Popularity And Fame";
	     arrSahamName[3]="Friends";
	     arrSahamName[4]="Father";
	     arrSahamName[5]="Mother";
	     arrSahamName[6]="Life";
	     arrSahamName[7]="Karna";
	     arrSahamName[8]="Death";
	     arrSahamName[9]="Foreign Travels";
	     arrSahamName[10]="Wealth";
	     arrSahamName[11]="Adultery";
	     arrSahamName[12]="Disease";
	     arrSahamName[13]="Alternate Vocation";
	     arrSahamName[14]="Trade";
	     arrSahamName[15]="Karya Siddhi";
	     arrSahamName[16]="Marriage";
	     arrSahamName[17]="Progeny";
	     arrSahamName[18]="Love";
	     arrSahamName[19]="Business";
	     arrSahamName[20]="Foes";
	     arrSahamName[21]="Imprisonment";
	     arrSahamName[22]="Financial Gains";
     
%>
<table>
<tr><td><b>Saham</b></td><th colspan=2><b>Degree</b></th>
  <td><b>Planet</b></td></tr>
<%   //Values in Degree Column
  double[] arrSahamValue = objVarshPhal.getSahamvalue();
   double tmpSahamVal=0.0;
   String[] arrSahamRasiAndRasilordAndItsDegree = new String[24] ;
	    for(int  ij = 0 ;ij<= 22 ; ij++){
	      tmpSahamVal = arrSahamValue[ij];
		arrSahamRasiAndRasilordAndItsDegree = objVarshPhal.getRasiAndRasilordAndItsDegree(tmpSahamVal);
		
		//this will give rashi  %>
	      <tr>
	      <td><%=arrSahamName[ij]%></td>
	       <td><%=arrSahamRasiAndRasilordAndItsDegree[0]%>
	       </td>
	      <%  //this will give deg %>
		<td>
		<%=arrSahamRasiAndRasilordAndItsDegree[1]%></td>
		 <%   //this will give rasshilord %>
	       <td>
		    <%= arrSahamRasiAndRasilordAndItsDegree[2]%>
        </td>  
	      </tr>	
	   <% tmpSahamVal = 0;%>
  <%}%>
</table>
</div><br />

<%
//##Summay: This Page Displays the Mudda Vimshottari Dasha ,Panchadhikari,Varsh Details
%>
<div class="textad"><b>Mudda Vimshottari Dasha</b><br />
	  
<%
         String[] strDashaSpan = objVarshPhal.calculateIstLevelMuddaVimshottari();
        int[] arrDasaSeries = objVarshPhal.calculateDasaSeries();
                    int intYearDashaStart = arrVarshPhal[0];
                         int intMonthDashaStart = arrVarshPhal[1];
                         int intDayDashaStart = arrVarshPhal[2];
                         String strDate = intDayDashaStart + "/" + intMonthDashaStart + "/" + intYearDashaStart;
				//Planet Names
				 int intPlanetPosition=0;
                        int intDashaSeries=0;
                        String[]  arrPlanetName = new String[9];
                        for(int IntDasha = 0 ;IntDasha<= 8;IntDasha++){
                            intPlanetPosition = arrDasaSeries[IntDasha];
                            intDashaSeries = fnGetDashSeries(intPlanetPosition);                    
                            arrPlanetName[IntDasha] = fngetVarshaphalPlanetName(intDashaSeries);
                           // out.println(intPlanetPosition+","+intDashaSeries+"<br/>");
                        }			
				//Code For Number Of Days
					  String str1 = strDashaSpan[0].substring(0,2)+"/";//Left(strDashaSpan(0), 2) & "/"
					   str1 = str1 +strDashaSpan[0].substring(3,5)+"/";// Mid(strDashaSpan(0), 4, 2) & "/"
					   str1 = str1 + strDashaSpan[0].substring(6,strDashaSpan[0].length());//Right(strDashaSpan(0), 2)
					  // int  tempDateDiff= 2;//DateDiff("d", strDate, str1)
//response.write(strDate)
				 int[] DayDifference = new int[9];
				        for(int CIntDasha = 0; CIntDasha<=7;CIntDasha++){
                          String  str2 = strDashaSpan[CIntDasha].substring(0,2)+"/";//Left(strDashaSpan(CIntDasha), 2) & "/"
                          str2 = str2 + strDashaSpan[CIntDasha].substring(3,5)+"/";//str2 & Mid(strDashaSpan(CIntDasha), 4, 2) & "/"
                          str2 = str2 +strDashaSpan[CIntDasha].substring(6,strDashaSpan[CIntDasha].length());// Right(strDashaSpan(CIntDasha), 2)

                          String  str3 = strDashaSpan[CIntDasha + 1].substring(0,2)+"/";//Left(strDashaSpan(CIntDasha + 1), 2) & "/"
                          str3 = str3 + strDashaSpan[CIntDasha + 1].substring(3,5)+"/";//Mid(strDashaSpan(CIntDasha + 1), 4, 2) & "/"
                          str3 = str3 + strDashaSpan[CIntDasha + 1].substring(6,strDashaSpan[CIntDasha + 1].length());//Right(strDashaSpan(CIntDasha + 1), 2)

                       
				        }
%>

<table>
<tr>
<td><b>Planet</td></b>
<td><b>From</td></b>
<td><b>To</td></b>
</tr> 

<tr>
    <td><%=arrPlanetName[0]%>&nbsp;</td>
    <td><%=strDate%>&nbsp;</td>
    <td><%=strDashaSpan[0]%>&nbsp;</td>
</tr>
<tr>
     <td><%=arrPlanetName[1]%>&nbsp;</td>
    <td><%=strDashaSpan[0]%>&nbsp;</td>
    <td><%=strDashaSpan[1]%>&nbsp;</td>
</tr>
<%for (int i=2 ;i<= 8 ;i++){%>
   <tr>
     <td>
      <%=arrPlanetName[i]%>&nbsp;</td>
   
     <td>
      <%=strDashaSpan[i-1]%> &nbsp;</td>
     <td>
       <%=strDashaSpan[i]%> &nbsp;</td>
  </tr>     
<%}%></table>
</div><br />

<%
//Code To Draw The Panchadhikari Table
//--------------------------------------
	//Dim arrHeadingsPanchadhikari,arr1Planet
	
	  String[] arrHeadingsPanchadhikari =  new String[6];
      String[] arr1Planet = new String[6];
		
	//Redim arrHeadingsPanchadhikari(5)
	arrHeadingsPanchadhikari[0]="Muntha Lord";
	arrHeadingsPanchadhikari[1]="Birth Ascendant Lord";
	arrHeadingsPanchadhikari[2]="Year Ascendant Lord";
	arrHeadingsPanchadhikari[3]="Trirashi Lord";
	arrHeadingsPanchadhikari[4]="DinRatri Lord";
	
	
	arr1Planet[0] = objVarshPhal.getMunthesh();
	arr1Planet[1] = objVarshPhal.getBirthAscendentLord();
	arr1Planet[2] = objVarshPhal.getVarshAscendentLord();
	arr1Planet[3] = objVarshPhal.getTriRashiPati();
	arr1Planet[4] = objVarshPhal.getDinRatriPati();
%>
<div class="textad"><b>Panchadhikari</b><br />
       
      <table>
      <tr><td><b>Lord</b></td><td><b>Planet</b></td></tr> 
     <%for(int i=0 ;i<= 4;i++){%>
	<tr>
	  <td>
	    <%=arrHeadingsPanchadhikari[i]%> &nbsp;</td>
	  <td>
	    <%=arr1Planet[i]%> &nbsp;</td> 	       
	 </tr> 
	<%}%> 
       </table>  
  </div><br />
<% //Code For Table 'Varsh Deatails
   //------------------------------------
  
     String[] arrValue = new String[5];
     arrValue[0] = objVarshPhal.getVarshparveshDate();
     arrValue[1] = objVarshPhal.getVarshparveshTimeHms().replace(".",":");
     arrValue[2] = objVarshPhal.getMunthaName();
     arrValue[3] = String.valueOf(objVarshPhal.getMunthaInBhav());
     arrValue[4] = String.valueOf(objVarshPhal.getMunthaInBhavForBirthChart());

     String[] arrHeadingVarsh = new String[5];
     arrHeadingVarsh[0]="Varshpravesh Date";
     arrHeadingVarsh[1]="Varshpravesh Time";
     arrHeadingVarsh[2]="Muntha Raashi";
     arrHeadingVarsh[3]="Muntha In House";
     arrHeadingVarsh[4]="Muntha In Birth Chart";
  %>   
  <div class="textad"><b>Varsh Details</b><br />
      <table>
      <tr><td><b>Head</b></td><td><b>Details</b></td></tr>
       <%for(int i=0 ;i<= 4;i++){%>
	<tr>
	  <td>
	    <%=arrHeadingVarsh[i]%> &nbsp;</td>
	  <td>
	    <%=arrValue[i]%> &nbsp;</td>
	 </tr>
	 <%}%>
       </table>
</div><br />

<%
//##Summay: This Page Displays the Mudda Vimshottari Dasha ,Panchadhikari,Varsh Details
%>
<div class="textad"><b>Mudda Yogini Dasha</b><br />

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
	   
	   str1 = arrYoginiDashaSpan[0].substring(0,2)+"/";//Left(strDashaSpan(0), 2) & "/"
	   str1 = str1 +arrYoginiDashaSpan[0].substring(3,5)+"/";// Mid(strDashaSpan(0), 4, 2) & "/"
	   str1 = str1 + arrYoginiDashaSpan[0].substring(6,strDashaSpan[0].length());//Right(strDashaSpan(0), 2)
	
        for(int CIntDasha = 0; CIntDasha<=6;CIntDasha++){
          String  str2 = arrYoginiDashaSpan[CIntDasha].substring(0,2)+"/";//Left(strDashaSpan(CIntDasha), 2) & "/"
          str2 = str2 + arrYoginiDashaSpan[CIntDasha].substring(3,5)+"/";//str2 & Mid(strDashaSpan(CIntDasha), 4, 2) & "/"
          str2 = str2 +arrYoginiDashaSpan[CIntDasha].substring(6,strDashaSpan[CIntDasha].length());// Right(strDashaSpan(CIntDasha), 2)

          String  str3 = arrYoginiDashaSpan[CIntDasha + 1].substring(0,2)+"/";//Left(strDashaSpan(CIntDasha + 1), 2) & "/"
          str3 = str3 + arrYoginiDashaSpan[CIntDasha + 1].substring(3,5)+"/";//Mid(strDashaSpan(CIntDasha + 1), 4, 2) & "/"
          str3 = str3 + arrYoginiDashaSpan[CIntDasha + 1].substring(6,strDashaSpan[CIntDasha + 1].length());//Right(strDashaSpan(CIntDasha + 1), 2)
        }

  %>
<table>
  <tr>
      <td><b>Dasha</b></td>
      <td><b>Planet</b></td>
     
      <td><b>From</b></td>
      <td><b>To</b></td>
  </tr>
  <tr>
      <td><%=arrYoginiName[0]%>&nbsp;</td>
      <td><%=yoginilordname[0]%>&nbsp;</td>
     
      <td><%=strDate%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[0]%> &nbsp;</td>
  </tr>
  <tr>	  
       <td><%=arrYoginiName[1]%>&nbsp;</td>
      <td><%=yoginilordname[1]%>&nbsp;</td>
     
      <td><%=arrYoginiDashaSpan[0]%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[1]%> &nbsp;</td>
  </tr>  
  <tr>	  
       <td><%=arrYoginiName[2]%>&nbsp;</td>
      <td><%=yoginilordname[2]%>&nbsp;</td>
     
      <td><%=arrYoginiDashaSpan[1]%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[2]%> &nbsp;</td>
  </tr>  
  <tr>	  
       <td><%=arrYoginiName[3]%>&nbsp;</td>
      <td><%=yoginilordname[3]%>&nbsp;</td>
    
      <td><%=arrYoginiDashaSpan[2]%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[3]%> &nbsp;</td>
  </tr>  
  <tr>	  
       <td><%=arrYoginiName[4]%>&nbsp;</td>
      <td><%=yoginilordname[4]%>&nbsp;</td>
     
      <td><%=arrYoginiDashaSpan[3]%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[4]%> &nbsp;</td>
  </tr>  
  <tr>	  
       <td><%=arrYoginiName[5]%>&nbsp;</td>
      <td><%=yoginilordname[5]%>&nbsp;</td>
    
      <td><%=arrYoginiDashaSpan[4]%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[5]%> &nbsp;</td>
  </tr>  
  <tr>	  
       <td><%=arrYoginiName[6]%>&nbsp;</td>
      <td><%=yoginilordname[6]%>&nbsp;</td>
     
      <td><%=arrYoginiDashaSpan[5]%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[6]%> &nbsp;</td>
  </tr>  
  <tr>	  
       <td><%=arrYoginiName[7]%>&nbsp;</td>
       <td><%=yoginilordname[7]%>&nbsp;</td>
    
      <td><%=arrYoginiDashaSpan[6]%>&nbsp;</td>
      <td><%=arrYoginiDashaSpan[7]%> &nbsp;</td>
  </tr>  
</table> 
</div><br />
</form>

<%
//##Summay: This Page Displays The Varshphal Prediction
%>

</div>
<div class="textad"><b>Varshphal Prediction</b><br />	  
	  
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
	//  '****Set limits for Prediction page 1.****
	     String strLimiter = "/";
           String  strLimiter2 = "-";
           int intLowerLimit = 1;
           int  intUpperLimit = 5;
           String strDashaSpan1 = intDayDashaStart + strLimiter + intMonthDashaStart + strLimiter + intYearDashaStart;
   %>
      <%  // <!--#INCLUDE FILE=DbConnection.inc-->%>
    <%	
       int[] arrPlanetInBhav =  new int[12];
	   for(int iCount = intLowerLimit ;iCount<= intUpperLimit;iCount++){ //1 To 9
		intPlanetPosition = arrDashSeries[iCount - 1];
		intDashaSeries = fnGetDashSeries(intPlanetPosition);
		intPlanetPosition = arrPlanetsShodashvarga[intDashaSeries];
	    arrPlanetInBhav[iCount] = getPlanetInBhava(intAsc, intPlanetPosition);
       String strDashaSpan2 = arrYearRange[iCount - 1];
		String strYearRange = strDashaSpan1 + strLimiter2 + strDashaSpan2;
		strDashaSpan1 = strDashaSpan2;
       
		String rsdata = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount],0,null,hindi);//GetMuddaPredictionRegional(intDashaSeries, arrPlanetInBhav(iCount), session("languagecode"))
		 String strHeading1="",arrstartDate1="",arrEndDate1="",strHeading2="",strText="";
		//String[] arrstartDate= new String[10];
		//String[] arrEndDate= new String[10];
		//if(!rsdata.equals("")) {
       //String[] arrStartEnddate = strYearRange.split("-");//split(strYearRange,"-")

       //arrstartDate = arrStartEnddate[0].split("/");//split(arrStartEnddate(0),"/")
       //arrEndDate = arrStartEnddate[1].split("/");
       //if(arrstartDate.length == 1)
      // {
     //	  arrstartDate = arrStartEnddate[0].split("@");//split(arrStartEnddate(0),"/")
      // }
      // if(arrEndDate.length == 1)
      // {
     //	  arrEndDate = arrStartEnddate[1].split("@");//split(arrStartEnddate(0),"/")
      // }
           // strHeading1 = strYearRange +" - "+ arrEndDate1;                
		    strHeading1 = strYearRange+ "  " + "Dasha".toUpperCase()+ "  " + (fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase(); ;//strHeading1 + "  " + rBConstants.getString("Dasha").toUpperCase() + "  " + rBConstants.getString((fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase());
 		    		
		    strHeading2 = fngetVarshaphalPlanetName(intDashaSeries).toUpperCase() + " " + "IS IN" 
		     + " " + "BHAV NUMBER" + " " + arrPlanetInBhav[iCount]; 
     
		    strText = rsdata;	
		%>
		  <table>
		    <tr><td><b><%=strHeading1%></b>&nbsp;</td></tr>
		    <tr><td ><b><%=strHeading2%></b>&nbsp;</td></tr>
			    <tr><td><%=strText%></td></tr>
			  </table>	<br>
			 <% }%>
			 <%//}%>
				
<%
//##Summay: This Page Displays The Varshphal Prediction
%>
  
<% strLimiter = "/";
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
rsdata1 = CD.GetPrediction(intDashaSeries, arrPlanetInBhav[iCount], 0,null,hindi);;//GetMuddaPredictionRegional(intDashaSeries, arrPlanetInBhav(iCount), session("languagecode"))
	   	    
if(!rsdata1.equals("")) {
    arrStartEnddateNew = strYearRange.split("-");//(strYearRange,"-")
    arrstartDateNew = arrStartEnddateNew[0].split("/");//(arrStartEnddateNew(0),"/")
    
    strHeading1 = strYearRange + "  " + "DASHA".toUpperCase() + "  " + fngetVarshaphalPlanetName(intDashaSeries).toUpperCase();
    strHeading2 = (fngetVarshaphalPlanetName(intDashaSeries)).toUpperCase()+ "  " +"IS IN"
    + "  " + "BHAV NUMBER"+ " " +arrPlanetInBhav[iCount];
    String strText = rsdata1;;
		%>
		  <table>
		    <tr><td><b><%=strHeading1%></b>&nbsp;</td></tr>
		    <tr><td><b><%=strHeading2%></b>&nbsp;</td></tr>
			    <tr><td><%=strText%></td></tr>
			  </table>	<br>
			 <% } %>
			 <%}%> 
 </div>
 <br />
 <%@include file='/m/include/i_footer.jsp'%>
</body>
</html>

<%!

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

public String[] printDetailsHeadingsVarshaPhala(String[] myArray)
{
//Dim strString
//ReDim myArray(23)
myArray[0] = "Sex";
myArray[1] = "Date of Birth";
myArray[2] = "Time of Birth";
myArray[3] = "Day of Birth";
myArray[4] = "Place of Birth";
myArray[5] = "Country";
myArray[6] = "Latitude";
myArray[7] = "Longitude";
myArray[8] = "Local Time";
myArray[9] = "War Time Correction";
myArray[10] = "LMT at Birth";
myArray[11] = "Sunrise";
myArray[12] = "Sunset";
myArray[13] = "Lagna";
myArray[14] = "LagnaLord";
                                           //LAGNALORD
myArray[15] = "Rasi";
myArray[16] = "Rasi Lord";
myArray[17] = "Nakshatra";
myArray[18] = "Nakshatra Lord";
myArray[19] = "Yoga";
myArray[20] = "Karan";
myArray[21] = "Sun Sign(Western)";
myArray[22] = "Ayanamsa";
myArray[23] = "AyanamsaName";

return myArray;
}

//****************Code For Varshphal Values
public String[] printDetailsHeadingsVarshaPhalaYr(Varshphala objVarshPhal,String[] myArrayVarsh,SharedFunction shr,DesktopHoroDllFunction dsk){
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
  myArrayVarsh[0] =   objVarshPhal.getMaleFemale();// rBConstants.getString((objVarshPhal.getMaleFemale()).toUpperCase());
  myArrayVarsh[1] =   strDOB;// ' objVarshPhal.getDayOfBirth
  myArrayVarsh[2] =   strTOB;// ' objVarshPhal.getMinuteOfBirth
  myArrayVarsh[3] =   objVarshPhal.getHinduWeekdayName();
  myArrayVarsh[4] =   objVarshPhal.getPlace();
  myArrayVarsh[5] =   "";//country;//	  '"India" 
  myArrayVarsh[6] =   objVarshPhal.getDegreeOfLattitude() ; 
  myArrayVarsh[7] =   objVarshPhal.getDegreeOfLongitude(); 
  myArrayVarsh[8] =   objVarshPhal.getLMTCorrectionHms();
  myArrayVarsh[9] =   objVarshPhal.getWarDaylightCorrectionHms();    
  myArrayVarsh[10] =  String.valueOf(dsk.GetLMTOfBirth(Varshphalhrs,Varshphalmin,Varshphalsec,VarshphalTimezoneval,VarshphalLongitudedegree,VarshphalLongitudeminute));
  myArrayVarsh[11] =  objVarshPhal.getSunRiseTimeHms();
  myArrayVarsh[12] =  objVarshPhal.getSunSetTimeHms();
  myArrayVarsh[13] =  objVarshPhal.getAscendentSignName();
  myArrayVarsh[14] =  objVarshPhal.getLagnaLordName();
  myArrayVarsh[15] =  objVarshPhal.getRasiName();
  myArrayVarsh[16] =  objVarshPhal.getRasiLordName();
  myArrayVarsh[17] =  objVarshPhal.getNakshatraName();
  myArrayVarsh[18] =  objVarshPhal.getNakshatraLordName();
  myArrayVarsh[19] =  objVarshPhal.getYoganame();
  myArrayVarsh[20] =  objVarshPhal.getKaranName();
  myArrayVarsh[21] =  objVarshPhal.getSunSignName();
  myArrayVarsh[22] = objVarshPhal.getAyanamsaDms();
  //myArrayVarsh(23) =  GetAyanamasaName(objVarshPhal.getAyanamsaType)
  myArrayVarsh[23] = SharedFunction.getAyan(objVarshPhal);
                     


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



public String[] printDetailsHeadingsVarshaPhalaJnm(DesktopHoro myAstrologyObject,String[] myArrayJnm ,DesktopHoroDllFunction dsk,int languageCode,SharedFunction shr,String Splitval)
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
myArrayJnm[0] =myAstrologyObject.getMaleFemale().toUpperCase() + " "; 
myArrayJnm[1] = strDOB ;//'myastrologyobjectForKundli.getDayOfBirth & Space(1) 
myArrayJnm[2] = strTOB ;// 'objVarshPhalForKundli.getMinuteOfBirth & Space(1) "    
myArrayJnm[4] = myAstrologyObject.getPlace() + " ";
myArrayJnm[5] = "";//country    ' "India"	
myArrayJnm[6] = myAstrologyObject.getDegreeOfLattitude();
myArrayJnm[7] = myAstrologyObject.getDegreeOfLongitude() + " "; 
myArrayJnm[8] = myAstrologyObject.getLMTCorrectionHms() + " ";  
myArrayJnm[9] = myAstrologyObject.getWarDaylightCorrectionHms()+ " ";  
//System.out.println(GetLMTOfBirth1(hrs,min,sec,Timezoneval,Longitudedegree,Longitudeminute));
myArrayJnm[10] = String.valueOf(dsk.GetLMTOfBirth(hrs,min,sec,Timezoneval,Longitudedegree,Longitudeminute)) + " ";
myArrayJnm[11] = myAstrologyObject.getSunRiseTimeHms() + " "; 
myArrayJnm[12] = myAstrologyObject.getSunSetTimeHms() + " "; 
myArrayJnm[13] = myAstrologyObject.getAscendentSignName() + " "; 
myArrayJnm[14] = myAstrologyObject.getLagnaLordName() + " ";
myArrayJnm[15] = myAstrologyObject.getRasiName() + " ";
myArrayJnm[16] = myAstrologyObject.getRasiLordName()+ " ";
myArrayJnm[17] = myAstrologyObject.getNakshatraName()+ " ";
myArrayJnm[18] = myAstrologyObject.getNakshatraLordName()+ " ";
myArrayJnm[19] = myAstrologyObject.getYoganame() + " "; 
myArrayJnm[20] = myAstrologyObject.getKaranName()+ " ";
myArrayJnm[21] = myAstrologyObject.getSunSignName()+ " ";
myArrayJnm[22] =myAstrologyObject.getAyanamsaDms()+ " ";	
//System.out.println(shr.getAyan(myAstrologyObject));
//myArrayJnm(23) = GetAyanamasaName(myAstrologyObject.getAyanamsaType) & Space(1)  ' getResourceStringForSelectedLangugage(cColon)
myArrayJnm[23] = shr.getAyan(myAstrologyObject) + " ";


//response.Write myAstrologyObject.getAyanamsaDms &","&myAstrologyObject.getAyanamsaType&","&myAstrologyObject.getAyanamsa

String TimeOfBirth =strTOB;
String TimeOfSunRise  = myAstrologyObject.getSunRiseTimeHms();
String findDay = checktime(TimeOfBirth,TimeOfSunRise,Splitval) ;

if(findDay.equals("true")){
    myArrayJnm[3] = myAstrologyObject.getHinduWeekdayName()+"/"+myAstrologyObject.getWeekdayName();
    
}else{ 
    myArrayJnm[3] = myAstrologyObject.getHinduWeekdayName();
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
public static String makelength(String x, int y) {
	int diff = y - x.length();
	for (int i = 0; i < diff; i++)
		x = "0" + x;
	return x;
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
/*
'********************Code Of Function FormartString
Function FormatString(strText ) 
      FormatString = UCase(Left(strText, 1)) & LCase(Mid(strText, 2, Len(strText)))
End Function


Function GetAyanamasaName(intType) 
Select Case intType
Case 0
  GetAyanamasaName = "Lahiri Ayan"
Case 1
  GetAyanamasaName = "KP New Ayan"
Case 2
  GetAyanamasaName = "KP Old Ayan"
Case 3
  GetAyanamasaName = "Raman Ayan"
Case 4
  GetAyanamasaName = "KP Khullar"
Case 5
GetAyanamasaName = "Saayan Ayan"
End Select
End Function

*/

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

%>