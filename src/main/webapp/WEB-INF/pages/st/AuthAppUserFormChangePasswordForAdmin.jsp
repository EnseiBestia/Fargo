	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authAppUserDetail.title.changePasswrod"/></title>
    <meta name="heading" content="<fmt:message key='authAppUserDetail.title.changePasswrod'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authAppUserList.authAppUser"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="authAppUserDetail.title.changePasswrod"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authAppUserDetail.message.resetPassword"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="authAppUser" cssClass="form-horizontal"
           id="authAppUserForm" onsubmit="return validateUserOnSubmit()">
<input type="hidden" name="addFlagOfAuthAppUserForm"  value="${addFlagOfAuthAppUserForm}"/>   
    
<form:hidden path="userId"/>

		
		<div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.password"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:password path="password" id="password"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	
	    
	
	
    <div class="form-actions">
    
    

        <button type="button" class="btn btn-yellow" id="bt-authAppUser-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>        
        <a href='<c:url value="/lb/${libraryPath}/authAppUser/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                                    
    </div>
</form:form>
</div>
</div>

<script type="text/javascript">
var validate_authAppUserForm=$("#authAppUserForm").validate({
	rules:{
		password:{required: true,minlength:6,maxlength:20}
	},
	ignore:"",
	errorClass: "help-inline",
	errorElement: "span",
	highlight:function(element, errorClass, validClass) {
		$(element).parents('.form-group').removeClass('has-success').addClass('has-error');
	},
	unhighlight: function(element, errorClass, validClass) {
		$(element).parents('.form-group').removeClass('has-error').addClass('has-success');
	}
});
function validateUserOnSubmit(){
	$('#bt-authAppUser-save').click(function(){
		$(this).attr('disabled',true);
		if(validate_authAppUserForm.form()){
			return true;
		}else{
			$(this).attr('disabled',false);
			return false;
		}
	});
}		
    $(document).ready(function() {
    	
    	$('#bt-authAppUser-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_authAppUserForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppUser/edit/resetPassword/formSubmit/php","post","authAppUserForm");
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
    
</script>
