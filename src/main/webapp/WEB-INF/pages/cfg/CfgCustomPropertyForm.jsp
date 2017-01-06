<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="cfgCustomPropertyDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='cfgCustomPropertyDetail.heading'/>"/>
</head>

<script src="${ctx}/scripts/select2-3.5.2/select2.js"></script>
<link rel="stylesheet" href="${ctx}/scripts/select2-3.5.2/select2.css" />

<c:set var="delObject" scope="request"><fmt:message key="cfgCustomPropertyList.cfgCustomProperty"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<h2><fmt:message key="cfgCustomPropertyDetail.heading"/></h2>
<!--<div class="widget-box widget-plain">
<div class="widget-content">



</div>
</div>-->
<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="cfgCustomPropertyDetail.message"/></h5>
	</div>
	<div class="widget-content nopadding">
	
<form:form commandName="cfgCustomProperty" cssClass="form-horizontal"
           id="cfgCustomPropertyForm" onsubmit="return validateCfgCustomProperty(this)">
<input type="hidden" name="addFlagOfCfgCustomPropertyForm"  value="${addFlagOfCfgCustomPropertyForm}"/>   
    
<form:hidden path="propertyId"/>
    
    
	    
	    	

	
			
		    <div class="form-group">		    
		  				<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.formInfo"/>
						<span class="required"> *</span></label>
			    <div class="col-sm-9 col-md-9 col-lg-6">	  
		            	<select id="formInfo" name="formInfo.formId" class="form-control"  style="width:100%;height:34px"></select>	            	        
		        </div>
	        </div>
    
        <form:hidden path="library"/>	

	
    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.propertyCode"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="propertyCode" id="propertyCode"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.propertyName"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="propertyName" id="propertyName"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    	<div class="form-group">
		<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.valueType"/>
				<span class="required"> *</span>		
		</label>
        <div class="col-sm-9 col-md-9 col-lg-6">
			<form:select path="valueType"  class="form-control" onchange="changeValueTypeOfObject(this)" id="valueType">
                <c:forEach var="v_list" items="${allEnumInfoMap['AV'].values}">
                	<form:option value="${v_list.fullCode}" >${v_list.value}</form:option>
            	</c:forEach>
            </form:select>
		</div>
    </div>
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.required"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="required" id="required" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	

	
        <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.overt"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="overt" id="overt" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	
	    
	    <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.useQuery"/>
						<span class="required"> *</span>		
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="useQuery" id="useQuery" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	
    
     <div class="form-group">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.defaultValue"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="defaultValue" id="defaultValue"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>       
	    
	    
	    
	      	

	
    
	    
	    <div class="form-group fdiv_string">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.maxlength"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="maxlength" id="maxlength"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group fdiv_string" >
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.mimlength"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="mimlength" id="mimlength"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
     <div class="form-group fdiv_number">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.max"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="max" id="max"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>     
	    
	    <div class="form-group fdiv_number">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.min"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:input path="min" id="min"  maxlength="255" cssClass="form-control input-sm" />
	            
	        </div>
	    </div>        	

	
    
	    
	    <div class="form-group fdiv_list">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label"><fmt:message key="cfgCustomProperty.multiple"/>
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <form:checkbox path="multiple" id="multiple" cssClass="checkbox"/>
	            
	        </div>
	    </div>        	

	
    
	    
	

	
    
	    
	    
	
    
	    
	    <div class="form-group fdiv_list">
	    
	        	<label class="col-sm-3 col-md-3 col-lg-2 control-label">
				</label>
	        <div class="col-sm-9 col-md-9 col-lg-6">
	            <%-- <form:input path="valueList" id="valueList"  maxlength="255" cssClass="form-control input-sm" /> --%>
	            <form:input path="valueList"   id="form_valueType"/>
	            
	        </div>
	    </div>        	

	

	<%@ include file="/scripts/customProperty.jsp" %>
    <div class="form-actions">
    
    
    <c:if test="${!formEditFlag && !empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-edit']}">
	<button type="button" class="btn btn-purple" id="bt-cfgCustomProperty-edit" >
       		<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
    </button>
    	
    </c:if>
    <c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-cfgCustomProperty-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/cfgCustomProperty/list/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>
</form:form>
</div>
</div>



<appfuse:javascriptValidate formName="cfgCustomProperty" cdata="false" dynamicJavascript="true" staticJavascript="false"/>



<script type="text/javascript">
		
    $(document).ready(function() {
    	$('#bt-cfgCustomProperty-edit').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgCustomProperty/edit/${cfgCustomProperty.propertyId}/php");
    	});
    	
    	$('#bt-cfgCustomProperty-save').click(function(){
    		$(this).attr('disabled',true);
			if(validate_cfgCustomPropertyForm.form()){
				ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgCustomProperty/formSubmit","post","cfgCustomPropertyForm");
			}else{
				$(this).attr('disabled',false);
			}
    	});
    	
        <c:if test="${formEditFlag}">
         $("input[type='text']:visible:enabled:first", document.forms['cfgCustomPropertyForm']).focus();
		</c:if>
        <c:if test="${!formEditFlag}">
        	$("#cfgCustomPropertyForm input").attr("disabled","disabled");  	
        	$("#cfgCustomPropertyForm select").attr("disabled","disabled");
        	$("#cfgCustomPropertyForm textarea").attr("disabled","disabled");
    	</c:if>
    	
    	
    		
    		
    					             
    			
    		    	
		 		<c:if test="${empty authPrivilegeInfo.form}">		
		    		select2ForFormElement($("#formInfo"),"${ctx}/lb/${libraryPath}/cfgFormInfo/list/select/php",true);
		    	</c:if>	
		    	<c:if test="${!empty authPrivilegeInfo.form}">		
		    		select2ForFormElement($("#formInfo"),"${ctx}/lb/${libraryPath}/cfgFormInfo/list/select/php",true,${cfgCustomProperty.formInfo.formId});
		    	</c:if>		
		 		
		 		
		 		
		    	 $("#form_valueType").select2({tags:[]});	
		 		
		    	 $("#cfgCustomPropertyForm .fdiv_string").css("display","none");
		    	 $("#cfgCustomPropertyForm .fdiv_number").css("display","none");
		    	 $("#cfgCustomPropertyForm .fdiv_list").css("display","none");
    		
    			 	
		    	 changeValueTypeOfValue(document.getElementById("valueType").value);
    		
    		
    		
    });
    function changeValueTypeOfObject(slv){
    	changeValueTypeOfValue(slv.value);
    	//alert(slv.value);
    }
    function changeValueTypeOfValue(slvValue){
    	if(slvValue=="AVB" || slvValue=="AVC"){
    		$("#cfgCustomPropertyForm .fdiv_string").css("display","none");
	    	$("#cfgCustomPropertyForm .fdiv_number").css("display","");
	    	$("#cfgCustomPropertyForm .fdiv_list").css("display","none");
    	}else if(slvValue=="AVD"  || slvValue=="AVE"){
    		$("#cfgCustomPropertyForm .fdiv_string").css("display","");
	    	$("#cfgCustomPropertyForm .fdiv_number").css("display","none");
	    	$("#cfgCustomPropertyForm .fdiv_list").css("display","none");
    	}else if(slvValue=="AVF"){
    		$("#cfgCustomPropertyForm .fdiv_string").css("display","none");
	    	$("#cfgCustomPropertyForm .fdiv_number").css("display","none");
	    	$("#cfgCustomPropertyForm .fdiv_list").css("display","");
    	}
    	//alert(slvValue);
    }
    
</script>
