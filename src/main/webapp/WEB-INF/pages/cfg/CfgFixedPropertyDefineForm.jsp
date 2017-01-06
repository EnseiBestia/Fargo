	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgFixedPropertyDefineDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgFixedPropertyDefineDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgFixedPropertyDefineList.cfgFixedPropertyDefine"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgFixedPropertyDefineDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgFixedPropertyDefineDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgFixedPropertyDefine" cssClass="form-horizontal"
           id="cfgFixedPropertyDefineForm" onsubmit="return validateCfgFixedPropertyDefine(this)">
<input type="hidden" name="addFlagOfCfgFixedPropertyDefineForm"  value="${addFlagOfCfgFixedPropertyDefineForm}"/>   
    
<form:hidden path="propertyId"/>
    

    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyDefine.propertyCode"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="propertyCode" id="propertyCode"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyDefine.propertyName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="propertyName" id="propertyName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyDefine.valueType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<form:select path="valueType"  class="form-control">
                <c:forEach var="v_list" items="${allEnumInfoMap['AX'].values}">
                	<form:option value="${v_list.fullCode}" >${v_list.value}</form:option>
            	</c:forEach>
            </form:select>
		</div>
    </div>
    
    
    
    	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.valueList"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:select path="formIdList" multiple="true" class="form-control"  id="formList" style="height:250px">
                
                <c:forEach var="v_list" items="${cfgFormInfoList}">
                	
                	<form:option value="${v_list.formId}" >${v_list.formName}</form:option>
                	
            	</c:forEach>
            
            	</form:select>
	            
	        </div>
	    </div>     
	    
	    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgFixedPropertyDefine.roleList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="roleList" name="roleList" value="${cfgFixedPropertyDefine.roleList}" formName="AuthAppRole" multiple="true" type="9"/>	            	        
		        </div>
	        </div>
	
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgFixedPropertyDefine-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgFixedPropertyDefine-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgFixedPropertyDefine/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>


<div class="div_iframe" id="CfgFixedPropertyFieldOfCfgFixedPropertyDefineListDiv">
	<c:if test="${addFlagOfCfgFixedPropertyDefineForm!='1'}">
	<%@ include file="CfgFixedPropertyFieldList.jsp" %>
	</c:if>
</div>



<appfuse:javascriptValidate formName="cfgFixedPropertyDefine" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgFixedPropertyDefine-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyDefine/edit/${cfgFixedPropertyDefine.propertyId}/php");
    	});
    	
    	$('#bt-cfgFixedPropertyDefine-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgFixedPropertyDefineForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyDefine/formSubmit/php","post","cfgFixedPropertyDefineForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgFixedPropertyDefineForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgFixedPropertyDefineForm input").attr("disabled","disabled");  	
        	$("#cfgFixedPropertyDefineForm select").attr("disabled","disabled");
        	$("#cfgFixedPropertyDefineForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
    		
    		
    		
    					             
    			
    		    	
    		    	
    		
    		
    		
    		
    });
    
</script>
