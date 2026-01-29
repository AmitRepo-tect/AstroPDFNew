<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.util.ConstantValues"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.*, java.util.*" %>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.cslsoftware.util.Constants"%>
<%
     Local local_new1 = new Local();
     int language_Code1 = Util.safeInt(session.getAttribute("languageCode"));
     MyResourceBundle rB_Constants1 = local_new1.loadPropertiesFileNew("new_notes", language_Code1);
     MyResourceBundle rB_Con = local_new1.loadPropertiesFileNew("constants", language_Code1);
     Hindi hindi_new5  = new Hindi();
%>
<!-- Modal Structure -->
    <div id="notesModal" class="modal bottom-sheet modal-fixed-footer">   
  <div class="model-header amber darken-1 cursor-scroll" id="notesModalHeader">
  <h4 class="white-text">
  <%=rB_Constants1.getString("COMMENTS")%>
  <a href="javascript:void(0);" class="modal-action modal-close waves-effect waves-red btn-flat white-text right"><i class="material-icons">close</i></a> 
  </h4>
  </div>
  <div id="headad"> </div>
    
 <div class="modal-content top-40"> 
<div id="usercontent" style="display:none;">
<form name="notesfrm" id="notesfrm" action="" method="get">
<div align="center" style="border:#000 0px solid; text-align:center;" id="usertext">
</div>
<div align="center" >
    <textarea id="comments" rows="10" cols="50" autofocus class="materialize-textarea" name="notes" onkeypress="limitcharById('comments','remainchar',4000);" onkeydown="limitcharById('comments','remainchar',4000);" onkeyup="limitcharById('comments','remainchar',4000);"></textarea>
    <br /><%=rB_Con.getString("REMAINS_CHAR") %>(<span id="remainchar">4000</span>)
    <br />
    <br />
</div>
</form>
</div>

<div class="user-msg alert alert-danger" id="user-msg" style="display:none;"></div>

 </div>
 
   <div class="modal-footer">
   		<a href="javascript:void(0);" class="waves-effect waves-green btn-flat text-orange sv-notes" onclick="saveComments();"><%=rB_Constants1.getString("SAVE")%></a>
      <a href="javascript:void(0);" class="modal-close waves-effect waves-green btn-flat text-orange cn-notes" id="cancel-usernotes"><%=rB_Con.getString("CANCEL") %></a>
    </div>
  </div>