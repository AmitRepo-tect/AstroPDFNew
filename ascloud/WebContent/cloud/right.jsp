<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
﻿
<div class="leftcontainer">
	<div align="center">
		<jsp:include page="question_box.jsp"/>
	</div>
	<div align="left" style="padding: 0px 0px 10px 5px;">
		<%@ include file="ad-160-600.jsp"%>
	</div>
	<div align="center" class="ui-vdo-container">
		<%@ include file="/youtube-video.jsp"%>
	</div>

	<div align="left">
		<iframe src="/include/i_w3-widget-astrologer-vertical.jsp"
			scrolling="no" frameborder="0" width="178" height="470"
			marginwidth="0" marginheight="0"></iframe>
	</div>
	<%if(session.getAttribute("languageCode")=="1"){ %>
	<%@ include file="/ads/ad-160-600-hin.jsp"%>
	<%}else{ %>
	<%@ include file="/ads/ad-160-600.jsp"%>
	<%}%>
	<p></p>
	<div align="left">
		<iframe
			src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fastrology.horoscope&amp;width=200&amp;height=290&amp;colorscheme=light&amp;show_faces=true&amp;header=true&amp;stream=false&amp;show_border=true&amp;appId=647124652015699"
			scrolling="no" frameborder="0"
			style="border: none; overflow: hidden; width: 200px; height: 290px; background: #dcdcdc;"
			allowTransparency="true"></iframe>
	</div>
	<p></p>

</div>