

<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgEnumValueInfoList.heading"/></h2>

<div class="widget-box" id="cfgEnumValueInfoListActions">
		<div class="widget-title">
			<span class="icon">
				<i class="fa fa-th"></i>
			</span>
			<h5><fmt:message key="cfgEnumValueInfoList.heading"/></h5>
			<div class="buttons">
					<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-add']}">
				    	<button type="button" class="btn" id="bt-cfgEnumValueInfo-add" onclick="bt_cfgEnumValueInfo_add_click(this)">
				   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
				   		 </button>	
				   		 				   			
				   	</c:if>
				
			</div>
		</div>
		<div class="widget-content nopadding" style="overflow:auto;">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
							

							    <th><fmt:message key="cfgEnumValueInfo.code"/></th>
							

							    <th><fmt:message key="cfgEnumValueInfo.constantName"/></th>
							

							    <th><fmt:message key="cfgEnumValueInfo.value"/></th>
							
						
						<th><fmt:message key="title.operate"/></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="v_values" items="${cfgEnumInfo.values}">
					<tr>
							
							        <td>${v_values.code}</td>
							        <td>${v_values.constantName}</td>
							        <td>${v_values.value}</td>
							
						<td>
						
						<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-edit']}">
					    	<button type="button" class="btn btn-purple btn-xs" id="bt-cfgEnumValueInfo-edit" onclick="bt_cfgEnumValueInfo_edit_click(this,'${v_values.enumValueId}')">
					   		 	<i class="fa fa-edit"></i> <fmt:message key="button.edit"/>
					   		</button>		
					   	</c:if>
					   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-edit']}">
					    	<button type="button" class="btn btn-danger btn-xs" id="bt-cfgEnumValueInfo-delete" onclick="bt_cfgEnumValueInfo_delete_click(this,'${v_values.enumValueId}')">
					   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/>
					   		</button>	
					   	</c:if> 
						<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-edit']}">
					    	<button type="button" class="btn btn-dark-green btn-xs" id="bt-cfgEnumValueInfo-up" onclick="bt_cfgEnumValueInfo_move_click(this,'${v_values.enumValueId}',0)">
					   			<i class="fa fa-arrow-up"></i> <fmt:message key="button.up"/>
					   		</button>	
					   	</c:if>
					   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-edit']}">
					    	<button type="button" class="btn btn-dark-green btn-xs" id="bt-cfgEnumValueInfo-down" onclick="bt_cfgEnumValueInfo_move_click(this,'${v_values.enumValueId}',1)">
					   			<i class="fa fa-arrow-down"></i> <fmt:message key="button.down"/>
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
    	function bt_cfgEnumValueInfo_add_click(btt){
    		btt.disabled=true;
			containerLoadUrlUseAjaxInDiv("cfgEnumValueInfoListActions","${ctx}/lb/${libraryPath}/cfgEnumValueInfo/add/cfgEnumInfo/${cfgEnumInfo.enumId}/php");    	
    	}
    	function bt_cfgEnumValueInfo_edit_click(btt,pkId){
    		btt.disabled=true;
			containerLoadUrlUseAjaxInDiv("cfgEnumValueInfoListActions","${ctx}/lb/${libraryPath}/cfgEnumValueInfo/edit/"+pkId+"/cfgEnumInfo/${cfgEnumInfo.enumId}/php");
    	}
    	function bt_cfgEnumValueInfo_delete_click(btt,pkId){
    		btt.disabled=true;
    		if(confirmDeleteMessage()){
				containerLoadUrlUseAjaxPostInDiv('cfgEnumValueInfoListActions','${ctx}/lb/${libraryPath}/cfgEnumValueInfo/delete/'+pkId+'/cfgEnumInfo/${cfgEnumInfo.enumId}/php','post');
			}else{
				btt.disabled=false;
			}
    	}
    	function bt_cfgEnumValueInfo_move_click(btt,pkId,type){
    		btt.disabled=true;
    		//if(confirmDeleteMessage()){
			containerLoadUrlUseAjaxPostInDiv('cfgEnumValueInfoListActions','${ctx}/lb/${libraryPath}/cfgEnumValueInfo/edit/move/'+pkId+'/'+type+'/cfgEnumInfo/${cfgEnumInfo.enumId}/php','post');
			//}else{
			btt.disabled=false;
			//}
    	}
</script>

