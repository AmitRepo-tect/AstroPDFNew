<%@page import="java.util.HashMap"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.ojassoft.astrosagecloud.DAO.UserDAO"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>

<script type="text/javascript" src="/dist/js/jquery.js"></script>
<script type="text/javascript" src="/dist/js/jquery.min.js"></script>
<%
//Start------------------------------------------------- 28-Dec-2011'
//Changes By Deepak
//Reason: The below line of code will be execute when user Change their Birth Detalis inside freechart.
//Inside freechart pages, there are no session for "UserExists" or not so we are doing this.
if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")) {
    request.getSession().setAttribute("UserExists","true");
}


if(session.getAttribute("UserExists")!=null && !session.getAttribute("UserExists").equals("true")) {
	  response.sendRedirect("/default.jsp");
}

String referrer = "",DateTime="";
if (request.getParameter("referrer")!=null){
referrer=request.getParameter("referrer");
}
if(request.getParameter("DateTime")!=null){
 DateTime=request.getParameter("DateTime");
}

   if(DateTime!=null && !DateTime.equals("")){
            referrer=referrer+"&DateTime="+DateTime;
   }
   
	String open=request.getParameter("open");
    if(open!=null && !open.equals("")){
       referrer=referrer+"&open="+open;
    }
   String  Msg = request.getParameter("Msg");
   String uid = "";
   if(request.getParameter("uid")!=null && !request.getParameter("uid").equals("")){
   uid = SharedFunction.decryptstring(request.getParameter("uid"));
   }
   String name="",DateoB="",TimeoB="",sex="",city="",DST="";
   int doB = 0,moB=0,yoB=0,hoB=0,minoB=0,soB=0;
   String chartType="", ayanamsa="",AccessPermission="",place="";
   
   if(Msg.equals("Modify")) {
   UserDAO UD=  new  UserDAO();  
   
   Calendar jCal = Calendar.getInstance();
   int day = jCal.get(Calendar.DATE);
   int month = jCal.get(Calendar.MONTH)+1;
   int year = jCal.get(Calendar.YEAR);
   int currHour =  jCal.get(Calendar.HOUR_OF_DAY);
   int currMin =   jCal.get(Calendar.MINUTE);
   int currSec = 	jCal.get(Calendar.SECOND);

   HashMap<String, String> getData = UD.isBirthDetailExist(uid);
	   
	name =getData.get("PName");
	DateoB =getData.get("DOB");
	TimeoB = getData.get("TOB");
	doB=day;
	moB=month;
	yoB=year;
	hoB=currHour;
	minoB=currMin;
	soB=currSec;
	sex = getData.get("Sex");
	city =getData.get("CityID");
	DST = getData.get("DST");
	chartType=getData.get("chartType");
	ayanamsa=getData.get("Ayanamsa");
	AccessPermission =getData.get("AccessPermission");
	
	String cityVal = UD.getDataFromCityMaster(city);
	place=cityVal;
   }
   
  %>
   
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
   <html xmlns="http://www.w3.org/1999/xhtml">
   <head>
       <meta name="GENERATOR" content="Microsoft FrontPage 5.0">
       <meta name="ProgId" content="FrontPage.Editor.Document">
       <title>Vedic Astrology Portal - Free Chart, Horoscope, Match Making, KP System, Lalkitab
           Remedies</title>
       <link rel='stylesheet' type='text/css' href='/styles.css' />

   </head>
   <body>
       <!-- #include virtual='/header_no.inc'-->
     <script language="JavaScript">

           function Validation(theForm) {
        	   
        	  // alert(document.getElementById("#LongDeg").value());

               if (theForm.name.value == "") {
                   alert("Please enter a value for the \"Name\" field.");
                   theForm.name.focus();
                   return (false);
               }


               if (theForm.day.selectedIndex == 0) {
                   alert("Please select the day");
                   theForm.day.focus();
                   return (false);
               }


               if (theForm.month.selectedIndex == 0) {
                   alert("Please select the month");
                   theForm.month.focus();
                   return (false);
               }


               if (theForm.year.value == "") {
                   alert("Please enter year.");
                   theForm.year.focus();
                   return (false);
               }

               if (theForm.year.value < 1753 || theForm.year.value  > 9999) {
                   alert("Please enter year between 1753 to 9999.");
                   theForm.year.focus();
                   return (false);
               }



               var checkOK = "0123456789-!";
               var checkStr = theForm.year.value;
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
                   theForm.year.focus();
                   return (false);
               }

               if (theForm.hrs.selectedIndex == 0) {
                   alert("Please select the hrs");
                   theForm.hrs.focus();
                   return (false);
               }

               if (theForm.min.selectedIndex == 0) {
                   alert("Please select the min");
                   theForm.min.focus();
                   return (false);
               }

               if (theForm.sec.selectedIndex == 0) {
                   alert("Please select the sec");
                   theForm.sec.focus();
                   return (false);
               }



               if (theForm.place.value == "") {
                   alert("Please enter Place");
                   theForm.place.focus();
                   return (false);
               }
               if (theForm.place.value.length < 2) {
                   alert("Enter at least two first characters of city name ");
                   theForm.place.focus();
                   return (false);
               }

               return (true);
           }

       </script>

       <div id="roundborder">
           <div id="roundtopheadid">
               <div class="roundtophead">
                   <div>
                       <div class="AscTopHead" style="text-align: left;">
                           <a href="/" title="Home" class="BreadCrumb">Home</a> &#187; <a class="BreadCrumb">Registration
                               </a> &#187; <a class="BreadCrumb">Online Horoscope
                               </a>
                       </div>
                   </div>
               </div>
           </div>
           <div class="contents">
               <div class="RPage">
                   <div class="container">
                       <h1 align="center">
                           Online Horoscope</h1>
                       <div class="ui-form-widget">
                        <h2 align="center">
                              Please Enter Your Birth Particulars</h2>
                           <form method="post" action="ConfirmData.jsp?uid=<%=SharedFunction.encryptstring(uid)%>&Msg=<%=Msg%>&referrer=<%=referrer%>"
                           onsubmit="return Validation(this)" id="form1" name="form1">
                           <fieldset class="form-box">
                          
                            <% 
   			if(Msg.equals("Modify")){
               %>
                 <label for="name">
                               Name</label>
                           <input name="name" type="text" value="<%=name%>">
                           <label for="sex">
                               Sex</label>
                           <select size="1" name="sex" class="Lbox">
                              <% if(sex.equals("Female")) {%>
                       <option selected>
                           <%=sex%></option>
                       <option>Male</option>
                       <%} else	{%>
                       <option selected>
                           <%=sex%></option>
                       <option>Female</option>
                       <% } %>
                           </select>
                           <div class="ui-clear" style="height:2px;"></div>
                           <label for="dob">
                               Date of Birth</label>
                           <select size="1" name="day" class="Sbox">
                              <option selected>Day</option>
                       <% for(int i=1 ;i<=31 ;i++){%>
                       <% if(i==doB) { %>
                       <option selected>
                           <%=doB%></option>
                       <%}else{ %>
                       <option>
                           <%=i%></option>
                       <% }%>
                       <%}%>
                           </select>
         <% // Get Month Array
                            
        String arrMonth[] ={"","Jan","Feb","Mar","April","May","June","July","Aug","Sep","Oct","Nov","Dec"};
   	      %>
                           <select size="1" name="month" class="Sbox">
                              <option>Month</option>
                       <% for(int i=1;i<=12;i++){ %>
                       <% if(i==moB){%>
                       <option selected value="<%=i%>">
                           <%=arrMonth[i]%></option>
                       <% }else{ %>
                       <option value="<%=i%>">
                           <%=arrMonth[i]%></option>
                       <%}%>
                       <%} %>
                           </select>
                           <input name="year" type="text" maxlength="4" style=" width:90px;" value="<%=yoB%>">
                           <div class="ui-clear"></div>
                           <label for="tob">
                               Time of Birth</label>
                           <select size="1" name="hrs" class="Sbox">
                               <option>Hrs</option>
                       <% for(int i=0 ;i<=23;i++){ %>
                       <% if(i==hoB){%>
                       <option selected>
                           <%=hoB%></option>
                       <% }else{ %>
                       <option>
                           <%=i%></option>
                       <%}%>
                       <%}%>
                           </select>
                           <select size="1" name="min" class="Sbox">
                              <option selected>Min</option>
                       <% for(int i=0;i<= 59;i++){ %>
                       <% if(i==minoB){%>
                       <option selected>
                           <%=minoB%></option>
                       <% }else {%>
                       <option>
                           <%=i%></option>
                       <%}%>
                       <%}%>
                           </select>
                           <select size="1" name="sec" class="Sbox">
                               <option selected>Sec</option>
                       <% for(int i=0 ;i<= 59;i++){ %>
                       <% if(i==soB) { %>
                       <option selected>
                           <%=soB%></option>
                       <% }else {%>
                       <option>
                           <%=i%></option>
                       <%}%>
                       <%}%>
                           </select>
                           <div class="ui-clear" style="height:2px;"></div>
                           <label for="place">Place of Birth</label>
                            <input name="place" type="text" maxlength="50" value="<%=place%>">
                             <div class="ui-clear"></div>
              <%
                String d[] =  {"None","1 hr","2 hr"};

           %>
                           
                          <label for="dst">DST Correction</label>
                          <div class="ui-rdo">
                           <%for(int i=0 ;i<=2;i++){%>
                          <% if(Integer.parseInt(DST)==i){%>
                           <span style="float:left;"><input type="radio" id="dst1" value="<%=i%>" name="dst" checked/><label style="width:60px" for="dst1"><span></span><%=d[i]%></label></span>
                           <%}else{%>
                           <span style="float:left;"><input type="radio" id="dst2" value="<%=i%>" name="dst"/><label style=" width:110px" for="dst2"><span></span><%=d[i]%></label></span>
                           <%}%>
                   <%}%>
                            <div class="ui-clear"></div>
                            </div>
                           <%  
           String Aya[] =  {"N.C.Lahiri","KP","B.V.Raman","Customise","Saayan"};

           %>
                          <label for="ayanamsa">Ayanamsa</label>
                           <select size="1" name="ayanamsa" class="Lbox">
                                    <%for(int ii=0 ;ii<= 4;ii++){ %>
                       <% if(ii==Integer.parseInt(ayanamsa)){ %>
                       <option selected value="<%=ii%>">
                           <%=Aya[ii]%></option>
                       <%} else{%>
                       <option value="<%=ii%>">
                           <%=Aya[ii]%></option>
                       <%}%>
                       <%}%>
                            </select>
                          <div class="ui-clear"></div>
                               <label for="charting">Charting</label>
                               <select size="1" name="charting" class="Lbox">
                                    <% 
                                    
              String ct[] =  {"North Indian","South Indian"};                      
         
                      for(int ii=0 ;ii< 1;ii++){ %>
                       <%if(Integer.parseInt(chartType)==ii){%>
                       <option value="<%=ii%>" selected>
                           <%=ct[ii]%></option>
                       <%}else{%>
                       <option value="<%=ii%>">
                           <%=ct[ii]%></option>
                       <%}}%>

                               </select>
                                <div class="ui-clear"></div>
                               <label for="ap">Access Permission [<img border="0" src="images/que.gif" alt="Public charts can be viewed by anybody. This is a useful feature if you want to share your chart with someone or want to show to an astrologer. You can disable this feature by selecting private.">]</label>
                           <div class="ui-rdo">
                            <%if(AccessPermission.equals("0")){%>
                           <span style="float:left;"><input type="radio" id="AccessPermission" name="AccessPermission"  value="0"/><label style="width:80px" for="AccessPermission"><span></span>Private</label></span>
                           <span style="float:left;"><input type="radio" id="AccessPermission1" name="AccessPermission" value="1" checked/><label style=" width:110px" for="AccessPermission1"><span></span>Public</label></span>
                           <%}else{%>
                            <span style="float:left;"><input type="radio" id="AccessPermission" name="AccessPermission"  value="0" checked/><label style="width:80px" for="AccessPermission"><span></span>Private</label></span>
                           <span style="float:left;"><input type="radio" id="AccessPermission1" name="AccessPermission" value="1" /><label style=" width:110px" for="AccessPermission1"><span></span>Public</label></span>
                          <%}%>
                           <div class="ui-clear"></div>
                            </div>
                              <div align="center">
                               <input name="submit" type="submit" value="Continue" class="mybutton">
                              </div>
                           <div class="ui-clear"></div>
               
                  <% }else{ %>
                           <label for="name">
                               Name</label>
                           <input name="name" type="text">
                           <label for="sex">
                               Sex</label>
                           <select size="1" name="sex" class="Lbox">
                               <option>Male</option>
                               <option>Female</option>
                           </select>
                           <div class="ui-clear" style="height:2px;"></div>
                           <label for="dob">
                               Date of Birth</label>
                           <select size="1" name="day" class="Sbox">
                               <option selected>Day</option>
                               <option>1</option>
                               <option>2</option>
                               <option>3</option>
                               <option>4</option>
                               <option>5</option>
                               <option>6</option>
                               <option>7</option>
                               <option>8</option>
                               <option>9</option>
                               <option>10</option>
                               <option>11</option>
                               <option>12</option>
                               <option>13</option>
                               <option>14</option>
                               <option>15</option>
                               <option>16</option>
                               <option>17</option>
                               <option>18</option>
                               <option>19</option>
                               <option>20</option>
                               <option>21</option>
                               <option>22</option>
                               <option>23</option>
                               <option>24</option>
                               <option>25</option>
                               <option>26</option>
                               <option>27</option>
                               <option>28</option>
                               <option>29</option>
                               <option>30</option>
                               <option>31</option>
                               &nbsp;
                           </select>
                           <select size="1" name="month" class="Sbox">
                               <option selected>Month</option>
                               <option value="1">Jan</option>
                               <option value="2">Feb</option>
                               <option value="3">Mar</option>
                               <option value="4">April</option>
                               <option value="5">May</option>
                               <option value="6">June</option>
                               <option value="7">July</option>
                               <option value="8">Aug</option>
                               <option value="9">Sept</option>
                               <option value="10">Oct</option>
                               <option value="11">Nov</option>
                               <option value="12">Dec</option>
                           </select>
                           <input name="year" type="text" maxlength="4" style=" width:90px;">
                           <div class="ui-clear"></div>
                           <label for="tob">
                               Time of Birth</label>
                           <select size="1" name="hrs" class="Sbox">
                               <option>Hrs</option>
                               <option>0</option>
                               <option>1</option>
                               <option>2</option>
                               <option>3</option>
                               <option>4</option>
                               <option>5</option>
                               <option>6</option>
                               <option>7</option>
                               <option>8</option>
                               <option>9</option>
                               <option>10</option>
                               <option>11</option>
                               <option>12</option>
                               <option>13</option>
                               <option>14</option>
                               <option>15</option>
                               <option>16</option>
                               <option>17</option>
                               <option>18</option>
                               <option>19</option>
                               <option>20</option>
                               <option>21</option>
                               <option>22</option>
                               <option>23</option>
                               &nbsp;
                           </select>
                           <select size="1" name="min" class="Sbox">
                               <option selected>Min</option>
                               <option>0</option>
                               <option>1</option>
                               <option>2</option>
                               <option>3</option>
                               <option>4</option>
                               <option>5</option>
                               <option>6</option>
                               <option>7</option>
                               <option>8</option>
                               <option>9</option>
                               <option>10</option>
                               <option>11</option>
                               <option>12</option>
                               <option>13</option>
                               <option>14</option>
                               <option>15</option>
                               <option>16</option>
                               <option>17</option>
                               <option>18</option>
                               <option>19</option>
                               <option>20</option>
                               <option>21</option>
                               <option>22</option>
                               <option>23</option>
                               <option>24</option>
                               <option>25</option>
                               <option>26</option>
                               <option>27</option>
                               <option>28</option>
                               <option>29</option>
                               <option>30</option>
                               <option>31</option>
                               <option>32</option>
                               <option>33</option>
                               <option>34</option>
                               <option>35</option>
                               <option>36</option>
                               <option>37</option>
                               <option>38</option>
                               <option>39</option>
                               <option>40</option>
                               <option>41</option>
                               <option>42</option>
                               <option>43</option>
                               <option>44</option>
                               <option>45</option>
                               <option>46</option>
                               <option>47</option>
                               <option>48</option>
                               <option>49</option>
                               <option>50</option>
                               <option>51</option>
                               <option>52</option>
                               <option>53</option>
                               <option>54</option>
                               <option>55</option>
                               <option>56</option>
                               <option>57</option>
                               <option>58</option>
                               <option>59</option>
                               &nbsp;
                           </select>
                           <select size="1" name="sec" class="Sbox">
                               <option selected>Sec</option>
                               <option>0</option>
                               <option>1</option>
                               <option>2</option>
                               <option>3</option>
                               <option>4</option>
                               <option>5</option>
                               <option>6</option>
                               <option>7</option>
                               <option>8</option>
                               <option>9</option>
                               <option>10</option>
                               <option>11</option>
                               <option>12</option>
                               <option>13</option>
                               <option>14</option>
                               <option>15</option>
                               <option>16</option>
                               <option>17</option>
                               <option>18</option>
                               <option>19</option>
                               <option>20</option>
                               <option>21</option>
                               <option>22</option>
                               <option>23</option>
                               <option>24</option>
                               <option>25</option>
                               <option>26</option>
                               <option>27</option>
                               <option>28</option>
                               <option>29</option>
                               <option>30</option>
                               <option>31</option>
                               <option>32</option>
                               <option>33</option>
                               <option>34</option>
                               <option>35</option>
                               <option>36</option>
                               <option>37</option>
                               <option>38</option>
                               <option>39</option>
                               <option>40</option>
                               <option>41</option>
                               <option>42</option>
                               <option>43</option>
                               <option>44</option>
                               <option>45</option>
                               <option>46</option>
                               <option>47</option>
                               <option>48</option>
                               <option>49</option>
                               <option>50</option>
                               <option>51</option>
                               <option>52</option>
                               <option>53</option>
                               <option>54</option>
                               <option>55</option>
                               <option>56</option>
                               <option>57</option>
                               <option>58</option>
                               <option>59</option>
                               &nbsp;
                           </select>
                           <div class="ui-clear" style="height:2px;"></div>
                           <label for="place">Place of Birth</label>
                           <input name="place" id="place" type="text" style=" margin-bottom:-15px;">
                            <div class="ui-clear"></div>
                          <label for="dst">DST Correction</label>
                          <div class="ui-rdo">
                           <span style="float:left;"><input type="radio" id="dst1" value="0" name="dst" checked/><label style="width:60px" for="dst1"><span></span>None</label></span>
                           <span style="float:left;"><input type="radio" id="dst2" value="1" name="dst"/><label style=" width:110px" for="dst2"><span></span>hr1</label></span>
                            <span style="float:left;"><input type="radio" id="dst3" value="0" name="dst"/><label style=" width:110px" for="dst3"><span></span>hr2</label></span>
                            <div class="ui-clear"></div>
                            </div>
                          
                          <label for="ayanamsa">Ayanamsa</label>
                           <select size="1" name="ayanamsa" class="Lbox">
                                   <option selected value="0">N.C.Lahiri</option>
                                   <option value="1">K.P.</option>
                                   <option value="2">B.V.Raman</option>
                                   <option value="3">Saayan</option>
                            </select>
                          <div class="ui-clear"></div>
                               <label for="charting">Charting</label>
                               <select size="1" name="charting" class="Lbox">
                                   <option selected value="0">North Indian</option>
                                   <option value="1">South Indian</option>
                               </select>
                                <div class="ui-clear"></div>
                               <label for="ap">Access Permission [<img border="0" src="images/que.gif" alt="Public charts can be viewed by anybody. This is a useful feature if you want to share your chart with someone or want to show to an astrologer. You can disable this feature by selecting private.">]</label>
                           <div class="ui-rdo">
                           <span style="float:left;"><input type="radio" id="AccessPermission" name="AccessPermission"  value="0"/><label style="width:80px" for="AccessPermission"><span></span>Private</label></span>
                           <span style="float:left;"><input type="radio" id="AccessPermission1" name="AccessPermission" value="1" checked/><label style=" width:110px" for="AccessPermission1"><span></span>Public</label></span>
                           
                           
                           <div class="ui-clear"></div>
                            </div>
                            
                                   <input type="hidden" name="LatDeg" id="LatDeg"  value="">
                                    <input type="hidden" name="LatMin" id="LatMin" value="">
                                     <input type="hidden" name="LatNS" id="LatNS" value="">
                                     
                                    <input type="hidden" name="LongDeg" id="LongDeg" value="">
                                    <input type="hidden" name="LongMin" id="LongMin" value="">
                                    <input type="hidden" name="LongEW" id="LongEW" value="">
                                   
                                    <input type="hidden" name="timeZone" id="timeZone" value="">
                                    <input type="hidden" name="timezoneid" id="timezoneid" value="">
                              <div align="center">
                               <input name="submit" type="submit" value="Continue" class="mybutton">
                              </div>
                                  
                           <div class="ui-clear"></div>
                            <%}%>
                            </fieldset>
                           </form>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <!-- #include virtual='/footer_no.inc'-->
       <script type="text/javascript" src="/dist/js/as-autojump.min.js"></script>
       <%@include file='/include/form-script.jsp'%>
   </body>
   </html>
  
