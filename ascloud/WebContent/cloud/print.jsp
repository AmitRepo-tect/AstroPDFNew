<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.model.ConnectionService"%>
<%@page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Calendar" %>



<%

Local printLocal = new Local();
int printLanguageCode = Util.safeInt(session.getAttribute("languageCode"));

MyResourceBundle printConstants = printLocal.loadPropertiesFileNew("print",printLanguageCode);
MyResourceBundle commentConstants = printLocal.loadPropertiesFileNew("comments",printLanguageCode);
Object objprint = session.getAttribute("constants");
ConnectionService printObj = new ConnectionService();
MyProperties rBPrintConstants = null;
if(objprint != null)
{
	rBPrintConstants = (MyProperties) objprint;
}
else
{
	rBPrintConstants = new MyProperties(printLocal.loadPropertiesFile("constants", printLanguageCode));
	session.setAttribute("constants", rBPrintConstants);
}
//Get current plan id and user id
String getPlanId= "";
String getUserIde= "";

if(session.getAttribute("planid")!=null && !session.getAttribute("planid").equals("")){
	getPlanId = String.valueOf(Util.safestr(session.getAttribute("planid")));
}
if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("")){
	getUserIde = SharedFunction.encryptString(String.valueOf(Util.safestr(session.getAttribute("User_Id"))));
}
boolean isUserHavePlatinumPlan=false;
	
if (getPlanId.equals("8") || getPlanId.equals("9")||getPlanId.equals("10")){
	isUserHavePlatinumPlan=true;
}
else
{
	isUserHavePlatinumPlan=false;
}
%>

<script  type="text/javascript">

    $(document).ready(function(){   
    
    
    $(".print-chart").click(function() {     	
    	submitOrder(); 
    	});
    $(".cancel-prc").click(function() { closeModal(); });
    
    });
    
