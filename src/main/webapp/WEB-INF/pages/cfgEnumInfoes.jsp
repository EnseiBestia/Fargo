
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title></title>
    <meta name="menu" content="CfgEnumInfoMenu"/>
</head>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgEnumInfoList.heading"/></h2>

<div class="widget-box widget-plain">
<div class="widget-content">
<fmt:message key="cfgEnumInfoList.message"/>
</div>

<div id="cfgEnumInfoListActions" class="form-actions widget-content ">
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-add']}">
    	<button type="button" class="btn btn-purple" name="add" onclick="formAddWithConfirmOfcfgEnumInfoList(this)">
   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
   	</button>		
   	</c:if>
   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-delete']}">
    	<button type="button" class="btn btn-dark-red" name="delete" onclick="formDeleteWithConfirmOfcfgEnumInfoList(this)">
   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
   	</c:if>
</div>
</div>

<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgEnumInfoList.title"/></h5>
		
	</div>
	<div class="widget-content">
		
<display:table name="cfgEnumInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgEnumInfo/list" id="cfgEnumInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-delete']}">	
	<display:column title="<input  id='cfgEnumInfoListChkAll' type='checkbox' name='cfgEnumInfoListChkAll' onclick='checkAllOfcfgEnumInfoList()'"> 
      <input type="checkbox" name="cfgEnumInfoListChecklist" value="${cfgEnumInfoList.enumId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-view']}">
		<display:column property="enumId" sortable="false" href="${ctx}/lb/${libraryPath}/cfgEnumInfo/view" media="html"
        paramId="enumId" paramProperty="enumId" titleKey="cfgEnumInfo.enumId"/>
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-view']}">
		<display:column property="enumId" sortable="false" titleKey="cfgEnumInfo.enumId"/>
	</c:if>	
    
    <display:column property="constantName" sortable="false" titleKey="cfgEnumInfo.constantName"/>
    <display:column sortProperty="editable" sortable="false" titleKey="cfgEnumInfo.editable">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgEnumInfoList.editable}">checked="checked"</c:if>/>
    </display:column>
    <display:column property="enumCode" sortable="false" titleKey="cfgEnumInfo.enumCode"/>
    <display:column property="enumName" sortable="false" titleKey="cfgEnumInfo.enumName"/>

</display:table>
</div>
</div>

<script type="text/javascript">
	function formAddWithConfirmOfcfgEnumInfoList(button){
		//if(confirmEditMessage()){
			containerLoadUrlUseAjaxInDiv("cfgEnumInfoListActions","${ctx}/lb/${libraryPath}/cfgEnumInfo/add");
		//}
	}
	function formDeleteWithConfirmOfcfgEnumInfoList(button){
		button.disabled=true;
		var selstrs=""
		$("input[name='cfgEnumInfoListChecklist']").each(function(){
		     if ($(this).prop("checked")==true) {
		    	selstrs=selstrs+ $(this).attr("value")+",";
		    }
		});
		if(selstrs==""){
			alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
			button.disabled=false;
		}else{
			if(confirmDeleteMessage()){
				containerFormSubmitUseAjaxIndiv('cfgEnumInfoListActions','${ctx}/lb/${libraryPath}/cfgEnumInfo/delete?enumIdList='+selstrs);
			}else{
				button.disabled=false;
			}
		}
		
	}
	function checkAllOfcfgEnumInfoList(){
			
		if($("#cfgEnumInfoListChkAll").prop('checked') ==true){
			$("input[name='cfgEnumInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgEnumInfoListChecklist']").prop("checked",false);
		}
	}
</script>

