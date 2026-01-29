<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.Common"%>
<%@page import="java.util.Calendar"%>
<%
int offerLang = Util.safeInt(request.getParameter("languageCode"));
session.setAttribute("languageCode", offerLang);
MyResourceBundle simpleConstants = new Local().loadPropertiesFileNew("constants", offerLang);
MyResourceBundle offerConst = new Local().loadPropertiesFileNew("misc", offerLang);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#FFC107" />
    <title><%=offerConst.getString("TITLE_ASTROSAGE_OFFER") %></title>
    <meta name="description" content=<%=offerConst.getString("OFFER_ASTROSAGE_DESC") %> />
    <%
    String imgSuffix = "en";
    if(offerLang > 0)
    {
    	imgSuffix = "hi";
    }
    %>
    <meta name="og:image" content="http://www.astrosage.com/offer/images/promo-fb-"+imgSufix +".jpg" />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Bree+Serif" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="dist/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/atlas/css/jquery.autocomplete.css" />
    <link rel="stylesheet" type="text/css" href="dist/css/app.css" />
    <script type="text/javascript" src="/dist/js/jquery.min.js"></script>
    <script type="text/javascript" src="/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/dist/js/as-global-ui.min.js"></script>
    <script type="text/javascript" src="/dist/js/as-social-analytics.js"></script>
    <script type="text/javascript" src="dist/js/validation.js"></script>
    <script type='text/javascript' src='/dist/js/jquery.autocomplete.min.js'></script>
