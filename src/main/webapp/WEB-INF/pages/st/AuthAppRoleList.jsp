
	


<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>


<div class="row <c:if test="${listFlag!='select1' && listFlag!='select2'}">row-list-title-row</c:if>" >
<c:if test="${listFlag!='select1' && listFlag!='select2'}">
	<div class="col-xs-12 col-sm-4 nopadding" id="search-div-title">
		<h2><fmt:message key="authAppRoleList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppRole-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-authAppRole-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppRole-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-authAppRole-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="authAppRoleSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-authAppRole-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="authAppRoleList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="authAppRoleList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/authAppRole/list/${listFlag}/php" id="authAppRoleList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppRole-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='authAppRoleListChkAll' type='checkbox' name='authAppRoleListChkAll' onclick='checkAllOfauthAppRoleList()'"> 
      <input type="checkbox" name="authAppRoleListChecklist" value="${authAppRoleList.roleId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="authAppRoleListChecklist" value="${authAppRoleList.roleId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppRole-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="authAppRole.roleId">
         	<a href="${ctx}/lb/${libraryPath}/authAppRole/view/${authAppRoleList.roleId}/php">
         		${authAppRoleList.roleId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['authAppRole-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="roleId" sortable="false" titleKey="authAppRole.roleId"/>
	</c:if>	
    <display:column property="description" sortable="false" titleKey="authAppRole.description"/>
	    
    
    <display:column property="roleName" sortable="false" titleKey="authAppRole.roleName"/>
	    
    
<display:column sortable="false"  titleKey="title.operate" headerClass="displaytable-tbody-td-keep-all" class="displaytable-tbody-td-keep-all" >
		<div id="buttGroupTdFor${authAppRoleList.roleId}">
		<appfuse:stateMachine  formName="authAppRole" ctx="${ctx }" libraryPath="${libraryPath}" objectId="${authAppRoleList.roleId}" />
		</div>
	</display:column>
</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfauthAppRoleList(){
			
		if($("#authAppRoleListChkAll").prop('checked') ==true){
			$("input[name='authAppRoleListChecklist']").prop("checked",true);
		}else{
			$("input[name='authAppRoleListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppRole-add']}">
		$('#bt-authAppRole-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppRole/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppRole-delete']}">	
    	$('#bt-authAppRole-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='authAppRoleListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppRole/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-authAppRole-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppRole/list/${listFlag}/php","post","authAppRoleSearchForm","");
    	});
    	
    	$("#authAppRoleSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		if($("#search-div-title").height()<$("#search-div-content").height()){
			$("#search-div-title").css("height",$("#search-div-content").height());
		}
		</c:if>	
	});
</script>

