	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="stTaskInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='stTaskInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="stTaskInfoList.stTaskInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="stTaskInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="stTaskInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="stTaskInfo" cssClass="form-horizontal"
           id="stTaskInfoForm" onsubmit="return validateStTaskInfo(this)">
<input type="hidden" name="addFlagOfStTaskInfoForm"  value="${addFlagOfStTaskInfoForm}"/>   
    
<form:hidden path="taskId"/>
    <%-- <form:hidden path="taskDetails"/> --%>
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.adminServerId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="adminServerId" name="adminServerId" value="${stTaskInfo.adminServerId}" formName="StAdminServerInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.createTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="createTime" id="createTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.doneTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="doneTime" id="doneTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.executeTimes"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="executeTimes" id="executeTimes"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.formId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="formId" name="formId" value="${stTaskInfo.formId}" formName="CfgFormInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    
        <form:hidden path="library"/>	

	
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.objectId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="objectId" name="objectId" value="${stTaskInfo.objectId}" formName="CfgFormInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    
        <form:hidden path="overt"/>	

	
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.reportServerId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="reportServerId" name="reportServerId" value="${stTaskInfo.reportServerId}" formName="StReportServerInfo" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.runTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="runTime" id="runTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <%-- <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.taskDetails"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="taskDetails" id="taskDetails"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>  --%>       	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.taskName"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="taskName" id="taskName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.taskServerType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="taskServerType" name="taskServerType" value="${stTaskInfo.taskServerType}" enumCode="BY" 
        	multiple="false" type="1"/>
		</div>
    </div>
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.taskStatus"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="taskStatus" name="taskStatus" value="${stTaskInfo.taskStatus}" enumCode="BG" 
        	multiple="false" type="1"/>
		</div>
    </div>
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.taskType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="taskType" name="taskType" value="${stTaskInfo.taskType}" enumCode="BF" 
        	multiple="false" type="1"/>
		</div>
    </div>
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stTaskInfo.user"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="user" name="user" value="${stTaskInfo.user}" formName="AuthAppUser" multiple="false" type="9"/>	            	        
		        </div>
	        </div>
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-stTaskInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-stTaskInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/stTaskInfo/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="stTaskInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-stTaskInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stTaskInfo/edit/${stTaskInfo.taskId}/php");
    	});
    	
    	$('#bt-stTaskInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_stTaskInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stTaskInfo/formSubmit/php","post","stTaskInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['stTaskInfoForm']).focus();
        $('.datepicker123').datepicker();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#stTaskInfoForm input").attr("disabled","disabled");  	
        	$("#stTaskInfoForm select").attr("disabled","disabled");
        	$("#stTaskInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
		    
			
		    
			
		    
			
		    
			
	
	
	
		    
			
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_stTaskInfoForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