</head>
<body class="bg">
    <%
       String prntId = Util.safestr(request.getParameter("prtnr_id"));
	
	if (prntId.equals("")) 
    {
		prntId= "BHFRE";
    }    
    %>
    <div class="full-width">
        <div class="app-toolbar navbar-fixed-top">
            <div class="container">
                <a href="http://www.astrosage.com/" target="_blank">
                    <img src="/images/logo.png" alt="" /></a>
            </div>
        </div>
    </div>
    <div class="clearfix">
    </div>
    <div class="container personal-horoscope-bar">
        <div class="opacity-bg">
            <div class="heading-bar">
                <h2>
                    <%=offerConst.getString("TITLE_ASTROSAGE_OFFER") %>
                </h2>
            </div>
            <div class="row">
                <div class="col-md-7 manage-btm desktop">
                    <div class="col-md-5">
                        <div align="center">
                            <img src="/images/print-kundli-en.png" class="img-responsive" alt="" />
                            <h2 class="font-style">
                                *<%=offerConst.getString("OFFER_ASTROSAGE_LIMITED") %></h2>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="right-side">
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_1") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_1") %></p>
                            </div>
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_2") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_2") %></p>
                            </div>
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_3") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_3") %>
                                </p>
                            </div>
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_4") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_4") %></p>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="right-form">
                        <form class="form-horizontal" method="post" id="getHoroForm" name="getHoroForm" action="big-horo-result.jsp?prtnr_id=<%=prntId%>"
                        onsubmit="return formValidation();">
                        <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="name">
                                <%=simpleConstants.getString("NAM") %>:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4 clr padd0" for="name">
                                <%=simpleConstants.getString("GENDR") %>:</label>
                            <div class="col-sm-8">
                                <input type="radio" name="sex" value="male" checked />
                                <span class="clr1"><%=simpleConstants.getString("MALE") %> </span>
                                <input type="radio" name="sex" value="female" />
                                <span class="clr1"><%=simpleConstants.getString("FEMALE") %> </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="name">
                                <%=simpleConstants.getString("DATAM") %>:</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-xs-4 no-padding-r">
                                        <select class="form-control form-control-sm" name="day" id="day">
                                            <option value="0">Day</option>
                                            <%for(int i = 1 ;i<= 31;i++) { %>
                                            <option value="<%=i %>">
                                                <%=i %></option>
                                            <%} %>
                                        </select>
                                    </div>
                                    <div class="col-xs-4 no-padding-l no-padding-r">
                                        <select class="form-control form-control-sm" name="month" id="month">
                                            <option value="0">Month</option>
                                            <%for(int i = 1;i<= 12;i++) { %>
                                            <option value="<%=i %>">
                                                <%=Common.engMonthNames[i-1] %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col-xs-4 no-padding-l">
                                        <select class="form-control form-control-sm" name="year" id="year">
                                            <option value="0">Year</option>
                                            <%for(int i = Calendar.getInstance().get(Calendar.YEAR);i>= 1900;i--) { %>
                                            <option value="<%=i %>">
                                                <%=i %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="name">
                                <%=simpleConstants.getString("TIMAR") %>:</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-xs-4 no-padding-r">
                                        <select class="form-control form-control-sm" name="hrs" id="hrs">
                                            <option>Hour</option>
                                            <%for(int i = 1;i<= 12;i++) { %>
                                            <option value="<%=i %>">
                                                <%=i %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col-xs-4 no-padding-l no-padding-r">
                                        <select class="form-control form-control-sm" name="min" id="min">
                                            <option>Min</option>
                                            <%for(int i = 0;i<= 59;i++) { %>
                                            <option value="<%=i %>">
                                                <%=i %></option>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="col-xs-4 no-padding-l">
                                        <select class="form-control form-control-sm" name="ampm" id="ampm">
                                            <option value="AM">AM</option>
                                            <option value="PM">PM</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="name">
                                <%=simpleConstants.getString("PLAC") %>:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" placeholder="Place (Type 3 character)" name="place"
                                    id="place" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="name">
                                <%=offerConst.getString("LANGUAGE") %>:</label>
                            <div class="col-sm-8">
                                <select class="form-control form-control-sm" name="languageCode">
                                    <option value="0" selected>English</option>
                                    <option value="1">हिंदी</option>
                                </select>
                            </div>
                        </div>
                     <!--   <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="name">
                                Chart Style:</label>
                            <div class="col-sm-8">
                                <select class="form-control form-control-sm" name="charting">
                                    <option value="0" selected>North Indian</option>
                                    <option value="1">South Indian</option>
                                </select>
                            </div>
                        </div>-->
                         <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="currentcountry">
                                <%=offerConst.getString("CURRENT_COUNTRY") %>:</label>
                            <div class="col-sm-8">
                                <select class="form-control form-control-sm" name="currentcountry">
                                    <option value="IN" selected>India</option>
                                    <option value="OTH">Others</option>
                                </select>
                            </div>
                        </div>                     
                        <div class="form-group">
                            <label class="control-label col-sm-4 clr" for="name">
                                <%=offerConst.getString("EMAIL") %>:</label>
                            <div class="col-sm-8">
                                <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-push-4 col-sm-8">
                                <a href="javascript:void(0);" id="getHoro" class="btn-orange orange btn-lg btn-block">
                                    <span><%=offerConst.getString("GET_HOROSCOPE") %></span></a>
                            </div>
                        </div>
                        <input type="hidden" value="" name="LatDeg" id="LatDeg" />
                        <input type="hidden" value="" name="LatMin" id="LatMin" />
                        <input type="hidden" value="" name="LatNS" id="LatNS" />
                        <input type="hidden" value="" name="LongDeg" id="LongDeg" />
                        <input type="hidden" value="" name="LongMin" id="LongMin" />
                        <input type="hidden" value="" name="LongEW" id="LongEW" />
                        <input type="hidden" value="" name="timeZone" id="timeZone" />
                        <input type="hidden" value="0" name="charting" />
                        <input type="hidden" value="" name="state" id="state" />
                        <input type="hidden" value="" name="country" id="country" />
                        </form>
                    </div>
                </div>
                <div class="col-md-7 manage-btm mobile">
                    <div class="col-md-5">
                        <div align="center">
                            <img src="/offer/images/print-kundli-en.png" class="img-responsive" alt="" />
                            <h2 class="font-style">
                                *<%=offerConst.getString("OFFER_ASTROSAGE_LIMITED") %></h2>
                        </div>
                    </div>
                    <div class="col-md-7">
                       <div class="right-side">
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_1") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_1") %></p>
                            </div>
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_2") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_2") %></p>
                            </div>
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_3") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_3") %>
                                </p>
                            </div>
                            <div class="mrg-btm">
                                <h2>
                                    <%=offerConst.getString("OFFER_HEADING_4") %></h2>
                                <p>
                                    <%=offerConst.getString("OFFER_DESC_4") %></p>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function findValue(li) {
            if (li == null) return alert("No match!");
            $('#state').val(li.extra[0]);
            $('#country').val(li.extra[1]);            
            $('#LatDeg').val(li.extra[2]);
            $('#LatMin').val(li.extra[3]);
            $('#LatNS').val(li.extra[4]);
            $('#LongDeg').val(li.extra[5]);
            $('#LongMin').val(li.extra[6]);
            $('#LongEW').val(li.extra[7]);
            $('#timeZone').val(li.extra[8]);
        }

        function selectItem(li) {
            findValue(li);
        }

        function formatItem(row) {
            return row[0] + " (" + row[1] + " " + row[2] + ")";
        }

        function lookupAjax() {
            var oSuggest = $("#place")[0].autocompleter;
            oSuggest.findValue();
            return false;
        }

        $(document).ready(function () {
            $("div.advancedDiv").hide();
            $("#place").autocomplete(
		    "/cloud/FindPlaces.jsp",
		    {
		        delay: 10,
		        minChars: 3,
		        matchSubset: 1,
		        matchContains: 1,
		        maxItemsToShow: 10,
		        onItemSelect: selectItem,
		        onFindValue: findValue,
		        formatItem: formatItem,
		        autoFill: true
		    }
	    );
        });
       
    </script>
</body>
</html>