function openprintdialog() {
	 $.ajax({
		 url: "sessioncheckofuserid.jsp",
		 async: false,
		 success: function(result){
         if(result.trim() == null   || result.trim() == "" || result.trim() == "null"  )
     	{
        window.location.href = 'login.asp?refferurl=print';
     	}
         else{
        	 $('#printalert').html('');
             $('#print-popup').modal('open'); 
         }
        }});
 }


	function checkAllIteam() {
		 var clist=document.getElementsByClassName("checkedalliteam");
		if (document.orderFormNew.Check_ctr_all.checked == true) {
           for (var i = 0; i < clist.length; ++i) { clist[i].checked = true; }
           $("#fromYearToShow").show();
        }
        else {
        	for (var i = 0; i < clist.length; ++i) { clist[i].checked = false; }
        	$("#fromYearToShow").hide();
        } 
	}
	function checkSingleCatAllIteam(catClassName,catIdName) {
		var allClist1=document.getElementsByClassName("checkedalliteam");
		var classNameToChecked="."+catClassName;
		var catIdListTOChecked="#"+catIdName;
			if($(catIdListTOChecked).prop("checked") == true){
				$(classNameToChecked).prop('checked', true);
			}
			else{
				$(classNameToChecked).prop('checked', false);
				$("#Check_ctr_all").prop('checked',false);
			}
			for (var i = 0; i < allClist1.length; ++i) {
				if(allClist1[i].checked == false){
					$("#Check_ctr_all").prop('checked',false);	
					break;
				}
				else{$("#Check_ctr_all").prop('checked',true);$("#fromYearToShow").show();}
			}
	}
	
	var preSelectedModule=null;
	function checkSelectedModuleItem(value){
	   if(preSelectedModule!=null){
		   for(var j=0;j<preSelectedModule.length;j++){
			  $(preSelectedModule[j]).prop('checked', false);
			}
		}
		
		var basicModule=["#itemListId00","#itemListId143","#itemListId244","#itemListId352","#itemListId422","#itemListId69"];
		var easyModule=["#itemListId00","#itemListId143","#itemListId244","#itemListId352","#itemListId422","#itemListId69","#itemListId021","#itemListId153","#itemListId254","#itemListId323","#itemListId74"];
		var varshfalModule=["#itemListId00","#itemListId143","#itemListId244","#itemListId352","#itemListId422","#itemListId69","#itemListId08"];
		var kpModule=["#itemListId00","#itemListId143","#itemListId244","#itemListId352","#itemListId422","#itemListId69","#itemListId011","#itemListId138","#itemListId239","#itemListId345","#itemListId446","#itemListId547","#itemListId648","#itemListId749"];
		var lalKitabModule=["#itemListId07","#itemListId110","#itemListId228","#itemListId329","#itemListId430"];
		var jaiminiModule=["#itemListId00","#itemListId143","#itemListId244","#itemListId352","#itemListId422","#itemListId69","#itemListId050","#itemListId151","#itemListId241"];
		var specialModule=["#itemListId00","#itemListId143","#itemListId244","#itemListId352","#itemListId422","#itemListId69","#itemListId715","#itemListId514","#itemListId021","#itemListId153","#itemListId254","#itemListId323","#itemListId74","#itemListId927","#itemListId826",
			"#itemListId652","#itemListId519","#itemListId42","#itemListId08","#itemListId07","#itemListId110","#itemListId228","#itemListId329","#itemListId430","#itemListId011","#itemListId138","#itemListId239","#itemListId345","#itemListId446","#itemListId547","#itemListId648","#itemListId749","#itemListId050","#itemListId151","#itemListId241"];
		
		var selectedModule=null;
		if(value==0){
			selectAllSingleCategoryCheckBox(-1,-1,-1,-1);
		}else if(value==1){
			selectedModule=basicModule;
		}else if(value==2){
			selectedModule=easyModule;
		}else if(value==3){
			selectedModule=varshfalModule;
			selectAllSingleCategoryCheckBox(4,-1,-1,-1);
		}else if(value==4){
			selectedModule=kpModule;
			selectAllSingleCategoryCheckBox(7,-1,-1,-1);
		}else if(value==5){
			selectedModule=lalKitabModule;
			selectAllSingleCategoryCheckBox(5,-1,-1,-1);
		}else if(value==6){
			selectedModule=jaiminiModule;
			selectAllSingleCategoryCheckBox(8,-1,-1,-1);
		}else if(value==7){
			selectedModule=specialModule;
			selectAllSingleCategoryCheckBox(4,5,7,8);
		} 
		

		preSelectedModule=selectedModule;
		if(selectedModule!=null){
			for(var i=0;i<selectedModule.length;i++){
				
				$(selectedModule[i]).prop('checked', true);
			}	
		}
		
	}
	 function selectAllSingleCategoryCheckBox(cb1,cb2,cb3,cb4){
		 var allCheckbox=["#singleCatAllIteamId0",
			 "#singleCatAllIteamId1",
			 "#singleCatAllIteamId2",
			 "#singleCatAllIteamId3",
			 "#singleCatAllIteamId4",
			 "#singleCatAllIteamId5",
			 "#singleCatAllIteamId6",
			 "#singleCatAllIteamId7",
			 "#singleCatAllIteamId8"];
		 
		 for(var i=0;i<allCheckbox.length;++i){
			
			 if(i==cb1||i==cb2||i==cb3||i==cb4){
				 $(allCheckbox[i]).prop('checked', true); 
				 
			 }else{
				 $(allCheckbox[i]).prop('checked', false);
			 }
		 }
	 }
	function checkForAllSelect(getIteamListId,getCatId){
		var catList=document.getElementsByClassName(getCatId);
		var allClist=document.getElementsByClassName("checkedalliteam");
		var iteamListId ="#"+getIteamListId;
		var catListId ="#"+getCatId;
		if($(iteamListId).prop("checked") == false){
			$(catListId).prop('checked', false);
			$("#Check_ctr_all").prop('checked',false);
		}
		for (var i = 0; i < catList.length; ++i) {
			if(catList[i].checked == false){
				$(catListId).prop('checked', false);
				break;
			}
			else{$(catListId).prop('checked', true);}
		}
		for (var i = 0; i < allClist.length; ++i) {
			if(allClist[i].checked == false){
				$("#Check_ctr_all").prop('checked',false);	
				break;
			}
			else{$("#Check_ctr_all").prop('checked',true);}
		}
	}
	
	$(function () {
        $("#itemListId08,#singleCatAllIteamId4").click(function () {
            if ($(this).is(":checked")) {
                $("#fromYearToShow").show();
            } else {
                $("#fromYearToShow").hide();
            }
        });
    });
   function submitOrder() 
    {       
       
    	var Cookies_Var = "";
        var alertString = String("");     
        var getDate = new Date();
		var getYear = getDate.getFullYear();
		var startingYearForAP=getYear;
        var noOfYearAP = 5;
        var usChartId= 0;
        var alertString="";
        var indexArr = [];
        var indexValueArr = [];
        //If any single page is added in print madule then increase the size of array
        var alertArray = new Array(57).fill('0');//This is maximum array size to show maximum single page implemented in dhruv plan

      	   $("input[name='check_list']:checked").each( function () {
      		   var getIndexValue = $(this).val();
      		 	var getIndexAndValue = getIndexValue.split("#");
      	       	indexArr.push(getIndexAndValue[0]);
      			indexValueArr.push(getIndexAndValue[1]);
      	   
      	   });
      	for(var j=0; j<indexArr.length; j++){
      	 	for (var i = 0; i < alertArray.length; i++) { 
	      		if(indexArr[j]==i){
	      			alertArray[i]=indexValueArr[j];
	      		}
	      	}
      	}
      	if (document.orderFormNew.Check_ctr_all.checked == true) {
      		alertArray[20]=17;
         }
      	alertString = alertArray.join(',');
      	//if any single page is added this module then add 0 zero to validate the check all field required 
      	if (alertString == "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0") {
           alert("Please select atleast one check box.");
           return false;
        }        
        
      	if(document.getElementById("startYearForAP")!== null && document.getElementById("noOfYearAP")!== null && document.getElementById("userBirthYear")!== null ){
        	if(document.getElementById("startYearForAP").value !=="" && document.getElementById("noOfYearAP").value !=="" && document.getElementById("userBirthYear").value !==""){
        		var constHundred = 100;
        		var constTwentyFive = 25;
        		var getUserBirthYear = document.getElementById("userBirthYear").value;
        		var recYear=document.getElementById("startYearForAP").value;
        		var noOfYears=document.getElementById("noOfYearAP").value;
        		//validate year is addition of given year and no of year
        		var validateYear = parseInt(recYear)+parseInt(noOfYears);
        		//max year is 100 year from user birth year.
        		var maxYear = parseInt(getUserBirthYear)+parseInt(constHundred);
        		
        		if(document.getElementById("startYearForAP").value < getUserBirthYear){
        			alert("From Year is not less than birth year");
        			document.getElementById("startYearForAP").focus();
        			return false;
        		}
        		if(validateYear > maxYear){
        			alert("You cannot view the predictions for more than 100 years from birth.");
        			document.getElementById("startYearForAP").focus();
        			return false;
        		}
        		if(document.getElementById("noOfYearAP").value <1){
        			alert("No. of years is not less than 0");
        			document.getElementById("noOfYearAP").focus();
        			return false;
        		}
        		if(document.getElementById("noOfYearAP").value >constTwentyFive){
        			alert("No. of years is not more than 25 years from birth year.");
        			document.getElementById("noOfYearAP").focus();
        			return false;
        		}
        	}
        }
      	
        if(document.getElementById("startYearForAP")!== null){
        	if(document.getElementById("startYearForAP").value !==""){
        		startingYearForAP = document.getElementById("startYearForAP").value;
        	}
        }
        
        if(document.getElementById("noOfYearAP")!== null){
        	if(document.getElementById("noOfYearAP").value !==""){
        		noOfYearAP = document.getElementById("noOfYearAP").value;
        	}
        }
        
        if(document.getElementById("userChartId")!== null){
        	if(document.getElementById("userChartId").value !==""){
        		usChartId = document.getElementById("userChartId").value;
        	}
        }
        
        if (alertString != "") {
        	 alert("/cloud/indexbox.jsp?pagecounter=" + alertString+"&yearOfAP="+noOfYearAP+"&startingYear="+startingYearForAP+"&userChartId="+usChartId);
        	window.location = "/cloud/indexbox.jsp?pagecounter=" + alertString+"&yearOfAP="+noOfYearAP+"&startingYear="+startingYearForAP+"&userChartId="+usChartId
        }
       
        closeModal();
    }
   
   function closeModal() {
       $('#print-popup').modal('close');
   }
	function showUserContent() {
        var sessionval;
        var msg = "";
        var useridsession;
        var chartidsession;
        var hh22;
        var horoscopesession;
        $.get('/cloud/control/getsession.jsp', function (data) {

            sessionval = data.split("|");
            useridsession = sessionval[0];
            chartidsession = sessionval[1];
            hh22 = sessionval[2];
            horoscopesession = sessionval[3];

            if (hh22.trim() == "true" && chartidsession.trim() == "true") {
                msg = "";
            }
            else {
                if (hh22 == "true" && chartidsession == "false") {
                    msg = "Please <a href='#' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;' onclick=openChart('open');>open the chart</a> first to save comment.";
                }
                else {
                    if (useridsession.trim() == "false") {
                        msg = "You are not logged in.Please <a href='login.asp' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;'>Login</a>.";
                    }
                    else {
                        msg = '<%=commentConstants.getString("YOU_ARE_NOT_OUR_PREMIUM_USER_TO_HAVE_THIS_FACILITY_PLEASE_UPGRADE_YOUR_PLAN1") %>';
                    }
                }
            }
            if (horoscopesession.trim() == "false") {
                msg = "<b>Your Session has been expired.Please <a href='login.asp' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;'>Login</a> again.</b>";
            }

            if (msg == "") {
                document.getElementById('usercontent').style.display = 'block';
                document.getElementById('user-msg').style.display = 'none';
            }
            else {
                document.getElementById('usercontent').style.display = 'none';
                document.getElementById('user-msg').style.display = 'block';
                document.getElementById('user-msg').innerHTML = msg;
            }
        });

    }
