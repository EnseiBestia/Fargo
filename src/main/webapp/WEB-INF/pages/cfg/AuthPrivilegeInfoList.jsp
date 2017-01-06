
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
	<div class="col-xs-12 col-sm-3 nopadding" id="search-div-title">
		<h2><fmt:message key="authPrivilegeInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-authPrivilegeInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-authPrivilegeInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="<c:if test="${listFlag!='select1' && listFlag!='select2'}">col-xs-12 col-sm-9 row-list-title-col-search</c:if><c:if test="${listFlag=='select1' || listFlag=='select2'}">col-xs-12 col-sm-12</c:if>" id="search-div-content">
		<form:form commandName="searchValue" id="authPrivilegeInfoSearchForm" class="form-inline nopadding">
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="authPrivilegeInfo.operateName"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_operateName" name="combinedConditionValue['operateName']" value="${searchValue.combinedConditionValue['operateName']}" 
				            		enumCode="AZ" multiple="true" type="1" cssStyle="width:200px"/>
						</div>
		  			</div>
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="authPrivilegeInfo.operatorRequestType"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_operatorRequestType" name="combinedConditionValue['operatorRequestType']" value="${searchValue.combinedConditionValue['operatorRequestType']}" 
				            		enumCode="BQ" multiple="true" type="1" cssStyle="width:200px"/>
						</div>
		  			</div>
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="authPrivilegeInfo.privilegeName"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['privilegeName']}">
		      				<form:input path="combinedConditionValue['privilegeName']" id="combinedConditionValue_privilegeName"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['privilegeName']}">
		      				<form:input path="combinedConditionValue['privilegeName']" id="combinedConditionValue_privilegeName"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="authPrivilegeInfo.privilegeType"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_privilegeType" name="combinedConditionValue['privilegeType']" value="${searchValue.combinedConditionValue['privilegeType']}" 
				            		enumCode="AW" multiple="true" type="1" cssStyle="width:200px"/>
						</div>
		  			</div>
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="authPrivilegeInfo.taskType"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_taskType" name="combinedConditionValue['taskType']" value="${searchValue.combinedConditionValue['taskType']}" 
				            		enumCode="BF" multiple="true" type="1" cssStyle="width:200px"/>
						</div>
		  			</div>
			
			<div class="form-group row-list-form-group" >	
			      <button class="btn btn-primary" type="button" id="bt-authPrivilegeInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			</div>				
			

		</form:form>
		</div>
</div>           



<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<div id="breadcrumb" style="border-top:0px;border-bottom:0px;background-color:#FAFAFA">
		<a href="${ctx}/lb/${libraryPath}/authPrivilegeInfo/list/authPrivilegeInfo/0/${listFlag}/php" class="tip-bottom"><fmt:message key="title.a.root"/> </a>
		<c:forEach var="v_authPrivilegeInfo" items="${parentsList}">
			<a href="${ctx}/lb/${libraryPath}/authPrivilegeInfo/list/authPrivilegeInfo/${v_authPrivilegeInfo.privilegeId}/${listFlag}/php" class="current">${v_authPrivilegeInfo.privilegeName} </a>
		</c:forEach>
		</div>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="authPrivilegeInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/authPrivilegeInfo/list/authPrivilegeInfo/${parentId}/${listFlag}/php" id="authPrivilegeInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='authPrivilegeInfoListChkAll' type='checkbox' name='authPrivilegeInfoListChkAll' onclick='checkAllOfauthPrivilegeInfoList()'"> 
      <input type="checkbox" name="authPrivilegeInfoListChecklist" value="${authPrivilegeInfoList.privilegeId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="authPrivilegeInfoListChecklist" value="${authPrivilegeInfoList.privilegeId}"/> 
    </display:column>

