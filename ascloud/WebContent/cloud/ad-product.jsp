<%@page import="com.ojassoft.astrosagecloud.util.Util"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ojassoft.astrosagecloud.localization.*"%>
<%@page import="java.util.ResourceBundle"%>
<%
int languageCode = Util.safeInt(session.getAttribute("languageCode"));
Local local = new Local();
MyResourceBundle rBAdProduct = local.loadPropertiesFileNew("adproduct",languageCode);

%>


<div class="row mrt-30">
		<div class="col s12 l12">
			<div class="report-bar site-class ui-cls">
				<div class="card hdg-lg1">
					<h2 class="amber lighten-5">
						<%=rBAdProduct.getString("ASTROSAGE_ONLINE_SHOPPING_STORE") %></h2>
					<div class="row mr-b-0">
						<div class="col s4 m4 l12 user-define right-R btm-br">
							<a href="http://buy.astrosage.com/gemstone" class="buy-bar black-text full-width">
								<div class="waves-effect waves-block waves-light icon-set center">
									<img src="images/icons/ic_gemstone.png" alt="user bg">
									<h6 class="card-title font-weight-400 mb-2"><%=rBAdProduct.getString("GEMSTONES") %></h6>
									<p class="mb-2"><%=rBAdProduct.getString("GEMSTONES_DATA") %></p>
								</div>
							</a>
						</div>
						<div class="col s4 m4 l12 user-define right-R left-R btm-br">
							<a href="http://buy.astrosage.com/yantra" class="buy-bar black-text full-width">
								<div class="waves-effect waves-block waves-light icon-set center">
									<img src="images/icons/ic_navgrah.png" alt="user bg">
									<h6 class="card-title font-weight-400 mb-2"><%=rBAdProduct.getString("YANTRAS") %></h6>
									<p class="mb-2"><%=rBAdProduct.getString("YANTRAS_DATA")%></p>
								</div>
							</a>
						</div>
						<div class="col s4 m4 l12 user-define left-R">
							<a href="http://buy.astrosage.com/rudraksha" class="buy-bar black-text full-width">
								<div class="waves-effect waves-block waves-light icon-set center">
									<img src="images/icons/rudraksha.png" alt="user bg">
									<h6 class="card-title font-weight-400 mb-2"><%=rBAdProduct.getString("RUDRAKSH") %></h6>
									<p class="mb-2"><%=rBAdProduct.getString("RUDRAKSH_DATA") %></p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>