</Script>
<%
if(session.getAttribute("User_Id")!=null && !session.getAttribute("User_Id").equals("") && session.getAttribute("planid")!=null && !session.getAttribute("planid").equals("")){
	String keyVar="-1489918760";
	String para="key="+keyVar+"&asplanid="+getPlanId+"&asus="+getUserIde+"&language="+printLanguageCode;
	//String printUrl="https://api2.astrosage.com/as/module-names-to-print-pdf.asp";
	String printUrl="https://japp.astrosage.com/module-names-to-print-pdf.asp";
	String jsonResponse = printObj.invokeURLRetrieveData(printUrl, para, "");

	JSONArray jArray = new JSONArray(jsonResponse);	
	//jArray.setCharacterEncoding("UTF-8");
	DesktopHoro objprinthoro = (DesktopHoro) session.getAttribute("HoroscopeObj");
	Calendar calInstance= Calendar.getInstance();
	int currYear = calInstance.get(Calendar.YEAR);
	int getUserBirthYear=currYear;
	if(objprinthoro != null){
		getUserBirthYear=objprinthoro.getYearOfBirth();
	}
	int chartid=0;
	if(session.getAttribute("ChartId") == null || session.getAttribute("ChartId").equals(""))
	{
		chartid=0;
	}   
	else{
		
			chartid = Util.safeInt(session.getAttribute("ChartId"));
	}
	
%>
<div id="print-popup" class="modal modal-fixed-footer">
    <div class="modal-content modal-print-popup">
    <form name="orderFormNew" id="orderFormNew">
    <div class="print-header">
    <div class="row"> 
    <div class="col s6 l4 print-style">
    <h2><%=rBPrintConstants.getString("SELECT_PAGE_PRINT") %></h2>
    </div>
    <div class="col s6 l8">
    <ul class="modal-print"> 
    <li> <div class="ui-chk">
                     <input type="checkbox" class="filled-in" value="yes" name="Check_ctr_all" id="Check_ctr_all" onclick="checkAllIteam()" />
                   	<label for="Check_ctr_all"><%=printConstants.getString("ALL_REPORTS") %></label>
                     </div> </li>
                       <li class="mr-zero d-none" >
                        <select id ="ddl" name="ddl" onmousedown="this.value='';" onchange="checkSelectedModuleItem(this.value);">
  <option value='0'><%=printConstants.getString("SELECT_MODULE") %></option>
  <option value='1'><%=printConstants.getString("BASIC_MODULE") %></option>
  <option value='2'><%=printConstants.getString("EASY_MODULE") %></option>
  <option value='3'><%=printConstants.getString("VARSHFAL_MODULE") %></option>
  <option value='4'><%=printConstants.getString("KP_MODULE") %></option>
  <option value='5'><%=printConstants.getString("LAL_KITAB_MODULE") %></option>
  <option value='6'><%=printConstants.getString("JAIMINI_MODULE") %></option>
  <option value='7'><%=printConstants.getString("SPECIAL_MODULE") %></option>
  
</select>
                        </li> 
    </ul>
    </div>
    </div>
    </div>
    
   <div class="print-body">
    <div class="row">
     <div class="col s4 l4">
      <ul class="tabs">
      	<%
      	for(int i=0 ; i<jArray.length();i++){
      		JSONObject jobejct=jArray.getJSONObject(i);
      		String getCat= jobejct.getString("Category");
      		String catItamList="#categoryiteamlist"+i;
      		%>
      		<li class="tab"><a href="<%=catItamList%>"><%=getCat%></a></li>
      		<%
      	}
      	%>
      </ul>
    </div>
    <div class="col s8 l8">
    <div class="area-modal"> 
    <%
    for(int i=0 ; i<jArray.length();i++){
    	JSONObject jobejct=jArray.getJSONObject(i);
    	JSONArray sArray = jobejct.getJSONArray("SubCategory");
    	String getCat= jobejct.getString("Category");
    	String catIteamListID="categoryiteamlist"+i;
    	String singleCatAllIteamId="singleCatAllIteamId"+i;
    	%>
    	<div id="<%=catIteamListID%>" class="m-area">
    	<div class="upper-area">
            <div class="row resposnice-chk"> 
             	<div class="col s12 l12"> 
             		<div class="ui-chk">
                             <input type="checkbox" class="filled-in checkedalliteam" value="<%=singleCatAllIteamId %>" onclick="checkSingleCatAllIteam('<%=catIteamListID %>','<%=singleCatAllIteamId %>')" name="<%=singleCatAllIteamId %>" id="<%=singleCatAllIteamId%>">
                             <label for="<%=singleCatAllIteamId%>"> <%=getCat %></label>
             		</div>
             	</div> 
             </div>
        </div>
    	<div class="body-area">
    		<div class="ui-modal-ch">    			
		        <div class="row">
		        <%
		        for(int j=0; j<sArray.length();j++){
		   		 JSONObject sObject=sArray.getJSONObject(j);
		   		 String TextToShow = sObject.getString("TextToShow");
		   		 String ValueOfModule = sObject.getString("ValueOfModule");
		   		 String IndexOfModule = sObject.getString("IndexOfModule");
		   		 String itemListId="itemListId"+j+IndexOfModule;
		   		 %>
		   		 <div class="col s12 l6">
		   		 <input type="checkbox" id="<%=itemListId %>" name="check_list" onclick="checkForAllSelect('<%=itemListId %>','<%=singleCatAllIteamId%>')"; class="ch checkedalliteam <%=catIteamListID %> <%=singleCatAllIteamId%>" value="<%=IndexOfModule+"#"+ValueOfModule%>" />
		   		 <label class="lb" for="<%=itemListId%>"><%=TextToShow %></label>
		   		 </div>
		   		 <%
		   		 if(IndexOfModule.equals("8")&& ValueOfModule.equals("18")&& isUserHavePlatinumPlan){
		   			 %>
		   			 <br>
		   			 
		   			 <div id="fromYearToShow" Style="display:none;">
		   			 <div class="row"> 
		   			 <div class="input-field col s12">
		   			 <span> From Year </span>
		   			 <input type="number" name="startYearForAP" id="startYearForAP" value="<%=currYear%>">
		   			 <input type="hidden" name="userBirthYear" id="userBirthYear" value="<%=getUserBirthYear%>">
		   			 <input type="hidden" name="userChartId" id="userChartId" value="<%=chartid%>">
		   			 </div>
		   			 <div class="input-field col s12">
		   			 <span> No of Year </span>
		   			  <input type="number" name="noOfYearAP" id="noOfYearAP" value="5">
		   			 </div>
		   			 
		   			 
		   			 
			         </div>
			         </div>
		   			 <%
		   		 }
		   	 	}
		        %>
		        </div>
    		</div>
    	</div>
    	</div>
    	<%}%>
    </div>    
    </div>
  </div>
        

    
    </div>
    
    
    
    </form>  
    </div>
    <div class="modal-footer footer-print">
    <div class="row">
    <div class="col s6"> <div class="center br-right"> <a href="#!" class="modal-close waves-effect waves-green"><%=rBPrintConstants.getString("CLOS") %></a> </div>  </div>
    <div class="col s6"> <div class="center"> <a href="#!" class="waves-effect waves-green orange-text print-chart"><%=rBPrintConstants.getString("PRINT") %></a> </div>  </div>
    </div>
      
    </div>
  </div>
  <%}%>