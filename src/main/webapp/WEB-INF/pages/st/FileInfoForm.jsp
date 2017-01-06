	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="fileInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='fileInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="fileInfoList.fileInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="fileInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="fileInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="fileInfo" cssClass="form-horizontal"
           id="fileInfoForm" onsubmit="return validateFileInfo(this)">
<input type="hidden" name="addFlagOfFileInfoForm"  value="${addFlagOfFileInfoForm}"/>   
    
<form:hidden path="id"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.absoluteLocation"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="absoluteLocation" id="absoluteLocation"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.contentType"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="contentType" id="contentType"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.dateId"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="dateId" id="dateId"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.downloadUrl"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="downloadUrl" id="downloadUrl"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.fileId"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="fileId" id="fileId"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.fileName"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="fileName" id="fileName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.key"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="key" id="key"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="fileInfo.size"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="size" id="size"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['fileInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-fileInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-fileInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/fileInfo/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="fileInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-fileInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/fileInfo/edit/${fileInfo.id}/php");
    	});
    	
    	$('#bt-fileInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_fileInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/fileInfo/formSubmit/php","post","fileInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['fileInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#fileInfoForm input").attr("disabled","disabled");  	
        	$("#fileInfoForm select").attr("disabled","disabled");
        	$("#fileInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_fileInfoForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
