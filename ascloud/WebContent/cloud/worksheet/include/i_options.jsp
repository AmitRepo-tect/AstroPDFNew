<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<script src="js/i_option-js.jsp"></script>
  <%
//Local local_op = new Local();
int languageCode_op = (Integer)session.getAttribute("languageCode");
MyProperties rBConstants_op = (MyProperties) session.getAttribute("constants");
%>  
<div id="dialog-edit" title='<%=rBConstants_op.getString("SELECT_COMPONENT")%>'>
    <div class="ui-global-table" id="wrapperdiv">   
        <input type="hidden" name="contentid" value="" id="contentid" />
        <input type="hidden" name="headingid" value="" id="headingid" />
        <input type="hidden" name="portletboxid" value="" id="portletboxid" />
    </div>
</div>