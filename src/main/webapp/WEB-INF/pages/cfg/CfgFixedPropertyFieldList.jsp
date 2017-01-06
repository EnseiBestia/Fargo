

<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgFixedPropertyFieldList.heading"/></h2>

<div class="widget-box" id="cfgFixedPropertyFieldListActions">
		<div class="widget-title">
			<span class="icon">
				<i class="fa fa-th"></i>
			</span>
			<h5><fmt:message key="cfgFixedPropertyFieldList.heading"/></h5>
			<div class="buttons">
					<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-add']}">
				    	<button type="button" class="btn" id="bt-cfgFixedPropertyField-add" onclick="bt_cfgFixedPropertyField_add_click(this)">
				   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
				   		 </button>	
				   		 				   			
				   	</c:if>
				
			</div>
		</div>
		<div class="widget-content nopadding" style="overflow:auto;">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
							

							    <th><fmt:message key="cfgFixedPropertyField.defaultValue"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.fieldName"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.library"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.max"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.maxlength"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.mimlength"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.min"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.multiple"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.overt"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.required"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.valueList"/></th>
							

							    <th><fmt:message key="cfgFixedPropertyField.valueType"/></th>
							
						
						<th><fmt:message key="title.operate"/></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="v_values" items="${cfgFixedPropertyDefine.fieldList}">
					<tr>
							
							        <td>${v_values.defaultValue}</td>
							        <td>${v_values.fieldName}</td>
							        <td>${v_values.max}</td>
							        <td>${v_values.maxlength}</td>
							        <td>${v_values.mimlength}</td>
							        <td>${v_values.min}</td>
							        <td><input type="checkbox" disabled="disabled" <c:if test="${v_values.multiple}">checked="checked"</c:if>/></td>
							        <td><input type="checkbox" disabled="disabled" <c:if test="${v_values.required}">checked="checked"</c:if>/></td>
							        <td>${v_values.valueList}</td>
					
								<td>${allEnumValueInfoMap[v_values.valueType]}</td>
							
						<td>
						
						<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-edit']}">
					    	<button type="button" class="btn btn-purple btn-xs" id="bt-cfgFixedPropertyField-edit" onclick="bt_cfgFixedPropertyField_edit_click(this,${v_values.fieldId})">
					   		 	<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
					   		</button>		
					   	</c:if>
					   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-edit']}">
					    	<button type="button" class="btn btn-danger btn-xs" id="bt-cfgFixedPropertyField-delete" onclick="bt_cfgFixedPropertyField_delete_click(this,${v_values.fieldId})">
					   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/>
					   		</button>	
					   	</c:if> 
						
						</td>
						
					</tr>
					
				</c:forEach>	
				</tbody>
		</table>							
	</div>
</div>


<script type="text/javascript">
    	function bt_cfgFixedPropertyField_add_click(btt){
    		btt.disabled=true;
			ajaxLoadHtmlInDiv($(btt),"${ctx}/lb/${libraryPath}/cfgFixedPropertyField/add/cfgFixedPropertyDefine/${cfgFixedPropertyDefine.propertyId}/php");    	
    	}
    	function bt_cfgFixedPropertyField_edit_click(btt,pkId){
    		btt.disabled=true;
			ajaxLoadHtmlInDiv($(btt),"${ctx}/lb/${libraryPath}/cfgFixedPropertyField/edit/"+pkId+"/cfgFixedPropertyDefine/${cfgFixedPropertyDefine.propertyId}/php");
    	}
    	function bt_cfgFixedPropertyField_delete_click(btt,pkId){
    		btt.disabled=true;
    		if(confirmDeleteMessage()){
				ajaxLoadHtmlInDiv($(btt),'${ctx}/lb/${libraryPath}/cfgFixedPropertyField/delete/'+pkId+'/cfgFixedPropertyDefine/${cfgFixedPropertyDefine.propertyId}/php');
			}else{
				btt.disabled=false;
			}
    	}
</script>

