<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgFixedPropertyFieldDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgFixedPropertyFieldDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgFixedPropertyFieldList.cfgFixedPropertyField"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgFixedPropertyFieldDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">

</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgFixedPropertyFieldDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:errors path="*" cssClass="alert alert-error fade in" element="div"/>
<form:form commandName="cfgFixedPropertyField" cssClass="form-horizontal"
           id="cfgFixedPropertyFieldForm" onsubmit="return validateCfgFixedPropertyField(this)">
<input type="hidden" name="addFlagOfCfgFixedPropertyFieldForm"  value="${addFlagOfCfgFixedPropertyFieldForm}"/>   
    
<form:hidden path="fieldId"/>
<form:hidden path="library"/>	    
<form:hidden path="overt"/>	
    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.fieldName"/>
				<span class="required"> *</span>		
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="fieldName" id="fieldName"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.defaultValue"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="defaultValue" id="defaultValue"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	



    
	    
	        	



    
        



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.max"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="max" id="max"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.maxlength"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="maxlength" id="maxlength"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	


		<div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.min"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="min" id="min"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div> 
    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.mimlength"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="mimlength" id="mimlength"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	



    
	    
	           	



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.multiple"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="multiple" id="multiple" cssClass="checkbox"/>
	        </div>
	    </div>        	



    
        



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.required"/>
				<span class="required"> *</span>		
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="required" id="required" cssClass="checkbox"/>
	        </div>
	    </div>        	



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.valueList"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="valueList"   id="form_valueType"/>
	        </div>
	    </div>        	


	<div class="form-group">    
      	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyField.valueType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<form:select path="valueType"  class="form-control">
                <c:forEach var="v_list" items="${allEnumInfoMap['AV'].values}">
                	<form:option value="${v_list.fullCode}" >${v_list.value}</form:option>
            	</c:forEach>
            </form:select>
		</div>
    </div>
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyField-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgFixedPropertyField-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgFixedPropertyField-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgFixedPropertyField/list/cfgFixedPropertyDefine/${cfgFixedPropertyDefine.propertyId}/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>

<appfuse:javascriptValidate formName="cfgFixedPropertyField" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgFixedPropertyField-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyField/edit/${cfgFixedPropertyField.fieldId}/cfgFixedPropertyDefine/${cfgFixedPropertyDefine.propertyId}/php");
    	});
    	
    	$('#bt-cfgFixedPropertyField-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgFixedPropertyFieldForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyField/formSubmit/cfgFixedPropertyDefine/${cfgFixedPropertyDefine.propertyId}/php","post","cfgFixedPropertyFieldForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgFixedPropertyFieldForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgFixedPropertyFieldForm input").attr("disabled","disabled");  	
        	$("#cfgFixedPropertyFieldForm select").attr("disabled","disabled");
        	$("#cfgFixedPropertyFieldForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
    		
    	$("#form_valueType").select2({tags:[]});		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    		
    });
    
</script>
