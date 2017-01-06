

<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgStateMachineButtonList.heading"/></h2>

<div class="widget-box" id="cfgStateMachineButtonListActions">
		<div class="widget-title">
			<span class="icon">
				<i class="fa fa-th"></i>
			</span>
			<h5><fmt:message key="cfgStateMachineButtonList.heading"/></h5>
			<div class="buttons">
					<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-add']}">
				    	<button type="button" class="btn" id="bt-cfgStateMachineButton-add" onclick="bt_cfgStateMachineButton_add_click(this)">
				   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
				   		 </button>	
				   		 				   			
				   	</c:if>
				
			</div>
		</div>
		<div class="widget-content nopadding" style="overflow:auto;">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
							

							    <th><fmt:message key="cfgStateMachineButton.URL"/></th>
							

							    <th><fmt:message key="cfgStateMachineButton.buttonName"/></th>
							
								<th><fmt:message key="cfgStateMachineButton.roleList"/></th>
							
								<th><fmt:message key="cfgStateMachineButton.targetStat"/></th>
							
								<th><fmt:message key="cfgStateMachineButton.viewType"/></th>
							
						
						<th><fmt:message key="title.operate"/></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="v_values" items="${cfgStateMachineValue.buttons}">
					<tr>
							
							        <td>${v_values.URL}</td>
							        <td>${v_values.buttonName}</td>
								<td><appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppRole" 
			value="${v_values.roleList}" multiple="true"/></td>
						
					
								<td><appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${v_values.targetStat}" multiple="false"/></td>
					
								<td><appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${v_values.viewType}" multiple="true"/></td>
							
						<td>
						
						<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-edit']}">
					    	<button type="button" class="btn btn-purple btn-xs" id="bt-cfgStateMachineButton-edit" onclick="bt_cfgStateMachineButton_edit_click(this,${v_values.buttonId})">
					   		 	<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
					   		</button>		
					   	</c:if>
					   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-edit']}">
					    	<button type="button" class="btn btn-danger btn-xs" id="bt-cfgStateMachineButton-delete" onclick="bt_cfgStateMachineButton_delete_click(this,${v_values.buttonId})">
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
    	function bt_cfgStateMachineButton_add_click(btt){
    		btt.disabled=true;
			ajaxLoadHtmlInDiv($(btt),"${ctx}/lb/${libraryPath}/cfgStateMachineButton/add/cfgStateMachineValue/${cfgStateMachineValue.statId}/php");    	
    	}
    	function bt_cfgStateMachineButton_edit_click(btt,pkId){
    		btt.disabled=true;
			ajaxLoadHtmlInDiv($(btt),"${ctx}/lb/${libraryPath}/cfgStateMachineButton/edit/"+pkId+"/cfgStateMachineValue/${cfgStateMachineValue.statId}/php");
    	}
    	function bt_cfgStateMachineButton_delete_click(btt,pkId){
    		btt.disabled=true;
    		if(confirmDeleteMessage()){
				ajaxLoadHtmlInDiv($(btt),'${ctx}/lb/${libraryPath}/cfgStateMachineButton/delete/'+pkId+'/cfgStateMachineValue/${cfgStateMachineValue.statId}/php','post');
			}else{
				btt.disabled=false;
			}
    	}
</script>

