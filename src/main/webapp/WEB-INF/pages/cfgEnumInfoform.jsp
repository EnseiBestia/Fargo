<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgEnumInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgEnumInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgEnumInfoList.cfgEnumInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgEnumInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgEnumInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:errors path="*" cssClass="alert alert-error fade in" element="div"/>
<form:form commandName="cfgEnumInfo" cssClass="form-horizontal"
           id="cfgEnumInfoForm" onsubmit="return validateCfgEnumInfo(this)">
<input type="hidden" name="addFlagOfCfgEnumInfoForm"  value="${addFlagOfCfgEnumInfoForm}"/>   
    
<form:hidden path="enumId"/>
    
    
	    <spring:bind path="cfgEnumInfo.constantName">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgEnumInfo.constantName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="constantName" id="constantName"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="constantName" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgEnumInfo.editable">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgEnumInfo.editable" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:checkbox path="editable" id="editable" cssClass="checkbox"/>
	            <form:errors path="editable" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgEnumInfo.enumCode">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgEnumInfo.enumCode" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="enumCode" id="enumCode"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="enumCode" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgEnumInfo.enumName">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgEnumInfo.enumName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="enumName" id="enumName"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="enumName" cssClass="help-inline"/>
	        </div>
	    </div>        	

	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-edit']}">
	<button type="button" class="btn btn-purple" name="edit" onclick="formEditWithConfirmOfCfgEnumInfo(this)">
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" name="save" onclick="formSaveWithConfirmOfCfgEnumInfo(this)">
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgEnumInfo/list"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
            
            
    </div>
</form:form>
</div>
</div>

<div class="widget-box">
							<div class="widget-title">
								<span class="icon">
									<i class="fa fa-th"></i>
								</span>
								<h5>Static table</h5>
								<div class="buttons">
									<a title="Icon Title" class="btn " href="<c:url value="/lb/${libraryPath}/cfgEnumValueInfo/add/${cfgEnumInfo.enumId}/do"/>"><i class="fa fa-plus"></i> <span class="text"><fmt:message key="button.add"/></span></a>
								</div>
							</div>
							<div class="widget-content nopadding">
								<table class="table table-bordered table-striped table-hover">
									<thead>
										<tr>
											<th><fmt:message key="cfgEnumInfo.code"/></th>
											<th><fmt:message key="cfgEnumInfo.value"/></th>
											<th><fmt:message key="cfgEnumInfo.constantName"/></th>
											<th>Operator</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="v_values" items="${cfgEnumInfo.values}">
										<tr>
											
												<td>${v_values.code}</td>
												<td>${v_values.value}</td>
												<td>${v_values.constantName}</td>
												<td> 
												<a href='<c:url value="/lb/${libraryPath}/cfgEnumValueInfo/edit/${cfgEnumInfo.enumId}/${v_values.enumValueId}/do"/>' class="btn btn-purple btn-xs">
            										<i class="fa fa-edit"></i> <fmt:message key="button.edit"/></a>
            									<a href='<c:url value="/lb/${libraryPath}/cfgEnumValueInfo/delete/${cfgEnumInfo.enumId}/${v_values.enumValueId}/do"/>' class="btn btn-danger btn-xs">
            										<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></a>
												</td>
											
										</tr>
										
									</c:forEach>	
									</tbody>
							</table>							
						</div>
					</div>
<appfuse:javascriptValidate formName="cfgEnumInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
	function formEditWithConfirmOfCfgEnumInfo(button){
		button.disabled=true;
		//if(confirmEditMessage()){
			containerLoadUrlUseAjaxInDiv("cfgEnumInfoForm","${ctx}/lb/${libraryPath}/cfgEnumInfo/edit?enumId=${cfgEnumInfo.enumId}");
		//}
	}
	function formSaveWithConfirmOfCfgEnumInfo(button){
		button.disabled=true;
		//if(confirmSaveMessage()){
		if(validateCfgEnumInfo(document.forms['cfgEnumInfoForm'])){
			containerFormSubmitUseAjaxIndiv('cfgEnumInfoForm','${ctx}/lb/${libraryPath}/cfgEnumInfo/formSubmit');
		}else{
			button.disabled=false;
		}
		//}
	}
	
    $(document).ready(function() {
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgEnumInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgEnumInfoForm input").attr("disabled","disabled");  	
        	$("#paperInfoForm select").attr("disabled","disabled");
    	</c:if>
    });
    
</script>
