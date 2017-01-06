
	


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
		<h2><fmt:message key="cfgIconInfoList.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-add']}">
			    	<button type="button" class="btn btn-purple" id="bt-cfgIconInfo-add" >
			   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
			   	</button>		
			   	</c:if>
			   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-delete']}">
			    	<button type="button" class="btn btn-dark-red" id="bt-cfgIconInfo-delete">
			   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
			   	</c:if>
			</div>
		</div>
		</div>
	</div>
</c:if>		
		<div class="col-xs-12 col-sm-4" style="position:absolute;bottom:0;right:0;padding-right:0px">
		<form:form commandName="searchValue" id="cfgIconInfoSearchForm">
			<div class="input-group nopadding">
					<form:input path="textValue" id="textValue"  cssClass="form-control" />
					
			      	<span class="input-group-btn">
			        	<button class="btn btn-primary" type="button" id="bt-cfgIconInfo-textSearch"><i class="fa fa-search"></i> <fmt:message key="button.textSearch"/></button>
			      	</span>	  	
			</div>	
		</form:form>
		</div>	
		

</div>


  


<div class="widget-box">
	<div class="widget-title">
		<span class="icon"><i class="fa fa-th"></i></span>
		<h5><fmt:message key="cfgIconInfoList.title"/></h5>
		<appfuse:tablePageSizeSetTag formName="cfgIconInfo" pageSize="${pageSize}"/>
	</div>
	<div class="widget-content" style="overflow:auto;">
		
<display:table name="cfgIconInfoList" class="table table-condensed table-striped table-hover" requestURI="${ctx}/lb/${libraryPath}/cfgIconInfo/list/${listFlag}/php" id="cfgIconInfoList" 
	export="false"  pagesize="${pageSize}" partialList="true" size="${totalSize}">
<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-delete'] && listFlag!='select1'}">	
	<display:column title="<input  id='cfgIconInfoListChkAll' type='checkbox' name='cfgIconInfoListChkAll' onclick='checkAllOfcfgIconInfoList()'"> 
      <input type="checkbox" name="cfgIconInfoListChecklist" value="${cfgIconInfoList.iconId}"/> 
    </display:column>
</c:if>
<c:if test="${listFlag=='select1'}">
	<display:column> 
      <input type="radio" name="cfgIconInfoListChecklist" value="${cfgIconInfoList.iconId}"/> 
    </display:column>
</c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-view'] && listFlag!='select1' && listFlag!='select2'}">
		
        <display:column sortable="false"         titleKey="cfgIconInfo.iconId">
         	<a href="${ctx}/lb/${libraryPath}/cfgIconInfo/view/${cfgIconInfoList.iconId}/php">
         		${cfgIconInfoList.iconId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-view'] || listFlag=='select1' || listFlag=='select2'}">
		<display:column property="iconId" sortable="false" titleKey="cfgIconInfo.iconId"/>
	</c:if>	
    <display:column property="iconCode" sortable="false" titleKey="cfgIconInfo.iconCode"/>
	    
    
    <display:column property="iconFolder" sortable="false" titleKey="cfgIconInfo.iconFolder"/>
	    
    
    <display:column property="iconName" sortable="false" titleKey="cfgIconInfo.iconName"/>
	    
    
    <display:column property="iconSize" sortable="false" titleKey="cfgIconInfo.iconSize"/>
	    
    
	<display:column sortable="false" titleKey="cfgIconInfo.iconType">
		<appfuse:lookupView libraryPath="${libraryPath}" type="1" 
			value="${cfgIconInfoList.iconType}" multiple="false"/>
		
	</display:column>

</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgIconInfoList(){
			
		if($("#cfgIconInfoListChkAll").prop('checked') ==true){
			$("input[name='cfgIconInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgIconInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-add']}">
		$('#bt-cfgIconInfo-add').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgIconInfo/add/php");
    	});
    </c:if>
	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgIconInfo-delete']}">	
    	$('#bt-cfgIconInfo-delete').click(function(){
    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgIconInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgIconInfo/delete/"+selstrs+"/php",'post');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});
    </c:if>	
    	$('#bt-cfgIconInfo-textSearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgIconInfo/list/${listFlag}/php","post","cfgIconInfoSearchForm","");
    	});
    	
    	$("#cfgIconInfoSearchForm .form-input-init-null").attr("value",""); 
    	
    	<c:if test="${listFlag!='select1' && listFlag!='select2'}">
    	 		
		reInitTitleDivHeight("search-div-title","search-div-content");
		</c:if>	
		
		
			
	});
</script>

