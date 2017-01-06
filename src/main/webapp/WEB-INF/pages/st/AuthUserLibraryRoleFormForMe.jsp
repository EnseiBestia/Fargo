<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authUserLibraryRoleDetail.title.modifySetting"/></title>
    <meta name="heading" content="<fmt:message key='authUserLibraryRoleDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authUserLibraryRoleList.authUserLibraryRole"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="authUserLibraryRoleDetail.heading.modifySetting"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">

</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authUserLibraryRoleDetail.message.modifySetting"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:errors path="*" cssClass="alert alert-error fade in" element="div"/>
<form:form commandName="authUserLibraryRole" cssClass="form-horizontal"
           id="authUserLibraryRoleForm" onsubmit="return validateAuthUserLibraryRole(this)">
<input type="hidden" name="addFlagOfAuthUserLibraryRoleForm"  value="${addFlagOfAuthUserLibraryRoleForm}"/>   
    
<form:hidden path="libraryRoleId"/>
<form:hidden path="libraryId"/>
<form:hidden path="roleList"/>
			
		    

    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authUserLibraryRole.description"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="description" id="description"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authUserLibraryRole.ifDefault"/>
				<span class="required"> *</span>		
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="ifDefault" id="ifDefault" cssClass="checkbox"/>
	        </div>
	    </div>        	


		
    
        <form:hidden path="overt"/>	

<div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authUserLibraryRole.adminServerList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="adminServerList" name="adminServerList" value="${authUserLibraryRole.adminServerList}" formName="StAdminServerInfo" multiple="true" type="9"/>	            	        
		        </div>
	        </div>
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authUserLibraryRole.reportServerList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="reportServerList" name="reportServerList" value="${authUserLibraryRole.reportServerList}" formName="StReportServerInfo" multiple="true" type="9"/>	            	        
		        </div>
	        </div>
			
		    
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-authUserLibraryRole-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        
    </div>
</form:form>
</div>
</div>

<appfuse:javascriptValidate formName="authUserLibraryRole" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	
    	$('#bt-authUserLibraryRole-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_authUserLibraryRoleForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppUser/currentUser/changeSetting/formSubmit/php","post","authUserLibraryRoleForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['authUserLibraryRoleForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#authUserLibraryRoleForm input").attr("disabled","disabled");  	
        	$("#authUserLibraryRoleForm select").attr("disabled","disabled");
        	$("#authUserLibraryRoleForm textarea").attr("disabled","disabled");
    	</c:if>
    	
						$("#adminServerList").on("change", function(e) { 			
				    		validate_authUserLibraryRoleForm.element($("#adminServerList"));
						})	        		
		    
			
		    
			
						$("#reportServerList").on("change", function(e) { 			
				    		validate_authUserLibraryRoleForm.element($("#reportServerList"));
						})	        		
		    
			
						$("#roleList").on("change", function(e) { 			
				    		validate_authUserLibraryRoleForm.element($("#roleList"));
						})	        		
		    
			
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_authUserLibraryRoleForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    	
    });
    
</script>
