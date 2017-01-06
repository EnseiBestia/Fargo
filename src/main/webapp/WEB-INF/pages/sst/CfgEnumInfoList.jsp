
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>

<c:if test="{'$'}{not empty searchError}">
    <div class="alert alert-error fade in">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="{'$'}{searchError}"/>
    </div>
</c:if>

<h2><fmt:message key="cfgEnumInfoList.heading"/></h2>

<div class="widget-box widget-plain">
<div class="widget-content">

<form:form commandName="searchValue" id="cfgFormInfoForm">
           
<div class="row">
	<div class="col-sm-9 col-md-4 col-lg-4 nopadding" id="cfgEnumInfoListActions">
		<div class="input-group nopadding">
			<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-add']}">
		    	<button type="button" class="btn btn-purple" id="bt-cfgEnumInfo-add" >
		   		 	<i class="fa fa-plus"></i> <fmt:message key="button.add"/>
		   	</button>		
		   	</c:if>
		   	<c:if test="${!empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-delete']}">
		    	<button type="button" class="btn btn-dark-red" id="bt-cfgEnumInfo-delete">
		   			<i class="fa fa-trash-o"></i> <fmt:message key="button.delete"/></button>	
		   	</c:if>
		</div>
	</div>
	<div class="col-sm-9 col-md-4 col-lg-4 nopadding">
	</div>
	<div class="col-sm-9 col-md-4 col-lg-4 nopadding">
		<div class="input-group nopadding">
				<form:input path="textValue" id="textValue"  cssClass="form-control" />
				
		      	<span class="input-group-btn">
		        	<button class="btn btn-primary" type="button" id="bt-cfgEnumInfo-textsearch"><i class="fa fa-search"></i> Search</button>
		      	</span>
	      	
		</div>
	</div>
</div>
</form:form>

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
		
        <display:column sortable="false"         titleKey="cfgEnumInfo.enumId">
         	<a href="${ctx}/lb/${libraryPath}/cfgEnumInfo/view/${cfgEnumInfoList.enumId}/php">
         		${cfgEnumInfoList.enumId}</a>
        </display:column>
         
	</c:if>
	<c:if test="${empty currentUserPrivilegeMap.privilegeMap['cfgEnumInfo-view']}">
		<display:column property="enumId" sortable="false" titleKey="cfgEnumInfo.enumId"/>
	</c:if>	
    <display:column property="constantName" sortable="false" titleKey="cfgEnumInfo.constantName"/>
	    
    
    <display:column property="enumCode" sortable="false" titleKey="cfgEnumInfo.enumCode"/>
	    
    
    <display:column property="enumName" sortable="false" titleKey="cfgEnumInfo.enumName"/>
	    
    


</display:table>
</div>
</div>

<script type="text/javascript">
	
	function checkAllOfcfgEnumInfoList(){
			
		if($("#cfgEnumInfoListChkAll").prop('checked') ==true){
			$("input[name='cfgEnumInfoListChecklist']").prop("checked",true);
		}else{
			$("input[name='cfgEnumInfoListChecklist']").prop("checked",false);
		}
	}
	$(document).ready(function() {
		$('#bt-cfgEnumInfo-add').click(function(){
    		$(this).attr('disabled',true)
			containerLoadUrlUseAjaxInDiv("cfgEnumInfoListActions","${ctx}/lb/${libraryPath}/cfgEnumInfo/add");
    	});
		
		$('#bt-cfgEnumInfo-textsearch').click(function(){
    		$(this).attr('disabled',true)
			ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/cfgEnumInfo/list","get","cfgEnumInfoList_textsearch_form","");
    	});
    	$('#bt-cfgEnumInfo-delete').click(function(){

    		$(this).attr('disabled',true);
			var selstrs=""
			$("input[name='cfgEnumInfoListChecklist']").each(function(){
			     if ($(this).prop("checked")==true) {
			    	selstrs=selstrs+ $(this).attr("value")+"-";
			    }
			});
			if(selstrs==""){
				alertMessageOfUnicorn("<fmt:message key='message.selectnull.ondelete'/>");
				
				
				$(this).attr('disabled',false);
			}else{
				if(confirmDeleteMessage()){
					containerFormSubmitUseAjaxIndiv('cfgEnumInfoListActions','${ctx}/lb/${libraryPath}/cfgEnumInfo/delete/'+selstrs+'/php');
				}else{
					$(this).attr('disabled',false);
				}
			}
    	});

	});
</script>

