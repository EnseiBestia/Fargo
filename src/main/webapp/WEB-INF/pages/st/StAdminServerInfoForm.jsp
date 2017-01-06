	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="stAdminServerInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='stAdminServerInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="stAdminServerInfoList.stAdminServerInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="stAdminServerInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="stAdminServerInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="stAdminServerInfo" cssClass="form-horizontal"
           id="stAdminServerInfoForm" onsubmit="return validateStAdminServerInfo(this)">
<input type="hidden" name="addFlagOfStAdminServerInfoForm"  value="${addFlagOfStAdminServerInfoForm}"/>   
    
<form:hidden path="serverId"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stAdminServerInfo.createTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="createTime" id="createTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stAdminServerInfo.ifSelected"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="ifSelected" id="ifSelected" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stAdminServerInfo.lastHeartBeatTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="lastHeartBeatTime" id="lastHeartBeatTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stAdminServerInfo.lastStartUpTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="lastStartUpTime" id="lastStartUpTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
        <form:hidden path="library"/>	

	
    
        <form:hidden path="overt"/>	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stAdminServerInfo.serverName"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="serverName" id="serverName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-stAdminServerInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-stAdminServerInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/stAdminServerInfo/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="stAdminServerInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-stAdminServerInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stAdminServerInfo/edit/${stAdminServerInfo.serverId}/php");
    	});
    	
    	$('#bt-stAdminServerInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_stAdminServerInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stAdminServerInfo/formSubmit/php","post","stAdminServerInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['stAdminServerInfoForm']).focus();
        $('.datepicker123').datepicker();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#stAdminServerInfoForm input").attr("disabled","disabled");  	
        	$("#stAdminServerInfoForm select").attr("disabled","disabled");
        	$("#stAdminServerInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
    		
    		
    		
    		
    		
    		
    		
    		
    });
    
</script>
