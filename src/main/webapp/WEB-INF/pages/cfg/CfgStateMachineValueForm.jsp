	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgStateMachineValueDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgStateMachineValueDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="cfgStateMachineValueList.cfgStateMachineValue"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgStateMachineValueDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgStateMachineValueDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgStateMachineValue" cssClass="form-horizontal"
           id="cfgStateMachineValueForm" onsubmit="return validateCfgStateMachineValue(this)">
<input type="hidden" name="addFlagOfCfgStateMachineValueForm"  value="${addFlagOfCfgStateMachineValueForm}"/>   
    
<form:hidden path="statId"/>
    

    
	    
	   <%--  <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineValue.ifRefresh"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="ifRefresh" id="ifRefresh" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	 --%>

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineValue.machineId"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="machineId" id="machineId"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
			
		    <%-- <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineValue.roleList"/>
						</label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="roleList" name="roleList" value="${cfgStateMachineValue.roleList}" formName="AuthAppRole" multiple="true" type="9"/>	            	        
		        </div>
	        </div> --%>
	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineValue.sourceStat"/>
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="sourceStat" name="sourceStat" value="${cfgStateMachineValue.sourceStat}" enumCode="${cfgEnumInfo.enumCode }" 
        	multiple="false" type="1" pleaseSelect="true"/>
		</div>
    </div>
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineValue.statName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="statName" id="statName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
	<%-- <div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgStateMachineValue.targetStat"/>
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
        	<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="targetStat" name="targetStat" value="${cfgStateMachineValue.targetStat}" enumCode="${cfgEnumInfo.enumCode }" 
        	multiple="true" type="1"/>
		</div>
    </div> --%>
	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgStateMachineValue-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgStateMachineValue-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgStateMachineValue/list/cfgStateMachineDefine/${machineId}/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>


<div class="div_iframe" id="CfgStateMachineButtonOfCfgStateMachineValueListDiv">
	<c:if test="${addFlagOfCfgStateMachineValueForm!='1'}">
	<%@ include file="CfgStateMachineButtonList.jsp" %>
	</c:if>
</div>



<appfuse:javascriptValidate formName="cfgStateMachineValue" cdata="false" dynamicJavascript="true" staticJavascript="false"/>


<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgStateMachineValue-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineValue/edit/${cfgStateMachineValue.statId}/cfgStateMachineDefine/${machineId}/php");
    	});
    	
    	$('#bt-cfgStateMachineValue-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgStateMachineValueForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineValue/formSubmit/cfgStateMachineDefine/${machineId}/php","post","cfgStateMachineValueForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgStateMachineValueForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgStateMachineValueForm input").attr("disabled","disabled");  	
        	$("#cfgStateMachineValueForm select").attr("disabled","disabled");
        	$("#cfgStateMachineValueForm textarea").attr("disabled","disabled");
    	</c:if>
    	
						$("#roleList").on("change", function(e) { 			
				    		validate_cfgStateMachineValueForm.element($("#roleList"));
						})	        		
		    
			$('#sourceStat').change(function(){ 
				
			var p2=$('#sourceStat').val();
			if(p2!=null && p2!=""){
				$('#statName').val($("#sourceStat").find("option:selected").text());
			}else{
				$('#statName').val("");
			}
			
			
		}) 
	
	
						/* $("#targetStat").on("change", function(e) { 			
				    		validate_cfgStateMachineValueForm.element($("#targetStat"));
						}) */	        		
    	
	    <c:forEach var="v_customProperty" items="${customPropertyList}">
	            <c:if test="${v_customProperty.valueType=='AVF' && v_customProperty.multiple}">           	
	            		$("#customPropertyMap_${v_customProperty.propertyCode}").on("change", function(e) { 			
					    		validate_cfgStateMachineValueForm.element($("#customPropertyMap_${v_customProperty.propertyCode}"));
						})         	
	        	</c:if>      	
		</c:forEach>
    });
    
</script>
