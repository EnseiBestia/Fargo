	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authAppUserDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='authAppUserDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authAppUserList.authAppUser"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="authAppUserDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authAppUserDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="authAppUser" cssClass="form-horizontal"
           id="authAppUserForm" onsubmit="return validateAuthAppUser(this)">
<input type="hidden" name="addFlagOfAuthAppUserForm"  value="${addFlagOfAuthAppUserForm}"/>   
    
<form:hidden path="userId"/>
<form:hidden path="createTime"/>
<form:hidden path="updateTime"/>
    
<%-- <form:hidden path="library"/>


<form:hidden path="overt"/>  --%>   
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.email"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="email" id="email"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	   
	        
	              	

		<div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.enabled"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="enabled" id="enabled" cssClass="checkbox"/>
	            
	        </div>
	    </div>   
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.fullName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="fullName" id="fullName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    <c:if test="${ addFlagOfAuthAppUserForm=='1'}">
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.password"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="password" id="password"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	
	</c:if>
	
    
	    <%-- 
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.passwordHint"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="passwordHint" id="passwordHint"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>   --%>      	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.phoneNumber"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="phoneNumber" id="phoneNumber"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
			
		    <%-- <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.roleList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<select id="roleList" name="roleList"  style="width:100%;height:34px" multiple></select>
		            		            	        
		        </div>
	        </div> --%>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.userName"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="userName" id="userName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
		
		 
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.overt"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="overt" id="overt" cssClass="checkbox"/>
	            
	        </div>
	    </div>  
	    
	    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.library"/>
								<span class="required"> *</span>		
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="library" name="library" value="${authAppUser.library}" formName="LibraryInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['authAppUser-edit']}">
	<button type="button" class="btn btn-purple" id="bt-authAppUser-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-authAppUser-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/authAppUser/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>


<div class="div_iframe" id="AuthUserLibraryRoleOfAuthAppUserListDiv">
	<c:if test="${addFlagOfAuthUserLibraryRole!='1'}">
	<%@ include file="AuthUserLibraryRoleList.jsp" %>
	</c:if>
</div>


<appfuse:javascriptValidate formName="authAppUser" cdata="false" dynamicJavascript="true" staticJavascript="false" 
	methodCheck="userName:idx_user_username;email:idx_user_email;phoneNumber:idx_user_phonenumber;"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-authAppUser-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppUser/edit/${authAppUser.userId}/php");
    	});
    	
    	$('#bt-authAppUser-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_authAppUserForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppUser/formSubmit/php","post","authAppUserForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['authAppUserForm']).focus();
        $('.datepicker123').datepicker();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#authAppUserForm input").attr("disabled","disabled");  	
        	$("#authAppUserForm select").attr("disabled","disabled");
        	$("#authAppUserForm textarea").attr("disabled","disabled");
    	</c:if>
 	
    		    	
    		
    		
    });
    
    jQuery.validator.addMethod("idx_user_username", function(value, element) {    
        if($("#userName").val()!=null){
        	var flag = 1;  
        	$.ajax({  
                type:"POST",  
                url:'${ctx}/lb/${libraryPath}/authAppUser/view/idx_user_username/validate/php',  
                async:false,   
                data:{'userName':$("#userName").val(),'userId':'${authAppUser.userId}'},  
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
                url:'${ctx}/lb/${libraryPath}/authAppUser/view/idx_user_email/validate/php',  
                async:false,   
                data:{'email':$("#email").val(),'userId':'${authAppUser.userId}'},  
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
                url:'${ctx}/lb/${libraryPath}/authAppUser/view/idx_user_phonenumber/validate/php',  
                async:false,   
                data:{'phoneNumber':$("#phoneNumber").val(),'userId':'${authAppUser.userId}'},  
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
