
	


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
		<h2><fmt:message key="stReportServerInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-stReportServerInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-stReportServerInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="stReportServerInfoSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-stReportServerInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="stReportServerInfoList.title"/></h5>
		<appfuse:tablePageSizeSetTag formName="stReportServerInfo" pageSize="${pageSize}"/>
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="stReportServerInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/stReportServerInfo/list/${listFlag}/php" id="stReportServerInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='stReportServerInfoListChkAll' type='checkbox' name='stReportServerInfoListChkAll' onclick='checkAllOfstReportServerInfoList()'"> 
      <input type="checkbox" name="stReportServerInfoListChecklist" value="${stReportServerInfoList.serverId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="stReportServerInfoListChecklist" value="${stReportServerInfoList.serverId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="stReportServerInfo.serverId">
         	<a href="${ctx}/lb/${libraryPath}/stReportServerInfo/view/${stReportServerInfoList.serverId}/php">
         		${stReportServerInfoList.serverId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="serverId" sortable="false" titleKey="stReportServerInfo.serverId"/>
	</c:if>	
    <display:column sortProperty="createTime" sortable="false" titleKey="stReportServerInfo.createTime">
         <fmt:formatDate value="${stReportServerInfoList.createTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column sortProperty="ifSelected" sortable="false" titleKey="stReportServerInfo.ifSelected">
        <input type="checkbox" disabled="disabled" <c:if test="${stReportServerInfoList.ifSelected}">checked="checked"</c:if>/>
    </display:column>
	    
    
    <display:column sortProperty="lastHeartBeatTime" sortable="false" titleKey="stReportServerInfo.lastHeartBeatTime">
         <fmt:formatDate value="${stReportServerInfoList.lastHeartBeatTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column sortProperty="lastStartUpTime" sortable="false" titleKey="stReportServerInfo.lastStartUpTime">
         <fmt:formatDate value="${stReportServerInfoList.lastStartUpTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="serverName" sortable="false" titleKey="stReportServerInfo.serverName"/>
	    
	<display:column sortable="false"  titleKey="title.operate">
		<div class="btn-group">
			<a class="btn btn-info  btn-sm" href='${ctx}/lb/${libraryPath}/stReportServerInfo/kill/${stReportServerInfoList.serverId}/php' >
	    	<fmt:message key="stReportServerInfoList.kill"/>
		    </a>
		</div>		
	</display:column>
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfstReportServerInfoList(){
			
		if($("#stReportServerInfoListChkAll").prop('checked') ==true){
			$("input[name='stReportServerInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='stReportServerInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-add']}">
		$('#bt-stReportServerInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stReportServerInfo/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stReportServerInfo-delete']}">	
    	$('#bt-stReportServerInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='stReportServerInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stReportServerInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-stReportServerInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stReportServerInfo/list/${listFlag}/php","post","stReportServerInfoSearchForm","");
    	});
    	
    	$("#stReportServerInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

