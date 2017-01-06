
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>


<div class="row row-list-title-row" >
	<div class="col-xs-12 col-sm-3 nopadding">
		<h2><fmt:message key="cfgFormInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
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
		</div>
	</div>
	
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="cfgFormInfoSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-cfgFormInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		
</div>           



<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<div id="breadcrumb" style="border-top:0px;border-bottom:0px;background-color:#FAFAFA">
		<a href="${ctx}/lb/${libraryPath}/cfgFormInfo/list/cfgFormInfo/0/${listFlag}/php" class="tip-bottom"><fmt:message key="title.a.root"/> </a>
		<c:forEach var="v_cfgFormInfo" items="${parentsList}">
			<a href="${ctx}/lb/${libraryPath}/cfgFormInfo/list/cfgFormInfo/${v_cfgFormInfo.formName}/${listFlag}/php" class="current">${v_cfgFormInfo.formName} </a>
		</c:forEach>
		</div>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgFormInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgFormInfo/list/cfgFormInfo/${parentId}/${listFlag}/php" id="cfgFormInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-delete']}">	
	<display:column title="<input  id='cfgFormInfoListChkAll' type='checkbox' name='cfgFormInfoListChkAll' onclick='checkAllOfcfgFormInfoList()'"> 
      <input type="checkbox" name="cfgFormInfoListChecklist" value="${cfgFormInfoList.formId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-view']}">
		
        <display:column sortable="false"         titleKey="cfgFormInfo.formId">
         	<a href="${ctx}/lb/${libraryPath}/cfgFormInfo/view/${cfgFormInfoList.formId}/cfgFormInfo/${cfgFormInfoList.parent}/php">
         		${cfgFormInfoList.formId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-view']}">
		<display:column property="formId" sortable="false" titleKey="cfgFormInfo.formId"/>
	</c:if>	
    <display:column property="formCode" sortable="false" titleKey="cfgFormInfo.formCode"/>
	    
    
    <display:column property="formName" sortable="false" titleKey="cfgFormInfo.formName"/>
	    
    
    <display:column property="modelClassName" sortable="false" titleKey="cfgFormInfo.modelClassName"/>
	    
    <display:column sortable="false" titleKey="cfgFormInfo.valueChangeDoType">
		${allEnumValueInfoMap[cfgFormInfoList.valueChangeDoType]}
	</display:column>

<display:column sortable="false"  titleKey="title.operate">
	<a href="${ctx}/lb/${libraryPath}/cfgFormInfo/list/cfgFormInfo/${cfgFormInfoList.formId}/${listFlag}/php">
    	<fmt:message key="button.listChild"/>
    </a>	
</display:column>
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
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-add']}">
		$('#bt-cfgFormInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFormInfo/add/cfgFormInfo/${parentId}/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFormInfo-delete']}">	
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
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFormInfo/delete/"+selstrs+"/cfgFormInfo/${parentId}/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgFormInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFormInfo/list/cfgFormInfo/${parentId}/${listFlag}/php","post","cfgFormInfoSearchForm","");
    	});
    	
		$("#cfgFormInfoSearchForm .form-input-init-null").attr("value","");  		
		
		//alert($("#test111").height()+"|"+$("#test222").height());	
	});
</script>

