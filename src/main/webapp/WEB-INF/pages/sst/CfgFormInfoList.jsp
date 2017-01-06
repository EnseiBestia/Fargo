
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgFormInfoList.heading"/></h2>

<div class="widget-box widget-plain">
<div class="widget-content">
<fmt:message key="cfgFormInfoList.message"/>
</div>

<div id="cfgFormInfoListActions" class="form-actions widget-content ">
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-add']}">
    	<button type="button" class="btn btn-purple" id="bt-cfgFormInfo-add" >
   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
   	</button>		
   	</c:if>
   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-delete']}">
    	<button type="button" class="btn btn-dark-red" id="bt-cfgFormInfo-delete">
   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
   	</c:if>
</div>
</div>

<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgFormInfoList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgFormInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgFormInfo/list" id="cfgFormInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-delete']}">	
	<display:column title="<input  id='cfgFormInfoListChkAll' type='checkbox' name='cfgFormInfoListChkAll' onclick='checkAllOfcfgFormInfoList()'"> 
      <input type="checkbox" name="cfgFormInfoListChecklist" value="${cfgFormInfoList.formId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-view']}">
		
        <display:column sortable="false"         titleKey="cfgFormInfo.formId">
         	<a href="${ctx}/lb/${libraryPath}/cfgFormInfo/view/${cfgFormInfoList.formId}/php">
         		${cfgFormInfoList.formId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-view']}">
		<display:column property="formId" sortable="false" titleKey="cfgFormInfo.formId"/>
	</c:if>	
    <display:column property="formCode" sortable="false" titleKey="cfgFormInfo.formCode"/>
	    
    
    <display:column property="formName" sortable="false" titleKey="cfgFormInfo.formName"/>
	    
    
    <display:column property="modelClassName" sortable="false" titleKey="cfgFormInfo.modelClassName"/>
	    
    
    <display:column property="mongodbDocumentName" sortable="false" titleKey="cfgFormInfo.mongodbDocumentName"/>
	    
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgFormInfoList(){
			
		if($("#cfgFormInfoListChkAll").prop('checked') ==true){
			$("input[name='cfgFormInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgFormInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
		$('#bt-cfgFormInfo-add').click(function(){
    		$(this).attr('disabled',true)
			containerLoadUrlUseAjaxInDiv("cfgFormInfoListActions","${ctx}/lb/${libraryPath}/cfgFormInfo/add");
    	});
    	
    	$('#bt-cfgFormInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgFormInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					containerFormSubmitUseAjaxIndiv('cfgFormInfoListActions','${ctx}/lb/${libraryPath}/cfgFormInfo/delete/'+selstrs+'/php');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});

	});
</script>

