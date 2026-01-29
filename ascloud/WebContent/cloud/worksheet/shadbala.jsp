<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.cslsoftware.shadbala.ShadBala"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
Local local = new Local();

int languageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>
<%
				double temp;
				double[] arrTotalShadBalaValue =  new double [7];
				
				double[] arrUchhaBalaValue =  new  double[7]; 
				int[]  arrKendraBalaValue =  new  int[7]; 
				double[]  arrSaptavargajaValue =  new  double[7]; 
				int[]  arrDrekkanaValue =  new  int[7]; 
				int[] arrOjayugmarasyamsaValue =  new  int[7]; 
				double[] arrIsthanValue=  new  double[7]; 
				
				double[] arrDigBalaValue=  new  double[7];
				double[] arrNathonnathaBalaValue=  new  double[7];
				double[] arrPakshaValue=  new  double[7];
				int[] arrThribhagaValue=  new  int[7];
				
				int[] arrAbdaBalaValue=  new  int[7]; 
				int[] arrMasaBalaValue=  new  int[7]; 
				int[] arrVaraBalaValue=  new  int[7]; 
				int[] arrHoraBalaValue=  new  int[7];
				
				double[] arrAyanaBalaValue=  new  double[7];
				int[] arrYuddhaBala=  new  int[7];
				
				double[] arrKalaBalaValue=  new  double[7]; 
				double[] arrChestaBalaValue=  new  double[7]; 
				
				double[] arrNaisargekaBalaValue=  new  double[7];
				double[] arrDrikBala =  new  double[7];
				
				double[] arrIstaPhal=  new  double[7];
				double[] arrKastPhal=  new  double[7];
				double[] arrPlanetBalaInRatio=  new  double[7];
				
				double[]  arrMinBalaInRupa=  new  double[7];
				double[] arrShadBalaInRupa=  new  double[7]; 
			
                 //Declare Variables For Bhav Bala Table
				int[] arrHeading = new int[12];
				double[] arrBhavDigBala =  new double[12]; 
				double[] arrBhavDrishtiBala = new double[12];
				double[] arrTotalBhavBala = new double[12];
				double[] arrTotalBhavInRupas = new double[12];
				double[] arrBhavaDhiPatiBala = new double[12];
				int[] arrtest = new int[6];
				String[] arrBhavHeading = new String[6];
 
				String[] arr1 =  new String[25];
                String[] arr2 =  new String[7];
              
%>

