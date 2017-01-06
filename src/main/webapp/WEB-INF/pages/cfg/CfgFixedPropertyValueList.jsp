
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
		<h2><fmt:message key="cfgFixedPropertyValueList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-cfgFixedPropertyValue-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-cfgFixedPropertyValue-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
	
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="cfgFixedPropertyValueSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-cfgFixedPropertyValue-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		
</div>           



<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<div id="breadcrumb" style="border-top:0px;border-bottom:0px;background-color:#FAFAFA">
		<a href="${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/list/${propertyDefineId}/cfgFixedPropertyValue/0/${listFlag}/php" class="tip-bottom"><fmt:message key="title.a.root"/> </a>
		<c:forEach var="v_cfgFixedPropertyValue" items="${parentsList}">
			<a href="${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/list/${propertyDefineId}/cfgFixedPropertyValue/${v_cfgFixedPropertyValue.propertyValueId}/${listFlag}/php" class="current">${v_cfgFixedPropertyValue.propertyValueId} </a>
		</c:forEach>
		</div>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgFixedPropertyValueList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/list/${propertyDefineId}/cfgFixedPropertyValue/${parentId}/${listFlag}/php" id="cfgFixedPropertyValueList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-delete']}">	
	<display:column title="<input  id='cfgFixedPropertyValueListChkAll' type='checkbox' name='cfgFixedPropertyValueListChkAll' onclick='checkAllOfcfgFixedPropertyValueList()'"> 
      <input type="checkbox" name="cfgFixedPropertyValueListChecklist" value="${cfgFixedPropertyValueList.propertyValueId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-view']}">
		
        <display:column sortable="false"         titleKey="cfgFixedPropertyValue.propertyValueId">
         	<a href="${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/view/${propertyDefineId}/${cfgFixedPropertyValueList.propertyValueId}/cfgFixedPropertyValue/${cfgFixedPropertyValueList.parent}/php">
         		${cfgFixedPropertyValueList.propertyValueId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-view']}">
		<display:column property="propertyValueId" sortable="false" titleKey="cfgFixedPropertyValue.propertyValueId"/>
	</c:if>	
    <display:column property="cfgFixedPropertyDefineId" sortable="false" titleKey="cfgFixedPropertyValue.cfgFixedPropertyDefineId"/>
	    
    
    <display:column property="library" sortable="false" titleKey="cfgFixedPropertyValue.library"/>
	    
    
    <display:column sortProperty="overt" sortable="false" titleKey="cfgFixedPropertyValue.overt">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgFixedPropertyValueList.overt}">checked="checked"</c:if>/>
    </display:column>
	    
    
    <display:column property="propertyName" sortable="false" titleKey="cfgFixedPropertyValue.propertyName"/>
	    
    


	<c:if test="${ showTreeHyperlink=='1'}">
	
	<display:column sortable="false"  titleKey="title.operate">
	<a href="${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/list/${propertyDefineId}/cfgFixedPropertyValue/${cfgFixedPropertyValueList.propertyValueId}/${listFlag}/php">
    	<fmt:message key="button.listChild"/>
    </a>	
    </display:column>
    </c:if>

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgFixedPropertyValueList(){
			
		if($("#cfgFixedPropertyValueListChkAll").prop('checked') ==true){
			$("input[name='cfgFixedPropertyValueListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgFixedPropertyValueListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-add']}">
		$('#bt-cfgFixedPropertyValue-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/add/${propertyDefineId}/cfgFixedPropertyValue/${parentId}/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyValue-delete']}">	
    	$('#bt-cfgFixedPropertyValue-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgFixedPropertyValueListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/delete/${propertyDefineId}/"+selstrs+"/cfgFixedPropertyValue/${parentId}/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgFixedPropertyValue-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyValue/list/${propertyDefineId}/cfgFixedPropertyValue/${parentId}/${listFlag}/php","post","cfgFixedPropertyValueSearchForm","");
    	});
    	
		$("#cfgFixedPropertyValueSearchForm .form-input-init-null").attr("value","");  		
		
		//alert($("#test111").height()+"|"+$("#test222").height());	
	});
</script>

