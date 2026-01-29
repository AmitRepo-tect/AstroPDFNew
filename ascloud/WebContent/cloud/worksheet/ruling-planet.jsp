<%@page import="com.ojassoft.astrosagecloud.localization.Hindi"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center" class="ui-global-table-without-hdg ui-hgt">
<%
    Local local = new Local();
    Hindi hindi =  new Hindi();
    int languageCode = (Integer)session.getAttribute("languageCode");
    DesktopHoro myAstrologyObject = (DesktopHoro)session.getAttribute("HoroscopeObj");
    if(languageCode == 1){
    	myAstrologyObject.setLanguageCode("1");
    	myAstrologyObject.initialize();
    }
    MyProperties Constants = (MyProperties) session.getAttribute("constants");
    MyResourceBundle kpSign = local.loadPropertiesFileNew("kpsignirp",languageCode);
    
     String[] myArrayHeading = new String[7];
     String[] myArrayValue = new String[7];
     
    myArrayHeading[0] = Constants.getString("ASCENDANT")+"&nbsp;"+Constants.getString("NAKSHATRA")+"&nbsp;"+Constants.getString("LORD");
	myArrayHeading[1] = Constants.getString("ASCENDANT")+"&nbsp;"+Constants.getString("SIGN")+"&nbsp;"+Constants.getString("LORD");
	myArrayHeading[2] = Constants.getString("MOON")+"&nbsp;"+Constants.getString("NAKSHATRA")+"&nbsp;"+Constants.getString("LORD");
	myArrayHeading[3] = Constants.getString("MOON")+"&nbsp;"+Constants.getString("SIGN")+"&nbsp;"+Constants.getString("LORD");
	myArrayHeading[4] = kpSign.getString("DA")+"&nbsp;"+Constants.getString("LORD");
	myArrayHeading[5] = kpSign.getString("ASCENDANT_SUB_LORD");
	myArrayHeading[6] = kpSign.getString("MOON_SUB_LORD");

	
	myArrayValue[0] = myAstrologyObject.getKPAscendentNakshatraLordName(); 
	myArrayValue[1] = myAstrologyObject.getKPAscendentSignLordName();
	myArrayValue[2] = myAstrologyObject.getKPMoonNakshatraLordName();
	myArrayValue[3] = myAstrologyObject.getKPMoonSignLordName();
	myArrayValue[4] = myAstrologyObject.getKPDayLordName();
	myArrayValue[5] = myAstrologyObject.getKPAscendentSubLordName();
	myArrayValue[6] = myAstrologyObject.getKPMoonSubLordName();            
  
%>
      <table style="min-height:260px;">     
        <%for(int i=0 ;i<= 6;i++){ %>
        <tr>
            <td>                                
                    <%=myArrayHeading[i]%>
            </td>            
            <td>
                    <%=hindi.unicode(myArrayValue[i],languageCode)%>
            </td>
        </tr>
        <%}%>
    </table>

</div>