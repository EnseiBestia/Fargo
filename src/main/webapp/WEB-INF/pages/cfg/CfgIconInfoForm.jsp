	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgIconInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgIconInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgIconInfoList.cfgIconInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgIconInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgIconInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgIconInfo" cssClass="form-horizontal"
           id="cfgIconInfoForm" onsubmit="return validateCfgIconInfo(this)">
<input type="hidden" name="addFlagOfCfgIconInfoForm"  value="${addFlagOfCfgIconInfoForm}"/>   
    
<form:hidden path="iconId"/>
    
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgIconInfo.iconCode"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="iconCode" id="iconCode"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgIconInfo.iconFolder"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="iconFolder" id="iconFolder"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgIconInfo.iconName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="iconName" id="iconName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgIconInfo.iconSize"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="iconSize" id="iconSize"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgIconInfo.iconType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="iconType" name="iconType" value="${cfgIconInfo.iconType}" enumCode="BW" 
        	multiple="false" type="1"/>
		</div>
    </div>
    
        <form:hidden path="library"/>	

	
    
        <form:hidden path="overt"/>	

	
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgIconInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgIconInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgIconInfo/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="cfgIconInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgIconInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgIconInfo/edit/${cfgIconInfo.iconId}/php");
    	});
    	
    	$('#bt-cfgIconInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgIconInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgIconInfo/formSubmit/php","post","cfgIconInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgIconInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgIconInfoForm input").attr("disabled","disabled");  	
        	$("#cfgIconInfoForm select").attr("disabled","disabled");
        	$("#cfgIconInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
	
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_cfgIconInfoForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
