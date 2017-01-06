
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<form:form commandName="searchValue" id="cfgCustomPropertySearchForm">

<div class="row" style="position:relative">
	<div class="col-xs-12 col-sm-4 nopadding">
		<h2><fmt:message key="cfgCustomPropertyList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-cfgCustomProperty-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-cfgCustomProperty-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
	
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-cfgCustomProperty-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</div>

</div>


  
</form:form>


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgCustomPropertyList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgCustomPropertyList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgCustomProperty/list/${listFlag}/php" id="cfgCustomPropertyList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-delete']}">	
	<display:column title="<input  id='cfgCustomPropertyListChkAll' type='checkbox' name='cfgCustomPropertyListChkAll' onclick='checkAllOfcfgCustomPropertyList()'"> 
      <input type="checkbox" name="cfgCustomPropertyListChecklist" value="${cfgCustomPropertyList.propertyId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-view']}">
		
        <display:column sortable="false"         titleKey="cfgCustomProperty.propertyId">
         	<a href="${ctx}/lb/${libraryPath}/cfgCustomProperty/view/${cfgCustomPropertyList.propertyId}/php">
         		${cfgCustomPropertyList.propertyId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-view']}">
		<display:column property="propertyId" sortable="false" titleKey="cfgCustomProperty.propertyId"/>
	</c:if>	
    
    
	<display:column property="propertyCode" sortable="false" titleKey="cfgCustomProperty.propertyCode"/>
	    
    
    <display:column property="propertyName" sortable="false" titleKey="cfgCustomProperty.propertyName"/>    
    
    <display:column property="formInfo.formName" sortable="false" titleKey="cfgCustomProperty.formInfo"/>
    

	<display:column sortable="false" titleKey="cfgCustomProperty.valueType">
		${allEnumValueInfoMap[cfgCustomPropertyList.valueType]}
	</display:column>
	
	<display:column sortProperty="required" sortable="false" titleKey="cfgCustomProperty.required">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgCustomPropertyList.required}">checked="checked"</c:if>/>
    </display:column>
    <display:column sortProperty="overt" sortable="false" titleKey="cfgCustomProperty.overt">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgCustomPropertyList.overt}">checked="checked"</c:if>/>
    </display:column>

    <display:column sortProperty="useQuery" sortable="false" titleKey="cfgCustomProperty.useQuery">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgCustomPropertyList.useQuery}">checked="checked"</c:if>/>
    </display:column>
	
	<display:column property="defaultValue" sortable="false" titleKey="cfgCustomProperty.defaultValue"/>
	
    <display:column property="library" sortable="false" titleKey="cfgCustomProperty.library"/>
	    
    
    <%-- <display:column property="max" sortable="false" titleKey="cfgCustomProperty.max"/>
	    
    
    <display:column property="maxlength" sortable="false" titleKey="cfgCustomProperty.maxlength"/>
	    
    
    <display:column property="mimlength" sortable="false" titleKey="cfgCustomProperty.mimlength"/>
	    
    
    <display:column property="min" sortable="false" titleKey="cfgCustomProperty.min"/> --%>
	    
    
    <%-- <display:column sortProperty="multiple" sortable="false" titleKey="cfgCustomProperty.multiple">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgCustomPropertyList.multiple}">checked="checked"</c:if>/>
    </display:column> --%>
	    
    
	    
    
    <%-- <display:column property="valueList" sortable="false" titleKey="cfgCustomProperty.valueList"/> --%>
	    
    
	

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgCustomPropertyList(){
			
		if($("#cfgCustomPropertyListChkAll").prop('checked') ==true){
			$("input[name='cfgCustomPropertyListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgCustomPropertyListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-add']}">
		$('#bt-cfgCustomProperty-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgCustomProperty/add");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgCustomProperty-delete']}">	
    	$('#bt-cfgCustomProperty-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgCustomPropertyListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgCustomProperty/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgCustomProperty-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgCustomProperty/list/${listFlag}/php","post","cfgCustomPropertySearchForm","");
    	});
    	
			
	});
</script>

