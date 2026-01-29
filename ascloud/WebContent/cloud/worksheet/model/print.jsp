<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

Local printLocal = new Local();
int printLanguageCode = (Integer)session.getAttribute("languageCode");
MyProperties rBPrintConstants = (MyProperties) session.getAttribute("constants");
MyResourceBundle printConstants = printLocal.loadPropertiesFileNew("print",printLanguageCode);
MyResourceBundle commentConstants = printLocal.loadPropertiesFileNew("comments",printLanguageCode);

%>

<script  type="text/javascript">
    
    $(document).ready(function(){
    $('#dialog-form-print').dialog(
    {
        autoOpen: false,
        title: '<%=rBPrintConstants.getString("PRINT") %>',
        height: 350,
        width: 550,
        modal: true,
        buttons: {
        '<%=rBPrintConstants.getString("PRINT") %>': function() { submitOrder(); },
        '<%=rBPrintConstants.getString("CANCEL")%>':function(){closeModal();}   
        }
    });
    });
function openprintdialog() {
        $('#printalert').html('');
        $('#dialog-form-print').dialog('open');
    }

    function Check(chk) {
        if (document.orderForm.Check_ctr.checked == true) {
            for (i = 0; i < chk.length; i++)
                chk[i].checked = true;
        }
        else {
            for (i = 0; i < chk.length; i++)
                chk[i].checked = false;
        }

    }

    function submitOrder() {
        var Cookies_Var = "";
        var alertString = String("");
        if (document.getElementById('BD').checked == true) {
            alertString += "1,";

            Cookies_Var = "BD|"
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('LP').checked == true) {
            Cookies_Var = Cookies_Var + "LP|"
            alertString += "2,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('GP').checked == true) {
            Cookies_Var = Cookies_Var + "GP|"
            alertString += "3,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('MC').checked == true) {
            Cookies_Var = Cookies_Var + "MC|"
            alertString += "4,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('CTP').checked == true) {
            Cookies_Var = Cookies_Var + "CTP|"
            alertString += "5,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('DP').checked == true) {
            Cookies_Var = Cookies_Var + "DP|"
            alertString += "6,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('SSR').checked == true) {
            Cookies_Var = Cookies_Var + "SSR|"
            alertString += "7,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('LKP').checked == true) {
            Cookies_Var = Cookies_Var + "LKP|"
            alertString += "8,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('AP').checked == true) {
            Cookies_Var = Cookies_Var + "AP|"
            alertString += "9,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('SV').checked == true) {
            Cookies_Var = Cookies_Var + "SV|"
            alertString += "10,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('LalK').checked == true) {
            Cookies_Var = Cookies_Var + "LalK|"
            alertString += "11,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('KP').checked == true) {
            Cookies_Var = Cookies_Var + "KP|"
            alertString += "12,";
        }
        else {
            alertString += "786,";
        }

        //deepak June 6 2011
        if (document.getElementById('CD').checked == true) {
            Cookies_Var = Cookies_Var + "CD|"
            alertString += "13,";
        }
        else {
            alertString += "786,";
        }


        if (document.getElementById('YD').checked == true) {
            Cookies_Var = Cookies_Var + "YD|"
            alertString += "14,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('FT').checked == true) {
            Cookies_Var = Cookies_Var + "FT|"
            alertString += "15,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('SnB').checked == true) {
            Cookies_Var = Cookies_Var + "SnB|"
            alertString += "16,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('AT').checked == true) {
            Cookies_Var = Cookies_Var + "AT|"
            alertString += "17,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('Pvarga').checked == true) {
            Cookies_Var = Cookies_Var + "Pvarga|"
            alertString += "18,";
        }
        else {
            alertString += "786,";
        }

        if (document.getElementById('kalsharp').checked == true) {
            Cookies_Var = Cookies_Var + "kalsharp|"
            alertString += "19,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('PlanetConsideration').checked == true) {
            Cookies_Var = Cookies_Var + "PlanetConsideration|"
            alertString += "20,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('Check_ctr').checked == true) {
            Cookies_Var = Cookies_Var + "Check_ctr|"
            alertString += "21,";
        }
        else {
            alertString += "786,";
        }
        //**** for adding 21st index of array for pdf (Acsendent prediction not visible in print box) ******************
        if (document.getElementById('AscPre').checked == true) {
            Cookies_Var = Cookies_Var + "AscPre|"
            alertString += "22,";
        }
        else {
            alertString += "786,";
        }
        if (document.getElementById('Vimdasha').checked == true) {
            Cookies_Var = Cookies_Var + "Vimdasha|"
            alertString += "23";
        }
        else {
            alertString += "786";
        }

        if (alertString == "786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786,786") {
            //alert("Please select atleast one check box.");
            $('#printalert').css('color', 'Red');
            $('#printalert').html("<b>Please select atleast one check box.</b>");
            return false;
        }

        if (alertString != "") {
        	window.location = "model/indexbox.jsp?pagecounter=" + alertString
        }
        closeModal();
    }

    function closeModal() {
        $('#dialog-form-print').dialog('close');
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

            if (hh22 == "True" && chartidsession == "True") {
                msg = "";
            }
            else {
                if (hh22 == "True" && chartidsession == "False") {
                    msg = "Please <a href='#' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;' onclick=openChart('open');>open the chart</a> first to save comment.";
                }
                else {
                    if (useridsession == "False") {
                        msg = "You are not logged in.Please <a href='login.asp' style='text-decoration:underline;font-size:16px;font-weight:bold;color:red;'>Login</a>.";
                    }
                    else {
                        msg = '<%=commentConstants.getString("YOU_ARE_NOT_OUR_PREMIUM_USER_TO_HAVE_THIS_FACILITY_PLEASE_UPGRADE_YOUR_PLAN1") %>';
                    }
                }
            }
            if (horoscopesession == "False") {
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


<div id="dialog-form-print" style="display:none;">
    <form name="orderForm">
        <table border="0" cellpadding="0" cellspacing="0" align="left" width="100%">   
        <div id="printalert"></div>        
            <tr>
                <td width="100%" colspan="2" style="text-align: left; border-bottom:1px dashed #ddd; background-color:#F1D49A; padding-top:5px;padding-bottom:5px; padding-left:6px;">
                    <span><input type="checkbox" value="yes" name="Check_ctr" id="Check_ctr" onclick="Check(document.orderForm.check_list)">
                    </span>
                    <span><font color="#9C0000"><strong><%=printConstants.getString("ALL_REPORTS") %></strong></font></span>
                </td>
            </tr> 
            <tr>
                <td style="text-align: left;padding-top:5px;padding-left:6px;">
                    <input type="checkbox" value="Basic_Details" name="check_list" id="BD"><font color="black"><strong><%=rBPrintConstants.getString("BASIC_DETAILS") %></strong></font>
                </td>
                <td style="text-align: left;">
                    <input type="checkbox" value="Lagna_Page" name="check_list" id="LP"><font color="black"><strong><%=rBPrintConstants.getString("LAGNA")%>&nbsp; <%=printConstants.getString("PAGE")%></strong></font>
                </td>
            </tr>          
            <tr>
                <td style="text-align: left;padding-left:6px;">
                    <input type="checkbox" value="General_Predictions" name="check_list" id="GP"><font
                        color="black"><strong><%=rBPrintConstants.getString("GENERAL_PREDICTION") %></strong></font>
                </td>
                <td style="text-align: left;">
                    <input type="checkbox" value="Manglik_Considerations" name="check_list" id="MC"><font
                        color="black"><strong><%=rBPrintConstants.getString("MANGLIK_CONSIDERATIONS") %></strong></font>
                </td>
            </tr>            
            <tr>
                <td style="text-align: left;padding-left:6px;">
                    <input type="checkbox" value="Current_Transit_Predictions" name="check_list" id="CTP"><font
                        color="black"><strong><%=rBPrintConstants.getString("CURRENT_TRANSIT_PREDICTIONS") %></strong></font>
                </td>
                 <td style="text-align: left;">
                    <input type="checkbox" value="Dasha_Predictions" name="check_list" id="DP"><font
                        color="black"><strong><%=rBPrintConstants.getString("DASHA_PREDICTIONS") %></strong></font>
                </td>
            </tr>           
            <tr>
                <td style="text-align: left;padding-left:6px;">
                    <input type="checkbox" value="Sade_Sati_Report" name="check_list" id="SSR"><font
                        color="black"><strong><%=printConstants.getString("SADE_SATI_REPORT") %></strong></font>
                </td>
                <td style="text-align: left;">                
                 <input type="checkbox" value="Lal_Kitab_Predictions" name="check_list" id="LKP">
                    <font color="black"><strong><%=rBPrintConstants.getString("LAL_KITAB_PREDICTIONS") %></strong></font>
                </td>
            </tr>            
            <tr>
                <td style="text-align: left;padding-left:6px;">
                    <input type="checkbox" value="Annual_Predictions" name="check_list" id="AP"><font
                        color="black"><strong><%=printConstants.getString("ANNUAL_PREDICTIONS") %></strong></font>
                </td>
                <td style="text-align: left">
                    <input type="checkbox" value="Shodashvarga" name="check_list" id="SV"><font color="black"><strong><%=rBPrintConstants.getString("SHODASHVARGA") %></strong></font>
                </td>
            </tr>           
            <tr>
                <td style="text-align: left;padding-left:6px;">
                
               <input type="checkbox" value="LalKitab" name="check_list" id="LalK"><font color="black"><strong><%=printConstants.getString("LALKITAB") %></strong></font>
                </td>
                <td style="text-align: left">
                    <input type="checkbox" value="KPPage" name="check_list" id="KP"><font color="black"><strong><%=rBPrintConstants.getString("KP_SYSTEM") %> / <%=printConstants.getString("NAKSHATRA_NADI")%></strong></font>
                </td>
            </tr>
           
            <!--Deepak 6 June 2011-->
            <tr>
                <td style="text-align: left;padding-left:6px;">
               
                  <input type="checkbox" value="CharDasha" name="check_list" id="CD"><font color="black"><strong><%=rBPrintConstants.getString("CHAR_DASHA") %></strong></font>
                </td>
                <td style="text-align: left;">
                    <input type="checkbox" value="Vimdasha" name="check_list" id="Vimdasha"><font color="black"><strong><%=rBPrintConstants.getString("VIMSHOTTARI_DASHA") %></strong></font>
            </td>
            </tr>
            <tr>
                <td style="text-align: left;padding-left:6px;">
                
                  <input type="checkbox" value="YoginiDasha" name="check_list" id="YD"><font color="black"><strong><%=rBPrintConstants.getString("YOGINI_DASHA") %></strong></font>
                </td>
            
                <td style="text-align: left;">
                    <input type="checkbox" value="friendship" name="check_list" id="FT"><font color="black"><strong><%=rBPrintConstants.getString("FRIENDSHIP_TABLE") %></strong></font>
                </td>
                </tr>
            <tr>
                <td style="text-align: left;padding-left:6px;">
                    <input type="checkbox" value="ShadAndBhav" name="check_list" id="SnB"><font color="black"><strong><%=printConstants.getString("SHAD_BALA_BHAV_BALA") %></strong></font>
                </td>
            
                <td style="text-align: left;">
                    <input type="checkbox" value="AshtakTable" name="check_list" id="AT"><font color="black"><strong><%=rBPrintConstants.getString("ASHTAKVARGA_TABLE") %></strong></font>
                </td>
                </tr>  
            <tr>
                <td style="text-align: left;padding-left:6px;">
                
                   <input type="checkbox" value="Prastharashtakvarga" name="check_list" id="Pvarga"><font
                        color="black"><strong><%=printConstants.getString("PRASTHARASHTAKVARGA") %></strong></font>
                </td>
            
                <td style="text-align: left;">
                
                 <input type="checkbox" value="Kalsharp" name="check_list" id="kalsharp"><font color="black"><strong><%=rBPrintConstants.getString("KALSHARP_DOSH") %></strong></font>
                </td>
                </tr>  
            <tr>
                <td style="text-align: left;padding-left:6px;">
                
                  <input type="checkbox" value="PlanetConsideration" name="check_list" id="PlanetConsideration"><font
                        color="black"><strong><%=rBPrintConstants.getString("PLANETS_CONSIDERATION") %></strong></font>
                </td>
                <%//**** for adding 21st index of array for pdf (Acsendent prediction not visible in print box)'**************%>
            <td style="text-align: left; visibility:hidden;">
                <input type="checkbox" value="AscPre" name="check_list" id="AscPre"><font
                    color="black"><strong><%=rBPrintConstants.getString("ASCENDANT")+" "+rBPrintConstants.getString("PREDICTIONS") %></strong></font>
            </td>
            </tr>                        
            
        </table>
        </form>
</div> 