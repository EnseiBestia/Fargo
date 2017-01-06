

<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="authUserLibraryRoleList.heading"/></h2>

<div class="widget-box" id="authUserLibraryRoleListActions">
		<div class="widget-title">
			<span class="icon">
				<i class="fa fa-th"></i>
			</span>
			<h5><fmt:message key="authUserLibraryRoleList.heading"/></h5>
			<div class="buttons">
					<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-add']}">
				    	<button type="button" class="btn" id="bt-authUserLibraryRole-add" onclick="bt_authUserLibraryRole_add_click(this)">
				   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
				   		 </button>	
				   		 				   			
				   	</c:if>
				
			</div>
		</div>
		<div class="widget-content nopadding" style="overflow:auto;">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
							
								<%-- <th><fmt:message key="authUserLibraryRole.adminServerList"/></th> --%>
							

							    <th><fmt:message key="authUserLibraryRole.description"/></th>
							

							    <th><fmt:message key="authUserLibraryRole.ifDefault"/></th>
							
								<th><fmt:message key="authUserLibraryRole.libraryId"/></th>
							
							
								<%-- <th><fmt:message key="authUserLibraryRole.reportServerList"/></th> --%>
							
								<th><fmt:message key="authUserLibraryRole.roleList"/></th>
							
						
						<th><fmt:message key="title.operate"/></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="v_values" items="${authAppUser.libraryRoleList}">
					<tr>
							
								<%-- <td><appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="StAdminServerInfo" 
			value="${v_values.adminServerList}" multiple="true"/></td> --%>
						
							        <td>${v_values.description}</td>
							        <td><input type="checkbox" disabled="disabled" <c:if test="${v_values.ifDefault}">checked="checked"</c:if>/></td>
								<td><appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="LibraryInfo" 
			value="${v_values.libraryId}" multiple="false"/></td>
						
								<%-- <td><appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="StReportServerInfo" 
			value="${v_values.reportServerList}" multiple="true"/></td> --%>
						
								<td><appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppRole" 
			value="${v_values.roleList}" multiple="true"/></td>
						
							
						<td>
						
						<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-edit']}">
					    	<button type="button" class="btn btn-purple btn-xs" id="bt-authUserLibraryRole-edit" onclick="bt_authUserLibraryRole_edit_click(this,'${v_values.libraryRoleId}')">
					   		 	<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
					   		</button>		
					   	</c:if>
					   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-edit']}">
					    	<button type="button" class="btn btn-danger btn-xs" id="bt-authUserLibraryRole-delete" onclick="bt_authUserLibraryRole_delete_click(this,'${v_values.libraryRoleId}')">
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
    	function bt_authUserLibraryRole_add_click(btt){
    		btt.disabled=true;
			ajaxLoadHtmlInDiv($(btt),"${ctx}/lb/${libraryPath}/authUserLibraryRole/add/authAppUser/${authAppUser.userId}/php");    	
    	}
    	function bt_authUserLibraryRole_edit_click(btt,pkId){
    		btt.disabled=true;
			ajaxLoadHtmlInDiv($(btt),"${ctx}/lb/${libraryPath}/authUserLibraryRole/edit/"+pkId+"/authAppUser/${authAppUser.userId}/php");
    	}
    	function bt_authUserLibraryRole_delete_click(btt,pkId){
    		btt.disabled=true;
    		if(confirmDeleteMessage()){
				ajaxLoadHtmlInDiv($(btt),'${ctx}/lb/${libraryPath}/authUserLibraryRole/delete/'+pkId+'/authAppUser/${authAppUser.userId}/php','post');
			}else{
				btt.disabled=false;
			}
    	}
</script>

