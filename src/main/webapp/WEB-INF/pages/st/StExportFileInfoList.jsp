
	


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
		<h2><fmt:message key="stExportFileInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<%-- <c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stExportFileInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-stExportFileInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stExportFileInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-stExportFileInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if> --%>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="<c:if test="${listFlag!='select1' && listFlag!='select2'}">col-xs-12 col-sm-9 row-list-title-col-search</c:if><c:if test="${listFlag=='select1' || listFlag=='select2'}">col-xs-12 col-sm-12</c:if>" id="search-div-content">
		<form:form commandName="searchValue" id="stExportFileInfoSearchForm" class="form-inline nopadding">
				
				
				
				
				
				
				
				
				
				
				
				
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="stExportFileInfo.status"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_status" name="combinedConditionValue['status']" value="${searchValue.combinedConditionValue['status']}" 
				            		enumCode="CE" multiple="true" type="1" cssStyle="width:500px"/>
					
				            	
						</div>
		  			</div>
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="stExportFileInfo.type"/></div>
		      			
								<appfuse:lookupSelect2 cssClass="form-control" libraryPath="${libraryPath}" id="combinedConditionValue_type" name="combinedConditionValue['type']" value="${searchValue.combinedConditionValue['type']}" 
				            		enumCode="CD" multiple="true" type="1" cssStyle="width:500px"/>
					
				            	
						</div>
		  			</div>
				
				
			
			<div class="form-group row-list-form-group" >	
			      <button class="btn btn-primary" type="button" id="bt-stExportFileInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			</div>				
			

		</form:form>
		</div>

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="stExportFileInfoList.title"/></h5>
		<appfuse:tablePageSizeSetTag formName="stExportFileInfo" pageSize="${pageSize}"/>
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="stExportFileInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/stExportFileInfo/list/${listFlag}/php" id="stExportFileInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">

        <display:column sortable="false"         titleKey="stExportFileInfo.exportId">
         	
         		${stExportFileInfoList.exportId}
        </display:column>
         

	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['stExportFileInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="exportId" sortable="false" titleKey="stExportFileInfo.exportId"/>
	</c:if>	
    <display:column sortProperty="createTime" sortable="false" titleKey="stExportFileInfo.createTime">
         <fmt:formatDate value="${stExportFileInfoList.createTime}" pattern="${datePattern}"/>
    </display:column>
	    
    
    <display:column sortable="false" titleKey="stExportFileInfo.type">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stExportFileInfoList.type}" multiple="false"/>
		
	</display:column>
	    
    
    <display:column property="exportName" sortable="false" titleKey="stExportFileInfo.exportName"/>
	    
    
    <display:column sortProperty="ifZip" sortable="false" titleKey="stExportFileInfo.ifZip">
        <input type="checkbox" disabled="disabled" <c:if test="${stExportFileInfoList.ifZip}">checked="checked"</c:if>/>
    </display:column>
	    
    
	<display:column sortable="false" titleKey="stExportFileInfo.status">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${stExportFileInfoList.status}" multiple="false"/>
		
	</display:column>
	

	<display:column property="process" sortable="false" titleKey="stExportFileInfo.process"/>
	<display:column  sortable="false" titleKey="title.operate">
		<c:if test="${stExportFileInfoList.status=='CEC'}">
			<a class="btn btn-warning  btn-sm btn_a_click" href='${stExportFileInfoList.downloadUrl }'  target="_blank" >
            		<i class="fa fa-unlink"></i> <fmt:message key="button.download"/></a>
        </c:if>    
	</display:column>

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfstExportFileInfoList(){
			
		if($("#stExportFileInfoListChkAll").prop('checked') ==true){
			$("input[name='stExportFileInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='stExportFileInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stExportFileInfo-add']}">
		$('#bt-stExportFileInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stExportFileInfo/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['stExportFileInfo-delete']}">	
    	$('#bt-stExportFileInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='stExportFileInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stExportFileInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-stExportFileInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/stExportFileInfo/list/${listFlag}/php","post","stExportFileInfoSearchForm","");
    	});
    	
    	$("#stExportFileInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
					
						$("#combinedConditionValue_status").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
					
						$("#combinedConditionValue_type").on("change", function(e) { 
							
							reInitTitleDivHeight("search-div-title","search-div-content");
							
							
						})
			
	});
</script>

