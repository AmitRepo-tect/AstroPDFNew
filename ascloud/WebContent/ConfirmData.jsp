<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%
   String referrer=request.getParameter("referrer");
   String DateTime=request.getParameter("DateTime");

   if(DateTime!=null && !DateTime.equals("")){
      referrer=referrer+"&DateTime="+DateTime;
   }

   String open=request.getParameter("open");
    if(open!=null && !open.equals("")){
       referrer=referrer+"&open="+open;
    }

    String msg=request.getParameter("Msg");
    String uid=SharedFunction.decryptstring(request.getParameter("uid"));
    
%>

<% 
//dim cc,a_sZone(),a_sPlace()

   String[] timeZoneValue = new String[48];
        
         timeZoneValue[0]="-12";
         timeZoneValue[1]="-11.5";
         timeZoneValue[2]="-11";
         timeZoneValue[3]="-10.5";
         timeZoneValue[4]="-10";
         timeZoneValue[5]="-9.5"; 
         timeZoneValue[6]="-9";
          timeZoneValue[7]="-8.5";
          timeZoneValue[8]="-8";
          timeZoneValue[9]="-7.5";
          timeZoneValue[10]="-7";
          timeZoneValue[11]="-6.5";
          timeZoneValue[12]="-6";
          timeZoneValue[13]="-5.75";
          timeZoneValue[14]="-5.5";
          timeZoneValue[15]="-5";
           timeZoneValue[16]="-4.5";
           timeZoneValue[17]="-4";
            timeZoneValue[18]="-3.5";
            timeZoneValue[19]="-3";
            timeZoneValue[20]="-2.5";
            timeZoneValue[21]="-2";
            timeZoneValue[22]="-1";
            timeZoneValue[23]="0";
            timeZoneValue[24]="1";
            timeZoneValue[25]="2";
            timeZoneValue[26]="2.5";
            timeZoneValue[27]="3";
            timeZoneValue[28]="3.5";
            timeZoneValue[29]="4";
            timeZoneValue[30]="4.5";
            timeZoneValue[31]="5";
            timeZoneValue[32]="5.5"; 
            timeZoneValue[33]="5.75";
            timeZoneValue[34]="6";
            timeZoneValue[35]="6.5";
            timeZoneValue[36]="7";
            timeZoneValue[37]="7.5";
            timeZoneValue[38]="8";
            timeZoneValue[39]="8.5";
            timeZoneValue[40]="9";
            timeZoneValue[41]="9.5";
            timeZoneValue[42]="10";
            timeZoneValue[43]="11";
            timeZoneValue[44]="11.5";
            timeZoneValue[45]="12";
            timeZoneValue[46]="12.75";
            timeZoneValue[47]="13";
            
            //*******Time ZOne to be displayed************
            String timeZoneDisplay[] = new String[48];
           // Dim timeZoneDisplay(48)
            
            timeZoneDisplay[0]="GMT-12.00";
            timeZoneDisplay[1]="GMT-11.30";
            timeZoneDisplay[2]="GMT-11.00";
            timeZoneDisplay[3]="GMT-10.30";
            timeZoneDisplay[4]="GMT-10.00";
            timeZoneDisplay[5]="GMT-9.30";
            timeZoneDisplay[6]="GMT-9.00";
            timeZoneDisplay[7]="GMT-8.30";
            timeZoneDisplay[8]="GMT-8.00";
            timeZoneDisplay[9]="GMT-7.30";
            timeZoneDisplay[10]="GMT-7.00";
            timeZoneDisplay[11]="GMT-6.30";
            timeZoneDisplay[12]="GMT-6.00";
            timeZoneDisplay[13]="GMT-5.45";
            timeZoneDisplay[14]="GMT-5.30";
            timeZoneDisplay[15]="GMT-5.00";
            timeZoneDisplay[16]="GMT-4.30";
            timeZoneDisplay[17]="GMT-4.00";
            timeZoneDisplay[18]="GMT-3.30";
            timeZoneDisplay[19]="GMT-3.00";
            timeZoneDisplay[20]="GMT-2.30";
            timeZoneDisplay[21]="GMT-2.00";
            timeZoneDisplay[22]="GMT-1.00";
            timeZoneDisplay[23]="GMT+0.00";
            timeZoneDisplay[24]="GMT+1.00";
            timeZoneDisplay[25]="GMT+2.00";
            timeZoneDisplay[26]="GMT+2.30";
            timeZoneDisplay[27]="GMT+3.00";
            timeZoneDisplay[28]="GMT+3.30";
            timeZoneDisplay[29]="GMT+4.00";
            timeZoneDisplay[30]="GMT+4.30";
            timeZoneDisplay[31]="GMT+5.00";
            timeZoneDisplay[32]="GMT+5.30";
            timeZoneDisplay[33]="GMT+5.45";
            timeZoneDisplay[34]="GMT+6.00";
            timeZoneDisplay[35]="GMT+6.30";
            timeZoneDisplay[36]="GMT+7.00";
            timeZoneDisplay[37]="GMT+7.30";
            timeZoneDisplay[38]="GMT+8.00";
            timeZoneDisplay[39]="GMT+8.30";
            timeZoneDisplay[40]="GMT+9.00";
            timeZoneDisplay[41]="GMT+9.30";
            timeZoneDisplay[42]="GMT+10.00";
            timeZoneDisplay[43]="GMT+11.00";
            timeZoneDisplay[44]="GMT+11.30";
            timeZoneDisplay[45]="GMT+12.00";
            timeZoneDisplay[46]="GMT+12.45";
            timeZoneDisplay[47]="GMT+13.00";
          
       // dim Ayanamsa,Charting, aya,chartType,startZone
        //referrer = Request.Form("referrer")
       String name = request.getParameter("name");
       String sex = request.getParameter("sex");
       String DoB = request.getParameter("day");
       String MoB = request.getParameter("month");
       String YoB = request.getParameter("year");
       String HoB = request.getParameter("hrs");
       String MinOB = request.getParameter("min");
       String SoB = request.getParameter("sec");
       String place =request.getParameter("place");
       String  DST = request.getParameter("dst");
       String  longDeg = request.getParameter("LongDeg");
       String  longMin= request.getParameter("LongMin");
       String  longEW= request.getParameter("LongEW");
       String  latDeg= request.getParameter("LatDeg");
       String  latMin= request.getParameter("LatMin");
       String  latNS= request.getParameter("LatNS");
       String  timeZone= request.getParameter("timeZone");
       String  timezoneid= request.getParameter("timezoneid");
     
     //  out.println(request.getParameter("LatDeg"));
    //    out.println(longDeg+","+name);
        
   int Ayanamsa = Integer.parseInt(request.getParameter("ayanamsa"));
   int Charting=Integer.parseInt(request.getParameter("charting"));
   String AccessPermission=request.getParameter("AccessPermission");
   String ap="";
   if(AccessPermission.equals("0")) {
       ap="Private";
   }else{
       ap="Public";
   }
   String aya="";
   switch (Ayanamsa){
   case 0:
                        aya="N.C.Lahiri";
                        break;
   case 1:
                        aya="KP";
                        break;
   case 2:
                        aya="B.V.Raman";
                        break;
   case 3:
                        aya="Saayan";
                        break;
   case 4:
                        aya="Customise";
                        break;
   }
   String chartType="";
   switch (Charting){
    case 0:
    	
        chartType="North Indian";
        break;
    case 1:
        chartType="South Indian";
        break;
   }  
   
   UserDAO UD=  new  UserDAO();  
   String cityId = UD.getCityId(place);
   //out.println(cityId);
