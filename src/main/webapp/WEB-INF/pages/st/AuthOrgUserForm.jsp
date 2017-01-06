	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authOrgUserDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='authOrgUserDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authOrgUserList.authOrgUser"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="authOrgUserDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authOrgUserDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="authOrgUser" cssClass="form-horizontal"
           id="authOrgUserForm" onsubmit="return validateAuthOrgUser(this)">
<input type="hidden" name="addFlagOfAuthOrgUserForm"  value="${addFlagOfAuthOrgUserForm}"/>   
<input type="hidden" name="fromObjectId"  value="${fromObjectId}"/>   
    
<form:hidden path="userId"/>
<form:hidden path="createTime"/> 
 <form:hidden path="library"/>	 
  <form:hidden path="overt"/>	
  <form:hidden path="updateTime"/>
 <form:hidden path="objectModelId"/>
 <form:hidden path="objectId"/>
 <form:hidden path="roleList"/>
 <form:hidden path="objectInstanceId"/>
 
  <form:hidden path="passwordHint"/>
    <form:hidden path="enabled"/>
    
    <form:hidden path="fullName"/>
 <%-- <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.objectModelId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="objectModelId" name="objectModelId" value="${authOrgUser.objectModelId}" formName="DmObjectModelInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    		<div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.objectId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="objectId" name="objectId" value="${authOrgUser.objectId}" formName="DmObjectInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
	        
	        <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.roleList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="roleList" name="roleList" value="${authOrgUser.roleList}" formName="AuthAppRole" multiple="true" type="9"/>	            	        
		        </div>
	        </div>  
	        
	        
       <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.objectInstanceId"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="objectInstanceId" id="objectInstanceId"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>   --%>
	    
	    
	   <%--  <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.enabled"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="enabled" id="enabled" cssClass="checkbox"/>
	            
	        </div>
	    </div>       --%>
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="dmObjectInfo.objectName"/>
	        	
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <label class="form_field_view">${objectName }</label>
	            
	        </div>
	    </div> 
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.roleList"/>
	        	
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <label class="form_field_view">${roleNames }</label>
	            
	        </div>
	    </div> 
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.fullName"/>
	        	
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	           <label class="form_field_view"> ${authOrgUserName }</label>
	            
	        </div>
	    </div> 
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.userName"/>
	        	<span class="required"> *</span>	
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="userName" id="userName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div> 
	    
	    
	      
    	<div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.email"/>
							
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="email" id="email"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	 <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.phoneNumber"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="phoneNumber" id="phoneNumber"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	
	
    
	    
	      	

	
    
	    
	    <%-- <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.fullName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="fullName" id="fullName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        --%> 	

	
    
        

	

			
		    
    
	    
	          	

	
			
		    

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.password"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="password" id="password"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	   <%--  <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authOrgUser.passwordHint"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="passwordHint" id="passwordHint"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	 --%>

	
    
	    
	   
	
			
		      	

	
    
	    
	           	

	
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['authOrgUser-edit']}">
	<button type="button" class="btn btn-purple" id="bt-authOrgUser-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-authOrgUser-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
    <c:if test="${fromObjectId==null}">
        <a href='<c:url value="/lb/${libraryPath}/authOrgUser/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
    </c:if>    
    <c:if test="${fromObjectId!=null}">
    	<a href='<c:url value="/lb/${libraryPath}/dtObjectInstanceInfo/list/dmObjectInfo/${fromObjectId}/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
    </c:if>             
    </div>
</form:form>
</div>
</div>




<appfuse:javascriptValidate formName="authOrgUser" cdata="false" dynamicJavascript="true" staticJavascript="false"

methodCheck="userName:idx_user_username;email:idx_user_email;phoneNumber:idx_user_phonenumber;"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-authOrgUser-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authOrgUser/edit/${authOrgUser.userId}/php?fromObjectId=${fromObjectId}");
    	});
    	
    	$('#bt-authOrgUser-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_authOrgUserForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authOrgUser/formSubmit/php","post","authOrgUserForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['authOrgUserForm']).focus();
        $('.datepicker123').datepicker();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#authOrgUserForm input").attr("disabled","disabled");  	
        	$("#authOrgUserForm select").attr("disabled","disabled");
        	$("#authOrgUserForm textarea").attr("disabled","disabled");
    	</c:if>
    	
		    
			
		    
			
						$("#roleList").on("change", function(e) { 			
				    		validate_authOrgUserForm.element($("#roleList"));
						})	        		
		    
			
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_authOrgUserForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
    jQuery.validator.addMethod("idx_user_username", function(value, element) {    
        if($("#userName").val()!=null){
        	var flag = 1;  
        	$.ajax({  
                type:"POST",  
                url:'${ctx}/lb/${libraryPath}/authOrgUser/view/idx_user_username/validate/php',  
                async:false,   
                data:{'userName':$("#userName").val(),'userId':${authOrgUser.userId}},  
                success: function(msg){  
                     if(msg == 'false' || msg==false){  
                         flag = 0;  
                     }  
                }  
            });  
        	 if(flag==1){return true;}else{return false;}
        }else{
        	return true;
        }
    }, "<fmt:message key='authAppUserList.validate.username'/>"); 
    jQuery.validator.addMethod("idx_user_email", function(value, element) {    
        if($("#email").val()!=null){
        	var flag = 1;  
        	$.ajax({  
                type:"POST",  
                url:'${ctx}/lb/${libraryPath}/authOrgUser/view/idx_user_email/validate/php',  
                async:false,   
                data:{'email':$("#email").val(),'userId':${authOrgUser.userId}},  
                success: function(msg){  
                     if(msg == 'false' || msg==false){  
                         flag = 0;  
                     }  
                }  
            });  
        	 if(flag==1){return true;}else{return false;}
        }else{
        	return true;
        }
    }, "<fmt:message key='authAppUserList.validate.email'/>"); 
    jQuery.validator.addMethod("idx_user_phonenumber", function(value, element) {    
        if($("#phoneNumber").val()!=null){
        	var flag = 1;  
        	$.ajax({  
                type:"POST",  
                url:'${ctx}/lb/${libraryPath}/authOrgUser/view/idx_user_phonenumber/validate/php',  
                async:false,   
                data:{'phoneNumber':$("#phoneNumber").val(),'userId':${authOrgUser.userId}},  
                success: function(msg){  
                     if(msg == 'false' || msg==false){  
                         flag = 0;  
                     }  
                }  
            });  
        	 if(flag==1){return true;}else{return false;}
        }else{
        	return true;
        }
    }, "<fmt:message key='authAppUserList.validate.phoneNumber'/>"); 
    
</script>
