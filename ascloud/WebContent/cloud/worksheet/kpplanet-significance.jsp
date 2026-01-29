<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.cslsoftware.util.UtilDesktop"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center" class="ui-global-table RScroll ui-hgt-ovr"> 
<%  	            
  int ayanamsa1=0;  
  String[]myPlanetDMS=new String[13];
  String[]myPlanetRNSS=new String[13]; 
  DesktopHoro myAstrologyObject= (DesktopHoro) session. getAttribute("HoroscopeObj");
  UtilDesktop objUtil = new UtilDesktop();
  Hindi hindi=new Hindi();
  Local local=new Local();
  int languageCode = (Integer)session.getAttribute("languageCode");
  MyProperties rBConstants = (MyProperties) session.getAttribute("constants");
  MyResourceBundle rBKPSignIRP = local.loadPropertiesFileNew("kpsignirp",languageCode);
  int[][] myArray=new int[10][12];
  String[] myPlanetNames =new String[13];
  myPlanetNames[1]=rBConstants.getString("SUN");
  myPlanetNames[2]=rBConstants.getString("MOON");
  myPlanetNames[3]=rBConstants.getString("MARS");										   
  myPlanetNames[4]=rBConstants.getString("MERCURY");				  
  myPlanetNames[5]=rBConstants.getString("JUPITER");					   
  myPlanetNames[6]=rBConstants.getString("VENUS");
  myPlanetNames[7]=rBConstants.getString("SATURN");
  myPlanetNames[8]=rBConstants.getString("RAHU");
  myPlanetNames[9]=rBConstants.getString("KETU");
  myPlanetNames[10]=rBConstants.getString("URANUS");
  myPlanetNames[11]=rBConstants.getString("NEPTUNE");
  myPlanetNames[12]=rBConstants.getString("PLUTO");
  int digit=0;
  String fDigit="";
  for(int i=1; i<=9; i++)
  {
	  myArray[i]= myAstrologyObject.getKPPlanetSignification(i);
	  
	  //out.print("manoj"+myAstrologyObject.getKPPlanetSignification(i));
  }
  
  for(int i = 0;i<= 9;i++)
  {
      myArray[i] = myAstrologyObject.getKPPlanetSignification(i);
  } 
  
      
%> 

  <table>
  <tr>
      <td>
            <%=rBConstants.getString("PLANETS") %>
      </td>
      <td >
            <%=rBKPSignIRP.getString("HOUSE_KP") %>
      </td>
        
    </tr>       
      <% for(int icount = 1;icount<= 9;icount++)
        	{%>
		<tr>
			<td>
			<%=myPlanetNames[icount]%>
			</td>
		   <td>
		   <% for(int iJ = 0;iJ<= 11;iJ++)
            {
				%>
				
				 <% 
            	if(myArray[icount][iJ] != 0)
            	{
            	%>
			        &nbsp;&nbsp;
					<%=String.valueOf(myArray[icount][iJ])%>
			        &nbsp;&nbsp;
			<%
            		
            	}
            }
          
            %>
            </td>
		</tr>

		<%  }%>
		</table>
		</div>
      