<%
                 //Create Array For ShadBala table
                    arr1[0] = "OCHCHA_BALA";    
                    arr1[1] = "SAPTAVARGAJA_BALA";
                    arr1[2] = "OJAYUGMARASYAMSA_BALA";
                    arr1[3] = "KENDRA_BALA";
                    arr1[4] = "DREKKANA_BALA";
					arr1[5] = "TOTAL_STHAN_BALA";
					arr1[6] = "TOTAL_DIG_BALA";
					arr1[7] = "NATHONNATHA_BALA";
					arr1[8] = "PAKSHA_BALA";
					arr1[9] = "THRIBHAGA_BALA";
					arr1[10] = "ABDA_BALA";
					arr1[11] = "MASA_BALA";
					arr1[12] = "VARA_BALA";
					arr1[13] = "HORA_BALA";
					arr1[14] = "AYANA_BALA";
					arr1[15] = "YUDDHA_BALA";
					arr1[16] = "TOTAL_KALA_BALA";
					arr1[17] = "TOTAL_CHESTA_BALA";
					arr1[18] = "TOTAL_NAISARGEKA_BALA";
					arr1[19] = "TOTAL_DRIK_BALA";
					arr1[20] = "TOTAL_SHAD_BALA";
					arr1[21] = "SHADBALA_IN_RUPAS";
					arr1[22] = "MINIMUM_REQUIREMENTS";
					arr1[23] = "RATIO";
					arr1[24] = "RELATIVE_RANK";

      

                 //Create Array For Planet Names
                  arr2[0]="SUN";
                  arr2[1]="MOON";
                  arr2[2]="MARS";
                  arr2[3]="MERCURY";
                  arr2[4]="JUPITER";
                  arr2[5]="VENUS";
                  arr2[6]="SATURN";
                 
                  
                  //Code To Set ShadBala
                  //*********************
             
                   DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
                 
                  ShadBala objShadBala = new   ShadBala();
              

                   objShadBala.setName(myAstrologyObject.getName());
				   objShadBala.setPlace (myAstrologyObject.getPlace());
                   objShadBala.setTimeZone (myAstrologyObject.getTimeZone());
                   objShadBala.setMaleFemale (myAstrologyObject.getMaleFemale());
                   objShadBala.setSecondOfBirth (myAstrologyObject.getSecondOfBirth());
                   objShadBala.setMinuteOfBirth (myAstrologyObject.getMinuteOfBirth());
                   objShadBala.setHourOfBirth (myAstrologyObject.getHourOfBirth());
                   objShadBala.setDayOfBirth (String.valueOf(myAstrologyObject.getDayOfBirth()));
                   objShadBala.setMonthOfBirth (String.valueOf(myAstrologyObject.getMonthOfBirth()));
                   objShadBala.setYearOfBirth (String.valueOf(myAstrologyObject.getYearOfBirth()));
                   objShadBala.setDegreeOfLongitude (myAstrologyObject.getDegreeOfLongitude());
                   objShadBala.setMinuteOfLongitude (myAstrologyObject.getMinuteOfLongitude());
                   objShadBala.setSecondOfLongitude (myAstrologyObject.getSecondOfLongitude());
                   objShadBala.setDegreeOfLattitude (myAstrologyObject.getDegreeOfLattitude());
                   objShadBala.setMinuteOfLattitude (myAstrologyObject.getMinuteOfLattitude());
                   objShadBala.setSecondOfLattitude (myAstrologyObject.getSecondOfLattitude());
                   objShadBala.setEastWest (myAstrologyObject.getEastWest());
                   objShadBala.setNorthSouth (myAstrologyObject.getNorthSouth());
                   objShadBala.setDST (myAstrologyObject.getDST());
                 //  objShadBala.setLanguageCode(languageCode)
                   objShadBala.initialize();
                   objShadBala.setShadBala();

                   //Set All Required Bala's Array
                   //******************************  
for(int icount = 0  ; icount<=6; icount++){
  arrUchhaBalaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getUccahBala(icount)));
  arrSaptavargajaValue[icount] =  Double.parseDouble(String.format("%.02f",objShadBala.getSaptaBala(icount)));
  arrOjayugmarasyamsaValue[icount] = Integer.parseInt(String.format("%.00f",objShadBala.getOjhaBala(icount)));
  arrKendraBalaValue[icount] = Integer.parseInt(String.format("%.00f",objShadBala.getKandraBala(icount)));
   arrDrekkanaValue[icount] = objShadBala.getDrekkana(icount);
  arrIsthanValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getIsthaniyaBala(icount)));
  arrDigBalaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getDigBala(icount)));
  arrNathonnathaBalaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getNathonnathBala(icount)));
  arrPakshaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getPakshaBala(icount)));
  arrThribhagaValue[icount] =Integer.parseInt(String.format("%.00f",objShadBala.getTribhagaBala(icount)));
  arrAbdaBalaValue[icount] =Integer.parseInt(String.format("%.00f",objShadBala.getAbdaBala(icount)));
  arrMasaBalaValue[icount] = Integer.parseInt(String.format("%.00f",objShadBala.getMasaBala(icount)));
  arrVaraBalaValue[icount] = Integer.parseInt(String.format("%.00f",objShadBala.getVaraBala(icount)));
  arrHoraBalaValue[icount] =Integer.parseInt(String.format("%.00f",objShadBala.getHoraBala(icount)));
  arrAyanaBalaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getAyanaBala(icount)));
  arrYuddhaBala[icount] = Integer.parseInt(String.format("%.00f",objShadBala.getYuddhaBala(icount)));
  arrKalaBalaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getKaalBala(icount)));
  arrChestaBalaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getChestaBala(icount)));
  arrNaisargekaBalaValue[icount] =Double.parseDouble(String.format("%.02f",objShadBala.getNaisargikaBala(icount)));
  arrDrikBala[icount] =Double.parseDouble(String.format("%.02f",objShadBala.getDrikBala(icount)));
  arrTotalShadBalaValue[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getTotalShadBala(icount)));
  arrShadBalaInRupa[icount] =Double.parseDouble(String.format("%.02f",objShadBala.getTotalShadBalaInRupa(icount)));
  arrMinBalaInRupa[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getAllPlanetMinimumBalaInRupa(icount)));
  arrPlanetBalaInRatio[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getAllPlanetBalaInRatio(icount)));
  //response.write(arrPlanetBalaInRatio(icount )&" ")
}

