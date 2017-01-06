<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgFormInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgFormInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgFormInfoList.cfgFormInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgFormInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgFormInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:errors path="*" cssClass="alert alert-error fade in" element="div"/>
<form:form commandName="cfgFormInfo" cssClass="form-horizontal"
           id="cfgFormInfoForm" onsubmit="return validateCfgFormInfo(this)">
<input type="hidden" name="addFlagOfCfgFormInfoForm"  value="${addFlagOfCfgFormInfoForm}"/>   
    
<form:hidden path="formId"/>
    
    
	    <spring:bind path="cfgFormInfo.formCode">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFormInfo.formCode" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="formCode" id="formCode"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="formCode" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFormInfo.formName">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFormInfo.formName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="formName" id="formName"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="formName" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFormInfo.mongodbDocumentName">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFormInfo.mongodbDocumentName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="mongodbDocumentName" id="mongodbDocumentName"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="mongodbDocumentName" cssClass="help-inline"/>
	        </div>
	    </div>        	

	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-edit']}">
	<button type="button" class="btn btn-purple" name="edit" onclick="formEditWithConfirmOfCfgFormInfo(this)">
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" name="save" onclick="formSaveWithConfirmOfCfgFormInfo(this)">
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgFormInfo/list"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
            
            
    </div>
</form:form>
</div>
</div>

<appfuse:javascriptValidate formName="cfgFormInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
	function formEditWithConfirmOfCfgFormInfo(button){
		button.disabled=true;
		//if(confirmEditMessage()){
			containerLoadUrlUseAjaxInDiv("cfgFormInfoForm","${ctx}/lb/${libraryPath}/cfgFormInfo/edit?formId=${cfgFormInfo.formId}");
		//}
	}
	function formSaveWithConfirmOfCfgFormInfo(button){
		button.disabled=true;
		//if(confirmSaveMessage()){
		if(validateCfgFormInfo(document.forms['cfgFormInfoForm'])){
			containerFormSubmitUseAjaxIndiv('cfgFormInfoForm','${ctx}/lb/${libraryPath}/cfgFormInfo/formSubmit');
		}else{
			button.disabled=false;
		}
		//}
	}
	
    $(document).ready(function() {
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgFormInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgFormInfoForm input").attr("disabled","disabled");  	
        	$("#paperInfoForm select").attr("disabled","disabled");
    	</c:if>
    });
    
</script>
