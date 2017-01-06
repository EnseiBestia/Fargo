
	


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
		<h2><fmt:message key="stTaskInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-stTaskInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-stTaskInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			   	
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-add']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-stTaskInfo-refresh">
			   			<i class="fa fa-refresh"></i> <fmt:message key="button.cache.refresh"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="stTaskInfoSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-stTaskInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="stTaskInfoList.title"/></h5>
		<appfuse:tablePageSizeSetTag formName="stTaskInfo" pageSize="${pageSize}"/>
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="stTaskInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/stTaskInfo/list/${listFlag}/php" id="stTaskInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='stTaskInfoListChkAll' type='checkbox' name='stTaskInfoListChkAll' onclick='checkAllOfstTaskInfoList()'"> 
      <input type="checkbox" name="stTaskInfoListChecklist" value="${stTaskInfoList.taskId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="stTaskInfoListChecklist" value="${stTaskInfoList.taskId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="stTaskInfo.taskId">
         	<a href="${ctx}/lb/${libraryPath}/stTaskInfo/view/${stTaskInfoList.taskId}/php">
         		${stTaskInfoList.taskId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="taskId" sortable="false" titleKey="stTaskInfo.taskId"/>
	</c:if>	

	<display:column sortable="false" titleKey="stTaskInfo.adminServerId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="StAdminServerInfo" 
			value="${stTaskInfoList.adminServerId}" multiple="false"/>
	</display:column>
	
    <display:column sortProperty="createTime" sortable="false" titleKey="stTaskInfo.createTime">
         <fmt:formatDate value="${stTaskInfoList.createTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column sortProperty="doneTime" sortable="false" titleKey="stTaskInfo.doneTime">
         <fmt:formatDate value="${stTaskInfoList.doneTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="executeTimes" sortable="false" titleKey="stTaskInfo.executeTimes"/>
	    
    

	<display:column sortable="false" titleKey="stTaskInfo.formId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="CfgFormInfo" 
			value="${stTaskInfoList.formId}" multiple="false"/>
	</display:column>
	

	<display:column sortable="false" titleKey="stTaskInfo.objectId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="CfgFormInfo" 
			value="${stTaskInfoList.objectId}" multiple="false"/>
	</display:column>
	

	<display:column sortable="false" titleKey="stTaskInfo.reportServerId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="StReportServerInfo" 
			value="${stTaskInfoList.reportServerId}" multiple="false"/>
	</display:column>
	
    <display:column sortProperty="runTime" sortable="false" titleKey="stTaskInfo.runTime">
         <fmt:formatDate value="${stTaskInfoList.runTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="taskDetails" sortable="false" titleKey="stTaskInfo.taskDetails"/>
	    
    
    <display:column property="taskName" sortable="false" titleKey="stTaskInfo.taskName"/>
	    
    
	<display:column sortable="false" titleKey="stTaskInfo.taskServerType">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stTaskInfoList.taskServerType}" multiple="false"/>
		
	</display:column>
	<display:column sortable="false" titleKey="stTaskInfo.taskStatus">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stTaskInfoList.taskStatus}" multiple="false"/>
		
	</display:column>
	<display:column sortable="false" titleKey="stTaskInfo.taskType">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stTaskInfoList.taskType}" multiple="false"/>
		
	</display:column>

	<display:column sortable="false" titleKey="stTaskInfo.user">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppUser" 
			value="${stTaskInfoList.user}" multiple="false"/>
	</display:column>
	

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfstTaskInfoList(){
			
		if($("#stTaskInfoListChkAll").prop('checked') ==true){
			$("input[name='stTaskInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='stTaskInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-add']}">
		$('#bt-stTaskInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stTaskInfo/add/php");
    	});
    </c:if>
    <c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-add']}">
	$('#bt-stTaskInfo-refresh').click(function(){
		$(this).attr('disabled',true)
		ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stTaskInfo/edit/refresh/php");
	});
	</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stTaskInfo-delete']}">	
    	$('#bt-stTaskInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='stTaskInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stTaskInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-stTaskInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stTaskInfo/list/${listFlag}/php","post","stTaskInfoSearchForm","");
    	});
    	
    	$("#stTaskInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

