
	


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
		<h2><fmt:message key="cfgStateMachineValueList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-cfgStateMachineValue-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-cfgStateMachineValue-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-list']}">
			    	<button type="button" class="btn btn-dark-green" id="bt-cfgStateMachineDefine-list">
			   			<i class="fa fa-reply"></i> <fmt:message key="button.return"/><fmt:message key="cfgStateMachineDefineList.title"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="<c:if test="${listFlag!='select1' && listFlag!='select2'}">col-xs-12 col-sm-9 row-list-title-col-search</c:if><c:if test="${listFlag=='select1' || listFlag=='select2'}">col-xs-12 col-sm-12</c:if>" id="search-div-content">
		<form:form commandName="searchValue" id="cfgStateMachineValueSearchForm" class="form-inline nopadding">
				
				
				
				
				
				
				
				
				
				
				
				
				
				
					<div class="form-group row-list-form-group">
		    			<div class="input-group nopadding">
		      				<div class="input-group-addon row-form-search-label" ><fmt:message key="cfgStateMachineValue.statName"/></div>
		      				<c:if test="${empty searchValue.combinedConditionValue['statName']}">
		      				<form:input path="combinedConditionValue['statName']" id="combinedConditionValue_statName"  cssClass="form-control form-input-init-null row-form-search-input" value=""/>	
		      				</c:if>
		      				<c:if test="${!empty searchValue.combinedConditionValue['statName']}">
		      				<form:input path="combinedConditionValue['statName']" id="combinedConditionValue_statName"  cssClass="form-control"  />	
		      				</c:if>
		      			</div>
		  			</div>
				
				
			
			<div class="form-group row-list-form-group" >	
			      <button class="btn btn-primary" type="button" id="bt-cfgStateMachineValue-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			</div>				
			

		</form:form>
		</div>

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgStateMachineValueList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgStateMachineValueList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgStateMachineValue/list/cfgStateMachineDefine/${machineId}/${listFlag}/php" id="cfgStateMachineValueList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='cfgStateMachineValueListChkAll' type='checkbox' name='cfgStateMachineValueListChkAll' onclick='checkAllOfcfgStateMachineValueList()'"> 
      <input type="checkbox" name="cfgStateMachineValueListChecklist" value="${cfgStateMachineValueList.statId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="cfgStateMachineValueListChecklist" value="${cfgStateMachineValueList.statId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="cfgStateMachineValue.statId">
         	<a href="${ctx}/lb/${libraryPath}/cfgStateMachineValue/view/${cfgStateMachineValueList.statId}/cfgStateMachineDefine/${machineId}/php">
         		${cfgStateMachineValueList.statId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="statId" sortable="false" titleKey="cfgStateMachineValue.statId"/>
	</c:if>	
    <%-- <display:column sortProperty="ifRefresh" sortable="false" titleKey="cfgStateMachineValue.ifRefresh">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgStateMachineValueList.ifRefresh}">checked="checked"</c:if>/>
    </display:column> --%>
	    
    
    <display:column property="machineId" sortable="false" titleKey="cfgStateMachineValue.machineId"/>
	    
    

	<%-- <display:column sortable="false" titleKey="cfgStateMachineValue.roleList">
		<appfuse:lookupView libraryPath="${libraryPath}" type="9" formName="AuthAppRole" 
			value="${cfgStateMachineValueList.roleList}" multiple="true"/>
	</display:column> --%>
	
	<display:column sortable="false" titleKey="cfgStateMachineValue.sourceStat">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${cfgStateMachineValueList.sourceStat}" multiple="false"/>
		
	</display:column>
    <display:column property="statName" sortable="false" titleKey="cfgStateMachineValue.statName"/>
	    
    
	<%-- <display:column sortable="false" titleKey="cfgStateMachineValue.targetStat">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${cfgStateMachineValueList.targetStat}" multiple="true"/>
		
	</display:column> --%>

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgStateMachineValueList(){
			
		if($("#cfgStateMachineValueListChkAll").prop('checked') ==true){
			$("input[name='cfgStateMachineValueListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgStateMachineValueListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-add']}">
		$('#bt-cfgStateMachineValue-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineValue/add/cfgStateMachineDefine/${machineId}/php");
    	});
    </c:if>
    	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineDefine-list']}">
		$('#bt-cfgStateMachineDefine-list').click(function(){
			$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineDefine/list/mt/php?pageGroupType=back");
		});
	</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgStateMachineValue-delete']}">	
    	$('#bt-cfgStateMachineValue-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgStateMachineValueListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineValue/delete/"+selstrs+"/cfgStateMachineDefine/${machineId}/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgStateMachineValue-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgStateMachineValue/list/${listFlag}/cfgStateMachineDefine/${machineId}/php","post","cfgStateMachineValueSearchForm","");
    	});
    	
    	$("#cfgStateMachineValueSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

