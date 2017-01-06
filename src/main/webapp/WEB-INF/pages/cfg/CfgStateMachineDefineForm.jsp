	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgStateMachineDefineDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgStateMachineDefineDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgStateMachineDefineList.cfgStateMachineDefine"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgStateMachineDefineDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgStateMachineDefineDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgStateMachineDefine" cssClass="form-horizontal"
           id="cfgStateMachineDefineForm" onsubmit="return validateCfgStateMachineDefine(this)">
<input type="hidden" name="addFlagOfCfgStateMachineDefineForm"  value="${addFlagOfCfgStateMachineDefineForm}"/>   
    
<form:hidden path="machineId"/>
    
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineDefine.enumId"/>
								<span class="required"> *</span>		
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="enumId" name="enumId" value="${cfgStateMachineDefine.enumId}" formName="CfgEnumInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineDefine.fieldName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="fieldName" id="fieldName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineDefine.formId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="formId" name="formId" value="${cfgStateMachineDefine.formId}" formName="CfgFormInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineDefine.machineName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="machineName" id="machineName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineDefine.refreshStateUrl"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="refreshStateUrl" id="refreshStateUrl"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgStateMachineDefine-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgStateMachineDefine-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgStateMachineDefine/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="cfgStateMachineDefine" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgStateMachineDefine-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineDefine/edit/${cfgStateMachineDefine.machineId}/php");
    	});
    	
    	$('#bt-cfgStateMachineDefine-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgStateMachineDefineForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineDefine/formSubmit/php","post","cfgStateMachineDefineForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgStateMachineDefineForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgStateMachineDefineForm input").attr("disabled","disabled");  	
        	$("#cfgStateMachineDefineForm select").attr("disabled","disabled");
        	$("#cfgStateMachineDefineForm textarea").attr("disabled","disabled");
    	</c:if>
    	
		    
			
		    
			
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_cfgStateMachineDefineForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
