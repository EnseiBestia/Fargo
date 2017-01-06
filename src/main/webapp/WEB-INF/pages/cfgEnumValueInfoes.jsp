
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title></title>
    <meta name="menu" content="CfgEnumValueInfoMenu"/>
</head>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgEnumValueInfoList.heading"/></h2>

<div class="widget-box widget-plain">
<div class="widget-content">
<fmt:message key="cfgEnumValueInfoList.message"/>
</div>

<div id="cfgEnumValueInfoListActions" class="form-actions widget-content ">
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumValueInfo-add']}">
    	<button type="button" class="btn btn-purple" name="add" onclick="formAddWithConfirmOfcfgEnumValueInfoList(this)">
   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
   	</button>		
   	</c:if>
   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumValueInfo-delete']}">
    	<button type="button" class="btn btn-dark-red" name="delete" onclick="formDeleteWithConfirmOfcfgEnumValueInfoList(this)">
   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
   	</c:if>
</div>
</div>

<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgEnumValueInfoList.title"/></h5>
		
	</div>
	<div class="widget-content">
		
<display:table name="cfgEnumValueInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgEnumValueInfo/list" id="cfgEnumValueInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumValueInfo-delete']}">	
	<display:column title="<input  id='cfgEnumValueInfoListChkAll' type='checkbox' name='cfgEnumValueInfoListChkAll' onclick='checkAllOfcfgEnumValueInfoList()'"> 
      <input type="checkbox" name="cfgEnumValueInfoListChecklist" value="${cfgEnumValueInfoList.index}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumValueInfo-view']}">
		<display:column property="index" sortable="false" href="${ctx}/lb/${libraryPath}/cfgEnumValueInfo/view" media="html"
        paramId="index" paramProperty="index" titleKey="cfgEnumValueInfo.index"/>
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgEnumValueInfo-view']}">
		<display:column property="index" sortable="false" titleKey="cfgEnumValueInfo.index"/>
	</c:if>	
    
    <display:column property="code" sortable="false" titleKey="cfgEnumValueInfo.code"/>
    <display:column sortProperty="constantName" sortable="false" titleKey="cfgEnumValueInfo.constantName">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgEnumValueInfoList.constantName}">checked="checked"</c:if>/>
    </display:column>
    <display:column property="value" sortable="false" titleKey="cfgEnumValueInfo.value"/>

</display:table>
</div>
</div>

<script type="text/javascript">
	function formAddWithConfirmOfcfgEnumValueInfoList(button){
		//if(confirmEditMessage()){
			containerLoadUrlUseAjaxInDiv("cfgEnumValueInfoListActions","${ctx}/lb/${libraryPath}/cfgEnumValueInfo/add");
		//}
	}
	function formDeleteWithConfirmOfcfgEnumValueInfoList(button){
		button.disabled=true;
		var selstrs=""
		$("input[name='cfgEnumValueInfoListChecklist']").each(function(){
		     if ($(this).prop("checked")==true) {
		    	selstrs=selstrs+ $(this).attr("value")+",";
		    }
		});
		if(selstrs==""){
			alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
			button.disabled=false;
		}else{
			if(confirmDeleteMessage()){
				containerFormSubmitUseAjaxIndiv('cfgEnumValueInfoListActions','${ctx}/lb/${libraryPath}/cfgEnumValueInfo/delete?indexList='+selstrs);
			}else{
				button.disabled=false;
			}
		}
		
	}
	function checkAllOfcfgEnumValueInfoList(){
			
		if($("#cfgEnumValueInfoListChkAll").prop('checked') ==true){
			$("input[name='cfgEnumValueInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgEnumValueInfoListChecklist']").prop("checked",false);
		}
	}
</script>

