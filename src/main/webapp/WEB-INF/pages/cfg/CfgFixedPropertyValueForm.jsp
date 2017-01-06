<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgFixedPropertyValueDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgFixedPropertyValueDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgFixedPropertyValueList.cfgFixedPropertyValue"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgFixedPropertyValueDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgFixedPropertyValueDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgFixedPropertyValue" cssClass="form-horizontal"
           id="cfgFixedPropertyValueForm" onsubmit="return validateCfgFixedPropertyValue(this)">
<input type="hidden" name="addFlagOfCfgFixedPropertyValueForm"  value="${addFlagOfCfgFixedPropertyValueForm}"/>   
    
<form:hidden path="propertyValueId"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyValue.cfgFixedPropertyDefineId"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="cfgFixedPropertyDefineId" id="cfgFixedPropertyDefineId"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
        <form:hidden path="library"/>	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyValue.overt"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="overt" id="overt" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	

	
<form:hidden path="parent"/>

    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyValue.propertyName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="propertyName" id="propertyName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	
	
		<c:forEach var="v_customProperty" items="${cfgFixedPropertyDefine.fieldList}">
		
		
		<c:set var="fieldNameKey1" value="f${v_customProperty.fieldId}"/>
		
	    <div class="form-group">    
	       <label class="col-sm-3 col-md-3 col-lg-2 control-label">${v_customProperty.fieldName}</label> 
	        <div class="col-sm-9 col-md-9 col-lg-6">
	        	<c:if test="${v_customProperty.valueType=='AVB' || v_customProperty.valueType=='AVC'  || v_customProperty.valueType=='AVD' ||  v_customProperty.valueType=='AVH' }">
	        		<c:if test="${empty cfgFixedPropertyValue.customPropertyMap[fieldNameKey1]}">
	        			<form:input path="customPropertyMap[${fieldNameKey1}]" maxlength="100" 
	        			value="${v_customProperty.defaultValue}" class="form-control input-sm form-input-init-null" id="customPropertyMap_${v_customProperty.fieldId}"/>
	        		</c:if>
	        		<c:if test="${!empty cfgFixedPropertyValue.customPropertyMap[fieldNameKey1]}">
	        			<form:input path="customPropertyMap[${fieldNameKey1}]" maxlength="100" 
	        			 class="form-control input-sm" id="customPropertyMap_${v_customProperty.fieldId}"/>
	        		</c:if>        		
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVF'}">
	        		<form:select path="customPropertyMap[${fieldNameKey1}]" multiple="${v_customProperty.multiple}" class="form-control"  id="customPropertyMap_${v_customProperty.fieldId}">
	                <c:if test="${!v_customProperty.required && !v_customProperty.multiple}">
	            	<form:option value=""><fmt:message key="title.select.pleaseselect"/></form:option>
	            	</c:if>
	                <c:forEach var="v_list" items="${v_customProperty.valueList}">
	                
	                	<c:if test="${empty customPropertyMap[fieldNameKey1]  && !v_customProperty.multiple}">
		        			<c:if test="${v_customProperty.defaultValue==v_list}">
		                	<form:option value="${v_list}" selected="selected">${v_list}</form:option>
		                	</c:if>
		                	<c:if test="${v_customProperty.defaultValue!=v_list}">
		                	<form:option value="${v_list}" >${v_list}</form:option>
		                	</c:if>
		        		</c:if>
		        		<c:if test="${!empty customPropertyMap[fieldNameKey1] || v_customProperty.multiple}">
		        			<form:option value="${v_list}" >${v_list}</form:option>
		        		</c:if>        		
	        		
	                	
	            	</c:forEach>
	            
	            	</form:select>
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVA'}">
	        		<form:checkbox path="customPropertyMap[fieldNameKey1]" cssClass="checkbox" value="true"/>
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVG'}">
	        		<c:if test="${empty cfgFixedPropertyValue.customPropertyMap[fieldNameKey1]}"> <form:input path="customPropertyMap[${fieldNameKey1}]" size="11" title="date" datepicker="true" class="form-control input-sm form-input-init-null "  id="customPropertyMap_${v_customProperty.fieldId}"/> </c:if>
					<c:if test="${!empty cfgFixedPropertyValue.customPropertyMap[fieldNameKey1]}"> <form:input path="customPropertyMap[${fieldNameKey1}]" size="11" title="date" datepicker="true" class="form-control input-sm"  id="customPropertyMap_${v_customProperty.fieldId}"/> </c:if>
	        		
	        	</c:if>
	        	<c:if test="${v_customProperty.valueType=='AVE'}">
	        		<c:if test="${empty cfgFixedPropertyValue.customPropertyMap[fieldNameKey1]}"> <form:textarea path="customPropertyMap[${fieldNameKey1}]" rows="5" cols="30" class="form-control form-input-init-null"  id="customPropertyMap_${v_customProperty.fieldId}"/></c:if>
					<c:if test="${!empty cfgFixedPropertyValue.customPropertyMap[fieldNameKey1]}"> <form:textarea path="customPropertyMap[${fieldNameKey1}]" rows="5" cols="30" class="form-control "  id="customPropertyMap_${v_customProperty.fieldId}"/> </c:if>
	        		
	        		
	        	</c:if>        	      
	        </div>
	    </div>
		</c:forEach>
	<%-- <%@ include file="/scripts/customProperty.jsp" %> --%>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgFixedPropertyValue-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgFixedPropertyValue-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgFixedPropertyValue/list/${propertyDefineId}/cfgFixedPropertyValue/${parentId}/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="cfgFixedPropertyValue" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgFixedPropertyValue-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/edit/${propertyDefineId}/${cfgFixedPropertyValue.propertyValueId}/cfgFixedPropertyValue/${parentId}/php");
    	});
    	
    	$('#bt-cfgFixedPropertyValue-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgFixedPropertyValueForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/formSubmit/${propertyDefineId}/cfgFixedPropertyValue/${parentId}/php","post","cfgFixedPropertyValueForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgFixedPropertyValueForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgFixedPropertyValueForm input").attr("disabled","disabled");  	
        	$("#cfgFixedPropertyValueForm select").attr("disabled","disabled");
        	$("#cfgFixedPropertyValueForm textarea").attr("disabled","disabled");
    	</c:if>
    		
    	$("#cfgFixedPropertyValueForm .form-input-init-null").attr("value","");  		
    		
    		
    		
    		
    	
    });
    
</script>
