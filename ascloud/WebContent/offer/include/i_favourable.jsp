<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<% 
Local local = new Local();
int languageCode = (Integer) session.getAttribute("languageCode");
MyProperties constants = (MyProperties) session.getAttribute("constants");
MyResourceBundle gemStoneConstants = local.loadPropertiesFileNew("favourable", languageCode); 
MyResourceBundle miscConstants = local.loadPropertiesFileNew("misc", languageCode); 
%>
<div align="center" class="heading-sec">
    <h2>
        <%=gemStoneConstants.getString("FAV_PERIODS")%> (<%=miscConstants.getString("SAMPLE")%>)
    </h2>
</div>
<div class="inner-sec">

    <div class="padding-lr">
        <h3>
            <%=gemStoneConstants.getString("FAV_MARRIAGE_HEAD") %></h3>
        <p>
            <%=gemStoneConstants.getString("FAV_MARRIAGE_DESC") %></p>
        <h3>
            <%=gemStoneConstants.getString("MARRIAGE_ANALYSIS") %></h3>
        <!--#include file='i_fav-table-1.asp'-->
        <div class="padding-lr"><%=gemStoneConstants.getString("FAV_SAMPLE_DESC")%></div>
        <h3>
            <%=gemStoneConstants.getString("FAV_CARRIER_HEAD") %></h3>
        <p>
            <%=gemStoneConstants.getString("FAV_CARRIER_DESC") %></p>
        <h3>
            <%=gemStoneConstants.getString("FAV_MISC_ANALYSIS") %></h3>
        <!--#include file='i_fav-table-2.asp'-->
        <div class="padding-lr"><%=gemStoneConstants.getString("FAV_SAMPLE_DESC")%></div>
        <h3>
            <%=gemStoneConstants.getString("FAV_BUSINESS_HEAD") %></h3>
        <p>
            <%=gemStoneConstants.getString("FAV_BUSINESS_DESC") %></p>
        <h3>
            <%=gemStoneConstants.getString("FAV_MISC_ANALYSIS") %></h3>
        <!--#include file='i_fav-table-3.asp'-->
        <div class="padding-lr"><%=gemStoneConstants.getString("FAV_SAMPLE_DESC")%></div>
        <h3>
            <%=gemStoneConstants.getString("FAV_HOUSE_HEAD") %></h3>
        <p>
            <%=gemStoneConstants.getString("FAV_HOUSE_DESC") %></p>
        <h3>
            <%=gemStoneConstants.getString("FAV_HOUSE_ANALYSIS") %></h3>
        <!--#include file='i_fav-table-4.asp'-->
        <div class="padding-lr"><%=gemStoneConstants.getString("FAV_SAMPLE_DESC")%></div>
    </div>
</div>
