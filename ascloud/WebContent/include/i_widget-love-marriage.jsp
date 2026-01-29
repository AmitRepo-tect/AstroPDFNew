<style>
    .services-ad{ margin:0px;}
    .services-ad img{ padding-right:16px;}
    .orderbtn
    {
        display:inline-block;
        float:right;
    }
    .orderbtn > a
    {
        background: #FF6F00;
        padding: 10px 15px;
        font-size: 18px;
        box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
        border-radius: 3px;
        color: #fff;
    }
    .cardview-content{ padding:16px;}
</style>
<div class="services-ad">
    <div class="cardview-content">
       
        <img src="http://www.astrocamp.com/images/img_love.jpg" class="ui-margin-t ui-margin-r ui-margin-l"
            align="left" alt="Marriage and Love Analysis" width="100" />
        <p>
            <%=request.getAttribute("MARRIAGE_WIDGET_TEXT")%>
        </p>       
        <div class="orderbtn">
            <a href="http://buy.astrosage.com/service/marriage-and-love-analysis-new2" 
                style="text-align: center;"><%=request.getAttribute("ORDER_NOW")%> </a>
        </div>
        <div style="clear:both"></div>
    </div>
</div>
