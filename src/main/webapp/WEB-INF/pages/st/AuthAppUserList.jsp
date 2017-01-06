
	


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
		<h2><fmt:message key="authAppUserList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-authAppUser-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-authAppUser-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="authAppUserSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-authAppUser-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="authAppUserList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="authAppUserList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/authAppUser/list/${listFlag}/php" id="authAppUserList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='authAppUserListChkAll' type='checkbox' name='authAppUserListChkAll' onclick='checkAllOfauthAppUserList()'"> 
      <input type="checkbox" name="authAppUserListChecklist" value="${authAppUserList.userId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="authAppUserListChecklist" value="${authAppUserList.userId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="authAppUser.userId">
         	<a href="${ctx}/lb/${libraryPath}/authAppUser/view/${authAppUserList.userId}/php">
         		${authAppUserList.userId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['authAppUser-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="userId" sortable="false" titleKey="authAppUser.userId"/>
	</c:if>	
    <display:column sortProperty="createTime" sortable="false" titleKey="authAppUser.createTime">
         <fmt:formatDate value="${authAppUserList.createTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="email" sortable="false" titleKey="authAppUser.email"/>
	    
    
    <display:column sortProperty="enabled" sortable="false" titleKey="authAppUser.enabled">
        <input type="checkbox" disabled="disabled" <c:if test="${authAppUserList.enabled}">checked="checked"</c:if>/>
    </display:column>
	    
    
    <display:column property="fullName" sortable="false" titleKey="authAppUser.fullName"/>
	    
    
    <%-- <display:column property="password" sortable="false" titleKey="authAppUser.password"/>
	    
    
    <display:column property="passwordHint" sortable="false" titleKey="authAppUser.passwordHint"/> --%>
	    
    
    <display:column property="phoneNumber" sortable="false" titleKey="authAppUser.phoneNumber"/>
	    
    

	<%-- <display:column property="roleList" sortable="false" titleKey="authAppUser.roleList"/> --%>
    <display:column sortProperty="updateTime" sortable="false" titleKey="authAppUser.updateTime">
         <fmt:formatDate value="${authAppUserList.updateTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="userName" sortable="false" titleKey="authAppUser.userName"/>
	    
    <display:column sortable="false"  titleKey="title.operate">
		
		<div class="btn-group">
			<a class="btn btn-info  btn-sm" href='<c:url value="/lb/${libraryPath}/authAppUser/edit/resetPassword/${authAppUserList.userId }/php"/>' >
	    		<fmt:message key="user.resetPassword"/>
	    	</a>
		</div>
		
			
	</display:column>

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfauthAppUserList(){
			
		if($("#authAppUserListChkAll").prop('checked') ==true){
			$("input[name='authAppUserListChecklist']").prop("checked",true);
		}else{
			$("input[name='authAppUserListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-add']}">
		$('#bt-authAppUser-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppUser/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authAppUser-delete']}">	
    	$('#bt-authAppUser-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='authAppUserListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppUser/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-authAppUser-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppUser/list/${listFlag}/php","post","authAppUserSearchForm","");
    	});
    	
    	$("#authAppUserSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		if($("#search-div-title").height()<$("#search-div-content").height()){
			$("#search-div-title").css("height",$("#search-div-content").height());
		}
		</c:if>	
	});
</script>

