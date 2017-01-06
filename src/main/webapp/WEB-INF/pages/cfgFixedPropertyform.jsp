<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgFixedPropertyDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgFixedPropertyDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgFixedPropertyList.cfgFixedProperty"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgFixedPropertyDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgFixedPropertyDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:errors path="*" cssClass="alert alert-error fade in" element="div"/>
<form:form commandName="cfgFixedProperty" cssClass="form-horizontal"
           id="cfgFixedPropertyForm" onsubmit="return validateCfgFixedProperty(this)">
<input type="hidden" name="addFlagOfCfgFixedPropertyForm"  value="${addFlagOfCfgFixedPropertyForm}"/>   
    
<form:hidden path="propertyId"/>
    
    
	    <spring:bind path="cfgFixedProperty.defaultValue">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFixedProperty.defaultValue" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="defaultValue" id="defaultValue"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="defaultValue" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFixedProperty.formId">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFixedProperty.formId" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="formId" id="formId"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="formId" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFixedProperty.propertyCode">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFixedProperty.propertyCode" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="propertyCode" id="propertyCode"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="propertyCode" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFixedProperty.propertyName">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFixedProperty.propertyName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="propertyName" id="propertyName"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="propertyName" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFixedProperty.required">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFixedProperty.required" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:checkbox path="required" id="required" cssClass="checkbox"/>
	            <form:errors path="required" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFixedProperty.test1">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFixedProperty.test1" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="test1" id="test1"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="test1" cssClass="help-inline"/>
	        </div>
	    </div>        	

    
	    <spring:bind path="cfgFixedProperty.valueType">
	    <div class="form-group${(not empty status.errorMessage) ? ' error' : ''}">
	    </spring:bind>
	        <appfuse:label key="cfgFixedProperty.valueType" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-10">
	            <form:input path="valueType" id="valueType"  maxlength="255" cssClass="form-control input-sm" />
	            <form:errors path="valueType" cssClass="help-inline"/>
	        </div>
	    </div>        	

	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgFixedProperty-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgFixedProperty-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgFixedProperty-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgFixedProperty/list"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>

<appfuse:javascriptValidate formName="cfgFixedProperty" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgFixedProperty-edit').click(function(){
    		$(this).attr('disabled',true)
			containerLoadUrlUseAjaxInDiv("cfgFixedPropertyForm","${ctx}/lb/${libraryPath}/cfgFixedProperty/edit/${cfgFixedProperty.propertyId}/php");
    	});
    	
    	$('#bt-cfgFixedProperty-save').click(function(){
    		$(this).attr('disabled',true);
			if(validateCfgFixedProperty(document.forms['cfgFixedPropertyForm'])){
				containerFormSubmitUseAjaxIndiv('cfgFixedPropertyForm','${ctx}/lb/${libraryPath}/cfgFixedProperty/formSubmit');
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgFixedPropertyForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgFixedPropertyForm input").attr("disabled","disabled");  	
        	$("#cfgFixedPropertyForm select").attr("disabled","disabled");
    	</c:if>
    });
    
</script>
