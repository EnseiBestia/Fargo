<!-- Nav tabs -->
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<div class="tabbable inline" style="padding-top:10px">

<ul class="nav nav-tabs tab-bricky" role="tablist" id="dtObjectInstanceTab">
<c:forEach var="v_object" items="${cfgFixedPropertyDefineList}">
	<li role="presentation"><a id="a_object_${v_object.propertyId }" href="#div_object_${v_object.propertyId }" role="tab" data-toggle="tab" class="btn_a_click">${v_object.propertyName }</a></li>
</c:forEach>
  
</ul>

<!-- Tab panes -->
<div class="tab-content">

<c:forEach var="v_object" items="${cfgFixedPropertyDefineList}">
	<div role="tabpanel" class="tab-pane div_iframe" id="div_object_${v_object.propertyId }"></div>
</c:forEach>
  
</div>
</div>
<script type="text/javascript">

$(document).ready(function() {

	<c:forEach var="v_object" items="${cfgFixedPropertyDefineList}">
	$("#a_object_${v_object.propertyId }").on("shown.bs.tab", function (e) {
	  ajaxLoadHtmlInDiv($("#div_object_${v_object.propertyId }"),"${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/list/${v_object.propertyId}/cfgFixedPropertyValue/0/php");
	});

	</c:forEach>



});

</script>
