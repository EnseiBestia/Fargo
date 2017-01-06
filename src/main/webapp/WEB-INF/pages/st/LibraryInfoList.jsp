
	


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
		<h2><fmt:message key="libraryInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['libraryInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-libraryInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['libraryInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-libraryInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="libraryInfoSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-libraryInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="libraryInfoList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="libraryInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/libraryInfo/list/${listFlag}/php" id="libraryInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['libraryInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='libraryInfoListChkAll' type='checkbox' name='libraryInfoListChkAll' onclick='checkAllOflibraryInfoList()'"> 
      <input type="checkbox" name="libraryInfoListChecklist" value="${libraryInfoList.libraryId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="libraryInfoListChecklist" value="${libraryInfoList.libraryId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['libraryInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="libraryInfo.libraryId">
         	<a href="${ctx}/lb/${libraryPath}/libraryInfo/view/${libraryInfoList.libraryId}/php">
         		${libraryInfoList.libraryId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['libraryInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="libraryId" sortable="false" titleKey="libraryInfo.libraryId"/>
	</c:if>	
    <display:column property="identification" sortable="false" titleKey="libraryInfo.identification"/>
	    
    
    <display:column property="libraryName" sortable="false" titleKey="libraryInfo.libraryName"/>
	    
    
    <display:column property="path" sortable="false" titleKey="libraryInfo.path"/>
	    
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOflibraryInfoList(){
			
		if($("#libraryInfoListChkAll").prop('checked') ==true){
			$("input[name='libraryInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='libraryInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['libraryInfo-add']}">
		$('#bt-libraryInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/libraryInfo/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['libraryInfo-delete']}">	
    	$('#bt-libraryInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='libraryInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/libraryInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-libraryInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/libraryInfo/list/${listFlag}/php","post","libraryInfoSearchForm","");
    	});
    	
    	$("#libraryInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

