<%@ include file="/common/header.jsp" %>

<div id="view-container"><div><div class="reg-main div_iframe">
    <div id="reg-timeline-container"><div><ul class="reg-timeline nav nav-tabs">
    <li>
        <div class="hr active"></div>
        <img src="${ctx}/scripts/sin/images/register_step_1.png">
        <br>
        <span><fmt:message key="signup.process.signup"/></span>
    </li>
    
    
    <li>
        <div class="hr "></div>
        <img src="${ctx}/scripts/sin/images/register_step_2.png">
        <br>
        <span><fmt:message key="signup.process.perfect"/></span>
    </li>
    <li>
        <div class="hr "></div>
        <img src="${ctx}/scripts/sin/images/register_step_3.png">
        <br>
        <span><fmt:message key="signup.process.activation"/></span>
    </li>
    <li>
        <div class="hr "></div>
        <img src="${ctx}/scripts/sin/images/register_step_4.png">
        <br>
        <span><fmt:message key="signup.process.done"/></span>
    </li>
</ul>
</div></div>
    <div class="reg-main-body">
        




<div class="row">
  <div class="col-md-2" style="text-align:right"><img src="${ctx}/scripts/sin/images/portrait.png" class="pr22 mt-8"></div>
  <div class="col-md-9">






	
<form:form commandName="authAppUser" cssClass="form-horizontal"
           id="authAppUserForm" action="${ctx}/signup/submit" onsubmit="return validateUserOnSubmit()">
    
<form:hidden path="userId"/>
<form:hidden path="createTime"/>
<form:hidden path="updateTime"/>
<form:hidden path="overt"/>
<form:hidden path="library"/>

             <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.email"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="email" id="email"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
    
	    

	
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.password"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:password path="password" id="password"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	
	
    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="user.confirmPassword"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:password path="passwordHint" id="passwordHint"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>   	

	
    	<%-- <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.fullName"/>
						<span class="required"> &nbsp</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="fullName" id="fullName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authAppUser.phoneNumber"/>
	        	<span class="required"> &nbsp</span>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="phoneNumber" id="phoneNumber"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>  --%>       	


<div class="form-group">
    <label class="col-sm-3 col-md-3 col-lg-2 control-label">
				</label>
<div class="col-sm-9 col-md-9 col-lg-6">
        <button type="submit" class="u-btn u-btn-primary " id="bt-authAppUser-save" >
            <i class="fa fa-check"></i> <fmt:message key="signup.button.submit"/>
        </button>
     </div>   
                      
    </div>
    
        </form:form>

</div>






    </div>
</div>
</div></div>

        

<script type="text/javascript">

jQuery.validator.addMethod("idx_user_email", function(value, element) {    
    if($("#email").val()!=null){
    	var flag = 1;  
    	$.ajax({  
            type:"POST",  
            url:'${ctx}/signup/authAppUser/view/idx_user_email/validate/php',  
            async:false,   
            data:{'email':$("#email").val()},  
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
            url:'${ctx}/signup/authAppUser/view/idx_user_phonenumber/validate/php',  
            async:false,   
            data:{'phoneNumber':$("#phoneNumber").val()},  
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
var validate_authAppUserForm=$("#authAppUserForm").validate({
	rules:{
		email:{required: true,email:true,idx_user_email:true },
		password:{required: true,minlength:6,maxlength:20},
		passwordHint:{required: true,equalTo:"#password" },
		fullName:{required: true,maxlength:20 },
		phoneNumber:{required: true,digits:true,idx_user_phonenumber:true}
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
	$('#bt-authAppUser-save').attr('disabled',false);
	
	
    
    $("input[type='text']:visible:enabled:first", document.forms['authAppUserForm']).focus();
    $('.datepicker123').datepicker();
			
		    			
		
		
});
</script>

<%@ include file="/common/footer.jsp" %>