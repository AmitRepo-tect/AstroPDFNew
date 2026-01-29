<%@page import="com.ojassoft.astrosagecloud.util.SharedFunction"%>
<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page import="com.ojassoft.astrosagecloud.localization.MyProperties"%>
<%@page import="com.cslsoftware.desktophoro.DesktopHoro"%>
<%@page import="com.ojassoft.astrosagecloud.localization.Local"%>
<%@page
	import="com.ojassoft.astrosagecloud.localization.MyResourceBundle"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Local shareLocal = new Local();
	int shareLang = Util.safeInt(session.getAttribute("languageCode"));

	MyResourceBundle rBShareChartPub = shareLocal.loadPropertiesFileNew("sharechartpublicly", shareLang);
	MyResourceBundle rBConstantValues = shareLocal.loadPropertiesFileNew("constantvalues", 0);
	String sendername = "";
	String loginname = "";
	if (session.getAttribute("HoroscopeObj") != null) {
		sendername = SharedFunction.ProperCase(((DesktopHoro) session
				.getAttribute("HoroscopeObj")).getName());
		loginname = SharedFunction.ProperCase(Util.safestr(session
				.getAttribute("LoggedInUserName"))); //implemented when all will be converted
	}

	Object objsc = session.getAttribute("constants");
	MyProperties shareConstants = null;
	if (objsc != null) {
		shareConstants = (MyProperties) objsc;
	} else {
		shareConstants = new MyProperties(
				shareLocal.loadPropertiesFile("constants", shareLang));
		session.setAttribute("constants", shareConstants);
	}
%>

<script type="text/javascript"
	src="js/sharechartpublicly-js.jsp?sendername=<%=sendername%>&loginname=<%=loginname%>"></script>

<div id="dialog-form-share" class="modal">
	<div class="model-header amber darken-1">
		<h4 class="white-text"><%=shareConstants.getString("SHARE_CHART") + " "	+ shareConstants.getString("SETING")%>
		<a href="#!" class="modal-action modal-close waves-effect waves-red btn-flat white-text right ui-close-btn"><i	class="material-icons">close</i></a>
		</h4>
	</div>
	<div class="modal-content clearfix">		
		<div id="confirmmsg"></div>

		<form id="frmShareChart" class="col s12" name="frmShareChart"
			action="">
			<div class="row">
				<div class="col s12">

					<b><%=rBShareChartPub.getString("CHART_VISIBILITY")%>: </b> <input
						type="radio" class="with-gap" id="radioPrivate" name="radiobtn"
						value="private" onclick="showUrlDiv('hidden')" checked="checked" />
					<label for="radioPrivate"> <%=shareConstants.getString("PRIVATE_CHART")%></label>
					<input type="radio" class="with-gap" id="radioShared"
						name="radiobtn" value="shared" onclick="showUrlDiv('visible')" />
					<label for="radioShared"><%=shareConstants.getString("SHARED_CHART")%></label>

				</div>
			</div>
			<div id="ChartNamePublic" style="visibility: hidden;">

				<div id="sharedurl">
					<div class="row no-margin-b">
					<div class="input-field col s12">
					(<%=rBShareChartPub.getString("CHART_NAME_CAN_BE_GVN_AS_COMBI_ALPHB_DIGITS_HYPHEN")%>)
					</div>
						<div class="input-field col s12">
							<input type="text" name="chartNameshare" id="chartNameshare" maxlength="15" onmouseout="updateUrlPath()" onkeyup="updateUrlPath();" placeholder='<%=shareConstants.getString("CHART_NAME")%>' class="validate"> 
						
							<span id="chartNameAvailablitypublic"></span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col s12">
						<button type="button"
							class="waves-effect waves-light btn amber darken-4 right"
							value='<%=shareConstants.getString("CHECK_AVAILABILITY")%>'
							onclick="IschartNameExist();" class="checkavailability">
							<%=shareConstants.getString("CHECK_AVAILABILITY")%>
						</button>

					</div>
				</div>


				<div class="row">
					<div class="input-field col s12">
						<label><%=shareConstants.getString("NOTE")%>: <%=shareConstants
					.getString("THIS_CHART_WILL_BE_ACCESSIBLE_AT")%></label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input type="text" readonly name="lblPathpublictext" id="lblPathpublictext" value="" />
					</div>
				</div>




				<div id="confirmmsgsecond"></div>
				
				<div id="emailsharedurl">
					<div class="row">
						<div class="col s12">
							<input type="checkbox" class="filled-in" id="shareurlchkbox" name="shareurlchkbox" value="1" /> 
							<label for="shareurlchkbox"><%=rBShareChartPub.getString("SHARE_THIS_URL_WITH_OTH_PEOPLE")%></label>
						</div>
					</div>
				<div class="row" id="emailaddresses">
					<div class="col s12">	
						<p>(<%=rBShareChartPub.getString("ENTER_EMAIL_WITH_WHO_YOU_WANT_SHARE_ABOVE_URL_ENTER_MANY_EMAIL_SEPARATED_COMMA")%>)</p>
					</div>	
					<div class="input-field col s12">						
						<textarea name="emailadd" id="emailadd" placeholder="Type here.." class="materialize-textarea"></textarea>						
					</div>
				</div>


				</div>

			</div>
			
		</form>
		<div id="pleasewait"></div>
	</div>
	<div class="modal-footer">
		<a href="#!"
			class="modal-action waves-effect waves-red btn-flat text-orange share-shcrt"><%=shareConstants.getString("SHARE_CHART")%></a>
		<a href="#!"
			class="modal-action waves-effect waves-red btn-flat text-orange cancel-shcrt"><%=shareConstants.getString("CANCEL")%></a>
		<a href="#!"
			class="modal-action waves-effect waves-red btn-flat text-orange done-shcrt"><%=shareConstants.getString("DONE")%></a>
	</div>

</div>