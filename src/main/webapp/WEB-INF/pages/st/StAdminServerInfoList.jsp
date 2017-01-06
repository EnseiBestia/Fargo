
	


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
		<h2><fmt:message key="stAdminServerInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-stAdminServerInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-stAdminServerInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="stAdminServerInfoSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-stAdminServerInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="stAdminServerInfoList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="stAdminServerInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/stAdminServerInfo/list/${listFlag}/php" id="stAdminServerInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='stAdminServerInfoListChkAll' type='checkbox' name='stAdminServerInfoListChkAll' onclick='checkAllOfstAdminServerInfoList()'"> 
      <input type="checkbox" name="stAdminServerInfoListChecklist" value="${stAdminServerInfoList.serverId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="stAdminServerInfoListChecklist" value="${stAdminServerInfoList.serverId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="stAdminServerInfo.serverId">
         	<a href="${ctx}/lb/${libraryPath}/stAdminServerInfo/view/${stAdminServerInfoList.serverId}/php">
         		${stAdminServerInfoList.serverId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="serverId" sortable="false" titleKey="stAdminServerInfo.serverId"/>
	</c:if>	
    <display:column sortProperty="createTime" sortable="false" titleKey="stAdminServerInfo.createTime">
         <fmt:formatDate value="${stAdminServerInfoList.createTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column sortProperty="ifSelected" sortable="false" titleKey="stAdminServerInfo.ifSelected">
        <input type="checkbox" disabled="disabled" <c:if test="${stAdminServerInfoList.ifSelected}">checked="checked"</c:if>/>
    </display:column>
	    
    
    <display:column sortProperty="lastHeartBeatTime" sortable="false" titleKey="stAdminServerInfo.lastHeartBeatTime">
         <fmt:formatDate value="${stAdminServerInfoList.lastHeartBeatTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column sortProperty="lastStartUpTime" sortable="false" titleKey="stAdminServerInfo.lastStartUpTime">
         <fmt:formatDate value="${stAdminServerInfoList.lastStartUpTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column property="serverName" sortable="false" titleKey="stAdminServerInfo.serverName"/>
	    
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfstAdminServerInfoList(){
			
		if($("#stAdminServerInfoListChkAll").prop('checked') ==true){
			$("input[name='stAdminServerInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='stAdminServerInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-add']}">
		$('#bt-stAdminServerInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stAdminServerInfo/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stAdminServerInfo-delete']}">	
    	$('#bt-stAdminServerInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='stAdminServerInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stAdminServerInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-stAdminServerInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stAdminServerInfo/list/${listFlag}/php","post","stAdminServerInfoSearchForm","");
    	});
    	
    	$("#stAdminServerInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		if($("#search-div-title").height()<$("#search-div-content").height()){
			$("#search-div-title").css("height",$("#search-div-content").height());
		}
		</c:if>	
	});
</script>