</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="authPrivilegeInfo.privilegeId">
         	<a href="${ctx}/lb/${libraryPath}/authPrivilegeInfo/view/${authPrivilegeInfoList.privilegeId}/authPrivilegeInfo/${authPrivilegeInfoList.parent}/php">
         		${authPrivilegeInfoList.privilegeId}</a>
        </display:column>
         
	</c:if>
	
	
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="privilegeId" sortable="false" titleKey="authPrivilegeInfo.privilegeId"/>
	</c:if>	
	
	
	<display:column sortable="false" titleKey="authPrivilegeInfo.formId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="CfgFormInfo" 
			value="${authPrivilegeInfoList.formId}" multiple="false"/>
	</display:column>
	
	<display:column sortable="false" titleKey="authPrivilegeInfo.operateName">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${authPrivilegeInfoList.operateName}" multiple="false"/>
		
	</display:column>
	
	
	<display:column property="privilegeName" sortable="false" titleKey="authPrivilegeInfo.privilegeName"/>
	
	
	<display:column sortable="false" titleKey="authPrivilegeInfo.privilegeType">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${authPrivilegeInfoList.privilegeType}" multiple="false"/>
		
	</display:column>

	
	<display:column sortable="false" titleKey="authPrivilegeInfo.taskType">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${authPrivilegeInfoList.taskType}" multiple="false"/>
		
	</display:column>
	
	<display:column property="url" sortable="false" titleKey="authPrivilegeInfo.url" maxLength="25"/>
    <display:column sortProperty="ifButtonGroup" sortable="false" titleKey="authPrivilegeInfo.ifButtonGroup">
        <input type="checkbox" disabled="disabled" <c:if test="${authPrivilegeInfoList.ifButtonGroup}">checked="checked"</c:if>/>
    </display:column>
	    
    
    <%-- <display:column property="javaScriptFunction" sortable="false" titleKey="authPrivilegeInfo.javaScriptFunction"/> --%>
	    
    

	<display:column sortable="false" titleKey="authPrivilegeInfo.machineId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="CfgStateMachineDefine" 
			value="${authPrivilegeInfoList.machineId}" multiple="false"/>
	</display:column>
	
	
    
	    
    
	
	
    
	    
    <%-- <display:column sortable="false" titleKey="authPrivilegeInfo.enumCodeList">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${authPrivilegeInfoList.enumCodeList}" multiple="true"/>
		
	</display:column>
 --%>


	<%-- <display:column sortable="false" titleKey="authPrivilegeInfo.operatorRequestType">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${authPrivilegeInfoList.operatorRequestType}" multiple="false"/>
		
	</display:column> --%>
<display:column sortable="false"  titleKey="title.operate">
	<%-- <a href="${ctx}/lb/${libraryPath}/authPrivilegeInfo/list/authPrivilegeInfo/${authPrivilegeInfoList.privilegeId}/${listFlag}/php">
    	<fmt:message key="button.listChild"/>
    </a>	 --%>
    
    <div class="btn-group" id="authPrivilegeInfoListActions">
			<a class="btn btn-dark-green  btn-xs" href="${ctx}/lb/${libraryPath}/authPrivilegeInfo/list/authPrivilegeInfo/${authPrivilegeInfoList.privilegeId}/${listFlag}/php">
    			<fmt:message key="button.listChild"/>
    		</a>
    		<button type="button " class="btn btn-dark-green btn-xs" id="bt-authPrivilegeInfo-up" onclick="bt_authPrivilegeInfo_move_click(this,${authPrivilegeInfoList.privilegeId},0)">
		   			<i class="fa fa-arrow-up"></i> <fmt:message key="button.up"/>
		   		</button>	
			<button type="button" class="btn btn-dark-green btn-xs" id="bt-authPrivilegeInfo-down" onclick="bt_authPrivilegeInfo_move_click(this,${authPrivilegeInfoList.privilegeId},1)">
	   			<i class="fa fa-arrow-down"></i> <fmt:message key="button.down"/>
	   		</button>			
	</div>
</display:column>
</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfauthPrivilegeInfoList(){
			
		if($("#authPrivilegeInfoListChkAll").prop('checked') ==true){
			$("input[name='authPrivilegeInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='authPrivilegeInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-add']}">
		$('#bt-authPrivilegeInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authPrivilegeInfo/add/authPrivilegeInfo/${parentId}/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['authPrivilegeInfo-delete']}">	
    	$('#bt-authPrivilegeInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='authPrivilegeInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authPrivilegeInfo/delete/"+selstrs+"/authPrivilegeInfo/${parentId}/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-authPrivilegeInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authPrivilegeInfo/list/authPrivilegeInfo/${parentId}/${listFlag}/php","post","authPrivilegeInfoSearchForm","");
    	});
    	
		$("#authPrivilegeInfoSearchForm .form-input-init-null").attr("value","");  		
		
		<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
					
						$("#combinedConditionValue_operateName").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
					
						$("#combinedConditionValue_operatorRequestType").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
					
						$("#combinedConditionValue_privilegeType").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
					
						$("#combinedConditionValue_taskType").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
						
		
	});
	function bt_authPrivilegeInfo_move_click(btt,pkId,type){
		btt.disabled=true;
		//if(confirmDeleteMessage()){
		containerLoadUrlUseAjaxPostInDiv('authPrivilegeInfoListActions','${ctx}/lb/${libraryPath}/authPrivilegeInfo/edit/move/'+pkId+'/'+type+'/authPrivilegeInfo/${parentId}/php','post');
		//}else{
		btt.disabled=false;
		//}
	}
</script>

