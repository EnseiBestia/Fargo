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
	
<form:form commandName="cfgFormInfo" cssClass="form-horizontal"
           id="cfgFormInfoForm" onsubmit="return validateCfgFormInfo(this)">
<input type="hidden" name="addFlagOfCfgFormInfoForm"  value="${addFlagOfCfgFormInfoForm}"/>   
    
<form:hidden path="formId"/>
    
    
	    <spring:bind path="cfgFormInfo.formCode">
	    <div class="form-group">
	    </spring:bind>
	        <appfuse:label key="cfgFormInfo.formCode" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="formCode" id="formCode"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    <spring:bind path="cfgFormInfo.formName">
	    <div class="form-group">
	    </spring:bind>
	        <appfuse:label key="cfgFormInfo.formName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="formName" id="formName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    <spring:bind path="cfgFormInfo.modelClassName">
	    <div class="form-group">
	    </spring:bind>
	        <appfuse:label key="cfgFormInfo.modelClassName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="modelClassName" id="modelClassName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    <spring:bind path="cfgFormInfo.mongodbDocumentName">
	    <div class="form-group">
	    </spring:bind>
	        <appfuse:label key="cfgFormInfo.mongodbDocumentName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="mongodbDocumentName" id="mongodbDocumentName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgFormInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgFormInfo-save" >
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
		
    $(document).ready(function() {
    	$('#bt-cfgFormInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			containerLoadUrlUseAjaxInDiv("cfgFormInfoForm","${ctx}/lb/${libraryPath}/cfgFormInfo/edit/${cfgFormInfo.formId}/php");
    	});
    	
    	$('#bt-cfgFormInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgFormInfoForm.form()){
				containerFormSubmitUseAjaxIndiv('cfgFormInfoForm','${ctx}/lb/${libraryPath}/cfgFormInfo/formSubmit');
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgFormInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgFormInfoForm input").attr("disabled","disabled");  	
        	$("#cfgFormInfoForm select").attr("disabled","disabled");
    	</c:if>
    });
    
</script>
