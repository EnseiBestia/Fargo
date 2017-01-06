<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgEnumValueInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgEnumValueInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgEnumValueInfoList.cfgEnumValueInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgEnumValueInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">

</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgEnumValueInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:errors path="*" cssClass="alert alert-error fade in" element="div"/>
<form:form commandName="cfgEnumValueInfo" cssClass="form-horizontal"
           id="cfgEnumValueInfoForm" onsubmit="return validateCfgEnumValueInfo(this)">
<input type="hidden" name="addFlagOfCfgEnumValueInfoForm"  value="${addFlagOfCfgEnumValueInfoForm}"/>   
    
<form:hidden path="enumValueId"/>
    

     <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgEnumValueInfo.value"/>
				<span class="required"> *</span>		
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="value" id="value"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgEnumValueInfo.code"/>
				<span class="required"> *</span>		
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="code" id="code"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgEnumValueInfo.constantName"/>
				<span class="required"> *</span>		
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="constantName" id="constantName"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	



    
	    
	   


	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgEnumValueInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgEnumValueInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgEnumValueInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgEnumValueInfo/list/cfgEnumInfo/${cfgEnumInfo.enumId}/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>

<appfuse:javascriptValidate formName="cfgEnumValueInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgEnumValueInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgEnumValueInfo/edit/${cfgEnumValueInfo.enumValueId}/cfgEnumInfo/${cfgEnumInfo.enumId}/php");
    	});
    	
    	$('#bt-cfgEnumValueInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgEnumValueInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgEnumValueInfo/formSubmit/cfgEnumInfo/${cfgEnumInfo.enumId}/php","post","cfgEnumValueInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgEnumValueInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgEnumValueInfoForm input").attr("disabled","disabled");  	
        	$("#cfgEnumValueInfoForm select").attr("disabled","disabled");
        	$("#cfgEnumValueInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
    		
    		
    		
    		
    });
    
</script>
