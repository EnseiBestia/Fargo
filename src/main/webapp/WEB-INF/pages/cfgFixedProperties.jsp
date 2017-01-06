
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgFixedPropertyList.heading"/></h2>

<div class="widget-box widget-plain">
<div class="widget-content">
<fmt:message key="cfgFixedPropertyList.message"/>
</div>

<div id="cfgFixedPropertyListActions" class="form-actions widget-content ">
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedProperty-add']}">
    	<button type="button" class="btn btn-purple" id="bt-cfgFixedProperty-add" >
   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
   	</button>		
   	</c:if>
   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedProperty-delete']}">
    	<button type="button" class="btn btn-dark-red" id="bt-cfgFixedProperty-delete">
   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
   	</c:if>
</div>
</div>

<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgFixedPropertyList.title"/></h5>
		
	</div>
	<div class="widget-content">
		
<display:table name="cfgFixedPropertyList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgFixedProperty/list" id="cfgFixedPropertyList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedProperty-delete']}">	
	<display:column title="<input  id='cfgFixedPropertyListChkAll' type='checkbox' name='cfgFixedPropertyListChkAll' onclick='checkAllOfcfgFixedPropertyList()'"> 
      <input type="checkbox" name="cfgFixedPropertyListChecklist" value="${cfgFixedPropertyList.propertyId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedProperty-view']}">
		<display:column property="propertyId" sortable="false" href="${ctx}/lb/${libraryPath}/cfgFixedProperty/view/${cfgFixedPropertyList.propertyId}/php" media="html"
         titleKey="cfgFixedProperty.propertyId"/>
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgFixedProperty-view']}">
		<display:column property="propertyId" sortable="false" titleKey="cfgFixedProperty.propertyId"/>
	</c:if>	
    
    <display:column property="defaultValue" sortable="false" titleKey="cfgFixedProperty.defaultValue"/>
    <display:column property="formId" sortable="false" titleKey="cfgFixedProperty.formId"/>
    <display:column property="propertyCode" sortable="false" titleKey="cfgFixedProperty.propertyCode"/>
    <display:column property="propertyName" sortable="false" titleKey="cfgFixedProperty.propertyName"/>
    <display:column sortProperty="required" sortable="false" titleKey="cfgFixedProperty.required">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgFixedPropertyList.required}">checked="checked"</c:if>/>
    </display:column>
    <display:column property="test1" sortable="false" titleKey="cfgFixedProperty.test1"/>
    <display:column property="valueType" sortable="false" titleKey="cfgFixedProperty.valueType"/>

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgFixedPropertyList(){
			
		if($("#cfgFixedPropertyListChkAll").prop('checked') ==true){
			$("input[name='cfgFixedPropertyListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgFixedPropertyListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
		$('#bt-cfgFixedProperty-add').click(function(){
    		$(this).attr('disabled',true)
			containerLoadUrlUseAjaxInDiv("cfgFixedPropertyListActions","${ctx}/lb/${libraryPath}/cfgFixedProperty/add");
    	});
    	
    	$('#bt-cfgFixedProperty-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgFixedPropertyListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					containerFormSubmitUseAjaxIndiv('cfgFixedPropertyListActions','${ctx}/lb/${libraryPath}/cfgFixedProperty/delete/'+selstrs+'/php');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});

	});
</script>