//**************  CODE FOR RELATIVE RATING **************
 //dim arrPlanetBalaInRatio1(7),index(6)
 double[] arrPlanetBalaInRatio1 =  new double[8];
 int[] index =  new int[8];
 int[] temp1 = new int[8];
  //MAKE A COPY OF ARRAY arrPlanetBalaInRatio()
      for(int k1=0 ; k1<=6; k1++){
            arrPlanetBalaInRatio1[k1]=arrPlanetBalaInRatio[k1];
      }
   // SORTING OF ARRAY
  for(int ii=0 ; ii<= 6 ; ii++){
   for(int jj=ii+1 ; jj<=6 ;jj++){ 
       if (arrPlanetBalaInRatio1[ii]<arrPlanetBalaInRatio1[jj]){
           temp=arrPlanetBalaInRatio1[ii];
           arrPlanetBalaInRatio1[ii]=arrPlanetBalaInRatio1[jj];
           arrPlanetBalaInRatio1[jj]=temp;
                 
       }
   } 
    
  }
 //response.write("sorted:<BR>")
  for(int k=0; k<=6 ; k++){
  for(int l=0 ;l<= 6 ; l++){
  if(arrPlanetBalaInRatio1[k]==arrPlanetBalaInRatio[l]) {
      index[k]=l;
  }
  }
 } 
 
for(int kk=0 ;kk<= 6 ; kk++){
   arrPlanetBalaInRatio1[index[kk]]=kk+1;
}


//Printing Of ShadBala Table
//***************************
%>


<div style="min-height:262px;">
<ul id="q-graph">
<li class="qtr" id="q1">
<%!
public double ShadRelativeRank(double rnk,String pl){
double val = rnk * 27.5;
return 220-val;
}
%>
<ul>

<li class="sent bar" style="height:<%=ShadRelativeRank(arrPlanetBalaInRatio1[0],"Sun")%>px;"><p><b><%=rBConstants.getString("SU")%></b></p><p><%=String.format("%.02f",arrPlanetBalaInRatio[0])%></p></li>
<li class="paid bar" style="height:<%=ShadRelativeRank(arrPlanetBalaInRatio1[1],"Moo")%>px;"><p><b><%=rBConstants.getString("MO")%></b></p><p><%=String.format("%.02f",arrPlanetBalaInRatio[1])%></p></li>
</ul>
</li>
<li class="qtr" id="q2">
<ul>
<li class="sent bar" style="height:<%=ShadRelativeRank(arrPlanetBalaInRatio1[2],"Mar")%>px;"><p><b><%=rBConstants.getString("MA")%></b></p><p><%=String.format("%.02f",arrPlanetBalaInRatio[2])%></p></li>
<li class="paid bar" style="height:<%=ShadRelativeRank(arrPlanetBalaInRatio1[3],"Mer")%>px;"><p><b><%=rBConstants.getString("ME1")%></b></p><p><%=String.format("%.02f",arrPlanetBalaInRatio[3])%></p></li>
</ul>
</li>

<li class="qtr" id="q3">
<ul>
<li class="sent bar" style="height:<%=ShadRelativeRank(arrPlanetBalaInRatio1[4],"Jup")%>px;"><p><b><%=rBConstants.getString("JU")%></b></p><p><%=String.format("%.02f",arrPlanetBalaInRatio[4])%></p></li>
<li class="paid bar" style="height:<%=ShadRelativeRank(arrPlanetBalaInRatio1[5],"Ven")%>px;"><p><b><%=rBConstants.getString("VE")%></b></p><p><%=String.format("%.02f",arrPlanetBalaInRatio[5])%></p></li>
</ul>
</li>
<li class="qtr" id="q4">
<ul>
<li class="sent bar" style="height:<%=ShadRelativeRank(arrPlanetBalaInRatio1[6],"Sat")%>px;"><p><b><%=rBConstants.getString("SA")%></b></p><p><%=String.format("%.02f",arrPlanetBalaInRatio[6])%></p></li>
</ul>

</li>
</ul>
</div>