
	


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
		<h2><fmt:message key="cfgParameterList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgParameter-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-cfgParameter-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgParameter-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-cfgParameter-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="cfgParameterSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-cfgParameter-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgParameterList.title"/></h5>
		
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgParameterList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgParameter/list/${listFlag}/php" id="cfgParameterList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgParameter-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='cfgParameterListChkAll' type='checkbox' name='cfgParameterListChkAll' onclick='checkAllOfcfgParameterList()'"> 
      <input type="checkbox" name="cfgParameterListChecklist" value="${cfgParameterList.parameterId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="cfgParameterListChecklist" value="${cfgParameterList.parameterId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgParameter-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="cfgParameter.parameterId">
         	<a href="${ctx}/lb/${libraryPath}/cfgParameter/view/${cfgParameterList.parameterId}/php">
         		${cfgParameterList.parameterId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgParameter-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="parameterId" sortable="false" titleKey="cfgParameter.parameterId"/>
	</c:if>	
    <display:column sortProperty="canModify" sortable="false" titleKey="cfgParameter.canModify">
        <input type="checkbox" disabled="disabled" <c:if test="${cfgParameterList.canModify}">checked="checked"</c:if>/>
    </display:column>
	    
    
    <display:column property="description" sortable="false" titleKey="cfgParameter.description"/>
	    
    
    <display:column property="name" sortable="false" titleKey="cfgParameter.name"/>
	    
    
    <display:column property="note" sortable="false" titleKey="cfgParameter.note"/>
	    
    
    <display:column property="value" sortable="false" titleKey="cfgParameter.value"/>
	    
    

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgParameterList(){
			
		if($("#cfgParameterListChkAll").prop('checked') ==true){
			$("input[name='cfgParameterListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgParameterListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgParameter-add']}">
		$('#bt-cfgParameter-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgParameter/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgParameter-delete']}">	
    	$('#bt-cfgParameter-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgParameterListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgParameter/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgParameter-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgParameter/list/${listFlag}/php","post","cfgParameterSearchForm","");
    	});
    	
    	$("#cfgParameterSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		if($("#search-div-title").height()<$("#search-div-content").height()){
			$("#search-div-title").css("height",$("#search-div-content").height());
		}
		</c:if>	
	});
</script>

