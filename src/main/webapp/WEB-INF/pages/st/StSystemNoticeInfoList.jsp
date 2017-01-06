
	


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
		<h2><fmt:message key="stSystemNoticeInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-stSystemNoticeInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-stSystemNoticeInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="<c:if test="${listFlag!='select1' && listFlag!='select2'}">col-xs-12 col-sm-9 row-list-title-col-search</c:if><c:if test="${listFlag=='select1' || listFlag=='select2'}">col-xs-12 col-sm-12</c:if>" id="search-div-content">
		<form:form commandName="searchValue" id="stSystemNoticeInfoSearchForm" class="form-inline nopadding">
				
				
				
				
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="stSystemNoticeInfo.noticeLevel"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_noticeLevel" name="combinedConditionValue['noticeLevel']" value="${searchValue.combinedConditionValue['noticeLevel']}" 
				            		enumCode="BU" multiple="true" type="1" cssStyle="width:500px"/>
					
				            	
						</div>
		  			</div>
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="stSystemNoticeInfo.noticeName"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['noticeName']}">
		      				<form:input path="combinedConditionValue['noticeName']" id="combinedConditionValue_noticeName"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['noticeName']}">
		      				<form:input path="combinedConditionValue['noticeName']" id="combinedConditionValue_noticeName"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="stSystemNoticeInfo.noticeType"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_noticeType" name="combinedConditionValue['noticeType']" value="${searchValue.combinedConditionValue['noticeType']}" 
				            		enumCode="BT" multiple="true" type="1" cssStyle="width:500px"/>
					
				            	
						</div>
		  			</div>
				
				
				
				
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="stSystemNoticeInfo.status"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_status" name="combinedConditionValue['status']" value="${searchValue.combinedConditionValue['status']}" 
				            		enumCode="BV" multiple="true" type="1" cssStyle="width:500px"/>
					
				            	
						</div>
		  			</div>
				
				
				
				
			
			<div class="form-group row-list-form-group" >	
			      <button class="btn btn-primary" type="button" id="bt-stSystemNoticeInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			</div>				
			

		</form:form>
		</div>

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="stSystemNoticeInfoList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="stSystemNoticeInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/stSystemNoticeInfo/list/${listFlag}/php" id="stSystemNoticeInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='stSystemNoticeInfoListChkAll' type='checkbox' name='stSystemNoticeInfoListChkAll' onclick='checkAllOfstSystemNoticeInfoList()'"> 
      <input type="checkbox" name="stSystemNoticeInfoListChecklist" value="${stSystemNoticeInfoList.noticeId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="stSystemNoticeInfoListChecklist" value="${stSystemNoticeInfoList.noticeId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="stSystemNoticeInfo.noticeId">
         	<a href="${ctx}/lb/${libraryPath}/stSystemNoticeInfo/view/${stSystemNoticeInfoList.noticeId}/php">
         		${stSystemNoticeInfoList.noticeId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="noticeId" sortable="false" titleKey="stSystemNoticeInfo.noticeId"/>
	</c:if>	
    <display:column sortProperty="createTime" sortable="false" titleKey="stSystemNoticeInfo.createTime">
         <fmt:formatDate value="${stSystemNoticeInfoList.createTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
	<display:column sortable="false" titleKey="stSystemNoticeInfo.noticeLevel">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stSystemNoticeInfoList.noticeLevel}" multiple="false"/>
		
	</display:column>
    <display:column property="noticeName" sortable="false" titleKey="stSystemNoticeInfo.noticeName"/>
	    
    
    <display:column property="noticeText" sortable="false" titleKey="stSystemNoticeInfo.noticeText"/>
	    
    
	<display:column sortable="false" titleKey="stSystemNoticeInfo.noticeType">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stSystemNoticeInfoList.noticeType}" multiple="false"/>
		
	</display:column>

	<display:column sortable="false" titleKey="stSystemNoticeInfo.roleList">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppRole" 
			value="${stSystemNoticeInfoList.roleList}" multiple="true"/>
	</display:column>
	
	<display:column sortable="false" titleKey="stSystemNoticeInfo.status">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stSystemNoticeInfoList.status}" multiple="false"/>
		
	</display:column>

	<display:column sortable="false" titleKey="stSystemNoticeInfo.userList">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppUser" 
			value="${stSystemNoticeInfoList.userList}" multiple="true"/>
	</display:column>
	

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfstSystemNoticeInfoList(){
			
		if($("#stSystemNoticeInfoListChkAll").prop('checked') ==true){
			$("input[name='stSystemNoticeInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='stSystemNoticeInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-add']}">
		$('#bt-stSystemNoticeInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stSystemNoticeInfo/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stSystemNoticeInfo-delete']}">	
    	$('#bt-stSystemNoticeInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='stSystemNoticeInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stSystemNoticeInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-stSystemNoticeInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stSystemNoticeInfo/list/${listFlag}/php","post","stSystemNoticeInfoSearchForm","");
    	});
    	
    	$("#stSystemNoticeInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
					
						$("#combinedConditionValue_noticeLevel").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
					
						$("#combinedConditionValue_noticeType").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
					
						$("#combinedConditionValue_status").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
			
	});
</script>

