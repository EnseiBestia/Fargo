	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="stReportServerInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='stReportServerInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="stReportServerInfoList.stReportServerInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="stReportServerInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="stReportServerInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="stReportServerInfo" cssClass="form-horizontal"
           id="stReportServerInfoForm" onsubmit="return validateStReportServerInfo(this)">
<input type="hidden" name="addFlagOfStReportServerInfoForm"  value="${addFlagOfStReportServerInfoForm}"/>   
    
<form:hidden path="serverId"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stReportServerInfo.createTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="createTime" id="createTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stReportServerInfo.ifSelected"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="ifSelected" id="ifSelected" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stReportServerInfo.lastHeartBeatTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="lastHeartBeatTime" id="lastHeartBeatTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stReportServerInfo.lastStartUpTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="lastStartUpTime" id="lastStartUpTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
        <form:hidden path="library"/>	

	
    
        <form:hidden path="overt"/>	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stReportServerInfo.serverName"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="serverName" id="serverName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-stReportServerInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-stReportServerInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/stReportServerInfo/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="stReportServerInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-stReportServerInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stReportServerInfo/edit/${stReportServerInfo.serverId}/php");
    	});
    	
    	$('#bt-stReportServerInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_stReportServerInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stReportServerInfo/formSubmit/php","post","stReportServerInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['stReportServerInfoForm']).focus();
        $('.datepicker123').datepicker();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#stReportServerInfoForm input").attr("disabled","disabled");  	
        	$("#stReportServerInfoForm select").attr("disabled","disabled");
        	$("#stReportServerInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_stReportServerInfoForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
