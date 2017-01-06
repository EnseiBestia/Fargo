	
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp" %>
<head>
    <title><fmt:message key="authAppRoleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key='authAppRoleDetail.heading'/>"/>
</head>
<c:set var="delObject" scope="request"><fmt:message key="authAppRoleList.authAppRole"/></c:set>
<script type="text/javascript">var msgDelConfirm =
   "<fmt:message key="delete.confirm"><fmt:param value="${delObject}"/></fmt:message>";
</script>

<div class="row" >
	<div class="col-xs-12 col-sm-4 nopadding" id="search-div-title">
		<h2><fmt:message key="authAppRolePrivilegeDetail.heading"/></h2>
		
		<div class="widget-box widget-plain">
		<div class="widget-content">
			<div class="input-group nopadding">
				<a href='<c:url value="/lb/${libraryPath}/authAppRole/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                   
			</div>
		</div>
		</div>
	</div>
		

</div>


<div class="widget-box">
	<div class="widget-title">
		<span class="icon">
			<i class="fa fa-align-justify"></i>									
		</span>
		<h5><fmt:message key="authAppRolePrivilegeDetail.message"/></h5>
		
		
	</div>
	<div class="widget-content ">
	
	<form:form commandName="rolePrivilegeSelect" cssClass="form-horizontal"
           id="rolePrivilegeSelect">
           
           
		<table class="table table-bordered table-striped table-hover with-check" style="">
										
						<tbody>
							<appfuse:rolePrivilegeSelectTag roleId="1" value="${authAppRole.privilegeList }" name="selectPrivilegeList"/>
						</tbody>
						</table>
	<div class="form-actions">
		<c:if test="${formEditFlag}">
        <button type="button" class="btn btn-yellow" id="bt-authAppRole-save" >
            <i class="fa fa-check"></i> <fmt:message key="button.save"/>
        </button>
    </c:if>
        <a href='<c:url value="/lb/${libraryPath}/authAppRole/list/mt/php?pageGroupType=back"/>' class="btn btn-dark-green">
            <i class="fa fa-reply"></i> <fmt:message key="button.return"/></a>
                      
    </div>				
	</form:form>
</div>
</div>






<script type="text/javascript">
		
$(document).ready(function() {
	
	
	$('#bt-authAppRole-save').click(function(){
		$(this).attr('disabled',true);
		
		ajaxLoadHtmlInDiv($(this),"${ctx}/lb/${libraryPath}/authAppRole/edit/privilege/${authAppRole.roleId }/submit/php","post","rolePrivilegeSelect");
		
		$(this).attr('disabled',false);
		
	});
			
});
    
</script>
