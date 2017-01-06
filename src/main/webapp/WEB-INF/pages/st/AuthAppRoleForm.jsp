	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authAppRoleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='authAppRoleDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authAppRoleList.authAppRole"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="authAppRoleDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authAppRoleDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="authAppRole" cssClass="form-horizontal"
           id="authAppRoleForm" onsubmit="return validateAuthAppRole(this)">
<input type="hidden" name="addFlagOfAuthAppRoleForm"  value="${addFlagOfAuthAppRoleForm}"/>   
    
<form:hidden path="roleId"/>
<form:hidden path="privilegeList"/>  
<form:hidden path="library"/>
<form:hidden path="overt"/>     
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppRole.description"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="description" id="description"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppRole.roleName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="roleName" id="roleName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['authAppRole-edit']}">
	<button type="button" class="btn btn-purple" id="bt-authAppRole-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-authAppRole-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/authAppRole/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="authAppRole" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-authAppRole-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppRole/edit/${authAppRole.roleId}/php");
    	});
    	
    	$('#bt-authAppRole-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_authAppRoleForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppRole/formSubmit/php","post","authAppRoleForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['authAppRoleForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#authAppRoleForm input").attr("disabled","disabled");  	
        	$("#authAppRoleForm select").attr("disabled","disabled");
        	$("#authAppRoleForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
    		
    		
    		
    });
    
</script>
