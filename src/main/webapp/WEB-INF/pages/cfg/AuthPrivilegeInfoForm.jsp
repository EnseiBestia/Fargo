<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authPrivilegeInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='authPrivilegeInfoDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authPrivilegeInfoList.authPrivilegeInfo"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="authPrivilegeInfoDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authPrivilegeInfoDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="authPrivilegeInfo" cssClass="form-horizontal"
           id="authPrivilegeInfoForm" onsubmit="return validateAuthPrivilegeInfo(this)">
<input type="hidden" name="addFlagOfAuthPrivilegeInfoForm"  value="${addFlagOfAuthPrivilegeInfoForm}"/>   
    
<form:hidden path="privilegeId"/>

<form:hidden path="sortNo"/>

<%-- <form:hidden path="parent"/> --%>
			<div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.parent"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<form:input path="parent" id="parent"  maxlength="255" cssClass="form-control input-sm" />	            	        
		        </div>
	        </div>
			
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.formId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="formId" name="formId" value="${authPrivilegeInfo.formId}" formName="CfgFormInfo" multiple="false" type="9" pleaseSelect="true"/>	            	        
		        </div>
	        </div>
    
	    
	          	

	
			
		    
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.operateName"/>
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="operateName" name="operateName" value="${authPrivilegeInfo.operateName}" enumCode="AZ" 
        	multiple="false" type="1" pleaseSelect="true"/>
		</div>
    </div>


    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.privilegeName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="privilegeName" id="privilegeName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.privilegeType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="privilegeType" name="privilegeType" value="${authPrivilegeInfo.privilegeType}" enumCode="AW" 
        	multiple="false" type="1"/>
		</div>
    </div>
    
	    <div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.taskType"/>
					
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="taskType" name="taskType" value="${authPrivilegeInfo.taskType}" enumCode="BF" 
        	multiple="false" type="1" pleaseSelect="true"/>
		</div>
    </div>
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.url"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="url" id="url"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.ifButtonGroup"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="ifButtonGroup" id="ifButtonGroup" cssClass="checkbox"/>
	            
	        </div>
	    </div>  
	    
	    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.machineId"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="machineId" name="machineId" value="${authPrivilegeInfo.machineId}" formName="CfgStateMachineDefine" multiple="false" type="9" pleaseSelect="true" allowClear="true"/>	            	        
		        </div>
	        </div>
			<div class="form-group">
				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.enumCodeList"/>
				</label>
		        <div class="col-sm-9 col-md-9 col-lg-6">
		        	
		        <%-- <appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="enumCodeList" name="enumCodeList" value="${authPrivilegeInfo.enumCodeList}" enumCode="NULL" 
		        	multiple="true" type="1"/>	 --%>
		        	
		        	<form:input path="enumCodeList" id="enumCodeList"  maxlength="255"  />
				</div>
		    </div>
		    
    <div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.operatorRequestType"/>
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="operatorRequestType" name="operatorRequestType" value="${authPrivilegeInfo.operatorRequestType}" enumCode="BQ" 
        	multiple="false" type="1" pleaseSelect="true"/>
		</div>
    </div>
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.javaScriptFunction"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:textarea path="javaScriptFunction" id="javaScriptFunction"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>   	

	<div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="authPrivilegeInfo.ifHiddenOnTaskRunning"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="ifHiddenOnTaskRunning" id="ifHiddenOnTaskRunning" cssClass="checkbox"/>
	            
	        </div>
	    </div>  
	    
	<div class="form-group" id="iconCodeDivGroup">
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="qbPaperQuestionInfo.iconCode"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <div class="input-group input-group-sm">
	            	<div id="iconCodeDiv"><i class='${authPrivilegeInfo.iconCode}'></i></div>
		    		<form:hidden path="iconCode" id="iconCode" />
					<span class="input-group-btn">
						<a href="#" class="btn btn-inverse btn_a_click" id="btn_search_iconCode"><i class="fa fa-search"></i></a>
					</span>
				</div>
	        </div>
	    </div>     
	    
	    
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-edit']}">
	<button type="button" class="btn btn-purple" id="bt-authPrivilegeInfo-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-authPrivilegeInfo-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/authPrivilegeInfo/list/authPrivilegeInfo/${parentId}/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="authPrivilegeInfo" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-authPrivilegeInfo-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authPrivilegeInfo/edit/${authPrivilegeInfo.privilegeId}/authPrivilegeInfo/${parentId}/php");
    	});
    	
    	$('#bt-authPrivilegeInfo-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_authPrivilegeInfoForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authPrivilegeInfo/formSubmit/authPrivilegeInfo/${parentId}/php","post","authPrivilegeInfoForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['authPrivilegeInfoForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#authPrivilegeInfoForm input").attr("disabled","disabled");  	
        	$("#authPrivilegeInfoForm select").attr("disabled","disabled");
        	$("#authPrivilegeInfoForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
	
		$("#machineId").on("change", function(e) { 			
			initEnumCodeList($("#machineId").select2("val"));
		})	
		
			
	
			initEnumCodeList(${authPrivilegeInfo.machineId});
		
		
			$('#taskType').change(function(){ 
				
				var p2=$('#taskType').val();
				if(p2!=null && p2!=""){
					$('#url').val("/stTaskInfo/add/"+p2+"/${'$'}{formName}/${'$'}{objectId}/php")
					$('#operatorRequestType').val("BQD");
				}
				
				
			}) 
	
	
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_authPrivilegeInfoForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
		
		
		$('#btn_search_iconCode').click(function(){
       		bootboxOpenDialog("${ctx}/lb/${libraryPath}/cfgIconInfo/list/forselect/select1/php","<fmt:message key="authPrivilegeInfo.iconCode"/>",
    				function(){
       					//alert($("#iconCode").val());
       					$("#iconCode").val($("#icon_selected").val());
       					$("#iconCodeDiv").html("<i class='"+$("#icon_selected").val()+"'></i>");
    				});
    	});
		
    });
    
    
    function initEnumCodeList(machineId){
    	//$("#enumCodeList").select2("val", "");
    	if(machineId==null || machineId==""){
    		machineId=0;
    		$("#enumCodeList").select2("val", "");
    	}
    	try{
    		$.ajax({ 
    			type: "get", 
    			url: "${ctx}/lb/${libraryPath}/cfgStateMachineDefine/list/view/"+machineId+"/getEnumCodeList/php", 
    			dataType: "json",
    			success: function(msg){		
    				
    				$("#enumCodeList").select2({multiple: true,data:msg,width:"476px"});
    				
    			}
    		});
    	}catch(exception){
    		alert(exception);
    	}
    	
    	
    	
    	//select2MulitiForFormElement($("#enumCodeList"),);
    	
    	
    }
    
</script>
