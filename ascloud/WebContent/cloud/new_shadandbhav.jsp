<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%@page import="com.cslsoftware.shadbala.*"%>

<% 
Local local = new Local();

int languageCode = (Integer)session.getAttribute("languageCode");
MyResourceBundle rBShadAndBhav = local.loadPropertiesFileNew("shadandbhav",languageCode);
MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
%>

<div class="hdg-lg card">
	<h1><%=rBShadAndBhav.getString("SHAD_BALA_BHAV_BALA_TABLES")%></h1>	
</div>


<%

                //declare variable For ShadBala Table
               
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
				//	Dim icount , i 
		        //  Dim arr2(6)   
                 
                 //Declare Variables For Bhav Bala Table
				int[] arrHeading = new int[12];
				double[] arrBhavDigBala =  new double[12]; 
				double[] arrBhavDrishtiBala = new double[12];
				double[] arrTotalBhavBala = new double[12];
				double[] arrTotalBhavInRupas = new double[12];
				double[] arrBhavaDhiPatiBala = new double[12];
				int[] arrtest = new int[6];
				String[] arrBhavHeading = new String[6];
 
				String[] arr1 =  new String[27];
                String[] arr2 =  new String[7];
                
                double[] arrIshtPhal =  new  double[7]; 
                double[] arrKhastaPhal =  new  double[7]; 
              
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
					arr1[25] = "ISHT_PHAL";
					arr1[26] = "KHAST_PHAL";

      

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
  arrIshtPhal[icount]=Double.parseDouble(String.format("%.02f",Math.sqrt(arrUchhaBalaValue[icount]*arrChestaBalaValue[icount])));
  arrKhastaPhal[icount]=Double.parseDouble(String.format("%.02f",Math.sqrt((60-arrUchhaBalaValue[icount])*(60-arrChestaBalaValue[icount]))));
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
  // response.write(arrPlanetBalaInRatio(k)&", ")
 
//response.write("index:<BR>")
 //for k=0 to 6
  // response.write(index(k)&", ")
//Next 
for(int kk=0 ;kk<= 6 ; kk++){
   arrPlanetBalaInRatio1[index[kk]]=kk+1;
}
//response.write("final:<BR>")
//for kkk=0 to 6
 //  response.write(arrPlanetBalaInRatio1(kkk))
//Next

//***************************************


//Printing Of ShadBala Table
//***************************
%>

        <div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel formating rt-custom">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBShadAndBhav.getString("SHAD_BALA_TABLES")%> </h4>
<table class="highlight striped bordered ui-table responsive-table ui-font">
<thead>
<tr>
			<th class="cellhead">&nbsp;</th>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<th class="cellhead"><%=rBConstants.getString(arr2[icount])%>&nbsp;
			</th>
			<%}%>
		</tr>
		</thead>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[0])%>&nbsp;
			</td>
			<%for(int icount=0 ; icount<= 6 ;icount++){ %>
			<td class="cellcontent"><%=arrUchhaBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[1])%>&nbsp;
			</td>
			<%for(int icount=0 ; icount<= 6 ;icount++){ %>
			<td class="cellcontent"><%= arrSaptavargajaValue[icount]%>&nbsp;
			</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[2])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){ %>
			<td class="cellcontent"><%=arrOjayugmarasyamsaValue[icount]%>&nbsp;
			</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[3])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrKendraBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[4])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrDrekkanaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[5])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrIsthanValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[6])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrDigBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[7])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrNathonnathaBalaValue[icount]%>&nbsp;
			</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[8])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){ %>
			<td class="cellcontent"><%=arrPakshaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[9])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrThribhagaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[10])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrAbdaBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[11])%>&nbsp;
			</td>
			<%for(int icount=0 ; icount<= 6 ;icount++){ %>
			<td class="cellcontent"><%= arrMasaBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[12])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrVaraBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[13])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%= arrHoraBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[14])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%= arrAyanaBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[15])%>&nbsp;
			</td>
			<%for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrYuddhaBala[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[16])%>&nbsp;
			</td>
			<%for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrKalaBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[17])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){ %>
			<td class="cellcontent"><%=arrChestaBalaValue[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[18])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrNaisargekaBalaValue[icount]%>&nbsp;
			</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[19])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrDrikBala[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[20])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%= arrTotalShadBalaValue[icount]%>&nbsp;
			</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[21])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){ %>
			<td class="cellcontent"><%= arrShadBalaInRupa[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[22])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%= arrMinBalaInRupa[icount]%>&nbsp;</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[23])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=String.format("%.02f",arrPlanetBalaInRatio[icount])%>&nbsp;
			</td>
			<%}%>
		</tr>
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[24])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=(int)arrPlanetBalaInRatio1[icount]%>&nbsp;
			</td>
			<!--der-->
			<%}%>
		</tr>
		
			<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[25])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrIshtPhal[icount]%>&nbsp;
			</td>
			<!--der-->
			<%}%>
		</tr>
		
		<tr>
			<td class="cellhead"><%=rBShadAndBhav.getString(arr1[26])%>&nbsp;
			</td>
			<% for(int icount=0 ; icount<= 6 ;icount++){  %>
			<td class="cellcontent"><%=arrKhastaPhal[icount]%>&nbsp;
			</td>
			<!--der-->
			<%}%>
	</tr>
