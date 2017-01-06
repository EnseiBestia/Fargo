	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="stExportFileInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='stExportFileInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="stExportFileInfoList.stExportFileInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="stExportFileInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="stExportFileInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="stExportFileInfo" cssClass="form-horizontal"
           id="stExportFileInfoForm" onsubmit="return validateStExportFileInfo(this)">
<input type="hidden" name="addFlagOfStExportFileInfoForm"  value="${addFlagOfStExportFileInfoForm}"/>   
    
<form:hidden path="exportId"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stExportFileInfo.createTime"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="createTime" id="createTime" size="11" title="date"  cssClass="form-control input-sm datepicker123"/>
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stExportFileInfo.downloadUrl"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="downloadUrl" id="downloadUrl"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stExportFileInfo.exportName"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="exportName" id="exportName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stExportFileInfo.ifZip"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="ifZip" id="ifZip" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	

	
    
        <form:hidden path="library"/>	

	
    
        <form:hidden path="overt"/>	

	
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stExportFileInfo.status"/>
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="status" name="status" value="${stExportFileInfo.status}" enumCode="CE" 
        	multiple="false" type="1"/>
		</div>
    </div>
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stExportFileInfo.type"/>
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="type" name="type" value="${stExportFileInfo.type}" enumCode="CD" 
        	multiple="false" type="1"/>
		</div>
    </div>
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['stExportFileInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-stExportFileInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-stExportFileInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/stExportFileInfo/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="stExportFileInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-stExportFileInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stExportFileInfo/edit/${stExportFileInfo.exportId}/php");
    	});
    	
    	$('#bt-stExportFileInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_stExportFileInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stExportFileInfo/formSubmit/php","post","stExportFileInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['stExportFileInfoForm']).focus();
        $('.datepicker123').datepicker();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#stExportFileInfoForm input").attr("disabled","disabled");  	
        	$("#stExportFileInfoForm select").attr("disabled","disabled");
        	$("#stExportFileInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
	
	
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_stExportFileInfoForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
