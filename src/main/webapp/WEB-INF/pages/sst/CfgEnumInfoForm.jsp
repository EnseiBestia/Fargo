<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgEnumInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgEnumInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgEnumInfoList.cfgEnumInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgEnumInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgEnumInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgEnumInfo" cssClass="form-horizontal"
           id="cfgEnumInfoForm" onsubmit="return validateCfgEnumInfo(this)">
<input type="hidden" name="addFlagOfCfgEnumInfoForm"  value="${addFlagOfCfgEnumInfoForm}"/>   
    
<form:hidden path="enumId"/>
    
    
	    <spring:bind path="cfgEnumInfo.constantName">
	    <div class="form-group">
	    </spring:bind>
	        <appfuse:label key="cfgEnumInfo.constantName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="constantName" id="constantName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    <spring:bind path="cfgEnumInfo.enumCode">
	    <div class="form-group">
	    </spring:bind>
	        <appfuse:label key="cfgEnumInfo.enumCode" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="enumCode" id="enumCode"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    <spring:bind path="cfgEnumInfo.enumName">
	    <div class="form-group">
	    </spring:bind>
	        <appfuse:label key="cfgEnumInfo.enumName" styleClass="col-sm-3 col-md-3 col-lg-2 control-label"/>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="enumName" id="enumName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	

	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgEnumInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgEnumInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgEnumInfo/list?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>


<div class="div_iframe" id="CfgEnumValueInfoOfCfgEnumInfoListDiv">
	<c:if test="${addFlagOfCfgEnumInfoForm!='1'}">
	<%@ include file="CfgEnumValueInfoOfCfgEnumInfoList.jsp" %>
	</c:if>
</div>



<appfuse:javascriptValidate formName="cfgEnumInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgEnumInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			containerLoadUrlUseAjaxInDiv("cfgEnumInfoForm","${ctx}/lb/${libraryPath}/cfgEnumInfo/edit/${cfgEnumInfo.enumId}/php");
    	});
    	
    	$('#bt-cfgEnumInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgEnumInfoForm.form()){
				containerFormSubmitUseAjaxIndiv('cfgEnumInfoForm','${ctx}/lb/${libraryPath}/cfgEnumInfo/formSubmit');
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgEnumInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgEnumInfoForm input").attr("disabled","disabled");  	
        	$("#cfgEnumInfoForm select").attr("disabled","disabled");
    	</c:if>
    });
    
</script>
