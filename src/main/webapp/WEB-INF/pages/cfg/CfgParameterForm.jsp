	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgParameterDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgParameterDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgParameterList.cfgParameter"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgParameterDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgParameterDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgParameter" cssClass="form-horizontal"
           id="cfgParameterForm" onsubmit="return validateCfgParameter(this)">
<input type="hidden" name="addFlagOfCfgParameterForm"  value="${addFlagOfCfgParameterForm}"/>   
    
<form:hidden path="parameterId"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgParameter.canModify"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="canModify" id="canModify" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgParameter.description"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="description" id="description"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgParameter.name"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="name" id="name"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgParameter.note"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="note" id="note"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgParameter.value"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="value" id="value"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgParameter-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgParameter-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgParameter-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgParameter/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="cfgParameter" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgParameter-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgParameter/edit/${cfgParameter.parameterId}/php");
    	});
    	
    	$('#bt-cfgParameter-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgParameterForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgParameter/formSubmit/php","post","cfgParameterForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgParameterForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgParameterForm input").attr("disabled","disabled");  	
        	$("#cfgParameterForm select").attr("disabled","disabled");
        	$("#cfgParameterForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
    		
    		
    		
    		
    		
    		
    });
    
</script>