</table>
</div>
</div>
</div>
<%
            for(int icount = 0 ; icount<= 11 ; icount++){
   			arrBhavDigBala[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getBhavaDigBala(icount)));
		    arrBhavDrishtiBala[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getBhavaDrishtiBala(icount)));
            arrTotalBhavBala[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getTotalBhavBala(icount)));
            arrBhavaDhiPatiBala[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getBhavaDhipatiBala(icount)));
            arrTotalBhavInRupas[icount] = Double.parseDouble(String.format("%.02f",objShadBala.getTotalBhavaBalaInRupa(icount)));
            }

				for(int icount = 0 ; icount<= 11 ; icount++){
				  arrHeading[icount] = icount + 1;
				}

                //Create Array For Heading
                arrBhavHeading[0] = "BHAVADHIPATI_BALA";
                arrBhavHeading[1] = "BHAVDIG_BALA";
                arrBhavHeading[2] = "BHAVDRISHTI_BALA";
                arrBhavHeading[3] = "TOTAL_BHAV_BALA";
                arrBhavHeading[4] = "TOTAL_BHAV_IN_RUPAS";
                arrBhavHeading[5] = "RELATIVE_RANK";
                
 //**************  CODE FOR RELATIVE RATING **************
 //dim copyOfarrTotalBhavInRupas(12),index1(12)
 double[] copyOfarrTotalBhavInRupas = new double[13];
 int[] index1 = new int[13];
  //MAKE A COPY OF ARRAY arrTotalBhavInRupas()
      for(int k1=0;k1<= 11; k1++){
            copyOfarrTotalBhavInRupas[k1]=arrTotalBhavInRupas[k1];
      } 
   // SORTING OF ARRAY
  for(int ii=0 ;ii<= 11 ;ii++){
   for(int jj=ii+1 ; jj<= 11 ; jj++){
       if (copyOfarrTotalBhavInRupas[ii]<copyOfarrTotalBhavInRupas[jj]){
           temp=copyOfarrTotalBhavInRupas[ii];
           copyOfarrTotalBhavInRupas[ii]=copyOfarrTotalBhavInRupas[jj];
           copyOfarrTotalBhavInRupas[jj]=temp;
                 
       }
   }
    
  }
 //response.write("sorted:<BR>")
  for(int k=0 ; k<= 11 ;k++){
  for(int l=0 ; l<=11 ;l++){
  if (copyOfarrTotalBhavInRupas[k]==arrTotalBhavInRupas[l]){ 
      index1[k]=l;
  }
  }
  }  
  for(int kk=0 ; kk<=11 ; kk++){
    copyOfarrTotalBhavInRupas[index1[kk]]=kk+1;
  } 
//***************************************


%>

<%@include file='ui-control/ad-content-area.jsp'%>

        <div class="row mrt-30">
<div class="col s12 l12">
<div class="card table-panel formating rt-custom">
<h4 class="vd-hdg br-amber-b amber lighten-5"><%=rBShadAndBhav.getString("BHAV_BALA_TABLES")%></h4>
<table class="highlight striped bordered ui-table responsive-table ui-font">
<thead>
<tr>
				<th class="cellhead">&nbsp</th>
				<%  for(int i = 0 ; i<= 11 ; i++){%>
				<th class="cellhead"><%= arrHeading[i] %> &nbsp;</th>
				<% } %>
			</tr>
			</thead>
			<tr>
				<td class="cellhead"><%=rBShadAndBhav.getString(arrBhavHeading[0])%>&nbsp;
				</td>
				<%  for(int i = 0 ; i<= 11 ; i++){%>
				<td class="cellcontent"><%=arrBhavaDhiPatiBala[i]%> &nbsp;</td>
				<% } %>
			</tr>
			<tr>
				<td class="cellhead"><%=rBShadAndBhav.getString(arrBhavHeading[1])%>&nbsp;
				</td>
				<%  for(int i = 0 ; i<= 11 ; i++){%>
				<td class="cellcontent"><%=(int)arrBhavDigBala[i]%> &nbsp;</td>
				<% } %>
			</tr>
			<tr>
				<td class="cellhead"><%=rBShadAndBhav.getString(arrBhavHeading[2])%>&nbsp;
				</td>
				<%  for(int i = 0 ; i<= 11 ; i++){%>
				<td class="cellcontent"><%= arrBhavDrishtiBala[i]%> &nbsp;</td>
				<% } %>
			</tr>
			<tr>
				<td class="cellhead"><%=rBShadAndBhav.getString(arrBhavHeading[3])%>&nbsp;
				</td>
				<%  for(int i = 0 ; i<= 11 ; i++){%>
				<td class="cellcontent"><%= arrTotalBhavBala[i]%> &nbsp;</td>
				<% } %>
			</tr>
			<tr>
				<td class="cellhead"><%=rBShadAndBhav.getString(arrBhavHeading[4])%>&nbsp;
				</td>
				<%  for(int i = 0 ; i<= 11 ; i++){%>
				<td class="cellcontent"><%=Double.parseDouble(String.format("%.02f",arrTotalBhavInRupas[i]))%>
					&nbsp;</td>
				<% } %>
			</tr>
			<tr>
				<td class="cellhead"><%=rBShadAndBhav.getString(arrBhavHeading[5])%>&nbsp;
				</td>
				<%for(int i = 0 ; i<= 11 ; i++){%>
				<td class="cellcontent"><%=(int)copyOfarrTotalBhavInRupas[i]%>
					&nbsp;</td>
				<%}%>
			</tr>
</table>
</div>
</div>
</div>


<p><%@include file='calculations-footer.jsp'%></p>
<div style="padding-bottom: 20px;"></div>