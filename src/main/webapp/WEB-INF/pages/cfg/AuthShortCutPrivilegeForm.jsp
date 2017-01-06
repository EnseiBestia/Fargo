	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authShortCutPrivilegeDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='authShortCutPrivilegeDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authShortCutPrivilegeList.authShortCutPrivilege"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="authShortCutPrivilegeDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authShortCutPrivilegeDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="authShortCutPrivilege" cssClass="form-horizontal"
           id="authShortCutPrivilegeForm" onsubmit="return validateAuthShortCutPrivilege(this)">
<input type="hidden" name="addFlagOfAuthShortCutPrivilegeForm"  value="${addFlagOfAuthShortCutPrivilegeForm}"/>   
    
<form:hidden path="shortCutId"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authShortCutPrivilege.icon"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="icon" id="icon"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authShortCutPrivilege.order"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="order" id="order"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authShortCutPrivilege.privilegeId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="privilegeId" name="privilegeId" value="${authShortCutPrivilege.privilegeId}" formName="AuthPrivilegeInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authShortCutPrivilege.shortCutName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="shortCutName" id="shortCutName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

		<div class="form-group">		    
	  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authShortCutPrivilege.roleList"/>
					</label>
		    <div class="col-sm-9 col-md-9 col-lg-6">	  
	            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="roleList" name="roleList" value="${authShortCutPrivilege.roleList}" formName="AuthAppRole" multiple="true" type="9"/>	            	        
	        </div>
        </div>
	        
	        
	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-edit']}">
	<button type="button" class="btn btn-purple" id="bt-authShortCutPrivilege-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-authShortCutPrivilege-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/authShortCutPrivilege/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="authShortCutPrivilege" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-authShortCutPrivilege-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authShortCutPrivilege/edit/${authShortCutPrivilege.shortCutId}/php");
    	});
    	
    	$('#bt-authShortCutPrivilege-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_authShortCutPrivilegeForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authShortCutPrivilege/formSubmit/php","post","authShortCutPrivilegeForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['authShortCutPrivilegeForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#authShortCutPrivilegeForm input").attr("disabled","disabled");  	
        	$("#authShortCutPrivilegeForm select").attr("disabled","disabled");
        	$("#authShortCutPrivilegeForm textarea").attr("disabled","disabled");
    	</c:if>
    	
		    
			
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_authShortCutPrivilegeForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
