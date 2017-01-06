<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgStateMachineButtonDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgStateMachineButtonDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgStateMachineButtonList.cfgStateMachineButton"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgStateMachineButtonDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">

</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgStateMachineButtonDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:errors path="*" cssClass="alert alert-error fade in" element="div"/>
<form:form commandName="cfgStateMachineButton" cssClass="form-horizontal"
           id="cfgStateMachineButtonForm" onsubmit="return validateCfgStateMachineButton(this)">
<input type="hidden" name="addFlagOfCfgStateMachineButtonForm"  value="${addFlagOfCfgStateMachineButtonForm}"/>   
    
<form:hidden path="buttonId"/>
    

    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineButton.URL"/>
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="URL" id="URL"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	



    
	    
	    <div class="form-group">
	   
	    <label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineButton.buttonName"/>
				<span class="required"> *</span>		
		</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="buttonName" id="buttonName"  maxlength="255" cssClass="form-control input-sm" />
	        </div>
	    </div>        	


			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineButton.roleList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="roleList" name="roleList" value="${cfgStateMachineButton.roleList}" formName="AuthAppRole" multiple="true" type="9"/>	            	        
		        </div>
	        </div>
	<div class="form-group">    
      	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineButton.targetStat"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="targetStat" name="targetStat" value="${cfgStateMachineButton.targetStat}" enumCode="${cfgEnumInfo.enumCode }" 
        	multiple="false" type="1"/>
		</div>
    </div>
	<div class="form-group">    
      	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineButton.viewType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="viewType" name="viewType" value="${cfgStateMachineButton.viewType}" enumCode="BS" 
        	multiple="true" type="1"/>
		</div>
    </div>
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineButton-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgStateMachineButton-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgStateMachineButton-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgStateMachineButton/list/cfgStateMachineValue/${cfgStateMachineValue.statId}/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>

<appfuse:javascriptValidate formName="cfgStateMachineButton" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgStateMachineButton-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineButton/edit/${cfgStateMachineButton.buttonId}/cfgStateMachineValue/${cfgStateMachineValue.statId}/php");
    	});
    	
    	$('#bt-cfgStateMachineButton-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgStateMachineButtonForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineButton/formSubmit/cfgStateMachineValue/${cfgStateMachineValue.statId}/php","post","cfgStateMachineButtonForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgStateMachineButtonForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgStateMachineButtonForm input").attr("disabled","disabled");  	
        	$("#cfgStateMachineButtonForm select").attr("disabled","disabled");
        	$("#cfgStateMachineButtonForm textarea").attr("disabled","disabled");
    	</c:if>
    	
						$("#roleList").on("change", function(e) { 			
				    		validate_cfgStateMachineButtonForm.element($("#roleList"));
						})	        		
		    
			
	
	
						$("#viewType").on("change", function(e) { 			
				    		validate_cfgStateMachineButtonForm.element($("#viewType"));
						})	        		
    	$('#targetStat').change(function(){ 
				
			var p2=$('#targetStat').val();
			if(p2!=null && p2!=""){
				$('#buttonName').val($("#targetStat").find("option:selected").text())
			}else{
				
			}
			
			
		}) 
		
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_cfgStateMachineButtonForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    	
    });
    
</script>