%>
</head>
<body>
    <!-- #include virtual='/header_no.inc'-->
    <div id="roundborder">
        <div id="roundtopheadid">
            <div class="roundtophead">
                <div>
                    <div class="AscTopHead">
                        <a href="/" title="Home" class="BreadCrumb">Home</a> &#187; <a class="BreadCrumb">Registration
                        </a>&#187; <a class="BreadCrumb">Confirm Online Horoscope </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="contents">
            <div class="RPage">
                <div class="container">
                    <h1 align="center">
                        Online Horoscope</h1>
                    <h2 align="center">
                        Please Confirm Your Birth Details</h2>
                    <div class="RPage-wide">
                    <%//String Msg=""; %>
                        <form method="POST" action="savedata.jsp?uid=<%=SharedFunction.encryptstring(uid)%>&Msg=<%=msg%>&referrer=<%=referrer%>"
                        id="form1" name="form1" onsubmit="return chk(this)">
                        <table border="0" width="98%" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Name
                                </td>
                                <td width="52%" style="text-align: left; padding-left: 15px; height: 30px;">
                                    <%=name%>
                                    <!--<input name="name" size="20">-->
                                </td>
                            </tr>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Sex
                                </td>
                                <td width="52%" style="text-align: left; padding-left: 15px; height: 30px;">
                                    <%=sex%>
                                </td>
                            </tr>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Date of Birth <font face="Verdana" color="#FF0000">(DD/MM/YYYY)</font>
                                </td>
                                <td width="52%" style="text-align: left; padding-left: 15px; height: 30px;">
                                    <%=DoB + "/" + MoB + "/" + YoB%>
                                </td>
                            </tr>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Time of Birth <font face="Verdana" color="#FF0000">(24Hrs Format)</font>
                                </td>
                                <td width="52%" style="text-align: left; padding-top: 5px; height: 30px; padding-left: 15px;">
                                    <%=HoB + ":" + MinOB + ":" + SoB%>
                                </td>
                            </tr>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Place of Birth
                                </td>
                                <td width="52%" style="text-align: left; padding-left: 15px; height: 30px;">
                                    <%=name%>
                                    
                                    <!--<input name="name" size="20">-->
                                </td>
                               <!--  <td width="52%" style="text-align: left; padding-top: 5px; height: 30px; padding-left: 15px;"> -->
                                    <% //if isCityFound = "True" then %>
                                    <!--For java script validations-->
                                    <!--<input type="hidden" name="LatDeg" value="122">
                                    <input type="hidden" name="LatMin" value="23">
                                    <input type="hidden" name="LongDeg" value="122">
                                    <input type="hidden" name="LongMin" value="12">
                                     <input type="hidden" name="LongMin" value="12">
                                       -->
                               
                                    <input type="hidden" name="LatDeg" id="LatDeg"  value="<%=latDeg%>">
                                    <input type="hidden" name="LatMin" id="LatMin" value="<%=latMin%>">
                                     <input type="hidden" name="LatNS" id="LatNS" value="<%=latNS%>">
                                     
                                    <input type="hidden" name="LongDeg" id="LongDeg" value="<%=longDeg%>">
                                    <input type="hidden" name="LongMin" id="LongMin" value="<%=longMin%>">
                                    <input type="hidden" name="LongEW" id="LongEW" value="<%=longEW%>">
                                   
                                    <input type="hidden" name="timeZone" id="timeZone" value="<%=timeZone%>">
                                    <input type="hidden" name="timezoneid" id="timezoneid" value="<%=timezoneid%>">
                                    <!-- End -->
                                   <!--  <select name="PlaceOfBirth" onchange="setTimeZone2(this,selectedIndex)" class="Lbox">
                                        <%//=strPlace%>
                                    </select>
                                     -->
                        
                               
                            </tr>
                            <tr>
                           <!--     <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Time Zone
                                </td>
                                <td width="52%" style="text-align: left; padding-left: 15px; padding-top: 5px; height: 30px;">
                                    <select size="1" name="timeZone" id="timeZone" class="Sbox">
                                        <%// For i=0 to 47 %>
                                        <% //TO COMPAER FLOATINT POINT VALUES 
		//if timeZoneValue(i)-startZone<=0.001 Then %>
                                        <option selected value="<%//=timeZoneValue(i)%>">
                                            <%//=timeZoneDisplay(i)%></option>
                                        <% //Else %>
                                        <option value="<%//=timeZoneValue(i)%>">
                                            <%//=timeZoneDisplay(i)%></option>
                                        <%// End If%>
                                        <%// Next %>
                                    </select>
                                </td>
                            </tr>
                            <%// else %>
                            <b><%//=strPlace%></b>
                            <%// end if %>
                           --> 
                            <%
	   //dim d(3)
                            String[] d = {"None","1 hr","2 hr"};
	  // d(0)="None"
	 //  d(1)="1 hr"
	//   d(2)="2 hr"
                            %>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    DST Correction
                                </td>
                                <td width="52%" style="text-align: left; padding-left: 15px; height: 30px;">
                                    <%=d[Integer.parseInt(DST)]%>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Ayanamsa
                                </td>
                                <td width="52%" style="text-align: left; padding-left: 15px; height: 30px;">
                                    <%=aya%>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Charting
                                </td>
                                <td width="52%" style="text-align: left; padding-top: 5px; padding-left: 15px; height: 30px;">
                                    <%=chartType%>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td width="48%" style="text-align: right; font-weight: bold; height: 30px;">
                                    Access Permission <font face="Verdana" color="#FF0000">(If you select public others
                                        can see your Horoscope)</font>
                                </td>
                                <td width="52%" style="text-align: left; padding-top: 5px; padding-left: 15px; height: 30px;">
                                    <%=ap%>
                                </td>
                            </tr>
                        </table>
                        <center>
                            <table width="90%" style="border-collapse: collapse" cellpadding="0" cellspacing="0">
                                <tr>
                                <!--   <td width="419">
                                        &nbsp;<%// if isCityFound = "False" then %>
                                        <!---#INCLUDE FILE=CastHoro3.asp-->
                                        <%//end if  %>
                                    </td>
                                      --> 
                                </tr>
                                <tr>
                                    <td>
                                    <div align="center">
                                        <input type="submit" value="Continue " name="B1" class="mybutton">&nbsp;
                                        <input type="button" value="Edit" name="B2" class="mybutton" onclick="javascript:history.back()">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </center>
                        <input type="hidden" value="<%=cityId%>" name="CityId">
                        <input type="hidden" value="<%=name%>" name="name">
                        <input type="hidden" value="<%=sex%>" name="sex">
                        <input type="hidden" value="<%=DoB%>" name="Day">
                        <input type="hidden" value="<%=MoB%>" name="month">
                        <input type="hidden" value="<%=YoB%>" name="Year">
                        <input type="hidden" value="<%=HoB%>" name="hrs">
                        <input type="hidden" value="<%=MinOB%>" name="min">
                        <input type="hidden" value="<%=SoB%>" name="sec">
                        <input type="hidden" value="<%=place%>" name="place">
                        <!--  <input type="hidden" value="<%//=TimeZone%>" name = "timeZone"-->
                        <input type="hidden" value="<%=DST%>" name="dst">
                        <input type="hidden" value="<%//=KundliType%>" name="kundaliType">
                        <!--  <input type="hidden" value="<%//=concode%>" name="concode"> -->
                        <input type="hidden" value="<%=Ayanamsa%>" name="Ayanamsa">
                        <input type="hidden" value="<%=Charting%>" name="Charting">
                        <input type="hidden" value="<%=AccessPermission%>" name="AccessPermission">
                        <input type="hidden" value="<%=place%>,," name="PlaceOfBirth">
                        <!--input type="hidden" value="<%=referrer%>" name = "referrer"-->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #include virtual='/footer_no.inc'-->
</body>
</html>