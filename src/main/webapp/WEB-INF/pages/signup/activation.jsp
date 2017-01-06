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
        <img src="${ctx}/scripts/sin/images/register_step_2_active.png">
        <br>
        <span><fmt:message key="signup.process.perfect"/></span>
    </li>
    <li>
        <div class="hr "></div>
        <img src="${ctx}/scripts/sin/images/register_step_3_active.png">
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
    
    
        <div class="reg-main-body reg-main-activate-body">
        <p class="text-center mb5"><fmt:message key="signup.activation.t0"/> ${ authAppUser.email}</p>
        <p class="text-center activ-tips"><fmt:message key="signup.activation.t1"/></p>

        <p class="text-center activ-tips"><fmt:message key="signup.activation.t2"/></p>

        <div class="text-center">
            <button href="http://mail.qq.com" class="u-btn u-btn-primary mail" mail="33072674@qq.com"><fmt:message key="signup.activation.t3"/></button>
        </div>

        <div class="dashed-line"></div>
        <div class="activate-email-info">
            <p class="mt25 mb15"><fmt:message key="signup.activation.t4"/></p>
            <ul class="mail_info list-decimal">
                <li>1. <fmt:message key="signup.activation.t5"/></li>
                <li>2. <fmt:message key="signup.activation.t6"/><a id="sendActivateMail" href="#"><fmt:message key="signup.activation.t7"/></a><fmt:message key="signup.activation.t9"/></li>
                <li>3. <fmt:message key="signup.activation.t8"/></li>
                <li>
                    <div class="error-tip-container" style="display:none">
                        <label class="error"></label>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    
    
</div></div>

        

<script type="text/javascript">

var validate_authAppUserForm=$("#authAppUserForm").validate({
	rules:{
		email:{required: true,email:true },
		password:{required: true,minlength:6,maxlength:20},
		passwordHint:{required: true,equalTo:"#password" },
		fullName:{required: true,maxlength:20 },
		phoneNumber:{required: true,digits:true }
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