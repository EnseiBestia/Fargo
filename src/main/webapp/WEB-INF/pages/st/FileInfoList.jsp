
	


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
		<h2><fmt:message key="fileInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['fileInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-fileInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['fileInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-fileInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="<c:if test="${listFlag!='select1' && listFlag!='select2'}">col-xs-12 col-sm-9 row-list-title-col-search</c:if><c:if test="${listFlag=='select1' || listFlag=='select2'}">col-xs-12 col-sm-12</c:if>" id="search-div-content">
		<form:form commandName="searchValue" id="fileInfoSearchForm" class="form-inline nopadding">
				
				
				
				
				
				
				
				
				
				
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="fileInfo.fileName"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['fileName']}">
		      				<form:input path="combinedConditionValue['fileName']" id="combinedConditionValue_fileName"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['fileName']}">
		      				<form:input path="combinedConditionValue['fileName']" id="combinedConditionValue_fileName"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
				
				
				
				
			
			<div class="form-group row-list-form-group" >	
			      <button class="btn btn-primary" type="button" id="bt-fileInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			</div>				
			

		</form:form>
		</div>

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="fileInfoList.title"/></h5>
		<appfuse:tablePageSizeSetTag formName="fileInfo" pageSize="${pageSize}"/>
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="fileInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/fileInfo/list/${listFlag}/php" id="fileInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['fileInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='fileInfoListChkAll' type='checkbox' name='fileInfoListChkAll' onclick='checkAllOffileInfoList()'"> 
      <input type="checkbox" name="fileInfoListChecklist" value="${fileInfoList.id}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="fileInfoListChecklist" value="${fileInfoList.id}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['fileInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="fileInfo.id">
         	<a href="${ctx}/lb/${libraryPath}/fileInfo/view/${fileInfoList.id}/php">
         		${fileInfoList.id}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['fileInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="id" sortable="false" titleKey="fileInfo.id"/>
	</c:if>	
    <display:column property="absoluteLocation" sortable="false" titleKey="fileInfo.absoluteLocation" maxLength="10"/>
	    
    
    <display:column property="contentType" sortable="false" titleKey="fileInfo.contentType" />	    
    
    <display:column sortable="false" titleKey="fileInfo.downloadUrl" maxLength="25">
    	<a href="${ fileInfoList.downloadUrl}" target="_ablank" class="btn_a_click">
         		${ fileInfoList.downloadUrl}</a>
    </display:column>
	    	    
    
    <display:column property="fileName" sortable="false" titleKey="fileInfo.fileName" />
	    
    
    <display:column property="key" sortable="false" titleKey="fileInfo.key" maxLength="10"/>
	    
    
    <display:column property="size" sortable="false" titleKey="fileInfo.size" />
	    
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOffileInfoList(){
			
		if($("#fileInfoListChkAll").prop('checked') ==true){
			$("input[name='fileInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='fileInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['fileInfo-add']}">
		$('#bt-fileInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/fileInfo/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['fileInfo-delete']}">	
    	$('#bt-fileInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='fileInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/fileInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-fileInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/fileInfo/list/${listFlag}/php","post","fileInfoSearchForm","");
    	});
    	
    	$("#fileInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

