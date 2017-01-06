
	


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
		<h2><fmt:message key="authShortCutPrivilegeList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-authShortCutPrivilege-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-authShortCutPrivilege-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="authShortCutPrivilegeSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-authShortCutPrivilege-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="authShortCutPrivilegeList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="authShortCutPrivilegeList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/authShortCutPrivilege/list/${listFlag}/php" id="authShortCutPrivilegeList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='authShortCutPrivilegeListChkAll' type='checkbox' name='authShortCutPrivilegeListChkAll' onclick='checkAllOfauthShortCutPrivilegeList()'"> 
      <input type="checkbox" name="authShortCutPrivilegeListChecklist" value="${authShortCutPrivilegeList.shortCutId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="authShortCutPrivilegeListChecklist" value="${authShortCutPrivilegeList.shortCutId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="authShortCutPrivilege.shortCutId">
         	<a href="${ctx}/lb/${libraryPath}/authShortCutPrivilege/view/${authShortCutPrivilegeList.shortCutId}/php">
         		${authShortCutPrivilegeList.shortCutId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="shortCutId" sortable="false" titleKey="authShortCutPrivilege.shortCutId"/>
	</c:if>	
    <display:column property="icon" sortable="false" titleKey="authShortCutPrivilege.icon"/>
	    
    
    <display:column property="order" sortable="false" titleKey="authShortCutPrivilege.order"/>
	    
    <display:column sortable="false" titleKey="authShortCutPrivilege.roleList">
	<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppRole" 
			value="${authShortCutPrivilegeList.roleList}" multiple="true"/></td>
	</display:column>		
			
	
	<display:column sortable="false" titleKey="authShortCutPrivilege.privilegeId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthPrivilegeInfo" 
			value="${authShortCutPrivilegeList.privilegeId}" multiple="false"/>
	</display:column>
	
    <display:column property="shortCutName" sortable="false" titleKey="authShortCutPrivilege.shortCutName"/>
	    
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfauthShortCutPrivilegeList(){
			
		if($("#authShortCutPrivilegeListChkAll").prop('checked') ==true){
			$("input[name='authShortCutPrivilegeListChecklist']").prop("checked",true);
		}else{
			$("input[name='authShortCutPrivilegeListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-add']}">
		$('#bt-authShortCutPrivilege-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authShortCutPrivilege/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authShortCutPrivilege-delete']}">	
    	$('#bt-authShortCutPrivilege-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='authShortCutPrivilegeListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authShortCutPrivilege/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-authShortCutPrivilege-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authShortCutPrivilege/list/${listFlag}/php","post","authShortCutPrivilegeSearchForm","");
    	});
    	
    	$("#authShortCutPrivilegeSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

