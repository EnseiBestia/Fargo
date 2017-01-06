	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="stSystemNoticeInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='stSystemNoticeInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="stSystemNoticeInfoList.stSystemNoticeInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="stSystemNoticeInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="stSystemNoticeInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="stSystemNoticeInfo" cssClass="form-horizontal"
           id="stSystemNoticeInfoForm" onsubmit="return validateStSystemNoticeInfo(this)">
<input type="hidden" name="addFlagOfStSystemNoticeInfoForm"  value="${addFlagOfStSystemNoticeInfoForm}"/>   
    
<form:hidden path="noticeId"/>
    
<form:hidden path="createTime"/>
<form:hidden path="createUserId"/>	    
	    
    
        <form:hidden path="library"/>	

	
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.noticeLevel"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="noticeLevel" name="noticeLevel" value="${stSystemNoticeInfo.noticeLevel}" enumCode="BU" 
        	multiple="false" type="1"/>
		</div>
    </div>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.noticeName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="noticeName" id="noticeName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.noticeText"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="noticeText" id="noticeText"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.noticeType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="noticeType" name="noticeType" value="${stSystemNoticeInfo.noticeType}" enumCode="BT" 
        	multiple="false" type="1"/>
		</div>
    </div>
    <c:if test="${ifSuperAdmin=='1' }">
        <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.overt"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="overt" id="overt" cssClass="checkbox"/>
	            
	        </div>
	    </div>        		
	</c:if>
	<c:if test="${ifSuperAdmin!='1' }">
        <form:hidden path="overt"/>	
	</c:if>
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.roleList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="roleList" name="roleList" value="${stSystemNoticeInfo.roleList}" formName="AuthAppRole" multiple="true" type="9"/>	            	        
		        </div>
	        </div>
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.status"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="status" name="status" value="${stSystemNoticeInfo.status}" enumCode="BV" 
        	multiple="false" type="1"/>
		</div>
    </div>
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="stSystemNoticeInfo.userList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="userList" name="userList" value="${stSystemNoticeInfo.userList}" formName="AuthAppUser" multiple="true" type="9"/>	            	        
		        </div>
	        </div>
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-stSystemNoticeInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-stSystemNoticeInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/stSystemNoticeInfo/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="stSystemNoticeInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-stSystemNoticeInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stSystemNoticeInfo/edit/${stSystemNoticeInfo.noticeId}/php");
    	});
    	
    	$('#bt-stSystemNoticeInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_stSystemNoticeInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stSystemNoticeInfo/formSubmit/php","post","stSystemNoticeInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['stSystemNoticeInfoForm']).focus();
        $('.datepicker123').datepicker();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#stSystemNoticeInfoForm input").attr("disabled","disabled");  	
        	$("#stSystemNoticeInfoForm select").attr("disabled","disabled");
        	$("#stSystemNoticeInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
	
	
						$("#roleList").on("change", function(e) { 			
				    		validate_stSystemNoticeInfoForm.element($("#roleList"));
						})	        		
		    
			
	
						$("#userList").on("change", function(e) { 			
				    		validate_stSystemNoticeInfoForm.element($("#userList"));
						})	        		
		    
			
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_stSystemNoticeInfoForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
