
	


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
		<h2><fmt:message key="cfgFixedPropertyDefineList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-cfgFixedPropertyDefine-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-cfgFixedPropertyDefine-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="cfgFixedPropertyDefineSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-cfgFixedPropertyDefine-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgFixedPropertyDefineList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgFixedPropertyDefineList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgFixedPropertyDefine/list/${listFlag}/php" id="cfgFixedPropertyDefineList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='cfgFixedPropertyDefineListChkAll' type='checkbox' name='cfgFixedPropertyDefineListChkAll' onclick='checkAllOfcfgFixedPropertyDefineList()'"> 
      <input type="checkbox" name="cfgFixedPropertyDefineListChecklist" value="${cfgFixedPropertyDefineList.propertyId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="cfgFixedPropertyDefineListChecklist" value="${cfgFixedPropertyDefineList.propertyId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="cfgFixedPropertyDefine.propertyId">
         	<a href="${ctx}/lb/${libraryPath}/cfgFixedPropertyDefine/view/${cfgFixedPropertyDefineList.propertyId}/php">
         		${cfgFixedPropertyDefineList.propertyId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="propertyId" sortable="false" titleKey="cfgFixedPropertyDefine.propertyId"/>
	</c:if>	
    <display:column property="propertyCode" sortable="false" titleKey="cfgFixedPropertyDefine.propertyCode"/>
	    
    
    <display:column property="propertyName" sortable="false" titleKey="cfgFixedPropertyDefine.propertyName"/>
	    
    
	<display:column sortable="false" titleKey="cfgFixedPropertyDefine.valueType">
		${allEnumValueInfoMap[cfgFixedPropertyDefineList.valueType]}
	</display:column>
	
	<display:column sortable="false" titleKey="cfgFixedPropertyDefine.roleList">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppRole" 
			value="${cfgFixedPropertyDefineList.roleList}" multiple="true"/>
	</display:column>
	
	
	
	<display:column sortable="false"  titleKey="title.operate">

		<a href='<c:url value="/lb/${libraryPath}/cfgFixedPropertyValue/list/${cfgFixedPropertyDefineList.propertyId}/cfgFixedPropertyValue/0/php"/>' >
	    	<fmt:message key="cfgFixedPropertyValueList.heading"/>
	    </a>	
	</display:column>
</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgFixedPropertyDefineList(){
			
		if($("#cfgFixedPropertyDefineListChkAll").prop('checked') ==true){
			$("input[name='cfgFixedPropertyDefineListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgFixedPropertyDefineListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-add']}">
		$('#bt-cfgFixedPropertyDefine-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyDefine/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgFixedPropertyDefine-delete']}">	
    	$('#bt-cfgFixedPropertyDefine-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgFixedPropertyDefineListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyDefine/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgFixedPropertyDefine-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgFixedPropertyDefine/list/${listFlag}/php","post","cfgFixedPropertyDefineSearchForm","");
    	});
    	
    	$("#cfgFixedPropertyDefineSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		if($("#search-div-title").height()<$("#search-div-content").height()){
			$("#search-div-title").css("height",$("#search-div-content").height());
		}
		</c:if>	
	});
</script>

