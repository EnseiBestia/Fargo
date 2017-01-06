
	


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
		<h2><fmt:message key="authOrgUserList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authOrgUser-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-authOrgUser-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authOrgUser-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-authOrgUser-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="<c:if test="${listFlag!='select1' && listFlag!='select2'}">col-xs-12 col-sm-9 row-list-title-col-search</c:if><c:if test="${listFlag=='select1' || listFlag=='select2'}">col-xs-12 col-sm-12</c:if>" id="search-div-content">
		<form:form commandName="searchValue" id="authOrgUserSearchForm" class="form-inline nopadding">
				
				
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="authOrgUser.email"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['email']}">
		      				<form:input path="combinedConditionValue['email']" id="combinedConditionValue_email"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['email']}">
		      				<form:input path="combinedConditionValue['email']" id="combinedConditionValue_email"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="authOrgUser.fullName"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['fullName']}">
		      				<form:input path="combinedConditionValue['fullName']" id="combinedConditionValue_fullName"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['fullName']}">
		      				<form:input path="combinedConditionValue['fullName']" id="combinedConditionValue_fullName"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
				
				
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="authOrgUser.objectId"/></div>
		      			
			
					           	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="combinedConditionValue_objectId" name="combinedConditionValue['objectId']"
					           		value="${searchValue.combinedConditionValue['objectId']}" formName="DmObjectInfo" multiple="false" 
					           		type="9" cssStyle="width:200px" placeholder="\u5168\u90E8" allowClear="true" />	            	        

					
				            	
						</div>
		  			</div>
				
				
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="authOrgUser.objectModelId"/></div>
		      			
			
					           	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="combinedConditionValue_objectModelId" name="combinedConditionValue['objectModelId']"
					           		value="${searchValue.combinedConditionValue['objectModelId']}" formName="DmObjectModelInfo" multiple="false" 
					           		type="9" cssStyle="width:200px" placeholder="\u5168\u90E8" allowClear="true" />	            	        

					
				            	
						</div>
		  			</div>
				
				
				
				
				
				
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="authOrgUser.phoneNumber"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['phoneNumber']}">
		      				<form:input path="combinedConditionValue['phoneNumber']" id="combinedConditionValue_phoneNumber"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['phoneNumber']}">
		      				<form:input path="combinedConditionValue['phoneNumber']" id="combinedConditionValue_phoneNumber"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="authOrgUser.roleList"/></div>
		      			
			
					           	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="combinedConditionValue_roleList" name="combinedConditionValue['roleList']"
					           		value="${searchValue.combinedConditionValue['roleList']}" formName="AuthAppRole" multiple="false" 
					           		type="9" cssStyle="width:200px" placeholder="\u5168\u90E8" allowClear="true" />	            	        

					
				            	
						</div>
		  			</div>
				
				
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="authOrgUser.userName"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['userName']}">
		      				<form:input path="combinedConditionValue['userName']" id="combinedConditionValue_userName"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['userName']}">
		      				<form:input path="combinedConditionValue['userName']" id="combinedConditionValue_userName"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
			
			<div class="form-group row-list-form-group" >	
			      <button class="btn btn-primary" type="button" id="bt-authOrgUser-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			</div>				
			

		</form:form>
		</div>

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="authOrgUserList.title"/></h5>
		<appfuse:tablePageSizeSetTag formName="authOrgUser" pageSize="${pageSize}"/>
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="authOrgUserList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/authOrgUser/list/${listFlag}/php" id="authOrgUserList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authOrgUser-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='authOrgUserListChkAll' type='checkbox' name='authOrgUserListChkAll' onclick='checkAllOfauthOrgUserList()'"> 
      <input type="checkbox" name="authOrgUserListChecklist" value="${authOrgUserList.userId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="authOrgUserListChecklist" value="${authOrgUserList.userId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authOrgUser-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="authOrgUser.userId">
         	<a href="${ctx}/lb/${libraryPath}/authOrgUser/view/${authOrgUserList.userId}/php">
         		${authOrgUserList.userId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['authOrgUser-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="userId" sortable="false" titleKey="authOrgUser.userId"/>
	</c:if>	
    <display:column sortProperty="createTime" sortable="false" titleKey="authOrgUser.createTime">
         <fmt:formatDate value="${authOrgUserList.createTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="email" sortable="false" titleKey="authOrgUser.email"/>
	    
    
    <display:column sortProperty="enabled" sortable="false" titleKey="authOrgUser.enabled">
        <input type="checkbox" disabled="disabled" <c:if test="${authOrgUserList.enabled}">checked="checked"</c:if>/>
    </display:column>
	    
    
    <display:column property="fullName" sortable="false" titleKey="authOrgUser.fullName"/>
	    
    

	<display:column sortable="false" titleKey="authOrgUser.objectId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="DmObjectInfo" 
			value="${authOrgUserList.objectId}" multiple="false"/>
	</display:column>
	
    <display:column property="objectInstanceId" sortable="false" titleKey="authOrgUser.objectInstanceId"/>
	    
    

	<display:column sortable="false" titleKey="authOrgUser.objectModelId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="DmObjectModelInfo" 
			value="${authOrgUserList.objectModelId}" multiple="false"/>
	</display:column>
	
    <%-- <display:column property="password" sortable="false" titleKey="authOrgUser.password"/>
	    
    
    <display:column property="passwordHint" sortable="false" titleKey="authOrgUser.passwordHint"/> --%>
	    
    
    <display:column property="phoneNumber" sortable="false" titleKey="authOrgUser.phoneNumber"/>
	    
    

	<display:column sortable="false" titleKey="authOrgUser.roleList">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppRole" 
			value="${authOrgUserList.roleList}" multiple="true"/>
	</display:column>
	
    <display:column sortProperty="updateTime" sortable="false" titleKey="authOrgUser.updateTime">
         <fmt:formatDate value="${authOrgUserList.updateTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="userName" sortable="false" titleKey="authOrgUser.userName"/>
	    
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfauthOrgUserList(){
			
		if($("#authOrgUserListChkAll").prop('checked') ==true){
			$("input[name='authOrgUserListChecklist']").prop("checked",true);
		}else{
			$("input[name='authOrgUserListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authOrgUser-add']}">
		$('#bt-authOrgUser-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authOrgUser/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authOrgUser-delete']}">	
    	$('#bt-authOrgUser-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='authOrgUserListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authOrgUser/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-authOrgUser-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authOrgUser/list/${listFlag}/php","post","authOrgUserSearchForm","");
    	});
    	
    	$("#authOrgUserSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

