<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<h2 align="center">
Enter Your Birth Details</h2>
<form name="kundlibirthdetails" action="" class="form-horizontal" method="post" onsubmit="return formValidation();">

<fieldset class="form-box">
    <div class="form-group">
        <label for="Name" class="col-sm-4 control-label">
            Name</label>
        <div class="col-sm-8">
            <input type="text" name="Name" id="Name" class="form-control" placeholder="Name" maxlength="100" tabindex="1" />
        </div>
    </div>
    <div class="form-group">
        <label for="sex" class="col-sm-4 control-label">
            sex</label>
        <div class="col-sm-8">
            <select class="form-control" name="sex" tabindex="2" id="sex">
                <option value="male">Male</option>
                <option value="Female">Female</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="date" class="col-sm-4 control-label">
            Date <font color="red">(DD/MM/YYYY)</font></label>
        <div class="col-sm-8">
            <div class="row">
                <div class="col-xs-4">
                    <input type="number" class="form-control" name="Day" id="Day" placeholder="Day" 
                        maxlength="2" tabindex="3" data-toggle="tooltip" title="Day" value="" />
                </div>
                <div class="col-xs-4">
                    <input type="number" class="form-control input-sm-1" name="Month" id="Month" 
                        placeholder="Month" maxlength="2" tabindex="4" data-toggle="tooltip" title="Month" value="" />
                </div>
                <div class="col-xs-4">
                    <input type="number" class="form-control input-sm-3" name="Year" id="Year" 
                        placeholder="Year" maxlength="4" tabindex="5" data-toggle="tooltip" title="Year" value=""/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="time" class="col-sm-4 control-label">
            Time <font color="red">(24 hours format)</font></label>
        <div class="col-sm-8">
            <div class="row">
                <div class="col-xs-4">
                    <input type="number" class="form-control" name="Hrs" id="Hrs" placeholder="Hours" 
                        maxlength="2" tabindex="6" data-toggle="tooltip" title="Hours" value="" />
                </div>
                <div class="col-xs-4">
                    <input type="number" class="form-control input-sm-1" name="Min" id="Min" 
                        placeholder="Minute" maxlength="2" tabindex="7" data-toggle="tooltip" title="Minute" value=""/>
                </div>
                <div class="col-xs-4">
                    <input type="number" class="form-control input-sm-3" name="Sec" id="Sec" 
                        placeholder="Second" maxlength="2" tabindex="8" data-toggle="tooltip" title="Second" value=""/>
                </div>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="place" class="col-sm-4 control-label">
            Place of Birth</label>
        <div class="col-sm-8">
            <input type="text" name="place" id="place" value="<%=Util.safestr(request.getParameter("place")) %>"
                class="form-control" placeholder="Place of Birth" tabindex="9"/>
            <span id="dstval"></span>
        </div>
    </div>
    <div class="pull-left ui-margin-t">
        <a id="aTag" href="javascript:toggleAndChangeText();" class="btn btn-white card-shadow br-radius btn-sm">[&#43;]
            Coordinates and Advance Settings</a>
    </div>
    <div class="ui-margin-t pull-right">
        <a href="javaScript:void(0)" onclick="findlocation('CurrentLocation');" class="btn btn-white card-shadow br-radius btn-sm">
            Current Location</a> <a href="javaScript:void(0)" onclick="findlocation('CurrentTime');"
                class="btn btn-white card-shadow br-radius btn-sm">Now</a>
    </div>
</fieldset>
<div id="divToToggle" style="display: none;" class="clear">
<fieldset class="form-box">
        <h2 align="center">
            Advanced Settings <a href="javascript:void(0)" onclick="getgpsAccuracy();" class="pull-right"
                style="font-size: 15px;"><u>GPS Accuracy</u></a></h2>
        <div class="form-group ui-margin-t">
            <label for="longitude" class="col-sm-4 control-label">
                Longitude</label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-xs-4">
                        <input class="form-control" type="text" name="LongDeg" <%if(request.getParameter("longdeg") != null) { %>
                            value="<%=Util.safestr(request.getParameter("longdeg")) %>"<% } %>  autocomplete="off" maxlength="3" placeholder="LongDegree"
                            id="LongDeg" tabindex="10" data-toggle="tooltip" title="Longitude Degree" />
                    </div>
                    <div class="col-xs-4">
                        <input class="form-control" type="text" name="LongMin" <%if(request.getParameter("longmin") != null) { %>
                            value="<%=Util.safestr(request.getParameter("longmin")) %>"<% } %>  autocomplete="off" id="LongMin"
                            placeholder="LongMinute" tabindex="11" data-toggle="tooltip" maxlength="2" title="Longitude Minute" />
                    </div>
                    <div class="col-xs-4">
                        <select class="form-control" name="LongEW" id="LongEW" tabindex="12" data-toggle="tooltip"
                            title="Longitude Direction">
                            <option value="LongEW">LongEW</option>
                            <option value="E" >
                                E</option>
                            <option value="W" >
                                W</option>
                        </select>
                    </div>
                    <input type="hidden" id="accuracy" name="accuracy" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="latitude" class="col-sm-4 control-label">
                Latitude</label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-xs-4">
                        <input class="form-control" type="text" name="LatDeg" <%if(request.getParameter("latdeg") != null) { %>
                            value="<%=Util.safestr(request.getParameter("latdeg")) %>" <% } %> autocomplete="off" id="LatDeg"
                            title="Latitude Degree" placeholder="LatDegree"maxlength="3" tabindex="13" data-toggle="tooltip" />
                    </div>
                    <div class="col-xs-4">
                        <input class="form-control" type="text" name="LatMin" <%if(request.getParameter("longmin") != null) {%>
                            value="<%=Util.safestr(request.getParameter("longmin")) %>" <% } %> autocomplete="off" id="LatMin"
                            placeholder="LatMinute" tabindex="14" data-toggle="tooltip" maxlength="2"title="Latitude Minute" />
                    </div>
                    <div class="col-xs-4">
                        <select class="form-control" name="LatNS" id="LatNS" tabindex="15" data-toggle="tooltip"
                            title="Latitude Direction">
                            <option value="LatNS">LatNS</option>
                            <option value="N" <% if(Util.safestr(request.getParameter("latns")).toLowerCase().equals("n")) { %> selected<% } %>>
                                N</option>
                            <option value="S" <% if(Util.safestr(request.getParameter("latns")).toLowerCase().equals("s")) {  %> selected<% } %>>
                                S</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="timeZone" class="col-sm-4 control-label">
                Time Zone</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="timeZone" <%if(request.getParameter("timezone") != null) { %>
                    value="<%=Util.safestr(request.getParameter("timezone")) %>" <% } %> autocomplete="off" id="timeZone"
                    title="Time Zone in hours e.g. 5.5 for India" data-toggle="tooltip" maxlength="8" placeholder="Timezone" tabindex="16" />
            </div>
        </div>
        <div class="form-group">
            <label for="ayanamsa" class="col-sm-4 control-label">
                Ayanamsa</label>
            <div class="col-sm-8">
                <select name="ayanamsa" id="ayanamsa" class="form-control" tabindex="17">
                    <option value="0">N.C.Lahiri</option>
                    <option value="1">K.P. New</option>
                    <option value="2">K.P. Old</option>
                    <option value="3">B.V.Raman</option>
                    <option value="4">KP Khullar</option>
                    <option value="5">Sayan</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="charting" class="col-sm-4 control-label">
                Chart Style</label>
            <div class="col-sm-8">
                <select name="charting" id="charting" class="form-control" tabindex="18">
                    <option value="0">North Indian</option>
                    <option value="1">South Indian</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="kphn" class="col-sm-4 control-label">
                KP Horary Number (1-249)</label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-xs-6">
                        <input type="text" class="form-control" name="kphn" size="3" value="0" id="kphn"
                            maxlength="3" autocomplete="off" placeholder="kphn" tabindex="19" />
                    </div>
                    <div class="col-xs-6">
                        <a href="javascript:void(0)" onclick="fillkphn();"><u>Random KP Number</u></a>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
</div>
<div align="center" class="ui-margin-t clear">
    <% if (session.getAttribute("User_Id") != null) { %>
    <button type="submit" id="submit" name="submit" value="Show Kundli" class="btn btn-deep-orange card-shadow br-radius btn-small"
        tabindex="19">
        Show Kundli</button>
    <% } else { %>
    <button type="submit" name="done" value="Done"  class="btn btn-deep-orange card-shadow br-radius btn-small" tabindex="20">
    Done</button>
<button type="submit" name="doneandsave" value="Done And Save"  class="btn btn-deep-orange card-shadow br-radius btn-small" tabindex="20">
    Done And Save</button>
<%} %>
</div>
<input type="hidden" name="referrer" value="" />
<input type="hidden" name="timezoneid" id="timezoneid" value="<%=request.getParameter("timezonestring")%>" />

</form>  
<script type="text/javascript" src="/dist/js/as-autojump.min.js"></script>

