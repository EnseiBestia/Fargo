
	


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
		<h2><fmt:message key="cfgStateMachineDefineList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-cfgStateMachineDefine-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-cfgStateMachineDefine-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="<c:if test="${listFlag!='select1' && listFlag!='select2'}">col-xs-12 col-sm-9 row-list-title-col-search</c:if><c:if test="${listFlag=='select1' || listFlag=='select2'}">col-xs-12 col-sm-12</c:if>" id="search-div-content">
		<form:form commandName="searchValue" id="cfgStateMachineDefineSearchForm" class="form-inline nopadding">
				
				
					
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label"><fmt:message key="cfgStateMachineDefine.enumId"/></div>
		      			
			
					           	<appfuse:lookupSelect2 cssClass="form-control"  libraryPath="${libraryPath}" id="combinedConditionValue_enumId" name="combinedConditionValue['enumId']"
					           		value="${searchValue.combinedConditionValue['enumId']}" formName="CfgEnumInfo" multiple="false" 
					           		type="9" cssStyle="width:200px" placeholder="\u5168\u90E8" allowClear="true" />	            	        

					
				            	
						</div>
		  			</div>
				
				
				
				
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="cfgStateMachineDefine.machineName"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['machineName']}">
		      				<form:input path="combinedConditionValue['machineName']" id="combinedConditionValue_machineName"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['machineName']}">
		      				<form:input path="combinedConditionValue['machineName']" id="combinedConditionValue_machineName"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
				
				
			
			<div class="form-group row-list-form-group" >	
			      <button class="btn btn-primary" type="button" id="bt-cfgStateMachineDefine-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			</div>				
			

		</form:form>
		</div>

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgStateMachineDefineList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgStateMachineDefineList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgStateMachineDefine/list/${listFlag}/php" id="cfgStateMachineDefineList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='cfgStateMachineDefineListChkAll' type='checkbox' name='cfgStateMachineDefineListChkAll' onclick='checkAllOfcfgStateMachineDefineList()'"> 
      <input type="checkbox" name="cfgStateMachineDefineListChecklist" value="${cfgStateMachineDefineList.machineId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="cfgStateMachineDefineListChecklist" value="${cfgStateMachineDefineList.machineId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="cfgStateMachineDefine.machineId">
         	<a href="${ctx}/lb/${libraryPath}/cfgStateMachineDefine/view/${cfgStateMachineDefineList.machineId}/php">
         		${cfgStateMachineDefineList.machineId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="machineId" sortable="false" titleKey="cfgStateMachineDefine.machineId"/>
	</c:if>	

	<display:column sortable="false" titleKey="cfgStateMachineDefine.enumId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="CfgEnumInfo" 
			value="${cfgStateMachineDefineList.enumId}" multiple="false"/>
	</display:column>
	
    <display:column property="fieldName" sortable="false" titleKey="cfgStateMachineDefine.fieldName"/>
	    
    

	<display:column sortable="false" titleKey="cfgStateMachineDefine.formId">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="CfgFormInfo" 
			value="${cfgStateMachineDefineList.formId}" multiple="false"/>
	</display:column>
	
    <display:column property="machineName" sortable="false" titleKey="cfgStateMachineDefine.machineName"/>
	    
    
		<display:column sortable="false"  titleKey="title.operate">
		
		<div class="btn-group">
			<a class="btn btn-info  btn-sm" href='<c:url value="/lb/${libraryPath}/cfgStateMachineValue/list/cfgStateMachineDefine/${cfgStateMachineDefineList.machineId}/mt/php"/>' >
	    	<fmt:message key="cfgStateMachineValueList.heading"/>
	    	</a>
	    	
		</div>
		
			
	</display:column>
</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgStateMachineDefineList(){
			
		if($("#cfgStateMachineDefineListChkAll").prop('checked') ==true){
			$("input[name='cfgStateMachineDefineListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgStateMachineDefineListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-add']}">
		$('#bt-cfgStateMachineDefine-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineDefine/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-delete']}">	
    	$('#bt-cfgStateMachineDefine-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgStateMachineDefineListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineDefine/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgStateMachineDefine-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineDefine/list/${listFlag}/php","post","cfgStateMachineDefineSearchForm","");
    	});
    	
    	$("#cfgStateMachineDefineSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

